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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_41 [[user(locn5), flat]];
    float4 m_39 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _441 = float2(_79, _77);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_441, float2(0.0), isnan(_441))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_441, float2(0.0), isnan(_441))).w;
    float _83 = in.m_39.w;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_41.x;
    float _91 = in.m_39.x;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_39.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_37.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_37.z;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = _75 * _87;
    float _117 = -_89;
    float _119 = _117 + 1.0;
    float _121 = _75 * _95;
    float _123 = _75 * _101;
    float _125 = 1.0 / _115;
    float _127 = fma(_119, _119, 0.4000000059604644775390625);
    float _129 = _75 * _107;
    float _131 = _121 * _125;
    float _133 = _123 * _125;
    float2 _519 = float2(_131, _133);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_519, float2(0.0), isnan(_519))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_519, float2(0.0), isnan(_519))).x;
    float _137 = _81 * (-0.300000011920928955078125);
    float _139 = fma(_137, _127, _129);
    float _141 = _75 * _113;
    float2 _537 = float2(_141, _139);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_537, float2(0.0), isnan(_537))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_537, float2(0.0), isnan(_537))).w;
    float _145 = in.m_43.w;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_39.z;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_45.w;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _165 = _75 * _149;
    float _167 = _75 * _155;
    float _169 = _167 * _125;
    float _171 = abs(_165);
    float _173 = log2(_171);
    float _175 = in.m_47.w;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = _75 * _161;
    float _183 = in.m_49.x;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _191 = fma(_169, (*spvDescriptorSet0.fp_c8)._m0[30].w, _189);
    float _193 = _181 + (-1.0);
    float _195 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _197 = fma(_135, (*spvDescriptorSet0.fp_c8)._m0[30].w, _195);
    float _199 = 1.0 / _191;
    float _201 = _173 * 0.5;
    float _203 = 1.0 / _197;
    float _205 = exp2(_201);
    float _207 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _209 = _199 * _207;
    float _211 = _75 * _187;
    float _213 = in.m_45.x;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_47.z;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_45.y;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_45.z;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = fma(_143, _205, _193);
    float _239 = _237 * _163;
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _245 = fma(_241, -2.0, 3.0);
    float _247 = _241 * _241;
    float _249 = _245 * _247;
    float _251 = _75 * _179;
    float _253 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _255 = -_209;
    float _257 = fma(_203, _253, _255);
    float _259 = _251 * _249;
    float _261 = _257 * _243;
    float _263 = precise::clamp(_261, 0.0, 1.0);
    float _265 = 0.0 + _259;
    float _267 = precise::clamp(_265, 0.0, 1.0);
    float _269 = _267 * _263;
    float _271 = _269 * _211;
    bool _275 = _271 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _277 = isnan(_271);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _283 = _279 || _281;
    float _285 = in.m_51.y;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = _271;
    if (!_283)
    {
        discard_fragment();
    }
    float _293 = in.m_47.y;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = in.m_47.x;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = _75 * _229;
    float _307 = _75 * _289;
    float _309 = 0.0 + _307;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = fma(_311, -2.0, 3.0);
    float _315 = _311 * _311;
    float _317 = _313 * _315;
    float _319 = _75 * _303;
    float _321 = fma(_317, -0.300000011920928955078125, 0.300000011920928955078125);
    float _323 = _75 * _223;
    float _325 = _317 + _321;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = _75 * _297;
    float _331 = fma(_327, -2.0, 3.0);
    float _333 = _327 * _327;
    float _335 = _75 * _217;
    float _337 = _75 * _235;
    float _339 = -_329;
    float _341 = _339 + _305;
    float _343 = _331 * _333;
    float _345 = -_319;
    float _347 = _345 + _335;
    float _349 = -_323;
    float _351 = _349 + _337;
    float _353 = fma(_343, _341, _329);
    float _355 = fma(_343, _347, _319);
    float _357 = fma(_343, _351, _323);
    float _359 = _347;
    if (!_283)
    {
        out.m_54.x = _355;
        out.m_54.y = _353;
        out.m_54.z = _357;
        out.m_54.w = _259;
        return out;
    }
    float _361 = _353 * 0.715200006961822509765625;
    float _363 = fma(_355, 0.2125999927520751953125, _361);
    float _365 = fma(_357, 0.072200000286102294921875, _363);
    bool _367 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _369 = 1.0 / _365;
    float _371 = 0.0 + _271;
    float _373 = precise::clamp(_371, 0.0, 1.0);
    float _375 = _373;
    if (_367)
    {
        float _377 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _379 = _209 + _377;
        _359 = _379;
    }
    float _381 = _359;
    float _383 = _369 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _385 = precise::clamp(_383, 0.0, 1.0);
    if (_367)
    {
        float _387 = _381 * 8.0;
        float _389 = precise::clamp(_387, 0.0, 1.0);
        _291 = _389;
    }
    float _391 = _291;
    float _393 = fma(_385, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_367)
    {
        float _395 = _373 * _391;
        _375 = _395;
    }
    float _397 = _375;
    float _399 = _355 * _393;
    float _401 = _353 * _393;
    float _403 = _357 * _393;
    float _405 = 0.0 + _397;
    float _407 = precise::clamp(_405, 0.0, 1.0);
    out.m_54.x = _399;
    out.m_54.y = _401;
    out.m_54.z = _403;
    out.m_54.w = _407;
    return out;
}

