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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    sampler fp_t_tcb_10Smplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_43 [[user(locn4), flat]];
    float4 m_39 [[user(locn5), flat]];
    float4 m_41 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _59;
    float _81 = _79 * _65;
    float _83 = _79 * _71;
    float _85 = _79 * _77;
    float _87 = 1.0 / _81;
    float _89 = _83 * _87;
    float _91 = _85 * _87;
    float2 _437 = float2(_89, _91);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_437, float2(0.0), isnan(_437))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_437, float2(0.0), isnan(_437))).x;
    float _95 = in.m_39.y;
    float _97 = in.m_41.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = (*spvDescriptorSet0.fp_c10)._m0[5].x * (*spvDescriptorSet0.fp_c10)._m0[5].x;
    float _105 = in.m_41.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = fma((*spvDescriptorSet0.fp_c10)._m0[4].x, (*spvDescriptorSet0.fp_c10)._m0[4].x, _103);
    float _113 = in.m_39.x;
    float _115 = fma((*spvDescriptorSet0.fp_c10)._m0[6].x, (*spvDescriptorSet0.fp_c10)._m0[6].x, _111);
    float _117 = (*spvDescriptorSet0.fp_c10)._m0[5].y * (*spvDescriptorSet0.fp_c10)._m0[5].y;
    float _119 = in.m_39.z;
    float _121 = (*spvDescriptorSet0.fp_c10)._m0[5].z * (*spvDescriptorSet0.fp_c10)._m0[5].z;
    float _123 = sqrt(_115);
    float _125 = fma((*spvDescriptorSet0.fp_c10)._m0[4].y, (*spvDescriptorSet0.fp_c10)._m0[4].y, _117);
    float _127 = in.m_37.z;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = fma((*spvDescriptorSet0.fp_c10)._m0[4].z, (*spvDescriptorSet0.fp_c10)._m0[4].z, _121);
    float _135 = in.m_41.z;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = fma((*spvDescriptorSet0.fp_c10)._m0[6].y, (*spvDescriptorSet0.fp_c10)._m0[6].y, _125);
    float _143 = in.m_43.y;
    float _145 = in.m_43.x;
    float _147 = sqrt(_141);
    float _149 = fma((*spvDescriptorSet0.fp_c10)._m0[6].z, (*spvDescriptorSet0.fp_c10)._m0[6].z, _133);
    float _151 = sqrt(_149);
    float _153 = _113 * _123;
    float _155 = _95 * _147;
    float _157 = in.m_43.z;
    float _159 = _155 * _155;
    float _161 = _119 * _151;
    float _163 = fma(_153, _153, _159);
    float _165 = _79 * _101;
    float _167 = fma(_161, _161, _163);
    float _169 = _143 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _171 = _79 * _109;
    float _173 = _165 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _175 = fma(_145, (*spvDescriptorSet0.fp_c8)._m0[1].x, _169);
    float _177 = sqrt(_167);
    float _179 = fma(_171, (*spvDescriptorSet0.fp_c8)._m0[1].x, _173);
    float _181 = _79 * _131;
    float _183 = _79 * _139;
    float _185 = in.m_45.x;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = _181 * _87;
    float _193 = fma(_183, (*spvDescriptorSet0.fp_c8)._m0[1].z, _179);
    float _195 = in.m_47.w;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _203 = fma(_191, (*spvDescriptorSet0.fp_c8)._m0[30].w, _201);
    float _205 = fma(_157, (*spvDescriptorSet0.fp_c8)._m0[1].z, _175);
    float _207 = _177 + _177;
    float _209 = 1.0 / _203;
    float _211 = -_205;
    float _213 = _193 + _211;
    float _215 = _213 + _177;
    float _217 = 1.0 / _207;
    float _219 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _221 = _209 * _219;
    float _223 = _215 * _217;
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = _225 * _225;
    float _229 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _231 = fma(_93, (*spvDescriptorSet0.fp_c8)._m0[30].w, _229);
    float _233 = fma(_227, (*spvDescriptorSet0.fp_c9)._m0[194].z, _221);
    float _235 = _79 * _199;
    float _237 = _79 * _189;
    float _239 = 1.0 / _231;
    float _241 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _243 = -_233;
    float _245 = fma(_239, _241, _243);
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = _235 * _247;
    float _251 = precise::clamp(_249, 0.0, 1.0);
    float _253 = _251 * _237;
    bool _257 = _253 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _259 = isnan(_253);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _265 = _261 || _263;
    float _267 = in.m_49.x;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = in.m_49.y;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = _221;
    if (!_265)
    {
        discard_fragment();
    }
    float _281 = _79 * _271;
    float _283 = _79 * _277;
    float2 _750 = float2(_281, _283);
    float3 _287 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_750, float2(0.0), isnan(_750))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_750, float2(0.0), isnan(_750))).xyz;
    float _289 = _287.x;
    float _291 = _287.y;
    float _293 = _287.z;
    float _295 = in.m_47.y;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_47.z;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_47.x;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = _79 * _299;
    float _315 = _79 * _305;
    float _317 = _79 * _311;
    float _319 = _289 + (-1.0);
    float _321 = _291 + (-1.0);
    float _323 = _293 + (-1.0);
    float _325 = fma(_319, (*spvDescriptorSet0.fp_c9)._m0[194].w, 1.0);
    float _327 = fma(_321, (*spvDescriptorSet0.fp_c9)._m0[194].w, 1.0);
    float _329 = fma(_323, (*spvDescriptorSet0.fp_c9)._m0[194].w, 1.0);
    float _331 = _317 * _325;
    float _333 = _313 * _327;
    float _335 = _315 * _329;
    if (!_265)
    {
        out.m_52.x = _331;
        out.m_52.y = _333;
        out.m_52.z = _335;
        out.m_52.w = _251;
        return out;
    }
    float _337 = _333 * 0.715200006961822509765625;
    float _339 = fma(_331, 0.2125999927520751953125, _337);
    float _341 = fma(_335, 0.072200000286102294921875, _339);
    bool _343 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _345 = 1.0 / _341;
    float _347 = 0.0 + _253;
    float _349 = precise::clamp(_347, 0.0, 1.0);
    float _351 = _349;
    if (_343)
    {
        float _353 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _355 = _221 + _353;
        _279 = _355;
    }
    float _357 = _279;
    float _359 = _345 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _361 = precise::clamp(_359, 0.0, 1.0);
    float _363 = _357;
    if (_343)
    {
        float _365 = _357 * 8.0;
        float _367 = precise::clamp(_365, 0.0, 1.0);
        _363 = _367;
    }
    float _369 = _363;
    float _371 = fma(_361, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_343)
    {
        float _373 = _349 * _369;
        _351 = _373;
    }
    float _375 = _351;
    float _377 = _331 * _371;
    float _379 = _333 * _371;
    float _381 = _335 * _371;
    float _383 = 0.0 + _375;
    float _385 = precise::clamp(_383, 0.0, 1.0);
    out.m_52.x = _377;
    out.m_52.y = _379;
    out.m_52.z = _381;
    out.m_52.w = _385;
    return out;
}

