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
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
    float4 m_42 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
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
    float2 _509 = float2(_80, _82);
    float4 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_509, float2(0.0), isnan(_509))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_509, float2(0.0), isnan(_509))).xyzw;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float _93 = _85.w;
    float _95 = in.m_40.w;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_42.w;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_44.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = _78 * _99;
    float _115 = _78 * _105;
    float _117 = in.m_42.z;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_40.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_40.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_40.z;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = _78 * _127;
    float _143 = -_113;
    float _145 = _93 + _143;
    float _147 = _115 * _145;
    float _149 = _78 * _111;
    float _151 = 0.0 + _147;
    float _153 = precise::clamp(_151, 0.0, 1.0);
    float _155 = _153 * _149;
    bool _159 = _155 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _161 = isnan(_155);
    bool _163 = _159 || _161;
    bool _165 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _167 = _163 || _165;
    float _169 = in.m_42.x;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_42.y;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    if (!_167)
    {
        discard_fragment();
    }
    float _181 = _87 * _87;
    float _183 = _89 * _89;
    float _185 = _78 * _173;
    float _187 = _91 * _91;
    float _189 = _78 * _179;
    float _191 = _78 * _121;
    float _193 = -_181;
    float _195 = _193 + 1.0;
    float _197 = -_183;
    float _199 = _197 + 1.0;
    float _201 = -_187;
    float _203 = _201 + 1.0;
    float _205 = _185 * _195;
    float _207 = _189 * _199;
    float _209 = _191 * _203;
    float _211 = _78 * _133;
    float _213 = _78 * _139;
    float _215 = fma(_183, _141, _207);
    float _217 = fma(_181, _211, _205);
    float _219 = fma(_187, _213, _209);
    if (!_167)
    {
        out.m_47.x = _217;
        out.m_47.y = _215;
        out.m_47.z = _219;
        out.m_47.w = _147;
        return out;
    }
    float _221 = in.m_49.y;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_49.x;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = in.m_49.z;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = _78 * _225;
    float _241 = _78 * _231;
    float _243 = _78 * _237;
    float _245 = _239 * _239;
    float _247 = fma(_241, _241, _245);
    float _249 = fma(_243, _243, _247);
    float _251 = rsqrt(_249);
    float _253 = _241 * _251;
    float _255 = _239 * _251;
    float _257 = _243 * _251;
    float _259 = abs(_253);
    float _261 = abs(_255);
    float _263 = precise::max(_259, _261);
    float _265 = abs(_257);
    float _267 = precise::max(_265, _263);
    float _269 = 1.0 / _267;
    float _271 = -_269;
    float _273 = _257 * _271;
    float _275 = _253 * _269;
    float _277 = _255 * _269;
    float3 _789 = float3(_275, _277, _273);
    float3 _281 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_789, float3(0.0), isnan(_789)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_789, float3(0.0), isnan(_789)), level(0.0)).xyz;
    float _283 = _281.x;
    float _285 = _281.y;
    float _287 = _281.z;
    float _289 = _141 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _291 = _211 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _293 = in.m_51.x;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = _213 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _301 = _289 * 0.715200006961822509765625;
    float _303 = in.m_51.z;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_51.y;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = in.m_53.z;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = fma(_291, 0.2125999927520751953125, _301);
    float _323 = in.m_53.x;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_53.y;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_55.w;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = fma(_299, 0.072200000286102294921875, _321);
    float _343 = in.m_55.x;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_55.z;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = in.m_55.y;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = 1.0 / _341;
    float _363 = 0.0 + _155;
    float _365 = precise::clamp(_363, 0.0, 1.0);
    float _367 = _361 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _369 = precise::clamp(_367, 0.0, 1.0);
    float _371 = fma(_369, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _373 = _78 * _297;
    float _375 = _78 * _307;
    float _377 = _78 * _313;
    float _379 = _291 * _371;
    float _381 = _289 * _371;
    float _383 = _299 * _371;
    float _385 = _78 * _333;
    bool _387 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _389 = _78 * _339;
    float _391 = _78 * _353;
    float _393 = _78 * _347;
    float _395 = fma(_287, 0.20999999344348907470703125, _375);
    float _397 = fma(_283, 0.20999999344348907470703125, _373);
    float _399 = _78 * _319;
    float _401 = fma(_285, 0.20999999344348907470703125, _377);
    float _403 = _78 * _327;
    float _405 = _395 + _399;
    float _407 = _401 + _385;
    float _409 = _397 + _403;
    float _411 = _78 * _359;
    float _413 = fma(_219, _405, _383);
    float _415 = fma(_215, _407, _381);
    float _417 = fma(_217, _409, _379);
    float _419 = fma(_413, _389, _391);
    float _421 = fma(_415, _389, _411);
    float _423 = fma(_417, _389, _393);
    float _425 = _391;
    if (!_387)
    {
        _425 = _365;
    }
    float _427 = _425;
    bool _429 = !_387;
    float _431 = _427;
    if (!_429)
    {
        float _433 = in.m_57.w;
        float _435 = gl_FragCoord.w;
        float _437 = _433 * _435;
        float _439 = in.m_57.z;
        float _441 = gl_FragCoord.w;
        float _443 = _439 * _441;
        float _445 = _78 * _437;
        float _447 = _78 * _443;
        float _449 = 1.0 / _445;
        float _451 = _447 * _449;
        float _453 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _455 = fma(_451, (*spvDescriptorSet0.fp_c8)._m0[30].w, _453);
        float _457 = 1.0 / _455;
        float _459 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _461 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _463 = fma(_457, _459, _461);
        float _465 = _463 * 8.0;
        float _467 = precise::clamp(_465, 0.0, 1.0);
        float _469 = _365 * _467;
        _431 = _469;
    }
    float _471 = _431;
    float _473 = 0.0 + _471;
    float _475 = precise::clamp(_473, 0.0, 1.0);
    out.m_47.x = _423;
    out.m_47.y = _421;
    out.m_47.z = _419;
    out.m_47.w = _475;
    return out;
}

