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
    texturecube<float> fp_t_tcb_1E [[id(5)]];
    sampler fp_t_tcb_1ESmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_1ESmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _64 = gl_FragCoord.w;
    float _66 = in.m_38.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_38.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = 1.0 / _64;
    float _80 = _78 * _70;
    float _82 = _78 * _76;
    float2 _491 = float2(_80, _82);
    float4 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_491, float2(0.0), isnan(_491))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_491, float2(0.0), isnan(_491))).xyzw;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float _93 = _85.w;
    float _95 = in.m_40.w;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_42.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = _78 * _99;
    float _109 = _93 * _107;
    float _111 = _78 * _105;
    float _113 = 0.0 + _109;
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = _115 * _111;
    bool _121 = _117 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _123 = isnan(_117);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _129 = _125 || _127;
    if (!_129)
    {
        discard_fragment();
    }
    if (!_129)
    {
        out.m_45.x = 0.006000000052154064178466796875;
        out.m_45.y = 0.00200000009499490261077880859375;
        out.m_45.z = 0.001000000047497451305389404296875;
        out.m_45.w = _109;
        return out;
    }
    float _131 = in.m_47.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_47.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_47.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = _78 * _135;
    float _151 = _78 * _141;
    float _153 = _78 * _147;
    float _155 = _149 * _149;
    float _157 = fma(_151, _151, _155);
    float _159 = fma(_153, _153, _157);
    float _161 = rsqrt(_159);
    float _163 = _151 * _161;
    float _165 = _149 * _161;
    float _167 = _153 * _161;
    float _169 = abs(_163);
    float _171 = abs(_165);
    float _173 = precise::max(_169, _171);
    float _175 = abs(_167);
    float _177 = precise::max(_175, _173);
    float _179 = 1.0 / _177;
    float _181 = -_179;
    float _183 = _167 * _181;
    float _185 = _163 * _179;
    float _187 = _165 * _179;
    float3 _654 = float3(_185, _187, _183);
    float3 _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_654, float3(0.0), isnan(_654)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_654, float3(0.0), isnan(_654)), level(0.0)).xyz;
    float _193 = _191.x;
    float _195 = _191.y;
    float _197 = _191.z;
    float _199 = in.m_49.x;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_49.y;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_49.z;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_40.y;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = in.m_40.x;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = in.m_40.z;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = _87 * _87;
    float _237 = _89 * _89;
    float _239 = _91 * _91;
    float _241 = in.m_51.z;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = -_235;
    float _249 = _247 + 1.0;
    float _251 = -_237;
    float _253 = _251 + 1.0;
    float _255 = -_239;
    float _257 = _255 + 1.0;
    float _259 = in.m_53.z;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_53.x;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = in.m_53.y;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = 0.0 + _117;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = _78 * _203;
    float _283 = _78 * _209;
    float _285 = _78 * _215;
    float _287 = _281 * _249;
    float _289 = _283 * _253;
    float _291 = _78 * _221;
    float _293 = _78 * _227;
    float _295 = _285 * _257;
    float _297 = _78 * _233;
    float _299 = fma(_237, _291, _289);
    float _301 = fma(_235, _293, _287);
    float _303 = in.m_51.y;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = fma(_239, _297, _295);
    float _311 = _299 * 0.715200006961822509765625;
    float _313 = in.m_51.x;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = in.m_55.w;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_55.x;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = fma(_301, 0.2125999927520751953125, _311);
    float _333 = in.m_55.y;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = fma(_309, 0.072200000286102294921875, _331);
    float _341 = in.m_55.z;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = 1.0 / _339;
    float _349 = _347 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _351 = precise::clamp(_349, 0.0, 1.0);
    float _353 = fma(_351, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _355 = _78 * _307;
    float _357 = _78 * _245;
    float _359 = _78 * _317;
    float _361 = _301 * _353;
    float _363 = _299 * _353;
    float _365 = _309 * _353;
    float _367 = _78 * _269;
    float _369 = _78 * _323;
    float _371 = _78 * _345;
    bool _373 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _375 = _78 * _329;
    float _377 = fma(_193, 0.20999999344348907470703125, _359);
    float _379 = fma(_195, 0.20999999344348907470703125, _355);
    float _381 = fma(_197, 0.20999999344348907470703125, _357);
    float _383 = _78 * _263;
    float _385 = _78 * _275;
    float _387 = _377 + _367;
    float _389 = _381 + _383;
    float _391 = _379 + _385;
    float _393 = fma(_387, 0.006000000052154064178466796875, _361);
    float _395 = _78 * _337;
    float _397 = fma(_389, 0.001000000047497451305389404296875, _365);
    float _399 = fma(_391, 0.00200000009499490261077880859375, _363);
    float _401 = fma(_393, _369, _375);
    float _403 = fma(_397, _369, _371);
    float _405 = fma(_399, _369, _395);
    float _407 = _371;
    if (!_373)
    {
        _407 = _279;
    }
    float _409 = _407;
    bool _411 = !_373;
    float _413 = _409;
    if (!_411)
    {
        float _415 = in.m_57.w;
        float _417 = gl_FragCoord.w;
        float _419 = _415 * _417;
        float _421 = in.m_57.z;
        float _423 = gl_FragCoord.w;
        float _425 = _421 * _423;
        float _427 = _78 * _419;
        float _429 = _78 * _425;
        float _431 = 1.0 / _427;
        float _433 = _429 * _431;
        float _435 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _437 = fma(_433, (*spvDescriptorSet0.fp_c8)._m0[30].w, _435);
        float _439 = 1.0 / _437;
        float _441 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _443 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _445 = fma(_439, _441, _443);
        float _447 = _445 * 8.0;
        float _449 = precise::clamp(_447, 0.0, 1.0);
        float _451 = _279 * _449;
        _413 = _451;
    }
    float _453 = _413;
    float _455 = 0.0 + _453;
    float _457 = precise::clamp(_455, 0.0, 1.0);
    out.m_45.x = _401;
    out.m_45.y = _405;
    out.m_45.z = _403;
    out.m_45.w = _457;
    return out;
}

