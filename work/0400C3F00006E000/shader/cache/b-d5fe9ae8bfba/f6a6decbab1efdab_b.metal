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
    bool _7442 = false;
    bool _7122 = false;
    bool _6810 = false;
    bool _6498 = false;
    bool _6186 = false;
    bool _5874 = false;
    bool _5562 = false;
    bool _5250 = false;
    bool _4938 = false;
    bool _4626 = false;
    bool _4314 = false;
    bool _4002 = false;
    bool _3690 = false;
    bool _3378 = false;
    bool _3066 = false;
    bool _2756 = false;
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
    float2 _7487 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7487, float2(0.0), isnan(_7487))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7487, float2(0.0), isnan(_7487))).x;
    float _68 = fma(_64, 2.0, -1.0);
    float _70 = fma(_62, 2.0, -1.0);
    float _72 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _74 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[0].z);
    float _76 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _78 = _74 * _72;
    float _80 = _74 * _76;
    float _82 = _74 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _86 = _80 * _84;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _90 = _80 * _88;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _94 = _80 * _92;
    bool _98 = _82 > (*spvDescriptorSet0.fp_c4)._m0[33].y;
    float _100 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[3].x, _86);
    float _102 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[4].x, _90);
    float _104 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].x, _94);
    bool _106 = _82 > (*spvDescriptorSet0.fp_c4)._m0[33].x;
    float _108 = -_82;
    float _110 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[3].z, _100);
    float _112 = -_82;
    float _114 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[4].z, _102);
    bool _116 = _82 > (*spvDescriptorSet0.fp_c4)._m0[33].z;
    float _118 = _110 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _120 = -_82;
    float _122 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[2].z, _104);
    float _124 = _114 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    bool _126 = !_98;
    int _129 = _126 ? 0 : 1;
    float _131 = _118 * 78.233001708984375;
    float _133 = _122 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _135 = fma(_124, 12.98980045318603515625, _131);
    float _137 = fma(_133, 45.16400146484375, _135);
    float _139 = fma(_133, 12.98980045318603515625, _131);
    float _141 = _137 + 94.67299652099609375;
    float _143 = fma(_124, 45.16400146484375, _139);
    float _145 = _141 * 0.15915493667125701904296875;
    float _147 = _143 + 94.67299652099609375;
    float _149 = _147 * 0.15915493667125701904296875;
    float _151 = _137 + 189.3459930419921875;
    float _153 = _145 * 6.283185482025146484375;
    float _155 = sin(_153);
    float _157 = _151 * 0.15915493667125701904296875;
    float _159 = _143 + 189.3459930419921875;
    float _161 = _159 * 0.15915493667125701904296875;
    float _163 = _137 + 284.01898193359375;
    float _165 = _149 * 6.283185482025146484375;
    float _167 = sin(_165);
    float _169 = _163 * 0.15915493667125701904296875;
    float _171 = _143 + 284.01898193359375;
    float _173 = _155 * 43758.546875;
    float _175 = _171 * 0.15915493667125701904296875;
    float _177 = _137 + 378.691986083984375;
    float _179 = _161 * 6.283185482025146484375;
    float _181 = sin(_179);
    float _183 = _177 * 0.15915493667125701904296875;
    float _185 = _143 + 378.691986083984375;
    float _187 = _167 * 43758.546875;
    float _189 = _185 * 0.15915493667125701904296875;
    float _191 = _137 + 473.364990234375;
    float _193 = _169 * 6.283185482025146484375;
    float _195 = sin(_193);
    float _197 = _191 * 0.15915493667125701904296875;
    float _199 = _143 + 473.364990234375;
    float _201 = _181 * 43758.546875;
    float _203 = _199 * 0.15915493667125701904296875;
    float _205 = _137 + 568.0379638671875;
    float _207 = _197 * 6.283185482025146484375;
    float _209 = sin(_207);
    float _211 = _205 * 0.15915493667125701904296875;
    float _213 = _143 + 568.0379638671875;
    float _215 = _195 * 43758.546875;
    float _217 = _213 * 0.15915493667125701904296875;
    float _219 = _137 + 662.71099853515625;
    float _221 = _203 * 6.283185482025146484375;
    float _223 = sin(_221);
    float _225 = _219 * 0.15915493667125701904296875;
    float _227 = _143 + 662.71099853515625;
    float _229 = _209 * 43758.546875;
    float _231 = _227 * 0.15915493667125701904296875;
    float _233 = _137 + 757.38397216796875;
    float _235 = _225 * 6.283185482025146484375;
    float _237 = sin(_235);
    float _239 = _233 * 0.15915493667125701904296875;
    float _241 = _143 + 757.38397216796875;
    float _243 = _223 * 43758.546875;
    float _245 = _241 * 0.15915493667125701904296875;
    float _247 = _137 + 852.05694580078125;
    float _249 = _239 * 6.283185482025146484375;
    float _251 = sin(_249);
    float _253 = _247 * 0.15915493667125701904296875;
    float _255 = _143 + 852.05694580078125;
    float _257 = _237 * 43758.546875;
    float _259 = _255 * 0.15915493667125701904296875;
    float _261 = _137 + 946.72998046875;
    float _263 = _253 * 6.283185482025146484375;
    float _265 = sin(_263);
    float _267 = _261 * 0.15915493667125701904296875;
    float _269 = _143 + 946.72998046875;
    float _271 = _251 * 43758.546875;
    float _273 = _269 * 0.15915493667125701904296875;
    float _275 = _137 + 1041.4029541015625;
    float _277 = floor(_201);
    float _279 = _275 * 0.15915493667125701904296875;
    float _281 = _143 + 1041.4029541015625;
    float _283 = _265 * 43758.546875;
    float _285 = _281 * 0.15915493667125701904296875;
    float _287 = _137 + 1136.075927734375;
    float _289 = _189 * 6.283185482025146484375;
    float _291 = sin(_289);
    float _293 = _287 * 0.15915493667125701904296875;
    float _295 = _143 + 1136.075927734375;
    float _297 = -_277;
    float _299 = _201 + _297;
    float _301 = _295 * 0.15915493667125701904296875;
    float _303 = _137 + 1230.7489013671875;
    float _305 = _285 * 6.283185482025146484375;
    float _307 = sin(_305);
    float _309 = fma(_299, 2.0, -1.0);
    float _311 = _303 * 0.15915493667125701904296875;
    float _313 = _143 + 1230.7489013671875;
    float _315 = _291 * 43758.546875;
    float _317 = _313 * 0.15915493667125701904296875;
    float _319 = _137 + 1325.4219970703125;
    float _321 = _245 * 6.283185482025146484375;
    float _323 = sin(_321);
    float _325 = _319 * 0.15915493667125701904296875;
    float _327 = _143 + 1325.4219970703125;
    float _329 = _307 * 43758.546875;
    float _331 = _327 * 0.15915493667125701904296875;
    float _333 = _137 + 1420.094970703125;
    float _335 = _137 + 1514.7679443359375;
    float _337 = _325 * 6.283185482025146484375;
    float _339 = sin(_337);
    float _341 = _333 * 0.15915493667125701904296875;
    float _343 = _335 * 0.15915493667125701904296875;
    float _345 = _143 + 1420.094970703125;
    float _347 = _143 + 1514.7679443359375;
    float _349 = _323 * 43758.546875;
    float _351 = _345 * 0.15915493667125701904296875;
    float _353 = _341 * 6.283185482025146484375;
    float _355 = sin(_353);
    float _357 = _347 * 0.15915493667125701904296875;
    float _359 = _339 * 43758.546875;
    float _361 = _351 * 6.283185482025146484375;
    float _363 = sin(_361);
    float _365 = _331 * 6.283185482025146484375;
    float _367 = sin(_365);
    float _369 = _355 * 43758.546875;
    int _371 = 2;
    if (!_98)
    {
        _371 = 1;
    }
    int _373 = _371;
    int _375 = _373;
    if (!_106)
    {
        _375 = _129;
    }
    int _377 = _375;
    float _379 = _259 * 6.283185482025146484375;
    float _381 = sin(_379);
    int _383 = _377 + 1;
    float _385 = _363 * 43758.546875;
    int _387 = _383;
    if (!_116)
    {
        _387 = _377;
    }
    int _389 = _387;
    bool _391 = _389 != 1;
    float _393 = _183 * 6.283185482025146484375;
    float _395 = sin(_393);
    bool _397 = _389 != 0;
    float _399 = _367 * 43758.546875;
    bool _401 = !_391;
    int _403 = _401 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].x);
    bool _405 = !_391;
    int _407 = _405 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _409 = _397 ? as_type<float>(_403) : (*spvDescriptorSet0.fp_c4)._m0[22].x;
    float _411 = _273 * 6.283185482025146484375;
    float _413 = sin(_411);
    bool _415 = !_391;
    int _417 = _415 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].y);
    float _419 = _381 * 43758.546875;
    float _421 = _397 ? as_type<float>(_407) : (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _423 = _397 ? as_type<float>(_417) : (*spvDescriptorSet0.fp_c4)._m0[23].y;
    bool _425 = !_391;
    int _427 = _425 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].y);
    float _429 = _118 * _421;
    bool _431 = !_391;
    int _433 = _431 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].y);
    float _435 = _118 * _423;
    float _437 = _211 * 6.283185482025146484375;
    float _439 = sin(_437);
    float _441 = _397 ? as_type<float>(_427) : (*spvDescriptorSet0.fp_c4)._m0[22].y;
    float _443 = _395 * 43758.546875;
    float _445 = _397 ? as_type<float>(_433) : (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _447 = _413 * 43758.546875;
    bool _449 = !_391;
    int _451 = _449 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].x);
    float _453 = _118 * _441;
    bool _455 = !_391;
    int _457 = _455 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].y);
    float _459 = _118 * _445;
    bool _461 = !_391;
    int _463 = _461 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].y);
    float _465 = _217 * 6.283185482025146484375;
    float _467 = sin(_465);
    bool _469 = !_391;
    int _471 = _469 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].y);
    float _473 = _397 ? as_type<float>(_451) : (*spvDescriptorSet0.fp_c4)._m0[1].x;
    bool _475 = !_391;
    int _477 = _475 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].x);
    float _479 = _439 * 43758.546875;
    float _481 = _397 ? as_type<float>(_457) : (*spvDescriptorSet0.fp_c4)._m0[21].y;
    float _483 = fma(_133, _473, _459);
    float _485 = _397 ? as_type<float>(_463) : (*spvDescriptorSet0.fp_c4)._m0[24].y;
    float _487 = _301 * 6.283185482025146484375;
    float _489 = sin(_487);
    float _491 = _397 ? as_type<float>(_471) : (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _493 = _118 * _481;
    float _495 = _397 ? as_type<float>(_477) : (*spvDescriptorSet0.fp_c4)._m0[21].x;
    float _497 = _118 * _485;
    float _499 = _118 * _491;
    float _501 = fma(_133, _495, _493);
    bool _503 = !_391;
    int _505 = _503 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].x);
    float _507 = fma(_133, _409, _453);
    bool _509 = !_391;
    int _511 = _509 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].x);
    float _513 = _157 * 6.283185482025146484375;
    float _515 = sin(_513);
    bool _517 = !_391;
    int _519 = _517 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].x);
    float _521 = _467 * 43758.546875;
    float _523 = _397 ? as_type<float>(_505) : (*spvDescriptorSet0.fp_c4)._m0[24].x;
    float _525 = _489 * 43758.546875;
    float _527 = _397 ? as_type<float>(_511) : (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _529 = fma(_133, _523, _497);
    float _531 = _397 ? as_type<float>(_519) : (*spvDescriptorSet0.fp_c4)._m0[23].x;
    float _533 = fma(_133, _527, _499);
    float _535 = _175 * 6.283185482025146484375;
    float _537 = sin(_535);
    bool _539 = !_391;
    int _541 = _539 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _543 = fma(_133, _531, _435);
    float _545 = _515 * 43758.546875;
    bool _547 = !_391;
    int _549 = _547 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].z);
    float _551 = _231 * 6.283185482025146484375;
    float _553 = sin(_551);
    float _555 = _397 ? as_type<float>(_541) : (*spvDescriptorSet0.fp_c4)._m0[0].x;
    bool _557 = !_391;
    int _559 = _557 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].z);
    bool _561 = !_391;
    int _563 = _561 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].z);
    float _565 = fma(_133, _555, _429);
    float _567 = _397 ? as_type<float>(_549) : (*spvDescriptorSet0.fp_c4)._m0[23].z;
    float _569 = _267 * 6.283185482025146484375;
    float _571 = sin(_569);
    float _573 = _397 ? as_type<float>(_559) : (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _575 = _537 * 43758.546875;
    float _577 = _397 ? as_type<float>(_563) : (*spvDescriptorSet0.fp_c4)._m0[22].z;
    float _579 = fma(_124, _567, _543);
    float _581 = fma(_124, _573, _565);
    float _583 = fma(_124, _577, _507);
    float _585 = _279 * 6.283185482025146484375;
    float _587 = sin(_585);
    float _589 = _553 * 43758.546875;
    bool _591 = !_391;
    int _593 = _591 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].z);
    float _595 = _571 * 43758.546875;
    bool _597 = !_391;
    int _599 = _597 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].z);
    float _601 = _293 * 6.283185482025146484375;
    float _603 = sin(_601);
    bool _605 = !_391;
    int _607 = _605 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].w);
    bool _609 = !_391;
    int _611 = _609 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].z);
    bool _613 = !_391;
    int _615 = _613 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].z);
    float _617 = _311 * 6.283185482025146484375;
    float _619 = sin(_617);
    float _621 = _397 ? as_type<float>(_593) : (*spvDescriptorSet0.fp_c4)._m0[24].z;
    float _623 = _587 * 43758.546875;
    float _625 = _397 ? as_type<float>(_599) : (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _627 = _397 ? as_type<float>(_607) : (*spvDescriptorSet0.fp_c4)._m0[22].w;
    float _629 = fma(_124, _621, _529);
    float _631 = _357 * 6.283185482025146484375;
    float _633 = sin(_631);
    bool _635 = !_391;
    int _637 = _635 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].w);
    float _639 = _627 + _583;
    float _641 = _397 ? as_type<float>(_611) : (*spvDescriptorSet0.fp_c4)._m0[21].z;
    float _643 = _603 * 43758.546875;
    float _645 = _397 ? as_type<float>(_615) : (*spvDescriptorSet0.fp_c4)._m0[1].z;
    bool _647 = !_391;
    int _649 = _647 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].w);
    float _651 = fma(_124, _641, _501);
    float _653 = _397 ? as_type<float>(_637) : (*spvDescriptorSet0.fp_c4)._m0[24].w;
    float _655 = fma(_124, _645, _483);
    float _657 = fma(_124, _625, _533);
    float _659 = _397 ? as_type<float>(_649) : (*spvDescriptorSet0.fp_c4)._m0[21].w;
    float _661 = _653 + _629;
    bool _663 = !_391;
    int _665 = _663 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _667 = _317 * 6.283185482025146484375;
    float _669 = sin(_667);
    float _671 = _659 + _651;
    float _673 = _619 * 43758.546875;
    float _675 = _397 ? as_type<float>(_665) : (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _677 = _633 * 43758.546875;
    bool _679 = !_391;
    int _681 = _679 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _683 = _343 * 6.283185482025146484375;
    float _685 = sin(_683);
    bool _687 = !_391;
    int _689 = _687 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _691 = _675 + _581;
    float _693 = _397 ? as_type<float>(_681) : (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _695 = _397 ? as_type<float>(_689) : (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _697 = floor(_271);
    float _699 = _693 + _657;
    bool _701 = !_391;
    int _703 = _701 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].w);
    float _705 = _669 * 43758.546875;
    float _707 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _709 = _707 + 1.0;
    float _711 = _397 ? as_type<float>(_703) : (*spvDescriptorSet0.fp_c4)._m0[23].w;
    float _713 = _695 + _655;
    float _715 = floor(_229);
    float _717 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _719 = _717 + 1.0;
    float _721 = fma(_709, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _723 = _711 + _579;
    float _725 = _685 * 43758.546875;
    float _727 = fma(_719, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _729 = _721 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _731 = float(_389);
    float _733 = floor(_399);
    float _735 = -_697;
    float _737 = _271 + _735;
    float _739 = floor(_215);
    float _741 = -_715;
    float _743 = _229 + _741;
    float _745 = floor(_257);
    float _747 = -_733;
    float _749 = _399 + _747;
    float _751 = floor(_243);
    float _753 = -_739;
    float _755 = _215 + _753;
    float _757 = fma(_755, 2.0, -1.0);
    bool _759 = !_391;
    int _761 = _759 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].z);
    float _763 = floor(_359);
    float _765 = -_745;
    float _767 = _257 + _765;
    float _769 = fma(_743, 2.0, -1.0);
    float _771 = fma(_749, 2.0, -1.0);
    float _773 = _729 * _771;
    float _775 = floor(_385);
    float _777 = -_751;
    float _779 = _243 + _777;
    bool _781 = !_391;
    int _783 = _781 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].y);
    float _785 = fma(_779, 2.0, -1.0);
    float _787 = _397 ? as_type<float>(_783) : (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _789 = floor(_283);
    float _791 = -_763;
    float _793 = _359 + _791;
    float _795 = fma(_793, 2.0, -1.0);
    float _797 = floor(_187);
    float _799 = -_775;
    float _801 = _385 + _799;
    float _803 = _727 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _805 = floor(_329);
    float _807 = -_789;
    float _809 = _283 + _807;
    float _811 = fma(_809, 2.0, -1.0);
    float _813 = floor(_315);
    float _815 = -_797;
    float _817 = _187 + _815;
    float _819 = _803 * _811;
    float _821 = fma(_817, 2.0, -1.0);
    float _823 = floor(_349);
    float _825 = -_805;
    float _827 = _329 + _825;
    bool _829 = !_391;
    int _831 = _829 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].x);
    float _833 = floor(_419);
    float _835 = -_813;
    float _837 = _315 + _835;
    float _839 = _397 ? as_type<float>(_831) : (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _841 = floor(_443);
    float _843 = -_823;
    float _845 = _349 + _843;
    float _847 = _803 * _757;
    float _849 = _803 * _785;
    float _851 = _773 * _773;
    float _853 = fma(_845, 2.0, -1.0);
    float _855 = floor(_447);
    float _857 = -_833;
    float _859 = _419 + _857;
    float _861 = floor(_173);
    float _863 = -_841;
    float _865 = _443 + _863;
    float _867 = fma(_827, 2.0, -1.0);
    float _869 = _803 * _867;
    float _871 = floor(_479);
    float _873 = -_855;
    float _875 = _447 + _873;
    float _877 = floor(_521);
    float _879 = -_861;
    float _881 = _173 + _879;
    float _883 = fma(_881, 2.0, -1.0);
    float _885 = floor(_525);
    float _887 = -_871;
    float _889 = _479 + _887;
    float _891 = _803 * _883;
    float _893 = fma(_889, 2.0, -1.0);
    float _895 = floor(_369);
    float _897 = -_877;
    float _899 = _521 + _897;
    float _901 = fma(_737, 2.0, -1.0);
    float _903 = fma(_899, 2.0, -1.0);
    float _905 = _803 * _901;
    float _907 = floor(_545);
    float _909 = -_885;
    float _911 = _525 + _909;
    float _913 = _729 * _795;
    float _915 = _803 * _903;
    float _917 = _803 * _853;
    float _919 = fma(_911, 2.0, -1.0);
    float _921 = fma(_913, _913, _851);
    float _923 = floor(_575);
    float _925 = -_895;
    float _927 = _369 + _925;
    float _929 = _803 * _919;
    float _931 = fma(_927, 2.0, -1.0);
    float _933 = floor(_589);
    float _935 = -_907;
    float _937 = _545 + _935;
    float _939 = _729 * _931;
    float _941 = floor(_595);
    float _943 = -_923;
    float _945 = _575 + _943;
    float _947 = fma(_937, 2.0, -1.0);
    float _949 = fma(_945, 2.0, -1.0);
    float _951 = _803 * _947;
    float _953 = floor(_623);
    float _955 = -_933;
    float _957 = _589 + _955;
    float _959 = fma(_957, 2.0, -1.0);
    bool _961 = !_391;
    int _963 = _961 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _965 = floor(_643);
    float _967 = -_941;
    float _969 = _595 + _967;
    float _971 = fma(_837, 2.0, -1.0);
    float _973 = _803 * _309;
    float _975 = _397 ? as_type<float>(_963) : (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _977 = fma(_969, 2.0, -1.0);
    float _979 = floor(_673);
    float _981 = -_953;
    float _983 = _623 + _981;
    float _985 = fma(_767, 2.0, -1.0);
    float _987 = fma(_801, 2.0, -1.0);
    float _989 = fma(_983, 2.0, -1.0);
    float _991 = _803 * _985;
    float _993 = _729 * _987;
    float _995 = floor(_677);
    float _997 = -_965;
    float _999 = _643 + _997;
    float _1001 = _803 * _989;
    float _1003 = fma(_999, 2.0, -1.0);
    float _1005 = _803 * _949;
    bool _1007 = !_391;
    int _1009 = _1007 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].x);
    float _1011 = floor(_705);
    float _1013 = -_979;
    float _1015 = _673 + _1013;
    float _1017 = _803 * _1003;
    float _1019 = _1005 * _1005;
    float _1021 = fma(_1015, 2.0, -1.0);
    float _1023 = _803 * _971;
    float _1025 = _803 * _769;
    float _1027 = floor(_725);
    float _1029 = -_995;
    float _1031 = _677 + _1029;
    float _1033 = fma(_859, 2.0, -1.0);
    float _1035 = fma(_875, 2.0, -1.0);
    float _1037 = _803 * _821;
    float _1039 = fma(_865, 2.0, -1.0);
    float _1041 = fma(_1031, 2.0, -1.0);
    float _1043 = _803 * _893;
    float _1045 = -_1011;
    float _1047 = _705 + _1045;
    float _1049 = _1037 * _1037;
    float _1051 = _803 * _1039;
    float _1053 = _803 * _959;
    float _1055 = fma(_1047, 2.0, -1.0);
    float _1057 = _803 * _1033;
    float _1059 = _803 * _1035;
    float _1061 = _803 * _1021;
    float _1063 = -_1027;
    float _1065 = _725 + _1063;
    float _1067 = _921 + 1.0;
    float _1069 = fma(_891, _891, _1049);
    float _1071 = _1023 * _1023;
    float _1073 = fma(_1065, 2.0, -1.0);
    float _1075 = _803 * _977;
    float _1077 = _803 * _1055;
    float _1079 = _973 * _973;
    float _1081 = rsqrt(_1067);
    float _1083 = _1069 + 1.0;
    bool _1085 = !_391;
    int _1087 = _1085 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].y);
    float _1089 = fma(_951, _951, _1079);
    float _1091 = fma(_847, _847, _1019);
    float _1093 = fma(_1051, _1051, _1071);
    float _1095 = _1089 + 1.0;
    float _1097 = rsqrt(_1083);
    float _1099 = _729 * _1073;
    float _1101 = _729 * _1041;
    float _1103 = _397 ? as_type<float>(_1087) : (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _1105 = _1091 + 1.0;
    float _1107 = _849 * _849;
    bool _1109 = !_391;
    int _1111 = _1109 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].y);
    float _1113 = rsqrt(_1095);
    float _1115 = fma(_773, _1081, _713);
    float _1117 = _1093 + 1.0;
    bool _1119 = !_391;
    int _1121 = _1119 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _1123 = fma(_913, _1081, _691);
    float _1125 = _397 ? as_type<float>(_1111) : (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _1127 = _1103 * _1115;
    bool _1129 = !_391;
    int _1131 = _1129 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].x);
    float _1133 = rsqrt(_1105);
    float _1135 = fma(_1037, _1097, _713);
    float _1137 = fma(_1025, _1025, _1107);
    float _1139 = _397 ? as_type<float>(_1121) : (*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _1141 = fma(_839, _1123, _1127);
    float _1143 = _397 ? as_type<float>(_1009) : (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _1145 = _975 * _1115;
    float _1147 = _397 ? as_type<float>(_1131) : (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _1149 = rsqrt(_1117);
    float _1151 = fma(_973, _1113, _713);
    float _1153 = _1125 * _1115;
    float _1155 = fma(_891, _1097, _691);
    float _1157 = _1103 * _1135;
    float _1159 = _975 * _1135;
    float _1161 = _1125 * _1135;
    float _1163 = _787 * _1115;
    float _1165 = _787 * _1135;
    float _1167 = _1137 + 1.0;
    float _1169 = fma(_1139, _1123, _1145);
    float _1171 = fma(_1143, _1123, _1153);
    float _1173 = fma(_839, _1155, _1157);
    float _1175 = fma(_1139, _1155, _1159);
    float _1177 = fma(_1143, _1155, _1161);
    float _1179 = fma(_1147, _1123, _1163);
    float _1181 = fma(_1147, _1155, _1165);
    float _1183 = fma(_951, _1113, _691);
    float _1185 = _1103 * _1151;
    float _1187 = _975 * _1151;
    float _1189 = _1125 * _1151;
    float _1191 = _787 * _1151;
    float _1193 = rsqrt(_1167);
    float _1195 = fma(_839, _1183, _1185);
    float _1197 = fma(_1139, _1183, _1187);
    float _1199 = fma(_1143, _1183, _1189);
    float _1201 = fma(_1147, _1183, _1191);
    float _1203 = _915 * _915;
    float _1205 = fma(_1005, _1133, _713);
    float _1207 = fma(_847, _1133, _691);
    float _1209 = fma(_1023, _1149, _713);
    float _1211 = fma(_1043, _1043, _1203);
    float _1213 = _1103 * _1205;
    float _1215 = _975 * _1205;
    float _1217 = _1125 * _1205;
    float _1219 = _787 * _1205;
    float _1221 = fma(_839, _1207, _1213);
    float _1223 = fma(_1139, _1207, _1215);
    float _1225 = fma(_1143, _1207, _1217);
    float _1227 = _1211 + 1.0;
    float _1229 = fma(_1147, _1207, _1219);
    float _1231 = fma(_1051, _1149, _691);
    float _1233 = _975 * _1209;
    float _1235 = fma(_849, _1193, _713);
    float _1237 = _1103 * _1209;
    float _1239 = _1125 * _1209;
    float _1241 = _787 * _1209;
    float _1243 = fma(_1139, _1231, _1233);
    float _1245 = rsqrt(_1227);
    float _1247 = fma(_1025, _1193, _691);
    float _1249 = _1103 * _1235;
    float _1251 = fma(_839, _1231, _1237);
    float _1253 = fma(_1143, _1231, _1239);
    float _1255 = fma(_1147, _1231, _1241);
    float _1257 = _975 * _1235;
    float _1259 = _1125 * _1235;
    float _1261 = _787 * _1235;
    float _1263 = fma(_839, _1247, _1249);
    float _1265 = fma(_1139, _1247, _1257);
    float _1267 = fma(_1143, _1247, _1259);
    bool _1269 = !_391;
    int _1271 = _1269 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].z);
    float _1273 = -_1081;
    float _1275 = _699 + _1273;
    bool _1277 = !_391;
    int _1279 = _1277 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].z);
    float _1281 = fma(_915, _1245, _713);
    bool _1283 = !_391;
    int _1285 = _1283 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].z);
    float _1287 = fma(_1147, _1247, _1261);
    float _1289 = _397 ? as_type<float>(_1271) : (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _1291 = _975 * _1281;
    float _1293 = _397 ? as_type<float>(_1279) : (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _1295 = -_1097;
    float _1297 = _699 + _1295;
    float _1299 = _397 ? as_type<float>(_1285) : (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _1301 = fma(_1289, _1275, _1141);
    float _1303 = _397 ? as_type<float>(_761) : (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _1305 = fma(_1293, _1275, _1171);
    float _1307 = -_1133;
    float _1309 = _699 + _1307;
    float _1311 = fma(_1299, _1275, _1169);
    float _1313 = fma(_1289, _1297, _1173);
    float _1315 = fma(_1303, _1275, _1179);
    float _1317 = fma(_1043, _1245, _691);
    float _1319 = fma(_1299, _1297, _1175);
    float _1321 = fma(_1293, _1297, _1177);
    float _1323 = fma(_1303, _1297, _1181);
    float _1325 = fma(_1139, _1317, _1291);
    float _1327 = -_1113;
    float _1329 = _699 + _1327;
    float _1331 = fma(_1293, _1309, _1225);
    float _1333 = fma(_1303, _1309, _1229);
    float _1335 = _1103 * _1281;
    float _1337 = fma(_1289, _1329, _1195);
    float _1339 = fma(_1299, _1329, _1197);
    float _1341 = fma(_1293, _1329, _1199);
    float _1343 = -_1149;
    float _1345 = _699 + _1343;
    float _1347 = fma(_1289, _1309, _1221);
    float _1349 = fma(_1299, _1309, _1223);
    float _1351 = -_1193;
    float _1353 = _699 + _1351;
    float _1355 = fma(_1289, _1345, _1251);
    float _1357 = fma(_1299, _1345, _1243);
    float _1359 = fma(_1289, _1353, _1263);
    float _1361 = fma(_1299, _1353, _1265);
    float _1363 = fma(_1293, _1353, _1267);
    bool _1365 = !_391;
    int _1367 = _1365 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].w);
    float _1369 = _1053 * _1053;
    float _1371 = fma(_1293, _1345, _1253);
    float _1373 = _1125 * _1281;
    float _1375 = _397 ? as_type<float>(_1367) : (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _1377 = fma(_991, _991, _1369);
    float _1379 = _787 * _1281;
    float _1381 = fma(_1303, _1353, _1287);
    float _1383 = fma(_839, _1317, _1335);
    float _1385 = _1377 + 1.0;
    float _1387 = -_1245;
    float _1389 = _699 + _1387;
    float _1391 = _1375 + _1315;
    float _1393 = fma(_1143, _1317, _1373);
    float _1395 = fma(_1147, _1317, _1379);
    float _1397 = fma(_1289, _1389, _1383);
    float _1399 = rsqrt(_1385);
    float _1401 = fma(_1299, _1389, _1325);
    float _1403 = fma(_1293, _1389, _1393);
    float _1405 = fma(_1303, _1389, _1395);
    float _1407 = _1375 + _1323;
    bool _1409 = !_391;
    int _1411 = _1409 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].w);
    float _1413 = _917 * _917;
    float _1415 = 1.0 / _1391;
    bool _1417 = !_391;
    int _1419 = _1417 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].w);
    float _1421 = fma(_1303, _1329, _1201);
    float _1423 = _397 ? as_type<float>(_1411) : (*spvDescriptorSet0.fp_c4)._m0[9].w;
    float _1425 = fma(_905, _905, _1413);
    float _1427 = _397 ? as_type<float>(_1419) : (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _1429 = fma(_1303, _1345, _1255);
    float _1431 = _1423 + _1301;
    float _1433 = fma(_1053, _1399, _713);
    float _1435 = _1427 + _1311;
    float _1437 = fma(_991, _1399, _691);
    float _1439 = 1.0 / _1407;
    float _1441 = _1103 * _1433;
    float _1443 = _975 * _1433;
    float _1445 = _1125 * _1433;
    float _1447 = _1431 * _1415;
    float _1449 = _1425 + 1.0;
    float _1451 = _787 * _1433;
    float _1453 = fma(_839, _1437, _1441);
    float _1455 = _1375 + _1421;
    bool _1457 = !_391;
    int _1459 = _1457 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].w);
    float _1461 = fma(_1139, _1437, _1443);
    float _1463 = rsqrt(_1449);
    float _1465 = -_1399;
    float _1467 = _699 + _1465;
    float _1469 = _397 ? as_type<float>(_1459) : (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _1471 = fma(_1143, _1437, _1445);
    float _1473 = fma(_1147, _1437, _1451);
    float _1475 = fma(_1299, _1467, _1461);
    float _1477 = _1423 + _1313;
    float _1479 = _1427 + _1319;
    float _1481 = 1.0 / _1455;
    float _1483 = _1469 + _1321;
    float _1485 = fma(_1289, _1467, _1453);
    float _1487 = fma(_1293, _1467, _1471);
    float _1489 = fma(_1303, _1467, _1473);
    float _1491 = _1477 * _1439;
    float _1493 = _1479 * _1439;
    float _1495 = _1483 * _1439;
    float _1497 = fma(_917, _1463, _713);
    float _1499 = _1423 + _1337;
    float _1501 = fma(_905, _1463, _691);
    float _1503 = _1427 + _1339;
    float _1505 = _975 * _1497;
    float _1507 = _1469 + _1341;
    float _1509 = _1125 * _1497;
    float _1511 = _787 * _1497;
    float _1513 = _1499 * _1481;
    float _1515 = fma(_1139, _1501, _1505);
    float _1517 = _1503 * _1481;
    float _1519 = _1507 * _1481;
    float _1521 = _1057 * _1057;
    float _1523 = _1103 * _1497;
    float _1525 = _1375 + _1333;
    float _1527 = _1469 + _1305;
    float _1529 = fma(_819, _819, _1521);
    float _1531 = fma(_839, _1501, _1523);
    float _1533 = _1375 + _1429;
    float _1535 = -_1463;
    float _1537 = _699 + _1535;
    float _1539 = _1529 + 1.0;
    float _1541 = 1.0 / _1525;
    float _1543 = fma(_1143, _1501, _1509);
    float _1545 = _1435 * _1415;
    float _1547 = fma(_1147, _1501, _1511);
    float _1549 = _1527 * _1415;
    float _1551 = fma(_1289, _1537, _1531);
    float _1553 = fma(_1299, _1537, _1515);
    float _1555 = fma(_1293, _1537, _1543);
    float _1557 = rsqrt(_1539);
    float _1559 = _1469 + _1331;
    float _1561 = fma(_1303, _1537, _1547);
    float _1563 = _1427 + _1349;
    float _1565 = _1423 + _1355;
    float _1567 = _1427 + _1357;
    float _1569 = _1469 + _1371;
    float _1571 = _1423 + _1347;
    float _1573 = 1.0 / _1533;
    float _1575 = _1563 * _1541;
    float _1577 = _1375 + _1405;
    float _1579 = _1571 * _1541;
    float _1581 = _1559 * _1541;
    float _1583 = _1423 + _1359;
    float _1585 = _1423 + _1397;
    float _1587 = _1469 + _1363;
    float _1589 = fma(_1057, _1557, _713);
    float _1591 = fma(_819, _1557, _691);
    float _1593 = -_1557;
    float _1595 = _699 + _1593;
    float _1597 = 1.0 / _1577;
    float _1599 = _975 * _1589;
    float _1601 = _1125 * _1589;
    float _1603 = _787 * _1589;
    float _1605 = _1469 + _1403;
    float _1607 = _1565 * _1573;
    float _1609 = _1567 * _1573;
    float _1611 = _1569 * _1573;
    float _1613 = _1103 * _1589;
    float _1615 = fma(_1139, _1591, _1599);
    float _1617 = fma(_1143, _1591, _1601);
    float _1619 = _1375 + _1561;
    float _1621 = fma(_839, _1591, _1613);
    float _1623 = _1375 + _1381;
    float _1625 = fma(_1147, _1591, _1603);
    float _1627 = _1059 * _1059;
    float _1629 = fma(_1289, _1595, _1621);
    float _1631 = fma(_1299, _1595, _1615);
    float _1633 = fma(_1293, _1595, _1617);
    float _1635 = fma(_1075, _1075, _1627);
    float _1637 = 1.0 / _1623;
    float _1639 = fma(_1303, _1595, _1625);
    float _1641 = _1427 + _1361;
    float _1643 = _1635 + 1.0;
    float _1645 = _1605 * _1597;
    float _1647 = _1375 + _1489;
    float _1649 = _1423 + _1551;
    float _1651 = _1469 + _1555;
    float _1653 = rsqrt(_1643);
    float _1655 = _1423 + _1485;
    float _1657 = _1427 + _1475;
    float _1659 = _1469 + _1487;
    float _1661 = _1423 + _1629;
    float _1663 = _1469 + _1633;
    float _1665 = _1583 * _1637;
    float _1667 = _1641 * _1637;
    float _1669 = _1427 + _1401;
    float _1671 = _1585 * _1597;
    float _1673 = _1587 * _1637;
    float _1675 = 1.0 / _1647;
    float _1677 = _1669 * _1597;
    float _1679 = fma(_1059, _1653, _713);
    float _1681 = fma(_1075, _1653, _691);
    float _1683 = _1103 * _1679;
    float _1685 = _975 * _1679;
    float _1687 = _1125 * _1679;
    float _1689 = _787 * _1679;
    float _1691 = fma(_839, _1681, _1683);
    float _1693 = fma(_1139, _1681, _1685);
    float _1695 = fma(_1143, _1681, _1687);
    float _1697 = fma(_1147, _1681, _1689);
    float _1699 = _869 * _869;
    float _1701 = 1.0 / _1619;
    float _1703 = _1427 + _1553;
    float _1705 = _1655 * _1675;
    float _1707 = fma(_1001, _1001, _1699);
    float _1709 = -_1653;
    float _1711 = _699 + _1709;
    float _1713 = _1657 * _1675;
    float _1715 = _1659 * _1675;
    float _1717 = _1707 + 1.0;
    float _1719 = fma(_1289, _1711, _1691);
    float _1721 = fma(_1299, _1711, _1693);
    float _1723 = fma(_1293, _1711, _1695);
    float _1725 = rsqrt(_1717);
    float _1727 = fma(_1303, _1711, _1697);
    float _1729 = _1375 + _1639;
    float _1731 = _1423 + _1719;
    float _1733 = _1469 + _1723;
    float _1735 = _1375 + _1727;
    float _1737 = _1649 * _1701;
    float _1739 = _1703 * _1701;
    float _1741 = 1.0 / _1729;
    float _1743 = _1651 * _1701;
    float _1745 = _1427 + _1631;
    float _1747 = 1.0 / _1735;
    float _1749 = fma(_869, _1725, _713);
    float _1751 = fma(_1001, _1725, _691);
    float _1753 = -_1725;
    float _1755 = _699 + _1753;
    float _1757 = _1103 * _1749;
    float _1759 = _975 * _1749;
    float _1761 = _1125 * _1749;
    float _1763 = _787 * _1749;
    float _1765 = fma(_839, _1751, _1757);
    float _1767 = _993 * _993;
    float _1769 = _1661 * _1741;
    float _1771 = _1427 + _1721;
    float _1773 = fma(_1139, _1751, _1759);
    float _1775 = fma(_1143, _1751, _1761);
    float _1777 = fma(_1147, _1751, _1763);
    float _1779 = _1731 * _1747;
    float _1781 = fma(_939, _939, _1767);
    float _1783 = _1101 * _1101;
    float _1785 = _1771 * _1747;
    float _1787 = _1733 * _1747;
    float _1789 = _1077 * _1077;
    float _1791 = fma(_1099, _1099, _1783);
    float _1793 = _1745 * _1741;
    float _1795 = _1663 * _1741;
    float _1797 = fma(_1061, _1061, _1789);
    float _1799 = _1791 + 1.0;
    float _1801 = _929 * _929;
    float _1803 = _1781 + 1.0;
    float _1805 = _1797 + 1.0;
    float _1807 = fma(_1303, _1755, _1777);
    float _1809 = fma(_1017, _1017, _1801);
    float _1811 = rsqrt(_1799);
    float _1813 = _1375 + _1807;
    float _1815 = _1809 + 1.0;
    float _1817 = rsqrt(_1803);
    float _1819 = rsqrt(_1815);
    float _1821 = fma(_1101, _1811, _713);
    float _1823 = rsqrt(_1805);
    float _1825 = fma(_939, _1817, _691);
    float _1827 = fma(_993, _1817, _713);
    float _1829 = 1.0 / _1813;
    float _1831 = fma(_1017, _1819, _691);
    float _1833 = fma(_929, _1819, _713);
    float _1835 = fma(_1061, _1823, _691);
    float _1837 = fma(_1099, _1811, _691);
    float _1839 = fma(_1289, _1755, _1765);
    float _1841 = 1.0 / _661;
    float _1843 = fma(_1299, _1755, _1773);
    float _1845 = fma(_1293, _1755, _1775);
    float _1847 = _1423 + _1839;
    float _1849 = fma(_1077, _1823, _713);
    float _1851 = _1427 + _1843;
    float _1853 = _1469 + _1845;
    float _1855 = _1847 * _1829;
    float _1857 = _1103 * _1833;
    float _1859 = _1851 * _1829;
    float _1861 = _1853 * _1829;
    float _1863 = _975 * _1833;
    float _1865 = _1125 * _1833;
    float _1867 = _787 * _1833;
    float _1869 = fma(_839, _1831, _1857);
    float _1871 = fma(_1139, _1831, _1863);
    float _1873 = _639 * _1841;
    float _1875 = _723 * _1841;
    float _1877 = _671 * _1841;
    float _1879 = fma(_1143, _1831, _1865);
    float _1881 = fma(_1147, _1831, _1867);
    float _1883 = _1103 * _1827;
    float _1885 = _1103 * _1849;
    float _1887 = _1103 * _1821;
    float _1889 = rint(_731);
    float _1891 = precise::max(_1889, 0.0);
    uint _1894 = uint(_1891);
    uint _1896 = clamp(_1894, 0u, 65535u);
    float _1898 = fma(_839, _1825, _1883);
    float _1900 = fma(_839, _1835, _1885);
    float _1902 = fma(_839, _1837, _1887);
    float _1904 = -_1819;
    float _1906 = _699 + _1904;
    float _1908 = _975 * _1849;
    float _1910 = _1125 * _1827;
    float _1912 = fma(_1289, _1906, _1869);
    float _1914 = fma(_1299, _1906, _1871);
    float _1916 = fma(_1293, _1906, _1879);
    float _1918 = fma(_1303, _1906, _1881);
    float _1920 = _975 * _1827;
    float _1922 = _975 * _1821;
    float _1924 = fma(_1139, _1835, _1908);
    float _1926 = _1125 * _1849;
    float _1928 = fma(_1139, _1825, _1920);
    float _1930 = fma(_1139, _1837, _1922);
    float _1932 = _787 * _1849;
    float3 _10535 = float3(_1877, _1873, float(int(_1896)));
    float3 _10539 = select(_10535, float3(0.0), isnan(_10535));
    float _1934 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10539.xy, uint(rint(_10539.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10539.xy, uint(rint(_10539.z))).x;
    float _1936 = _787 * _1827;
    float _1938 = _1125 * _1821;
    float _1940 = _787 * _1821;
    float _1942 = fma(_1143, _1835, _1926);
    float _1944 = fma(_1147, _1835, _1932);
    float _1946 = fma(_1143, _1825, _1910);
    float _1948 = fma(_1147, _1825, _1936);
    float _1950 = fma(_1143, _1837, _1938);
    float _1952 = fma(_1147, _1837, _1940);
    float _1954 = -_1817;
    float _1956 = _699 + _1954;
    float _1958 = -_1823;
    float _1960 = _699 + _1958;
    float _1962 = -_1811;
    float _1964 = _699 + _1962;
    float _1966 = _1375 + _1918;
    float _1968 = fma(_1289, _1956, _1898);
    float _1970 = fma(_1299, _1956, _1928);
    float _1972 = fma(_1303, _1956, _1948);
    float _1974 = fma(_1303, _1960, _1944);
    float _1976 = fma(_1293, _1960, _1942);
    float _1978 = fma(_1293, _1956, _1946);
    float _1980 = fma(_1293, _1964, _1950);
    float _1982 = fma(_1303, _1964, _1952);
    float _1984 = _1375 + _1972;
    float _1986 = _1375 + _1974;
    float _1988 = fma(_1289, _1960, _1900);
    float _1990 = fma(_1299, _1960, _1924);
    float _1992 = _1423 + _1968;
    float _1994 = _1375 + _1982;
    float _1996 = 1.0 / _1984;
    float _1998 = fma(_1289, _1964, _1902);
    float _2000 = _1423 + _1912;
    float _2002 = _1423 + _1988;
    float _2004 = _1427 + _1970;
    float _2006 = _1423 + _1998;
    float _2008 = _1469 + _1978;
    float _2010 = fma(_1299, _1964, _1930);
    float _2012 = 1.0 / _1966;
    float _2014 = _1427 + _1914;
    float _2016 = _1427 + _1990;
    float _2018 = _1427 + _2010;
    float _2020 = _1469 + _1976;
    float _2022 = _1469 + _1916;
    float _2024 = _1469 + _1980;
    float _2026 = 1.0 / _1994;
    float _2028 = _1992 * _1996;
    float _2030 = _2004 * _1996;
    float _2032 = _2008 * _1996;
    float _2034 = 1.0 / _1986;
    float _2036 = _2014 * _2012;
    float _2038 = fma(_1495, 0.5, 0.5);
    float _2040 = fma(_1795, 0.5, 0.5);
    float _2042 = _2000 * _2012;
    float _2044 = _2022 * _2012;
    float _2046 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.100000001490116119384765625;
    float _2048 = _2018 * _2026;
    float _2050 = -_2038;
    float _2052 = _1875 + _2050;
    float _2054 = fma(_1793, -0.5, 0.5);
    float _2056 = fma(_1743, 0.5, 0.5);
    float _2058 = -_2040;
    float _2060 = _1875 + _2058;
    float _2062 = _2052 * _2046;
    float _2064 = _2006 * _2026;
    float _2066 = _2024 * _2026;
    float _2068 = _2002 * _2034;
    float _2070 = _2016 * _2034;
    float _2072 = _2020 * _2034;
    float _2074 = fma(_2048, -0.5, 0.5);
    float _2076 = fma(_1785, -0.5, 0.5);
    float _2078 = _2062 * 1.5;
    float _2080 = fma(_2072, 0.5, 0.5);
    float _2082 = -_2074;
    float _2084 = _1873 + _2082;
    float _2086 = -_2076;
    float _2088 = _1873 + _2086;
    float _2090 = fma(_1491, 0.5, 0.5);
    float _2092 = fma(_1493, -0.5, 0.5);
    float _2094 = _2084 * _2046;
    float _2096 = fma(_1513, 0.5, 0.5);
    float _2098 = fma(_1517, -0.5, 0.5);
    float _2100 = fma(_1519, 0.5, 0.5);
    float _2102 = fma(_1579, 0.5, 0.5);
    float _2104 = fma(_1575, -0.5, 0.5);
    float _2106 = fma(_1581, 0.5, 0.5);
    float _2108 = fma(_1607, 0.5, 0.5);
    float _2110 = fma(_1609, -0.5, 0.5);
    float _2112 = fma(_1611, 0.5, 0.5);
    float _2114 = fma(_1665, 0.5, 0.5);
    float _2116 = fma(_1667, -0.5, 0.5);
    float _2118 = fma(_1673, 0.5, 0.5);
    float _2120 = fma(_1671, 0.5, 0.5);
    float _2122 = fma(_1677, -0.5, 0.5);
    float _2124 = fma(_1645, 0.5, 0.5);
    float _2126 = fma(_1705, 0.5, 0.5);
    float _2128 = fma(_1713, -0.5, 0.5);
    float _2130 = fma(_1715, 0.5, 0.5);
    float _2132 = fma(_1737, 0.5, 0.5);
    float _2134 = fma(_1739, -0.5, 0.5);
    float _2136 = fma(_1769, 0.5, 0.5);
    float _2138 = fma(_1779, 0.5, 0.5);
    float _2140 = fma(_1787, 0.5, 0.5);
    float _2142 = fma(_1855, 0.5, 0.5);
    float _2144 = fma(_1859, -0.5, 0.5);
    float _2146 = fma(_1861, 0.5, 0.5);
    float _2148 = fma(_2042, 0.5, 0.5);
    float _2150 = fma(_2036, -0.5, 0.5);
    float _2152 = fma(_2044, 0.5, 0.5);
    float _2154 = fma(_2068, 0.5, 0.5);
    float _2156 = fma(_2070, -0.5, 0.5);
    float _2158 = fma(_1447, 0.5, 0.5);
    float _2160 = fma(_1545, -0.5, 0.5);
    float _2162 = fma(_1549, 0.5, 0.5);
    float _2164 = fma(_2028, 0.5, 0.5);
    float _2166 = fma(_2030, -0.5, 0.5);
    float _2168 = fma(_2032, 0.5, 0.5);
    float _2170 = fma(_2064, 0.5, 0.5);
    float _2172 = fma(_2066, 0.5, 0.5);
    float _2174 = -_2090;
    float _2176 = _1877 + _2174;
    float _2178 = -_2092;
    float _2180 = _1873 + _2178;
    float _2182 = -_2096;
    float _2184 = _1877 + _2182;
    float _2186 = -_2098;
    float _2188 = _1873 + _2186;
    float _2190 = -_2100;
    float _2192 = _1875 + _2190;
    float _2194 = -_2102;
    float _2196 = _1877 + _2194;
    float _2198 = -_2104;
    float _2200 = _1873 + _2198;
    float _2202 = -_2106;
    float _2204 = _1875 + _2202;
    float _2206 = -_2108;
    float _2208 = _1877 + _2206;
    float _2210 = -_2110;
    float _2212 = _1873 + _2210;
    float _2214 = -_2112;
    float _2216 = _1875 + _2214;
    float _2218 = -_2114;
    float _2220 = _1877 + _2218;
    float _2222 = -_2116;
    float _2224 = _1873 + _2222;
    float _2226 = -_2118;
    float _2228 = _1875 + _2226;
    float _2230 = -_2120;
    float _2232 = _1877 + _2230;
    float _2234 = -_2122;
    float _2236 = _1873 + _2234;
    float _2238 = -_2124;
    float _2240 = _1875 + _2238;
    float _2242 = -_2126;
    float _2244 = _1877 + _2242;
    float _2246 = -_2128;
    float _2248 = _1873 + _2246;
    float _2250 = -_2130;
    float _2252 = _1875 + _2250;
    float _2254 = -_2132;
    float _2256 = _1877 + _2254;
    float _2258 = -_2134;
    float _2260 = _1873 + _2258;
    float _2262 = -_2056;
    float _2264 = _1875 + _2262;
    float _2266 = -_2136;
    float _2268 = _1877 + _2266;
    float _2270 = -_2054;
    float _2272 = _1873 + _2270;
    float _2274 = -_2138;
    float _2276 = _1877 + _2274;
    float _2278 = -_2140;
    float _2280 = _1875 + _2278;
    float _2282 = -_2142;
    float _2284 = _1877 + _2282;
    float _2286 = -_2144;
    float _2288 = _1873 + _2286;
    float _2290 = -_2146;
    float _2292 = _1875 + _2290;
    float _2294 = -_2148;
    float _2296 = _1877 + _2294;
    float _2298 = -_2150;
    float _2300 = _1873 + _2298;
    float _2302 = -_2152;
    float _2304 = _1875 + _2302;
    float _2306 = -_2154;
    float _2308 = _1877 + _2306;
    float _2310 = -_2156;
    float _2312 = _1873 + _2310;
    float _2314 = -_2080;
    float _2316 = _1875 + _2314;
    float _2318 = -_2158;
    float _2320 = _1877 + _2318;
    float _2322 = -_2160;
    float _2324 = _1873 + _2322;
    float _2326 = -_2162;
    float _2328 = _1875 + _2326;
    float _2330 = -_2164;
    float _2332 = _1877 + _2330;
    float _2334 = -_2166;
    float _2336 = _1873 + _2334;
    float _2338 = -_2168;
    float _2340 = _1875 + _2338;
    float _2342 = -_2170;
    float _2344 = _1877 + _2342;
    float _2346 = -_2172;
    float _2348 = _1875 + _2346;
    float _2350 = _2176 * _2046;
    float _2352 = _2180 * _2046;
    float _2354 = _2184 * _2046;
    float _2356 = _2188 * _2046;
    float _2358 = _2192 * _2046;
    float _2360 = _2196 * _2046;
    float _2362 = _2200 * _2046;
    float _2364 = _2204 * _2046;
    float _2366 = _2208 * _2046;
    float _2368 = _2212 * _2046;
    float _2370 = _2216 * _2046;
    float _2372 = _2220 * _2046;
    float _2374 = _2224 * _2046;
    float _2376 = _2228 * _2046;
    float _2378 = _2232 * _2046;
    float _2380 = _2236 * _2046;
    float _2382 = _2240 * _2046;
    float _2384 = _2244 * _2046;
    float _2386 = _2248 * _2046;
    float _2388 = _2252 * _2046;
    float _2390 = _2256 * _2046;
    float _2392 = _2260 * _2046;
    float _2394 = _2264 * _2046;
    float _2396 = _2268 * _2046;
    float _2398 = _2272 * _2046;
    float _2400 = _2060 * _2046;
    float _2402 = _2276 * _2046;
    float _2404 = _2088 * _2046;
    float _2406 = _2280 * _2046;
    float _2408 = _2284 * _2046;
    float _2410 = _2288 * _2046;
    float _2412 = _2292 * _2046;
    float _2414 = _2296 * _2046;
    float _2416 = _2300 * _2046;
    float _2418 = _2304 * _2046;
    float _2420 = _2308 * _2046;
    float _2422 = _2312 * _2046;
    float _2424 = _2316 * _2046;
    float _2426 = _2320 * _2046;
    float _2428 = _2324 * _2046;
    float _2430 = _2328 * _2046;
    float _2432 = _2332 * _2046;
    float _2434 = _2336 * _2046;
    float _2436 = _2340 * _2046;
    float _2438 = _2344 * _2046;
    float _2440 = _2348 * _2046;
    float _2442 = -_1875;
    float _2444 = _2442 + _1934;
    float _2446 = _2444 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _2448 = precise::max(_2446, _2078);
    float _2450 = precise::min(0.0, _2448);
    bool _2452 = _2450 != _2446;
    bool _2454 = isnan(_2450);
    bool _2456 = _2452 || _2454;
    bool _2458 = isnan(_2446);
    bool _2460 = _2456 || _2458;
    bool _2462 = !_2460;
    float _2754;
    if (!_2462)
    {
        float _2464 = _1877 + _2350;
        float _2466 = _1873 + _2352;
        float3 _11263 = float3(_2464, _2466, float(int(_1896)));
        float3 _11265 = select(_11263, float3(0.0), isnan(_11263));
        float _2468 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11265.xy, uint(rint(_11265.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11265.xy, uint(rint(_11265.z))).x;
        float _2470 = _1875 + _2062;
        float _2472 = _2062 * 3.0;
        float _2474 = -_2470;
        float _2476 = _2474 + _2468;
        float _2478 = _2476 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _2480 = precise::max(_2478, _2472);
        float _2482 = precise::min(0.0, _2480);
        bool _2484 = _2482 != _2478;
        bool _2486 = isnan(_2482);
        bool _2488 = _2484 || _2486;
        bool _2490 = isnan(_2478);
        bool _2492 = _2488 || _2490;
        bool _2494 = !_2492;
        if (!_2494)
        {
            float _2496 = fma(_2350, 2.0, _1877);
            float _2498 = fma(_2352, 2.0, _1873);
            float3 _11318 = float3(_2496, _2498, float(int(_1896)));
            float3 _11320 = select(_11318, float3(0.0), isnan(_11318));
            float _2500 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11320.xy, uint(rint(_11320.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11320.xy, uint(rint(_11320.z))).x;
            float _2502 = fma(_2062, 2.0, _1875);
            float _2504 = _2062 * 4.5;
            float _2506 = -_2502;
            float _2508 = _2506 + _2500;
            float _2510 = _2508 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _2512 = precise::max(_2510, _2504);
            float _2514 = precise::min(0.0, _2512);
            bool _2516 = _2514 != _2510;
            bool _2518 = isnan(_2514);
            bool _2520 = _2516 || _2518;
            bool _2522 = isnan(_2510);
            bool _2524 = _2520 || _2522;
            bool _2526 = !_2524;
            if (!_2526)
            {
                float _2528 = fma(_2350, 3.0, _1877);
                float _2530 = fma(_2352, 3.0, _1873);
                float3 _11373 = float3(_2528, _2530, float(int(_1896)));
                float3 _11375 = select(_11373, float3(0.0), isnan(_11373));
                float _2532 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11375.xy, uint(rint(_11375.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11375.xy, uint(rint(_11375.z))).x;
                float _2534 = fma(_2062, 3.0, _1875);
                float _2536 = _2062 * 6.0;
                float _2538 = -_2534;
                float _2540 = _2538 + _2532;
                float _2542 = _2540 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _2544 = precise::max(_2542, _2536);
                float _2546 = precise::min(0.0, _2544);
                bool _2548 = _2546 != _2542;
                bool _2550 = isnan(_2546);
                bool _2552 = _2548 || _2550;
                bool _2554 = isnan(_2542);
                bool _2556 = _2552 || _2554;
                bool _2558 = !_2556;
                if (!_2558)
                {
                    float _2560 = fma(_2350, 4.0, _1877);
                    float _2562 = fma(_2352, 4.0, _1873);
                    float3 _11429 = float3(_2560, _2562, float(int(_1896)));
                    float3 _11431 = select(_11429, float3(0.0), isnan(_11429));
                    float _2564 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11431.xy, uint(rint(_11431.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11431.xy, uint(rint(_11431.z))).x;
                    float _2566 = fma(_2062, 4.0, _1875);
                    float _2568 = _2062 * 7.5;
                    float _2570 = -_2566;
                    float _2572 = _2570 + _2564;
                    float _2574 = _2572 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _2576 = precise::max(_2574, _2568);
                    float _2578 = precise::min(0.0, _2576);
                    bool _2580 = _2578 != _2574;
                    bool _2582 = isnan(_2578);
                    bool _2584 = _2580 || _2582;
                    bool _2586 = isnan(_2574);
                    bool _2588 = _2584 || _2586;
                    bool _2590 = !_2588;
                    if (!_2590)
                    {
                        float _2592 = fma(_2350, 5.0, _1877);
                        float _2594 = fma(_2352, 5.0, _1873);
                        float3 _11485 = float3(_2592, _2594, float(int(_1896)));
                        float3 _11487 = select(_11485, float3(0.0), isnan(_11485));
                        float _2596 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11487.xy, uint(rint(_11487.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11487.xy, uint(rint(_11487.z))).x;
                        float _2598 = fma(_2062, 5.0, _1875);
                        float _2600 = _2062 * 9.0;
                        float _2602 = -_2598;
                        float _2604 = _2602 + _2596;
                        float _2606 = _2604 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _2608 = precise::max(_2606, _2600);
                        float _2610 = precise::min(0.0, _2608);
                        bool _2612 = _2610 != _2606;
                        bool _2614 = isnan(_2610);
                        bool _2616 = _2612 || _2614;
                        bool _2618 = isnan(_2606);
                        bool _2620 = _2616 || _2618;
                        bool _2622 = !_2620;
                        if (!_2622)
                        {
                            float _2624 = fma(_2350, 6.0, _1877);
                            float _2626 = fma(_2352, 6.0, _1873);
                            float3 _11540 = float3(_2624, _2626, float(int(_1896)));
                            float3 _11542 = select(_11540, float3(0.0), isnan(_11540));
                            float _2628 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11542.xy, uint(rint(_11542.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11542.xy, uint(rint(_11542.z))).x;
                            float _2630 = fma(_2062, 6.0, _1875);
                            float _2632 = _2062 * 10.5;
                            float _2634 = -_2630;
                            float _2636 = _2634 + _2628;
                            float _2638 = _2636 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _2640 = precise::max(_2638, _2632);
                            float _2642 = precise::min(0.0, _2640);
                            bool _2644 = _2642 != _2638;
                            bool _2646 = isnan(_2642);
                            bool _2648 = _2644 || _2646;
                            bool _2650 = isnan(_2638);
                            bool _2652 = _2648 || _2650;
                            bool _2654 = !_2652;
                            if (!_2654)
                            {
                                float _2656 = fma(_2350, 7.0, _1877);
                                float _2658 = fma(_2352, 7.0, _1873);
                                float3 _11596 = float3(_2656, _2658, float(int(_1896)));
                                float3 _11598 = select(_11596, float3(0.0), isnan(_11596));
                                float _2660 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11598.xy, uint(rint(_11598.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11598.xy, uint(rint(_11598.z))).x;
                                float _2662 = fma(_2062, 7.0, _1875);
                                float _2664 = _2062 * 12.0;
                                float _2666 = -_2662;
                                float _2668 = _2666 + _2660;
                                float _2670 = _2668 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _2672 = precise::max(_2670, _2664);
                                float _2674 = precise::min(0.0, _2672);
                                bool _2676 = _2674 != _2670;
                                bool _2678 = isnan(_2674);
                                bool _2680 = _2676 || _2678;
                                bool _2682 = isnan(_2670);
                                bool _2684 = _2680 || _2682;
                                bool _2686 = !_2684;
                                if (!_2686)
                                {
                                    float _2688 = fma(_2350, 8.0, _1877);
                                    float _2690 = fma(_2352, 8.0, _1873);
                                    float3 _11652 = float3(_2688, _2690, float(int(_1896)));
                                    float3 _11654 = select(_11652, float3(0.0), isnan(_11652));
                                    float _2692 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11654.xy, uint(rint(_11654.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11654.xy, uint(rint(_11654.z))).x;
                                    float _2694 = fma(_2062, 8.0, _1875);
                                    float _2696 = fma(_2062, 13.5, -1.0);
                                    float _2698 = -_2694;
                                    float _2700 = _2698 + _2692;
                                    float _2702 = _2700 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _2704 = precise::max(_2702, _2696);
                                    float _2706 = precise::min(0.0, _2704);
                                    bool _2708 = _2706 != _2702;
                                    bool _2710 = isnan(_2706);
                                    bool _2712 = _2708 || _2710;
                                    bool _2714 = isnan(_2702);
                                    bool _2716 = _2712 || _2714;
                                    bool _2718 = !_2716;
                                    if (!_2718)
                                    {
                                        float _2720 = fma(_2350, 9.0, _1877);
                                        float _2722 = fma(_2352, 9.0, _1873);
                                        float3 _11707 = float3(_2720, _2722, float(int(_1896)));
                                        float3 _11709 = select(_11707, float3(0.0), isnan(_11707));
                                        float _2724 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11709.xy, uint(rint(_11709.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11709.xy, uint(rint(_11709.z))).x;
                                        float _2726 = fma(_2062, 9.0, _1875);
                                        float _2728 = fma(_2062, 15.0, -1.0);
                                        float _2730 = -_2726;
                                        float _2732 = _2730 + _2724;
                                        float _2734 = _2732 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _2736 = precise::max(_2734, _2728);
                                        float _2738 = precise::min(0.0, _2736);
                                        bool _2740 = _2738 != _2734;
                                        bool _2742 = isnan(_2738);
                                        bool _2744 = _2740 || _2742;
                                        bool _2746 = isnan(_2734);
                                        bool _2748 = _2744 || _2746;
                                        float _2750 = _2734;
                                        if (_2748)
                                        {
                                            _2750 = 0.0;
                                        }
                                        float _2752 = _2750;
                                        _2754 = _2752;
                                        _2756 = _2748;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_2756)
    {
        _2754 = 1.0;
    }
    _2756 = false;
    float _2758 = _2754;
    float _2760 = _2358 * 1.5;
    float _2762 = precise::max(_2446, _2760);
    float _2764 = precise::min(0.0, _2762);
    bool _2766 = _2764 != _2446;
    bool _2768 = isnan(_2764);
    bool _2770 = _2766 || _2768;
    bool _2772 = isnan(_2446);
    bool _2774 = _2770 || _2772;
    bool _2776 = !_2774;
    float _2778 = _2758;
    if (!_2776)
    {
        float _2780 = _1877 + _2354;
        float _2782 = _1873 + _2356;
        float3 _11804 = float3(_2780, _2782, float(int(_1896)));
        float3 _11806 = select(_11804, float3(0.0), isnan(_11804));
        float _2784 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11806.xy, uint(rint(_11806.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11806.xy, uint(rint(_11806.z))).x;
        float _2786 = _1875 + _2358;
        float _2788 = _2358 * 3.0;
        float _2790 = -_2786;
        float _2792 = _2790 + _2784;
        float _2794 = _2792 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _2796 = precise::max(_2794, _2788);
        float _2798 = precise::min(0.0, _2796);
        bool _2800 = _2798 != _2794;
        bool _2802 = isnan(_2798);
        bool _2804 = _2800 || _2802;
        bool _2806 = isnan(_2794);
        bool _2808 = _2804 || _2806;
        bool _2810 = !_2808;
        if (!_2810)
        {
            float _2812 = fma(_2354, 2.0, _1877);
            float _2814 = fma(_2356, 2.0, _1873);
            float3 _11858 = float3(_2812, _2814, float(int(_1896)));
            float3 _11860 = select(_11858, float3(0.0), isnan(_11858));
            float _2816 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11860.xy, uint(rint(_11860.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11860.xy, uint(rint(_11860.z))).x;
            float _2818 = fma(_2358, 2.0, _1875);
            float _2820 = _2358 * 4.5;
            float _2822 = -_2818;
            float _2824 = _2822 + _2816;
            float _2826 = _2824 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _2828 = precise::max(_2826, _2820);
            float _2830 = precise::min(0.0, _2828);
            bool _2832 = _2830 != _2826;
            bool _2834 = isnan(_2830);
            bool _2836 = _2832 || _2834;
            bool _2838 = isnan(_2826);
            bool _2840 = _2836 || _2838;
            bool _2842 = !_2840;
            if (!_2842)
            {
                float _2844 = fma(_2354, 3.0, _1877);
                float _2846 = fma(_2356, 3.0, _1873);
                float3 _11912 = float3(_2844, _2846, float(int(_1896)));
                float3 _11914 = select(_11912, float3(0.0), isnan(_11912));
                float _2848 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11914.xy, uint(rint(_11914.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11914.xy, uint(rint(_11914.z))).x;
                float _2850 = fma(_2358, 3.0, _1875);
                float _2852 = _2358 * 6.0;
                float _2854 = -_2850;
                float _2856 = _2854 + _2848;
                float _2858 = _2856 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _2860 = precise::max(_2858, _2852);
                float _2862 = precise::min(0.0, _2860);
                bool _2864 = _2862 != _2858;
                bool _2866 = isnan(_2862);
                bool _2868 = _2864 || _2866;
                bool _2870 = isnan(_2858);
                bool _2872 = _2868 || _2870;
                bool _2874 = !_2872;
                if (!_2874)
                {
                    float _2876 = fma(_2354, 4.0, _1877);
                    float _2878 = fma(_2356, 4.0, _1873);
                    float3 _11966 = float3(_2876, _2878, float(int(_1896)));
                    float3 _11968 = select(_11966, float3(0.0), isnan(_11966));
                    float _2880 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11968.xy, uint(rint(_11968.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11968.xy, uint(rint(_11968.z))).x;
                    float _2882 = fma(_2358, 4.0, _1875);
                    float _2884 = _2358 * 7.5;
                    float _2886 = -_2882;
                    float _2888 = _2886 + _2880;
                    float _2890 = _2888 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _2892 = precise::max(_2890, _2884);
                    float _2894 = precise::min(0.0, _2892);
                    bool _2896 = _2894 != _2890;
                    bool _2898 = isnan(_2894);
                    bool _2900 = _2896 || _2898;
                    bool _2902 = isnan(_2890);
                    bool _2904 = _2900 || _2902;
                    bool _2906 = !_2904;
                    if (!_2906)
                    {
                        float _2908 = fma(_2354, 5.0, _1877);
                        float _2910 = fma(_2356, 5.0, _1873);
                        float3 _12020 = float3(_2908, _2910, float(int(_1896)));
                        float3 _12022 = select(_12020, float3(0.0), isnan(_12020));
                        float _2912 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12022.xy, uint(rint(_12022.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12022.xy, uint(rint(_12022.z))).x;
                        float _2914 = fma(_2358, 5.0, _1875);
                        float _2916 = _2358 * 9.0;
                        float _2918 = -_2914;
                        float _2920 = _2918 + _2912;
                        float _2922 = _2920 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _2924 = precise::max(_2922, _2916);
                        float _2926 = precise::min(0.0, _2924);
                        bool _2928 = _2926 != _2922;
                        bool _2930 = isnan(_2926);
                        bool _2932 = _2928 || _2930;
                        bool _2934 = isnan(_2922);
                        bool _2936 = _2932 || _2934;
                        bool _2938 = !_2936;
                        if (!_2938)
                        {
                            float _2940 = fma(_2354, 6.0, _1877);
                            float _2942 = fma(_2356, 6.0, _1873);
                            float3 _12074 = float3(_2940, _2942, float(int(_1896)));
                            float3 _12076 = select(_12074, float3(0.0), isnan(_12074));
                            float _2944 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12076.xy, uint(rint(_12076.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12076.xy, uint(rint(_12076.z))).x;
                            float _2946 = fma(_2358, 6.0, _1875);
                            float _2948 = _2358 * 10.5;
                            float _2950 = -_2946;
                            float _2952 = _2950 + _2944;
                            float _2954 = _2952 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _2956 = precise::max(_2954, _2948);
                            float _2958 = precise::min(0.0, _2956);
                            bool _2960 = _2958 != _2954;
                            bool _2962 = isnan(_2958);
                            bool _2964 = _2960 || _2962;
                            bool _2966 = isnan(_2954);
                            bool _2968 = _2964 || _2966;
                            bool _2970 = !_2968;
                            if (!_2970)
                            {
                                float _2972 = fma(_2354, 7.0, _1877);
                                float _2974 = fma(_2356, 7.0, _1873);
                                float3 _12128 = float3(_2972, _2974, float(int(_1896)));
                                float3 _12130 = select(_12128, float3(0.0), isnan(_12128));
                                float _2976 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12130.xy, uint(rint(_12130.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12130.xy, uint(rint(_12130.z))).x;
                                float _2978 = fma(_2358, 7.0, _1875);
                                float _2980 = _2358 * 12.0;
                                float _2982 = -_2978;
                                float _2984 = _2982 + _2976;
                                float _2986 = _2984 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _2988 = precise::max(_2986, _2980);
                                float _2990 = precise::min(0.0, _2988);
                                bool _2992 = _2990 != _2986;
                                bool _2994 = isnan(_2990);
                                bool _2996 = _2992 || _2994;
                                bool _2998 = isnan(_2986);
                                bool _3000 = _2996 || _2998;
                                bool _3002 = !_3000;
                                if (!_3002)
                                {
                                    float _3004 = fma(_2354, 8.0, _1877);
                                    float _3006 = fma(_2356, 8.0, _1873);
                                    float3 _12182 = float3(_3004, _3006, float(int(_1896)));
                                    float3 _12184 = select(_12182, float3(0.0), isnan(_12182));
                                    float _3008 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12184.xy, uint(rint(_12184.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12184.xy, uint(rint(_12184.z))).x;
                                    float _3010 = fma(_2358, 8.0, _1875);
                                    float _3012 = fma(_2358, 13.5, -1.0);
                                    float _3014 = -_3010;
                                    float _3016 = _3014 + _3008;
                                    float _3018 = _3016 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _3020 = precise::max(_3018, _3012);
                                    float _3022 = precise::min(0.0, _3020);
                                    bool _3024 = _3022 != _3018;
                                    bool _3026 = isnan(_3022);
                                    bool _3028 = _3024 || _3026;
                                    bool _3030 = isnan(_3018);
                                    bool _3032 = _3028 || _3030;
                                    bool _3034 = !_3032;
                                    if (!_3034)
                                    {
                                        float _3036 = fma(_2354, 9.0, _1877);
                                        float _3038 = fma(_2356, 9.0, _1873);
                                        float3 _12236 = float3(_3036, _3038, float(int(_1896)));
                                        float3 _12238 = select(_12236, float3(0.0), isnan(_12236));
                                        float _3040 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12238.xy, uint(rint(_12238.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12238.xy, uint(rint(_12238.z))).x;
                                        float _3042 = fma(_2358, 9.0, _1875);
                                        float _3044 = fma(_2358, 15.0, -1.0);
                                        float _3046 = -_3042;
                                        float _3048 = _3046 + _3040;
                                        float _3050 = _3048 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _3052 = precise::max(_3050, _3044);
                                        float _3054 = precise::min(0.0, _3052);
                                        bool _3056 = _3054 != _3050;
                                        bool _3058 = isnan(_3054);
                                        bool _3060 = _3056 || _3058;
                                        bool _3062 = isnan(_3050);
                                        bool _3064 = _3060 || _3062;
                                        _3066 = _3064;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_3066)
    {
        float _3068 = _2758 + 1.0;
        _2778 = _3068;
    }
    _3066 = false;
    float _3070 = _2778;
    float _3072 = _2364 * 1.5;
    float _3074 = precise::max(_2446, _3072);
    float _3076 = precise::min(0.0, _3074);
    bool _3078 = _3076 != _2446;
    bool _3080 = isnan(_3076);
    bool _3082 = _3078 || _3080;
    bool _3084 = isnan(_2446);
    bool _3086 = _3082 || _3084;
    bool _3088 = !_3086;
    float _3090 = _3070;
    if (!_3088)
    {
        float _3092 = _1873 + _2362;
        float _3094 = _1877 + _2360;
        float3 _12329 = float3(_3094, _3092, float(int(_1896)));
        float3 _12331 = select(_12329, float3(0.0), isnan(_12329));
        float _3096 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12331.xy, uint(rint(_12331.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12331.xy, uint(rint(_12331.z))).x;
        float _3098 = _1875 + _2364;
        float _3100 = _2364 * 3.0;
        float _3102 = -_3098;
        float _3104 = _3102 + _3096;
        float _3106 = _3104 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _3108 = precise::max(_3106, _3100);
        float _3110 = precise::min(0.0, _3108);
        bool _3112 = _3110 != _3106;
        bool _3114 = isnan(_3110);
        bool _3116 = _3112 || _3114;
        bool _3118 = isnan(_3106);
        bool _3120 = _3116 || _3118;
        bool _3122 = !_3120;
        if (!_3122)
        {
            float _3124 = fma(_2362, 2.0, _1873);
            float _3126 = fma(_2360, 2.0, _1877);
            float3 _12383 = float3(_3126, _3124, float(int(_1896)));
            float3 _12385 = select(_12383, float3(0.0), isnan(_12383));
            float _3128 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12385.xy, uint(rint(_12385.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12385.xy, uint(rint(_12385.z))).x;
            float _3130 = fma(_2364, 2.0, _1875);
            float _3132 = _2364 * 4.5;
            float _3134 = -_3130;
            float _3136 = _3134 + _3128;
            float _3138 = _3136 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _3140 = precise::max(_3138, _3132);
            float _3142 = precise::min(0.0, _3140);
            bool _3144 = _3142 != _3138;
            bool _3146 = isnan(_3142);
            bool _3148 = _3144 || _3146;
            bool _3150 = isnan(_3138);
            bool _3152 = _3148 || _3150;
            bool _3154 = !_3152;
            if (!_3154)
            {
                float _3156 = fma(_2362, 3.0, _1873);
                float _3158 = fma(_2360, 3.0, _1877);
                float3 _12437 = float3(_3158, _3156, float(int(_1896)));
                float3 _12439 = select(_12437, float3(0.0), isnan(_12437));
                float _3160 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12439.xy, uint(rint(_12439.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12439.xy, uint(rint(_12439.z))).x;
                float _3162 = fma(_2364, 3.0, _1875);
                float _3164 = _2364 * 6.0;
                float _3166 = -_3162;
                float _3168 = _3166 + _3160;
                float _3170 = _3168 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _3172 = precise::max(_3170, _3164);
                float _3174 = precise::min(0.0, _3172);
                bool _3176 = _3174 != _3170;
                bool _3178 = isnan(_3174);
                bool _3180 = _3176 || _3178;
                bool _3182 = isnan(_3170);
                bool _3184 = _3180 || _3182;
                bool _3186 = !_3184;
                if (!_3186)
                {
                    float _3188 = fma(_2362, 4.0, _1873);
                    float _3190 = fma(_2360, 4.0, _1877);
                    float3 _12491 = float3(_3190, _3188, float(int(_1896)));
                    float3 _12493 = select(_12491, float3(0.0), isnan(_12491));
                    float _3192 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12493.xy, uint(rint(_12493.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12493.xy, uint(rint(_12493.z))).x;
                    float _3194 = fma(_2364, 4.0, _1875);
                    float _3196 = _2364 * 7.5;
                    float _3198 = -_3194;
                    float _3200 = _3198 + _3192;
                    float _3202 = _3200 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _3204 = precise::max(_3202, _3196);
                    float _3206 = precise::min(0.0, _3204);
                    bool _3208 = _3206 != _3202;
                    bool _3210 = isnan(_3206);
                    bool _3212 = _3208 || _3210;
                    bool _3214 = isnan(_3202);
                    bool _3216 = _3212 || _3214;
                    bool _3218 = !_3216;
                    if (!_3218)
                    {
                        float _3220 = fma(_2362, 5.0, _1873);
                        float _3222 = fma(_2360, 5.0, _1877);
                        float3 _12545 = float3(_3222, _3220, float(int(_1896)));
                        float3 _12547 = select(_12545, float3(0.0), isnan(_12545));
                        float _3224 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12547.xy, uint(rint(_12547.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12547.xy, uint(rint(_12547.z))).x;
                        float _3226 = fma(_2364, 5.0, _1875);
                        float _3228 = _2364 * 9.0;
                        float _3230 = -_3226;
                        float _3232 = _3230 + _3224;
                        float _3234 = _3232 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _3236 = precise::max(_3234, _3228);
                        float _3238 = precise::min(0.0, _3236);
                        bool _3240 = _3238 != _3234;
                        bool _3242 = isnan(_3238);
                        bool _3244 = _3240 || _3242;
                        bool _3246 = isnan(_3234);
                        bool _3248 = _3244 || _3246;
                        bool _3250 = !_3248;
                        if (!_3250)
                        {
                            float _3252 = fma(_2362, 6.0, _1873);
                            float _3254 = fma(_2360, 6.0, _1877);
                            float3 _12599 = float3(_3254, _3252, float(int(_1896)));
                            float3 _12601 = select(_12599, float3(0.0), isnan(_12599));
                            float _3256 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12601.xy, uint(rint(_12601.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12601.xy, uint(rint(_12601.z))).x;
                            float _3258 = fma(_2364, 6.0, _1875);
                            float _3260 = _2364 * 10.5;
                            float _3262 = -_3258;
                            float _3264 = _3262 + _3256;
                            float _3266 = _3264 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _3268 = precise::max(_3266, _3260);
                            float _3270 = precise::min(0.0, _3268);
                            bool _3272 = _3270 != _3266;
                            bool _3274 = isnan(_3270);
                            bool _3276 = _3272 || _3274;
                            bool _3278 = isnan(_3266);
                            bool _3280 = _3276 || _3278;
                            bool _3282 = !_3280;
                            if (!_3282)
                            {
                                float _3284 = fma(_2362, 7.0, _1873);
                                float _3286 = fma(_2360, 7.0, _1877);
                                float3 _12653 = float3(_3286, _3284, float(int(_1896)));
                                float3 _12655 = select(_12653, float3(0.0), isnan(_12653));
                                float _3288 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12655.xy, uint(rint(_12655.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12655.xy, uint(rint(_12655.z))).x;
                                float _3290 = fma(_2364, 7.0, _1875);
                                float _3292 = _2364 * 12.0;
                                float _3294 = -_3290;
                                float _3296 = _3294 + _3288;
                                float _3298 = _3296 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _3300 = precise::max(_3298, _3292);
                                float _3302 = precise::min(0.0, _3300);
                                bool _3304 = _3302 != _3298;
                                bool _3306 = isnan(_3302);
                                bool _3308 = _3304 || _3306;
                                bool _3310 = isnan(_3298);
                                bool _3312 = _3308 || _3310;
                                bool _3314 = !_3312;
                                if (!_3314)
                                {
                                    float _3316 = fma(_2362, 8.0, _1873);
                                    float _3318 = fma(_2360, 8.0, _1877);
                                    float3 _12707 = float3(_3318, _3316, float(int(_1896)));
                                    float3 _12709 = select(_12707, float3(0.0), isnan(_12707));
                                    float _3320 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12709.xy, uint(rint(_12709.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12709.xy, uint(rint(_12709.z))).x;
                                    float _3322 = fma(_2364, 8.0, _1875);
                                    float _3324 = fma(_2364, 13.5, -1.0);
                                    float _3326 = -_3322;
                                    float _3328 = _3326 + _3320;
                                    float _3330 = _3328 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _3332 = precise::max(_3330, _3324);
                                    float _3334 = precise::min(0.0, _3332);
                                    bool _3336 = _3334 != _3330;
                                    bool _3338 = isnan(_3334);
                                    bool _3340 = _3336 || _3338;
                                    bool _3342 = isnan(_3330);
                                    bool _3344 = _3340 || _3342;
                                    bool _3346 = !_3344;
                                    if (!_3346)
                                    {
                                        float _3348 = fma(_2360, 9.0, _1877);
                                        float _3350 = fma(_2362, 9.0, _1873);
                                        float3 _12761 = float3(_3348, _3350, float(int(_1896)));
                                        float3 _12763 = select(_12761, float3(0.0), isnan(_12761));
                                        float _3352 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12763.xy, uint(rint(_12763.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12763.xy, uint(rint(_12763.z))).x;
                                        float _3354 = fma(_2364, 9.0, _1875);
                                        float _3356 = fma(_2364, 15.0, -1.0);
                                        float _3358 = -_3354;
                                        float _3360 = _3358 + _3352;
                                        float _3362 = _3360 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _3364 = precise::max(_3362, _3356);
                                        float _3366 = precise::min(0.0, _3364);
                                        bool _3368 = _3366 != _3362;
                                        bool _3370 = isnan(_3366);
                                        bool _3372 = _3368 || _3370;
                                        bool _3374 = isnan(_3362);
                                        bool _3376 = _3372 || _3374;
                                        _3378 = _3376;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_3378)
    {
        float _3380 = _3070 + 1.0;
        _3090 = _3380;
    }
    _3378 = false;
    float _3382 = _3090;
    float _3384 = _2370 * 1.5;
    float _3386 = precise::max(_2446, _3384);
    float _3388 = precise::min(0.0, _3386);
    bool _3390 = _3388 != _2446;
    bool _3392 = isnan(_3388);
    bool _3394 = _3390 || _3392;
    bool _3396 = isnan(_2446);
    bool _3398 = _3394 || _3396;
    bool _3400 = !_3398;
    float _3402 = _3382;
    if (!_3400)
    {
        float _3404 = _1873 + _2368;
        float _3406 = _1877 + _2366;
        float3 _12854 = float3(_3406, _3404, float(int(_1896)));
        float3 _12856 = select(_12854, float3(0.0), isnan(_12854));
        float _3408 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12856.xy, uint(rint(_12856.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12856.xy, uint(rint(_12856.z))).x;
        float _3410 = _1875 + _2370;
        float _3412 = _2370 * 3.0;
        float _3414 = -_3410;
        float _3416 = _3414 + _3408;
        float _3418 = _3416 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _3420 = precise::max(_3418, _3412);
        float _3422 = precise::min(0.0, _3420);
        bool _3424 = _3422 != _3418;
        bool _3426 = isnan(_3422);
        bool _3428 = _3424 || _3426;
        bool _3430 = isnan(_3418);
        bool _3432 = _3428 || _3430;
        bool _3434 = !_3432;
        if (!_3434)
        {
            float _3436 = fma(_2368, 2.0, _1873);
            float _3438 = fma(_2366, 2.0, _1877);
            float3 _12908 = float3(_3438, _3436, float(int(_1896)));
            float3 _12910 = select(_12908, float3(0.0), isnan(_12908));
            float _3440 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12910.xy, uint(rint(_12910.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12910.xy, uint(rint(_12910.z))).x;
            float _3442 = fma(_2370, 2.0, _1875);
            float _3444 = _2370 * 4.5;
            float _3446 = -_3442;
            float _3448 = _3446 + _3440;
            float _3450 = _3448 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _3452 = precise::max(_3450, _3444);
            float _3454 = precise::min(0.0, _3452);
            bool _3456 = _3454 != _3450;
            bool _3458 = isnan(_3454);
            bool _3460 = _3456 || _3458;
            bool _3462 = isnan(_3450);
            bool _3464 = _3460 || _3462;
            bool _3466 = !_3464;
            if (!_3466)
            {
                float _3468 = fma(_2368, 3.0, _1873);
                float _3470 = fma(_2366, 3.0, _1877);
                float3 _12962 = float3(_3470, _3468, float(int(_1896)));
                float3 _12964 = select(_12962, float3(0.0), isnan(_12962));
                float _3472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12964.xy, uint(rint(_12964.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12964.xy, uint(rint(_12964.z))).x;
                float _3474 = fma(_2370, 3.0, _1875);
                float _3476 = _2370 * 6.0;
                float _3478 = -_3474;
                float _3480 = _3478 + _3472;
                float _3482 = _3480 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _3484 = precise::max(_3482, _3476);
                float _3486 = precise::min(0.0, _3484);
                bool _3488 = _3486 != _3482;
                bool _3490 = isnan(_3486);
                bool _3492 = _3488 || _3490;
                bool _3494 = isnan(_3482);
                bool _3496 = _3492 || _3494;
                bool _3498 = !_3496;
                if (!_3498)
                {
                    float _3500 = fma(_2368, 4.0, _1873);
                    float _3502 = fma(_2366, 4.0, _1877);
                    float3 _13016 = float3(_3502, _3500, float(int(_1896)));
                    float3 _13018 = select(_13016, float3(0.0), isnan(_13016));
                    float _3504 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13018.xy, uint(rint(_13018.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13018.xy, uint(rint(_13018.z))).x;
                    float _3506 = fma(_2370, 4.0, _1875);
                    float _3508 = _2370 * 7.5;
                    float _3510 = -_3506;
                    float _3512 = _3510 + _3504;
                    float _3514 = _3512 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _3516 = precise::max(_3514, _3508);
                    float _3518 = precise::min(0.0, _3516);
                    bool _3520 = _3518 != _3514;
                    bool _3522 = isnan(_3518);
                    bool _3524 = _3520 || _3522;
                    bool _3526 = isnan(_3514);
                    bool _3528 = _3524 || _3526;
                    bool _3530 = !_3528;
                    if (!_3530)
                    {
                        float _3532 = fma(_2368, 5.0, _1873);
                        float _3534 = fma(_2366, 5.0, _1877);
                        float3 _13070 = float3(_3534, _3532, float(int(_1896)));
                        float3 _13072 = select(_13070, float3(0.0), isnan(_13070));
                        float _3536 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13072.xy, uint(rint(_13072.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13072.xy, uint(rint(_13072.z))).x;
                        float _3538 = fma(_2370, 5.0, _1875);
                        float _3540 = _2370 * 9.0;
                        float _3542 = -_3538;
                        float _3544 = _3542 + _3536;
                        float _3546 = _3544 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _3548 = precise::max(_3546, _3540);
                        float _3550 = precise::min(0.0, _3548);
                        bool _3552 = _3550 != _3546;
                        bool _3554 = isnan(_3550);
                        bool _3556 = _3552 || _3554;
                        bool _3558 = isnan(_3546);
                        bool _3560 = _3556 || _3558;
                        bool _3562 = !_3560;
                        if (!_3562)
                        {
                            float _3564 = fma(_2368, 6.0, _1873);
                            float _3566 = fma(_2366, 6.0, _1877);
                            float3 _13124 = float3(_3566, _3564, float(int(_1896)));
                            float3 _13126 = select(_13124, float3(0.0), isnan(_13124));
                            float _3568 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13126.xy, uint(rint(_13126.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13126.xy, uint(rint(_13126.z))).x;
                            float _3570 = fma(_2370, 6.0, _1875);
                            float _3572 = _2370 * 10.5;
                            float _3574 = -_3570;
                            float _3576 = _3574 + _3568;
                            float _3578 = _3576 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _3580 = precise::max(_3578, _3572);
                            float _3582 = precise::min(0.0, _3580);
                            bool _3584 = _3582 != _3578;
                            bool _3586 = isnan(_3582);
                            bool _3588 = _3584 || _3586;
                            bool _3590 = isnan(_3578);
                            bool _3592 = _3588 || _3590;
                            bool _3594 = !_3592;
                            if (!_3594)
                            {
                                float _3596 = fma(_2368, 7.0, _1873);
                                float _3598 = fma(_2366, 7.0, _1877);
                                float3 _13178 = float3(_3598, _3596, float(int(_1896)));
                                float3 _13180 = select(_13178, float3(0.0), isnan(_13178));
                                float _3600 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13180.xy, uint(rint(_13180.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13180.xy, uint(rint(_13180.z))).x;
                                float _3602 = fma(_2370, 7.0, _1875);
                                float _3604 = _2370 * 12.0;
                                float _3606 = -_3602;
                                float _3608 = _3606 + _3600;
                                float _3610 = _3608 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _3612 = precise::max(_3610, _3604);
                                float _3614 = precise::min(0.0, _3612);
                                bool _3616 = _3614 != _3610;
                                bool _3618 = isnan(_3614);
                                bool _3620 = _3616 || _3618;
                                bool _3622 = isnan(_3610);
                                bool _3624 = _3620 || _3622;
                                bool _3626 = !_3624;
                                if (!_3626)
                                {
                                    float _3628 = fma(_2368, 8.0, _1873);
                                    float _3630 = fma(_2366, 8.0, _1877);
                                    float3 _13232 = float3(_3630, _3628, float(int(_1896)));
                                    float3 _13234 = select(_13232, float3(0.0), isnan(_13232));
                                    float _3632 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13234.xy, uint(rint(_13234.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13234.xy, uint(rint(_13234.z))).x;
                                    float _3634 = fma(_2370, 8.0, _1875);
                                    float _3636 = fma(_2370, 13.5, -1.0);
                                    float _3638 = -_3634;
                                    float _3640 = _3638 + _3632;
                                    float _3642 = _3640 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _3644 = precise::max(_3642, _3636);
                                    float _3646 = precise::min(0.0, _3644);
                                    bool _3648 = _3646 != _3642;
                                    bool _3650 = isnan(_3646);
                                    bool _3652 = _3648 || _3650;
                                    bool _3654 = isnan(_3642);
                                    bool _3656 = _3652 || _3654;
                                    bool _3658 = !_3656;
                                    if (!_3658)
                                    {
                                        float _3660 = fma(_2366, 9.0, _1877);
                                        float _3662 = fma(_2368, 9.0, _1873);
                                        float3 _13286 = float3(_3660, _3662, float(int(_1896)));
                                        float3 _13288 = select(_13286, float3(0.0), isnan(_13286));
                                        float _3664 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13288.xy, uint(rint(_13288.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13288.xy, uint(rint(_13288.z))).x;
                                        float _3666 = fma(_2370, 9.0, _1875);
                                        float _3668 = fma(_2370, 15.0, -1.0);
                                        float _3670 = -_3666;
                                        float _3672 = _3670 + _3664;
                                        float _3674 = _3672 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _3676 = precise::max(_3674, _3668);
                                        float _3678 = precise::min(0.0, _3676);
                                        bool _3680 = _3678 != _3674;
                                        bool _3682 = isnan(_3678);
                                        bool _3684 = _3680 || _3682;
                                        bool _3686 = isnan(_3674);
                                        bool _3688 = _3684 || _3686;
                                        _3690 = _3688;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_3690)
    {
        float _3692 = _3382 + 1.0;
        _3402 = _3692;
    }
    _3690 = false;
    float _3694 = _3402;
    float _3696 = _2376 * 1.5;
    float _3698 = precise::max(_2446, _3696);
    float _3700 = precise::min(0.0, _3698);
    bool _3702 = _3700 != _2446;
    bool _3704 = isnan(_3700);
    bool _3706 = _3702 || _3704;
    bool _3708 = isnan(_2446);
    bool _3710 = _3706 || _3708;
    bool _3712 = !_3710;
    float _3714 = _3694;
    if (!_3712)
    {
        float _3716 = _1877 + _2372;
        float _3718 = _1873 + _2374;
        float3 _13379 = float3(_3716, _3718, float(int(_1896)));
        float3 _13381 = select(_13379, float3(0.0), isnan(_13379));
        float _3720 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13381.xy, uint(rint(_13381.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13381.xy, uint(rint(_13381.z))).x;
        float _3722 = _1875 + _2376;
        float _3724 = _2376 * 3.0;
        float _3726 = -_3722;
        float _3728 = _3726 + _3720;
        float _3730 = _3728 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _3732 = precise::max(_3730, _3724);
        float _3734 = precise::min(0.0, _3732);
        bool _3736 = _3734 != _3730;
        bool _3738 = isnan(_3734);
        bool _3740 = _3736 || _3738;
        bool _3742 = isnan(_3730);
        bool _3744 = _3740 || _3742;
        bool _3746 = !_3744;
        if (!_3746)
        {
            float _3748 = fma(_2372, 2.0, _1877);
            float _3750 = fma(_2374, 2.0, _1873);
            float3 _13433 = float3(_3748, _3750, float(int(_1896)));
            float3 _13435 = select(_13433, float3(0.0), isnan(_13433));
            float _3752 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13435.xy, uint(rint(_13435.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13435.xy, uint(rint(_13435.z))).x;
            float _3754 = fma(_2376, 2.0, _1875);
            float _3756 = _2376 * 4.5;
            float _3758 = -_3754;
            float _3760 = _3758 + _3752;
            float _3762 = _3760 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _3764 = precise::max(_3762, _3756);
            float _3766 = precise::min(0.0, _3764);
            bool _3768 = _3766 != _3762;
            bool _3770 = isnan(_3766);
            bool _3772 = _3768 || _3770;
            bool _3774 = isnan(_3762);
            bool _3776 = _3772 || _3774;
            bool _3778 = !_3776;
            if (!_3778)
            {
                float _3780 = fma(_2372, 3.0, _1877);
                float _3782 = fma(_2374, 3.0, _1873);
                float3 _13487 = float3(_3780, _3782, float(int(_1896)));
                float3 _13489 = select(_13487, float3(0.0), isnan(_13487));
                float _3784 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13489.xy, uint(rint(_13489.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13489.xy, uint(rint(_13489.z))).x;
                float _3786 = fma(_2376, 3.0, _1875);
                float _3788 = _2376 * 6.0;
                float _3790 = -_3786;
                float _3792 = _3790 + _3784;
                float _3794 = _3792 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _3796 = precise::max(_3794, _3788);
                float _3798 = precise::min(0.0, _3796);
                bool _3800 = _3798 != _3794;
                bool _3802 = isnan(_3798);
                bool _3804 = _3800 || _3802;
                bool _3806 = isnan(_3794);
                bool _3808 = _3804 || _3806;
                bool _3810 = !_3808;
                if (!_3810)
                {
                    float _3812 = fma(_2372, 4.0, _1877);
                    float _3814 = fma(_2374, 4.0, _1873);
                    float3 _13541 = float3(_3812, _3814, float(int(_1896)));
                    float3 _13543 = select(_13541, float3(0.0), isnan(_13541));
                    float _3816 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13543.xy, uint(rint(_13543.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13543.xy, uint(rint(_13543.z))).x;
                    float _3818 = fma(_2376, 4.0, _1875);
                    float _3820 = _2376 * 7.5;
                    float _3822 = -_3818;
                    float _3824 = _3822 + _3816;
                    float _3826 = _3824 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _3828 = precise::max(_3826, _3820);
                    float _3830 = precise::min(0.0, _3828);
                    bool _3832 = _3830 != _3826;
                    bool _3834 = isnan(_3830);
                    bool _3836 = _3832 || _3834;
                    bool _3838 = isnan(_3826);
                    bool _3840 = _3836 || _3838;
                    bool _3842 = !_3840;
                    if (!_3842)
                    {
                        float _3844 = fma(_2372, 5.0, _1877);
                        float _3846 = fma(_2374, 5.0, _1873);
                        float3 _13595 = float3(_3844, _3846, float(int(_1896)));
                        float3 _13597 = select(_13595, float3(0.0), isnan(_13595));
                        float _3848 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13597.xy, uint(rint(_13597.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13597.xy, uint(rint(_13597.z))).x;
                        float _3850 = fma(_2376, 5.0, _1875);
                        float _3852 = _2376 * 9.0;
                        float _3854 = -_3850;
                        float _3856 = _3854 + _3848;
                        float _3858 = _3856 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _3860 = precise::max(_3858, _3852);
                        float _3862 = precise::min(0.0, _3860);
                        bool _3864 = _3862 != _3858;
                        bool _3866 = isnan(_3862);
                        bool _3868 = _3864 || _3866;
                        bool _3870 = isnan(_3858);
                        bool _3872 = _3868 || _3870;
                        bool _3874 = !_3872;
                        if (!_3874)
                        {
                            float _3876 = fma(_2372, 6.0, _1877);
                            float _3878 = fma(_2374, 6.0, _1873);
                            float3 _13649 = float3(_3876, _3878, float(int(_1896)));
                            float3 _13651 = select(_13649, float3(0.0), isnan(_13649));
                            float _3880 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13651.xy, uint(rint(_13651.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13651.xy, uint(rint(_13651.z))).x;
                            float _3882 = fma(_2376, 6.0, _1875);
                            float _3884 = _2376 * 10.5;
                            float _3886 = -_3882;
                            float _3888 = _3886 + _3880;
                            float _3890 = _3888 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _3892 = precise::max(_3890, _3884);
                            float _3894 = precise::min(0.0, _3892);
                            bool _3896 = _3894 != _3890;
                            bool _3898 = isnan(_3894);
                            bool _3900 = _3896 || _3898;
                            bool _3902 = isnan(_3890);
                            bool _3904 = _3900 || _3902;
                            bool _3906 = !_3904;
                            if (!_3906)
                            {
                                float _3908 = fma(_2372, 7.0, _1877);
                                float _3910 = fma(_2374, 7.0, _1873);
                                float3 _13703 = float3(_3908, _3910, float(int(_1896)));
                                float3 _13705 = select(_13703, float3(0.0), isnan(_13703));
                                float _3912 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13705.xy, uint(rint(_13705.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13705.xy, uint(rint(_13705.z))).x;
                                float _3914 = fma(_2376, 7.0, _1875);
                                float _3916 = _2376 * 12.0;
                                float _3918 = -_3914;
                                float _3920 = _3918 + _3912;
                                float _3922 = _3920 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _3924 = precise::max(_3922, _3916);
                                float _3926 = precise::min(0.0, _3924);
                                bool _3928 = _3926 != _3922;
                                bool _3930 = isnan(_3926);
                                bool _3932 = _3928 || _3930;
                                bool _3934 = isnan(_3922);
                                bool _3936 = _3932 || _3934;
                                bool _3938 = !_3936;
                                if (!_3938)
                                {
                                    float _3940 = fma(_2372, 8.0, _1877);
                                    float _3942 = fma(_2374, 8.0, _1873);
                                    float3 _13757 = float3(_3940, _3942, float(int(_1896)));
                                    float3 _13759 = select(_13757, float3(0.0), isnan(_13757));
                                    float _3944 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13759.xy, uint(rint(_13759.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13759.xy, uint(rint(_13759.z))).x;
                                    float _3946 = fma(_2376, 8.0, _1875);
                                    float _3948 = fma(_2376, 13.5, -1.0);
                                    float _3950 = -_3946;
                                    float _3952 = _3950 + _3944;
                                    float _3954 = _3952 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _3956 = precise::max(_3954, _3948);
                                    float _3958 = precise::min(0.0, _3956);
                                    bool _3960 = _3958 != _3954;
                                    bool _3962 = isnan(_3958);
                                    bool _3964 = _3960 || _3962;
                                    bool _3966 = isnan(_3954);
                                    bool _3968 = _3964 || _3966;
                                    bool _3970 = !_3968;
                                    if (!_3970)
                                    {
                                        float _3972 = fma(_2374, 9.0, _1873);
                                        float _3974 = fma(_2372, 9.0, _1877);
                                        float3 _13811 = float3(_3974, _3972, float(int(_1896)));
                                        float3 _13813 = select(_13811, float3(0.0), isnan(_13811));
                                        float _3976 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13813.xy, uint(rint(_13813.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13813.xy, uint(rint(_13813.z))).x;
                                        float _3978 = fma(_2376, 9.0, _1875);
                                        float _3980 = fma(_2376, 15.0, -1.0);
                                        float _3982 = -_3978;
                                        float _3984 = _3982 + _3976;
                                        float _3986 = _3984 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _3988 = precise::max(_3986, _3980);
                                        float _3990 = precise::min(0.0, _3988);
                                        bool _3992 = _3990 != _3986;
                                        bool _3994 = isnan(_3990);
                                        bool _3996 = _3992 || _3994;
                                        bool _3998 = isnan(_3986);
                                        bool _4000 = _3996 || _3998;
                                        _4002 = _4000;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_4002)
    {
        float _4004 = _3694 + 1.0;
        _3714 = _4004;
    }
    _4002 = false;
    float _4006 = _3714;
    float _4008 = _2382 * 1.5;
    float _4010 = precise::max(_2446, _4008);
    float _4012 = precise::min(0.0, _4010);
    bool _4014 = _4012 != _2446;
    bool _4016 = isnan(_4012);
    bool _4018 = _4014 || _4016;
    bool _4020 = isnan(_2446);
    bool _4022 = _4018 || _4020;
    bool _4024 = !_4022;
    float _4026 = _4006;
    if (!_4024)
    {
        float _4028 = _1873 + _2380;
        float _4030 = _1877 + _2378;
        float3 _13904 = float3(_4030, _4028, float(int(_1896)));
        float3 _13906 = select(_13904, float3(0.0), isnan(_13904));
        float _4032 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13906.xy, uint(rint(_13906.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13906.xy, uint(rint(_13906.z))).x;
        float _4034 = _1875 + _2382;
        float _4036 = _2382 * 3.0;
        float _4038 = -_4034;
        float _4040 = _4038 + _4032;
        float _4042 = _4040 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _4044 = precise::max(_4042, _4036);
        float _4046 = precise::min(0.0, _4044);
        bool _4048 = _4046 != _4042;
        bool _4050 = isnan(_4046);
        bool _4052 = _4048 || _4050;
        bool _4054 = isnan(_4042);
        bool _4056 = _4052 || _4054;
        bool _4058 = !_4056;
        if (!_4058)
        {
            float _4060 = fma(_2380, 2.0, _1873);
            float _4062 = fma(_2378, 2.0, _1877);
            float3 _13958 = float3(_4062, _4060, float(int(_1896)));
            float3 _13960 = select(_13958, float3(0.0), isnan(_13958));
            float _4064 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13960.xy, uint(rint(_13960.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13960.xy, uint(rint(_13960.z))).x;
            float _4066 = fma(_2382, 2.0, _1875);
            float _4068 = _2382 * 4.5;
            float _4070 = -_4066;
            float _4072 = _4070 + _4064;
            float _4074 = _4072 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _4076 = precise::max(_4074, _4068);
            float _4078 = precise::min(0.0, _4076);
            bool _4080 = _4078 != _4074;
            bool _4082 = isnan(_4078);
            bool _4084 = _4080 || _4082;
            bool _4086 = isnan(_4074);
            bool _4088 = _4084 || _4086;
            bool _4090 = !_4088;
            if (!_4090)
            {
                float _4092 = fma(_2380, 3.0, _1873);
                float _4094 = fma(_2378, 3.0, _1877);
                float3 _14012 = float3(_4094, _4092, float(int(_1896)));
                float3 _14014 = select(_14012, float3(0.0), isnan(_14012));
                float _4096 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14014.xy, uint(rint(_14014.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14014.xy, uint(rint(_14014.z))).x;
                float _4098 = fma(_2382, 3.0, _1875);
                float _4100 = _2382 * 6.0;
                float _4102 = -_4098;
                float _4104 = _4102 + _4096;
                float _4106 = _4104 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _4108 = precise::max(_4106, _4100);
                float _4110 = precise::min(0.0, _4108);
                bool _4112 = _4110 != _4106;
                bool _4114 = isnan(_4110);
                bool _4116 = _4112 || _4114;
                bool _4118 = isnan(_4106);
                bool _4120 = _4116 || _4118;
                bool _4122 = !_4120;
                if (!_4122)
                {
                    float _4124 = fma(_2380, 4.0, _1873);
                    float _4126 = fma(_2378, 4.0, _1877);
                    float3 _14066 = float3(_4126, _4124, float(int(_1896)));
                    float3 _14068 = select(_14066, float3(0.0), isnan(_14066));
                    float _4128 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14068.xy, uint(rint(_14068.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14068.xy, uint(rint(_14068.z))).x;
                    float _4130 = fma(_2382, 4.0, _1875);
                    float _4132 = _2382 * 7.5;
                    float _4134 = -_4130;
                    float _4136 = _4134 + _4128;
                    float _4138 = _4136 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _4140 = precise::max(_4138, _4132);
                    float _4142 = precise::min(0.0, _4140);
                    bool _4144 = _4142 != _4138;
                    bool _4146 = isnan(_4142);
                    bool _4148 = _4144 || _4146;
                    bool _4150 = isnan(_4138);
                    bool _4152 = _4148 || _4150;
                    bool _4154 = !_4152;
                    if (!_4154)
                    {
                        float _4156 = fma(_2380, 5.0, _1873);
                        float _4158 = fma(_2378, 5.0, _1877);
                        float3 _14120 = float3(_4158, _4156, float(int(_1896)));
                        float3 _14122 = select(_14120, float3(0.0), isnan(_14120));
                        float _4160 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14122.xy, uint(rint(_14122.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14122.xy, uint(rint(_14122.z))).x;
                        float _4162 = fma(_2382, 5.0, _1875);
                        float _4164 = _2382 * 9.0;
                        float _4166 = -_4162;
                        float _4168 = _4166 + _4160;
                        float _4170 = _4168 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _4172 = precise::max(_4170, _4164);
                        float _4174 = precise::min(0.0, _4172);
                        bool _4176 = _4174 != _4170;
                        bool _4178 = isnan(_4174);
                        bool _4180 = _4176 || _4178;
                        bool _4182 = isnan(_4170);
                        bool _4184 = _4180 || _4182;
                        bool _4186 = !_4184;
                        if (!_4186)
                        {
                            float _4188 = fma(_2380, 6.0, _1873);
                            float _4190 = fma(_2378, 6.0, _1877);
                            float3 _14174 = float3(_4190, _4188, float(int(_1896)));
                            float3 _14176 = select(_14174, float3(0.0), isnan(_14174));
                            float _4192 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14176.xy, uint(rint(_14176.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14176.xy, uint(rint(_14176.z))).x;
                            float _4194 = fma(_2382, 6.0, _1875);
                            float _4196 = _2382 * 10.5;
                            float _4198 = -_4194;
                            float _4200 = _4198 + _4192;
                            float _4202 = _4200 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _4204 = precise::max(_4202, _4196);
                            float _4206 = precise::min(0.0, _4204);
                            bool _4208 = _4206 != _4202;
                            bool _4210 = isnan(_4206);
                            bool _4212 = _4208 || _4210;
                            bool _4214 = isnan(_4202);
                            bool _4216 = _4212 || _4214;
                            bool _4218 = !_4216;
                            if (!_4218)
                            {
                                float _4220 = fma(_2380, 7.0, _1873);
                                float _4222 = fma(_2378, 7.0, _1877);
                                float3 _14228 = float3(_4222, _4220, float(int(_1896)));
                                float3 _14230 = select(_14228, float3(0.0), isnan(_14228));
                                float _4224 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14230.xy, uint(rint(_14230.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14230.xy, uint(rint(_14230.z))).x;
                                float _4226 = fma(_2382, 7.0, _1875);
                                float _4228 = _2382 * 12.0;
                                float _4230 = -_4226;
                                float _4232 = _4230 + _4224;
                                float _4234 = _4232 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _4236 = precise::max(_4234, _4228);
                                float _4238 = precise::min(0.0, _4236);
                                bool _4240 = _4238 != _4234;
                                bool _4242 = isnan(_4238);
                                bool _4244 = _4240 || _4242;
                                bool _4246 = isnan(_4234);
                                bool _4248 = _4244 || _4246;
                                bool _4250 = !_4248;
                                if (!_4250)
                                {
                                    float _4252 = fma(_2380, 8.0, _1873);
                                    float _4254 = fma(_2378, 8.0, _1877);
                                    float3 _14282 = float3(_4254, _4252, float(int(_1896)));
                                    float3 _14284 = select(_14282, float3(0.0), isnan(_14282));
                                    float _4256 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14284.xy, uint(rint(_14284.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14284.xy, uint(rint(_14284.z))).x;
                                    float _4258 = fma(_2382, 8.0, _1875);
                                    float _4260 = fma(_2382, 13.5, -1.0);
                                    float _4262 = -_4258;
                                    float _4264 = _4262 + _4256;
                                    float _4266 = _4264 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _4268 = precise::max(_4266, _4260);
                                    float _4270 = precise::min(0.0, _4268);
                                    bool _4272 = _4270 != _4266;
                                    bool _4274 = isnan(_4270);
                                    bool _4276 = _4272 || _4274;
                                    bool _4278 = isnan(_4266);
                                    bool _4280 = _4276 || _4278;
                                    bool _4282 = !_4280;
                                    if (!_4282)
                                    {
                                        float _4284 = fma(_2380, 9.0, _1873);
                                        float _4286 = fma(_2378, 9.0, _1877);
                                        float3 _14336 = float3(_4286, _4284, float(int(_1896)));
                                        float3 _14338 = select(_14336, float3(0.0), isnan(_14336));
                                        float _4288 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14338.xy, uint(rint(_14338.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14338.xy, uint(rint(_14338.z))).x;
                                        float _4290 = fma(_2382, 9.0, _1875);
                                        float _4292 = -_4290;
                                        float _4294 = _4292 + _4288;
                                        float _4296 = fma(_2382, 15.0, -1.0);
                                        float _4298 = _4294 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _4300 = precise::max(_4298, _4296);
                                        float _4302 = precise::min(0.0, _4300);
                                        bool _4304 = _4302 != _4298;
                                        bool _4306 = isnan(_4302);
                                        bool _4308 = _4304 || _4306;
                                        bool _4310 = isnan(_4298);
                                        bool _4312 = _4308 || _4310;
                                        _4314 = _4312;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_4314)
    {
        float _4316 = _4006 + 1.0;
        _4026 = _4316;
    }
    _4314 = false;
    float _4318 = _4026;
    float _4320 = _2388 * 1.5;
    float _4322 = precise::max(_2446, _4320);
    float _4324 = precise::min(0.0, _4322);
    bool _4326 = _4324 != _2446;
    bool _4328 = isnan(_4324);
    bool _4330 = _4326 || _4328;
    bool _4332 = isnan(_2446);
    bool _4334 = _4330 || _4332;
    bool _4336 = !_4334;
    float _4338 = _4318;
    if (!_4336)
    {
        float _4340 = _1873 + _2386;
        float _4342 = _1877 + _2384;
        float3 _14429 = float3(_4342, _4340, float(int(_1896)));
        float3 _14431 = select(_14429, float3(0.0), isnan(_14429));
        float _4344 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14431.xy, uint(rint(_14431.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14431.xy, uint(rint(_14431.z))).x;
        float _4346 = _1875 + _2388;
        float _4348 = _2388 * 3.0;
        float _4350 = -_4346;
        float _4352 = _4350 + _4344;
        float _4354 = _4352 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _4356 = precise::max(_4354, _4348);
        float _4358 = precise::min(0.0, _4356);
        bool _4360 = _4358 != _4354;
        bool _4362 = isnan(_4358);
        bool _4364 = _4360 || _4362;
        bool _4366 = isnan(_4354);
        bool _4368 = _4364 || _4366;
        bool _4370 = !_4368;
        if (!_4370)
        {
            float _4372 = fma(_2386, 2.0, _1873);
            float _4374 = fma(_2384, 2.0, _1877);
            float3 _14483 = float3(_4374, _4372, float(int(_1896)));
            float3 _14485 = select(_14483, float3(0.0), isnan(_14483));
            float _4376 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14485.xy, uint(rint(_14485.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14485.xy, uint(rint(_14485.z))).x;
            float _4378 = fma(_2388, 2.0, _1875);
            float _4380 = _2388 * 4.5;
            float _4382 = -_4378;
            float _4384 = _4382 + _4376;
            float _4386 = _4384 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _4388 = precise::max(_4386, _4380);
            float _4390 = precise::min(0.0, _4388);
            bool _4392 = _4390 != _4386;
            bool _4394 = isnan(_4390);
            bool _4396 = _4392 || _4394;
            bool _4398 = isnan(_4386);
            bool _4400 = _4396 || _4398;
            bool _4402 = !_4400;
            if (!_4402)
            {
                float _4404 = fma(_2386, 3.0, _1873);
                float _4406 = fma(_2384, 3.0, _1877);
                float3 _14537 = float3(_4406, _4404, float(int(_1896)));
                float3 _14539 = select(_14537, float3(0.0), isnan(_14537));
                float _4408 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14539.xy, uint(rint(_14539.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14539.xy, uint(rint(_14539.z))).x;
                float _4410 = fma(_2388, 3.0, _1875);
                float _4412 = _2388 * 6.0;
                float _4414 = -_4410;
                float _4416 = _4414 + _4408;
                float _4418 = _4416 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _4420 = precise::max(_4418, _4412);
                float _4422 = precise::min(0.0, _4420);
                bool _4424 = _4422 != _4418;
                bool _4426 = isnan(_4422);
                bool _4428 = _4424 || _4426;
                bool _4430 = isnan(_4418);
                bool _4432 = _4428 || _4430;
                bool _4434 = !_4432;
                if (!_4434)
                {
                    float _4436 = fma(_2386, 4.0, _1873);
                    float _4438 = fma(_2384, 4.0, _1877);
                    float3 _14591 = float3(_4438, _4436, float(int(_1896)));
                    float3 _14593 = select(_14591, float3(0.0), isnan(_14591));
                    float _4440 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14593.xy, uint(rint(_14593.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14593.xy, uint(rint(_14593.z))).x;
                    float _4442 = fma(_2388, 4.0, _1875);
                    float _4444 = _2388 * 7.5;
                    float _4446 = -_4442;
                    float _4448 = _4446 + _4440;
                    float _4450 = _4448 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _4452 = precise::max(_4450, _4444);
                    float _4454 = precise::min(0.0, _4452);
                    bool _4456 = _4454 != _4450;
                    bool _4458 = isnan(_4454);
                    bool _4460 = _4456 || _4458;
                    bool _4462 = isnan(_4450);
                    bool _4464 = _4460 || _4462;
                    bool _4466 = !_4464;
                    if (!_4466)
                    {
                        float _4468 = fma(_2386, 5.0, _1873);
                        float _4470 = fma(_2384, 5.0, _1877);
                        float3 _14645 = float3(_4470, _4468, float(int(_1896)));
                        float3 _14647 = select(_14645, float3(0.0), isnan(_14645));
                        float _4472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14647.xy, uint(rint(_14647.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14647.xy, uint(rint(_14647.z))).x;
                        float _4474 = fma(_2388, 5.0, _1875);
                        float _4476 = _2388 * 9.0;
                        float _4478 = -_4474;
                        float _4480 = _4478 + _4472;
                        float _4482 = _4480 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _4484 = precise::max(_4482, _4476);
                        float _4486 = precise::min(0.0, _4484);
                        bool _4488 = _4486 != _4482;
                        bool _4490 = isnan(_4486);
                        bool _4492 = _4488 || _4490;
                        bool _4494 = isnan(_4482);
                        bool _4496 = _4492 || _4494;
                        bool _4498 = !_4496;
                        if (!_4498)
                        {
                            float _4500 = fma(_2386, 6.0, _1873);
                            float _4502 = fma(_2384, 6.0, _1877);
                            float3 _14699 = float3(_4502, _4500, float(int(_1896)));
                            float3 _14701 = select(_14699, float3(0.0), isnan(_14699));
                            float _4504 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14701.xy, uint(rint(_14701.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14701.xy, uint(rint(_14701.z))).x;
                            float _4506 = fma(_2388, 6.0, _1875);
                            float _4508 = _2388 * 10.5;
                            float _4510 = -_4506;
                            float _4512 = _4510 + _4504;
                            float _4514 = _4512 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _4516 = precise::max(_4514, _4508);
                            float _4518 = precise::min(0.0, _4516);
                            bool _4520 = _4518 != _4514;
                            bool _4522 = isnan(_4518);
                            bool _4524 = _4520 || _4522;
                            bool _4526 = isnan(_4514);
                            bool _4528 = _4524 || _4526;
                            bool _4530 = !_4528;
                            if (!_4530)
                            {
                                float _4532 = fma(_2386, 7.0, _1873);
                                float _4534 = fma(_2384, 7.0, _1877);
                                float3 _14753 = float3(_4534, _4532, float(int(_1896)));
                                float3 _14755 = select(_14753, float3(0.0), isnan(_14753));
                                float _4536 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14755.xy, uint(rint(_14755.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14755.xy, uint(rint(_14755.z))).x;
                                float _4538 = fma(_2388, 7.0, _1875);
                                float _4540 = _2388 * 12.0;
                                float _4542 = -_4538;
                                float _4544 = _4542 + _4536;
                                float _4546 = _4544 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _4548 = precise::max(_4546, _4540);
                                float _4550 = precise::min(0.0, _4548);
                                bool _4552 = _4550 != _4546;
                                bool _4554 = isnan(_4550);
                                bool _4556 = _4552 || _4554;
                                bool _4558 = isnan(_4546);
                                bool _4560 = _4556 || _4558;
                                bool _4562 = !_4560;
                                if (!_4562)
                                {
                                    float _4564 = fma(_2386, 8.0, _1873);
                                    float _4566 = fma(_2384, 8.0, _1877);
                                    float3 _14807 = float3(_4566, _4564, float(int(_1896)));
                                    float3 _14809 = select(_14807, float3(0.0), isnan(_14807));
                                    float _4568 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14809.xy, uint(rint(_14809.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14809.xy, uint(rint(_14809.z))).x;
                                    float _4570 = fma(_2388, 8.0, _1875);
                                    float _4572 = fma(_2388, 13.5, -1.0);
                                    float _4574 = -_4570;
                                    float _4576 = _4574 + _4568;
                                    float _4578 = _4576 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _4580 = precise::max(_4578, _4572);
                                    float _4582 = precise::min(0.0, _4580);
                                    bool _4584 = _4582 != _4578;
                                    bool _4586 = isnan(_4582);
                                    bool _4588 = _4584 || _4586;
                                    bool _4590 = isnan(_4578);
                                    bool _4592 = _4588 || _4590;
                                    bool _4594 = !_4592;
                                    if (!_4594)
                                    {
                                        float _4596 = fma(_2386, 9.0, _1873);
                                        float _4598 = fma(_2384, 9.0, _1877);
                                        float3 _14861 = float3(_4598, _4596, float(int(_1896)));
                                        float3 _14863 = select(_14861, float3(0.0), isnan(_14861));
                                        float _4600 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14863.xy, uint(rint(_14863.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14863.xy, uint(rint(_14863.z))).x;
                                        float _4602 = fma(_2388, 9.0, _1875);
                                        float _4604 = fma(_2388, 15.0, -1.0);
                                        float _4606 = -_4602;
                                        float _4608 = _4606 + _4600;
                                        float _4610 = _4608 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _4612 = precise::max(_4610, _4604);
                                        float _4614 = precise::min(0.0, _4612);
                                        bool _4616 = _4614 != _4610;
                                        bool _4618 = isnan(_4614);
                                        bool _4620 = _4616 || _4618;
                                        bool _4622 = isnan(_4610);
                                        bool _4624 = _4620 || _4622;
                                        _4626 = _4624;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_4626)
    {
        float _4628 = _4318 + 1.0;
        _4338 = _4628;
    }
    _4626 = false;
    float _4630 = _4338;
    float _4632 = _2394 * 1.5;
    float _4634 = precise::max(_2446, _4632);
    float _4636 = precise::min(0.0, _4634);
    bool _4638 = _4636 != _2446;
    bool _4640 = isnan(_4636);
    bool _4642 = _4638 || _4640;
    bool _4644 = isnan(_2446);
    bool _4646 = _4642 || _4644;
    bool _4648 = !_4646;
    float _4650 = _4630;
    if (!_4648)
    {
        float _4652 = _1873 + _2392;
        float _4654 = _1877 + _2390;
        float3 _14954 = float3(_4654, _4652, float(int(_1896)));
        float3 _14956 = select(_14954, float3(0.0), isnan(_14954));
        float _4656 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14956.xy, uint(rint(_14956.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14956.xy, uint(rint(_14956.z))).x;
        float _4658 = _1875 + _2394;
        float _4660 = _2394 * 3.0;
        float _4662 = -_4658;
        float _4664 = _4662 + _4656;
        float _4666 = _4664 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _4668 = precise::max(_4666, _4660);
        float _4670 = precise::min(0.0, _4668);
        bool _4672 = _4670 != _4666;
        bool _4674 = isnan(_4670);
        bool _4676 = _4672 || _4674;
        bool _4678 = isnan(_4666);
        bool _4680 = _4676 || _4678;
        bool _4682 = !_4680;
        if (!_4682)
        {
            float _4684 = fma(_2392, 2.0, _1873);
            float _4686 = fma(_2390, 2.0, _1877);
            float3 _15008 = float3(_4686, _4684, float(int(_1896)));
            float3 _15010 = select(_15008, float3(0.0), isnan(_15008));
            float _4688 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15010.xy, uint(rint(_15010.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15010.xy, uint(rint(_15010.z))).x;
            float _4690 = fma(_2394, 2.0, _1875);
            float _4692 = _2394 * 4.5;
            float _4694 = -_4690;
            float _4696 = _4694 + _4688;
            float _4698 = _4696 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _4700 = precise::max(_4698, _4692);
            float _4702 = precise::min(0.0, _4700);
            bool _4704 = _4702 != _4698;
            bool _4706 = isnan(_4702);
            bool _4708 = _4704 || _4706;
            bool _4710 = isnan(_4698);
            bool _4712 = _4708 || _4710;
            bool _4714 = !_4712;
            if (!_4714)
            {
                float _4716 = fma(_2392, 3.0, _1873);
                float _4718 = fma(_2390, 3.0, _1877);
                float3 _15062 = float3(_4718, _4716, float(int(_1896)));
                float3 _15064 = select(_15062, float3(0.0), isnan(_15062));
                float _4720 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15064.xy, uint(rint(_15064.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15064.xy, uint(rint(_15064.z))).x;
                float _4722 = fma(_2394, 3.0, _1875);
                float _4724 = _2394 * 6.0;
                float _4726 = -_4722;
                float _4728 = _4726 + _4720;
                float _4730 = _4728 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _4732 = precise::max(_4730, _4724);
                float _4734 = precise::min(0.0, _4732);
                bool _4736 = _4734 != _4730;
                bool _4738 = isnan(_4734);
                bool _4740 = _4736 || _4738;
                bool _4742 = isnan(_4730);
                bool _4744 = _4740 || _4742;
                bool _4746 = !_4744;
                if (!_4746)
                {
                    float _4748 = fma(_2392, 4.0, _1873);
                    float _4750 = fma(_2390, 4.0, _1877);
                    float3 _15116 = float3(_4750, _4748, float(int(_1896)));
                    float3 _15118 = select(_15116, float3(0.0), isnan(_15116));
                    float _4752 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15118.xy, uint(rint(_15118.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15118.xy, uint(rint(_15118.z))).x;
                    float _4754 = fma(_2394, 4.0, _1875);
                    float _4756 = _2394 * 7.5;
                    float _4758 = -_4754;
                    float _4760 = _4758 + _4752;
                    float _4762 = _4760 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _4764 = precise::max(_4762, _4756);
                    float _4766 = precise::min(0.0, _4764);
                    bool _4768 = _4766 != _4762;
                    bool _4770 = isnan(_4766);
                    bool _4772 = _4768 || _4770;
                    bool _4774 = isnan(_4762);
                    bool _4776 = _4772 || _4774;
                    bool _4778 = !_4776;
                    if (!_4778)
                    {
                        float _4780 = fma(_2392, 5.0, _1873);
                        float _4782 = fma(_2390, 5.0, _1877);
                        float3 _15170 = float3(_4782, _4780, float(int(_1896)));
                        float3 _15172 = select(_15170, float3(0.0), isnan(_15170));
                        float _4784 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15172.xy, uint(rint(_15172.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15172.xy, uint(rint(_15172.z))).x;
                        float _4786 = fma(_2394, 5.0, _1875);
                        float _4788 = _2394 * 9.0;
                        float _4790 = -_4786;
                        float _4792 = _4790 + _4784;
                        float _4794 = _4792 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _4796 = precise::max(_4794, _4788);
                        float _4798 = precise::min(0.0, _4796);
                        bool _4800 = _4798 != _4794;
                        bool _4802 = isnan(_4798);
                        bool _4804 = _4800 || _4802;
                        bool _4806 = isnan(_4794);
                        bool _4808 = _4804 || _4806;
                        bool _4810 = !_4808;
                        if (!_4810)
                        {
                            float _4812 = fma(_2392, 6.0, _1873);
                            float _4814 = fma(_2390, 6.0, _1877);
                            float3 _15224 = float3(_4814, _4812, float(int(_1896)));
                            float3 _15226 = select(_15224, float3(0.0), isnan(_15224));
                            float _4816 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15226.xy, uint(rint(_15226.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15226.xy, uint(rint(_15226.z))).x;
                            float _4818 = fma(_2394, 6.0, _1875);
                            float _4820 = _2394 * 10.5;
                            float _4822 = -_4818;
                            float _4824 = _4822 + _4816;
                            float _4826 = _4824 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _4828 = precise::max(_4826, _4820);
                            float _4830 = precise::min(0.0, _4828);
                            bool _4832 = _4830 != _4826;
                            bool _4834 = isnan(_4830);
                            bool _4836 = _4832 || _4834;
                            bool _4838 = isnan(_4826);
                            bool _4840 = _4836 || _4838;
                            bool _4842 = !_4840;
                            if (!_4842)
                            {
                                float _4844 = fma(_2392, 7.0, _1873);
                                float _4846 = fma(_2390, 7.0, _1877);
                                float3 _15278 = float3(_4846, _4844, float(int(_1896)));
                                float3 _15280 = select(_15278, float3(0.0), isnan(_15278));
                                float _4848 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15280.xy, uint(rint(_15280.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15280.xy, uint(rint(_15280.z))).x;
                                float _4850 = fma(_2394, 7.0, _1875);
                                float _4852 = _2394 * 12.0;
                                float _4854 = -_4850;
                                float _4856 = _4854 + _4848;
                                float _4858 = _4856 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _4860 = precise::max(_4858, _4852);
                                float _4862 = precise::min(0.0, _4860);
                                bool _4864 = _4862 != _4858;
                                bool _4866 = isnan(_4862);
                                bool _4868 = _4864 || _4866;
                                bool _4870 = isnan(_4858);
                                bool _4872 = _4868 || _4870;
                                bool _4874 = !_4872;
                                if (!_4874)
                                {
                                    float _4876 = fma(_2392, 8.0, _1873);
                                    float _4878 = fma(_2390, 8.0, _1877);
                                    float3 _15332 = float3(_4878, _4876, float(int(_1896)));
                                    float3 _15334 = select(_15332, float3(0.0), isnan(_15332));
                                    float _4880 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15334.xy, uint(rint(_15334.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15334.xy, uint(rint(_15334.z))).x;
                                    float _4882 = fma(_2394, 8.0, _1875);
                                    float _4884 = fma(_2394, 13.5, -1.0);
                                    float _4886 = -_4882;
                                    float _4888 = _4886 + _4880;
                                    float _4890 = _4888 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _4892 = precise::max(_4890, _4884);
                                    float _4894 = precise::min(0.0, _4892);
                                    bool _4896 = _4894 != _4890;
                                    bool _4898 = isnan(_4894);
                                    bool _4900 = _4896 || _4898;
                                    bool _4902 = isnan(_4890);
                                    bool _4904 = _4900 || _4902;
                                    bool _4906 = !_4904;
                                    if (!_4906)
                                    {
                                        float _4908 = fma(_2392, 9.0, _1873);
                                        float _4910 = fma(_2390, 9.0, _1877);
                                        float3 _15386 = float3(_4910, _4908, float(int(_1896)));
                                        float3 _15388 = select(_15386, float3(0.0), isnan(_15386));
                                        float _4912 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15388.xy, uint(rint(_15388.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15388.xy, uint(rint(_15388.z))).x;
                                        float _4914 = fma(_2394, 9.0, _1875);
                                        float _4916 = -_4914;
                                        float _4918 = _4916 + _4912;
                                        float _4920 = fma(_2394, 15.0, -1.0);
                                        float _4922 = _4918 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _4924 = precise::max(_4922, _4920);
                                        float _4926 = precise::min(0.0, _4924);
                                        bool _4928 = _4926 != _4922;
                                        bool _4930 = isnan(_4926);
                                        bool _4932 = _4928 || _4930;
                                        bool _4934 = isnan(_4922);
                                        bool _4936 = _4932 || _4934;
                                        _4938 = _4936;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_4938)
    {
        float _4940 = _4630 + 1.0;
        _4650 = _4940;
    }
    _4938 = false;
    float _4942 = _4650;
    float _4944 = _2400 * 1.5;
    float _4946 = precise::max(_2446, _4944);
    float _4948 = precise::min(0.0, _4946);
    bool _4950 = _4948 != _2446;
    bool _4952 = isnan(_4948);
    bool _4954 = _4950 || _4952;
    bool _4956 = isnan(_2446);
    bool _4958 = _4954 || _4956;
    bool _4960 = !_4958;
    float _4962 = _4942;
    if (!_4960)
    {
        float _4964 = _1873 + _2398;
        float _4966 = _1877 + _2396;
        float3 _15479 = float3(_4966, _4964, float(int(_1896)));
        float3 _15481 = select(_15479, float3(0.0), isnan(_15479));
        float _4968 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15481.xy, uint(rint(_15481.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15481.xy, uint(rint(_15481.z))).x;
        float _4970 = _1875 + _2400;
        float _4972 = _2400 * 3.0;
        float _4974 = -_4970;
        float _4976 = _4974 + _4968;
        float _4978 = _4976 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _4980 = precise::max(_4978, _4972);
        float _4982 = precise::min(0.0, _4980);
        bool _4984 = _4982 != _4978;
        bool _4986 = isnan(_4982);
        bool _4988 = _4984 || _4986;
        bool _4990 = isnan(_4978);
        bool _4992 = _4988 || _4990;
        bool _4994 = !_4992;
        if (!_4994)
        {
            float _4996 = fma(_2398, 2.0, _1873);
            float _4998 = fma(_2396, 2.0, _1877);
            float3 _15533 = float3(_4998, _4996, float(int(_1896)));
            float3 _15535 = select(_15533, float3(0.0), isnan(_15533));
            float _5000 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15535.xy, uint(rint(_15535.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15535.xy, uint(rint(_15535.z))).x;
            float _5002 = fma(_2400, 2.0, _1875);
            float _5004 = _2400 * 4.5;
            float _5006 = -_5002;
            float _5008 = _5006 + _5000;
            float _5010 = _5008 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _5012 = precise::max(_5010, _5004);
            float _5014 = precise::min(0.0, _5012);
            bool _5016 = _5014 != _5010;
            bool _5018 = isnan(_5014);
            bool _5020 = _5016 || _5018;
            bool _5022 = isnan(_5010);
            bool _5024 = _5020 || _5022;
            bool _5026 = !_5024;
            if (!_5026)
            {
                float _5028 = fma(_2398, 3.0, _1873);
                float _5030 = fma(_2396, 3.0, _1877);
                float3 _15587 = float3(_5030, _5028, float(int(_1896)));
                float3 _15589 = select(_15587, float3(0.0), isnan(_15587));
                float _5032 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15589.xy, uint(rint(_15589.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15589.xy, uint(rint(_15589.z))).x;
                float _5034 = fma(_2400, 3.0, _1875);
                float _5036 = _2400 * 6.0;
                float _5038 = -_5034;
                float _5040 = _5038 + _5032;
                float _5042 = _5040 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _5044 = precise::max(_5042, _5036);
                float _5046 = precise::min(0.0, _5044);
                bool _5048 = _5046 != _5042;
                bool _5050 = isnan(_5046);
                bool _5052 = _5048 || _5050;
                bool _5054 = isnan(_5042);
                bool _5056 = _5052 || _5054;
                bool _5058 = !_5056;
                if (!_5058)
                {
                    float _5060 = fma(_2398, 4.0, _1873);
                    float _5062 = fma(_2396, 4.0, _1877);
                    float3 _15641 = float3(_5062, _5060, float(int(_1896)));
                    float3 _15643 = select(_15641, float3(0.0), isnan(_15641));
                    float _5064 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15643.xy, uint(rint(_15643.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15643.xy, uint(rint(_15643.z))).x;
                    float _5066 = fma(_2400, 4.0, _1875);
                    float _5068 = _2400 * 7.5;
                    float _5070 = -_5066;
                    float _5072 = _5070 + _5064;
                    float _5074 = _5072 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _5076 = precise::max(_5074, _5068);
                    float _5078 = precise::min(0.0, _5076);
                    bool _5080 = _5078 != _5074;
                    bool _5082 = isnan(_5078);
                    bool _5084 = _5080 || _5082;
                    bool _5086 = isnan(_5074);
                    bool _5088 = _5084 || _5086;
                    bool _5090 = !_5088;
                    if (!_5090)
                    {
                        float _5092 = fma(_2398, 5.0, _1873);
                        float _5094 = fma(_2396, 5.0, _1877);
                        float3 _15695 = float3(_5094, _5092, float(int(_1896)));
                        float3 _15697 = select(_15695, float3(0.0), isnan(_15695));
                        float _5096 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15697.xy, uint(rint(_15697.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15697.xy, uint(rint(_15697.z))).x;
                        float _5098 = fma(_2400, 5.0, _1875);
                        float _5100 = _2400 * 9.0;
                        float _5102 = -_5098;
                        float _5104 = _5102 + _5096;
                        float _5106 = _5104 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _5108 = precise::max(_5106, _5100);
                        float _5110 = precise::min(0.0, _5108);
                        bool _5112 = _5110 != _5106;
                        bool _5114 = isnan(_5110);
                        bool _5116 = _5112 || _5114;
                        bool _5118 = isnan(_5106);
                        bool _5120 = _5116 || _5118;
                        bool _5122 = !_5120;
                        if (!_5122)
                        {
                            float _5124 = fma(_2398, 6.0, _1873);
                            float _5126 = fma(_2396, 6.0, _1877);
                            float3 _15749 = float3(_5126, _5124, float(int(_1896)));
                            float3 _15751 = select(_15749, float3(0.0), isnan(_15749));
                            float _5128 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15751.xy, uint(rint(_15751.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15751.xy, uint(rint(_15751.z))).x;
                            float _5130 = fma(_2400, 6.0, _1875);
                            float _5132 = _2400 * 10.5;
                            float _5134 = -_5130;
                            float _5136 = _5134 + _5128;
                            float _5138 = _5136 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _5140 = precise::max(_5138, _5132);
                            float _5142 = precise::min(0.0, _5140);
                            bool _5144 = _5142 != _5138;
                            bool _5146 = isnan(_5142);
                            bool _5148 = _5144 || _5146;
                            bool _5150 = isnan(_5138);
                            bool _5152 = _5148 || _5150;
                            bool _5154 = !_5152;
                            if (!_5154)
                            {
                                float _5156 = fma(_2398, 7.0, _1873);
                                float _5158 = fma(_2396, 7.0, _1877);
                                float3 _15803 = float3(_5158, _5156, float(int(_1896)));
                                float3 _15805 = select(_15803, float3(0.0), isnan(_15803));
                                float _5160 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15805.xy, uint(rint(_15805.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15805.xy, uint(rint(_15805.z))).x;
                                float _5162 = fma(_2400, 7.0, _1875);
                                float _5164 = _2400 * 12.0;
                                float _5166 = -_5162;
                                float _5168 = _5166 + _5160;
                                float _5170 = _5168 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _5172 = precise::max(_5170, _5164);
                                float _5174 = precise::min(0.0, _5172);
                                bool _5176 = _5174 != _5170;
                                bool _5178 = isnan(_5174);
                                bool _5180 = _5176 || _5178;
                                bool _5182 = isnan(_5170);
                                bool _5184 = _5180 || _5182;
                                bool _5186 = !_5184;
                                if (!_5186)
                                {
                                    float _5188 = fma(_2398, 8.0, _1873);
                                    float _5190 = fma(_2396, 8.0, _1877);
                                    float3 _15857 = float3(_5190, _5188, float(int(_1896)));
                                    float3 _15859 = select(_15857, float3(0.0), isnan(_15857));
                                    float _5192 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15859.xy, uint(rint(_15859.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15859.xy, uint(rint(_15859.z))).x;
                                    float _5194 = fma(_2400, 8.0, _1875);
                                    float _5196 = fma(_2400, 13.5, -1.0);
                                    float _5198 = -_5194;
                                    float _5200 = _5198 + _5192;
                                    float _5202 = _5200 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _5204 = precise::max(_5202, _5196);
                                    float _5206 = precise::min(0.0, _5204);
                                    bool _5208 = _5206 != _5202;
                                    bool _5210 = isnan(_5206);
                                    bool _5212 = _5208 || _5210;
                                    bool _5214 = isnan(_5202);
                                    bool _5216 = _5212 || _5214;
                                    bool _5218 = !_5216;
                                    if (!_5218)
                                    {
                                        float _5220 = fma(_2398, 9.0, _1873);
                                        float _5222 = fma(_2396, 9.0, _1877);
                                        float3 _15911 = float3(_5222, _5220, float(int(_1896)));
                                        float3 _15913 = select(_15911, float3(0.0), isnan(_15911));
                                        float _5224 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15913.xy, uint(rint(_15913.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15913.xy, uint(rint(_15913.z))).x;
                                        float _5226 = fma(_2400, 9.0, _1875);
                                        float _5228 = fma(_2400, 15.0, -1.0);
                                        float _5230 = -_5226;
                                        float _5232 = _5230 + _5224;
                                        float _5234 = _5232 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _5236 = precise::max(_5234, _5228);
                                        float _5238 = precise::min(0.0, _5236);
                                        bool _5240 = _5238 != _5234;
                                        bool _5242 = isnan(_5238);
                                        bool _5244 = _5240 || _5242;
                                        bool _5246 = isnan(_5234);
                                        bool _5248 = _5244 || _5246;
                                        _5250 = _5248;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_5250)
    {
        float _5252 = _4942 + 1.0;
        _4962 = _5252;
    }
    _5250 = false;
    float _5254 = _4962;
    float _5256 = _2406 * 1.5;
    float _5258 = precise::max(_2446, _5256);
    float _5260 = precise::min(0.0, _5258);
    bool _5262 = _5260 != _2446;
    bool _5264 = isnan(_5260);
    bool _5266 = _5262 || _5264;
    bool _5268 = isnan(_2446);
    bool _5270 = _5266 || _5268;
    bool _5272 = !_5270;
    float _5274 = _5254;
    if (!_5272)
    {
        float _5276 = _1873 + _2404;
        float _5278 = _1877 + _2402;
        float3 _16004 = float3(_5278, _5276, float(int(_1896)));
        float3 _16006 = select(_16004, float3(0.0), isnan(_16004));
        float _5280 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16006.xy, uint(rint(_16006.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16006.xy, uint(rint(_16006.z))).x;
        float _5282 = _1875 + _2406;
        float _5284 = _2406 * 3.0;
        float _5286 = -_5282;
        float _5288 = _5286 + _5280;
        float _5290 = _5288 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _5292 = precise::max(_5290, _5284);
        float _5294 = precise::min(0.0, _5292);
        bool _5296 = _5294 != _5290;
        bool _5298 = isnan(_5294);
        bool _5300 = _5296 || _5298;
        bool _5302 = isnan(_5290);
        bool _5304 = _5300 || _5302;
        bool _5306 = !_5304;
        if (!_5306)
        {
            float _5308 = fma(_2404, 2.0, _1873);
            float _5310 = fma(_2402, 2.0, _1877);
            float3 _16058 = float3(_5310, _5308, float(int(_1896)));
            float3 _16060 = select(_16058, float3(0.0), isnan(_16058));
            float _5312 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16060.xy, uint(rint(_16060.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16060.xy, uint(rint(_16060.z))).x;
            float _5314 = fma(_2406, 2.0, _1875);
            float _5316 = _2406 * 4.5;
            float _5318 = -_5314;
            float _5320 = _5318 + _5312;
            float _5322 = _5320 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _5324 = precise::max(_5322, _5316);
            float _5326 = precise::min(0.0, _5324);
            bool _5328 = _5326 != _5322;
            bool _5330 = isnan(_5326);
            bool _5332 = _5328 || _5330;
            bool _5334 = isnan(_5322);
            bool _5336 = _5332 || _5334;
            bool _5338 = !_5336;
            if (!_5338)
            {
                float _5340 = fma(_2404, 3.0, _1873);
                float _5342 = fma(_2402, 3.0, _1877);
                float3 _16112 = float3(_5342, _5340, float(int(_1896)));
                float3 _16114 = select(_16112, float3(0.0), isnan(_16112));
                float _5344 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16114.xy, uint(rint(_16114.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16114.xy, uint(rint(_16114.z))).x;
                float _5346 = fma(_2406, 3.0, _1875);
                float _5348 = _2406 * 6.0;
                float _5350 = -_5346;
                float _5352 = _5350 + _5344;
                float _5354 = _5352 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _5356 = precise::max(_5354, _5348);
                float _5358 = precise::min(0.0, _5356);
                bool _5360 = _5358 != _5354;
                bool _5362 = isnan(_5358);
                bool _5364 = _5360 || _5362;
                bool _5366 = isnan(_5354);
                bool _5368 = _5364 || _5366;
                bool _5370 = !_5368;
                if (!_5370)
                {
                    float _5372 = fma(_2404, 4.0, _1873);
                    float _5374 = fma(_2402, 4.0, _1877);
                    float3 _16166 = float3(_5374, _5372, float(int(_1896)));
                    float3 _16168 = select(_16166, float3(0.0), isnan(_16166));
                    float _5376 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16168.xy, uint(rint(_16168.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16168.xy, uint(rint(_16168.z))).x;
                    float _5378 = fma(_2406, 4.0, _1875);
                    float _5380 = _2406 * 7.5;
                    float _5382 = -_5378;
                    float _5384 = _5382 + _5376;
                    float _5386 = _5384 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _5388 = precise::max(_5386, _5380);
                    float _5390 = precise::min(0.0, _5388);
                    bool _5392 = _5390 != _5386;
                    bool _5394 = isnan(_5390);
                    bool _5396 = _5392 || _5394;
                    bool _5398 = isnan(_5386);
                    bool _5400 = _5396 || _5398;
                    bool _5402 = !_5400;
                    if (!_5402)
                    {
                        float _5404 = fma(_2404, 5.0, _1873);
                        float _5406 = fma(_2402, 5.0, _1877);
                        float3 _16220 = float3(_5406, _5404, float(int(_1896)));
                        float3 _16222 = select(_16220, float3(0.0), isnan(_16220));
                        float _5408 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16222.xy, uint(rint(_16222.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16222.xy, uint(rint(_16222.z))).x;
                        float _5410 = fma(_2406, 5.0, _1875);
                        float _5412 = _2406 * 9.0;
                        float _5414 = -_5410;
                        float _5416 = _5414 + _5408;
                        float _5418 = _5416 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _5420 = precise::max(_5418, _5412);
                        float _5422 = precise::min(0.0, _5420);
                        bool _5424 = _5422 != _5418;
                        bool _5426 = isnan(_5422);
                        bool _5428 = _5424 || _5426;
                        bool _5430 = isnan(_5418);
                        bool _5432 = _5428 || _5430;
                        bool _5434 = !_5432;
                        if (!_5434)
                        {
                            float _5436 = fma(_2404, 6.0, _1873);
                            float _5438 = fma(_2402, 6.0, _1877);
                            float3 _16274 = float3(_5438, _5436, float(int(_1896)));
                            float3 _16276 = select(_16274, float3(0.0), isnan(_16274));
                            float _5440 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16276.xy, uint(rint(_16276.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16276.xy, uint(rint(_16276.z))).x;
                            float _5442 = fma(_2406, 6.0, _1875);
                            float _5444 = _2406 * 10.5;
                            float _5446 = -_5442;
                            float _5448 = _5446 + _5440;
                            float _5450 = _5448 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _5452 = precise::max(_5450, _5444);
                            float _5454 = precise::min(0.0, _5452);
                            bool _5456 = _5454 != _5450;
                            bool _5458 = isnan(_5454);
                            bool _5460 = _5456 || _5458;
                            bool _5462 = isnan(_5450);
                            bool _5464 = _5460 || _5462;
                            bool _5466 = !_5464;
                            if (!_5466)
                            {
                                float _5468 = fma(_2404, 7.0, _1873);
                                float _5470 = fma(_2402, 7.0, _1877);
                                float3 _16328 = float3(_5470, _5468, float(int(_1896)));
                                float3 _16330 = select(_16328, float3(0.0), isnan(_16328));
                                float _5472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16330.xy, uint(rint(_16330.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16330.xy, uint(rint(_16330.z))).x;
                                float _5474 = fma(_2406, 7.0, _1875);
                                float _5476 = _2406 * 12.0;
                                float _5478 = -_5474;
                                float _5480 = _5478 + _5472;
                                float _5482 = _5480 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _5484 = precise::max(_5482, _5476);
                                float _5486 = precise::min(0.0, _5484);
                                bool _5488 = _5486 != _5482;
                                bool _5490 = isnan(_5486);
                                bool _5492 = _5488 || _5490;
                                bool _5494 = isnan(_5482);
                                bool _5496 = _5492 || _5494;
                                bool _5498 = !_5496;
                                if (!_5498)
                                {
                                    float _5500 = fma(_2404, 8.0, _1873);
                                    float _5502 = fma(_2402, 8.0, _1877);
                                    float3 _16382 = float3(_5502, _5500, float(int(_1896)));
                                    float3 _16384 = select(_16382, float3(0.0), isnan(_16382));
                                    float _5504 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16384.xy, uint(rint(_16384.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16384.xy, uint(rint(_16384.z))).x;
                                    float _5506 = fma(_2406, 8.0, _1875);
                                    float _5508 = fma(_2406, 13.5, -1.0);
                                    float _5510 = -_5506;
                                    float _5512 = _5510 + _5504;
                                    float _5514 = _5512 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _5516 = precise::max(_5514, _5508);
                                    float _5518 = precise::min(0.0, _5516);
                                    bool _5520 = _5518 != _5514;
                                    bool _5522 = isnan(_5518);
                                    bool _5524 = _5520 || _5522;
                                    bool _5526 = isnan(_5514);
                                    bool _5528 = _5524 || _5526;
                                    bool _5530 = !_5528;
                                    if (!_5530)
                                    {
                                        float _5532 = fma(_2404, 9.0, _1873);
                                        float _5534 = fma(_2402, 9.0, _1877);
                                        float3 _16436 = float3(_5534, _5532, float(int(_1896)));
                                        float3 _16438 = select(_16436, float3(0.0), isnan(_16436));
                                        float _5536 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16438.xy, uint(rint(_16438.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16438.xy, uint(rint(_16438.z))).x;
                                        float _5538 = fma(_2406, 9.0, _1875);
                                        float _5540 = -_5538;
                                        float _5542 = _5540 + _5536;
                                        float _5544 = fma(_2406, 15.0, -1.0);
                                        float _5546 = _5542 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _5548 = precise::max(_5546, _5544);
                                        float _5550 = precise::min(0.0, _5548);
                                        bool _5552 = _5550 != _5546;
                                        bool _5554 = isnan(_5550);
                                        bool _5556 = _5552 || _5554;
                                        bool _5558 = isnan(_5546);
                                        bool _5560 = _5556 || _5558;
                                        _5562 = _5560;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_5562)
    {
        float _5564 = _5254 + 1.0;
        _5274 = _5564;
    }
    _5562 = false;
    float _5566 = _5274;
    float _5568 = _2412 * 1.5;
    float _5570 = precise::max(_2446, _5568);
    float _5572 = precise::min(0.0, _5570);
    bool _5574 = _5572 != _2446;
    bool _5576 = isnan(_5572);
    bool _5578 = _5574 || _5576;
    bool _5580 = isnan(_2446);
    bool _5582 = _5578 || _5580;
    bool _5584 = !_5582;
    float _5586 = _5566;
    if (!_5584)
    {
        float _5588 = _1873 + _2410;
        float _5590 = _1877 + _2408;
        float3 _16529 = float3(_5590, _5588, float(int(_1896)));
        float3 _16531 = select(_16529, float3(0.0), isnan(_16529));
        float _5592 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16531.xy, uint(rint(_16531.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16531.xy, uint(rint(_16531.z))).x;
        float _5594 = _1875 + _2412;
        float _5596 = _2412 * 3.0;
        float _5598 = -_5594;
        float _5600 = _5598 + _5592;
        float _5602 = _5600 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _5604 = precise::max(_5602, _5596);
        float _5606 = precise::min(0.0, _5604);
        bool _5608 = _5606 != _5602;
        bool _5610 = isnan(_5606);
        bool _5612 = _5608 || _5610;
        bool _5614 = isnan(_5602);
        bool _5616 = _5612 || _5614;
        bool _5618 = !_5616;
        if (!_5618)
        {
            float _5620 = fma(_2410, 2.0, _1873);
            float _5622 = fma(_2408, 2.0, _1877);
            float3 _16583 = float3(_5622, _5620, float(int(_1896)));
            float3 _16585 = select(_16583, float3(0.0), isnan(_16583));
            float _5624 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16585.xy, uint(rint(_16585.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16585.xy, uint(rint(_16585.z))).x;
            float _5626 = fma(_2412, 2.0, _1875);
            float _5628 = _2412 * 4.5;
            float _5630 = -_5626;
            float _5632 = _5630 + _5624;
            float _5634 = _5632 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _5636 = precise::max(_5634, _5628);
            float _5638 = precise::min(0.0, _5636);
            bool _5640 = _5638 != _5634;
            bool _5642 = isnan(_5638);
            bool _5644 = _5640 || _5642;
            bool _5646 = isnan(_5634);
            bool _5648 = _5644 || _5646;
            bool _5650 = !_5648;
            if (!_5650)
            {
                float _5652 = fma(_2410, 3.0, _1873);
                float _5654 = fma(_2408, 3.0, _1877);
                float3 _16637 = float3(_5654, _5652, float(int(_1896)));
                float3 _16639 = select(_16637, float3(0.0), isnan(_16637));
                float _5656 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16639.xy, uint(rint(_16639.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16639.xy, uint(rint(_16639.z))).x;
                float _5658 = fma(_2412, 3.0, _1875);
                float _5660 = _2412 * 6.0;
                float _5662 = -_5658;
                float _5664 = _5662 + _5656;
                float _5666 = _5664 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _5668 = precise::max(_5666, _5660);
                float _5670 = precise::min(0.0, _5668);
                bool _5672 = _5670 != _5666;
                bool _5674 = isnan(_5670);
                bool _5676 = _5672 || _5674;
                bool _5678 = isnan(_5666);
                bool _5680 = _5676 || _5678;
                bool _5682 = !_5680;
                if (!_5682)
                {
                    float _5684 = fma(_2410, 4.0, _1873);
                    float _5686 = fma(_2408, 4.0, _1877);
                    float3 _16691 = float3(_5686, _5684, float(int(_1896)));
                    float3 _16693 = select(_16691, float3(0.0), isnan(_16691));
                    float _5688 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16693.xy, uint(rint(_16693.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16693.xy, uint(rint(_16693.z))).x;
                    float _5690 = fma(_2412, 4.0, _1875);
                    float _5692 = _2412 * 7.5;
                    float _5694 = -_5690;
                    float _5696 = _5694 + _5688;
                    float _5698 = _5696 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _5700 = precise::max(_5698, _5692);
                    float _5702 = precise::min(0.0, _5700);
                    bool _5704 = _5702 != _5698;
                    bool _5706 = isnan(_5702);
                    bool _5708 = _5704 || _5706;
                    bool _5710 = isnan(_5698);
                    bool _5712 = _5708 || _5710;
                    bool _5714 = !_5712;
                    if (!_5714)
                    {
                        float _5716 = fma(_2410, 5.0, _1873);
                        float _5718 = fma(_2408, 5.0, _1877);
                        float3 _16745 = float3(_5718, _5716, float(int(_1896)));
                        float3 _16747 = select(_16745, float3(0.0), isnan(_16745));
                        float _5720 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16747.xy, uint(rint(_16747.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16747.xy, uint(rint(_16747.z))).x;
                        float _5722 = fma(_2412, 5.0, _1875);
                        float _5724 = _2412 * 9.0;
                        float _5726 = -_5722;
                        float _5728 = _5726 + _5720;
                        float _5730 = _5728 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _5732 = precise::max(_5730, _5724);
                        float _5734 = precise::min(0.0, _5732);
                        bool _5736 = _5734 != _5730;
                        bool _5738 = isnan(_5734);
                        bool _5740 = _5736 || _5738;
                        bool _5742 = isnan(_5730);
                        bool _5744 = _5740 || _5742;
                        bool _5746 = !_5744;
                        if (!_5746)
                        {
                            float _5748 = fma(_2410, 6.0, _1873);
                            float _5750 = fma(_2408, 6.0, _1877);
                            float3 _16799 = float3(_5750, _5748, float(int(_1896)));
                            float3 _16801 = select(_16799, float3(0.0), isnan(_16799));
                            float _5752 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16801.xy, uint(rint(_16801.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16801.xy, uint(rint(_16801.z))).x;
                            float _5754 = fma(_2412, 6.0, _1875);
                            float _5756 = _2412 * 10.5;
                            float _5758 = -_5754;
                            float _5760 = _5758 + _5752;
                            float _5762 = _5760 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _5764 = precise::max(_5762, _5756);
                            float _5766 = precise::min(0.0, _5764);
                            bool _5768 = _5766 != _5762;
                            bool _5770 = isnan(_5766);
                            bool _5772 = _5768 || _5770;
                            bool _5774 = isnan(_5762);
                            bool _5776 = _5772 || _5774;
                            bool _5778 = !_5776;
                            if (!_5778)
                            {
                                float _5780 = fma(_2410, 7.0, _1873);
                                float _5782 = fma(_2408, 7.0, _1877);
                                float3 _16853 = float3(_5782, _5780, float(int(_1896)));
                                float3 _16855 = select(_16853, float3(0.0), isnan(_16853));
                                float _5784 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16855.xy, uint(rint(_16855.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16855.xy, uint(rint(_16855.z))).x;
                                float _5786 = fma(_2412, 7.0, _1875);
                                float _5788 = _2412 * 12.0;
                                float _5790 = -_5786;
                                float _5792 = _5790 + _5784;
                                float _5794 = _5792 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _5796 = precise::max(_5794, _5788);
                                float _5798 = precise::min(0.0, _5796);
                                bool _5800 = _5798 != _5794;
                                bool _5802 = isnan(_5798);
                                bool _5804 = _5800 || _5802;
                                bool _5806 = isnan(_5794);
                                bool _5808 = _5804 || _5806;
                                bool _5810 = !_5808;
                                if (!_5810)
                                {
                                    float _5812 = fma(_2410, 8.0, _1873);
                                    float _5814 = fma(_2408, 8.0, _1877);
                                    float3 _16907 = float3(_5814, _5812, float(int(_1896)));
                                    float3 _16909 = select(_16907, float3(0.0), isnan(_16907));
                                    float _5816 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16909.xy, uint(rint(_16909.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16909.xy, uint(rint(_16909.z))).x;
                                    float _5818 = fma(_2412, 8.0, _1875);
                                    float _5820 = fma(_2412, 13.5, -1.0);
                                    float _5822 = -_5818;
                                    float _5824 = _5822 + _5816;
                                    float _5826 = _5824 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _5828 = precise::max(_5826, _5820);
                                    float _5830 = precise::min(0.0, _5828);
                                    bool _5832 = _5830 != _5826;
                                    bool _5834 = isnan(_5830);
                                    bool _5836 = _5832 || _5834;
                                    bool _5838 = isnan(_5826);
                                    bool _5840 = _5836 || _5838;
                                    bool _5842 = !_5840;
                                    if (!_5842)
                                    {
                                        float _5844 = fma(_2410, 9.0, _1873);
                                        float _5846 = fma(_2408, 9.0, _1877);
                                        float3 _16961 = float3(_5846, _5844, float(int(_1896)));
                                        float3 _16963 = select(_16961, float3(0.0), isnan(_16961));
                                        float _5848 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16963.xy, uint(rint(_16963.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16963.xy, uint(rint(_16963.z))).x;
                                        float _5850 = fma(_2412, 9.0, _1875);
                                        float _5852 = fma(_2412, 15.0, -1.0);
                                        float _5854 = -_5850;
                                        float _5856 = _5854 + _5848;
                                        float _5858 = _5856 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _5860 = precise::max(_5858, _5852);
                                        float _5862 = precise::min(0.0, _5860);
                                        bool _5864 = _5862 != _5858;
                                        bool _5866 = isnan(_5862);
                                        bool _5868 = _5864 || _5866;
                                        bool _5870 = isnan(_5858);
                                        bool _5872 = _5868 || _5870;
                                        _5874 = _5872;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_5874)
    {
        float _5876 = _5566 + 1.0;
        _5586 = _5876;
    }
    _5874 = false;
    float _5878 = _5586;
    float _5880 = _2418 * 1.5;
    float _5882 = precise::max(_2446, _5880);
    float _5884 = precise::min(0.0, _5882);
    bool _5886 = _5884 != _2446;
    bool _5888 = isnan(_5884);
    bool _5890 = _5886 || _5888;
    bool _5892 = isnan(_2446);
    bool _5894 = _5890 || _5892;
    bool _5896 = !_5894;
    float _5898 = _5878;
    if (!_5896)
    {
        float _5900 = _1873 + _2416;
        float _5902 = _1877 + _2414;
        float3 _17054 = float3(_5902, _5900, float(int(_1896)));
        float3 _17056 = select(_17054, float3(0.0), isnan(_17054));
        float _5904 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17056.xy, uint(rint(_17056.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17056.xy, uint(rint(_17056.z))).x;
        float _5906 = _1875 + _2418;
        float _5908 = _2418 * 3.0;
        float _5910 = -_5906;
        float _5912 = _5910 + _5904;
        float _5914 = _5912 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _5916 = precise::max(_5914, _5908);
        float _5918 = precise::min(0.0, _5916);
        bool _5920 = _5918 != _5914;
        bool _5922 = isnan(_5918);
        bool _5924 = _5920 || _5922;
        bool _5926 = isnan(_5914);
        bool _5928 = _5924 || _5926;
        bool _5930 = !_5928;
        if (!_5930)
        {
            float _5932 = fma(_2416, 2.0, _1873);
            float _5934 = fma(_2414, 2.0, _1877);
            float3 _17108 = float3(_5934, _5932, float(int(_1896)));
            float3 _17110 = select(_17108, float3(0.0), isnan(_17108));
            float _5936 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17110.xy, uint(rint(_17110.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17110.xy, uint(rint(_17110.z))).x;
            float _5938 = fma(_2418, 2.0, _1875);
            float _5940 = _2418 * 4.5;
            float _5942 = -_5938;
            float _5944 = _5942 + _5936;
            float _5946 = _5944 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _5948 = precise::max(_5946, _5940);
            float _5950 = precise::min(0.0, _5948);
            bool _5952 = _5950 != _5946;
            bool _5954 = isnan(_5950);
            bool _5956 = _5952 || _5954;
            bool _5958 = isnan(_5946);
            bool _5960 = _5956 || _5958;
            bool _5962 = !_5960;
            if (!_5962)
            {
                float _5964 = fma(_2416, 3.0, _1873);
                float _5966 = fma(_2414, 3.0, _1877);
                float3 _17162 = float3(_5966, _5964, float(int(_1896)));
                float3 _17164 = select(_17162, float3(0.0), isnan(_17162));
                float _5968 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17164.xy, uint(rint(_17164.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17164.xy, uint(rint(_17164.z))).x;
                float _5970 = fma(_2418, 3.0, _1875);
                float _5972 = _2418 * 6.0;
                float _5974 = -_5970;
                float _5976 = _5974 + _5968;
                float _5978 = _5976 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _5980 = precise::max(_5978, _5972);
                float _5982 = precise::min(0.0, _5980);
                bool _5984 = _5982 != _5978;
                bool _5986 = isnan(_5982);
                bool _5988 = _5984 || _5986;
                bool _5990 = isnan(_5978);
                bool _5992 = _5988 || _5990;
                bool _5994 = !_5992;
                if (!_5994)
                {
                    float _5996 = fma(_2416, 4.0, _1873);
                    float _5998 = fma(_2414, 4.0, _1877);
                    float3 _17216 = float3(_5998, _5996, float(int(_1896)));
                    float3 _17218 = select(_17216, float3(0.0), isnan(_17216));
                    float _6000 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17218.xy, uint(rint(_17218.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17218.xy, uint(rint(_17218.z))).x;
                    float _6002 = fma(_2418, 4.0, _1875);
                    float _6004 = _2418 * 7.5;
                    float _6006 = -_6002;
                    float _6008 = _6006 + _6000;
                    float _6010 = _6008 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _6012 = precise::max(_6010, _6004);
                    float _6014 = precise::min(0.0, _6012);
                    bool _6016 = _6014 != _6010;
                    bool _6018 = isnan(_6014);
                    bool _6020 = _6016 || _6018;
                    bool _6022 = isnan(_6010);
                    bool _6024 = _6020 || _6022;
                    bool _6026 = !_6024;
                    if (!_6026)
                    {
                        float _6028 = fma(_2416, 5.0, _1873);
                        float _6030 = fma(_2414, 5.0, _1877);
                        float3 _17270 = float3(_6030, _6028, float(int(_1896)));
                        float3 _17272 = select(_17270, float3(0.0), isnan(_17270));
                        float _6032 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17272.xy, uint(rint(_17272.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17272.xy, uint(rint(_17272.z))).x;
                        float _6034 = fma(_2418, 5.0, _1875);
                        float _6036 = _2418 * 9.0;
                        float _6038 = -_6034;
                        float _6040 = _6038 + _6032;
                        float _6042 = _6040 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _6044 = precise::max(_6042, _6036);
                        float _6046 = precise::min(0.0, _6044);
                        bool _6048 = _6046 != _6042;
                        bool _6050 = isnan(_6046);
                        bool _6052 = _6048 || _6050;
                        bool _6054 = isnan(_6042);
                        bool _6056 = _6052 || _6054;
                        bool _6058 = !_6056;
                        if (!_6058)
                        {
                            float _6060 = fma(_2416, 6.0, _1873);
                            float _6062 = fma(_2414, 6.0, _1877);
                            float3 _17324 = float3(_6062, _6060, float(int(_1896)));
                            float3 _17326 = select(_17324, float3(0.0), isnan(_17324));
                            float _6064 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17326.xy, uint(rint(_17326.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17326.xy, uint(rint(_17326.z))).x;
                            float _6066 = fma(_2418, 6.0, _1875);
                            float _6068 = _2418 * 10.5;
                            float _6070 = -_6066;
                            float _6072 = _6070 + _6064;
                            float _6074 = _6072 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _6076 = precise::max(_6074, _6068);
                            float _6078 = precise::min(0.0, _6076);
                            bool _6080 = _6078 != _6074;
                            bool _6082 = isnan(_6078);
                            bool _6084 = _6080 || _6082;
                            bool _6086 = isnan(_6074);
                            bool _6088 = _6084 || _6086;
                            bool _6090 = !_6088;
                            if (!_6090)
                            {
                                float _6092 = fma(_2416, 7.0, _1873);
                                float _6094 = fma(_2414, 7.0, _1877);
                                float3 _17378 = float3(_6094, _6092, float(int(_1896)));
                                float3 _17380 = select(_17378, float3(0.0), isnan(_17378));
                                float _6096 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17380.xy, uint(rint(_17380.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17380.xy, uint(rint(_17380.z))).x;
                                float _6098 = fma(_2418, 7.0, _1875);
                                float _6100 = _2418 * 12.0;
                                float _6102 = -_6098;
                                float _6104 = _6102 + _6096;
                                float _6106 = _6104 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _6108 = precise::max(_6106, _6100);
                                float _6110 = precise::min(0.0, _6108);
                                bool _6112 = _6110 != _6106;
                                bool _6114 = isnan(_6110);
                                bool _6116 = _6112 || _6114;
                                bool _6118 = isnan(_6106);
                                bool _6120 = _6116 || _6118;
                                bool _6122 = !_6120;
                                if (!_6122)
                                {
                                    float _6124 = fma(_2416, 8.0, _1873);
                                    float _6126 = fma(_2414, 8.0, _1877);
                                    float3 _17432 = float3(_6126, _6124, float(int(_1896)));
                                    float3 _17434 = select(_17432, float3(0.0), isnan(_17432));
                                    float _6128 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17434.xy, uint(rint(_17434.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17434.xy, uint(rint(_17434.z))).x;
                                    float _6130 = fma(_2418, 8.0, _1875);
                                    float _6132 = fma(_2418, 13.5, -1.0);
                                    float _6134 = -_6130;
                                    float _6136 = _6134 + _6128;
                                    float _6138 = _6136 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _6140 = precise::max(_6138, _6132);
                                    float _6142 = precise::min(0.0, _6140);
                                    bool _6144 = _6142 != _6138;
                                    bool _6146 = isnan(_6142);
                                    bool _6148 = _6144 || _6146;
                                    bool _6150 = isnan(_6138);
                                    bool _6152 = _6148 || _6150;
                                    bool _6154 = !_6152;
                                    if (!_6154)
                                    {
                                        float _6156 = fma(_2416, 9.0, _1873);
                                        float _6158 = fma(_2414, 9.0, _1877);
                                        float3 _17486 = float3(_6158, _6156, float(int(_1896)));
                                        float3 _17488 = select(_17486, float3(0.0), isnan(_17486));
                                        float _6160 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17488.xy, uint(rint(_17488.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17488.xy, uint(rint(_17488.z))).x;
                                        float _6162 = fma(_2418, 9.0, _1875);
                                        float _6164 = -_6162;
                                        float _6166 = _6164 + _6160;
                                        float _6168 = fma(_2418, 15.0, -1.0);
                                        float _6170 = _6166 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _6172 = precise::max(_6170, _6168);
                                        float _6174 = precise::min(0.0, _6172);
                                        bool _6176 = _6174 != _6170;
                                        bool _6178 = isnan(_6174);
                                        bool _6180 = _6176 || _6178;
                                        bool _6182 = isnan(_6170);
                                        bool _6184 = _6180 || _6182;
                                        _6186 = _6184;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_6186)
    {
        float _6188 = _5878 + 1.0;
        _5898 = _6188;
    }
    _6186 = false;
    float _6190 = _5898;
    float _6192 = _2424 * 1.5;
    float _6194 = precise::max(_2446, _6192);
    float _6196 = precise::min(0.0, _6194);
    bool _6198 = _6196 != _2446;
    bool _6200 = isnan(_6196);
    bool _6202 = _6198 || _6200;
    bool _6204 = isnan(_2446);
    bool _6206 = _6202 || _6204;
    bool _6208 = !_6206;
    float _6210 = _6190;
    if (!_6208)
    {
        float _6212 = _1873 + _2422;
        float _6214 = _1877 + _2420;
        float3 _17579 = float3(_6214, _6212, float(int(_1896)));
        float3 _17581 = select(_17579, float3(0.0), isnan(_17579));
        float _6216 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17581.xy, uint(rint(_17581.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17581.xy, uint(rint(_17581.z))).x;
        float _6218 = _1875 + _2424;
        float _6220 = _2424 * 3.0;
        float _6222 = -_6218;
        float _6224 = _6222 + _6216;
        float _6226 = _6224 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _6228 = precise::max(_6226, _6220);
        float _6230 = precise::min(0.0, _6228);
        bool _6232 = _6230 != _6226;
        bool _6234 = isnan(_6230);
        bool _6236 = _6232 || _6234;
        bool _6238 = isnan(_6226);
        bool _6240 = _6236 || _6238;
        bool _6242 = !_6240;
        if (!_6242)
        {
            float _6244 = fma(_2422, 2.0, _1873);
            float _6246 = fma(_2420, 2.0, _1877);
            float3 _17633 = float3(_6246, _6244, float(int(_1896)));
            float3 _17635 = select(_17633, float3(0.0), isnan(_17633));
            float _6248 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17635.xy, uint(rint(_17635.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17635.xy, uint(rint(_17635.z))).x;
            float _6250 = fma(_2424, 2.0, _1875);
            float _6252 = _2424 * 4.5;
            float _6254 = -_6250;
            float _6256 = _6254 + _6248;
            float _6258 = _6256 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _6260 = precise::max(_6258, _6252);
            float _6262 = precise::min(0.0, _6260);
            bool _6264 = _6262 != _6258;
            bool _6266 = isnan(_6262);
            bool _6268 = _6264 || _6266;
            bool _6270 = isnan(_6258);
            bool _6272 = _6268 || _6270;
            bool _6274 = !_6272;
            if (!_6274)
            {
                float _6276 = fma(_2422, 3.0, _1873);
                float _6278 = fma(_2420, 3.0, _1877);
                float3 _17687 = float3(_6278, _6276, float(int(_1896)));
                float3 _17689 = select(_17687, float3(0.0), isnan(_17687));
                float _6280 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17689.xy, uint(rint(_17689.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17689.xy, uint(rint(_17689.z))).x;
                float _6282 = fma(_2424, 3.0, _1875);
                float _6284 = _2424 * 6.0;
                float _6286 = -_6282;
                float _6288 = _6286 + _6280;
                float _6290 = _6288 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _6292 = precise::max(_6290, _6284);
                float _6294 = precise::min(0.0, _6292);
                bool _6296 = _6294 != _6290;
                bool _6298 = isnan(_6294);
                bool _6300 = _6296 || _6298;
                bool _6302 = isnan(_6290);
                bool _6304 = _6300 || _6302;
                bool _6306 = !_6304;
                if (!_6306)
                {
                    float _6308 = fma(_2422, 4.0, _1873);
                    float _6310 = fma(_2420, 4.0, _1877);
                    float3 _17741 = float3(_6310, _6308, float(int(_1896)));
                    float3 _17743 = select(_17741, float3(0.0), isnan(_17741));
                    float _6312 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17743.xy, uint(rint(_17743.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17743.xy, uint(rint(_17743.z))).x;
                    float _6314 = fma(_2424, 4.0, _1875);
                    float _6316 = _2424 * 7.5;
                    float _6318 = -_6314;
                    float _6320 = _6318 + _6312;
                    float _6322 = _6320 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _6324 = precise::max(_6322, _6316);
                    float _6326 = precise::min(0.0, _6324);
                    bool _6328 = _6326 != _6322;
                    bool _6330 = isnan(_6326);
                    bool _6332 = _6328 || _6330;
                    bool _6334 = isnan(_6322);
                    bool _6336 = _6332 || _6334;
                    bool _6338 = !_6336;
                    if (!_6338)
                    {
                        float _6340 = fma(_2422, 5.0, _1873);
                        float _6342 = fma(_2420, 5.0, _1877);
                        float3 _17795 = float3(_6342, _6340, float(int(_1896)));
                        float3 _17797 = select(_17795, float3(0.0), isnan(_17795));
                        float _6344 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17797.xy, uint(rint(_17797.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17797.xy, uint(rint(_17797.z))).x;
                        float _6346 = fma(_2424, 5.0, _1875);
                        float _6348 = _2424 * 9.0;
                        float _6350 = -_6346;
                        float _6352 = _6350 + _6344;
                        float _6354 = _6352 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _6356 = precise::max(_6354, _6348);
                        float _6358 = precise::min(0.0, _6356);
                        bool _6360 = _6358 != _6354;
                        bool _6362 = isnan(_6358);
                        bool _6364 = _6360 || _6362;
                        bool _6366 = isnan(_6354);
                        bool _6368 = _6364 || _6366;
                        bool _6370 = !_6368;
                        if (!_6370)
                        {
                            float _6372 = fma(_2422, 6.0, _1873);
                            float _6374 = fma(_2420, 6.0, _1877);
                            float3 _17849 = float3(_6374, _6372, float(int(_1896)));
                            float3 _17851 = select(_17849, float3(0.0), isnan(_17849));
                            float _6376 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17851.xy, uint(rint(_17851.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17851.xy, uint(rint(_17851.z))).x;
                            float _6378 = fma(_2424, 6.0, _1875);
                            float _6380 = _2424 * 10.5;
                            float _6382 = -_6378;
                            float _6384 = _6382 + _6376;
                            float _6386 = _6384 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _6388 = precise::max(_6386, _6380);
                            float _6390 = precise::min(0.0, _6388);
                            bool _6392 = _6390 != _6386;
                            bool _6394 = isnan(_6390);
                            bool _6396 = _6392 || _6394;
                            bool _6398 = isnan(_6386);
                            bool _6400 = _6396 || _6398;
                            bool _6402 = !_6400;
                            if (!_6402)
                            {
                                float _6404 = fma(_2422, 7.0, _1873);
                                float _6406 = fma(_2420, 7.0, _1877);
                                float3 _17903 = float3(_6406, _6404, float(int(_1896)));
                                float3 _17905 = select(_17903, float3(0.0), isnan(_17903));
                                float _6408 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17905.xy, uint(rint(_17905.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17905.xy, uint(rint(_17905.z))).x;
                                float _6410 = fma(_2424, 7.0, _1875);
                                float _6412 = _2424 * 12.0;
                                float _6414 = -_6410;
                                float _6416 = _6414 + _6408;
                                float _6418 = _6416 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _6420 = precise::max(_6418, _6412);
                                float _6422 = precise::min(0.0, _6420);
                                bool _6424 = _6422 != _6418;
                                bool _6426 = isnan(_6422);
                                bool _6428 = _6424 || _6426;
                                bool _6430 = isnan(_6418);
                                bool _6432 = _6428 || _6430;
                                bool _6434 = !_6432;
                                if (!_6434)
                                {
                                    float _6436 = fma(_2422, 8.0, _1873);
                                    float _6438 = fma(_2420, 8.0, _1877);
                                    float3 _17957 = float3(_6438, _6436, float(int(_1896)));
                                    float3 _17959 = select(_17957, float3(0.0), isnan(_17957));
                                    float _6440 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17959.xy, uint(rint(_17959.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17959.xy, uint(rint(_17959.z))).x;
                                    float _6442 = fma(_2424, 8.0, _1875);
                                    float _6444 = fma(_2424, 13.5, -1.0);
                                    float _6446 = -_6442;
                                    float _6448 = _6446 + _6440;
                                    float _6450 = _6448 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _6452 = precise::max(_6450, _6444);
                                    float _6454 = precise::min(0.0, _6452);
                                    bool _6456 = _6454 != _6450;
                                    bool _6458 = isnan(_6454);
                                    bool _6460 = _6456 || _6458;
                                    bool _6462 = isnan(_6450);
                                    bool _6464 = _6460 || _6462;
                                    bool _6466 = !_6464;
                                    if (!_6466)
                                    {
                                        float _6468 = fma(_2422, 9.0, _1873);
                                        float _6470 = fma(_2420, 9.0, _1877);
                                        float3 _18011 = float3(_6470, _6468, float(int(_1896)));
                                        float3 _18013 = select(_18011, float3(0.0), isnan(_18011));
                                        float _6472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _18013.xy, uint(rint(_18013.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _18013.xy, uint(rint(_18013.z))).x;
                                        float _6474 = fma(_2424, 9.0, _1875);
                                        float _6476 = fma(_2424, 15.0, -1.0);
                                        float _6478 = -_6474;
                                        float _6480 = _6478 + _6472;
                                        float _6482 = _6480 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _6484 = precise::max(_6482, _6476);
                                        float _6486 = precise::min(0.0, _6484);
                                        bool _6488 = _6486 != _6482;
                                        bool _6490 = isnan(_6486);
                                        bool _6492 = _6488 || _6490;
                                        bool _6494 = isnan(_6482);
                                        bool _6496 = _6492 || _6494;
                                        _6498 = _6496;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_6498)
    {
        float _6500 = _6190 + 1.0;
        _6210 = _6500;
    }
    _6498 = false;
    float _6502 = _6210;
    float _6504 = _2430 * 1.5;
    float _6506 = precise::max(_2446, _6504);
    float _6508 = precise::min(0.0, _6506);
    bool _6510 = _6508 != _2446;
    bool _6512 = isnan(_6508);
    bool _6514 = _6510 || _6512;
    bool _6516 = isnan(_2446);
    bool _6518 = _6514 || _6516;
    bool _6520 = !_6518;
    float _6522 = _6502;
    if (!_6520)
    {
        float _6524 = _1873 + _2428;
        float _6526 = _1877 + _2426;
        float3 _18104 = float3(_6526, _6524, float(int(_1896)));
        float3 _18106 = select(_18104, float3(0.0), isnan(_18104));
        float _6528 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _18106.xy, uint(rint(_18106.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _18106.xy, uint(rint(_18106.z))).x;
        float _6530 = _1875 + _2430;
        float _6532 = _2430 * 3.0;
        float _6534 = -_6530;
        float _6536 = _6534 + _6528;
        float _6538 = _6536 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _6540 = precise::max(_6538, _6532);
        float _6542 = precise::min(0.0, _6540);
        bool _6544 = _6542 != _6538;
        bool _6546 = isnan(_6542);
        bool _6548 = _6544 || _6546;
        bool _6550 = isnan(_6538);
        bool _6552 = _6548 || _6550;
        bool _6554 = !_6552;
        if (!_6554)
        {
            float _6556 = fma(_2428, 2.0, _1873);
            float _6558 = fma(_2426, 2.0, _1877);
            float3 _18158 = float3(_6558, _6556, float(int(_1896)));
            float3 _18160 = select(_18158, float3(0.0), isnan(_18158));
            float _6560 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _18160.xy, uint(rint(_18160.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _18160.xy, uint(rint(_18160.z))).x;
            float _6562 = fma(_2430, 2.0, _1875);
            float _6564 = _2430 * 4.5;
            float _6566 = -_6562;
            float _6568 = _6566 + _6560;
            float _6570 = _6568 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _6572 = precise::max(_6570, _6564);
            float _6574 = precise::min(0.0, _6572);
            bool _6576 = _6574 != _6570;
            bool _6578 = isnan(_6574);
            bool _6580 = _6576 || _6578;
            bool _6582 = isnan(_6570);
            bool _6584 = _6580 || _6582;
            bool _6586 = !_6584;
            if (!_6586)
            {
                float _6588 = fma(_2428, 3.0, _1873);
                float _6590 = fma(_2426, 3.0, _1877);
                float3 _18212 = float3(_6590, _6588, float(int(_1896)));
                float3 _18214 = select(_18212, float3(0.0), isnan(_18212));
                float _6592 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _18214.xy, uint(rint(_18214.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _18214.xy, uint(rint(_18214.z))).x;
                float _6594 = fma(_2430, 3.0, _1875);
                float _6596 = _2430 * 6.0;
                float _6598 = -_6594;
                float _6600 = _6598 + _6592;
                float _6602 = _6600 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _6604 = precise::max(_6602, _6596);
                float _6606 = precise::min(0.0, _6604);
                bool _6608 = _6606 != _6602;
                bool _6610 = isnan(_6606);
                bool _6612 = _6608 || _6610;
                bool _6614 = isnan(_6602);
                bool _6616 = _6612 || _6614;
                bool _6618 = !_6616;
                if (!_6618)
                {
                    float _6620 = fma(_2428, 4.0, _1873);
                    float _6622 = fma(_2426, 4.0, _1877);
                    float3 _18266 = float3(_6622, _6620, float(int(_1896)));
                    float3 _18268 = select(_18266, float3(0.0), isnan(_18266));
                    float _6624 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _18268.xy, uint(rint(_18268.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _18268.xy, uint(rint(_18268.z))).x;
                    float _6626 = fma(_2430, 4.0, _1875);
                    float _6628 = _2430 * 7.5;
                    float _6630 = -_6626;
                    float _6632 = _6630 + _6624;
                    float _6634 = _6632 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _6636 = precise::max(_6634, _6628);
                    float _6638 = precise::min(0.0, _6636);
                    bool _6640 = _6638 != _6634;
                    bool _6642 = isnan(_6638);
                    bool _6644 = _6640 || _6642;
                    bool _6646 = isnan(_6634);
                    bool _6648 = _6644 || _6646;
                    bool _6650 = !_6648;
                    if (!_6650)
                    {
                        float _6652 = fma(_2428, 5.0, _1873);
                        float _6654 = fma(_2426, 5.0, _1877);
                        float3 _18320 = float3(_6654, _6652, float(int(_1896)));
                        float3 _18322 = select(_18320, float3(0.0), isnan(_18320));
                        float _6656 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _18322.xy, uint(rint(_18322.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _18322.xy, uint(rint(_18322.z))).x;
                        float _6658 = fma(_2430, 5.0, _1875);
                        float _6660 = _2430 * 9.0;
                        float _6662 = -_6658;
                        float _6664 = _6662 + _6656;
                        float _6666 = _6664 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _6668 = precise::max(_6666, _6660);
                        float _6670 = precise::min(0.0, _6668);
                        bool _6672 = _6670 != _6666;
                        bool _6674 = isnan(_6670);
                        bool _6676 = _6672 || _6674;
                        bool _6678 = isnan(_6666);
                        bool _6680 = _6676 || _6678;
                        bool _6682 = !_6680;
                        if (!_6682)
                        {
                            float _6684 = fma(_2428, 6.0, _1873);
                            float _6686 = fma(_2426, 6.0, _1877);
                            float3 _18374 = float3(_6686, _6684, float(int(_1896)));
                            float3 _18376 = select(_18374, float3(0.0), isnan(_18374));
                            float _6688 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _18376.xy, uint(rint(_18376.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _18376.xy, uint(rint(_18376.z))).x;
                            float _6690 = fma(_2430, 6.0, _1875);
                            float _6692 = _2430 * 10.5;
                            float _6694 = -_6690;
                            float _6696 = _6694 + _6688;
                            float _6698 = _6696 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _6700 = precise::max(_6698, _6692);
                            float _6702 = precise::min(0.0, _6700);
                            bool _6704 = _6702 != _6698;
                            bool _6706 = isnan(_6702);
                            bool _6708 = _6704 || _6706;
                            bool _6710 = isnan(_6698);
                            bool _6712 = _6708 || _6710;
                            bool _6714 = !_6712;
                            if (!_6714)
                            {
                                float _6716 = fma(_2428, 7.0, _1873);
                                float _6718 = fma(_2426, 7.0, _1877);
                                float3 _18428 = float3(_6718, _6716, float(int(_1896)));
                                float3 _18430 = select(_18428, float3(0.0), isnan(_18428));
                                float _6720 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _18430.xy, uint(rint(_18430.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _18430.xy, uint(rint(_18430.z))).x;
                                float _6722 = fma(_2430, 7.0, _1875);
                                float _6724 = _2430 * 12.0;
                                float _6726 = -_6722;
                                float _6728 = _6726 + _6720;
                                float _6730 = _6728 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _6732 = precise::max(_6730, _6724);
                                float _6734 = precise::min(0.0, _6732);
                                bool _6736 = _6734 != _6730;
                                bool _6738 = isnan(_6734);
                                bool _6740 = _6736 || _6738;
                                bool _6742 = isnan(_6730);
                                bool _6744 = _6740 || _6742;
                                bool _6746 = !_6744;
                                if (!_6746)
                                {
                                    float _6748 = fma(_2428, 8.0, _1873);
                                    float _6750 = fma(_2426, 8.0, _1877);
                                    float3 _18482 = float3(_6750, _6748, float(int(_1896)));
                                    float3 _18484 = select(_18482, float3(0.0), isnan(_18482));
                                    float _6752 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _18484.xy, uint(rint(_18484.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _18484.xy, uint(rint(_18484.z))).x;
                                    float _6754 = fma(_2430, 8.0, _1875);
                                    float _6756 = fma(_2430, 13.5, -1.0);
                                    float _6758 = -_6754;
                                    float _6760 = _6758 + _6752;
                                    float _6762 = _6760 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _6764 = precise::max(_6762, _6756);
                                    float _6766 = precise::min(0.0, _6764);
                                    bool _6768 = _6766 != _6762;
                                    bool _6770 = isnan(_6766);
                                    bool _6772 = _6768 || _6770;
                                    bool _6774 = isnan(_6762);
                                    bool _6776 = _6772 || _6774;
                                    bool _6778 = !_6776;
                                    if (!_6778)
                                    {
                                        float _6780 = fma(_2428, 9.0, _1873);
                                        float _6782 = fma(_2426, 9.0, _1877);
                                        float3 _18536 = float3(_6782, _6780, float(int(_1896)));
                                        float3 _18538 = select(_18536, float3(0.0), isnan(_18536));
                                        float _6784 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _18538.xy, uint(rint(_18538.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _18538.xy, uint(rint(_18538.z))).x;
                                        float _6786 = fma(_2430, 9.0, _1875);
                                        float _6788 = -_6786;
                                        float _6790 = _6788 + _6784;
                                        float _6792 = fma(_2430, 15.0, -1.0);
                                        float _6794 = _6790 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _6796 = precise::max(_6794, _6792);
                                        float _6798 = precise::min(0.0, _6796);
                                        bool _6800 = _6798 != _6794;
                                        bool _6802 = isnan(_6798);
                                        bool _6804 = _6800 || _6802;
                                        bool _6806 = isnan(_6794);
                                        bool _6808 = _6804 || _6806;
                                        _6810 = _6808;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_6810)
    {
        float _6812 = _6502 + 1.0;
        _6522 = _6812;
    }
    _6810 = false;
    float _6814 = _6522;
    float _6816 = _2436 * 1.5;
    float _6818 = precise::max(_2446, _6816);
    float _6820 = precise::min(0.0, _6818);
    bool _6822 = _6820 != _2446;
    bool _6824 = isnan(_6820);
    bool _6826 = _6822 || _6824;
    bool _6828 = isnan(_2446);
    bool _6830 = _6826 || _6828;
    bool _6832 = !_6830;
    float _6834 = _6814;
    if (!_6832)
    {
        float _6836 = _1873 + _2434;
        float _6838 = _1877 + _2432;
        float3 _18629 = float3(_6838, _6836, float(int(_1896)));
        float3 _18631 = select(_18629, float3(0.0), isnan(_18629));
        float _6840 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _18631.xy, uint(rint(_18631.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _18631.xy, uint(rint(_18631.z))).x;
        float _6842 = _1875 + _2436;
        float _6844 = _2436 * 3.0;
        float _6846 = -_6842;
        float _6848 = _6846 + _6840;
        float _6850 = _6848 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _6852 = precise::max(_6850, _6844);
        float _6854 = precise::min(0.0, _6852);
        bool _6856 = _6854 != _6850;
        bool _6858 = isnan(_6854);
        bool _6860 = _6856 || _6858;
        bool _6862 = isnan(_6850);
        bool _6864 = _6860 || _6862;
        bool _6866 = !_6864;
        if (!_6866)
        {
            float _6868 = fma(_2434, 2.0, _1873);
            float _6870 = fma(_2432, 2.0, _1877);
            float3 _18683 = float3(_6870, _6868, float(int(_1896)));
            float3 _18685 = select(_18683, float3(0.0), isnan(_18683));
            float _6872 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _18685.xy, uint(rint(_18685.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _18685.xy, uint(rint(_18685.z))).x;
            float _6874 = fma(_2436, 2.0, _1875);
            float _6876 = _2436 * 4.5;
            float _6878 = -_6874;
            float _6880 = _6878 + _6872;
            float _6882 = _6880 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _6884 = precise::max(_6882, _6876);
            float _6886 = precise::min(0.0, _6884);
            bool _6888 = _6886 != _6882;
            bool _6890 = isnan(_6886);
            bool _6892 = _6888 || _6890;
            bool _6894 = isnan(_6882);
            bool _6896 = _6892 || _6894;
            bool _6898 = !_6896;
            if (!_6898)
            {
                float _6900 = fma(_2434, 3.0, _1873);
                float _6902 = fma(_2432, 3.0, _1877);
                float3 _18737 = float3(_6902, _6900, float(int(_1896)));
                float3 _18739 = select(_18737, float3(0.0), isnan(_18737));
                float _6904 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _18739.xy, uint(rint(_18739.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _18739.xy, uint(rint(_18739.z))).x;
                float _6906 = fma(_2436, 3.0, _1875);
                float _6908 = _2436 * 6.0;
                float _6910 = -_6906;
                float _6912 = _6910 + _6904;
                float _6914 = _6912 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _6916 = precise::max(_6914, _6908);
                float _6918 = precise::min(0.0, _6916);
                bool _6920 = _6918 != _6914;
                bool _6922 = isnan(_6918);
                bool _6924 = _6920 || _6922;
                bool _6926 = isnan(_6914);
                bool _6928 = _6924 || _6926;
                bool _6930 = !_6928;
                if (!_6930)
                {
                    float _6932 = fma(_2434, 4.0, _1873);
                    float _6934 = fma(_2432, 4.0, _1877);
                    float3 _18791 = float3(_6934, _6932, float(int(_1896)));
                    float3 _18793 = select(_18791, float3(0.0), isnan(_18791));
                    float _6936 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _18793.xy, uint(rint(_18793.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _18793.xy, uint(rint(_18793.z))).x;
                    float _6938 = fma(_2436, 4.0, _1875);
                    float _6940 = _2436 * 7.5;
                    float _6942 = -_6938;
                    float _6944 = _6942 + _6936;
                    float _6946 = _6944 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _6948 = precise::max(_6946, _6940);
                    float _6950 = precise::min(0.0, _6948);
                    bool _6952 = _6950 != _6946;
                    bool _6954 = isnan(_6950);
                    bool _6956 = _6952 || _6954;
                    bool _6958 = isnan(_6946);
                    bool _6960 = _6956 || _6958;
                    bool _6962 = !_6960;
                    if (!_6962)
                    {
                        float _6964 = fma(_2434, 5.0, _1873);
                        float _6966 = fma(_2432, 5.0, _1877);
                        float3 _18845 = float3(_6966, _6964, float(int(_1896)));
                        float3 _18847 = select(_18845, float3(0.0), isnan(_18845));
                        float _6968 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _18847.xy, uint(rint(_18847.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _18847.xy, uint(rint(_18847.z))).x;
                        float _6970 = fma(_2436, 5.0, _1875);
                        float _6972 = _2436 * 9.0;
                        float _6974 = -_6970;
                        float _6976 = _6974 + _6968;
                        float _6978 = _6976 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _6980 = precise::max(_6978, _6972);
                        float _6982 = precise::min(0.0, _6980);
                        bool _6984 = _6982 != _6978;
                        bool _6986 = isnan(_6982);
                        bool _6988 = _6984 || _6986;
                        bool _6990 = isnan(_6978);
                        bool _6992 = _6988 || _6990;
                        bool _6994 = !_6992;
                        if (!_6994)
                        {
                            float _6996 = fma(_2434, 6.0, _1873);
                            float _6998 = fma(_2432, 6.0, _1877);
                            float3 _18899 = float3(_6998, _6996, float(int(_1896)));
                            float3 _18901 = select(_18899, float3(0.0), isnan(_18899));
                            float _7000 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _18901.xy, uint(rint(_18901.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _18901.xy, uint(rint(_18901.z))).x;
                            float _7002 = fma(_2436, 6.0, _1875);
                            float _7004 = _2436 * 10.5;
                            float _7006 = -_7002;
                            float _7008 = _7006 + _7000;
                            float _7010 = _7008 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _7012 = precise::max(_7010, _7004);
                            float _7014 = precise::min(0.0, _7012);
                            bool _7016 = _7014 != _7010;
                            bool _7018 = isnan(_7014);
                            bool _7020 = _7016 || _7018;
                            bool _7022 = isnan(_7010);
                            bool _7024 = _7020 || _7022;
                            bool _7026 = !_7024;
                            if (!_7026)
                            {
                                float _7028 = fma(_2434, 7.0, _1873);
                                float _7030 = fma(_2432, 7.0, _1877);
                                float3 _18953 = float3(_7030, _7028, float(int(_1896)));
                                float3 _18955 = select(_18953, float3(0.0), isnan(_18953));
                                float _7032 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _18955.xy, uint(rint(_18955.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _18955.xy, uint(rint(_18955.z))).x;
                                float _7034 = fma(_2436, 7.0, _1875);
                                float _7036 = _2436 * 12.0;
                                float _7038 = -_7034;
                                float _7040 = _7038 + _7032;
                                float _7042 = _7040 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _7044 = precise::max(_7042, _7036);
                                float _7046 = precise::min(0.0, _7044);
                                bool _7048 = _7046 != _7042;
                                bool _7050 = isnan(_7046);
                                bool _7052 = _7048 || _7050;
                                bool _7054 = isnan(_7042);
                                bool _7056 = _7052 || _7054;
                                bool _7058 = !_7056;
                                if (!_7058)
                                {
                                    float _7060 = fma(_2434, 8.0, _1873);
                                    float _7062 = fma(_2432, 8.0, _1877);
                                    float3 _19007 = float3(_7062, _7060, float(int(_1896)));
                                    float3 _19009 = select(_19007, float3(0.0), isnan(_19007));
                                    float _7064 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _19009.xy, uint(rint(_19009.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _19009.xy, uint(rint(_19009.z))).x;
                                    float _7066 = fma(_2436, 8.0, _1875);
                                    float _7068 = fma(_2436, 13.5, -1.0);
                                    float _7070 = -_7066;
                                    float _7072 = _7070 + _7064;
                                    float _7074 = _7072 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _7076 = precise::max(_7074, _7068);
                                    float _7078 = precise::min(0.0, _7076);
                                    bool _7080 = _7078 != _7074;
                                    bool _7082 = isnan(_7078);
                                    bool _7084 = _7080 || _7082;
                                    bool _7086 = isnan(_7074);
                                    bool _7088 = _7084 || _7086;
                                    bool _7090 = !_7088;
                                    if (!_7090)
                                    {
                                        float _7092 = fma(_2434, 9.0, _1873);
                                        float _7094 = fma(_2432, 9.0, _1877);
                                        float3 _19061 = float3(_7094, _7092, float(int(_1896)));
                                        float3 _19063 = select(_19061, float3(0.0), isnan(_19061));
                                        float _7096 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _19063.xy, uint(rint(_19063.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _19063.xy, uint(rint(_19063.z))).x;
                                        float _7098 = fma(_2436, 9.0, _1875);
                                        float _7100 = fma(_2436, 15.0, -1.0);
                                        float _7102 = -_7098;
                                        float _7104 = _7102 + _7096;
                                        float _7106 = _7104 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _7108 = precise::max(_7106, _7100);
                                        float _7110 = precise::min(0.0, _7108);
                                        bool _7112 = _7110 != _7106;
                                        bool _7114 = isnan(_7110);
                                        bool _7116 = _7112 || _7114;
                                        bool _7118 = isnan(_7106);
                                        bool _7120 = _7116 || _7118;
                                        _7122 = _7120;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_7122)
    {
        float _7124 = _6814 + 1.0;
        _6834 = _7124;
    }
    _7122 = false;
    float _7126 = _6834;
    float _7128 = _2440 * 1.5;
    float _7130 = precise::max(_2446, _7128);
    float _7132 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _7134 = 1.0 + _7132;
    float _7136 = precise::min(0.0, _7130);
    bool _7138 = _7136 != _2446;
    bool _7140 = isnan(_7136);
    bool _7142 = _7138 || _7140;
    bool _7144 = isnan(_2446);
    bool _7146 = _7142 || _7144;
    float _7148 = fma(_7134, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _7150 = _7148 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _7152 = !_7146;
    float _7154 = _7126;
    if (!_7152)
    {
        float _7156 = _1873 + _2094;
        float _7158 = _1877 + _2438;
        float3 _19169 = float3(_7158, _7156, float(int(_1896)));
        float3 _19171 = select(_19169, float3(0.0), isnan(_19169));
        float _7160 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _19171.xy, uint(rint(_19171.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _19171.xy, uint(rint(_19171.z))).x;
        float _7162 = _1875 + _2440;
        float _7164 = _2440 * 3.0;
        float _7166 = -_7162;
        float _7168 = _7166 + _7160;
        float _7170 = _7168 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _7172 = precise::max(_7170, _7164);
        float _7174 = precise::min(0.0, _7172);
        bool _7176 = _7174 != _7170;
        bool _7178 = isnan(_7174);
        bool _7180 = _7176 || _7178;
        bool _7182 = isnan(_7170);
        bool _7184 = _7180 || _7182;
        bool _7186 = !_7184;
        if (!_7186)
        {
            float _7188 = fma(_2094, 2.0, _1873);
            float _7190 = fma(_2438, 2.0, _1877);
            float3 _19223 = float3(_7190, _7188, float(int(_1896)));
            float3 _19225 = select(_19223, float3(0.0), isnan(_19223));
            float _7192 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _19225.xy, uint(rint(_19225.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _19225.xy, uint(rint(_19225.z))).x;
            float _7194 = fma(_2440, 2.0, _1875);
            float _7196 = _2440 * 4.5;
            float _7198 = -_7194;
            float _7200 = _7198 + _7192;
            float _7202 = _7200 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _7204 = precise::max(_7202, _7196);
            float _7206 = precise::min(0.0, _7204);
            bool _7208 = _7206 != _7202;
            bool _7210 = isnan(_7206);
            bool _7212 = _7208 || _7210;
            bool _7214 = isnan(_7202);
            bool _7216 = _7212 || _7214;
            bool _7218 = !_7216;
            if (!_7218)
            {
                float _7220 = fma(_2094, 3.0, _1873);
                float _7222 = fma(_2438, 3.0, _1877);
                float3 _19277 = float3(_7222, _7220, float(int(_1896)));
                float3 _19279 = select(_19277, float3(0.0), isnan(_19277));
                float _7224 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _19279.xy, uint(rint(_19279.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _19279.xy, uint(rint(_19279.z))).x;
                float _7226 = fma(_2440, 3.0, _1875);
                float _7228 = _2440 * 6.0;
                float _7230 = -_7226;
                float _7232 = _7230 + _7224;
                float _7234 = _7232 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _7236 = precise::max(_7234, _7228);
                float _7238 = precise::min(0.0, _7236);
                bool _7240 = _7238 != _7234;
                bool _7242 = isnan(_7238);
                bool _7244 = _7240 || _7242;
                bool _7246 = isnan(_7234);
                bool _7248 = _7244 || _7246;
                bool _7250 = !_7248;
                if (!_7250)
                {
                    float _7252 = fma(_2094, 4.0, _1873);
                    float _7254 = fma(_2438, 4.0, _1877);
                    float3 _19331 = float3(_7254, _7252, float(int(_1896)));
                    float3 _19333 = select(_19331, float3(0.0), isnan(_19331));
                    float _7256 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _19333.xy, uint(rint(_19333.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _19333.xy, uint(rint(_19333.z))).x;
                    float _7258 = fma(_2440, 4.0, _1875);
                    float _7260 = _2440 * 7.5;
                    float _7262 = -_7258;
                    float _7264 = _7262 + _7256;
                    float _7266 = _7264 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _7268 = precise::max(_7266, _7260);
                    float _7270 = precise::min(0.0, _7268);
                    bool _7272 = _7270 != _7266;
                    bool _7274 = isnan(_7270);
                    bool _7276 = _7272 || _7274;
                    bool _7278 = isnan(_7266);
                    bool _7280 = _7276 || _7278;
                    bool _7282 = !_7280;
                    if (!_7282)
                    {
                        float _7284 = fma(_2094, 5.0, _1873);
                        float _7286 = fma(_2438, 5.0, _1877);
                        float3 _19385 = float3(_7286, _7284, float(int(_1896)));
                        float3 _19387 = select(_19385, float3(0.0), isnan(_19385));
                        float _7288 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _19387.xy, uint(rint(_19387.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _19387.xy, uint(rint(_19387.z))).x;
                        float _7290 = fma(_2440, 5.0, _1875);
                        float _7292 = _2440 * 9.0;
                        float _7294 = -_7290;
                        float _7296 = _7294 + _7288;
                        float _7298 = _7296 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _7300 = precise::max(_7298, _7292);
                        float _7302 = precise::min(0.0, _7300);
                        bool _7304 = _7302 != _7298;
                        bool _7306 = isnan(_7302);
                        bool _7308 = _7304 || _7306;
                        bool _7310 = isnan(_7298);
                        bool _7312 = _7308 || _7310;
                        bool _7314 = !_7312;
                        if (!_7314)
                        {
                            float _7316 = fma(_2094, 6.0, _1873);
                            float _7318 = fma(_2438, 6.0, _1877);
                            float3 _19439 = float3(_7318, _7316, float(int(_1896)));
                            float3 _19441 = select(_19439, float3(0.0), isnan(_19439));
                            float _7320 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _19441.xy, uint(rint(_19441.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _19441.xy, uint(rint(_19441.z))).x;
                            float _7322 = fma(_2440, 6.0, _1875);
                            float _7324 = _2440 * 10.5;
                            float _7326 = -_7322;
                            float _7328 = _7326 + _7320;
                            float _7330 = _7328 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _7332 = precise::max(_7330, _7324);
                            float _7334 = precise::min(0.0, _7332);
                            bool _7336 = _7334 != _7330;
                            bool _7338 = isnan(_7334);
                            bool _7340 = _7336 || _7338;
                            bool _7342 = isnan(_7330);
                            bool _7344 = _7340 || _7342;
                            bool _7346 = !_7344;
                            if (!_7346)
                            {
                                float _7348 = fma(_2094, 7.0, _1873);
                                float _7350 = fma(_2438, 7.0, _1877);
                                float3 _19493 = float3(_7350, _7348, float(int(_1896)));
                                float3 _19495 = select(_19493, float3(0.0), isnan(_19493));
                                float _7352 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _19495.xy, uint(rint(_19495.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _19495.xy, uint(rint(_19495.z))).x;
                                float _7354 = fma(_2440, 7.0, _1875);
                                float _7356 = _2440 * 12.0;
                                float _7358 = -_7354;
                                float _7360 = _7358 + _7352;
                                float _7362 = _7360 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _7364 = precise::max(_7362, _7356);
                                float _7366 = precise::min(0.0, _7364);
                                bool _7368 = _7366 != _7362;
                                bool _7370 = isnan(_7366);
                                bool _7372 = _7368 || _7370;
                                bool _7374 = isnan(_7362);
                                bool _7376 = _7372 || _7374;
                                bool _7378 = !_7376;
                                if (!_7378)
                                {
                                    float _7380 = fma(_2094, 8.0, _1873);
                                    float _7382 = fma(_2438, 8.0, _1877);
                                    float3 _19547 = float3(_7382, _7380, float(int(_1896)));
                                    float3 _19549 = select(_19547, float3(0.0), isnan(_19547));
                                    float _7384 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _19549.xy, uint(rint(_19549.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _19549.xy, uint(rint(_19549.z))).x;
                                    float _7386 = fma(_2440, 8.0, _1875);
                                    float _7388 = fma(_2440, 13.5, -1.0);
                                    float _7390 = -_7386;
                                    float _7392 = _7390 + _7384;
                                    float _7394 = _7392 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _7396 = precise::max(_7394, _7388);
                                    float _7398 = precise::min(0.0, _7396);
                                    bool _7400 = _7398 != _7394;
                                    bool _7402 = isnan(_7398);
                                    bool _7404 = _7400 || _7402;
                                    bool _7406 = isnan(_7394);
                                    bool _7408 = _7404 || _7406;
                                    bool _7410 = !_7408;
                                    if (!_7410)
                                    {
                                        float _7412 = fma(_2094, 9.0, _1873);
                                        float _7414 = fma(_2438, 9.0, _1877);
                                        float3 _19601 = float3(_7414, _7412, float(int(_1896)));
                                        float3 _19603 = select(_19601, float3(0.0), isnan(_19601));
                                        float _7416 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _19603.xy, uint(rint(_19603.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _19603.xy, uint(rint(_19603.z))).x;
                                        float _7418 = fma(_2440, 9.0, _1875);
                                        float _7420 = fma(_2440, 15.0, -1.0);
                                        float _7422 = -_7418;
                                        float _7424 = _7422 + _7416;
                                        float _7426 = _7424 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _7428 = precise::max(_7426, _7420);
                                        float _7430 = precise::min(0.0, _7428);
                                        bool _7432 = _7430 != _7426;
                                        bool _7434 = isnan(_7430);
                                        bool _7436 = _7432 || _7434;
                                        bool _7438 = isnan(_7426);
                                        bool _7440 = _7436 || _7438;
                                        _7442 = _7440;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_7442)
    {
        float _7444 = _7126 + 1.0;
        _7154 = _7444;
    }
    _7442 = false;
    float _7446 = _7154;
    float _7448 = _7446 * 0.0625;
    float _7450 = -_7448;
    float _7452 = fma(_7450, _7150, 1.0);
    out.m_39.x = _7452;
    return out;
}

