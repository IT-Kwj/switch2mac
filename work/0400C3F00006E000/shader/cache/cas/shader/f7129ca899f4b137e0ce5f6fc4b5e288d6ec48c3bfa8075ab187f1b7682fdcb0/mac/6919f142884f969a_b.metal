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
    float _97 = abs(_72);
    float _99 = log2(_97);
    float _101 = abs(_76);
    float _103 = log2(_101);
    float _105 = abs(_74);
    float _107 = log2(_105);
    float _109 = _99 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _111 = exp2(_109);
    float _113 = _103 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _115 = _107 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _117 = exp2(_113);
    float _119 = exp2(_115);
    float _121 = _81 + _111;
    float _123 = _121 * _95;
    float _125 = _85 + _117;
    float _127 = fma(_123, 6.19999980926513671875, 1.7000000476837158203125);
    float _129 = _125 * _95;
    float _131 = fma(_123, _127, 0.0599999986588954925537109375);
    float _133 = _83 + _119;
    float _135 = fma(_129, 6.19999980926513671875, 1.7000000476837158203125);
    float _137 = 1.0 / _131;
    float _139 = _133 * _95;
    float _141 = fma(_129, _135, 0.0599999986588954925537109375);
    float _143 = fma(_123, 6.19999980926513671875, 0.5);
    float _145 = fma(_139, 6.19999980926513671875, 1.7000000476837158203125);
    float _147 = 1.0 / _141;
    float _149 = fma(_139, _145, 0.0599999986588954925537109375);
    float _151 = _123 * _143;
    float _153 = fma(_129, 6.19999980926513671875, 0.5);
    float _155 = 1.0 / _149;
    float _157 = _151 * _137;
    float _159 = fma(_139, 6.19999980926513671875, 0.5);
    float _161 = _129 * _153;
    float _163 = _139 * _159;
    float _165 = _161 * _147;
    float _167 = abs(_157);
    float _169 = log2(_167);
    float _171 = _163 * _155;
    float _173 = abs(_165);
    float _175 = log2(_173);
    float _177 = abs(_171);
    float _179 = log2(_177);
    float _181 = _169 * 2.2000000476837158203125;
    float _183 = _175 * 2.2000000476837158203125;
    float _185 = exp2(_181);
    float _187 = _179 * 2.2000000476837158203125;
    float _189 = exp2(_183);
    float _191 = exp2(_187);
    float _193 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _195 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _197 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _620 = float3(_193, _197, _195);
    float3 _199 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_620, float3(0.0), isnan(_620))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_620, float3(0.0), isnan(_620))).xyz;
    float _201 = _199.x;
    float _203 = _199.y;
    float _205 = _199.z;
    float _207 = _139 * 0.586600005626678466796875;
    float _209 = fma(_123, 0.29890000820159912109375, _207);
    float _211 = fma(_129, 0.1143999993801116943359375, _209);
    float _213 = _211 * (-1.44269502162933349609375);
    float _215 = exp2(_213);
    float _217 = -_215;
    float _219 = _217 + 1.0;
    bool _223 = _219 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _225 = isnan(_219);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _231 = _227 || _229;
    float _233 = _129;
    float _235 = _123;
    float _237 = _185;
    float _239 = _189;
    float _241 = (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _243 = _193;
    if (_231)
    {
        _233 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _245 = _233;
    float _247 = _245;
    if (_231)
    {
        float _249 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _251 = _219 + _249;
        _235 = _251;
    }
    float _253 = _235;
    float _255 = _253;
    if (_231)
    {
        float _257 = -_245;
        float _259 = _257 + 1.00000095367431640625;
        _237 = _259;
    }
    float _261 = _237;
    float _263 = 6.19999980926513671875;
    if (_231)
    {
        float _265 = 1.0 / _261;
        _263 = _265;
    }
    float _267 = _263;
    if (_231)
    {
        float _269 = _253 * _267;
        _239 = _269;
    }
    float _271 = _239;
    float _273 = _271;
    if (_231)
    {
        float _275 = -_245;
        float _277 = _275 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _255 = _277;
    }
    float _279 = _255;
    float _281 = _279;
    if (_231)
    {
        float _283 = -_271;
        float _285 = _283 + 1.0;
        _241 = _285;
    }
    float _287 = _241;
    if (_231)
    {
        float _289 = _279 * _267;
        _247 = _289;
    }
    float _291 = _247;
    float _293 = _291;
    if (_231)
    {
        float _295 = _291 + (-1.0);
        _281 = _295;
    }
    float _297 = _281;
    float _299 = _287;
    float _301 = _297;
    if (_231)
    {
        float _303 = abs(_287);
        float _305 = log2(_303);
        _299 = _305;
    }
    float _307 = _299;
    if (_231)
    {
        float _309 = _291 * _271;
        _273 = _309;
    }
    float _311 = _273;
    float _313 = _311;
    if (!_231)
    {
        _293 = _219;
    }
    float _315 = _293;
    float _317 = _315;
    if (_231)
    {
        float _319 = _307 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _243 = _319;
    }
    float _321 = _243;
    float _323 = _197;
    if (_231)
    {
        float _325 = exp2(_321);
        _323 = _325;
    }
    float _327 = _323;
    if (_231)
    {
        float _329 = fma(_297, _327, 1.0);
        _301 = _329;
    }
    float _331 = _301;
    float _333 = _331;
    if (_231)
    {
        float _335 = 1.0 / _331;
        _333 = _335;
    }
    float _337 = _333;
    if (_231)
    {
        float _339 = _311 * _337;
        _313 = _339;
    }
    float _341 = _313;
    if (_231)
    {
        float _343 = fma(_261, _341, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _317 = _343;
    }
    float _345 = _317;
    float _347 = -_219;
    float _349 = _347 + _345;
    float _351 = _349 + 1.0;
    float _353 = abs(_351);
    float _355 = log2(_353);
    float _357 = _203 * 0.586600005626678466796875;
    float _359 = fma(_201, 0.29890000820159912109375, _357);
    float _361 = _355 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _363 = fma(_205, 0.1143999993801116943359375, _359);
    float _365 = exp2(_361);
    float _367 = spvFAdd(_363, 9.9999999747524270787835121154785e-07);
    float _369 = 1.0 / _367;
    float _371 = fma(_201, _369, -1.0);
    float _373 = fma(_203, _369, -1.0);
    float _375 = fma(_205, _369, -1.0);
    float _377 = fma(_365, _371, 1.0);
    float _379 = fma(_365, _373, 1.0);
    float _381 = fma(_365, _375, 1.0);
    float _383 = _377 * _345;
    float _385 = _379 * _345;
    float _387 = _381 * _345;
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

