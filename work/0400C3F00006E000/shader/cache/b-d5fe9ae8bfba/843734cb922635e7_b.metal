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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_34 [[id(9)]];
    sampler fp_t_tcb_34Smplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_34Smplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_58 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_41 [[user(locn6)]];
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
    float _79 = in.m_39.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_39.z;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_41.x;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_41.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_43.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_43.y;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = 1.0 / _65;
    float _117 = _115 * _71;
    float _119 = _115 * _77;
    float _121 = _115 * _83;
    float _123 = _115 * _89;
    float _125 = _115 * _95;
    float _127 = _115 * _101;
    float2 _486 = float2(_117, _119);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_486, float2(0.0), isnan(_486))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_486, float2(0.0), isnan(_486))).w;
    float _131 = _115 * _107;
    float2 _500 = float2(_123, _121);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_500, float2(0.0), isnan(_500))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_500, float2(0.0), isnan(_500))).w;
    float _135 = _115 * _113;
    float2 _511 = float2(_125, _127);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_511, float2(0.0), isnan(_511))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_511, float2(0.0), isnan(_511))).w;
    float2 _519 = float2(_131, _135);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_519, float2(0.0), isnan(_519))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_519, float2(0.0), isnan(_519))).w;
    float _141 = in.m_45.w;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_47.w;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_49.w;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_51.x;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = _115 * _151;
    float _167 = in.m_49.x;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_47.z;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = _129 + _133;
    float _181 = _115 * _145;
    float _183 = _115 * _157;
    float _185 = _179 * _137;
    float _187 = _185 * _139;
    float _189 = -_181;
    float _191 = fma(_187, _165, _189);
    float _193 = _183 * _191;
    float _195 = _115 * _163;
    float _197 = 0.0 + _193;
    float _199 = precise::clamp(_197, 0.0, 1.0);
    float _201 = _199 * _195;
    bool _205 = _201 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _207 = isnan(_201);
    bool _209 = _205 || _207;
    bool _211 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _213 = _209 || _211;
    float _215 = in.m_45.x;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    if (!_213)
    {
        discard_fragment();
    }
    float _221 = _115 * _219;
    float _223 = _115 * _171;
    float _225 = in.m_49.y;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = _221 + _223;
    float _233 = in.m_45.y;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = _115 * _237;
    float _241 = _115 * _229;
    float _243 = in.m_49.z;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = _239 + _241;
    float _251 = in.m_45.z;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = _115 * _255;
    float _259 = _115 * _247;
    float _261 = _257 + _259;
    float _263 = in.m_47.x;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = _115 * _267;
    float _271 = _231 * _269;
    float _273 = _115 * _177;
    float _275 = in.m_47.y;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = _261 * _273;
    float _283 = _115 * _279;
    float _285 = _249 * _283;
    if (!_213)
    {
        out.m_54.x = _271;
        out.m_54.y = _285;
        out.m_54.z = _281;
        out.m_54.w = _193;
        return out;
    }
    float _287 = _285 * 0.715200006961822509765625;
    float _289 = in.m_56.w;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_56.z;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_56.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = fma(_271, 0.2125999927520751953125, _287);
    float _309 = in.m_56.y;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = fma(_281, 0.072200000286102294921875, _307);
    bool _317 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _319 = 1.0 / _315;
    float _321 = _319 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _323 = precise::clamp(_321, 0.0, 1.0);
    float _325 = _115 * _293;
    float _327 = fma(_323, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _329 = _115 * _299;
    float _331 = _327 * _325;
    float _333 = 0.0 + _201;
    float _335 = precise::clamp(_333, 0.0, 1.0);
    float _337 = _115 * _305;
    float _339 = _115 * _313;
    float _341 = fma(_281, _331, _329);
    float _343 = fma(_271, _331, _337);
    float _345 = fma(_285, _331, _339);
    float _347 = _329;
    if (!_317)
    {
        _347 = _335;
    }
    float _349 = _347;
    bool _351 = !_317;
    float _353 = _349;
    if (!_351)
    {
        float _355 = in.m_58.w;
        float _357 = gl_FragCoord.w;
        float _359 = _355 * _357;
        float _361 = in.m_58.z;
        float _363 = gl_FragCoord.w;
        float _365 = _361 * _363;
        float _367 = _115 * _359;
        float _369 = _115 * _365;
        float _371 = 1.0 / _367;
        float _373 = _369 * _371;
        float _375 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _377 = fma(_373, (*spvDescriptorSet0.fp_c8)._m0[30].w, _375);
        float _379 = 1.0 / _377;
        float _381 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _383 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _385 = fma(_379, _381, _383);
        float _387 = _385 * 8.0;
        float _389 = precise::clamp(_387, 0.0, 1.0);
        float _391 = _335 * _389;
        _353 = _391;
    }
    float _393 = _353;
    float _395 = 0.0 + _393;
    float _397 = precise::clamp(_395, 0.0, 1.0);
    out.m_54.x = _343;
    out.m_54.y = _345;
    out.m_54.z = _341;
    out.m_54.w = _397;
    return out;
}

