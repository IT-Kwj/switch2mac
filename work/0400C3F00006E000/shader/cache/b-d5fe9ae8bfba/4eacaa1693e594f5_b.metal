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
    float4 m_44 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_51 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _66 = gl_FragCoord.w;
    float _68 = in.m_38.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_38.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _66;
    float _82 = _80 * _72;
    float _84 = _80 * _78;
    float2 _509 = float2(_82, _84);
    float4 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_509, float2(0.0), isnan(_509))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_509, float2(0.0), isnan(_509))).xyzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _87.w;
    float _97 = in.m_40.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_42.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = _80 * _101;
    float _111 = in.m_44.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_44.z;
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
    float _141 = _80 * _115;
    float _143 = _80 * _127;
    float _145 = _95 * _109;
    float _147 = _80 * _107;
    float _149 = 0.0 + _145;
    float _151 = precise::clamp(_149, 0.0, 1.0);
    float _153 = _151 * _147;
    bool _157 = _153 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _159 = isnan(_153);
    bool _161 = _157 || _159;
    bool _163 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _165 = _161 || _163;
    float _167 = in.m_44.x;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    if (!_165)
    {
        discard_fragment();
    }
    float _173 = _89 * _89;
    float _175 = _91 * _91;
    float _177 = -_173;
    float _179 = _177 + 1.0;
    float _181 = _80 * _171;
    float _183 = _93 * _93;
    float _185 = _80 * _121;
    float _187 = -_175;
    float _189 = _187 + 1.0;
    float _191 = _181 * _179;
    float _193 = -_183;
    float _195 = _193 + 1.0;
    float _197 = _80 * _133;
    float _199 = _141 * _189;
    float _201 = _80 * _139;
    float _203 = _185 * _195;
    float _205 = fma(_173, _197, _191);
    float _207 = fma(_175, _143, _199);
    float _209 = fma(_183, _201, _203);
    if (!_165)
    {
        out.m_47.x = _205;
        out.m_47.y = _207;
        out.m_47.z = _209;
        out.m_47.w = _145;
        return out;
    }
    float _211 = in.m_49.y;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_49.x;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = in.m_49.z;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = _80 * _215;
    float _231 = _80 * _221;
    float _233 = _80 * _227;
    float _235 = _229 * _229;
    float _237 = in.m_51.x;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = fma(_231, _231, _235);
    float _245 = fma(_233, _233, _243);
    float _247 = rsqrt(_245);
    float _249 = _231 * _247;
    float _251 = _229 * _247;
    float _253 = _233 * _247;
    float _255 = _80 * _241;
    float _257 = abs(_249);
    float _259 = abs(_251);
    float _261 = precise::max(_257, _259);
    float _263 = abs(_253);
    float _265 = precise::max(_263, _261);
    float _267 = 1.0 / _265;
    float _269 = _251 * _267;
    float _271 = -_267;
    float _273 = _253 * _271;
    float _275 = precise::min(_255, 1.0);
    float _277 = _249 * _267;
    float3 _786 = float3(_277, _269, _273);
    float3 _281 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_786, float3(0.0), isnan(_786)), level(_275)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_786, float3(0.0), isnan(_786)), level(_275)).xyz;
    float _283 = _281.x;
    float _285 = _281.y;
    float _287 = _281.z;
    float _289 = _143 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _291 = _197 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _293 = in.m_53.x;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = _201 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _301 = _289 * 0.715200006961822509765625;
    float _303 = in.m_53.z;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_53.y;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = in.m_55.z;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = fma(_291, 0.2125999927520751953125, _301);
    float _323 = in.m_55.x;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_55.y;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_57.w;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = fma(_299, 0.072200000286102294921875, _321);
    float _343 = in.m_57.x;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_57.z;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = in.m_57.y;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = 1.0 / _341;
    float _363 = 0.0 + _153;
    float _365 = precise::clamp(_363, 0.0, 1.0);
    float _367 = _361 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _369 = precise::clamp(_367, 0.0, 1.0);
    float _371 = fma(_369, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _373 = _80 * _297;
    float _375 = _80 * _307;
    float _377 = _80 * _313;
    float _379 = _291 * _371;
    float _381 = _289 * _371;
    float _383 = _299 * _371;
    float _385 = _80 * _333;
    bool _387 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _389 = _80 * _339;
    float _391 = _80 * _353;
    float _393 = _80 * _347;
    float _395 = fma(_287, 0.20999999344348907470703125, _375);
    float _397 = fma(_283, 0.20999999344348907470703125, _373);
    float _399 = _80 * _319;
    float _401 = fma(_285, 0.20999999344348907470703125, _377);
    float _403 = _80 * _327;
    float _405 = _395 + _399;
    float _407 = _401 + _385;
    float _409 = _397 + _403;
    float _411 = _80 * _359;
    float _413 = fma(_209, _405, _383);
    float _415 = fma(_207, _407, _381);
    float _417 = fma(_205, _409, _379);
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
        float _433 = in.m_59.w;
        float _435 = gl_FragCoord.w;
        float _437 = _433 * _435;
        float _439 = in.m_59.z;
        float _441 = gl_FragCoord.w;
        float _443 = _439 * _441;
        float _445 = _80 * _437;
        float _447 = _80 * _443;
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

