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
    constant _16* fp_c3 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _5272 = false;
    bool _4792 = false;
    bool _4320 = false;
    bool _3848 = false;
    bool _3376 = false;
    bool _2904 = false;
    bool _2432 = false;
    bool _1962 = false;
    float _46 = gl_FragCoord.w;
    float _48 = in.m_36.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_36.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _5317 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5317, float2(0.0), isnan(_5317))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5317, float2(0.0), isnan(_5317))).x;
    float _68 = fma(_64, 2.0, -1.0);
    float _70 = fma(_62, 2.0, -1.0);
    float _72 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _74 = _72 + 1.0;
    float _76 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _78 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _80 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[0].z);
    float _82 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _84 = _80 * _76;
    float _86 = _80 * _82;
    float _88 = _80 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _92 = _86 * _90;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _96 = _86 * _94;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _100 = _86 * _98;
    bool _104 = _88 > (*spvDescriptorSet0.fp_c4)._m0[33].y;
    float _106 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[3].x, _92);
    float _108 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[4].x, _96);
    float _110 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[2].x, _100);
    bool _112 = _88 > (*spvDescriptorSet0.fp_c4)._m0[33].x;
    float _114 = -_88;
    float _116 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[3].z, _106);
    float _118 = -_88;
    float _120 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[4].z, _108);
    float _122 = -_88;
    float _124 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[2].z, _110);
    bool _126 = _88 > (*spvDescriptorSet0.fp_c4)._m0[33].z;
    float _128 = _116 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _130 = _120 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _132 = _124 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    bool _134 = !_104;
    int _137 = _134 ? 0 : 1;
    float _139 = _128 * 78.233001708984375;
    float _141 = fma(_130, 12.98980045318603515625, _139);
    float _143 = fma(_132, 12.98980045318603515625, _139);
    float _145 = fma(_132, 45.16400146484375, _141);
    float _147 = fma(_130, 45.16400146484375, _143);
    float _149 = _145 + 94.67299652099609375;
    float _151 = _145 + 568.0379638671875;
    float _153 = _149 * 0.15915493667125701904296875;
    float _155 = _147 + 94.67299652099609375;
    float _157 = _151 * 0.15915493667125701904296875;
    float _159 = _147 + 568.0379638671875;
    float _161 = _155 * 0.15915493667125701904296875;
    float _163 = _145 + 189.3459930419921875;
    float _165 = _159 * 0.15915493667125701904296875;
    float _167 = _153 * 6.283185482025146484375;
    float _169 = sin(_167);
    float _171 = _163 * 0.15915493667125701904296875;
    float _173 = _147 + 189.3459930419921875;
    float _175 = _173 * 0.15915493667125701904296875;
    float _177 = _145 + 284.01898193359375;
    float _179 = _165 * 6.283185482025146484375;
    float _181 = sin(_179);
    float _183 = _177 * 0.15915493667125701904296875;
    float _185 = _147 + 284.01898193359375;
    float _187 = _169 * 43758.546875;
    float _189 = _185 * 0.15915493667125701904296875;
    float _191 = _145 + 378.691986083984375;
    float _193 = _161 * 6.283185482025146484375;
    float _195 = sin(_193);
    float _197 = _191 * 0.15915493667125701904296875;
    float _199 = _147 + 378.691986083984375;
    float _201 = _199 * 0.15915493667125701904296875;
    float _203 = _145 + 473.364990234375;
    float _205 = _175 * 6.283185482025146484375;
    float _207 = sin(_205);
    float _209 = _203 * 0.15915493667125701904296875;
    float _211 = _147 + 473.364990234375;
    float _213 = _195 * 43758.546875;
    float _215 = _211 * 0.15915493667125701904296875;
    float _217 = _183 * 6.283185482025146484375;
    float _219 = sin(_217);
    int _221 = 2;
    if (!_104)
    {
        _221 = 1;
    }
    int _223 = _221;
    int _225 = _223;
    if (!_112)
    {
        _225 = _137;
    }
    int _227 = _225;
    float _229 = _145 + 662.71099853515625;
    float _231 = _145 + 757.38397216796875;
    float _233 = _207 * 43758.546875;
    int _235 = _227 + 1;
    float _237 = _229 * 0.15915493667125701904296875;
    int _239 = _235;
    if (!_126)
    {
        _239 = _227;
    }
    int _241 = _239;
    float _243 = _231 * 0.15915493667125701904296875;
    float _245 = _147 + 662.71099853515625;
    float _247 = _147 + 757.38397216796875;
    bool _249 = _241 != 1;
    float _251 = _245 * 0.15915493667125701904296875;
    bool _253 = _241 != 0;
    float _255 = _237 * 6.283185482025146484375;
    float _257 = sin(_255);
    bool _259 = !_249;
    int _261 = _259 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].y);
    float _263 = _219 * 43758.546875;
    bool _265 = !_249;
    int _267 = _265 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].y);
    bool _269 = !_249;
    int _271 = _269 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].y);
    float _273 = _247 * 0.15915493667125701904296875;
    bool _275 = !_249;
    int _277 = _275 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].x);
    float _279 = _201 * 6.283185482025146484375;
    float _281 = sin(_279);
    bool _283 = !_249;
    int _285 = _283 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].y);
    bool _287 = !_249;
    int _289 = _287 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].y);
    bool _291 = !_249;
    int _293 = _291 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].y);
    bool _295 = !_249;
    int _297 = _295 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].y);
    float _299 = _171 * 6.283185482025146484375;
    float _301 = sin(_299);
    float _303 = _253 ? as_type<float>(_271) : (*spvDescriptorSet0.fp_c4)._m0[23].y;
    float _305 = _253 ? as_type<float>(_277) : (*spvDescriptorSet0.fp_c4)._m0[21].x;
    float _307 = _253 ? as_type<float>(_285) : (*spvDescriptorSet0.fp_c4)._m0[24].y;
    float _309 = _253 ? as_type<float>(_261) : (*spvDescriptorSet0.fp_c4)._m0[21].y;
    float _311 = _189 * 6.283185482025146484375;
    float _313 = sin(_311);
    float _315 = _253 ? as_type<float>(_267) : (*spvDescriptorSet0.fp_c4)._m0[22].y;
    float _317 = _128 * _307;
    float _319 = _253 ? as_type<float>(_289) : (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _321 = _281 * 43758.546875;
    float _323 = _253 ? as_type<float>(_293) : (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _325 = _128 * _309;
    float _327 = _253 ? as_type<float>(_297) : (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _329 = _128 * _303;
    float _331 = _128 * _315;
    float _333 = _128 * _319;
    float _335 = _128 * _323;
    float _337 = _128 * _327;
    float _339 = fma(_132, _305, _325);
    float _341 = _197 * 6.283185482025146484375;
    float _343 = sin(_341);
    bool _345 = !_249;
    int _347 = _345 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].x);
    float _349 = _301 * 43758.546875;
    bool _351 = !_249;
    int _353 = _351 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].x);
    float _355 = _313 * 43758.546875;
    bool _357 = !_249;
    int _359 = _357 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _361 = _253 ? as_type<float>(_347) : (*spvDescriptorSet0.fp_c4)._m0[24].x;
    float _363 = _209 * 6.283185482025146484375;
    float _365 = sin(_363);
    float _367 = _253 ? as_type<float>(_353) : (*spvDescriptorSet0.fp_c4)._m0[22].x;
    float _369 = _253 ? as_type<float>(_359) : (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _371 = fma(_132, _361, _317);
    float _373 = fma(_132, _367, _331);
    float _375 = fma(_132, _369, _333);
    float _377 = _215 * 6.283185482025146484375;
    float _379 = sin(_377);
    float _381 = _343 * 43758.546875;
    bool _383 = !_249;
    int _385 = _383 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].z);
    bool _387 = !_249;
    int _389 = _387 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].x);
    float _391 = _365 * 43758.546875;
    bool _393 = !_249;
    int _395 = _393 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].x);
    float _397 = _157 * 6.283185482025146484375;
    float _399 = sin(_397);
    bool _401 = !_249;
    int _403 = _401 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].z);
    float _405 = _253 ? as_type<float>(_385) : (*spvDescriptorSet0.fp_c4)._m0[21].z;
    float _407 = _253 ? as_type<float>(_389) : (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _409 = _243 * 6.283185482025146484375;
    float _411 = sin(_409);
    float _413 = _253 ? as_type<float>(_395) : (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _415 = fma(_132, _407, _335);
    float _417 = _253 ? as_type<float>(_403) : (*spvDescriptorSet0.fp_c4)._m0[22].z;
    float _419 = fma(_130, _405, _339);
    bool _421 = !_249;
    int _423 = _421 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].x);
    float _425 = fma(_132, _413, _337);
    float _427 = fma(_130, _417, _373);
    float _429 = _251 * 6.283185482025146484375;
    float _431 = sin(_429);
    float _433 = _379 * 43758.546875;
    float _435 = _253 ? as_type<float>(_423) : (*spvDescriptorSet0.fp_c4)._m0[23].x;
    float _437 = _399 * 43758.546875;
    bool _439 = !_249;
    int _441 = _439 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].z);
    float _443 = _411 * 43758.546875;
    bool _445 = !_249;
    int _447 = _445 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].z);
    float _449 = fma(_132, _435, _329);
    bool _451 = !_249;
    int _453 = _451 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _455 = _273 * 6.283185482025146484375;
    float _457 = sin(_455);
    float _459 = _253 ? as_type<float>(_441) : (*spvDescriptorSet0.fp_c4)._m0[23].z;
    float _461 = _253 ? as_type<float>(_447) : (*spvDescriptorSet0.fp_c4)._m0[24].z;
    float _463 = _253 ? as_type<float>(_453) : (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _465 = fma(_130, _459, _449);
    float _467 = fma(_130, _461, _371);
    float _469 = fma(_130, _463, _375);
    float _471 = _181 * 43758.546875;
    float _473 = floor(_213);
    bool _475 = !_249;
    int _477 = _475 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].w);
    float _479 = _457 * 43758.546875;
    bool _481 = !_249;
    int _483 = _481 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].z);
    bool _485 = !_249;
    int _487 = _485 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].w);
    bool _489 = !_249;
    int _491 = _489 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].z);
    float _493 = floor(_187);
    bool _495 = !_249;
    int _497 = _495 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].w);
    float _499 = _253 ? as_type<float>(_477) : (*spvDescriptorSet0.fp_c4)._m0[23].w;
    float _501 = _253 ? as_type<float>(_483) : (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _503 = _253 ? as_type<float>(_491) : (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _505 = _499 + _465;
    float _507 = _253 ? as_type<float>(_487) : (*spvDescriptorSet0.fp_c4)._m0[21].w;
    float _509 = _257 * 43758.546875;
    float _511 = _253 ? as_type<float>(_497) : (*spvDescriptorSet0.fp_c4)._m0[22].w;
    float _513 = fma(_130, _501, _415);
    float _515 = fma(_130, _503, _425);
    float _517 = _511 + _427;
    bool _519 = !_249;
    int _521 = _519 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _523 = _431 * 43758.546875;
    float _525 = floor(_233);
    bool _527 = !_249;
    int _529 = _527 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _531 = _507 + _419;
    float _533 = _253 ? as_type<float>(_521) : (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _535 = -_473;
    float _537 = _213 + _535;
    bool _539 = !_249;
    int _541 = _539 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].w);
    float _543 = -_493;
    float _545 = _187 + _543;
    float _547 = _253 ? as_type<float>(_529) : (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _549 = _533 + _469;
    float _551 = floor(_263);
    float _553 = _253 ? as_type<float>(_541) : (*spvDescriptorSet0.fp_c4)._m0[24].w;
    float _555 = _78 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _557 = _547 + _513;
    bool _559 = !_249;
    int _561 = _559 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _563 = fma(_537, 2.0, -1.0);
    float _565 = _553 + _467;
    float _567 = -_525;
    float _569 = _233 + _567;
    float _571 = floor(_321);
    float _573 = _253 ? as_type<float>(_561) : (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _575 = fma(_545, 2.0, -1.0);
    float _577 = fma(_569, 2.0, -1.0);
    float _579 = _573 + _515;
    float _581 = _555 * _577;
    float _583 = floor(_349);
    float _585 = -_551;
    float _587 = _263 + _585;
    float _589 = _555 * _563;
    bool _591 = !_249;
    int _593 = _591 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].y);
    float _595 = fma(_587, 2.0, -1.0);
    float _597 = _589 * _589;
    float _599 = _253 ? as_type<float>(_593) : (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _601 = floor(_355);
    float _603 = -_571;
    float _605 = _321 + _603;
    float _607 = float(_241);
    float _609 = floor(_381);
    float _611 = -_583;
    float _613 = _349 + _611;
    float _615 = fma(_613, 2.0, -1.0);
    float _617 = floor(_391);
    float _619 = -_601;
    float _621 = _355 + _619;
    float _623 = _555 * _615;
    float _625 = floor(_433);
    float _627 = -_609;
    float _629 = _381 + _627;
    float _631 = fma(_621, 2.0, -1.0);
    float _633 = _555 * _595;
    float _635 = fma(_629, 2.0, -1.0);
    float _637 = _555 * _631;
    float _639 = floor(_437);
    float _641 = -_617;
    float _643 = _391 + _641;
    float _645 = fma(_605, 2.0, -1.0);
    float _647 = _555 * _575;
    float _649 = _555 * _635;
    float _651 = _555 * _645;
    float _653 = fma(_647, _647, _597);
    float _655 = floor(_471);
    float _657 = -_625;
    float _659 = _433 + _657;
    float _661 = _651 * _651;
    float _663 = _653 + 1.0;
    bool _665 = !_249;
    int _667 = _665 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _669 = fma(_659, 2.0, -1.0);
    float _671 = fma(_649, _649, _661);
    bool _673 = !_249;
    int _675 = _673 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].y);
    float _677 = floor(_509);
    float _679 = -_639;
    float _681 = _437 + _679;
    float _683 = fma(_643, 2.0, -1.0);
    float _685 = _555 * _669;
    float _687 = _253 ? as_type<float>(_675) : (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _689 = _555 * _683;
    bool _691 = !_249;
    int _693 = _691 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _695 = floor(_523);
    float _697 = -_655;
    float _699 = _471 + _697;
    float _701 = _253 ? as_type<float>(_667) : (*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _703 = _253 ? as_type<float>(_693) : (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _705 = fma(_699, 2.0, -1.0);
    float _707 = floor(_443);
    float _709 = -_677;
    float _711 = _509 + _709;
    float _713 = fma(_681, 2.0, -1.0);
    float _715 = fma(_711, 2.0, -1.0);
    float _717 = _555 * _713;
    bool _719 = !_249;
    int _721 = _719 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].y);
    float _723 = floor(_479);
    float _725 = -_695;
    float _727 = _523 + _725;
    float _729 = _555 * _715;
    float _731 = _253 ? as_type<float>(_721) : (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _733 = _555 * _705;
    float _735 = fma(_727, 2.0, -1.0);
    bool _737 = !_249;
    int _739 = _737 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].z);
    float _741 = -_707;
    float _743 = _443 + _741;
    float _745 = rsqrt(_663);
    float _747 = _555 * _735;
    float _749 = fma(_743, 2.0, -1.0);
    float _751 = -_723;
    float _753 = _479 + _751;
    float _755 = _555 * _749;
    float _757 = 1.0 / _565;
    float _759 = fma(_753, 2.0, -1.0);
    float _761 = _555 * _759;
    bool _763 = !_249;
    int _765 = _763 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].x);
    float _767 = _581 * _581;
    float _769 = fma(_589, _745, _557);
    float _771 = fma(_647, _745, _549);
    float _773 = _253 ? as_type<float>(_765) : (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _775 = fma(_623, _623, _767);
    bool _777 = !_249;
    int _779 = _777 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].x);
    float _781 = _637 * _637;
    float _783 = _687 * _769;
    float _785 = _775 + 1.0;
    bool _787 = !_249;
    int _789 = _787 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].x);
    float _791 = fma(_633, _633, _781);
    float _793 = _671 + 1.0;
    float _795 = _253 ? as_type<float>(_779) : (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _797 = _703 * _769;
    float _799 = rsqrt(_785);
    float _801 = _791 + 1.0;
    float _803 = _253 ? as_type<float>(_789) : (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _805 = _599 * _769;
    float _807 = _731 * _769;
    float _809 = fma(_773, _771, _783);
    float _811 = fma(_701, _771, _797);
    float _813 = fma(_795, _771, _805);
    float _815 = rsqrt(_801);
    float _817 = fma(_803, _771, _807);
    float _819 = -_745;
    float _821 = _579 + _819;
    float _823 = _253 ? as_type<float>(_739) : (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _825 = _517 * _757;
    float _827 = _531 * _757;
    float _829 = rsqrt(_793);
    float _831 = fma(_581, _799, _557);
    float _833 = fma(_623, _799, _549);
    float _835 = -_799;
    float _837 = _579 + _835;
    float _839 = _687 * _831;
    float _841 = _703 * _831;
    float _843 = _599 * _831;
    float _845 = _731 * _831;
    float _847 = fma(_637, _815, _557);
    float _849 = fma(_773, _833, _839);
    float _851 = fma(_701, _833, _841);
    float _853 = fma(_795, _833, _843);
    float _855 = fma(_803, _833, _845);
    float _857 = fma(_633, _815, _549);
    float _859 = _687 * _847;
    float _861 = fma(_651, _829, _557);
    float _863 = _703 * _847;
    float _865 = _599 * _847;
    float _867 = fma(_649, _829, _549);
    float _869 = _687 * _861;
    float _871 = _703 * _861;
    float _873 = _599 * _861;
    float _875 = _731 * _861;
    float _877 = _731 * _847;
    float _879 = fma(_773, _857, _859);
    float _881 = fma(_701, _857, _863);
    float _883 = fma(_795, _857, _865);
    float _885 = fma(_773, _867, _869);
    float _887 = fma(_701, _867, _871);
    float _889 = fma(_795, _867, _873);
    float _891 = fma(_803, _867, _875);
    float _893 = fma(_803, _857, _877);
    float _895 = rint(_607);
    float _897 = precise::max(_895, 0.0);
    uint _900 = uint(_897);
    uint _902 = clamp(_900, 0u, 65535u);
    bool _904 = !_249;
    int _906 = _904 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].z);
    bool _908 = !_249;
    int _910 = _908 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].z);
    bool _912 = !_249;
    int _914 = _912 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].z);
    float _916 = _253 ? as_type<float>(_906) : (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _918 = _253 ? as_type<float>(_910) : (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _920 = _253 ? as_type<float>(_914) : (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _922 = fma(_916, _821, _811);
    float _924 = fma(_918, _821, _813);
    float _926 = fma(_823, _821, _817);
    float _928 = fma(_920, _821, _809);
    float _930 = -_815;
    float _932 = _579 + _930;
    float _934 = fma(_918, _837, _853);
    float _936 = fma(_916, _837, _851);
    float _938 = fma(_823, _837, _855);
    bool _940 = !_249;
    int _942 = _940 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].w);
    float _944 = fma(_920, _932, _879);
    float _946 = fma(_916, _932, _881);
    float _948 = fma(_918, _932, _883);
    float _950 = fma(_823, _932, _893);
    float _952 = _253 ? as_type<float>(_942) : (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _954 = _685 * _685;
    float _956 = fma(_920, _837, _849);
    float _958 = -_829;
    float _960 = _579 + _958;
    float _962 = fma(_689, _689, _954);
    float _964 = _952 + _926;
    float _966 = fma(_920, _960, _885);
    float _968 = _962 + 1.0;
    float _970 = fma(_823, _960, _891);
    bool _972 = !_249;
    int _974 = _972 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].w);
    float _976 = 1.0 / _964;
    float _978 = fma(_916, _960, _887);
    float _980 = fma(_918, _960, _889);
    bool _982 = !_249;
    int _984 = _982 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].w);
    bool _986 = !_249;
    int _988 = _986 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].w);
    float _990 = rsqrt(_968);
    float _992 = _253 ? as_type<float>(_974) : (*spvDescriptorSet0.fp_c4)._m0[9].w;
    float _994 = _253 ? as_type<float>(_984) : (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _996 = _253 ? as_type<float>(_988) : (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _998 = _992 + _928;
    float _1000 = _992 + _956;
    float _1002 = _994 + _922;
    float _1004 = _994 + _936;
    float _1006 = _996 + _924;
    float _1008 = _998 * _976;
    float _1010 = _1002 * _976;
    float _1012 = _996 + _934;
    float _1014 = _1006 * _976;
    float _1016 = fma(_685, _990, _557);
    float _1018 = fma(_689, _990, _549);
    float _1020 = _703 * _1016;
    float _1022 = _687 * _1016;
    float _1024 = _599 * _1016;
    float _1026 = _731 * _1016;
    float _1028 = fma(_701, _1018, _1020);
    float _1030 = _733 * _733;
    float _1032 = fma(_773, _1018, _1022);
    float _1034 = fma(_795, _1018, _1024);
    float _1036 = fma(_803, _1018, _1026);
    float _1038 = fma(_717, _717, _1030);
    float _1040 = _952 + _938;
    float _1042 = _1038 + 1.0;
    float _1044 = -_990;
    float _1046 = _579 + _1044;
    float _1048 = 1.0 / _1040;
    float _1050 = fma(_920, _1046, _1032);
    float _1052 = fma(_916, _1046, _1028);
    float _1054 = fma(_918, _1046, _1034);
    float _1056 = fma(_823, _1046, _1036);
    float _1058 = rsqrt(_1042);
    float _1060 = _1000 * _1048;
    float _1062 = _1004 * _1048;
    float _1064 = _1012 * _1048;
    float _1066 = _505 * _757;
    float _1068 = fma(_733, _1058, _557);
    float _1070 = fma(_717, _1058, _549);
    float _1072 = -_1058;
    float _1074 = _579 + _1072;
    float _1076 = _687 * _1068;
    float _1078 = _703 * _1068;
    float _1080 = _599 * _1068;
    float _1082 = _731 * _1068;
    float _1084 = fma(_773, _1070, _1076);
    float _1086 = fma(_701, _1070, _1078);
    float _1088 = fma(_795, _1070, _1080);
    float _1090 = fma(_803, _1070, _1082);
    float _1092 = fma(_920, _1074, _1084);
    float _1094 = fma(_916, _1074, _1086);
    float _1096 = _747 * _747;
    float _1098 = fma(_918, _1074, _1088);
    float _1100 = fma(_823, _1074, _1090);
    float _1102 = fma(_729, _729, _1096);
    float _1104 = _761 * _761;
    float _1106 = _1102 + 1.0;
    float _1108 = fma(_755, _755, _1104);
    float _1110 = rsqrt(_1106);
    float _1112 = _1108 + 1.0;
    float _1114 = rsqrt(_1112);
    float _1116 = fma(_747, _1110, _557);
    float _1118 = fma(_729, _1110, _549);
    float _1120 = -_1110;
    float _1122 = _579 + _1120;
    float _1124 = _703 * _1116;
    float _1126 = fma(_761, _1114, _557);
    float _1128 = fma(_755, _1114, _549);
    float3 _7222 = float3(_827, _825, float(int(_902)));
    float3 _7226 = select(_7222, float3(0.0), isnan(_7222));
    float _1130 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7226.xy, uint(rint(_7226.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7226.xy, uint(rint(_7226.z))).x;
    float _1132 = _687 * _1116;
    float _1134 = -_1114;
    float _1136 = _579 + _1134;
    float _1138 = _687 * _1126;
    float _1140 = _599 * _1116;
    float _1142 = _731 * _1116;
    float _1144 = _703 * _1126;
    float _1146 = _599 * _1126;
    float _1148 = _731 * _1126;
    float _1150 = fma(_773, _1118, _1132);
    float _1152 = fma(_773, _1128, _1138);
    float _1154 = fma(_701, _1118, _1124);
    float _1156 = fma(_795, _1118, _1140);
    float _1158 = _952 + _950;
    float _1160 = fma(_803, _1118, _1142);
    float _1162 = fma(_701, _1128, _1144);
    float _1164 = fma(_795, _1128, _1146);
    float _1166 = _952 + _970;
    float _1168 = fma(_803, _1128, _1148);
    float _1170 = fma(_920, _1122, _1150);
    float _1172 = fma(_920, _1136, _1152);
    float _1174 = fma(_916, _1122, _1154);
    float _1176 = fma(_918, _1122, _1156);
    float _1178 = fma(_823, _1122, _1160);
    float _1180 = fma(_918, _1136, _1164);
    float _1182 = fma(_823, _1136, _1168);
    float _1184 = 1.0 / _1166;
    float _1186 = _952 + _1056;
    float _1188 = _952 + _1178;
    float _1190 = _952 + _1182;
    float _1192 = _952 + _1100;
    float _1194 = fma(_916, _1136, _1162);
    float _1196 = _992 + _944;
    float _1198 = _994 + _946;
    float _1200 = 1.0 / _1158;
    float _1202 = _994 + _978;
    float _1204 = _994 + _1052;
    float _1206 = _994 + _1094;
    float _1208 = _994 + _1174;
    float _1210 = _994 + _1194;
    float _1212 = _992 + _966;
    float _1214 = _996 + _980;
    float _1216 = 1.0 / _1186;
    float _1218 = _996 + _948;
    float _1220 = _1202 * _1184;
    float _1222 = _992 + _1050;
    float _1224 = _992 + _1092;
    float _1226 = _992 + _1170;
    float _1228 = _996 + _1054;
    float _1230 = _996 + _1098;
    float _1232 = 1.0 / _1190;
    float _1234 = _996 + _1176;
    float _1236 = _1212 * _1184;
    float _1238 = _1214 * _1184;
    float _1240 = _992 + _1172;
    float _1242 = _996 + _1180;
    float _1244 = _1218 * _1200;
    float _1246 = 1.0 / _1188;
    float _1248 = _1196 * _1200;
    float _1250 = _1198 * _1200;
    float _1252 = _1204 * _1216;
    float _1254 = fma(_1008, 0.5, 0.5);
    float _1256 = fma(_1014, 0.5, 0.5);
    float _1258 = _1222 * _1216;
    float _1260 = 1.0 / _1192;
    float _1262 = _1240 * _1232;
    float _1264 = _1210 * _1232;
    float _1266 = _1242 * _1232;
    float _1268 = fma(_1010, -0.5, 0.5);
    float _1270 = _1228 * _1216;
    float _1272 = fma(_1060, 0.5, 0.5);
    float _1274 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.066666670143604278564453125;
    float _1276 = _1226 * _1246;
    float _1278 = fma(_1244, 0.5, 0.5);
    float _1280 = fma(_1236, 0.5, 0.5);
    float _1282 = fma(_1252, -0.5, 0.5);
    float _1284 = _1208 * _1246;
    float _1286 = -_1254;
    float _1288 = _827 + _1286;
    float _1290 = -_1268;
    float _1292 = _825 + _1290;
    float _1294 = _1234 * _1246;
    float _1296 = _1224 * _1260;
    float _1298 = _1206 * _1260;
    float _1300 = _1230 * _1260;
    float _1302 = -_1256;
    float _1304 = _1066 + _1302;
    float _1306 = fma(_1062, -0.5, 0.5);
    float _1308 = fma(_1064, 0.5, 0.5);
    float _1310 = fma(_1250, -0.5, 0.5);
    float _1312 = fma(_1270, 0.5, 0.5);
    float _1314 = _1288 * _1274;
    float _1316 = _1292 * _1274;
    float _1318 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.066666670143604278564453125;
    float _1320 = -_1272;
    float _1322 = _827 + _1320;
    float _1324 = fma(_1248, 0.5, 0.5);
    float _1326 = fma(_1220, -0.5, 0.5);
    float _1328 = fma(_1238, 0.5, 0.5);
    float _1330 = fma(_1258, 0.5, 0.5);
    float _1332 = fma(_1296, 0.5, 0.5);
    float _1334 = fma(_1298, -0.5, 0.5);
    float _1336 = fma(_1300, 0.5, 0.5);
    float _1338 = fma(_1276, 0.5, 0.5);
    float _1340 = fma(_1284, -0.5, 0.5);
    float _1342 = fma(_1294, 0.5, 0.5);
    float _1344 = fma(_1262, 0.5, 0.5);
    float _1346 = fma(_1264, -0.5, 0.5);
    float _1348 = _1304 * _1274;
    float _1350 = fma(_1266, 0.5, 0.5);
    float _1352 = -_1306;
    float _1354 = _825 + _1352;
    float _1356 = _1322 * _1318;
    float _1358 = _1348 * 1.5;
    float _1360 = -_1308;
    float _1362 = _1066 + _1360;
    float _1364 = _1354 * _1318;
    float _1366 = -_1280;
    float _1368 = _827 + _1366;
    float _1370 = -_1326;
    float _1372 = _825 + _1370;
    float _1374 = _1362 * _1318;
    float _1376 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.066666670143604278564453125;
    float _1378 = -_1328;
    float _1380 = _1066 + _1378;
    float _1382 = _1368 * _1376;
    float _1384 = _1372 * _1376;
    float _1386 = _1380 * _1376;
    float _1388 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.066666670143604278564453125;
    float _1390 = -_1324;
    float _1392 = _827 + _1390;
    float _1394 = -_1310;
    float _1396 = _825 + _1394;
    float _1398 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.066666670143604278564453125;
    float _1400 = -_1330;
    float _1402 = _827 + _1400;
    float _1404 = -_1282;
    float _1406 = _825 + _1404;
    float _1408 = -_1278;
    float _1410 = _1066 + _1408;
    float _1412 = -_1312;
    float _1414 = _1066 + _1412;
    float _1416 = _1392 * _1388;
    float _1418 = _1396 * _1388;
    float _1420 = _1402 * _1398;
    float _1422 = _1406 * _1398;
    float _1424 = _1410 * _1388;
    float _1426 = _1414 * _1398;
    float _1428 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.066666670143604278564453125;
    float _1430 = -_1332;
    float _1432 = _827 + _1430;
    float _1434 = -_1334;
    float _1436 = _825 + _1434;
    float _1438 = -_1336;
    float _1440 = _1066 + _1438;
    float _1442 = _1432 * _1428;
    float _1444 = _1436 * _1428;
    float _1446 = _1440 * _1428;
    float _1448 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.066666670143604278564453125;
    float _1450 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.066666670143604278564453125;
    float _1452 = -_1338;
    float _1454 = _827 + _1452;
    float _1456 = -_1340;
    float _1458 = _825 + _1456;
    float _1460 = -_1342;
    float _1462 = _1066 + _1460;
    float _1464 = -_1344;
    float _1466 = _827 + _1464;
    float _1468 = -_1346;
    float _1470 = _825 + _1468;
    float _1472 = -_1350;
    float _1474 = _1066 + _1472;
    float _1476 = _1454 * _1448;
    float _1478 = _1458 * _1448;
    float _1480 = _1462 * _1448;
    float _1482 = _1466 * _1450;
    float _1484 = _1470 * _1450;
    float _1486 = _1474 * _1450;
    float _1488 = -_1066;
    float _1490 = _1488 + _1130;
    float _1492 = _1490 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1494 = precise::max(_1492, _1358);
    float _1496 = precise::min(0.0, _1494);
    bool _1498 = _1496 != _1492;
    bool _1500 = isnan(_1496);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan(_1492);
    bool _1506 = _1502 || _1504;
    bool _1508 = !_1506;
    float _1960;
    if (!_1508)
    {
        float _1510 = _825 + _1316;
        float _1512 = _827 + _1314;
        float3 _7771 = float3(_1512, _1510, float(int(_902)));
        float3 _7773 = select(_7771, float3(0.0), isnan(_7771));
        float _1514 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7773.xy, uint(rint(_7773.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7773.xy, uint(rint(_7773.z))).x;
        float _1516 = _1066 + _1348;
        float _1518 = _1348 * 3.0;
        float _1520 = -_1516;
        float _1522 = _1520 + _1514;
        float _1524 = _1522 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1526 = precise::max(_1524, _1518);
        float _1528 = precise::min(0.0, _1526);
        bool _1530 = _1528 != _1524;
        bool _1532 = isnan(_1528);
        bool _1534 = _1530 || _1532;
        bool _1536 = isnan(_1524);
        bool _1538 = _1534 || _1536;
        bool _1540 = !_1538;
        if (!_1540)
        {
            float _1542 = fma(_1316, 2.0, _825);
            float _1544 = fma(_1314, 2.0, _827);
            float3 _7826 = float3(_1544, _1542, float(int(_902)));
            float3 _7828 = select(_7826, float3(0.0), isnan(_7826));
            float _1546 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7828.xy, uint(rint(_7828.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7828.xy, uint(rint(_7828.z))).x;
            float _1548 = fma(_1348, 2.0, _1066);
            float _1550 = _1348 * 4.5;
            float _1552 = -_1548;
            float _1554 = _1552 + _1546;
            float _1556 = _1554 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1558 = precise::max(_1556, _1550);
            float _1560 = precise::min(0.0, _1558);
            bool _1562 = _1560 != _1556;
            bool _1564 = isnan(_1560);
            bool _1566 = _1562 || _1564;
            bool _1568 = isnan(_1556);
            bool _1570 = _1566 || _1568;
            bool _1572 = !_1570;
            if (!_1572)
            {
                float _1574 = fma(_1316, 3.0, _825);
                float _1576 = fma(_1314, 3.0, _827);
                float3 _7881 = float3(_1576, _1574, float(int(_902)));
                float3 _7883 = select(_7881, float3(0.0), isnan(_7881));
                float _1578 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7883.xy, uint(rint(_7883.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7883.xy, uint(rint(_7883.z))).x;
                float _1580 = fma(_1348, 3.0, _1066);
                float _1582 = _1348 * 6.0;
                float _1584 = -_1580;
                float _1586 = _1584 + _1578;
                float _1588 = _1586 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _1590 = precise::max(_1588, _1582);
                float _1592 = precise::min(0.0, _1590);
                bool _1594 = _1592 != _1588;
                bool _1596 = isnan(_1592);
                bool _1598 = _1594 || _1596;
                bool _1600 = isnan(_1588);
                bool _1602 = _1598 || _1600;
                bool _1604 = !_1602;
                if (!_1604)
                {
                    float _1606 = fma(_1316, 4.0, _825);
                    float _1608 = fma(_1314, 4.0, _827);
                    float3 _7937 = float3(_1608, _1606, float(int(_902)));
                    float3 _7939 = select(_7937, float3(0.0), isnan(_7937));
                    float _1610 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7939.xy, uint(rint(_7939.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7939.xy, uint(rint(_7939.z))).x;
                    float _1612 = fma(_1348, 4.0, _1066);
                    float _1614 = _1348 * 7.5;
                    float _1616 = -_1612;
                    float _1618 = _1616 + _1610;
                    float _1620 = _1618 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1622 = precise::max(_1620, _1614);
                    float _1624 = precise::min(0.0, _1622);
                    bool _1626 = _1624 != _1620;
                    bool _1628 = isnan(_1624);
                    bool _1630 = _1626 || _1628;
                    bool _1632 = isnan(_1620);
                    bool _1634 = _1630 || _1632;
                    bool _1636 = !_1634;
                    if (!_1636)
                    {
                        float _1638 = fma(_1316, 5.0, _825);
                        float _1640 = fma(_1314, 5.0, _827);
                        float3 _7993 = float3(_1640, _1638, float(int(_902)));
                        float3 _7995 = select(_7993, float3(0.0), isnan(_7993));
                        float _1642 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7995.xy, uint(rint(_7995.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7995.xy, uint(rint(_7995.z))).x;
                        float _1644 = fma(_1348, 5.0, _1066);
                        float _1646 = _1348 * 9.0;
                        float _1648 = -_1644;
                        float _1650 = _1648 + _1642;
                        float _1652 = _1650 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _1654 = precise::max(_1652, _1646);
                        float _1656 = precise::min(0.0, _1654);
                        bool _1658 = _1656 != _1652;
                        bool _1660 = isnan(_1656);
                        bool _1662 = _1658 || _1660;
                        bool _1664 = isnan(_1652);
                        bool _1666 = _1662 || _1664;
                        bool _1668 = !_1666;
                        if (!_1668)
                        {
                            float _1670 = fma(_1316, 6.0, _825);
                            float _1672 = fma(_1314, 6.0, _827);
                            float3 _8048 = float3(_1672, _1670, float(int(_902)));
                            float3 _8050 = select(_8048, float3(0.0), isnan(_8048));
                            float _1674 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8050.xy, uint(rint(_8050.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8050.xy, uint(rint(_8050.z))).x;
                            float _1676 = fma(_1348, 6.0, _1066);
                            float _1678 = _1348 * 10.5;
                            float _1680 = -_1676;
                            float _1682 = _1680 + _1674;
                            float _1684 = _1682 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _1686 = precise::max(_1684, _1678);
                            float _1688 = precise::min(0.0, _1686);
                            bool _1690 = _1688 != _1684;
                            bool _1692 = isnan(_1688);
                            bool _1694 = _1690 || _1692;
                            bool _1696 = isnan(_1684);
                            bool _1698 = _1694 || _1696;
                            bool _1700 = !_1698;
                            if (!_1700)
                            {
                                float _1702 = fma(_1316, 7.0, _825);
                                float _1704 = fma(_1314, 7.0, _827);
                                float3 _8104 = float3(_1704, _1702, float(int(_902)));
                                float3 _8106 = select(_8104, float3(0.0), isnan(_8104));
                                float _1706 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8106.xy, uint(rint(_8106.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8106.xy, uint(rint(_8106.z))).x;
                                float _1708 = fma(_1348, 7.0, _1066);
                                float _1710 = _1348 * 12.0;
                                float _1712 = -_1708;
                                float _1714 = _1712 + _1706;
                                float _1716 = _1714 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _1718 = precise::max(_1716, _1710);
                                float _1720 = precise::min(0.0, _1718);
                                bool _1722 = _1720 != _1716;
                                bool _1724 = isnan(_1720);
                                bool _1726 = _1722 || _1724;
                                bool _1728 = isnan(_1716);
                                bool _1730 = _1726 || _1728;
                                bool _1732 = !_1730;
                                if (!_1732)
                                {
                                    float _1734 = fma(_1316, 8.0, _825);
                                    float _1736 = fma(_1314, 8.0, _827);
                                    float3 _8160 = float3(_1736, _1734, float(int(_902)));
                                    float3 _8162 = select(_8160, float3(0.0), isnan(_8160));
                                    float _1738 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8162.xy, uint(rint(_8162.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8162.xy, uint(rint(_8162.z))).x;
                                    float _1740 = fma(_1348, 8.0, _1066);
                                    float _1742 = _1348 * 13.5;
                                    float _1744 = -_1740;
                                    float _1746 = _1744 + _1738;
                                    float _1748 = _1746 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _1750 = precise::max(_1748, _1742);
                                    float _1752 = precise::min(0.0, _1750);
                                    bool _1754 = _1752 != _1748;
                                    bool _1756 = isnan(_1752);
                                    bool _1758 = _1754 || _1756;
                                    bool _1760 = isnan(_1748);
                                    bool _1762 = _1758 || _1760;
                                    bool _1764 = !_1762;
                                    if (!_1764)
                                    {
                                        float _1766 = fma(_1316, 9.0, _825);
                                        float _1768 = fma(_1314, 9.0, _827);
                                        float3 _8215 = float3(_1768, _1766, float(int(_902)));
                                        float3 _8217 = select(_8215, float3(0.0), isnan(_8215));
                                        float _1770 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8217.xy, uint(rint(_8217.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8217.xy, uint(rint(_8217.z))).x;
                                        float _1772 = fma(_1348, 9.0, _1066);
                                        float _1774 = _1348 * 15.0;
                                        float _1776 = -_1772;
                                        float _1778 = _1776 + _1770;
                                        float _1780 = _1778 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _1782 = precise::max(_1780, _1774);
                                        float _1784 = precise::min(0.0, _1782);
                                        bool _1786 = _1784 != _1780;
                                        bool _1788 = isnan(_1784);
                                        bool _1790 = _1786 || _1788;
                                        bool _1792 = isnan(_1780);
                                        bool _1794 = _1790 || _1792;
                                        bool _1796 = !_1794;
                                        if (!_1796)
                                        {
                                            float _1798 = fma(_1316, 10.0, _825);
                                            float _1800 = fma(_1314, 10.0, _827);
                                            float3 _8271 = float3(_1800, _1798, float(int(_902)));
                                            float3 _8273 = select(_8271, float3(0.0), isnan(_8271));
                                            float _1802 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8273.xy, uint(rint(_8273.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8273.xy, uint(rint(_8273.z))).x;
                                            float _1804 = fma(_1348, 10.0, _1066);
                                            float _1806 = _1348 * 16.5;
                                            float _1808 = -_1804;
                                            float _1810 = _1808 + _1802;
                                            float _1812 = _1810 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _1814 = precise::max(_1812, _1806);
                                            float _1816 = precise::min(0.0, _1814);
                                            bool _1818 = _1816 != _1812;
                                            bool _1820 = isnan(_1816);
                                            bool _1822 = _1818 || _1820;
                                            bool _1824 = isnan(_1812);
                                            bool _1826 = _1822 || _1824;
                                            bool _1828 = !_1826;
                                            if (!_1828)
                                            {
                                                float _1830 = fma(_1316, 11.0, _825);
                                                float _1832 = fma(_1314, 11.0, _827);
                                                float3 _8327 = float3(_1832, _1830, float(int(_902)));
                                                float3 _8329 = select(_8327, float3(0.0), isnan(_8327));
                                                float _1834 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8329.xy, uint(rint(_8329.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8329.xy, uint(rint(_8329.z))).x;
                                                float _1836 = fma(_1348, 11.0, _1066);
                                                float _1838 = _1348 * 18.0;
                                                float _1840 = -_1836;
                                                float _1842 = _1840 + _1834;
                                                float _1844 = _1842 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _1846 = precise::max(_1844, _1838);
                                                float _1848 = precise::min(0.0, _1846);
                                                bool _1850 = _1848 != _1844;
                                                bool _1852 = isnan(_1848);
                                                bool _1854 = _1850 || _1852;
                                                bool _1856 = isnan(_1844);
                                                bool _1858 = _1854 || _1856;
                                                bool _1860 = !_1858;
                                                if (!_1860)
                                                {
                                                    float _1862 = fma(_1316, 12.0, _825);
                                                    float _1864 = fma(_1314, 12.0, _827);
                                                    float3 _8382 = float3(_1864, _1862, float(int(_902)));
                                                    float3 _8384 = select(_8382, float3(0.0), isnan(_8382));
                                                    float _1866 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8384.xy, uint(rint(_8384.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8384.xy, uint(rint(_8384.z))).x;
                                                    float _1868 = fma(_1348, 12.0, _1066);
                                                    float _1870 = _1348 * 19.5;
                                                    float _1872 = -_1868;
                                                    float _1874 = _1872 + _1866;
                                                    float _1876 = _1874 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _1878 = precise::max(_1876, _1870);
                                                    float _1880 = precise::min(0.0, _1878);
                                                    bool _1882 = _1880 != _1876;
                                                    bool _1884 = isnan(_1880);
                                                    bool _1886 = _1882 || _1884;
                                                    bool _1888 = isnan(_1876);
                                                    bool _1890 = _1886 || _1888;
                                                    bool _1892 = !_1890;
                                                    if (!_1892)
                                                    {
                                                        float _1894 = fma(_1316, 13.0, _825);
                                                        float _1896 = fma(_1314, 13.0, _827);
                                                        float3 _8438 = float3(_1896, _1894, float(int(_902)));
                                                        float3 _8440 = select(_8438, float3(0.0), isnan(_8438));
                                                        float _1898 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8440.xy, uint(rint(_8440.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8440.xy, uint(rint(_8440.z))).x;
                                                        float _1900 = fma(_1348, 13.0, _1066);
                                                        float _1902 = fma(_1348, 21.0, -1.0);
                                                        float _1904 = -_1900;
                                                        float _1906 = _1904 + _1898;
                                                        float _1908 = _1906 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _1910 = precise::max(_1908, _1902);
                                                        float _1912 = precise::min(0.0, _1910);
                                                        bool _1914 = _1912 != _1908;
                                                        bool _1916 = isnan(_1912);
                                                        bool _1918 = _1914 || _1916;
                                                        bool _1920 = isnan(_1908);
                                                        bool _1922 = _1918 || _1920;
                                                        bool _1924 = !_1922;
                                                        if (!_1924)
                                                        {
                                                            float _1926 = fma(_1314, 14.0, _827);
                                                            float _1928 = fma(_1316, 14.0, _825);
                                                            float3 _8494 = float3(_1926, _1928, float(int(_902)));
                                                            float3 _8496 = select(_8494, float3(0.0), isnan(_8494));
                                                            float _1930 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8496.xy, uint(rint(_8496.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8496.xy, uint(rint(_8496.z))).x;
                                                            float _1932 = fma(_1348, 14.0, _1066);
                                                            float _1934 = fma(_1348, 22.5, -1.0);
                                                            float _1936 = -_1932;
                                                            float _1938 = _1936 + _1930;
                                                            float _1940 = _1938 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _1942 = precise::max(_1940, _1934);
                                                            float _1944 = precise::min(0.0, _1942);
                                                            bool _1946 = _1944 != _1940;
                                                            bool _1948 = isnan(_1944);
                                                            bool _1950 = _1946 || _1948;
                                                            bool _1952 = isnan(_1940);
                                                            bool _1954 = _1950 || _1952;
                                                            float _1956 = _1944;
                                                            if (_1954)
                                                            {
                                                                _1956 = 0.0;
                                                            }
                                                            float _1958 = _1956;
                                                            _1960 = _1958;
                                                            _1962 = _1954;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_1962)
    {
        _1960 = 1.0;
    }
    _1962 = false;
    float _1964 = _1960;
    float _1966 = _1374 * 1.5;
    float _1968 = precise::max(_1492, _1966);
    float _1970 = precise::min(0.0, _1968);
    bool _1972 = _1970 != _1492;
    bool _1974 = isnan(_1970);
    bool _1976 = _1972 || _1974;
    bool _1978 = isnan(_1492);
    bool _1980 = _1976 || _1978;
    bool _1982 = !_1980;
    float _1984 = _1964;
    if (!_1982)
    {
        float _1986 = _827 + _1356;
        float _1988 = _825 + _1364;
        float3 _8596 = float3(_1986, _1988, float(int(_902)));
        float3 _8598 = select(_8596, float3(0.0), isnan(_8596));
        float _1990 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8598.xy, uint(rint(_8598.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8598.xy, uint(rint(_8598.z))).x;
        float _1992 = _1066 + _1374;
        float _1994 = _1374 * 3.0;
        float _1996 = -_1992;
        float _1998 = _1996 + _1990;
        float _2000 = _1998 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _2002 = precise::max(_2000, _1994);
        float _2004 = precise::min(0.0, _2002);
        bool _2006 = _2004 != _2000;
        bool _2008 = isnan(_2004);
        bool _2010 = _2006 || _2008;
        bool _2012 = isnan(_2000);
        bool _2014 = _2010 || _2012;
        bool _2016 = !_2014;
        if (!_2016)
        {
            float _2018 = fma(_1356, 2.0, _827);
            float _2020 = fma(_1364, 2.0, _825);
            float3 _8650 = float3(_2018, _2020, float(int(_902)));
            float3 _8652 = select(_8650, float3(0.0), isnan(_8650));
            float _2022 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8652.xy, uint(rint(_8652.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8652.xy, uint(rint(_8652.z))).x;
            float _2024 = fma(_1374, 2.0, _1066);
            float _2026 = _1374 * 4.5;
            float _2028 = -_2024;
            float _2030 = _2028 + _2022;
            float _2032 = _2030 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _2034 = precise::max(_2032, _2026);
            float _2036 = precise::min(0.0, _2034);
            bool _2038 = _2036 != _2032;
            bool _2040 = isnan(_2036);
            bool _2042 = _2038 || _2040;
            bool _2044 = isnan(_2032);
            bool _2046 = _2042 || _2044;
            bool _2048 = !_2046;
            if (!_2048)
            {
                float _2050 = fma(_1356, 3.0, _827);
                float _2052 = fma(_1364, 3.0, _825);
                float3 _8704 = float3(_2050, _2052, float(int(_902)));
                float3 _8706 = select(_8704, float3(0.0), isnan(_8704));
                float _2054 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8706.xy, uint(rint(_8706.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8706.xy, uint(rint(_8706.z))).x;
                float _2056 = fma(_1374, 3.0, _1066);
                float _2058 = _1374 * 6.0;
                float _2060 = -_2056;
                float _2062 = _2060 + _2054;
                float _2064 = _2062 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _2066 = precise::max(_2064, _2058);
                float _2068 = precise::min(0.0, _2066);
                bool _2070 = _2068 != _2064;
                bool _2072 = isnan(_2068);
                bool _2074 = _2070 || _2072;
                bool _2076 = isnan(_2064);
                bool _2078 = _2074 || _2076;
                bool _2080 = !_2078;
                if (!_2080)
                {
                    float _2082 = fma(_1356, 4.0, _827);
                    float _2084 = fma(_1364, 4.0, _825);
                    float3 _8758 = float3(_2082, _2084, float(int(_902)));
                    float3 _8760 = select(_8758, float3(0.0), isnan(_8758));
                    float _2086 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8760.xy, uint(rint(_8760.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8760.xy, uint(rint(_8760.z))).x;
                    float _2088 = fma(_1374, 4.0, _1066);
                    float _2090 = _1374 * 7.5;
                    float _2092 = -_2088;
                    float _2094 = _2092 + _2086;
                    float _2096 = _2094 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _2098 = precise::max(_2096, _2090);
                    float _2100 = precise::min(0.0, _2098);
                    bool _2102 = _2100 != _2096;
                    bool _2104 = isnan(_2100);
                    bool _2106 = _2102 || _2104;
                    bool _2108 = isnan(_2096);
                    bool _2110 = _2106 || _2108;
                    bool _2112 = !_2110;
                    if (!_2112)
                    {
                        float _2114 = fma(_1356, 5.0, _827);
                        float _2116 = fma(_1364, 5.0, _825);
                        float3 _8812 = float3(_2114, _2116, float(int(_902)));
                        float3 _8814 = select(_8812, float3(0.0), isnan(_8812));
                        float _2118 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8814.xy, uint(rint(_8814.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8814.xy, uint(rint(_8814.z))).x;
                        float _2120 = fma(_1374, 5.0, _1066);
                        float _2122 = _1374 * 9.0;
                        float _2124 = -_2120;
                        float _2126 = _2124 + _2118;
                        float _2128 = _2126 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _2130 = precise::max(_2128, _2122);
                        float _2132 = precise::min(0.0, _2130);
                        bool _2134 = _2132 != _2128;
                        bool _2136 = isnan(_2132);
                        bool _2138 = _2134 || _2136;
                        bool _2140 = isnan(_2128);
                        bool _2142 = _2138 || _2140;
                        bool _2144 = !_2142;
                        if (!_2144)
                        {
                            float _2146 = fma(_1356, 6.0, _827);
                            float _2148 = fma(_1364, 6.0, _825);
                            float3 _8866 = float3(_2146, _2148, float(int(_902)));
                            float3 _8868 = select(_8866, float3(0.0), isnan(_8866));
                            float _2150 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8868.xy, uint(rint(_8868.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8868.xy, uint(rint(_8868.z))).x;
                            float _2152 = fma(_1374, 6.0, _1066);
                            float _2154 = _1374 * 10.5;
                            float _2156 = -_2152;
                            float _2158 = _2156 + _2150;
                            float _2160 = _2158 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _2162 = precise::max(_2160, _2154);
                            float _2164 = precise::min(0.0, _2162);
                            bool _2166 = _2164 != _2160;
                            bool _2168 = isnan(_2164);
                            bool _2170 = _2166 || _2168;
                            bool _2172 = isnan(_2160);
                            bool _2174 = _2170 || _2172;
                            bool _2176 = !_2174;
                            if (!_2176)
                            {
                                float _2178 = fma(_1356, 7.0, _827);
                                float _2180 = fma(_1364, 7.0, _825);
                                float3 _8920 = float3(_2178, _2180, float(int(_902)));
                                float3 _8922 = select(_8920, float3(0.0), isnan(_8920));
                                float _2182 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8922.xy, uint(rint(_8922.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8922.xy, uint(rint(_8922.z))).x;
                                float _2184 = fma(_1374, 7.0, _1066);
                                float _2186 = _1374 * 12.0;
                                float _2188 = -_2184;
                                float _2190 = _2188 + _2182;
                                float _2192 = _2190 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _2194 = precise::max(_2192, _2186);
                                float _2196 = precise::min(0.0, _2194);
                                bool _2198 = _2196 != _2192;
                                bool _2200 = isnan(_2196);
                                bool _2202 = _2198 || _2200;
                                bool _2204 = isnan(_2192);
                                bool _2206 = _2202 || _2204;
                                bool _2208 = !_2206;
                                if (!_2208)
                                {
                                    float _2210 = fma(_1356, 8.0, _827);
                                    float _2212 = fma(_1364, 8.0, _825);
                                    float3 _8974 = float3(_2210, _2212, float(int(_902)));
                                    float3 _8976 = select(_8974, float3(0.0), isnan(_8974));
                                    float _2214 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8976.xy, uint(rint(_8976.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8976.xy, uint(rint(_8976.z))).x;
                                    float _2216 = fma(_1374, 8.0, _1066);
                                    float _2218 = _1374 * 13.5;
                                    float _2220 = -_2216;
                                    float _2222 = _2220 + _2214;
                                    float _2224 = _2222 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _2226 = precise::max(_2224, _2218);
                                    float _2228 = precise::min(0.0, _2226);
                                    bool _2230 = _2228 != _2224;
                                    bool _2232 = isnan(_2228);
                                    bool _2234 = _2230 || _2232;
                                    bool _2236 = isnan(_2224);
                                    bool _2238 = _2234 || _2236;
                                    bool _2240 = !_2238;
                                    if (!_2240)
                                    {
                                        float _2242 = fma(_1356, 9.0, _827);
                                        float _2244 = fma(_1364, 9.0, _825);
                                        float3 _9028 = float3(_2242, _2244, float(int(_902)));
                                        float3 _9030 = select(_9028, float3(0.0), isnan(_9028));
                                        float _2246 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9030.xy, uint(rint(_9030.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9030.xy, uint(rint(_9030.z))).x;
                                        float _2248 = fma(_1374, 9.0, _1066);
                                        float _2250 = _1374 * 15.0;
                                        float _2252 = -_2248;
                                        float _2254 = _2252 + _2246;
                                        float _2256 = _2254 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _2258 = precise::max(_2256, _2250);
                                        float _2260 = precise::min(0.0, _2258);
                                        bool _2262 = _2260 != _2256;
                                        bool _2264 = isnan(_2260);
                                        bool _2266 = _2262 || _2264;
                                        bool _2268 = isnan(_2256);
                                        bool _2270 = _2266 || _2268;
                                        bool _2272 = !_2270;
                                        if (!_2272)
                                        {
                                            float _2274 = fma(_1356, 10.0, _827);
                                            float _2276 = fma(_1364, 10.0, _825);
                                            float3 _9082 = float3(_2274, _2276, float(int(_902)));
                                            float3 _9084 = select(_9082, float3(0.0), isnan(_9082));
                                            float _2278 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9084.xy, uint(rint(_9084.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9084.xy, uint(rint(_9084.z))).x;
                                            float _2280 = fma(_1374, 10.0, _1066);
                                            float _2282 = _1374 * 16.5;
                                            float _2284 = -_2280;
                                            float _2286 = _2284 + _2278;
                                            float _2288 = _2286 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _2290 = precise::max(_2288, _2282);
                                            float _2292 = precise::min(0.0, _2290);
                                            bool _2294 = _2292 != _2288;
                                            bool _2296 = isnan(_2292);
                                            bool _2298 = _2294 || _2296;
                                            bool _2300 = isnan(_2288);
                                            bool _2302 = _2298 || _2300;
                                            bool _2304 = !_2302;
                                            if (!_2304)
                                            {
                                                float _2306 = fma(_1356, 11.0, _827);
                                                float _2308 = fma(_1364, 11.0, _825);
                                                float3 _9136 = float3(_2306, _2308, float(int(_902)));
                                                float3 _9138 = select(_9136, float3(0.0), isnan(_9136));
                                                float _2310 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9138.xy, uint(rint(_9138.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9138.xy, uint(rint(_9138.z))).x;
                                                float _2312 = fma(_1374, 11.0, _1066);
                                                float _2314 = _1374 * 18.0;
                                                float _2316 = -_2312;
                                                float _2318 = _2316 + _2310;
                                                float _2320 = _2318 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _2322 = precise::max(_2320, _2314);
                                                float _2324 = precise::min(0.0, _2322);
                                                bool _2326 = _2324 != _2320;
                                                bool _2328 = isnan(_2324);
                                                bool _2330 = _2326 || _2328;
                                                bool _2332 = isnan(_2320);
                                                bool _2334 = _2330 || _2332;
                                                bool _2336 = !_2334;
                                                if (!_2336)
                                                {
                                                    float _2338 = fma(_1356, 12.0, _827);
                                                    float _2340 = fma(_1364, 12.0, _825);
                                                    float3 _9190 = float3(_2338, _2340, float(int(_902)));
                                                    float3 _9192 = select(_9190, float3(0.0), isnan(_9190));
                                                    float _2342 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9192.xy, uint(rint(_9192.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9192.xy, uint(rint(_9192.z))).x;
                                                    float _2344 = fma(_1374, 12.0, _1066);
                                                    float _2346 = _1374 * 19.5;
                                                    float _2348 = -_2344;
                                                    float _2350 = _2348 + _2342;
                                                    float _2352 = _2350 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _2354 = precise::max(_2352, _2346);
                                                    float _2356 = precise::min(0.0, _2354);
                                                    bool _2358 = _2356 != _2352;
                                                    bool _2360 = isnan(_2356);
                                                    bool _2362 = _2358 || _2360;
                                                    bool _2364 = isnan(_2352);
                                                    bool _2366 = _2362 || _2364;
                                                    bool _2368 = !_2366;
                                                    if (!_2368)
                                                    {
                                                        float _2370 = fma(_1356, 13.0, _827);
                                                        float _2372 = fma(_1364, 13.0, _825);
                                                        float3 _9244 = float3(_2370, _2372, float(int(_902)));
                                                        float3 _9246 = select(_9244, float3(0.0), isnan(_9244));
                                                        float _2374 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9246.xy, uint(rint(_9246.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9246.xy, uint(rint(_9246.z))).x;
                                                        float _2376 = fma(_1374, 13.0, _1066);
                                                        float _2378 = fma(_1374, 21.0, -1.0);
                                                        float _2380 = -_2376;
                                                        float _2382 = _2380 + _2374;
                                                        float _2384 = _2382 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _2386 = precise::max(_2384, _2378);
                                                        float _2388 = precise::min(0.0, _2386);
                                                        bool _2390 = _2388 != _2384;
                                                        bool _2392 = isnan(_2388);
                                                        bool _2394 = _2390 || _2392;
                                                        bool _2396 = isnan(_2384);
                                                        bool _2398 = _2394 || _2396;
                                                        bool _2400 = !_2398;
                                                        if (!_2400)
                                                        {
                                                            float _2402 = fma(_1364, 14.0, _825);
                                                            float _2404 = fma(_1356, 14.0, _827);
                                                            float3 _9298 = float3(_2404, _2402, float(int(_902)));
                                                            float3 _9300 = select(_9298, float3(0.0), isnan(_9298));
                                                            float _2406 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9300.xy, uint(rint(_9300.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9300.xy, uint(rint(_9300.z))).x;
                                                            float _2408 = fma(_1374, 14.0, _1066);
                                                            float _2410 = fma(_1374, 22.5, -1.0);
                                                            float _2412 = -_2408;
                                                            float _2414 = _2412 + _2406;
                                                            float _2416 = _2414 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _2418 = precise::max(_2416, _2410);
                                                            float _2420 = precise::min(0.0, _2418);
                                                            bool _2422 = _2420 != _2416;
                                                            bool _2424 = isnan(_2420);
                                                            bool _2426 = _2422 || _2424;
                                                            bool _2428 = isnan(_2416);
                                                            bool _2430 = _2426 || _2428;
                                                            _2432 = _2430;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_2432)
    {
        float _2434 = _1964 + 1.0;
        _1984 = _2434;
    }
    _2432 = false;
    float _2436 = _1984;
    float _2438 = _1424 * 1.5;
    float _2440 = precise::max(_1492, _2438);
    float _2442 = precise::min(0.0, _2440);
    bool _2444 = _2442 != _1492;
    bool _2446 = isnan(_2442);
    bool _2448 = _2444 || _2446;
    bool _2450 = isnan(_1492);
    bool _2452 = _2448 || _2450;
    bool _2454 = !_2452;
    float _2456 = _2436;
    if (!_2454)
    {
        float _2458 = _825 + _1418;
        float _2460 = _827 + _1416;
        float3 _9396 = float3(_2460, _2458, float(int(_902)));
        float3 _9398 = select(_9396, float3(0.0), isnan(_9396));
        float _2462 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9398.xy, uint(rint(_9398.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9398.xy, uint(rint(_9398.z))).x;
        float _2464 = _1066 + _1424;
        float _2466 = -_2464;
        float _2468 = _2466 + _2462;
        float _2470 = _1424 * 3.0;
        float _2472 = _2468 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _2474 = precise::max(_2472, _2470);
        float _2476 = precise::min(0.0, _2474);
        bool _2478 = _2476 != _2472;
        bool _2480 = isnan(_2476);
        bool _2482 = _2478 || _2480;
        bool _2484 = isnan(_2472);
        bool _2486 = _2482 || _2484;
        bool _2488 = !_2486;
        if (!_2488)
        {
            float _2490 = fma(_1418, 2.0, _825);
            float _2492 = fma(_1416, 2.0, _827);
            float3 _9450 = float3(_2492, _2490, float(int(_902)));
            float3 _9452 = select(_9450, float3(0.0), isnan(_9450));
            float _2494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9452.xy, uint(rint(_9452.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9452.xy, uint(rint(_9452.z))).x;
            float _2496 = fma(_1424, 2.0, _1066);
            float _2498 = -_2496;
            float _2500 = _2498 + _2494;
            float _2502 = _1424 * 4.5;
            float _2504 = _2500 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _2506 = precise::max(_2504, _2502);
            float _2508 = precise::min(0.0, _2506);
            bool _2510 = _2508 != _2504;
            bool _2512 = isnan(_2508);
            bool _2514 = _2510 || _2512;
            bool _2516 = isnan(_2504);
            bool _2518 = _2514 || _2516;
            bool _2520 = !_2518;
            if (!_2520)
            {
                float _2522 = fma(_1418, 3.0, _825);
                float _2524 = fma(_1416, 3.0, _827);
                float3 _9504 = float3(_2524, _2522, float(int(_902)));
                float3 _9506 = select(_9504, float3(0.0), isnan(_9504));
                float _2526 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9506.xy, uint(rint(_9506.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9506.xy, uint(rint(_9506.z))).x;
                float _2528 = fma(_1424, 3.0, _1066);
                float _2530 = -_2528;
                float _2532 = _2530 + _2526;
                float _2534 = _1424 * 6.0;
                float _2536 = _2532 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _2538 = precise::max(_2536, _2534);
                float _2540 = precise::min(0.0, _2538);
                bool _2542 = _2540 != _2536;
                bool _2544 = isnan(_2540);
                bool _2546 = _2542 || _2544;
                bool _2548 = isnan(_2536);
                bool _2550 = _2546 || _2548;
                bool _2552 = !_2550;
                if (!_2552)
                {
                    float _2554 = fma(_1418, 4.0, _825);
                    float _2556 = fma(_1416, 4.0, _827);
                    float3 _9558 = float3(_2556, _2554, float(int(_902)));
                    float3 _9560 = select(_9558, float3(0.0), isnan(_9558));
                    float _2558 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9560.xy, uint(rint(_9560.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9560.xy, uint(rint(_9560.z))).x;
                    float _2560 = fma(_1424, 4.0, _1066);
                    float _2562 = -_2560;
                    float _2564 = _2562 + _2558;
                    float _2566 = _1424 * 7.5;
                    float _2568 = _2564 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _2570 = precise::max(_2568, _2566);
                    float _2572 = precise::min(0.0, _2570);
                    bool _2574 = _2572 != _2568;
                    bool _2576 = isnan(_2572);
                    bool _2578 = _2574 || _2576;
                    bool _2580 = isnan(_2568);
                    bool _2582 = _2578 || _2580;
                    bool _2584 = !_2582;
                    if (!_2584)
                    {
                        float _2586 = fma(_1418, 5.0, _825);
                        float _2588 = fma(_1416, 5.0, _827);
                        float3 _9612 = float3(_2588, _2586, float(int(_902)));
                        float3 _9614 = select(_9612, float3(0.0), isnan(_9612));
                        float _2590 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9614.xy, uint(rint(_9614.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9614.xy, uint(rint(_9614.z))).x;
                        float _2592 = fma(_1424, 5.0, _1066);
                        float _2594 = -_2592;
                        float _2596 = _2594 + _2590;
                        float _2598 = _1424 * 9.0;
                        float _2600 = _2596 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _2602 = precise::max(_2600, _2598);
                        float _2604 = precise::min(0.0, _2602);
                        bool _2606 = _2604 != _2600;
                        bool _2608 = isnan(_2604);
                        bool _2610 = _2606 || _2608;
                        bool _2612 = isnan(_2600);
                        bool _2614 = _2610 || _2612;
                        bool _2616 = !_2614;
                        if (!_2616)
                        {
                            float _2618 = fma(_1418, 6.0, _825);
                            float _2620 = fma(_1416, 6.0, _827);
                            float3 _9666 = float3(_2620, _2618, float(int(_902)));
                            float3 _9668 = select(_9666, float3(0.0), isnan(_9666));
                            float _2622 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9668.xy, uint(rint(_9668.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9668.xy, uint(rint(_9668.z))).x;
                            float _2624 = fma(_1424, 6.0, _1066);
                            float _2626 = -_2624;
                            float _2628 = _2626 + _2622;
                            float _2630 = _1424 * 10.5;
                            float _2632 = _2628 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _2634 = precise::max(_2632, _2630);
                            float _2636 = precise::min(0.0, _2634);
                            bool _2638 = _2636 != _2632;
                            bool _2640 = isnan(_2636);
                            bool _2642 = _2638 || _2640;
                            bool _2644 = isnan(_2632);
                            bool _2646 = _2642 || _2644;
                            bool _2648 = !_2646;
                            if (!_2648)
                            {
                                float _2650 = fma(_1418, 7.0, _825);
                                float _2652 = fma(_1416, 7.0, _827);
                                float3 _9720 = float3(_2652, _2650, float(int(_902)));
                                float3 _9722 = select(_9720, float3(0.0), isnan(_9720));
                                float _2654 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9722.xy, uint(rint(_9722.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9722.xy, uint(rint(_9722.z))).x;
                                float _2656 = fma(_1424, 7.0, _1066);
                                float _2658 = -_2656;
                                float _2660 = _2658 + _2654;
                                float _2662 = _1424 * 12.0;
                                float _2664 = _2660 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _2666 = precise::max(_2664, _2662);
                                float _2668 = precise::min(0.0, _2666);
                                bool _2670 = _2668 != _2664;
                                bool _2672 = isnan(_2668);
                                bool _2674 = _2670 || _2672;
                                bool _2676 = isnan(_2664);
                                bool _2678 = _2674 || _2676;
                                bool _2680 = !_2678;
                                if (!_2680)
                                {
                                    float _2682 = fma(_1418, 8.0, _825);
                                    float _2684 = fma(_1416, 8.0, _827);
                                    float3 _9774 = float3(_2684, _2682, float(int(_902)));
                                    float3 _9776 = select(_9774, float3(0.0), isnan(_9774));
                                    float _2686 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9776.xy, uint(rint(_9776.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9776.xy, uint(rint(_9776.z))).x;
                                    float _2688 = fma(_1424, 8.0, _1066);
                                    float _2690 = -_2688;
                                    float _2692 = _2690 + _2686;
                                    float _2694 = _1424 * 13.5;
                                    float _2696 = _2692 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _2698 = precise::max(_2696, _2694);
                                    float _2700 = precise::min(0.0, _2698);
                                    bool _2702 = _2700 != _2696;
                                    bool _2704 = isnan(_2700);
                                    bool _2706 = _2702 || _2704;
                                    bool _2708 = isnan(_2696);
                                    bool _2710 = _2706 || _2708;
                                    bool _2712 = !_2710;
                                    if (!_2712)
                                    {
                                        float _2714 = fma(_1418, 9.0, _825);
                                        float _2716 = fma(_1416, 9.0, _827);
                                        float3 _9828 = float3(_2716, _2714, float(int(_902)));
                                        float3 _9830 = select(_9828, float3(0.0), isnan(_9828));
                                        float _2718 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9830.xy, uint(rint(_9830.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9830.xy, uint(rint(_9830.z))).x;
                                        float _2720 = fma(_1424, 9.0, _1066);
                                        float _2722 = -_2720;
                                        float _2724 = _2722 + _2718;
                                        float _2726 = _1424 * 15.0;
                                        float _2728 = _2724 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _2730 = precise::max(_2728, _2726);
                                        float _2732 = precise::min(0.0, _2730);
                                        bool _2734 = _2732 != _2728;
                                        bool _2736 = isnan(_2732);
                                        bool _2738 = _2734 || _2736;
                                        bool _2740 = isnan(_2728);
                                        bool _2742 = _2738 || _2740;
                                        bool _2744 = !_2742;
                                        if (!_2744)
                                        {
                                            float _2746 = fma(_1418, 10.0, _825);
                                            float _2748 = fma(_1416, 10.0, _827);
                                            float3 _9882 = float3(_2748, _2746, float(int(_902)));
                                            float3 _9884 = select(_9882, float3(0.0), isnan(_9882));
                                            float _2750 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9884.xy, uint(rint(_9884.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9884.xy, uint(rint(_9884.z))).x;
                                            float _2752 = fma(_1424, 10.0, _1066);
                                            float _2754 = -_2752;
                                            float _2756 = _2754 + _2750;
                                            float _2758 = _1424 * 16.5;
                                            float _2760 = _2756 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _2762 = precise::max(_2760, _2758);
                                            float _2764 = precise::min(0.0, _2762);
                                            bool _2766 = _2764 != _2760;
                                            bool _2768 = isnan(_2764);
                                            bool _2770 = _2766 || _2768;
                                            bool _2772 = isnan(_2760);
                                            bool _2774 = _2770 || _2772;
                                            bool _2776 = !_2774;
                                            if (!_2776)
                                            {
                                                float _2778 = fma(_1418, 11.0, _825);
                                                float _2780 = fma(_1416, 11.0, _827);
                                                float3 _9936 = float3(_2780, _2778, float(int(_902)));
                                                float3 _9938 = select(_9936, float3(0.0), isnan(_9936));
                                                float _2782 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9938.xy, uint(rint(_9938.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9938.xy, uint(rint(_9938.z))).x;
                                                float _2784 = fma(_1424, 11.0, _1066);
                                                float _2786 = -_2784;
                                                float _2788 = _2786 + _2782;
                                                float _2790 = _1424 * 18.0;
                                                float _2792 = _2788 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _2794 = precise::max(_2792, _2790);
                                                float _2796 = precise::min(0.0, _2794);
                                                bool _2798 = _2796 != _2792;
                                                bool _2800 = isnan(_2796);
                                                bool _2802 = _2798 || _2800;
                                                bool _2804 = isnan(_2792);
                                                bool _2806 = _2802 || _2804;
                                                bool _2808 = !_2806;
                                                if (!_2808)
                                                {
                                                    float _2810 = fma(_1418, 12.0, _825);
                                                    float _2812 = fma(_1416, 12.0, _827);
                                                    float3 _9990 = float3(_2812, _2810, float(int(_902)));
                                                    float3 _9992 = select(_9990, float3(0.0), isnan(_9990));
                                                    float _2814 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9992.xy, uint(rint(_9992.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9992.xy, uint(rint(_9992.z))).x;
                                                    float _2816 = fma(_1424, 12.0, _1066);
                                                    float _2818 = -_2816;
                                                    float _2820 = _2818 + _2814;
                                                    float _2822 = _1424 * 19.5;
                                                    float _2824 = _2820 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _2826 = precise::max(_2824, _2822);
                                                    float _2828 = precise::min(0.0, _2826);
                                                    bool _2830 = _2828 != _2824;
                                                    bool _2832 = isnan(_2828);
                                                    bool _2834 = _2830 || _2832;
                                                    bool _2836 = isnan(_2824);
                                                    bool _2838 = _2834 || _2836;
                                                    bool _2840 = !_2838;
                                                    if (!_2840)
                                                    {
                                                        float _2842 = fma(_1418, 13.0, _825);
                                                        float _2844 = fma(_1416, 13.0, _827);
                                                        float3 _10044 = float3(_2844, _2842, float(int(_902)));
                                                        float3 _10046 = select(_10044, float3(0.0), isnan(_10044));
                                                        float _2846 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10046.xy, uint(rint(_10046.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10046.xy, uint(rint(_10046.z))).x;
                                                        float _2848 = fma(_1424, 13.0, _1066);
                                                        float _2850 = -_2848;
                                                        float _2852 = _2850 + _2846;
                                                        float _2854 = fma(_1424, 21.0, -1.0);
                                                        float _2856 = _2852 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _2858 = precise::max(_2856, _2854);
                                                        float _2860 = precise::min(0.0, _2858);
                                                        bool _2862 = _2860 != _2856;
                                                        bool _2864 = isnan(_2860);
                                                        bool _2866 = _2862 || _2864;
                                                        bool _2868 = isnan(_2856);
                                                        bool _2870 = _2866 || _2868;
                                                        bool _2872 = !_2870;
                                                        if (!_2872)
                                                        {
                                                            float _2874 = fma(_1418, 14.0, _825);
                                                            float _2876 = fma(_1416, 14.0, _827);
                                                            float3 _10098 = float3(_2876, _2874, float(int(_902)));
                                                            float3 _10100 = select(_10098, float3(0.0), isnan(_10098));
                                                            float _2878 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10100.xy, uint(rint(_10100.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10100.xy, uint(rint(_10100.z))).x;
                                                            float _2880 = fma(_1424, 14.0, _1066);
                                                            float _2882 = fma(_1424, 22.5, -1.0);
                                                            float _2884 = -_2880;
                                                            float _2886 = _2884 + _2878;
                                                            float _2888 = _2886 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _2890 = precise::max(_2888, _2882);
                                                            float _2892 = precise::min(0.0, _2890);
                                                            bool _2894 = _2892 != _2888;
                                                            bool _2896 = isnan(_2892);
                                                            bool _2898 = _2894 || _2896;
                                                            bool _2900 = isnan(_2888);
                                                            bool _2902 = _2898 || _2900;
                                                            _2904 = _2902;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_2904)
    {
        float _2906 = _2436 + 1.0;
        _2456 = _2906;
    }
    _2904 = false;
    float _2908 = _2456;
    float _2910 = _1386 * 1.5;
    float _2912 = precise::max(_1492, _2910);
    float _2914 = precise::min(0.0, _2912);
    bool _2916 = _2914 != _1492;
    bool _2918 = isnan(_2914);
    bool _2920 = _2916 || _2918;
    bool _2922 = isnan(_1492);
    bool _2924 = _2920 || _2922;
    bool _2926 = !_2924;
    float _2928 = _2908;
    if (!_2926)
    {
        float _2930 = _825 + _1384;
        float _2932 = _827 + _1382;
        float3 _10196 = float3(_2932, _2930, float(int(_902)));
        float3 _10198 = select(_10196, float3(0.0), isnan(_10196));
        float _2934 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10198.xy, uint(rint(_10198.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10198.xy, uint(rint(_10198.z))).x;
        float _2936 = _1066 + _1386;
        float _2938 = _1386 * 3.0;
        float _2940 = -_2936;
        float _2942 = _2940 + _2934;
        float _2944 = _2942 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _2946 = precise::max(_2944, _2938);
        float _2948 = precise::min(0.0, _2946);
        bool _2950 = _2948 != _2944;
        bool _2952 = isnan(_2948);
        bool _2954 = _2950 || _2952;
        bool _2956 = isnan(_2944);
        bool _2958 = _2954 || _2956;
        bool _2960 = !_2958;
        if (!_2960)
        {
            float _2962 = fma(_1384, 2.0, _825);
            float _2964 = fma(_1382, 2.0, _827);
            float3 _10250 = float3(_2964, _2962, float(int(_902)));
            float3 _10252 = select(_10250, float3(0.0), isnan(_10250));
            float _2966 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10252.xy, uint(rint(_10252.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10252.xy, uint(rint(_10252.z))).x;
            float _2968 = fma(_1386, 2.0, _1066);
            float _2970 = _1386 * 4.5;
            float _2972 = -_2968;
            float _2974 = _2972 + _2966;
            float _2976 = _2974 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _2978 = precise::max(_2976, _2970);
            float _2980 = precise::min(0.0, _2978);
            bool _2982 = _2980 != _2976;
            bool _2984 = isnan(_2980);
            bool _2986 = _2982 || _2984;
            bool _2988 = isnan(_2976);
            bool _2990 = _2986 || _2988;
            bool _2992 = !_2990;
            if (!_2992)
            {
                float _2994 = fma(_1384, 3.0, _825);
                float _2996 = fma(_1382, 3.0, _827);
                float3 _10304 = float3(_2996, _2994, float(int(_902)));
                float3 _10306 = select(_10304, float3(0.0), isnan(_10304));
                float _2998 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10306.xy, uint(rint(_10306.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10306.xy, uint(rint(_10306.z))).x;
                float _3000 = fma(_1386, 3.0, _1066);
                float _3002 = _1386 * 6.0;
                float _3004 = -_3000;
                float _3006 = _3004 + _2998;
                float _3008 = _3006 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _3010 = precise::max(_3008, _3002);
                float _3012 = precise::min(0.0, _3010);
                bool _3014 = _3012 != _3008;
                bool _3016 = isnan(_3012);
                bool _3018 = _3014 || _3016;
                bool _3020 = isnan(_3008);
                bool _3022 = _3018 || _3020;
                bool _3024 = !_3022;
                if (!_3024)
                {
                    float _3026 = fma(_1384, 4.0, _825);
                    float _3028 = fma(_1382, 4.0, _827);
                    float3 _10358 = float3(_3028, _3026, float(int(_902)));
                    float3 _10360 = select(_10358, float3(0.0), isnan(_10358));
                    float _3030 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10360.xy, uint(rint(_10360.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10360.xy, uint(rint(_10360.z))).x;
                    float _3032 = fma(_1386, 4.0, _1066);
                    float _3034 = _1386 * 7.5;
                    float _3036 = -_3032;
                    float _3038 = _3036 + _3030;
                    float _3040 = _3038 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _3042 = precise::max(_3040, _3034);
                    float _3044 = precise::min(0.0, _3042);
                    bool _3046 = _3044 != _3040;
                    bool _3048 = isnan(_3044);
                    bool _3050 = _3046 || _3048;
                    bool _3052 = isnan(_3040);
                    bool _3054 = _3050 || _3052;
                    bool _3056 = !_3054;
                    if (!_3056)
                    {
                        float _3058 = fma(_1384, 5.0, _825);
                        float _3060 = fma(_1382, 5.0, _827);
                        float3 _10412 = float3(_3060, _3058, float(int(_902)));
                        float3 _10414 = select(_10412, float3(0.0), isnan(_10412));
                        float _3062 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10414.xy, uint(rint(_10414.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10414.xy, uint(rint(_10414.z))).x;
                        float _3064 = fma(_1386, 5.0, _1066);
                        float _3066 = _1386 * 9.0;
                        float _3068 = -_3064;
                        float _3070 = _3068 + _3062;
                        float _3072 = _3070 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _3074 = precise::max(_3072, _3066);
                        float _3076 = precise::min(0.0, _3074);
                        bool _3078 = _3076 != _3072;
                        bool _3080 = isnan(_3076);
                        bool _3082 = _3078 || _3080;
                        bool _3084 = isnan(_3072);
                        bool _3086 = _3082 || _3084;
                        bool _3088 = !_3086;
                        if (!_3088)
                        {
                            float _3090 = fma(_1384, 6.0, _825);
                            float _3092 = fma(_1382, 6.0, _827);
                            float3 _10466 = float3(_3092, _3090, float(int(_902)));
                            float3 _10468 = select(_10466, float3(0.0), isnan(_10466));
                            float _3094 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10468.xy, uint(rint(_10468.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10468.xy, uint(rint(_10468.z))).x;
                            float _3096 = fma(_1386, 6.0, _1066);
                            float _3098 = _1386 * 10.5;
                            float _3100 = -_3096;
                            float _3102 = _3100 + _3094;
                            float _3104 = _3102 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _3106 = precise::max(_3104, _3098);
                            float _3108 = precise::min(0.0, _3106);
                            bool _3110 = _3108 != _3104;
                            bool _3112 = isnan(_3108);
                            bool _3114 = _3110 || _3112;
                            bool _3116 = isnan(_3104);
                            bool _3118 = _3114 || _3116;
                            bool _3120 = !_3118;
                            if (!_3120)
                            {
                                float _3122 = fma(_1384, 7.0, _825);
                                float _3124 = fma(_1382, 7.0, _827);
                                float3 _10520 = float3(_3124, _3122, float(int(_902)));
                                float3 _10522 = select(_10520, float3(0.0), isnan(_10520));
                                float _3126 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10522.xy, uint(rint(_10522.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10522.xy, uint(rint(_10522.z))).x;
                                float _3128 = fma(_1386, 7.0, _1066);
                                float _3130 = _1386 * 12.0;
                                float _3132 = -_3128;
                                float _3134 = _3132 + _3126;
                                float _3136 = _3134 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _3138 = precise::max(_3136, _3130);
                                float _3140 = precise::min(0.0, _3138);
                                bool _3142 = _3140 != _3136;
                                bool _3144 = isnan(_3140);
                                bool _3146 = _3142 || _3144;
                                bool _3148 = isnan(_3136);
                                bool _3150 = _3146 || _3148;
                                bool _3152 = !_3150;
                                if (!_3152)
                                {
                                    float _3154 = fma(_1384, 8.0, _825);
                                    float _3156 = fma(_1382, 8.0, _827);
                                    float3 _10574 = float3(_3156, _3154, float(int(_902)));
                                    float3 _10576 = select(_10574, float3(0.0), isnan(_10574));
                                    float _3158 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10576.xy, uint(rint(_10576.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10576.xy, uint(rint(_10576.z))).x;
                                    float _3160 = fma(_1386, 8.0, _1066);
                                    float _3162 = _1386 * 13.5;
                                    float _3164 = -_3160;
                                    float _3166 = _3164 + _3158;
                                    float _3168 = _3166 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _3170 = precise::max(_3168, _3162);
                                    float _3172 = precise::min(0.0, _3170);
                                    bool _3174 = _3172 != _3168;
                                    bool _3176 = isnan(_3172);
                                    bool _3178 = _3174 || _3176;
                                    bool _3180 = isnan(_3168);
                                    bool _3182 = _3178 || _3180;
                                    bool _3184 = !_3182;
                                    if (!_3184)
                                    {
                                        float _3186 = fma(_1384, 9.0, _825);
                                        float _3188 = fma(_1382, 9.0, _827);
                                        float3 _10628 = float3(_3188, _3186, float(int(_902)));
                                        float3 _10630 = select(_10628, float3(0.0), isnan(_10628));
                                        float _3190 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10630.xy, uint(rint(_10630.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10630.xy, uint(rint(_10630.z))).x;
                                        float _3192 = fma(_1386, 9.0, _1066);
                                        float _3194 = _1386 * 15.0;
                                        float _3196 = -_3192;
                                        float _3198 = _3196 + _3190;
                                        float _3200 = _3198 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _3202 = precise::max(_3200, _3194);
                                        float _3204 = precise::min(0.0, _3202);
                                        bool _3206 = _3204 != _3200;
                                        bool _3208 = isnan(_3204);
                                        bool _3210 = _3206 || _3208;
                                        bool _3212 = isnan(_3200);
                                        bool _3214 = _3210 || _3212;
                                        bool _3216 = !_3214;
                                        if (!_3216)
                                        {
                                            float _3218 = fma(_1384, 10.0, _825);
                                            float _3220 = fma(_1382, 10.0, _827);
                                            float3 _10682 = float3(_3220, _3218, float(int(_902)));
                                            float3 _10684 = select(_10682, float3(0.0), isnan(_10682));
                                            float _3222 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10684.xy, uint(rint(_10684.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10684.xy, uint(rint(_10684.z))).x;
                                            float _3224 = fma(_1386, 10.0, _1066);
                                            float _3226 = _1386 * 16.5;
                                            float _3228 = -_3224;
                                            float _3230 = _3228 + _3222;
                                            float _3232 = _3230 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _3234 = precise::max(_3232, _3226);
                                            float _3236 = precise::min(0.0, _3234);
                                            bool _3238 = _3236 != _3232;
                                            bool _3240 = isnan(_3236);
                                            bool _3242 = _3238 || _3240;
                                            bool _3244 = isnan(_3232);
                                            bool _3246 = _3242 || _3244;
                                            bool _3248 = !_3246;
                                            if (!_3248)
                                            {
                                                float _3250 = fma(_1384, 11.0, _825);
                                                float _3252 = fma(_1382, 11.0, _827);
                                                float3 _10736 = float3(_3252, _3250, float(int(_902)));
                                                float3 _10738 = select(_10736, float3(0.0), isnan(_10736));
                                                float _3254 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10738.xy, uint(rint(_10738.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10738.xy, uint(rint(_10738.z))).x;
                                                float _3256 = fma(_1386, 11.0, _1066);
                                                float _3258 = _1386 * 18.0;
                                                float _3260 = -_3256;
                                                float _3262 = _3260 + _3254;
                                                float _3264 = _3262 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _3266 = precise::max(_3264, _3258);
                                                float _3268 = precise::min(0.0, _3266);
                                                bool _3270 = _3268 != _3264;
                                                bool _3272 = isnan(_3268);
                                                bool _3274 = _3270 || _3272;
                                                bool _3276 = isnan(_3264);
                                                bool _3278 = _3274 || _3276;
                                                bool _3280 = !_3278;
                                                if (!_3280)
                                                {
                                                    float _3282 = fma(_1384, 12.0, _825);
                                                    float _3284 = fma(_1382, 12.0, _827);
                                                    float3 _10790 = float3(_3284, _3282, float(int(_902)));
                                                    float3 _10792 = select(_10790, float3(0.0), isnan(_10790));
                                                    float _3286 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10792.xy, uint(rint(_10792.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10792.xy, uint(rint(_10792.z))).x;
                                                    float _3288 = fma(_1386, 12.0, _1066);
                                                    float _3290 = _1386 * 19.5;
                                                    float _3292 = -_3288;
                                                    float _3294 = _3292 + _3286;
                                                    float _3296 = _3294 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _3298 = precise::max(_3296, _3290);
                                                    float _3300 = precise::min(0.0, _3298);
                                                    bool _3302 = _3300 != _3296;
                                                    bool _3304 = isnan(_3300);
                                                    bool _3306 = _3302 || _3304;
                                                    bool _3308 = isnan(_3296);
                                                    bool _3310 = _3306 || _3308;
                                                    bool _3312 = !_3310;
                                                    if (!_3312)
                                                    {
                                                        float _3314 = fma(_1384, 13.0, _825);
                                                        float _3316 = fma(_1382, 13.0, _827);
                                                        float3 _10844 = float3(_3316, _3314, float(int(_902)));
                                                        float3 _10846 = select(_10844, float3(0.0), isnan(_10844));
                                                        float _3318 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10846.xy, uint(rint(_10846.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10846.xy, uint(rint(_10846.z))).x;
                                                        float _3320 = fma(_1386, 13.0, _1066);
                                                        float _3322 = fma(_1386, 21.0, -1.0);
                                                        float _3324 = -_3320;
                                                        float _3326 = _3324 + _3318;
                                                        float _3328 = _3326 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _3330 = precise::max(_3328, _3322);
                                                        float _3332 = precise::min(0.0, _3330);
                                                        bool _3334 = _3332 != _3328;
                                                        bool _3336 = isnan(_3332);
                                                        bool _3338 = _3334 || _3336;
                                                        bool _3340 = isnan(_3328);
                                                        bool _3342 = _3338 || _3340;
                                                        bool _3344 = !_3342;
                                                        if (!_3344)
                                                        {
                                                            float _3346 = fma(_1384, 14.0, _825);
                                                            float _3348 = fma(_1382, 14.0, _827);
                                                            float3 _10898 = float3(_3348, _3346, float(int(_902)));
                                                            float3 _10900 = select(_10898, float3(0.0), isnan(_10898));
                                                            float _3350 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10900.xy, uint(rint(_10900.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10900.xy, uint(rint(_10900.z))).x;
                                                            float _3352 = fma(_1386, 14.0, _1066);
                                                            float _3354 = fma(_1386, 22.5, -1.0);
                                                            float _3356 = -_3352;
                                                            float _3358 = _3356 + _3350;
                                                            float _3360 = _3358 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _3362 = precise::max(_3360, _3354);
                                                            float _3364 = precise::min(0.0, _3362);
                                                            bool _3366 = _3364 != _3360;
                                                            bool _3368 = isnan(_3364);
                                                            bool _3370 = _3366 || _3368;
                                                            bool _3372 = isnan(_3360);
                                                            bool _3374 = _3370 || _3372;
                                                            _3376 = _3374;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_3376)
    {
        float _3378 = _2908 + 1.0;
        _2928 = _3378;
    }
    _3376 = false;
    float _3380 = _2928;
    float _3382 = _1426 * 1.5;
    float _3384 = precise::max(_1492, _3382);
    float _3386 = precise::min(0.0, _3384);
    bool _3388 = _3386 != _1492;
    bool _3390 = isnan(_3386);
    bool _3392 = _3388 || _3390;
    bool _3394 = isnan(_1492);
    bool _3396 = _3392 || _3394;
    bool _3398 = !_3396;
    float _3400 = _3380;
    if (!_3398)
    {
        float _3402 = _825 + _1422;
        float _3404 = _827 + _1420;
        float3 _10996 = float3(_3404, _3402, float(int(_902)));
        float3 _10998 = select(_10996, float3(0.0), isnan(_10996));
        float _3406 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10998.xy, uint(rint(_10998.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10998.xy, uint(rint(_10998.z))).x;
        float _3408 = _1066 + _1426;
        float _3410 = -_3408;
        float _3412 = _3410 + _3406;
        float _3414 = _1426 * 3.0;
        float _3416 = _3412 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _3418 = precise::max(_3416, _3414);
        float _3420 = precise::min(0.0, _3418);
        bool _3422 = _3420 != _3416;
        bool _3424 = isnan(_3420);
        bool _3426 = _3422 || _3424;
        bool _3428 = isnan(_3416);
        bool _3430 = _3426 || _3428;
        bool _3432 = !_3430;
        if (!_3432)
        {
            float _3434 = fma(_1422, 2.0, _825);
            float _3436 = fma(_1420, 2.0, _827);
            float3 _11050 = float3(_3436, _3434, float(int(_902)));
            float3 _11052 = select(_11050, float3(0.0), isnan(_11050));
            float _3438 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11052.xy, uint(rint(_11052.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11052.xy, uint(rint(_11052.z))).x;
            float _3440 = fma(_1426, 2.0, _1066);
            float _3442 = -_3440;
            float _3444 = _3442 + _3438;
            float _3446 = _1426 * 4.5;
            float _3448 = _3444 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _3450 = precise::max(_3448, _3446);
            float _3452 = precise::min(0.0, _3450);
            bool _3454 = _3452 != _3448;
            bool _3456 = isnan(_3452);
            bool _3458 = _3454 || _3456;
            bool _3460 = isnan(_3448);
            bool _3462 = _3458 || _3460;
            bool _3464 = !_3462;
            if (!_3464)
            {
                float _3466 = fma(_1422, 3.0, _825);
                float _3468 = fma(_1420, 3.0, _827);
                float3 _11104 = float3(_3468, _3466, float(int(_902)));
                float3 _11106 = select(_11104, float3(0.0), isnan(_11104));
                float _3470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11106.xy, uint(rint(_11106.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11106.xy, uint(rint(_11106.z))).x;
                float _3472 = fma(_1426, 3.0, _1066);
                float _3474 = -_3472;
                float _3476 = _3474 + _3470;
                float _3478 = _1426 * 6.0;
                float _3480 = _3476 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _3482 = precise::max(_3480, _3478);
                float _3484 = precise::min(0.0, _3482);
                bool _3486 = _3484 != _3480;
                bool _3488 = isnan(_3484);
                bool _3490 = _3486 || _3488;
                bool _3492 = isnan(_3480);
                bool _3494 = _3490 || _3492;
                bool _3496 = !_3494;
                if (!_3496)
                {
                    float _3498 = fma(_1422, 4.0, _825);
                    float _3500 = fma(_1420, 4.0, _827);
                    float3 _11158 = float3(_3500, _3498, float(int(_902)));
                    float3 _11160 = select(_11158, float3(0.0), isnan(_11158));
                    float _3502 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11160.xy, uint(rint(_11160.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11160.xy, uint(rint(_11160.z))).x;
                    float _3504 = fma(_1426, 4.0, _1066);
                    float _3506 = -_3504;
                    float _3508 = _3506 + _3502;
                    float _3510 = _1426 * 7.5;
                    float _3512 = _3508 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _3514 = precise::max(_3512, _3510);
                    float _3516 = precise::min(0.0, _3514);
                    bool _3518 = _3516 != _3512;
                    bool _3520 = isnan(_3516);
                    bool _3522 = _3518 || _3520;
                    bool _3524 = isnan(_3512);
                    bool _3526 = _3522 || _3524;
                    bool _3528 = !_3526;
                    if (!_3528)
                    {
                        float _3530 = fma(_1422, 5.0, _825);
                        float _3532 = fma(_1420, 5.0, _827);
                        float3 _11212 = float3(_3532, _3530, float(int(_902)));
                        float3 _11214 = select(_11212, float3(0.0), isnan(_11212));
                        float _3534 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11214.xy, uint(rint(_11214.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11214.xy, uint(rint(_11214.z))).x;
                        float _3536 = fma(_1426, 5.0, _1066);
                        float _3538 = -_3536;
                        float _3540 = _3538 + _3534;
                        float _3542 = _1426 * 9.0;
                        float _3544 = _3540 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _3546 = precise::max(_3544, _3542);
                        float _3548 = precise::min(0.0, _3546);
                        bool _3550 = _3548 != _3544;
                        bool _3552 = isnan(_3548);
                        bool _3554 = _3550 || _3552;
                        bool _3556 = isnan(_3544);
                        bool _3558 = _3554 || _3556;
                        bool _3560 = !_3558;
                        if (!_3560)
                        {
                            float _3562 = fma(_1422, 6.0, _825);
                            float _3564 = fma(_1420, 6.0, _827);
                            float3 _11266 = float3(_3564, _3562, float(int(_902)));
                            float3 _11268 = select(_11266, float3(0.0), isnan(_11266));
                            float _3566 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11268.xy, uint(rint(_11268.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11268.xy, uint(rint(_11268.z))).x;
                            float _3568 = fma(_1426, 6.0, _1066);
                            float _3570 = -_3568;
                            float _3572 = _3570 + _3566;
                            float _3574 = _1426 * 10.5;
                            float _3576 = _3572 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _3578 = precise::max(_3576, _3574);
                            float _3580 = precise::min(0.0, _3578);
                            bool _3582 = _3580 != _3576;
                            bool _3584 = isnan(_3580);
                            bool _3586 = _3582 || _3584;
                            bool _3588 = isnan(_3576);
                            bool _3590 = _3586 || _3588;
                            bool _3592 = !_3590;
                            if (!_3592)
                            {
                                float _3594 = fma(_1422, 7.0, _825);
                                float _3596 = fma(_1420, 7.0, _827);
                                float3 _11320 = float3(_3596, _3594, float(int(_902)));
                                float3 _11322 = select(_11320, float3(0.0), isnan(_11320));
                                float _3598 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11322.xy, uint(rint(_11322.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11322.xy, uint(rint(_11322.z))).x;
                                float _3600 = fma(_1426, 7.0, _1066);
                                float _3602 = -_3600;
                                float _3604 = _3602 + _3598;
                                float _3606 = _1426 * 12.0;
                                float _3608 = _3604 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _3610 = precise::max(_3608, _3606);
                                float _3612 = precise::min(0.0, _3610);
                                bool _3614 = _3612 != _3608;
                                bool _3616 = isnan(_3612);
                                bool _3618 = _3614 || _3616;
                                bool _3620 = isnan(_3608);
                                bool _3622 = _3618 || _3620;
                                bool _3624 = !_3622;
                                if (!_3624)
                                {
                                    float _3626 = fma(_1422, 8.0, _825);
                                    float _3628 = fma(_1420, 8.0, _827);
                                    float3 _11374 = float3(_3628, _3626, float(int(_902)));
                                    float3 _11376 = select(_11374, float3(0.0), isnan(_11374));
                                    float _3630 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11376.xy, uint(rint(_11376.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11376.xy, uint(rint(_11376.z))).x;
                                    float _3632 = fma(_1426, 8.0, _1066);
                                    float _3634 = -_3632;
                                    float _3636 = _3634 + _3630;
                                    float _3638 = _1426 * 13.5;
                                    float _3640 = _3636 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _3642 = precise::max(_3640, _3638);
                                    float _3644 = precise::min(0.0, _3642);
                                    bool _3646 = _3644 != _3640;
                                    bool _3648 = isnan(_3644);
                                    bool _3650 = _3646 || _3648;
                                    bool _3652 = isnan(_3640);
                                    bool _3654 = _3650 || _3652;
                                    bool _3656 = !_3654;
                                    if (!_3656)
                                    {
                                        float _3658 = fma(_1422, 9.0, _825);
                                        float _3660 = fma(_1420, 9.0, _827);
                                        float3 _11428 = float3(_3660, _3658, float(int(_902)));
                                        float3 _11430 = select(_11428, float3(0.0), isnan(_11428));
                                        float _3662 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11430.xy, uint(rint(_11430.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11430.xy, uint(rint(_11430.z))).x;
                                        float _3664 = fma(_1426, 9.0, _1066);
                                        float _3666 = -_3664;
                                        float _3668 = _3666 + _3662;
                                        float _3670 = _1426 * 15.0;
                                        float _3672 = _3668 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _3674 = precise::max(_3672, _3670);
                                        float _3676 = precise::min(0.0, _3674);
                                        bool _3678 = _3676 != _3672;
                                        bool _3680 = isnan(_3676);
                                        bool _3682 = _3678 || _3680;
                                        bool _3684 = isnan(_3672);
                                        bool _3686 = _3682 || _3684;
                                        bool _3688 = !_3686;
                                        if (!_3688)
                                        {
                                            float _3690 = fma(_1422, 10.0, _825);
                                            float _3692 = fma(_1420, 10.0, _827);
                                            float3 _11482 = float3(_3692, _3690, float(int(_902)));
                                            float3 _11484 = select(_11482, float3(0.0), isnan(_11482));
                                            float _3694 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11484.xy, uint(rint(_11484.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11484.xy, uint(rint(_11484.z))).x;
                                            float _3696 = fma(_1426, 10.0, _1066);
                                            float _3698 = -_3696;
                                            float _3700 = _3698 + _3694;
                                            float _3702 = _1426 * 16.5;
                                            float _3704 = _3700 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _3706 = precise::max(_3704, _3702);
                                            float _3708 = precise::min(0.0, _3706);
                                            bool _3710 = _3708 != _3704;
                                            bool _3712 = isnan(_3708);
                                            bool _3714 = _3710 || _3712;
                                            bool _3716 = isnan(_3704);
                                            bool _3718 = _3714 || _3716;
                                            bool _3720 = !_3718;
                                            if (!_3720)
                                            {
                                                float _3722 = fma(_1422, 11.0, _825);
                                                float _3724 = fma(_1420, 11.0, _827);
                                                float3 _11536 = float3(_3724, _3722, float(int(_902)));
                                                float3 _11538 = select(_11536, float3(0.0), isnan(_11536));
                                                float _3726 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11538.xy, uint(rint(_11538.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11538.xy, uint(rint(_11538.z))).x;
                                                float _3728 = fma(_1426, 11.0, _1066);
                                                float _3730 = -_3728;
                                                float _3732 = _3730 + _3726;
                                                float _3734 = _1426 * 18.0;
                                                float _3736 = _3732 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _3738 = precise::max(_3736, _3734);
                                                float _3740 = precise::min(0.0, _3738);
                                                bool _3742 = _3740 != _3736;
                                                bool _3744 = isnan(_3740);
                                                bool _3746 = _3742 || _3744;
                                                bool _3748 = isnan(_3736);
                                                bool _3750 = _3746 || _3748;
                                                bool _3752 = !_3750;
                                                if (!_3752)
                                                {
                                                    float _3754 = fma(_1422, 12.0, _825);
                                                    float _3756 = fma(_1420, 12.0, _827);
                                                    float3 _11590 = float3(_3756, _3754, float(int(_902)));
                                                    float3 _11592 = select(_11590, float3(0.0), isnan(_11590));
                                                    float _3758 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11592.xy, uint(rint(_11592.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11592.xy, uint(rint(_11592.z))).x;
                                                    float _3760 = fma(_1426, 12.0, _1066);
                                                    float _3762 = -_3760;
                                                    float _3764 = _3762 + _3758;
                                                    float _3766 = _1426 * 19.5;
                                                    float _3768 = _3764 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _3770 = precise::max(_3768, _3766);
                                                    float _3772 = precise::min(0.0, _3770);
                                                    bool _3774 = _3772 != _3768;
                                                    bool _3776 = isnan(_3772);
                                                    bool _3778 = _3774 || _3776;
                                                    bool _3780 = isnan(_3768);
                                                    bool _3782 = _3778 || _3780;
                                                    bool _3784 = !_3782;
                                                    if (!_3784)
                                                    {
                                                        float _3786 = fma(_1422, 13.0, _825);
                                                        float _3788 = fma(_1420, 13.0, _827);
                                                        float3 _11644 = float3(_3788, _3786, float(int(_902)));
                                                        float3 _11646 = select(_11644, float3(0.0), isnan(_11644));
                                                        float _3790 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11646.xy, uint(rint(_11646.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11646.xy, uint(rint(_11646.z))).x;
                                                        float _3792 = fma(_1426, 13.0, _1066);
                                                        float _3794 = -_3792;
                                                        float _3796 = _3794 + _3790;
                                                        float _3798 = fma(_1426, 21.0, -1.0);
                                                        float _3800 = _3796 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _3802 = precise::max(_3800, _3798);
                                                        float _3804 = precise::min(0.0, _3802);
                                                        bool _3806 = _3804 != _3800;
                                                        bool _3808 = isnan(_3804);
                                                        bool _3810 = _3806 || _3808;
                                                        bool _3812 = isnan(_3800);
                                                        bool _3814 = _3810 || _3812;
                                                        bool _3816 = !_3814;
                                                        if (!_3816)
                                                        {
                                                            float _3818 = fma(_1422, 14.0, _825);
                                                            float _3820 = fma(_1420, 14.0, _827);
                                                            float3 _11698 = float3(_3820, _3818, float(int(_902)));
                                                            float3 _11700 = select(_11698, float3(0.0), isnan(_11698));
                                                            float _3822 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11700.xy, uint(rint(_11700.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11700.xy, uint(rint(_11700.z))).x;
                                                            float _3824 = fma(_1426, 14.0, _1066);
                                                            float _3826 = fma(_1426, 22.5, -1.0);
                                                            float _3828 = -_3824;
                                                            float _3830 = _3828 + _3822;
                                                            float _3832 = _3830 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _3834 = precise::max(_3832, _3826);
                                                            float _3836 = precise::min(0.0, _3834);
                                                            bool _3838 = _3836 != _3832;
                                                            bool _3840 = isnan(_3836);
                                                            bool _3842 = _3838 || _3840;
                                                            bool _3844 = isnan(_3832);
                                                            bool _3846 = _3842 || _3844;
                                                            _3848 = _3846;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_3848)
    {
        float _3850 = _3380 + 1.0;
        _3400 = _3850;
    }
    _3848 = false;
    float _3852 = _3400;
    float _3854 = _1446 * 1.5;
    float _3856 = precise::max(_1492, _3854);
    float _3858 = precise::min(0.0, _3856);
    bool _3860 = _3858 != _1492;
    bool _3862 = isnan(_3858);
    bool _3864 = _3860 || _3862;
    bool _3866 = isnan(_1492);
    bool _3868 = _3864 || _3866;
    bool _3870 = !_3868;
    float _3872 = _3852;
    if (!_3870)
    {
        float _3874 = _825 + _1444;
        float _3876 = _827 + _1442;
        float3 _11796 = float3(_3876, _3874, float(int(_902)));
        float3 _11798 = select(_11796, float3(0.0), isnan(_11796));
        float _3878 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11798.xy, uint(rint(_11798.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11798.xy, uint(rint(_11798.z))).x;
        float _3880 = _1066 + _1446;
        float _3882 = _1446 * 3.0;
        float _3884 = -_3880;
        float _3886 = _3884 + _3878;
        float _3888 = _3886 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _3890 = precise::max(_3888, _3882);
        float _3892 = precise::min(0.0, _3890);
        bool _3894 = _3892 != _3888;
        bool _3896 = isnan(_3892);
        bool _3898 = _3894 || _3896;
        bool _3900 = isnan(_3888);
        bool _3902 = _3898 || _3900;
        bool _3904 = !_3902;
        if (!_3904)
        {
            float _3906 = fma(_1444, 2.0, _825);
            float _3908 = fma(_1442, 2.0, _827);
            float3 _11850 = float3(_3908, _3906, float(int(_902)));
            float3 _11852 = select(_11850, float3(0.0), isnan(_11850));
            float _3910 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11852.xy, uint(rint(_11852.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11852.xy, uint(rint(_11852.z))).x;
            float _3912 = fma(_1446, 2.0, _1066);
            float _3914 = _1446 * 4.5;
            float _3916 = -_3912;
            float _3918 = _3916 + _3910;
            float _3920 = _3918 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _3922 = precise::max(_3920, _3914);
            float _3924 = precise::min(0.0, _3922);
            bool _3926 = _3924 != _3920;
            bool _3928 = isnan(_3924);
            bool _3930 = _3926 || _3928;
            bool _3932 = isnan(_3920);
            bool _3934 = _3930 || _3932;
            bool _3936 = !_3934;
            if (!_3936)
            {
                float _3938 = fma(_1444, 3.0, _825);
                float _3940 = fma(_1442, 3.0, _827);
                float3 _11904 = float3(_3940, _3938, float(int(_902)));
                float3 _11906 = select(_11904, float3(0.0), isnan(_11904));
                float _3942 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11906.xy, uint(rint(_11906.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11906.xy, uint(rint(_11906.z))).x;
                float _3944 = fma(_1446, 3.0, _1066);
                float _3946 = _1446 * 6.0;
                float _3948 = -_3944;
                float _3950 = _3948 + _3942;
                float _3952 = _3950 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _3954 = precise::max(_3952, _3946);
                float _3956 = precise::min(0.0, _3954);
                bool _3958 = _3956 != _3952;
                bool _3960 = isnan(_3956);
                bool _3962 = _3958 || _3960;
                bool _3964 = isnan(_3952);
                bool _3966 = _3962 || _3964;
                bool _3968 = !_3966;
                if (!_3968)
                {
                    float _3970 = fma(_1444, 4.0, _825);
                    float _3972 = fma(_1442, 4.0, _827);
                    float3 _11958 = float3(_3972, _3970, float(int(_902)));
                    float3 _11960 = select(_11958, float3(0.0), isnan(_11958));
                    float _3974 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11960.xy, uint(rint(_11960.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11960.xy, uint(rint(_11960.z))).x;
                    float _3976 = fma(_1446, 4.0, _1066);
                    float _3978 = _1446 * 7.5;
                    float _3980 = -_3976;
                    float _3982 = _3980 + _3974;
                    float _3984 = _3982 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _3986 = precise::max(_3984, _3978);
                    float _3988 = precise::min(0.0, _3986);
                    bool _3990 = _3988 != _3984;
                    bool _3992 = isnan(_3988);
                    bool _3994 = _3990 || _3992;
                    bool _3996 = isnan(_3984);
                    bool _3998 = _3994 || _3996;
                    bool _4000 = !_3998;
                    if (!_4000)
                    {
                        float _4002 = fma(_1444, 5.0, _825);
                        float _4004 = fma(_1442, 5.0, _827);
                        float3 _12012 = float3(_4004, _4002, float(int(_902)));
                        float3 _12014 = select(_12012, float3(0.0), isnan(_12012));
                        float _4006 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12014.xy, uint(rint(_12014.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12014.xy, uint(rint(_12014.z))).x;
                        float _4008 = fma(_1446, 5.0, _1066);
                        float _4010 = _1446 * 9.0;
                        float _4012 = -_4008;
                        float _4014 = _4012 + _4006;
                        float _4016 = _4014 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _4018 = precise::max(_4016, _4010);
                        float _4020 = precise::min(0.0, _4018);
                        bool _4022 = _4020 != _4016;
                        bool _4024 = isnan(_4020);
                        bool _4026 = _4022 || _4024;
                        bool _4028 = isnan(_4016);
                        bool _4030 = _4026 || _4028;
                        bool _4032 = !_4030;
                        if (!_4032)
                        {
                            float _4034 = fma(_1444, 6.0, _825);
                            float _4036 = fma(_1442, 6.0, _827);
                            float3 _12066 = float3(_4036, _4034, float(int(_902)));
                            float3 _12068 = select(_12066, float3(0.0), isnan(_12066));
                            float _4038 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12068.xy, uint(rint(_12068.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12068.xy, uint(rint(_12068.z))).x;
                            float _4040 = fma(_1446, 6.0, _1066);
                            float _4042 = _1446 * 10.5;
                            float _4044 = -_4040;
                            float _4046 = _4044 + _4038;
                            float _4048 = _4046 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _4050 = precise::max(_4048, _4042);
                            float _4052 = precise::min(0.0, _4050);
                            bool _4054 = _4052 != _4048;
                            bool _4056 = isnan(_4052);
                            bool _4058 = _4054 || _4056;
                            bool _4060 = isnan(_4048);
                            bool _4062 = _4058 || _4060;
                            bool _4064 = !_4062;
                            if (!_4064)
                            {
                                float _4066 = fma(_1444, 7.0, _825);
                                float _4068 = fma(_1442, 7.0, _827);
                                float3 _12120 = float3(_4068, _4066, float(int(_902)));
                                float3 _12122 = select(_12120, float3(0.0), isnan(_12120));
                                float _4070 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12122.xy, uint(rint(_12122.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12122.xy, uint(rint(_12122.z))).x;
                                float _4072 = fma(_1446, 7.0, _1066);
                                float _4074 = _1446 * 12.0;
                                float _4076 = -_4072;
                                float _4078 = _4076 + _4070;
                                float _4080 = _4078 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _4082 = precise::max(_4080, _4074);
                                float _4084 = precise::min(0.0, _4082);
                                bool _4086 = _4084 != _4080;
                                bool _4088 = isnan(_4084);
                                bool _4090 = _4086 || _4088;
                                bool _4092 = isnan(_4080);
                                bool _4094 = _4090 || _4092;
                                bool _4096 = !_4094;
                                if (!_4096)
                                {
                                    float _4098 = fma(_1444, 8.0, _825);
                                    float _4100 = fma(_1442, 8.0, _827);
                                    float3 _12174 = float3(_4100, _4098, float(int(_902)));
                                    float3 _12176 = select(_12174, float3(0.0), isnan(_12174));
                                    float _4102 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12176.xy, uint(rint(_12176.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12176.xy, uint(rint(_12176.z))).x;
                                    float _4104 = fma(_1446, 8.0, _1066);
                                    float _4106 = _1446 * 13.5;
                                    float _4108 = -_4104;
                                    float _4110 = _4108 + _4102;
                                    float _4112 = _4110 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _4114 = precise::max(_4112, _4106);
                                    float _4116 = precise::min(0.0, _4114);
                                    bool _4118 = _4116 != _4112;
                                    bool _4120 = isnan(_4116);
                                    bool _4122 = _4118 || _4120;
                                    bool _4124 = isnan(_4112);
                                    bool _4126 = _4122 || _4124;
                                    bool _4128 = !_4126;
                                    if (!_4128)
                                    {
                                        float _4130 = fma(_1444, 9.0, _825);
                                        float _4132 = fma(_1442, 9.0, _827);
                                        float3 _12228 = float3(_4132, _4130, float(int(_902)));
                                        float3 _12230 = select(_12228, float3(0.0), isnan(_12228));
                                        float _4134 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12230.xy, uint(rint(_12230.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12230.xy, uint(rint(_12230.z))).x;
                                        float _4136 = fma(_1446, 9.0, _1066);
                                        float _4138 = _1446 * 15.0;
                                        float _4140 = -_4136;
                                        float _4142 = _4140 + _4134;
                                        float _4144 = _4142 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _4146 = precise::max(_4144, _4138);
                                        float _4148 = precise::min(0.0, _4146);
                                        bool _4150 = _4148 != _4144;
                                        bool _4152 = isnan(_4148);
                                        bool _4154 = _4150 || _4152;
                                        bool _4156 = isnan(_4144);
                                        bool _4158 = _4154 || _4156;
                                        bool _4160 = !_4158;
                                        if (!_4160)
                                        {
                                            float _4162 = fma(_1444, 10.0, _825);
                                            float _4164 = fma(_1442, 10.0, _827);
                                            float3 _12282 = float3(_4164, _4162, float(int(_902)));
                                            float3 _12284 = select(_12282, float3(0.0), isnan(_12282));
                                            float _4166 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12284.xy, uint(rint(_12284.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12284.xy, uint(rint(_12284.z))).x;
                                            float _4168 = fma(_1446, 10.0, _1066);
                                            float _4170 = _1446 * 16.5;
                                            float _4172 = -_4168;
                                            float _4174 = _4172 + _4166;
                                            float _4176 = _4174 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _4178 = precise::max(_4176, _4170);
                                            float _4180 = precise::min(0.0, _4178);
                                            bool _4182 = _4180 != _4176;
                                            bool _4184 = isnan(_4180);
                                            bool _4186 = _4182 || _4184;
                                            bool _4188 = isnan(_4176);
                                            bool _4190 = _4186 || _4188;
                                            bool _4192 = !_4190;
                                            if (!_4192)
                                            {
                                                float _4194 = fma(_1444, 11.0, _825);
                                                float _4196 = fma(_1442, 11.0, _827);
                                                float3 _12336 = float3(_4196, _4194, float(int(_902)));
                                                float3 _12338 = select(_12336, float3(0.0), isnan(_12336));
                                                float _4198 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12338.xy, uint(rint(_12338.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12338.xy, uint(rint(_12338.z))).x;
                                                float _4200 = fma(_1446, 11.0, _1066);
                                                float _4202 = _1446 * 18.0;
                                                float _4204 = -_4200;
                                                float _4206 = _4204 + _4198;
                                                float _4208 = _4206 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _4210 = precise::max(_4208, _4202);
                                                float _4212 = precise::min(0.0, _4210);
                                                bool _4214 = _4212 != _4208;
                                                bool _4216 = isnan(_4212);
                                                bool _4218 = _4214 || _4216;
                                                bool _4220 = isnan(_4208);
                                                bool _4222 = _4218 || _4220;
                                                bool _4224 = !_4222;
                                                if (!_4224)
                                                {
                                                    float _4226 = fma(_1444, 12.0, _825);
                                                    float _4228 = fma(_1442, 12.0, _827);
                                                    float3 _12390 = float3(_4228, _4226, float(int(_902)));
                                                    float3 _12392 = select(_12390, float3(0.0), isnan(_12390));
                                                    float _4230 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12392.xy, uint(rint(_12392.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12392.xy, uint(rint(_12392.z))).x;
                                                    float _4232 = fma(_1446, 12.0, _1066);
                                                    float _4234 = _1446 * 19.5;
                                                    float _4236 = -_4232;
                                                    float _4238 = _4236 + _4230;
                                                    float _4240 = _4238 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _4242 = precise::max(_4240, _4234);
                                                    float _4244 = precise::min(0.0, _4242);
                                                    bool _4246 = _4244 != _4240;
                                                    bool _4248 = isnan(_4244);
                                                    bool _4250 = _4246 || _4248;
                                                    bool _4252 = isnan(_4240);
                                                    bool _4254 = _4250 || _4252;
                                                    bool _4256 = !_4254;
                                                    if (!_4256)
                                                    {
                                                        float _4258 = fma(_1444, 13.0, _825);
                                                        float _4260 = fma(_1442, 13.0, _827);
                                                        float3 _12444 = float3(_4260, _4258, float(int(_902)));
                                                        float3 _12446 = select(_12444, float3(0.0), isnan(_12444));
                                                        float _4262 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12446.xy, uint(rint(_12446.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12446.xy, uint(rint(_12446.z))).x;
                                                        float _4264 = fma(_1446, 13.0, _1066);
                                                        float _4266 = fma(_1446, 21.0, -1.0);
                                                        float _4268 = -_4264;
                                                        float _4270 = _4268 + _4262;
                                                        float _4272 = _4270 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _4274 = precise::max(_4272, _4266);
                                                        float _4276 = precise::min(0.0, _4274);
                                                        bool _4278 = _4276 != _4272;
                                                        bool _4280 = isnan(_4276);
                                                        bool _4282 = _4278 || _4280;
                                                        bool _4284 = isnan(_4272);
                                                        bool _4286 = _4282 || _4284;
                                                        bool _4288 = !_4286;
                                                        if (!_4288)
                                                        {
                                                            float _4290 = fma(_1444, 14.0, _825);
                                                            float _4292 = fma(_1442, 14.0, _827);
                                                            float3 _12498 = float3(_4292, _4290, float(int(_902)));
                                                            float3 _12500 = select(_12498, float3(0.0), isnan(_12498));
                                                            float _4294 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12500.xy, uint(rint(_12500.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12500.xy, uint(rint(_12500.z))).x;
                                                            float _4296 = fma(_1446, 14.0, _1066);
                                                            float _4298 = fma(_1446, 22.5, -1.0);
                                                            float _4300 = -_4296;
                                                            float _4302 = _4300 + _4294;
                                                            float _4304 = _4302 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _4306 = precise::max(_4304, _4298);
                                                            float _4308 = precise::min(0.0, _4306);
                                                            bool _4310 = _4308 != _4304;
                                                            bool _4312 = isnan(_4308);
                                                            bool _4314 = _4310 || _4312;
                                                            bool _4316 = isnan(_4304);
                                                            bool _4318 = _4314 || _4316;
                                                            _4320 = _4318;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_4320)
    {
        float _4322 = _3852 + 1.0;
        _3872 = _4322;
    }
    _4320 = false;
    float _4324 = _3872;
    float _4326 = _1480 * 1.5;
    float _4328 = precise::max(_1492, _4326);
    float _4330 = precise::min(0.0, _4328);
    bool _4332 = _4330 != _1492;
    bool _4334 = isnan(_4330);
    bool _4336 = _4332 || _4334;
    bool _4338 = isnan(_1492);
    bool _4340 = _4336 || _4338;
    bool _4342 = !_4340;
    float _4344 = _4324;
    if (!_4342)
    {
        float _4346 = _825 + _1478;
        float _4348 = _827 + _1476;
        float3 _12596 = float3(_4348, _4346, float(int(_902)));
        float3 _12598 = select(_12596, float3(0.0), isnan(_12596));
        float _4350 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12598.xy, uint(rint(_12598.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12598.xy, uint(rint(_12598.z))).x;
        float _4352 = _1066 + _1480;
        float _4354 = -_4352;
        float _4356 = _4354 + _4350;
        float _4358 = _1480 * 3.0;
        float _4360 = _4356 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _4362 = precise::max(_4360, _4358);
        float _4364 = precise::min(0.0, _4362);
        bool _4366 = _4364 != _4360;
        bool _4368 = isnan(_4364);
        bool _4370 = _4366 || _4368;
        bool _4372 = isnan(_4360);
        bool _4374 = _4370 || _4372;
        bool _4376 = !_4374;
        if (!_4376)
        {
            float _4378 = fma(_1478, 2.0, _825);
            float _4380 = fma(_1476, 2.0, _827);
            float3 _12650 = float3(_4380, _4378, float(int(_902)));
            float3 _12652 = select(_12650, float3(0.0), isnan(_12650));
            float _4382 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12652.xy, uint(rint(_12652.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12652.xy, uint(rint(_12652.z))).x;
            float _4384 = fma(_1480, 2.0, _1066);
            float _4386 = -_4384;
            float _4388 = _4386 + _4382;
            float _4390 = _1480 * 4.5;
            float _4392 = _4388 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _4394 = precise::max(_4392, _4390);
            float _4396 = precise::min(0.0, _4394);
            bool _4398 = _4396 != _4392;
            bool _4400 = isnan(_4396);
            bool _4402 = _4398 || _4400;
            bool _4404 = isnan(_4392);
            bool _4406 = _4402 || _4404;
            bool _4408 = !_4406;
            if (!_4408)
            {
                float _4410 = fma(_1478, 3.0, _825);
                float _4412 = fma(_1476, 3.0, _827);
                float3 _12704 = float3(_4412, _4410, float(int(_902)));
                float3 _12706 = select(_12704, float3(0.0), isnan(_12704));
                float _4414 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12706.xy, uint(rint(_12706.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12706.xy, uint(rint(_12706.z))).x;
                float _4416 = fma(_1480, 3.0, _1066);
                float _4418 = -_4416;
                float _4420 = _4418 + _4414;
                float _4422 = _1480 * 6.0;
                float _4424 = _4420 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _4426 = precise::max(_4424, _4422);
                float _4428 = precise::min(0.0, _4426);
                bool _4430 = _4428 != _4424;
                bool _4432 = isnan(_4428);
                bool _4434 = _4430 || _4432;
                bool _4436 = isnan(_4424);
                bool _4438 = _4434 || _4436;
                bool _4440 = !_4438;
                if (!_4440)
                {
                    float _4442 = fma(_1478, 4.0, _825);
                    float _4444 = fma(_1476, 4.0, _827);
                    float3 _12758 = float3(_4444, _4442, float(int(_902)));
                    float3 _12760 = select(_12758, float3(0.0), isnan(_12758));
                    float _4446 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12760.xy, uint(rint(_12760.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12760.xy, uint(rint(_12760.z))).x;
                    float _4448 = fma(_1480, 4.0, _1066);
                    float _4450 = -_4448;
                    float _4452 = _4450 + _4446;
                    float _4454 = _1480 * 7.5;
                    float _4456 = _4452 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _4458 = precise::max(_4456, _4454);
                    float _4460 = precise::min(0.0, _4458);
                    bool _4462 = _4460 != _4456;
                    bool _4464 = isnan(_4460);
                    bool _4466 = _4462 || _4464;
                    bool _4468 = isnan(_4456);
                    bool _4470 = _4466 || _4468;
                    bool _4472 = !_4470;
                    if (!_4472)
                    {
                        float _4474 = fma(_1478, 5.0, _825);
                        float _4476 = fma(_1476, 5.0, _827);
                        float3 _12812 = float3(_4476, _4474, float(int(_902)));
                        float3 _12814 = select(_12812, float3(0.0), isnan(_12812));
                        float _4478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12814.xy, uint(rint(_12814.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12814.xy, uint(rint(_12814.z))).x;
                        float _4480 = fma(_1480, 5.0, _1066);
                        float _4482 = -_4480;
                        float _4484 = _4482 + _4478;
                        float _4486 = _1480 * 9.0;
                        float _4488 = _4484 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _4490 = precise::max(_4488, _4486);
                        float _4492 = precise::min(0.0, _4490);
                        bool _4494 = _4492 != _4488;
                        bool _4496 = isnan(_4492);
                        bool _4498 = _4494 || _4496;
                        bool _4500 = isnan(_4488);
                        bool _4502 = _4498 || _4500;
                        bool _4504 = !_4502;
                        if (!_4504)
                        {
                            float _4506 = fma(_1478, 6.0, _825);
                            float _4508 = fma(_1476, 6.0, _827);
                            float3 _12866 = float3(_4508, _4506, float(int(_902)));
                            float3 _12868 = select(_12866, float3(0.0), isnan(_12866));
                            float _4510 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12868.xy, uint(rint(_12868.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12868.xy, uint(rint(_12868.z))).x;
                            float _4512 = fma(_1480, 6.0, _1066);
                            float _4514 = -_4512;
                            float _4516 = _4514 + _4510;
                            float _4518 = _1480 * 10.5;
                            float _4520 = _4516 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _4522 = precise::max(_4520, _4518);
                            float _4524 = precise::min(0.0, _4522);
                            bool _4526 = _4524 != _4520;
                            bool _4528 = isnan(_4524);
                            bool _4530 = _4526 || _4528;
                            bool _4532 = isnan(_4520);
                            bool _4534 = _4530 || _4532;
                            bool _4536 = !_4534;
                            if (!_4536)
                            {
                                float _4538 = fma(_1478, 7.0, _825);
                                float _4540 = fma(_1476, 7.0, _827);
                                float3 _12920 = float3(_4540, _4538, float(int(_902)));
                                float3 _12922 = select(_12920, float3(0.0), isnan(_12920));
                                float _4542 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12922.xy, uint(rint(_12922.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12922.xy, uint(rint(_12922.z))).x;
                                float _4544 = fma(_1480, 7.0, _1066);
                                float _4546 = -_4544;
                                float _4548 = _4546 + _4542;
                                float _4550 = _1480 * 12.0;
                                float _4552 = _4548 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _4554 = precise::max(_4552, _4550);
                                float _4556 = precise::min(0.0, _4554);
                                bool _4558 = _4556 != _4552;
                                bool _4560 = isnan(_4556);
                                bool _4562 = _4558 || _4560;
                                bool _4564 = isnan(_4552);
                                bool _4566 = _4562 || _4564;
                                bool _4568 = !_4566;
                                if (!_4568)
                                {
                                    float _4570 = fma(_1478, 8.0, _825);
                                    float _4572 = fma(_1476, 8.0, _827);
                                    float3 _12974 = float3(_4572, _4570, float(int(_902)));
                                    float3 _12976 = select(_12974, float3(0.0), isnan(_12974));
                                    float _4574 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12976.xy, uint(rint(_12976.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12976.xy, uint(rint(_12976.z))).x;
                                    float _4576 = fma(_1480, 8.0, _1066);
                                    float _4578 = -_4576;
                                    float _4580 = _4578 + _4574;
                                    float _4582 = _1480 * 13.5;
                                    float _4584 = _4580 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _4586 = precise::max(_4584, _4582);
                                    float _4588 = precise::min(0.0, _4586);
                                    bool _4590 = _4588 != _4584;
                                    bool _4592 = isnan(_4588);
                                    bool _4594 = _4590 || _4592;
                                    bool _4596 = isnan(_4584);
                                    bool _4598 = _4594 || _4596;
                                    bool _4600 = !_4598;
                                    if (!_4600)
                                    {
                                        float _4602 = fma(_1478, 9.0, _825);
                                        float _4604 = fma(_1476, 9.0, _827);
                                        float3 _13028 = float3(_4604, _4602, float(int(_902)));
                                        float3 _13030 = select(_13028, float3(0.0), isnan(_13028));
                                        float _4606 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13030.xy, uint(rint(_13030.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13030.xy, uint(rint(_13030.z))).x;
                                        float _4608 = fma(_1480, 9.0, _1066);
                                        float _4610 = -_4608;
                                        float _4612 = _4610 + _4606;
                                        float _4614 = _1480 * 15.0;
                                        float _4616 = _4612 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _4618 = precise::max(_4616, _4614);
                                        float _4620 = precise::min(0.0, _4618);
                                        bool _4622 = _4620 != _4616;
                                        bool _4624 = isnan(_4620);
                                        bool _4626 = _4622 || _4624;
                                        bool _4628 = isnan(_4616);
                                        bool _4630 = _4626 || _4628;
                                        bool _4632 = !_4630;
                                        if (!_4632)
                                        {
                                            float _4634 = fma(_1478, 10.0, _825);
                                            float _4636 = fma(_1476, 10.0, _827);
                                            float3 _13082 = float3(_4636, _4634, float(int(_902)));
                                            float3 _13084 = select(_13082, float3(0.0), isnan(_13082));
                                            float _4638 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13084.xy, uint(rint(_13084.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13084.xy, uint(rint(_13084.z))).x;
                                            float _4640 = fma(_1480, 10.0, _1066);
                                            float _4642 = -_4640;
                                            float _4644 = _4642 + _4638;
                                            float _4646 = _1480 * 16.5;
                                            float _4648 = _4644 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _4650 = precise::max(_4648, _4646);
                                            float _4652 = precise::min(0.0, _4650);
                                            bool _4654 = _4652 != _4648;
                                            bool _4656 = isnan(_4652);
                                            bool _4658 = _4654 || _4656;
                                            bool _4660 = isnan(_4648);
                                            bool _4662 = _4658 || _4660;
                                            bool _4664 = !_4662;
                                            if (!_4664)
                                            {
                                                float _4666 = fma(_1478, 11.0, _825);
                                                float _4668 = fma(_1476, 11.0, _827);
                                                float3 _13136 = float3(_4668, _4666, float(int(_902)));
                                                float3 _13138 = select(_13136, float3(0.0), isnan(_13136));
                                                float _4670 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13138.xy, uint(rint(_13138.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13138.xy, uint(rint(_13138.z))).x;
                                                float _4672 = fma(_1480, 11.0, _1066);
                                                float _4674 = -_4672;
                                                float _4676 = _4674 + _4670;
                                                float _4678 = _1480 * 18.0;
                                                float _4680 = _4676 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _4682 = precise::max(_4680, _4678);
                                                float _4684 = precise::min(0.0, _4682);
                                                bool _4686 = _4684 != _4680;
                                                bool _4688 = isnan(_4684);
                                                bool _4690 = _4686 || _4688;
                                                bool _4692 = isnan(_4680);
                                                bool _4694 = _4690 || _4692;
                                                bool _4696 = !_4694;
                                                if (!_4696)
                                                {
                                                    float _4698 = fma(_1478, 12.0, _825);
                                                    float _4700 = fma(_1476, 12.0, _827);
                                                    float3 _13190 = float3(_4700, _4698, float(int(_902)));
                                                    float3 _13192 = select(_13190, float3(0.0), isnan(_13190));
                                                    float _4702 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13192.xy, uint(rint(_13192.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13192.xy, uint(rint(_13192.z))).x;
                                                    float _4704 = fma(_1480, 12.0, _1066);
                                                    float _4706 = -_4704;
                                                    float _4708 = _4706 + _4702;
                                                    float _4710 = _1480 * 19.5;
                                                    float _4712 = _4708 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _4714 = precise::max(_4712, _4710);
                                                    float _4716 = precise::min(0.0, _4714);
                                                    bool _4718 = _4716 != _4712;
                                                    bool _4720 = isnan(_4716);
                                                    bool _4722 = _4718 || _4720;
                                                    bool _4724 = isnan(_4712);
                                                    bool _4726 = _4722 || _4724;
                                                    bool _4728 = !_4726;
                                                    if (!_4728)
                                                    {
                                                        float _4730 = fma(_1478, 13.0, _825);
                                                        float _4732 = fma(_1476, 13.0, _827);
                                                        float3 _13244 = float3(_4732, _4730, float(int(_902)));
                                                        float3 _13246 = select(_13244, float3(0.0), isnan(_13244));
                                                        float _4734 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13246.xy, uint(rint(_13246.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13246.xy, uint(rint(_13246.z))).x;
                                                        float _4736 = fma(_1480, 13.0, _1066);
                                                        float _4738 = -_4736;
                                                        float _4740 = _4738 + _4734;
                                                        float _4742 = fma(_1480, 21.0, -1.0);
                                                        float _4744 = _4740 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _4746 = precise::max(_4744, _4742);
                                                        float _4748 = precise::min(0.0, _4746);
                                                        bool _4750 = _4748 != _4744;
                                                        bool _4752 = isnan(_4748);
                                                        bool _4754 = _4750 || _4752;
                                                        bool _4756 = isnan(_4744);
                                                        bool _4758 = _4754 || _4756;
                                                        bool _4760 = !_4758;
                                                        if (!_4760)
                                                        {
                                                            float _4762 = fma(_1478, 14.0, _825);
                                                            float _4764 = fma(_1476, 14.0, _827);
                                                            float3 _13298 = float3(_4764, _4762, float(int(_902)));
                                                            float3 _13300 = select(_13298, float3(0.0), isnan(_13298));
                                                            float _4766 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13300.xy, uint(rint(_13300.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13300.xy, uint(rint(_13300.z))).x;
                                                            float _4768 = fma(_1480, 14.0, _1066);
                                                            float _4770 = fma(_1480, 22.5, -1.0);
                                                            float _4772 = -_4768;
                                                            float _4774 = _4772 + _4766;
                                                            float _4776 = _4774 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _4778 = precise::max(_4776, _4770);
                                                            float _4780 = precise::min(0.0, _4778);
                                                            bool _4782 = _4780 != _4776;
                                                            bool _4784 = isnan(_4780);
                                                            bool _4786 = _4782 || _4784;
                                                            bool _4788 = isnan(_4776);
                                                            bool _4790 = _4786 || _4788;
                                                            _4792 = _4790;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_4792)
    {
        float _4794 = _4324 + 1.0;
        _4344 = _4794;
    }
    _4792 = false;
    float _4796 = _4344;
    float _4798 = _1486 * 1.5;
    float _4800 = precise::max(_1492, _4798);
    float _4802 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _4804 = 1.0 + _4802;
    float _4806 = precise::min(0.0, _4800);
    float _4808 = fma(_4804, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    bool _4810 = _4806 != _1492;
    bool _4812 = isnan(_4806);
    bool _4814 = _4810 || _4812;
    bool _4816 = isnan(_1492);
    bool _4818 = _4814 || _4816;
    float _4820 = _4808 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _4822 = !_4818;
    float _4824 = _4796;
    if (!_4822)
    {
        float _4826 = _825 + _1484;
        float _4828 = _827 + _1482;
        float3 _13411 = float3(_4828, _4826, float(int(_902)));
        float3 _13413 = select(_13411, float3(0.0), isnan(_13411));
        float _4830 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13413.xy, uint(rint(_13413.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13413.xy, uint(rint(_13413.z))).x;
        float _4832 = _1066 + _1486;
        float _4834 = _1486 * 3.0;
        float _4836 = -_4832;
        float _4838 = _4836 + _4830;
        float _4840 = _4838 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _4842 = precise::max(_4840, _4834);
        float _4844 = precise::min(0.0, _4842);
        bool _4846 = _4844 != _4840;
        bool _4848 = isnan(_4844);
        bool _4850 = _4846 || _4848;
        bool _4852 = isnan(_4840);
        bool _4854 = _4850 || _4852;
        bool _4856 = !_4854;
        if (!_4856)
        {
            float _4858 = fma(_1484, 2.0, _825);
            float _4860 = fma(_1482, 2.0, _827);
            float3 _13465 = float3(_4860, _4858, float(int(_902)));
            float3 _13467 = select(_13465, float3(0.0), isnan(_13465));
            float _4862 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13467.xy, uint(rint(_13467.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13467.xy, uint(rint(_13467.z))).x;
            float _4864 = fma(_1486, 2.0, _1066);
            float _4866 = _1486 * 4.5;
            float _4868 = -_4864;
            float _4870 = _4868 + _4862;
            float _4872 = _4870 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _4874 = precise::max(_4872, _4866);
            float _4876 = precise::min(0.0, _4874);
            bool _4878 = _4876 != _4872;
            bool _4880 = isnan(_4876);
            bool _4882 = _4878 || _4880;
            bool _4884 = isnan(_4872);
            bool _4886 = _4882 || _4884;
            bool _4888 = !_4886;
            if (!_4888)
            {
                float _4890 = fma(_1484, 3.0, _825);
                float _4892 = fma(_1482, 3.0, _827);
                float3 _13519 = float3(_4892, _4890, float(int(_902)));
                float3 _13521 = select(_13519, float3(0.0), isnan(_13519));
                float _4894 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13521.xy, uint(rint(_13521.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13521.xy, uint(rint(_13521.z))).x;
                float _4896 = fma(_1486, 3.0, _1066);
                float _4898 = _1486 * 6.0;
                float _4900 = -_4896;
                float _4902 = _4900 + _4894;
                float _4904 = _4902 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _4906 = precise::max(_4904, _4898);
                float _4908 = precise::min(0.0, _4906);
                bool _4910 = _4908 != _4904;
                bool _4912 = isnan(_4908);
                bool _4914 = _4910 || _4912;
                bool _4916 = isnan(_4904);
                bool _4918 = _4914 || _4916;
                bool _4920 = !_4918;
                if (!_4920)
                {
                    float _4922 = fma(_1484, 4.0, _825);
                    float _4924 = fma(_1482, 4.0, _827);
                    float3 _13573 = float3(_4924, _4922, float(int(_902)));
                    float3 _13575 = select(_13573, float3(0.0), isnan(_13573));
                    float _4926 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13575.xy, uint(rint(_13575.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13575.xy, uint(rint(_13575.z))).x;
                    float _4928 = fma(_1486, 4.0, _1066);
                    float _4930 = _1486 * 7.5;
                    float _4932 = -_4928;
                    float _4934 = _4932 + _4926;
                    float _4936 = _4934 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _4938 = precise::max(_4936, _4930);
                    float _4940 = precise::min(0.0, _4938);
                    bool _4942 = _4940 != _4936;
                    bool _4944 = isnan(_4940);
                    bool _4946 = _4942 || _4944;
                    bool _4948 = isnan(_4936);
                    bool _4950 = _4946 || _4948;
                    bool _4952 = !_4950;
                    if (!_4952)
                    {
                        float _4954 = fma(_1484, 5.0, _825);
                        float _4956 = fma(_1482, 5.0, _827);
                        float3 _13627 = float3(_4956, _4954, float(int(_902)));
                        float3 _13629 = select(_13627, float3(0.0), isnan(_13627));
                        float _4958 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13629.xy, uint(rint(_13629.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13629.xy, uint(rint(_13629.z))).x;
                        float _4960 = fma(_1486, 5.0, _1066);
                        float _4962 = _1486 * 9.0;
                        float _4964 = -_4960;
                        float _4966 = _4964 + _4958;
                        float _4968 = _4966 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _4970 = precise::max(_4968, _4962);
                        float _4972 = precise::min(0.0, _4970);
                        bool _4974 = _4972 != _4968;
                        bool _4976 = isnan(_4972);
                        bool _4978 = _4974 || _4976;
                        bool _4980 = isnan(_4968);
                        bool _4982 = _4978 || _4980;
                        bool _4984 = !_4982;
                        if (!_4984)
                        {
                            float _4986 = fma(_1484, 6.0, _825);
                            float _4988 = fma(_1482, 6.0, _827);
                            float3 _13681 = float3(_4988, _4986, float(int(_902)));
                            float3 _13683 = select(_13681, float3(0.0), isnan(_13681));
                            float _4990 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13683.xy, uint(rint(_13683.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13683.xy, uint(rint(_13683.z))).x;
                            float _4992 = fma(_1486, 6.0, _1066);
                            float _4994 = _1486 * 10.5;
                            float _4996 = -_4992;
                            float _4998 = _4996 + _4990;
                            float _5000 = _4998 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _5002 = precise::max(_5000, _4994);
                            float _5004 = precise::min(0.0, _5002);
                            bool _5006 = _5004 != _5000;
                            bool _5008 = isnan(_5004);
                            bool _5010 = _5006 || _5008;
                            bool _5012 = isnan(_5000);
                            bool _5014 = _5010 || _5012;
                            bool _5016 = !_5014;
                            if (!_5016)
                            {
                                float _5018 = fma(_1484, 7.0, _825);
                                float _5020 = fma(_1482, 7.0, _827);
                                float3 _13735 = float3(_5020, _5018, float(int(_902)));
                                float3 _13737 = select(_13735, float3(0.0), isnan(_13735));
                                float _5022 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13737.xy, uint(rint(_13737.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13737.xy, uint(rint(_13737.z))).x;
                                float _5024 = fma(_1486, 7.0, _1066);
                                float _5026 = _1486 * 12.0;
                                float _5028 = -_5024;
                                float _5030 = _5028 + _5022;
                                float _5032 = _5030 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _5034 = precise::max(_5032, _5026);
                                float _5036 = precise::min(0.0, _5034);
                                bool _5038 = _5036 != _5032;
                                bool _5040 = isnan(_5036);
                                bool _5042 = _5038 || _5040;
                                bool _5044 = isnan(_5032);
                                bool _5046 = _5042 || _5044;
                                bool _5048 = !_5046;
                                if (!_5048)
                                {
                                    float _5050 = fma(_1484, 8.0, _825);
                                    float _5052 = fma(_1482, 8.0, _827);
                                    float3 _13789 = float3(_5052, _5050, float(int(_902)));
                                    float3 _13791 = select(_13789, float3(0.0), isnan(_13789));
                                    float _5054 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13791.xy, uint(rint(_13791.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13791.xy, uint(rint(_13791.z))).x;
                                    float _5056 = fma(_1486, 8.0, _1066);
                                    float _5058 = _1486 * 13.5;
                                    float _5060 = -_5056;
                                    float _5062 = _5060 + _5054;
                                    float _5064 = _5062 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _5066 = precise::max(_5064, _5058);
                                    float _5068 = precise::min(0.0, _5066);
                                    bool _5070 = _5068 != _5064;
                                    bool _5072 = isnan(_5068);
                                    bool _5074 = _5070 || _5072;
                                    bool _5076 = isnan(_5064);
                                    bool _5078 = _5074 || _5076;
                                    bool _5080 = !_5078;
                                    if (!_5080)
                                    {
                                        float _5082 = fma(_1484, 9.0, _825);
                                        float _5084 = fma(_1482, 9.0, _827);
                                        float3 _13843 = float3(_5084, _5082, float(int(_902)));
                                        float3 _13845 = select(_13843, float3(0.0), isnan(_13843));
                                        float _5086 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13845.xy, uint(rint(_13845.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13845.xy, uint(rint(_13845.z))).x;
                                        float _5088 = fma(_1486, 9.0, _1066);
                                        float _5090 = _1486 * 15.0;
                                        float _5092 = -_5088;
                                        float _5094 = _5092 + _5086;
                                        float _5096 = _5094 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _5098 = precise::max(_5096, _5090);
                                        float _5100 = precise::min(0.0, _5098);
                                        bool _5102 = _5100 != _5096;
                                        bool _5104 = isnan(_5100);
                                        bool _5106 = _5102 || _5104;
                                        bool _5108 = isnan(_5096);
                                        bool _5110 = _5106 || _5108;
                                        bool _5112 = !_5110;
                                        if (!_5112)
                                        {
                                            float _5114 = fma(_1484, 10.0, _825);
                                            float _5116 = fma(_1482, 10.0, _827);
                                            float3 _13897 = float3(_5116, _5114, float(int(_902)));
                                            float3 _13899 = select(_13897, float3(0.0), isnan(_13897));
                                            float _5118 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13899.xy, uint(rint(_13899.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13899.xy, uint(rint(_13899.z))).x;
                                            float _5120 = fma(_1486, 10.0, _1066);
                                            float _5122 = _1486 * 16.5;
                                            float _5124 = -_5120;
                                            float _5126 = _5124 + _5118;
                                            float _5128 = _5126 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _5130 = precise::max(_5128, _5122);
                                            float _5132 = precise::min(0.0, _5130);
                                            bool _5134 = _5132 != _5128;
                                            bool _5136 = isnan(_5132);
                                            bool _5138 = _5134 || _5136;
                                            bool _5140 = isnan(_5128);
                                            bool _5142 = _5138 || _5140;
                                            bool _5144 = !_5142;
                                            if (!_5144)
                                            {
                                                float _5146 = fma(_1484, 11.0, _825);
                                                float _5148 = fma(_1482, 11.0, _827);
                                                float3 _13951 = float3(_5148, _5146, float(int(_902)));
                                                float3 _13953 = select(_13951, float3(0.0), isnan(_13951));
                                                float _5150 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13953.xy, uint(rint(_13953.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13953.xy, uint(rint(_13953.z))).x;
                                                float _5152 = fma(_1486, 11.0, _1066);
                                                float _5154 = _1486 * 18.0;
                                                float _5156 = -_5152;
                                                float _5158 = _5156 + _5150;
                                                float _5160 = _5158 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _5162 = precise::max(_5160, _5154);
                                                float _5164 = precise::min(0.0, _5162);
                                                bool _5166 = _5164 != _5160;
                                                bool _5168 = isnan(_5164);
                                                bool _5170 = _5166 || _5168;
                                                bool _5172 = isnan(_5160);
                                                bool _5174 = _5170 || _5172;
                                                bool _5176 = !_5174;
                                                if (!_5176)
                                                {
                                                    float _5178 = fma(_1484, 12.0, _825);
                                                    float _5180 = fma(_1482, 12.0, _827);
                                                    float3 _14005 = float3(_5180, _5178, float(int(_902)));
                                                    float3 _14007 = select(_14005, float3(0.0), isnan(_14005));
                                                    float _5182 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14007.xy, uint(rint(_14007.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14007.xy, uint(rint(_14007.z))).x;
                                                    float _5184 = fma(_1486, 12.0, _1066);
                                                    float _5186 = _1486 * 19.5;
                                                    float _5188 = -_5184;
                                                    float _5190 = _5188 + _5182;
                                                    float _5192 = _5190 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _5194 = precise::max(_5192, _5186);
                                                    float _5196 = precise::min(0.0, _5194);
                                                    bool _5198 = _5196 != _5192;
                                                    bool _5200 = isnan(_5196);
                                                    bool _5202 = _5198 || _5200;
                                                    bool _5204 = isnan(_5192);
                                                    bool _5206 = _5202 || _5204;
                                                    bool _5208 = !_5206;
                                                    if (!_5208)
                                                    {
                                                        float _5210 = fma(_1484, 13.0, _825);
                                                        float _5212 = fma(_1482, 13.0, _827);
                                                        float3 _14059 = float3(_5212, _5210, float(int(_902)));
                                                        float3 _14061 = select(_14059, float3(0.0), isnan(_14059));
                                                        float _5214 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14061.xy, uint(rint(_14061.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14061.xy, uint(rint(_14061.z))).x;
                                                        float _5216 = fma(_1486, 13.0, _1066);
                                                        float _5218 = fma(_1486, 21.0, -1.0);
                                                        float _5220 = -_5216;
                                                        float _5222 = _5220 + _5214;
                                                        float _5224 = _5222 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _5226 = precise::max(_5224, _5218);
                                                        float _5228 = precise::min(0.0, _5226);
                                                        bool _5230 = _5228 != _5224;
                                                        bool _5232 = isnan(_5228);
                                                        bool _5234 = _5230 || _5232;
                                                        bool _5236 = isnan(_5224);
                                                        bool _5238 = _5234 || _5236;
                                                        bool _5240 = !_5238;
                                                        if (!_5240)
                                                        {
                                                            float _5242 = fma(_1484, 14.0, _825);
                                                            float _5244 = fma(_1482, 14.0, _827);
                                                            float3 _14113 = float3(_5244, _5242, float(int(_902)));
                                                            float3 _14115 = select(_14113, float3(0.0), isnan(_14113));
                                                            float _5246 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14115.xy, uint(rint(_14115.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14115.xy, uint(rint(_14115.z))).x;
                                                            float _5248 = fma(_1486, 14.0, _1066);
                                                            float _5250 = fma(_1486, 22.5, -1.0);
                                                            float _5252 = -_5248;
                                                            float _5254 = _5252 + _5246;
                                                            float _5256 = _5254 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _5258 = precise::max(_5256, _5250);
                                                            float _5260 = precise::min(0.0, _5258);
                                                            bool _5262 = _5260 != _5256;
                                                            bool _5264 = isnan(_5260);
                                                            bool _5266 = _5262 || _5264;
                                                            bool _5268 = isnan(_5256);
                                                            bool _5270 = _5266 || _5268;
                                                            _5272 = _5270;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_5272)
    {
        float _5274 = _4796 + 1.0;
        _4824 = _5274;
    }
    _5272 = false;
    float _5276 = _4824;
    float _5278 = _5276 * 0.125;
    float _5280 = -_5278;
    float _5282 = fma(_5280, _4820, 1.0);
    out.m_39.x = _5282;
    return out;
}

