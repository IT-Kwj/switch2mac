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
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_45 [[user(locn4), flat]];
    float4 m_39 [[user(locn5)]];
    float4 m_41 [[user(locn6)]];
    float4 m_43 [[user(locn7)]];
    float4 m_58 [[user(locn9)]];
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
    float _79 = in.m_41.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_41.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_41.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_43.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_43.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = 1.0 / _65;
    float _111 = _109 * _71;
    float _113 = _109 * _77;
    float _115 = _109 * _83;
    float _117 = _109 * _89;
    float _119 = _109 * _95;
    float _121 = _109 * _101;
    float2 _495 = float2(_111, _113);
    float2 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_495, float2(0.0), isnan(_495))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_495, float2(0.0), isnan(_495))).xy;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _109 * _107;
    float _133 = 1.0 / _115;
    float _135 = _117 * _133;
    float _137 = _119 * _133;
    float2 _521 = float2(_135, _137);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_521, float2(0.0), isnan(_521))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_521, float2(0.0), isnan(_521))).x;
    float2 _529 = float2(_131, _121);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_529, float2(0.0), isnan(_529))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_529, float2(0.0), isnan(_529))).w;
    float _143 = in.m_45.x;
    float _145 = in.m_39.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_39.w;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = _109 * _155;
    float _159 = fma(_127, 2.0, -1.0);
    float _161 = fma(_129, 2.0, -1.0);
    float _163 = _143 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _165 = _109 * _149;
    float _167 = _143 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _169 = fma(_163, _159, _165);
    float _171 = fma(_167, _161, _157);
    float2 _585 = float2(_169, _171);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_585, float2(0.0), isnan(_585))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_585, float2(0.0), isnan(_585))).w;
    float _175 = in.m_41.z;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_47.w;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_49.w;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_51.w;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = in.m_53.x;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _207 = fma(_139, (*spvDescriptorSet0.fp_c8)._m0[30].w, _205);
    float _209 = 1.0 / _207;
    float _211 = _109 * _179;
    float _213 = _211 * _133;
    float _215 = _109 * _191;
    float _217 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _219 = fma(_213, (*spvDescriptorSet0.fp_c8)._m0[30].w, _217);
    float _221 = _109 * _185;
    float _223 = 1.0 / _219;
    float _225 = _109 * _203;
    float _227 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _229 = _223 * _227;
    float _231 = in.m_49.y;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = _173 * _141;
    float _239 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _241 = -_221;
    float _243 = fma(_237, _215, _241);
    float _245 = _109 * _197;
    float _247 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _249 = -_229;
    float _251 = fma(_209, _247, _249);
    float _253 = _243 * 4.0;
    float _255 = precise::clamp(_253, 0.0, 1.0);
    float _257 = _245 * _255;
    float _259 = 0.0 + _257;
    float _261 = precise::clamp(_259, 0.0, 1.0);
    float _263 = _251 * _239;
    float _265 = precise::clamp(_263, 0.0, 1.0);
    float _267 = _261 * _265;
    float _269 = _267 * _225;
    bool _273 = _269 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _275 = isnan(_269);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _281 = _277 || _279;
    float _283 = in.m_49.x;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = _229;
    float _291 = _269;
    if (!_281)
    {
        discard_fragment();
    }
    float _293 = in.m_47.x;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = _109 * _287;
    float _301 = in.m_47.y;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = _109 * _297;
    float _309 = _307 * _299;
    float _311 = _109 * _305;
    float _313 = _109 * _235;
    float _315 = in.m_49.z;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = _311 * _313;
    float _323 = in.m_47.z;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = _109 * _319;
    float _331 = _109 * _327;
    float _333 = _331 * _329;
    if (!_281)
    {
        out.m_56.x = _309;
        out.m_56.y = _321;
        out.m_56.z = _333;
        out.m_56.w = _257;
        return out;
    }
    float _335 = _321 * 0.715200006961822509765625;
    float _337 = in.m_58.w;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_58.x;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_58.y;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = fma(_309, 0.2125999927520751953125, _335);
    float _357 = in.m_58.z;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = fma(_333, 0.072200000286102294921875, _355);
    bool _365 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _367 = 1.0 / _363;
    if (_365)
    {
        float _369 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _371 = _229 + _369;
        _289 = _371;
    }
    float _373 = _289;
    float _375 = _367 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _377 = precise::clamp(_375, 0.0, 1.0);
    float _379 = fma(_377, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _381 = _109 * _341;
    float _383 = _109 * _347;
    float _385 = _379 * _381;
    float _387 = 0.0 + _269;
    float _389 = precise::clamp(_387, 0.0, 1.0);
    float _391 = _389;
    if (_365)
    {
        float _393 = _373 * 8.0;
        float _395 = precise::clamp(_393, 0.0, 1.0);
        _291 = _395;
    }
    float _397 = _291;
    float _399 = _109 * _353;
    float _401 = _109 * _361;
    float _403 = fma(_309, _385, _383);
    if (_365)
    {
        float _405 = _389 * _397;
        _391 = _405;
    }
    float _407 = _391;
    float _409 = fma(_321, _385, _399);
    float _411 = fma(_333, _385, _401);
    float _413 = 0.0 + _407;
    float _415 = precise::clamp(_413, 0.0, 1.0);
    out.m_56.x = _403;
    out.m_56.y = _409;
    out.m_56.z = _411;
    out.m_56.w = _415;
    return out;
}

