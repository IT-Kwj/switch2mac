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
    float2 _409 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_409, float2(0.0), isnan(_409))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_409, float2(0.0), isnan(_409))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _426 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_426, float2(0.0), isnan(_426))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_426, float2(0.0), isnan(_426))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = in.m_38.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _62 * _93;
    float _97 = _81 + _72;
    float _99 = _85 + _76;
    float _101 = _83 + _74;
    float _103 = _97 * _95;
    float _105 = _99 * _95;
    float _107 = _101 * _95;
    float _109 = fma(_103, 6.19999980926513671875, 1.7000000476837158203125);
    float _111 = fma(_105, 6.19999980926513671875, 1.7000000476837158203125);
    float _113 = fma(_107, 6.19999980926513671875, 1.7000000476837158203125);
    float _115 = fma(_103, 6.19999980926513671875, 0.5);
    float _117 = fma(_103, _109, 0.0599999986588954925537109375);
    float _119 = fma(_105, _111, 0.0599999986588954925537109375);
    float _121 = fma(_107, _113, 0.0599999986588954925537109375);
    float _123 = _103 * _115;
    float _125 = 1.0 / _117;
    float _127 = fma(_105, 6.19999980926513671875, 0.5);
    float _129 = _105 * _127;
    float _131 = 1.0 / _119;
    float _133 = 1.0 / _121;
    float _135 = _123 * _125;
    float _137 = fma(_107, 6.19999980926513671875, 0.5);
    float _139 = _107 * _137;
    float _141 = _129 * _131;
    float _143 = abs(_135);
    float _145 = log2(_143);
    float _147 = _139 * _133;
    float _149 = abs(_141);
    float _151 = log2(_149);
    float _153 = abs(_147);
    float _155 = log2(_153);
    float _157 = _145 * 2.2000000476837158203125;
    float _159 = _151 * 2.2000000476837158203125;
    float _161 = exp2(_157);
    float _163 = _155 * 2.2000000476837158203125;
    float _165 = exp2(_159);
    float _167 = exp2(_163);
    float _169 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _171 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _173 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _566 = float3(_169, _173, _171);
    float3 _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_566, float3(0.0), isnan(_566))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_566, float3(0.0), isnan(_566))).xyz;
    float _177 = _175.x;
    float _179 = _175.y;
    float _181 = _175.z;
    float _183 = _107 * 0.586600005626678466796875;
    float _185 = fma(_103, 0.29890000820159912109375, _183);
    float _187 = fma(_105, 0.1143999993801116943359375, _185);
    float _189 = _187 * (-1.44269502162933349609375);
    float _191 = exp2(_189);
    float _193 = -_191;
    float _195 = _193 + 1.0;
    bool _199 = _195 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _201 = isnan(_195);
    bool _203 = _199 || _201;
    bool _205 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _207 = _203 || _205;
    float _209 = 6.19999980926513671875;
    float _211 = _183;
    float _213 = _165;
    float _215 = _147;
    float _217 = _105;
    float _219 = _191;
    float _221 = _131;
    if (_207)
    {
        _209 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _223 = _209;
    if (_207)
    {
        float _225 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _227 = _195 + _225;
        _211 = _227;
    }
    float _229 = _211;
    float _231 = _229;
    if (_207)
    {
        float _233 = -_223;
        float _235 = _233 + 1.00000095367431640625;
        _213 = _235;
    }
    float _237 = _213;
    float _239 = _133;
    if (_207)
    {
        float _241 = 1.0 / _237;
        _239 = _241;
    }
    float _243 = _239;
    if (_207)
    {
        float _245 = _229 * _243;
        _215 = _245;
    }
    float _247 = _215;
    float _249 = _247;
    if (_207)
    {
        float _251 = -_223;
        float _253 = _251 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _231 = _253;
    }
    float _255 = _231;
    float _257 = _255;
    if (_207)
    {
        float _259 = -_247;
        float _261 = _259 + 1.0;
        _217 = _261;
    }
    float _263 = _217;
    if (_207)
    {
        float _265 = _255 * _243;
        _257 = _265;
    }
    float _267 = _257;
    float _269 = _267;
    if (_207)
    {
        float _271 = _267 + (-1.0);
        _219 = _271;
    }
    float _273 = _219;
    float _275 = _263;
    float _277 = _273;
    if (_207)
    {
        float _279 = abs(_263);
        float _281 = log2(_279);
        _275 = _281;
    }
    float _283 = _275;
    if (_207)
    {
        float _285 = _267 * _247;
        _249 = _285;
    }
    float _287 = _249;
    float _289 = _287;
    if (!_207)
    {
        _269 = _195;
    }
    float _291 = _269;
    float _293 = _291;
    if (_207)
    {
        float _295 = _283 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _221 = _295;
    }
    float _297 = _221;
    float _299 = _297;
    if (_207)
    {
        float _301 = exp2(_297);
        _299 = _301;
    }
    float _303 = _299;
    if (_207)
    {
        float _305 = fma(_273, _303, 1.0);
        _277 = _305;
    }
    float _307 = _277;
    float _309 = _223;
    if (_207)
    {
        float _311 = 1.0 / _307;
        _309 = _311;
    }
    float _313 = _309;
    if (_207)
    {
        float _315 = _287 * _313;
        _289 = _315;
    }
    float _317 = _289;
    if (_207)
    {
        float _319 = fma(_237, _317, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _293 = _319;
    }
    float _321 = _293;
    float _323 = -_195;
    float _325 = _323 + _321;
    float _327 = _325 + 1.0;
    float _329 = abs(_327);
    float _331 = log2(_329);
    float _333 = _331 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _335 = exp2(_333);
    float _337 = _179 * 0.586600005626678466796875;
    float _339 = fma(_177, 0.29890000820159912109375, _337);
    float _341 = fma(_181, 0.1143999993801116943359375, _339);
    float _343 = spvFAdd(_341, 9.9999999747524270787835121154785e-07);
    float _345 = 1.0 / _343;
    float _347 = fma(_177, _345, -1.0);
    float _349 = fma(_179, _345, -1.0);
    float _351 = fma(_181, _345, -1.0);
    float _353 = fma(_335, _347, 1.0);
    float _355 = fma(_335, _349, 1.0);
    float _357 = fma(_335, _351, 1.0);
    float _359 = _353 * _321;
    float _361 = _355 * _321;
    float _363 = _357 * _321;
    float _365 = precise::max(0.0, _359);
    float _367 = precise::max(0.0, _361);
    float _369 = precise::max(0.0, _363);
    float _371 = precise::min(_365, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _373 = precise::min(_367, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _375 = precise::min(_369, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_41.x = _371;
    out.m_41.y = _373;
    out.m_41.z = _375;
    out.m_41.w = _87;
    return out;
}

