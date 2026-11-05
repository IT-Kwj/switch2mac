#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture3d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_36.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_36.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _433 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_433, float2(0.0), isnan(_433))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_433, float2(0.0), isnan(_433))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _450 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_450, float2(0.0), isnan(_450))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_450, float2(0.0), isnan(_450))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = in.m_38.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _62 * _93;
    float _97 = _83 + _74;
    float _99 = _81 + _72;
    float _101 = _85 + _76;
    float _103 = _97 * _95;
    float _105 = _99 * _95;
    float _107 = _101 * _95;
    float _109 = _103 * 0.586600005626678466796875;
    float _111 = _105 * (-1.44269502162933349609375);
    float _113 = _107 * (-1.44269502162933349609375);
    float _115 = _103 * (-1.44269502162933349609375);
    float _117 = fma(_105, 0.29890000820159912109375, _109);
    float _119 = exp2(_111);
    float _121 = fma(_107, 0.1143999993801116943359375, _117);
    float _123 = _121 * (-1.44269502162933349609375);
    float _125 = 1.0 / _121;
    float _127 = exp2(_123);
    float _129 = -_119;
    float _131 = _129 + 1.0;
    float _133 = exp2(_113);
    float _135 = exp2(_115);
    float _137 = -_127;
    float _139 = _137 + 1.0;
    float _141 = _139 * _125;
    float _143 = _107 * _141;
    float _145 = _105 * _141;
    float _147 = _103 * _141;
    float _149 = -_133;
    float _151 = _149 + 1.0;
    float _153 = _139 * _139;
    float _155 = -_145;
    float _157 = _131 + _155;
    float _159 = -_135;
    float _161 = _159 + 1.0;
    float _163 = -_143;
    float _165 = _151 + _163;
    float _167 = fma(_153, _157, _145);
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = -_147;
    float _173 = _161 + _171;
    float _175 = fma(_153, _165, _143);
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _181 = fma(_153, _173, _147);
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _187 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _610 = float3(_179, _187, _185);
    float3 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_610, float3(0.0), isnan(_610))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_610, float3(0.0), isnan(_610))).xyz;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = _189.z;
    bool _199 = _139 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _201 = isnan(_139);
    bool _203 = _199 || _201;
    bool _205 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _207 = _203 || _205;
    float _209 = _157;
    float _211 = _153;
    float _213 = _147;
    float _215 = _133;
    float _217 = (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _219 = _145;
    float _221 = _141;
    if (_207)
    {
        _209 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _223 = _209;
    float _225 = _223;
    if (_207)
    {
        float _227 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _229 = _139 + _227;
        _211 = _229;
    }
    float _231 = _211;
    float _233 = _231;
    if (_207)
    {
        float _235 = -_223;
        float _237 = _235 + 1.00000095367431640625;
        _213 = _237;
    }
    float _239 = _213;
    float _241 = _143;
    if (_207)
    {
        float _243 = 1.0 / _239;
        _241 = _243;
    }
    float _245 = _241;
    if (_207)
    {
        float _247 = _231 * _245;
        _215 = _247;
    }
    float _249 = _215;
    float _251 = _249;
    if (_207)
    {
        float _253 = -_223;
        float _255 = _253 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _233 = _255;
    }
    float _257 = _233;
    float _259 = _257;
    if (_207)
    {
        float _261 = -_249;
        float _263 = _261 + 1.0;
        _217 = _263;
    }
    float _265 = _217;
    if (_207)
    {
        float _267 = _257 * _245;
        _259 = _267;
    }
    float _269 = _259;
    float _271 = _269;
    if (_207)
    {
        float _273 = _269 + (-1.0);
        _225 = _273;
    }
    float _275 = _225;
    float _277 = _265;
    float _279 = _275;
    if (_207)
    {
        float _281 = abs(_265);
        float _283 = log2(_281);
        _277 = _283;
    }
    float _285 = _277;
    if (_207)
    {
        float _287 = _269 * _249;
        _251 = _287;
    }
    float _289 = _251;
    if (!_207)
    {
        _271 = _139;
    }
    float _291 = _271;
    float _293 = _291;
    if (_207)
    {
        float _295 = _285 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _219 = _295;
    }
    float _297 = _219;
    float _299 = _297;
    if (_207)
    {
        float _301 = exp2(_297);
        _299 = _301;
    }
    float _303 = _299;
    if (_207)
    {
        float _305 = fma(_275, _303, 1.0);
        _279 = _305;
    }
    float _307 = _279;
    float _309 = _307;
    if (_207)
    {
        float _311 = 1.0 / _307;
        _309 = _311;
    }
    float _313 = _309;
    if (_207)
    {
        float _315 = _289 * _313;
        _221 = _315;
    }
    float _317 = _221;
    if (_207)
    {
        float _319 = fma(_239, _317, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _293 = _319;
    }
    float _321 = _293;
    float _323 = -_139;
    float _325 = _323 + _321;
    float _327 = _325 + 1.0;
    float _329 = abs(_327);
    float _331 = log2(_329);
    float _333 = abs(_193);
    float _335 = log2(_333);
    float _337 = abs(_191);
    float _339 = log2(_337);
    float _341 = abs(_195);
    float _343 = log2(_341);
    float _345 = _335 * 0.4545454680919647216796875;
    float _347 = _331 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _349 = _339 * 0.4545454680919647216796875;
    float _351 = exp2(_345);
    float _353 = _343 * 0.4545454680919647216796875;
    float _355 = exp2(_349);
    float _357 = exp2(_353);
    float _359 = _351 * 0.586600005626678466796875;
    float _361 = fma(_355, 0.29890000820159912109375, _359);
    float _363 = exp2(_347);
    float _365 = fma(_357, 0.1143999993801116943359375, _361);
    float _367 = spvFAdd(_365, 9.9999999747524270787835121154785e-07);
    float _369 = 1.0 / _367;
    float _371 = fma(_355, _369, -1.0);
    float _373 = fma(_351, _369, -1.0);
    float _375 = fma(_357, _369, -1.0);
    float _377 = fma(_363, _371, 1.0);
    float _379 = fma(_363, _373, 1.0);
    float _381 = fma(_363, _375, 1.0);
    float _383 = _377 * _321;
    float _385 = _379 * _321;
    float _387 = _381 * _321;
    float _389 = precise::max(0.0, _383);
    float _391 = precise::max(0.0, _385);
    float _393 = precise::max(0.0, _387);
    float _395 = precise::min(_389, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _397 = precise::min(_391, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _399 = precise::min(_393, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_41.x = _395;
    out.m_41.y = _397;
    out.m_41.z = _399;
    out.m_41.w = _87;
    return out;
}

