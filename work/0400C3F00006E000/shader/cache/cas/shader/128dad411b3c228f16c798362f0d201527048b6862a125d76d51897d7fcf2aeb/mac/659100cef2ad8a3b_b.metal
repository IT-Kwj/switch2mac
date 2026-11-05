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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_34 [[id(5)]];
    sampler fp_t_tcb_34Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_34Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_58 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_41 [[user(locn5), flat]];
    float4 m_51 [[user(locn6)]];
    float4 m_43 [[user(locn7)]];
    float4 m_56 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_39.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_39.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _65;
    float _81 = _79 * _71;
    float _83 = _79 * _77;
    float2 _432 = float2(_81, _83);
    float2 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_432, float2(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_432, float2(0.0), isnan(_432))).xy;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = in.m_41.x;
    float _95 = in.m_39.z;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_39.w;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_43.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_43.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = _93 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _121 = _79 * _99;
    float _123 = _93 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _125 = _79 * _111;
    float _127 = _79 * _117;
    float2 _497 = float2(_127, _125);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_497, float2(0.0), isnan(_497))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_497, float2(0.0), isnan(_497))).w;
    float _131 = _89 * _89;
    float _133 = _79 * _105;
    float _135 = _91 * _91;
    float _137 = fma(_119, _131, _121);
    float _139 = fma(_123, _135, _133);
    float2 _523 = float2(_137, _139);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_523, float2(0.0), isnan(_523))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_523, float2(0.0), isnan(_523))).w;
    float _143 = in.m_45.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_47.w;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_49.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _79 * _147;
    float _163 = _79 * _153;
    float _165 = in.m_51.x;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = -_161;
    float _173 = fma(_141, _129, _171);
    float _175 = _79 * _159;
    float _177 = _163 * _173;
    float _179 = 0.0 + _177;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = _181 * _175;
    bool _187 = _183 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _189 = isnan(_183);
    bool _191 = _187 || _189;
    bool _193 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _195 = _191 || _193;
    float _197 = in.m_51.y;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    if (!_195)
    {
        discard_fragment();
    }
    float _203 = _79 * _169;
    float _205 = _79 * _201;
    float2 _617 = float2(_203, _205);
    float3 _209 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_617, float2(0.0), isnan(_617))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_617, float2(0.0), isnan(_617))).xyz;
    float _211 = _209.x;
    float _213 = _209.y;
    float _215 = _209.z;
    float _217 = in.m_45.z;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = in.m_45.x;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = in.m_47.x;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = in.m_45.y;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    float _241 = in.m_47.y;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_47.z;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = _79 * _221;
    float _255 = _79 * _227;
    float _257 = _79 * _233;
    float _259 = _79 * _239;
    float _261 = _79 * _245;
    float _263 = _79 * _251;
    float _265 = -_257;
    float _267 = _255 + _265;
    float _269 = -_261;
    float _271 = _259 + _269;
    float _273 = -_263;
    float _275 = _253 + _273;
    float _277 = _211 * _211;
    float _279 = _213 * _213;
    float _281 = _215 * _215;
    float _283 = fma(_277, _267, _257);
    float _285 = fma(_279, _271, _261);
    float _287 = fma(_281, _275, _263);
    if (!_195)
    {
        out.m_54.x = _283;
        out.m_54.y = _285;
        out.m_54.z = _287;
        out.m_54.w = _177;
        return out;
    }
    float _289 = _285 * 0.715200006961822509765625;
    float _291 = in.m_56.w;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = in.m_56.z;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_56.x;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = fma(_283, 0.2125999927520751953125, _289);
    float _311 = in.m_56.y;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = fma(_287, 0.072200000286102294921875, _309);
    bool _319 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _321 = 1.0 / _317;
    float _323 = _321 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _325 = precise::clamp(_323, 0.0, 1.0);
    float _327 = fma(_325, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _329 = _79 * _295;
    float _331 = 0.0 + _183;
    float _333 = precise::clamp(_331, 0.0, 1.0);
    float _335 = _79 * _301;
    float _337 = _79 * _315;
    float _339 = _327 * _329;
    float _341 = _79 * _307;
    float _343 = fma(_287, _339, _335);
    float _345 = fma(_283, _339, _341);
    float _347 = fma(_285, _339, _337);
    float _349 = _335;
    if (!_319)
    {
        _349 = _333;
    }
    float _351 = _349;
    bool _353 = !_319;
    float _355 = _351;
    if (!_353)
    {
        float _357 = in.m_58.w;
        float _359 = gl_FragCoord.w;
        float _361 = _357 * _359;
        float _363 = in.m_58.z;
        float _365 = gl_FragCoord.w;
        float _367 = _363 * _365;
        float _369 = _79 * _361;
        float _371 = _79 * _367;
        float _373 = 1.0 / _369;
        float _375 = _371 * _373;
        float _377 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _379 = fma(_375, (*spvDescriptorSet0.fp_c8)._m0[30].w, _377);
        float _381 = 1.0 / _379;
        float _383 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _385 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _387 = fma(_381, _383, _385);
        float _389 = _387 * 8.0;
        float _391 = precise::clamp(_389, 0.0, 1.0);
        float _393 = _333 * _391;
        _355 = _393;
    }
    float _395 = _355;
    float _397 = 0.0 + _395;
    float _399 = precise::clamp(_397, 0.0, 1.0);
    out.m_54.x = _345;
    out.m_54.y = _347;
    out.m_54.z = _343;
    out.m_54.w = _399;
    return out;
}

