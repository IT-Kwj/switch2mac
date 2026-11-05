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
    texturecube<float> fp_t_tcb_1E [[id(3)]];
    sampler fp_t_tcb_1ESmplr [[id(4)]];
    sampler fp_t_tcb_1ESmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_48 [[user(locn4), flat]];
    float4 m_42 [[user(locn5)]];
    float4 m_56 [[user(locn6)]];
    float4 m_35 [[user(locn7)]];
    float4 m_40 [[user(locn8)]];
    float4 m_46 [[user(locn9)]];
    float4 m_54 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_33.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _63;
    float _73 = _71 * _69;
    bool _77 = _73 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _79 = isnan(_73);
    bool _81 = _77 || _79;
    bool _83 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _85 = _81 || _83;
    float _87 = in.m_35.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_35.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_35.z;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    if (!_85)
    {
        discard_fragment();
    }
    float _105 = _71 * _91;
    float _107 = _71 * _97;
    float _109 = _71 * _103;
    float _111 = _105 * _105;
    float _113 = fma(_107, _107, _111);
    float _115 = fma(_109, _109, _113);
    float _117 = rsqrt(_115);
    float _119 = _107 * _117;
    float _121 = _105 * _117;
    float _123 = _109 * _117;
    if (!_85)
    {
        out.m_38.x = 0.006000000052154064178466796875;
        out.m_38.y = 0.00200000009499490261077880859375;
        out.m_38.z = 0.001000000047497451305389404296875;
        out.m_38.w = 1.0;
        return out;
    }
    float _125 = abs(_119);
    float _127 = abs(_121);
    float _129 = precise::max(_125, _127);
    float _131 = abs(_123);
    float _133 = precise::max(_131, _129);
    float _135 = 1.0 / _133;
    float _137 = -_135;
    float _139 = _123 * _137;
    float _141 = _119 * _135;
    float _143 = _121 * _135;
    float3 _663 = float3(_141, _143, _139);
    float3 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_663, float3(0.0), isnan(_663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_663, float3(0.0), isnan(_663)), level(0.0)).xyz;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    float _155 = in.m_40.y;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_40.x;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_40.z;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_42.y;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_44.y;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = in.m_44.x;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = in.m_44.z;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = in.m_46.y;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_46.z;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = 0.0 + _73;
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = _71 * _159;
    float _215 = _71 * _165;
    float _217 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _219 = _213 + _217;
    float _221 = _71 * _171;
    float _223 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _225 = _215 + _223;
    float _227 = _121 * _121;
    float _229 = _219 * _219;
    float _231 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _233 = _221 + _231;
    float _235 = fma(_119, _119, _227);
    float _237 = fma(_225, _225, _229);
    float _239 = fma(_123, _123, _235);
    float _241 = fma(_233, _233, _237);
    float _243 = rsqrt(_241);
    float _245 = rsqrt(_239);
    float _247 = in.m_48.x;
    float _249 = _219 * _243;
    float _251 = _225 * _243;
    float _253 = _233 * _243;
    float _255 = _249 * _249;
    float _257 = fma(_251, _251, _255);
    float _259 = _121 * _245;
    float _261 = _119 * _245;
    float _263 = _123 * _245;
    float _265 = fma(_253, _253, _257);
    float _267 = rsqrt(_265);
    float _269 = _249 * _267;
    float _271 = _259 * _269;
    float _273 = _251 * _267;
    float _275 = _253 * _267;
    float _277 = in.m_50.y;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = fma(_261, _273, _271);
    float _285 = _71 * _183;
    float _287 = in.m_50.x;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = in.m_50.z;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = fma(_263, _275, _283);
    float _301 = _247 * 0.4000000059604644775390625;
    float _303 = in.m_52.y;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = abs(_299);
    float _311 = 0.0 + _309;
    float _313 = precise::clamp(_311, 0.0, 1.0);
    float _315 = fma(_313, -2.0, 3.0);
    float _317 = _313 * _313;
    float _319 = _315 * _317;
    float _321 = precise::clamp(_319, 0.0, 1.0);
    float _323 = _71 * _177;
    float _325 = in.m_46.x;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = -_321;
    float _333 = fma(_323, 2.0, _331);
    float _335 = fma(_301, _333, _321);
    float _337 = _71 * _189;
    float _339 = fma(_335, 1.66666662693023681640625, -0.666666686534881591796875);
    float _341 = precise::clamp(_339, 0.0, 1.0);
    float _343 = fma(_341, -2.0, 3.0);
    float _345 = _341 * _341;
    float _347 = _71 * _297;
    float _349 = in.m_52.x;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = _343 * _345;
    float _357 = _71 * _281;
    float _359 = _71 * _291;
    float _361 = _71 * _195;
    float _363 = in.m_54.x;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = -_357;
    float _371 = _369 + _285;
    float _373 = -_359;
    float _375 = _373 + _337;
    float _377 = -_347;
    float _379 = _377 + _361;
    float _381 = in.m_52.z;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = fma(_355, _371, _357);
    float _389 = fma(_355, _375, _359);
    float _391 = fma(_355, _379, _347);
    float _393 = in.m_54.y;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = _387 * 0.715200006961822509765625;
    float _401 = in.m_54.w;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = fma(_389, 0.2125999927520751953125, _399);
    float _409 = fma(_391, 0.072200000286102294921875, _407);
    float _411 = in.m_54.z;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = 1.0 / _409;
    float _419 = _71 * _385;
    float _421 = _417 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _423 = precise::clamp(_421, 0.0, 1.0);
    float _425 = _71 * _397;
    float _427 = fma(_423, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _429 = _71 * _353;
    float _431 = _71 * _307;
    float _433 = _71 * _405;
    float _435 = _389 * _427;
    float _437 = _387 * _427;
    float _439 = _391 * _427;
    float _441 = _71 * _329;
    float _443 = _71 * _207;
    float _445 = fma(_149, 0.20999999344348907470703125, _429);
    float _447 = fma(_151, 0.20999999344348907470703125, _431);
    float _449 = fma(_153, 0.20999999344348907470703125, _419);
    float _451 = _71 * _201;
    bool _453 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _455 = _445 + _441;
    float _457 = _449 + _443;
    float _459 = _447 + _451;
    float _461 = _71 * _367;
    float _463 = fma(_455, 0.006000000052154064178466796875, _435);
    float _465 = fma(_457, 0.001000000047497451305389404296875, _439);
    float _467 = fma(_459, 0.00200000009499490261077880859375, _437);
    float _469 = _71 * _415;
    float _471 = fma(_463, _433, _461);
    float _473 = fma(_467, _433, _425);
    float _475 = fma(_465, _433, _469);
    float _477 = _461;
    if (!_453)
    {
        _477 = _211;
    }
    float _479 = _477;
    bool _481 = !_453;
    float _483 = _479;
    if (!_481)
    {
        float _485 = in.m_56.w;
        float _487 = gl_FragCoord.w;
        float _489 = _485 * _487;
        float _491 = in.m_56.z;
        float _493 = gl_FragCoord.w;
        float _495 = _491 * _493;
        float _497 = _71 * _489;
        float _499 = _71 * _495;
        float _501 = 1.0 / _497;
        float _503 = _499 * _501;
        float _505 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _507 = fma(_503, (*spvDescriptorSet0.fp_c8)._m0[30].w, _505);
        float _509 = 1.0 / _507;
        float _511 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _513 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _515 = fma(_509, _511, _513);
        float _517 = _515 * 8.0;
        float _519 = precise::clamp(_517, 0.0, 1.0);
        float _521 = _211 * _519;
        _483 = _521;
    }
    float _523 = _483;
    float _525 = 0.0 + _523;
    float _527 = precise::clamp(_525, 0.0, 1.0);
    out.m_38.x = _471;
    out.m_38.y = _473;
    out.m_38.z = _475;
    out.m_38.w = _527;
    return out;
}

