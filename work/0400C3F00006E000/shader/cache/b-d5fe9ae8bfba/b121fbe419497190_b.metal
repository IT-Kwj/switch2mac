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
    bool _5910 = false;
    bool _5686 = false;
    bool _5466 = false;
    bool _5250 = false;
    bool _5034 = false;
    bool _4818 = false;
    bool _4602 = false;
    bool _4386 = false;
    bool _4170 = false;
    bool _3954 = false;
    bool _3738 = false;
    bool _3522 = false;
    bool _3306 = false;
    bool _3090 = false;
    bool _2874 = false;
    bool _2660 = false;
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
    float2 _5955 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5955, float2(0.0), isnan(_5955))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5955, float2(0.0), isnan(_5955))).x;
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
    float3 _9003 = float3(_1877, _1873, float(int(_1896)));
    float3 _9007 = select(_9003, float3(0.0), isnan(_9003));
    float _1934 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9007.xy, uint(rint(_9007.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9007.xy, uint(rint(_9007.z))).x;
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
    float _2046 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.14285714924335479736328125;
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
    float _2658;
    if (!_2462)
    {
        float _2464 = _1877 + _2350;
        float _2466 = _1873 + _2352;
        float3 _9731 = float3(_2464, _2466, float(int(_1896)));
        float3 _9733 = select(_9731, float3(0.0), isnan(_9731));
        float _2468 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9733.xy, uint(rint(_9733.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9733.xy, uint(rint(_9733.z))).x;
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
            float3 _9786 = float3(_2496, _2498, float(int(_1896)));
            float3 _9788 = select(_9786, float3(0.0), isnan(_9786));
            float _2500 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9788.xy, uint(rint(_9788.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9788.xy, uint(rint(_9788.z))).x;
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
                float3 _9841 = float3(_2528, _2530, float(int(_1896)));
                float3 _9843 = select(_9841, float3(0.0), isnan(_9841));
                float _2532 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9843.xy, uint(rint(_9843.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9843.xy, uint(rint(_9843.z))).x;
                float _2534 = _1875 + _2472;
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
                    float3 _9897 = float3(_2560, _2562, float(int(_1896)));
                    float3 _9899 = select(_9897, float3(0.0), isnan(_9897));
                    float _2564 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9899.xy, uint(rint(_9899.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9899.xy, uint(rint(_9899.z))).x;
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
                        float3 _9953 = float3(_2592, _2594, float(int(_1896)));
                        float3 _9955 = select(_9953, float3(0.0), isnan(_9953));
                        float _2596 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9955.xy, uint(rint(_9955.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9955.xy, uint(rint(_9955.z))).x;
                        float _2598 = fma(_2062, 5.0, _1875);
                        float _2600 = fma(_2062, 9.0, -1.0);
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
                            float _2624 = fma(_2352, 6.0, _1873);
                            float _2626 = fma(_2350, 6.0, _1877);
                            float3 _10008 = float3(_2626, _2624, float(int(_1896)));
                            float3 _10010 = select(_10008, float3(0.0), isnan(_10008));
                            float _2628 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10010.xy, uint(rint(_10010.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10010.xy, uint(rint(_10010.z))).x;
                            float _2630 = _1875 + _2536;
                            float _2632 = fma(_2062, 10.5, -1.0);
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
                            float _2654 = _2642;
                            if (_2652)
                            {
                                _2654 = 0.0;
                            }
                            float _2656 = _2654;
                            _2658 = _2656;
                            _2660 = _2652;
                        }
                    }
                }
            }
        }
    }
    if (!_2660)
    {
        _2658 = 1.0;
    }
    _2660 = false;
    float _2662 = _2658;
    float _2664 = _2358 * 1.5;
    float _2666 = precise::max(_2446, _2664);
    float _2668 = precise::min(0.0, _2666);
    bool _2670 = _2668 != _2446;
    bool _2672 = isnan(_2668);
    bool _2674 = _2670 || _2672;
    bool _2676 = isnan(_2446);
    bool _2678 = _2674 || _2676;
    bool _2680 = !_2678;
    float _2682 = _2662;
    if (!_2680)
    {
        float _2684 = _1877 + _2354;
        float _2686 = _1873 + _2356;
        float3 _10102 = float3(_2684, _2686, float(int(_1896)));
        float3 _10104 = select(_10102, float3(0.0), isnan(_10102));
        float _2688 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10104.xy, uint(rint(_10104.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10104.xy, uint(rint(_10104.z))).x;
        float _2690 = _1875 + _2358;
        float _2692 = _2358 * 3.0;
        float _2694 = -_2690;
        float _2696 = _2694 + _2688;
        float _2698 = _2696 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _2700 = precise::max(_2698, _2692);
        float _2702 = precise::min(0.0, _2700);
        bool _2704 = _2702 != _2698;
        bool _2706 = isnan(_2702);
        bool _2708 = _2704 || _2706;
        bool _2710 = isnan(_2698);
        bool _2712 = _2708 || _2710;
        bool _2714 = !_2712;
        if (!_2714)
        {
            float _2716 = fma(_2354, 2.0, _1877);
            float _2718 = fma(_2356, 2.0, _1873);
            float3 _10156 = float3(_2716, _2718, float(int(_1896)));
            float3 _10158 = select(_10156, float3(0.0), isnan(_10156));
            float _2720 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10158.xy, uint(rint(_10158.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10158.xy, uint(rint(_10158.z))).x;
            float _2722 = fma(_2358, 2.0, _1875);
            float _2724 = _2358 * 4.5;
            float _2726 = -_2722;
            float _2728 = _2726 + _2720;
            float _2730 = _2728 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _2732 = precise::max(_2730, _2724);
            float _2734 = precise::min(0.0, _2732);
            bool _2736 = _2734 != _2730;
            bool _2738 = isnan(_2734);
            bool _2740 = _2736 || _2738;
            bool _2742 = isnan(_2730);
            bool _2744 = _2740 || _2742;
            bool _2746 = !_2744;
            if (!_2746)
            {
                float _2748 = fma(_2354, 3.0, _1877);
                float _2750 = fma(_2356, 3.0, _1873);
                float3 _10210 = float3(_2748, _2750, float(int(_1896)));
                float3 _10212 = select(_10210, float3(0.0), isnan(_10210));
                float _2752 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10212.xy, uint(rint(_10212.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10212.xy, uint(rint(_10212.z))).x;
                float _2754 = _1875 + _2692;
                float _2756 = _2358 * 6.0;
                float _2758 = -_2754;
                float _2760 = _2758 + _2752;
                float _2762 = _2760 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _2764 = precise::max(_2762, _2756);
                float _2766 = precise::min(0.0, _2764);
                bool _2768 = _2766 != _2762;
                bool _2770 = isnan(_2766);
                bool _2772 = _2768 || _2770;
                bool _2774 = isnan(_2762);
                bool _2776 = _2772 || _2774;
                bool _2778 = !_2776;
                if (!_2778)
                {
                    float _2780 = fma(_2354, 4.0, _1877);
                    float _2782 = fma(_2356, 4.0, _1873);
                    float3 _10264 = float3(_2780, _2782, float(int(_1896)));
                    float3 _10266 = select(_10264, float3(0.0), isnan(_10264));
                    float _2784 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10266.xy, uint(rint(_10266.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10266.xy, uint(rint(_10266.z))).x;
                    float _2786 = fma(_2358, 4.0, _1875);
                    float _2788 = _2358 * 7.5;
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
                        float _2812 = fma(_2354, 5.0, _1877);
                        float _2814 = fma(_2356, 5.0, _1873);
                        float3 _10318 = float3(_2812, _2814, float(int(_1896)));
                        float3 _10320 = select(_10318, float3(0.0), isnan(_10318));
                        float _2816 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10320.xy, uint(rint(_10320.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10320.xy, uint(rint(_10320.z))).x;
                        float _2818 = fma(_2358, 5.0, _1875);
                        float _2820 = fma(_2358, 9.0, -1.0);
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
                            float _2844 = fma(_2356, 6.0, _1873);
                            float _2846 = fma(_2354, 6.0, _1877);
                            float3 _10372 = float3(_2846, _2844, float(int(_1896)));
                            float3 _10374 = select(_10372, float3(0.0), isnan(_10372));
                            float _2848 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10374.xy, uint(rint(_10374.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10374.xy, uint(rint(_10374.z))).x;
                            float _2850 = _1875 + _2756;
                            float _2852 = fma(_2358, 10.5, -1.0);
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
                            _2874 = _2872;
                        }
                    }
                }
            }
        }
    }
    if (!_2874)
    {
        float _2876 = _2662 + 1.0;
        _2682 = _2876;
    }
    _2874 = false;
    float _2878 = _2682;
    float _2880 = _2364 * 1.5;
    float _2882 = precise::max(_2446, _2880);
    float _2884 = precise::min(0.0, _2882);
    bool _2886 = _2884 != _2446;
    bool _2888 = isnan(_2884);
    bool _2890 = _2886 || _2888;
    bool _2892 = isnan(_2446);
    bool _2894 = _2890 || _2892;
    bool _2896 = !_2894;
    float _2898 = _2878;
    if (!_2896)
    {
        float _2900 = _1873 + _2362;
        float _2902 = _1877 + _2360;
        float3 _10462 = float3(_2902, _2900, float(int(_1896)));
        float3 _10464 = select(_10462, float3(0.0), isnan(_10462));
        float _2904 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10464.xy, uint(rint(_10464.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10464.xy, uint(rint(_10464.z))).x;
        float _2906 = _1875 + _2364;
        float _2908 = _2364 * 3.0;
        float _2910 = -_2906;
        float _2912 = _2910 + _2904;
        float _2914 = _2912 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _2916 = precise::max(_2914, _2908);
        float _2918 = precise::min(0.0, _2916);
        bool _2920 = _2918 != _2914;
        bool _2922 = isnan(_2918);
        bool _2924 = _2920 || _2922;
        bool _2926 = isnan(_2914);
        bool _2928 = _2924 || _2926;
        bool _2930 = !_2928;
        if (!_2930)
        {
            float _2932 = fma(_2362, 2.0, _1873);
            float _2934 = fma(_2360, 2.0, _1877);
            float3 _10516 = float3(_2934, _2932, float(int(_1896)));
            float3 _10518 = select(_10516, float3(0.0), isnan(_10516));
            float _2936 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10518.xy, uint(rint(_10518.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10518.xy, uint(rint(_10518.z))).x;
            float _2938 = fma(_2364, 2.0, _1875);
            float _2940 = _2364 * 4.5;
            float _2942 = -_2938;
            float _2944 = _2942 + _2936;
            float _2946 = _2944 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _2948 = precise::max(_2946, _2940);
            float _2950 = precise::min(0.0, _2948);
            bool _2952 = _2950 != _2946;
            bool _2954 = isnan(_2950);
            bool _2956 = _2952 || _2954;
            bool _2958 = isnan(_2946);
            bool _2960 = _2956 || _2958;
            bool _2962 = !_2960;
            if (!_2962)
            {
                float _2964 = fma(_2362, 3.0, _1873);
                float _2966 = fma(_2360, 3.0, _1877);
                float3 _10570 = float3(_2966, _2964, float(int(_1896)));
                float3 _10572 = select(_10570, float3(0.0), isnan(_10570));
                float _2968 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10572.xy, uint(rint(_10572.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10572.xy, uint(rint(_10572.z))).x;
                float _2970 = _1875 + _2908;
                float _2972 = _2364 * 6.0;
                float _2974 = -_2970;
                float _2976 = _2974 + _2968;
                float _2978 = _2976 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _2980 = precise::max(_2978, _2972);
                float _2982 = precise::min(0.0, _2980);
                bool _2984 = _2982 != _2978;
                bool _2986 = isnan(_2982);
                bool _2988 = _2984 || _2986;
                bool _2990 = isnan(_2978);
                bool _2992 = _2988 || _2990;
                bool _2994 = !_2992;
                if (!_2994)
                {
                    float _2996 = fma(_2362, 4.0, _1873);
                    float _2998 = fma(_2360, 4.0, _1877);
                    float3 _10624 = float3(_2998, _2996, float(int(_1896)));
                    float3 _10626 = select(_10624, float3(0.0), isnan(_10624));
                    float _3000 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10626.xy, uint(rint(_10626.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10626.xy, uint(rint(_10626.z))).x;
                    float _3002 = fma(_2364, 4.0, _1875);
                    float _3004 = _2364 * 7.5;
                    float _3006 = -_3002;
                    float _3008 = _3006 + _3000;
                    float _3010 = _3008 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _3012 = precise::max(_3010, _3004);
                    float _3014 = precise::min(0.0, _3012);
                    bool _3016 = _3014 != _3010;
                    bool _3018 = isnan(_3014);
                    bool _3020 = _3016 || _3018;
                    bool _3022 = isnan(_3010);
                    bool _3024 = _3020 || _3022;
                    bool _3026 = !_3024;
                    if (!_3026)
                    {
                        float _3028 = fma(_2362, 5.0, _1873);
                        float _3030 = fma(_2360, 5.0, _1877);
                        float3 _10678 = float3(_3030, _3028, float(int(_1896)));
                        float3 _10680 = select(_10678, float3(0.0), isnan(_10678));
                        float _3032 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10680.xy, uint(rint(_10680.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10680.xy, uint(rint(_10680.z))).x;
                        float _3034 = fma(_2364, 5.0, _1875);
                        float _3036 = fma(_2364, 9.0, -1.0);
                        float _3038 = -_3034;
                        float _3040 = _3038 + _3032;
                        float _3042 = _3040 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _3044 = precise::max(_3042, _3036);
                        float _3046 = precise::min(0.0, _3044);
                        bool _3048 = _3046 != _3042;
                        bool _3050 = isnan(_3046);
                        bool _3052 = _3048 || _3050;
                        bool _3054 = isnan(_3042);
                        bool _3056 = _3052 || _3054;
                        bool _3058 = !_3056;
                        if (!_3058)
                        {
                            float _3060 = fma(_2360, 6.0, _1877);
                            float _3062 = fma(_2362, 6.0, _1873);
                            float3 _10732 = float3(_3060, _3062, float(int(_1896)));
                            float3 _10734 = select(_10732, float3(0.0), isnan(_10732));
                            float _3064 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10734.xy, uint(rint(_10734.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10734.xy, uint(rint(_10734.z))).x;
                            float _3066 = _1875 + _2972;
                            float _3068 = fma(_2364, 10.5, -1.0);
                            float _3070 = -_3066;
                            float _3072 = _3070 + _3064;
                            float _3074 = _3072 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _3076 = precise::max(_3074, _3068);
                            float _3078 = precise::min(0.0, _3076);
                            bool _3080 = _3078 != _3074;
                            bool _3082 = isnan(_3078);
                            bool _3084 = _3080 || _3082;
                            bool _3086 = isnan(_3074);
                            bool _3088 = _3084 || _3086;
                            _3090 = _3088;
                        }
                    }
                }
            }
        }
    }
    if (!_3090)
    {
        float _3092 = _2878 + 1.0;
        _2898 = _3092;
    }
    _3090 = false;
    float _3094 = _2898;
    float _3096 = _2370 * 1.5;
    float _3098 = precise::max(_2446, _3096);
    float _3100 = precise::min(0.0, _3098);
    bool _3102 = _3100 != _2446;
    bool _3104 = isnan(_3100);
    bool _3106 = _3102 || _3104;
    bool _3108 = isnan(_2446);
    bool _3110 = _3106 || _3108;
    bool _3112 = !_3110;
    float _3114 = _3094;
    if (!_3112)
    {
        float _3116 = _1873 + _2368;
        float _3118 = _1877 + _2366;
        float3 _10822 = float3(_3118, _3116, float(int(_1896)));
        float3 _10824 = select(_10822, float3(0.0), isnan(_10822));
        float _3120 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10824.xy, uint(rint(_10824.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10824.xy, uint(rint(_10824.z))).x;
        float _3122 = _1875 + _2370;
        float _3124 = _2370 * 3.0;
        float _3126 = -_3122;
        float _3128 = _3126 + _3120;
        float _3130 = _3128 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _3132 = precise::max(_3130, _3124);
        float _3134 = precise::min(0.0, _3132);
        bool _3136 = _3134 != _3130;
        bool _3138 = isnan(_3134);
        bool _3140 = _3136 || _3138;
        bool _3142 = isnan(_3130);
        bool _3144 = _3140 || _3142;
        bool _3146 = !_3144;
        if (!_3146)
        {
            float _3148 = fma(_2368, 2.0, _1873);
            float _3150 = fma(_2366, 2.0, _1877);
            float3 _10876 = float3(_3150, _3148, float(int(_1896)));
            float3 _10878 = select(_10876, float3(0.0), isnan(_10876));
            float _3152 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10878.xy, uint(rint(_10878.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10878.xy, uint(rint(_10878.z))).x;
            float _3154 = fma(_2370, 2.0, _1875);
            float _3156 = _2370 * 4.5;
            float _3158 = -_3154;
            float _3160 = _3158 + _3152;
            float _3162 = _3160 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _3164 = precise::max(_3162, _3156);
            float _3166 = precise::min(0.0, _3164);
            bool _3168 = _3166 != _3162;
            bool _3170 = isnan(_3166);
            bool _3172 = _3168 || _3170;
            bool _3174 = isnan(_3162);
            bool _3176 = _3172 || _3174;
            bool _3178 = !_3176;
            if (!_3178)
            {
                float _3180 = fma(_2368, 3.0, _1873);
                float _3182 = fma(_2366, 3.0, _1877);
                float3 _10930 = float3(_3182, _3180, float(int(_1896)));
                float3 _10932 = select(_10930, float3(0.0), isnan(_10930));
                float _3184 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10932.xy, uint(rint(_10932.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10932.xy, uint(rint(_10932.z))).x;
                float _3186 = _1875 + _3124;
                float _3188 = _2370 * 6.0;
                float _3190 = -_3186;
                float _3192 = _3190 + _3184;
                float _3194 = _3192 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _3196 = precise::max(_3194, _3188);
                float _3198 = precise::min(0.0, _3196);
                bool _3200 = _3198 != _3194;
                bool _3202 = isnan(_3198);
                bool _3204 = _3200 || _3202;
                bool _3206 = isnan(_3194);
                bool _3208 = _3204 || _3206;
                bool _3210 = !_3208;
                if (!_3210)
                {
                    float _3212 = fma(_2368, 4.0, _1873);
                    float _3214 = fma(_2366, 4.0, _1877);
                    float3 _10984 = float3(_3214, _3212, float(int(_1896)));
                    float3 _10986 = select(_10984, float3(0.0), isnan(_10984));
                    float _3216 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10986.xy, uint(rint(_10986.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10986.xy, uint(rint(_10986.z))).x;
                    float _3218 = fma(_2370, 4.0, _1875);
                    float _3220 = _2370 * 7.5;
                    float _3222 = -_3218;
                    float _3224 = _3222 + _3216;
                    float _3226 = _3224 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _3228 = precise::max(_3226, _3220);
                    float _3230 = precise::min(0.0, _3228);
                    bool _3232 = _3230 != _3226;
                    bool _3234 = isnan(_3230);
                    bool _3236 = _3232 || _3234;
                    bool _3238 = isnan(_3226);
                    bool _3240 = _3236 || _3238;
                    bool _3242 = !_3240;
                    if (!_3242)
                    {
                        float _3244 = fma(_2368, 5.0, _1873);
                        float _3246 = fma(_2366, 5.0, _1877);
                        float3 _11038 = float3(_3246, _3244, float(int(_1896)));
                        float3 _11040 = select(_11038, float3(0.0), isnan(_11038));
                        float _3248 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11040.xy, uint(rint(_11040.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11040.xy, uint(rint(_11040.z))).x;
                        float _3250 = fma(_2370, 5.0, _1875);
                        float _3252 = fma(_2370, 9.0, -1.0);
                        float _3254 = -_3250;
                        float _3256 = _3254 + _3248;
                        float _3258 = _3256 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _3260 = precise::max(_3258, _3252);
                        float _3262 = precise::min(0.0, _3260);
                        bool _3264 = _3262 != _3258;
                        bool _3266 = isnan(_3262);
                        bool _3268 = _3264 || _3266;
                        bool _3270 = isnan(_3258);
                        bool _3272 = _3268 || _3270;
                        bool _3274 = !_3272;
                        if (!_3274)
                        {
                            float _3276 = fma(_2366, 6.0, _1877);
                            float _3278 = fma(_2368, 6.0, _1873);
                            float3 _11092 = float3(_3276, _3278, float(int(_1896)));
                            float3 _11094 = select(_11092, float3(0.0), isnan(_11092));
                            float _3280 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11094.xy, uint(rint(_11094.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11094.xy, uint(rint(_11094.z))).x;
                            float _3282 = _1875 + _3188;
                            float _3284 = fma(_2370, 10.5, -1.0);
                            float _3286 = -_3282;
                            float _3288 = _3286 + _3280;
                            float _3290 = _3288 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _3292 = precise::max(_3290, _3284);
                            float _3294 = precise::min(0.0, _3292);
                            bool _3296 = _3294 != _3290;
                            bool _3298 = isnan(_3294);
                            bool _3300 = _3296 || _3298;
                            bool _3302 = isnan(_3290);
                            bool _3304 = _3300 || _3302;
                            _3306 = _3304;
                        }
                    }
                }
            }
        }
    }
    if (!_3306)
    {
        float _3308 = _3094 + 1.0;
        _3114 = _3308;
    }
    _3306 = false;
    float _3310 = _3114;
    float _3312 = _2376 * 1.5;
    float _3314 = precise::max(_2446, _3312);
    float _3316 = precise::min(0.0, _3314);
    bool _3318 = _3316 != _2446;
    bool _3320 = isnan(_3316);
    bool _3322 = _3318 || _3320;
    bool _3324 = isnan(_2446);
    bool _3326 = _3322 || _3324;
    bool _3328 = !_3326;
    float _3330 = _3310;
    if (!_3328)
    {
        float _3332 = _1877 + _2372;
        float _3334 = _1873 + _2374;
        float3 _11182 = float3(_3332, _3334, float(int(_1896)));
        float3 _11184 = select(_11182, float3(0.0), isnan(_11182));
        float _3336 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11184.xy, uint(rint(_11184.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11184.xy, uint(rint(_11184.z))).x;
        float _3338 = _1875 + _2376;
        float _3340 = _2376 * 3.0;
        float _3342 = -_3338;
        float _3344 = _3342 + _3336;
        float _3346 = _3344 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _3348 = precise::max(_3346, _3340);
        float _3350 = precise::min(0.0, _3348);
        bool _3352 = _3350 != _3346;
        bool _3354 = isnan(_3350);
        bool _3356 = _3352 || _3354;
        bool _3358 = isnan(_3346);
        bool _3360 = _3356 || _3358;
        bool _3362 = !_3360;
        if (!_3362)
        {
            float _3364 = fma(_2372, 2.0, _1877);
            float _3366 = fma(_2374, 2.0, _1873);
            float3 _11236 = float3(_3364, _3366, float(int(_1896)));
            float3 _11238 = select(_11236, float3(0.0), isnan(_11236));
            float _3368 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11238.xy, uint(rint(_11238.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11238.xy, uint(rint(_11238.z))).x;
            float _3370 = fma(_2376, 2.0, _1875);
            float _3372 = _2376 * 4.5;
            float _3374 = -_3370;
            float _3376 = _3374 + _3368;
            float _3378 = _3376 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _3380 = precise::max(_3378, _3372);
            float _3382 = precise::min(0.0, _3380);
            bool _3384 = _3382 != _3378;
            bool _3386 = isnan(_3382);
            bool _3388 = _3384 || _3386;
            bool _3390 = isnan(_3378);
            bool _3392 = _3388 || _3390;
            bool _3394 = !_3392;
            if (!_3394)
            {
                float _3396 = fma(_2372, 3.0, _1877);
                float _3398 = fma(_2374, 3.0, _1873);
                float3 _11290 = float3(_3396, _3398, float(int(_1896)));
                float3 _11292 = select(_11290, float3(0.0), isnan(_11290));
                float _3400 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11292.xy, uint(rint(_11292.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11292.xy, uint(rint(_11292.z))).x;
                float _3402 = _1875 + _3340;
                float _3404 = _2376 * 6.0;
                float _3406 = -_3402;
                float _3408 = _3406 + _3400;
                float _3410 = _3408 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _3412 = precise::max(_3410, _3404);
                float _3414 = precise::min(0.0, _3412);
                bool _3416 = _3414 != _3410;
                bool _3418 = isnan(_3414);
                bool _3420 = _3416 || _3418;
                bool _3422 = isnan(_3410);
                bool _3424 = _3420 || _3422;
                bool _3426 = !_3424;
                if (!_3426)
                {
                    float _3428 = fma(_2372, 4.0, _1877);
                    float _3430 = fma(_2374, 4.0, _1873);
                    float3 _11344 = float3(_3428, _3430, float(int(_1896)));
                    float3 _11346 = select(_11344, float3(0.0), isnan(_11344));
                    float _3432 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11346.xy, uint(rint(_11346.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11346.xy, uint(rint(_11346.z))).x;
                    float _3434 = fma(_2376, 4.0, _1875);
                    float _3436 = _2376 * 7.5;
                    float _3438 = -_3434;
                    float _3440 = _3438 + _3432;
                    float _3442 = _3440 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _3444 = precise::max(_3442, _3436);
                    float _3446 = precise::min(0.0, _3444);
                    bool _3448 = _3446 != _3442;
                    bool _3450 = isnan(_3446);
                    bool _3452 = _3448 || _3450;
                    bool _3454 = isnan(_3442);
                    bool _3456 = _3452 || _3454;
                    bool _3458 = !_3456;
                    if (!_3458)
                    {
                        float _3460 = fma(_2372, 5.0, _1877);
                        float _3462 = fma(_2374, 5.0, _1873);
                        float3 _11398 = float3(_3460, _3462, float(int(_1896)));
                        float3 _11400 = select(_11398, float3(0.0), isnan(_11398));
                        float _3464 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11400.xy, uint(rint(_11400.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11400.xy, uint(rint(_11400.z))).x;
                        float _3466 = fma(_2376, 5.0, _1875);
                        float _3468 = fma(_2376, 9.0, -1.0);
                        float _3470 = -_3466;
                        float _3472 = _3470 + _3464;
                        float _3474 = _3472 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _3476 = precise::max(_3474, _3468);
                        float _3478 = precise::min(0.0, _3476);
                        bool _3480 = _3478 != _3474;
                        bool _3482 = isnan(_3478);
                        bool _3484 = _3480 || _3482;
                        bool _3486 = isnan(_3474);
                        bool _3488 = _3484 || _3486;
                        bool _3490 = !_3488;
                        if (!_3490)
                        {
                            float _3492 = fma(_2374, 6.0, _1873);
                            float _3494 = fma(_2372, 6.0, _1877);
                            float3 _11452 = float3(_3494, _3492, float(int(_1896)));
                            float3 _11454 = select(_11452, float3(0.0), isnan(_11452));
                            float _3496 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11454.xy, uint(rint(_11454.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11454.xy, uint(rint(_11454.z))).x;
                            float _3498 = _1875 + _3404;
                            float _3500 = fma(_2376, 10.5, -1.0);
                            float _3502 = -_3498;
                            float _3504 = _3502 + _3496;
                            float _3506 = _3504 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _3508 = precise::max(_3506, _3500);
                            float _3510 = precise::min(0.0, _3508);
                            bool _3512 = _3510 != _3506;
                            bool _3514 = isnan(_3510);
                            bool _3516 = _3512 || _3514;
                            bool _3518 = isnan(_3506);
                            bool _3520 = _3516 || _3518;
                            _3522 = _3520;
                        }
                    }
                }
            }
        }
    }
    if (!_3522)
    {
        float _3524 = _3310 + 1.0;
        _3330 = _3524;
    }
    _3522 = false;
    float _3526 = _3330;
    float _3528 = _2382 * 1.5;
    float _3530 = precise::max(_2446, _3528);
    float _3532 = precise::min(0.0, _3530);
    bool _3534 = _3532 != _2446;
    bool _3536 = isnan(_3532);
    bool _3538 = _3534 || _3536;
    bool _3540 = isnan(_2446);
    bool _3542 = _3538 || _3540;
    bool _3544 = !_3542;
    float _3546 = _3526;
    if (!_3544)
    {
        float _3548 = _1873 + _2380;
        float _3550 = _1877 + _2378;
        float3 _11542 = float3(_3550, _3548, float(int(_1896)));
        float3 _11544 = select(_11542, float3(0.0), isnan(_11542));
        float _3552 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11544.xy, uint(rint(_11544.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11544.xy, uint(rint(_11544.z))).x;
        float _3554 = _1875 + _2382;
        float _3556 = _2382 * 3.0;
        float _3558 = -_3554;
        float _3560 = _3558 + _3552;
        float _3562 = _3560 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _3564 = precise::max(_3562, _3556);
        float _3566 = precise::min(0.0, _3564);
        bool _3568 = _3566 != _3562;
        bool _3570 = isnan(_3566);
        bool _3572 = _3568 || _3570;
        bool _3574 = isnan(_3562);
        bool _3576 = _3572 || _3574;
        bool _3578 = !_3576;
        if (!_3578)
        {
            float _3580 = fma(_2380, 2.0, _1873);
            float _3582 = fma(_2378, 2.0, _1877);
            float3 _11596 = float3(_3582, _3580, float(int(_1896)));
            float3 _11598 = select(_11596, float3(0.0), isnan(_11596));
            float _3584 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11598.xy, uint(rint(_11598.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11598.xy, uint(rint(_11598.z))).x;
            float _3586 = fma(_2382, 2.0, _1875);
            float _3588 = _2382 * 4.5;
            float _3590 = -_3586;
            float _3592 = _3590 + _3584;
            float _3594 = _3592 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _3596 = precise::max(_3594, _3588);
            float _3598 = precise::min(0.0, _3596);
            bool _3600 = _3598 != _3594;
            bool _3602 = isnan(_3598);
            bool _3604 = _3600 || _3602;
            bool _3606 = isnan(_3594);
            bool _3608 = _3604 || _3606;
            bool _3610 = !_3608;
            if (!_3610)
            {
                float _3612 = fma(_2380, 3.0, _1873);
                float _3614 = fma(_2378, 3.0, _1877);
                float3 _11650 = float3(_3614, _3612, float(int(_1896)));
                float3 _11652 = select(_11650, float3(0.0), isnan(_11650));
                float _3616 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11652.xy, uint(rint(_11652.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11652.xy, uint(rint(_11652.z))).x;
                float _3618 = _1875 + _3556;
                float _3620 = _2382 * 6.0;
                float _3622 = -_3618;
                float _3624 = _3622 + _3616;
                float _3626 = _3624 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _3628 = precise::max(_3626, _3620);
                float _3630 = precise::min(0.0, _3628);
                bool _3632 = _3630 != _3626;
                bool _3634 = isnan(_3630);
                bool _3636 = _3632 || _3634;
                bool _3638 = isnan(_3626);
                bool _3640 = _3636 || _3638;
                bool _3642 = !_3640;
                if (!_3642)
                {
                    float _3644 = fma(_2380, 4.0, _1873);
                    float _3646 = fma(_2378, 4.0, _1877);
                    float3 _11704 = float3(_3646, _3644, float(int(_1896)));
                    float3 _11706 = select(_11704, float3(0.0), isnan(_11704));
                    float _3648 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11706.xy, uint(rint(_11706.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11706.xy, uint(rint(_11706.z))).x;
                    float _3650 = fma(_2382, 4.0, _1875);
                    float _3652 = _2382 * 7.5;
                    float _3654 = -_3650;
                    float _3656 = _3654 + _3648;
                    float _3658 = _3656 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _3660 = precise::max(_3658, _3652);
                    float _3662 = precise::min(0.0, _3660);
                    bool _3664 = _3662 != _3658;
                    bool _3666 = isnan(_3662);
                    bool _3668 = _3664 || _3666;
                    bool _3670 = isnan(_3658);
                    bool _3672 = _3668 || _3670;
                    bool _3674 = !_3672;
                    if (!_3674)
                    {
                        float _3676 = fma(_2380, 5.0, _1873);
                        float _3678 = fma(_2378, 5.0, _1877);
                        float3 _11758 = float3(_3678, _3676, float(int(_1896)));
                        float3 _11760 = select(_11758, float3(0.0), isnan(_11758));
                        float _3680 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11760.xy, uint(rint(_11760.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11760.xy, uint(rint(_11760.z))).x;
                        float _3682 = fma(_2382, 5.0, _1875);
                        float _3684 = fma(_2382, 9.0, -1.0);
                        float _3686 = -_3682;
                        float _3688 = _3686 + _3680;
                        float _3690 = _3688 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _3692 = precise::max(_3690, _3684);
                        float _3694 = precise::min(0.0, _3692);
                        bool _3696 = _3694 != _3690;
                        bool _3698 = isnan(_3694);
                        bool _3700 = _3696 || _3698;
                        bool _3702 = isnan(_3690);
                        bool _3704 = _3700 || _3702;
                        bool _3706 = !_3704;
                        if (!_3706)
                        {
                            float _3708 = fma(_2380, 6.0, _1873);
                            float _3710 = fma(_2378, 6.0, _1877);
                            float3 _11812 = float3(_3710, _3708, float(int(_1896)));
                            float3 _11814 = select(_11812, float3(0.0), isnan(_11812));
                            float _3712 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11814.xy, uint(rint(_11814.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11814.xy, uint(rint(_11814.z))).x;
                            float _3714 = _1875 + _3620;
                            float _3716 = -_3714;
                            float _3718 = _3716 + _3712;
                            float _3720 = fma(_2382, 10.5, -1.0);
                            float _3722 = _3718 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _3724 = precise::max(_3722, _3720);
                            float _3726 = precise::min(0.0, _3724);
                            bool _3728 = _3726 != _3722;
                            bool _3730 = isnan(_3726);
                            bool _3732 = _3728 || _3730;
                            bool _3734 = isnan(_3722);
                            bool _3736 = _3732 || _3734;
                            _3738 = _3736;
                        }
                    }
                }
            }
        }
    }
    if (!_3738)
    {
        float _3740 = _3526 + 1.0;
        _3546 = _3740;
    }
    _3738 = false;
    float _3742 = _3546;
    float _3744 = _2388 * 1.5;
    float _3746 = precise::max(_2446, _3744);
    float _3748 = precise::min(0.0, _3746);
    bool _3750 = _3748 != _2446;
    bool _3752 = isnan(_3748);
    bool _3754 = _3750 || _3752;
    bool _3756 = isnan(_2446);
    bool _3758 = _3754 || _3756;
    bool _3760 = !_3758;
    float _3762 = _3742;
    if (!_3760)
    {
        float _3764 = _1873 + _2386;
        float _3766 = _1877 + _2384;
        float3 _11902 = float3(_3766, _3764, float(int(_1896)));
        float3 _11904 = select(_11902, float3(0.0), isnan(_11902));
        float _3768 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11904.xy, uint(rint(_11904.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11904.xy, uint(rint(_11904.z))).x;
        float _3770 = _1875 + _2388;
        float _3772 = _2388 * 3.0;
        float _3774 = -_3770;
        float _3776 = _3774 + _3768;
        float _3778 = _3776 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _3780 = precise::max(_3778, _3772);
        float _3782 = precise::min(0.0, _3780);
        bool _3784 = _3782 != _3778;
        bool _3786 = isnan(_3782);
        bool _3788 = _3784 || _3786;
        bool _3790 = isnan(_3778);
        bool _3792 = _3788 || _3790;
        bool _3794 = !_3792;
        if (!_3794)
        {
            float _3796 = fma(_2386, 2.0, _1873);
            float _3798 = fma(_2384, 2.0, _1877);
            float3 _11956 = float3(_3798, _3796, float(int(_1896)));
            float3 _11958 = select(_11956, float3(0.0), isnan(_11956));
            float _3800 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11958.xy, uint(rint(_11958.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11958.xy, uint(rint(_11958.z))).x;
            float _3802 = fma(_2388, 2.0, _1875);
            float _3804 = _2388 * 4.5;
            float _3806 = -_3802;
            float _3808 = _3806 + _3800;
            float _3810 = _3808 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _3812 = precise::max(_3810, _3804);
            float _3814 = precise::min(0.0, _3812);
            bool _3816 = _3814 != _3810;
            bool _3818 = isnan(_3814);
            bool _3820 = _3816 || _3818;
            bool _3822 = isnan(_3810);
            bool _3824 = _3820 || _3822;
            bool _3826 = !_3824;
            if (!_3826)
            {
                float _3828 = fma(_2386, 3.0, _1873);
                float _3830 = fma(_2384, 3.0, _1877);
                float3 _12010 = float3(_3830, _3828, float(int(_1896)));
                float3 _12012 = select(_12010, float3(0.0), isnan(_12010));
                float _3832 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12012.xy, uint(rint(_12012.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12012.xy, uint(rint(_12012.z))).x;
                float _3834 = _1875 + _3772;
                float _3836 = _2388 * 6.0;
                float _3838 = -_3834;
                float _3840 = _3838 + _3832;
                float _3842 = _3840 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _3844 = precise::max(_3842, _3836);
                float _3846 = precise::min(0.0, _3844);
                bool _3848 = _3846 != _3842;
                bool _3850 = isnan(_3846);
                bool _3852 = _3848 || _3850;
                bool _3854 = isnan(_3842);
                bool _3856 = _3852 || _3854;
                bool _3858 = !_3856;
                if (!_3858)
                {
                    float _3860 = fma(_2386, 4.0, _1873);
                    float _3862 = fma(_2384, 4.0, _1877);
                    float3 _12064 = float3(_3862, _3860, float(int(_1896)));
                    float3 _12066 = select(_12064, float3(0.0), isnan(_12064));
                    float _3864 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12066.xy, uint(rint(_12066.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12066.xy, uint(rint(_12066.z))).x;
                    float _3866 = fma(_2388, 4.0, _1875);
                    float _3868 = _2388 * 7.5;
                    float _3870 = -_3866;
                    float _3872 = _3870 + _3864;
                    float _3874 = _3872 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _3876 = precise::max(_3874, _3868);
                    float _3878 = precise::min(0.0, _3876);
                    bool _3880 = _3878 != _3874;
                    bool _3882 = isnan(_3878);
                    bool _3884 = _3880 || _3882;
                    bool _3886 = isnan(_3874);
                    bool _3888 = _3884 || _3886;
                    bool _3890 = !_3888;
                    if (!_3890)
                    {
                        float _3892 = fma(_2386, 5.0, _1873);
                        float _3894 = fma(_2384, 5.0, _1877);
                        float3 _12118 = float3(_3894, _3892, float(int(_1896)));
                        float3 _12120 = select(_12118, float3(0.0), isnan(_12118));
                        float _3896 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12120.xy, uint(rint(_12120.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12120.xy, uint(rint(_12120.z))).x;
                        float _3898 = fma(_2388, 5.0, _1875);
                        float _3900 = fma(_2388, 9.0, -1.0);
                        float _3902 = -_3898;
                        float _3904 = _3902 + _3896;
                        float _3906 = _3904 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _3908 = precise::max(_3906, _3900);
                        float _3910 = precise::min(0.0, _3908);
                        bool _3912 = _3910 != _3906;
                        bool _3914 = isnan(_3910);
                        bool _3916 = _3912 || _3914;
                        bool _3918 = isnan(_3906);
                        bool _3920 = _3916 || _3918;
                        bool _3922 = !_3920;
                        if (!_3922)
                        {
                            float _3924 = fma(_2386, 6.0, _1873);
                            float _3926 = fma(_2384, 6.0, _1877);
                            float3 _12172 = float3(_3926, _3924, float(int(_1896)));
                            float3 _12174 = select(_12172, float3(0.0), isnan(_12172));
                            float _3928 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12174.xy, uint(rint(_12174.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12174.xy, uint(rint(_12174.z))).x;
                            float _3930 = _1875 + _3836;
                            float _3932 = fma(_2388, 10.5, -1.0);
                            float _3934 = -_3930;
                            float _3936 = _3934 + _3928;
                            float _3938 = _3936 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _3940 = precise::max(_3938, _3932);
                            float _3942 = precise::min(0.0, _3940);
                            bool _3944 = _3942 != _3938;
                            bool _3946 = isnan(_3942);
                            bool _3948 = _3944 || _3946;
                            bool _3950 = isnan(_3938);
                            bool _3952 = _3948 || _3950;
                            _3954 = _3952;
                        }
                    }
                }
            }
        }
    }
    if (!_3954)
    {
        float _3956 = _3742 + 1.0;
        _3762 = _3956;
    }
    _3954 = false;
    float _3958 = _3762;
    float _3960 = _2394 * 1.5;
    float _3962 = precise::max(_2446, _3960);
    float _3964 = precise::min(0.0, _3962);
    bool _3966 = _3964 != _2446;
    bool _3968 = isnan(_3964);
    bool _3970 = _3966 || _3968;
    bool _3972 = isnan(_2446);
    bool _3974 = _3970 || _3972;
    bool _3976 = !_3974;
    float _3978 = _3958;
    if (!_3976)
    {
        float _3980 = _1873 + _2392;
        float _3982 = _1877 + _2390;
        float3 _12262 = float3(_3982, _3980, float(int(_1896)));
        float3 _12264 = select(_12262, float3(0.0), isnan(_12262));
        float _3984 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12264.xy, uint(rint(_12264.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12264.xy, uint(rint(_12264.z))).x;
        float _3986 = _1875 + _2394;
        float _3988 = _2394 * 3.0;
        float _3990 = -_3986;
        float _3992 = _3990 + _3984;
        float _3994 = _3992 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _3996 = precise::max(_3994, _3988);
        float _3998 = precise::min(0.0, _3996);
        bool _4000 = _3998 != _3994;
        bool _4002 = isnan(_3998);
        bool _4004 = _4000 || _4002;
        bool _4006 = isnan(_3994);
        bool _4008 = _4004 || _4006;
        bool _4010 = !_4008;
        if (!_4010)
        {
            float _4012 = fma(_2392, 2.0, _1873);
            float _4014 = fma(_2390, 2.0, _1877);
            float3 _12316 = float3(_4014, _4012, float(int(_1896)));
            float3 _12318 = select(_12316, float3(0.0), isnan(_12316));
            float _4016 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12318.xy, uint(rint(_12318.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12318.xy, uint(rint(_12318.z))).x;
            float _4018 = fma(_2394, 2.0, _1875);
            float _4020 = _2394 * 4.5;
            float _4022 = -_4018;
            float _4024 = _4022 + _4016;
            float _4026 = _4024 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _4028 = precise::max(_4026, _4020);
            float _4030 = precise::min(0.0, _4028);
            bool _4032 = _4030 != _4026;
            bool _4034 = isnan(_4030);
            bool _4036 = _4032 || _4034;
            bool _4038 = isnan(_4026);
            bool _4040 = _4036 || _4038;
            bool _4042 = !_4040;
            if (!_4042)
            {
                float _4044 = fma(_2392, 3.0, _1873);
                float _4046 = fma(_2390, 3.0, _1877);
                float3 _12370 = float3(_4046, _4044, float(int(_1896)));
                float3 _12372 = select(_12370, float3(0.0), isnan(_12370));
                float _4048 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12372.xy, uint(rint(_12372.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12372.xy, uint(rint(_12372.z))).x;
                float _4050 = _1875 + _3988;
                float _4052 = _2394 * 6.0;
                float _4054 = -_4050;
                float _4056 = _4054 + _4048;
                float _4058 = _4056 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _4060 = precise::max(_4058, _4052);
                float _4062 = precise::min(0.0, _4060);
                bool _4064 = _4062 != _4058;
                bool _4066 = isnan(_4062);
                bool _4068 = _4064 || _4066;
                bool _4070 = isnan(_4058);
                bool _4072 = _4068 || _4070;
                bool _4074 = !_4072;
                if (!_4074)
                {
                    float _4076 = fma(_2392, 4.0, _1873);
                    float _4078 = fma(_2390, 4.0, _1877);
                    float3 _12424 = float3(_4078, _4076, float(int(_1896)));
                    float3 _12426 = select(_12424, float3(0.0), isnan(_12424));
                    float _4080 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12426.xy, uint(rint(_12426.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12426.xy, uint(rint(_12426.z))).x;
                    float _4082 = fma(_2394, 4.0, _1875);
                    float _4084 = _2394 * 7.5;
                    float _4086 = -_4082;
                    float _4088 = _4086 + _4080;
                    float _4090 = _4088 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _4092 = precise::max(_4090, _4084);
                    float _4094 = precise::min(0.0, _4092);
                    bool _4096 = _4094 != _4090;
                    bool _4098 = isnan(_4094);
                    bool _4100 = _4096 || _4098;
                    bool _4102 = isnan(_4090);
                    bool _4104 = _4100 || _4102;
                    bool _4106 = !_4104;
                    if (!_4106)
                    {
                        float _4108 = fma(_2392, 5.0, _1873);
                        float _4110 = fma(_2390, 5.0, _1877);
                        float3 _12478 = float3(_4110, _4108, float(int(_1896)));
                        float3 _12480 = select(_12478, float3(0.0), isnan(_12478));
                        float _4112 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12480.xy, uint(rint(_12480.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12480.xy, uint(rint(_12480.z))).x;
                        float _4114 = fma(_2394, 5.0, _1875);
                        float _4116 = fma(_2394, 9.0, -1.0);
                        float _4118 = -_4114;
                        float _4120 = _4118 + _4112;
                        float _4122 = _4120 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _4124 = precise::max(_4122, _4116);
                        float _4126 = precise::min(0.0, _4124);
                        bool _4128 = _4126 != _4122;
                        bool _4130 = isnan(_4126);
                        bool _4132 = _4128 || _4130;
                        bool _4134 = isnan(_4122);
                        bool _4136 = _4132 || _4134;
                        bool _4138 = !_4136;
                        if (!_4138)
                        {
                            float _4140 = fma(_2392, 6.0, _1873);
                            float _4142 = fma(_2390, 6.0, _1877);
                            float3 _12532 = float3(_4142, _4140, float(int(_1896)));
                            float3 _12534 = select(_12532, float3(0.0), isnan(_12532));
                            float _4144 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12534.xy, uint(rint(_12534.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12534.xy, uint(rint(_12534.z))).x;
                            float _4146 = _1875 + _4052;
                            float _4148 = -_4146;
                            float _4150 = _4148 + _4144;
                            float _4152 = fma(_2394, 10.5, -1.0);
                            float _4154 = _4150 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _4156 = precise::max(_4154, _4152);
                            float _4158 = precise::min(0.0, _4156);
                            bool _4160 = _4158 != _4154;
                            bool _4162 = isnan(_4158);
                            bool _4164 = _4160 || _4162;
                            bool _4166 = isnan(_4154);
                            bool _4168 = _4164 || _4166;
                            _4170 = _4168;
                        }
                    }
                }
            }
        }
    }
    if (!_4170)
    {
        float _4172 = _3958 + 1.0;
        _3978 = _4172;
    }
    _4170 = false;
    float _4174 = _3978;
    float _4176 = _2400 * 1.5;
    float _4178 = precise::max(_2446, _4176);
    float _4180 = precise::min(0.0, _4178);
    bool _4182 = _4180 != _2446;
    bool _4184 = isnan(_4180);
    bool _4186 = _4182 || _4184;
    bool _4188 = isnan(_2446);
    bool _4190 = _4186 || _4188;
    bool _4192 = !_4190;
    float _4194 = _4174;
    if (!_4192)
    {
        float _4196 = _1873 + _2398;
        float _4198 = _1877 + _2396;
        float3 _12622 = float3(_4198, _4196, float(int(_1896)));
        float3 _12624 = select(_12622, float3(0.0), isnan(_12622));
        float _4200 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12624.xy, uint(rint(_12624.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12624.xy, uint(rint(_12624.z))).x;
        float _4202 = _1875 + _2400;
        float _4204 = _2400 * 3.0;
        float _4206 = -_4202;
        float _4208 = _4206 + _4200;
        float _4210 = _4208 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _4212 = precise::max(_4210, _4204);
        float _4214 = precise::min(0.0, _4212);
        bool _4216 = _4214 != _4210;
        bool _4218 = isnan(_4214);
        bool _4220 = _4216 || _4218;
        bool _4222 = isnan(_4210);
        bool _4224 = _4220 || _4222;
        bool _4226 = !_4224;
        if (!_4226)
        {
            float _4228 = fma(_2398, 2.0, _1873);
            float _4230 = fma(_2396, 2.0, _1877);
            float3 _12676 = float3(_4230, _4228, float(int(_1896)));
            float3 _12678 = select(_12676, float3(0.0), isnan(_12676));
            float _4232 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12678.xy, uint(rint(_12678.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12678.xy, uint(rint(_12678.z))).x;
            float _4234 = fma(_2400, 2.0, _1875);
            float _4236 = _2400 * 4.5;
            float _4238 = -_4234;
            float _4240 = _4238 + _4232;
            float _4242 = _4240 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _4244 = precise::max(_4242, _4236);
            float _4246 = precise::min(0.0, _4244);
            bool _4248 = _4246 != _4242;
            bool _4250 = isnan(_4246);
            bool _4252 = _4248 || _4250;
            bool _4254 = isnan(_4242);
            bool _4256 = _4252 || _4254;
            bool _4258 = !_4256;
            if (!_4258)
            {
                float _4260 = fma(_2398, 3.0, _1873);
                float _4262 = fma(_2396, 3.0, _1877);
                float3 _12730 = float3(_4262, _4260, float(int(_1896)));
                float3 _12732 = select(_12730, float3(0.0), isnan(_12730));
                float _4264 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12732.xy, uint(rint(_12732.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12732.xy, uint(rint(_12732.z))).x;
                float _4266 = _1875 + _4204;
                float _4268 = _2400 * 6.0;
                float _4270 = -_4266;
                float _4272 = _4270 + _4264;
                float _4274 = _4272 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _4276 = precise::max(_4274, _4268);
                float _4278 = precise::min(0.0, _4276);
                bool _4280 = _4278 != _4274;
                bool _4282 = isnan(_4278);
                bool _4284 = _4280 || _4282;
                bool _4286 = isnan(_4274);
                bool _4288 = _4284 || _4286;
                bool _4290 = !_4288;
                if (!_4290)
                {
                    float _4292 = fma(_2398, 4.0, _1873);
                    float _4294 = fma(_2396, 4.0, _1877);
                    float3 _12784 = float3(_4294, _4292, float(int(_1896)));
                    float3 _12786 = select(_12784, float3(0.0), isnan(_12784));
                    float _4296 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12786.xy, uint(rint(_12786.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12786.xy, uint(rint(_12786.z))).x;
                    float _4298 = fma(_2400, 4.0, _1875);
                    float _4300 = _2400 * 7.5;
                    float _4302 = -_4298;
                    float _4304 = _4302 + _4296;
                    float _4306 = _4304 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _4308 = precise::max(_4306, _4300);
                    float _4310 = precise::min(0.0, _4308);
                    bool _4312 = _4310 != _4306;
                    bool _4314 = isnan(_4310);
                    bool _4316 = _4312 || _4314;
                    bool _4318 = isnan(_4306);
                    bool _4320 = _4316 || _4318;
                    bool _4322 = !_4320;
                    if (!_4322)
                    {
                        float _4324 = fma(_2398, 5.0, _1873);
                        float _4326 = fma(_2396, 5.0, _1877);
                        float3 _12838 = float3(_4326, _4324, float(int(_1896)));
                        float3 _12840 = select(_12838, float3(0.0), isnan(_12838));
                        float _4328 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12840.xy, uint(rint(_12840.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12840.xy, uint(rint(_12840.z))).x;
                        float _4330 = fma(_2400, 5.0, _1875);
                        float _4332 = fma(_2400, 9.0, -1.0);
                        float _4334 = -_4330;
                        float _4336 = _4334 + _4328;
                        float _4338 = _4336 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _4340 = precise::max(_4338, _4332);
                        float _4342 = precise::min(0.0, _4340);
                        bool _4344 = _4342 != _4338;
                        bool _4346 = isnan(_4342);
                        bool _4348 = _4344 || _4346;
                        bool _4350 = isnan(_4338);
                        bool _4352 = _4348 || _4350;
                        bool _4354 = !_4352;
                        if (!_4354)
                        {
                            float _4356 = fma(_2398, 6.0, _1873);
                            float _4358 = fma(_2396, 6.0, _1877);
                            float3 _12892 = float3(_4358, _4356, float(int(_1896)));
                            float3 _12894 = select(_12892, float3(0.0), isnan(_12892));
                            float _4360 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12894.xy, uint(rint(_12894.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12894.xy, uint(rint(_12894.z))).x;
                            float _4362 = _1875 + _4268;
                            float _4364 = fma(_2400, 10.5, -1.0);
                            float _4366 = -_4362;
                            float _4368 = _4366 + _4360;
                            float _4370 = _4368 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _4372 = precise::max(_4370, _4364);
                            float _4374 = precise::min(0.0, _4372);
                            bool _4376 = _4374 != _4370;
                            bool _4378 = isnan(_4374);
                            bool _4380 = _4376 || _4378;
                            bool _4382 = isnan(_4370);
                            bool _4384 = _4380 || _4382;
                            _4386 = _4384;
                        }
                    }
                }
            }
        }
    }
    if (!_4386)
    {
        float _4388 = _4174 + 1.0;
        _4194 = _4388;
    }
    _4386 = false;
    float _4390 = _4194;
    float _4392 = _2406 * 1.5;
    float _4394 = precise::max(_2446, _4392);
    float _4396 = precise::min(0.0, _4394);
    bool _4398 = _4396 != _2446;
    bool _4400 = isnan(_4396);
    bool _4402 = _4398 || _4400;
    bool _4404 = isnan(_2446);
    bool _4406 = _4402 || _4404;
    bool _4408 = !_4406;
    float _4410 = _4390;
    if (!_4408)
    {
        float _4412 = _1873 + _2404;
        float _4414 = _1877 + _2402;
        float3 _12982 = float3(_4414, _4412, float(int(_1896)));
        float3 _12984 = select(_12982, float3(0.0), isnan(_12982));
        float _4416 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12984.xy, uint(rint(_12984.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12984.xy, uint(rint(_12984.z))).x;
        float _4418 = _1875 + _2406;
        float _4420 = _2406 * 3.0;
        float _4422 = -_4418;
        float _4424 = _4422 + _4416;
        float _4426 = _4424 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _4428 = precise::max(_4426, _4420);
        float _4430 = precise::min(0.0, _4428);
        bool _4432 = _4430 != _4426;
        bool _4434 = isnan(_4430);
        bool _4436 = _4432 || _4434;
        bool _4438 = isnan(_4426);
        bool _4440 = _4436 || _4438;
        bool _4442 = !_4440;
        if (!_4442)
        {
            float _4444 = fma(_2404, 2.0, _1873);
            float _4446 = fma(_2402, 2.0, _1877);
            float3 _13036 = float3(_4446, _4444, float(int(_1896)));
            float3 _13038 = select(_13036, float3(0.0), isnan(_13036));
            float _4448 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13038.xy, uint(rint(_13038.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13038.xy, uint(rint(_13038.z))).x;
            float _4450 = fma(_2406, 2.0, _1875);
            float _4452 = _2406 * 4.5;
            float _4454 = -_4450;
            float _4456 = _4454 + _4448;
            float _4458 = _4456 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _4460 = precise::max(_4458, _4452);
            float _4462 = precise::min(0.0, _4460);
            bool _4464 = _4462 != _4458;
            bool _4466 = isnan(_4462);
            bool _4468 = _4464 || _4466;
            bool _4470 = isnan(_4458);
            bool _4472 = _4468 || _4470;
            bool _4474 = !_4472;
            if (!_4474)
            {
                float _4476 = fma(_2404, 3.0, _1873);
                float _4478 = fma(_2402, 3.0, _1877);
                float3 _13090 = float3(_4478, _4476, float(int(_1896)));
                float3 _13092 = select(_13090, float3(0.0), isnan(_13090));
                float _4480 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13092.xy, uint(rint(_13092.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13092.xy, uint(rint(_13092.z))).x;
                float _4482 = _1875 + _4420;
                float _4484 = _2406 * 6.0;
                float _4486 = -_4482;
                float _4488 = _4486 + _4480;
                float _4490 = _4488 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _4492 = precise::max(_4490, _4484);
                float _4494 = precise::min(0.0, _4492);
                bool _4496 = _4494 != _4490;
                bool _4498 = isnan(_4494);
                bool _4500 = _4496 || _4498;
                bool _4502 = isnan(_4490);
                bool _4504 = _4500 || _4502;
                bool _4506 = !_4504;
                if (!_4506)
                {
                    float _4508 = fma(_2404, 4.0, _1873);
                    float _4510 = fma(_2402, 4.0, _1877);
                    float3 _13144 = float3(_4510, _4508, float(int(_1896)));
                    float3 _13146 = select(_13144, float3(0.0), isnan(_13144));
                    float _4512 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13146.xy, uint(rint(_13146.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13146.xy, uint(rint(_13146.z))).x;
                    float _4514 = fma(_2406, 4.0, _1875);
                    float _4516 = _2406 * 7.5;
                    float _4518 = -_4514;
                    float _4520 = _4518 + _4512;
                    float _4522 = _4520 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _4524 = precise::max(_4522, _4516);
                    float _4526 = precise::min(0.0, _4524);
                    bool _4528 = _4526 != _4522;
                    bool _4530 = isnan(_4526);
                    bool _4532 = _4528 || _4530;
                    bool _4534 = isnan(_4522);
                    bool _4536 = _4532 || _4534;
                    bool _4538 = !_4536;
                    if (!_4538)
                    {
                        float _4540 = fma(_2404, 5.0, _1873);
                        float _4542 = fma(_2402, 5.0, _1877);
                        float3 _13198 = float3(_4542, _4540, float(int(_1896)));
                        float3 _13200 = select(_13198, float3(0.0), isnan(_13198));
                        float _4544 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13200.xy, uint(rint(_13200.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13200.xy, uint(rint(_13200.z))).x;
                        float _4546 = fma(_2406, 5.0, _1875);
                        float _4548 = fma(_2406, 9.0, -1.0);
                        float _4550 = -_4546;
                        float _4552 = _4550 + _4544;
                        float _4554 = _4552 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _4556 = precise::max(_4554, _4548);
                        float _4558 = precise::min(0.0, _4556);
                        bool _4560 = _4558 != _4554;
                        bool _4562 = isnan(_4558);
                        bool _4564 = _4560 || _4562;
                        bool _4566 = isnan(_4554);
                        bool _4568 = _4564 || _4566;
                        bool _4570 = !_4568;
                        if (!_4570)
                        {
                            float _4572 = fma(_2404, 6.0, _1873);
                            float _4574 = fma(_2402, 6.0, _1877);
                            float3 _13252 = float3(_4574, _4572, float(int(_1896)));
                            float3 _13254 = select(_13252, float3(0.0), isnan(_13252));
                            float _4576 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13254.xy, uint(rint(_13254.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13254.xy, uint(rint(_13254.z))).x;
                            float _4578 = _1875 + _4484;
                            float _4580 = -_4578;
                            float _4582 = _4580 + _4576;
                            float _4584 = fma(_2406, 10.5, -1.0);
                            float _4586 = _4582 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _4588 = precise::max(_4586, _4584);
                            float _4590 = precise::min(0.0, _4588);
                            bool _4592 = _4590 != _4586;
                            bool _4594 = isnan(_4590);
                            bool _4596 = _4592 || _4594;
                            bool _4598 = isnan(_4586);
                            bool _4600 = _4596 || _4598;
                            _4602 = _4600;
                        }
                    }
                }
            }
        }
    }
    if (!_4602)
    {
        float _4604 = _4390 + 1.0;
        _4410 = _4604;
    }
    _4602 = false;
    float _4606 = _4410;
    float _4608 = _2412 * 1.5;
    float _4610 = precise::max(_2446, _4608);
    float _4612 = precise::min(0.0, _4610);
    bool _4614 = _4612 != _2446;
    bool _4616 = isnan(_4612);
    bool _4618 = _4614 || _4616;
    bool _4620 = isnan(_2446);
    bool _4622 = _4618 || _4620;
    bool _4624 = !_4622;
    float _4626 = _4606;
    if (!_4624)
    {
        float _4628 = _1873 + _2410;
        float _4630 = _1877 + _2408;
        float3 _13342 = float3(_4630, _4628, float(int(_1896)));
        float3 _13344 = select(_13342, float3(0.0), isnan(_13342));
        float _4632 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13344.xy, uint(rint(_13344.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13344.xy, uint(rint(_13344.z))).x;
        float _4634 = _1875 + _2412;
        float _4636 = _2412 * 3.0;
        float _4638 = -_4634;
        float _4640 = _4638 + _4632;
        float _4642 = _4640 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _4644 = precise::max(_4642, _4636);
        float _4646 = precise::min(0.0, _4644);
        bool _4648 = _4646 != _4642;
        bool _4650 = isnan(_4646);
        bool _4652 = _4648 || _4650;
        bool _4654 = isnan(_4642);
        bool _4656 = _4652 || _4654;
        bool _4658 = !_4656;
        if (!_4658)
        {
            float _4660 = fma(_2410, 2.0, _1873);
            float _4662 = fma(_2408, 2.0, _1877);
            float3 _13396 = float3(_4662, _4660, float(int(_1896)));
            float3 _13398 = select(_13396, float3(0.0), isnan(_13396));
            float _4664 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13398.xy, uint(rint(_13398.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13398.xy, uint(rint(_13398.z))).x;
            float _4666 = fma(_2412, 2.0, _1875);
            float _4668 = _2412 * 4.5;
            float _4670 = -_4666;
            float _4672 = _4670 + _4664;
            float _4674 = _4672 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _4676 = precise::max(_4674, _4668);
            float _4678 = precise::min(0.0, _4676);
            bool _4680 = _4678 != _4674;
            bool _4682 = isnan(_4678);
            bool _4684 = _4680 || _4682;
            bool _4686 = isnan(_4674);
            bool _4688 = _4684 || _4686;
            bool _4690 = !_4688;
            if (!_4690)
            {
                float _4692 = fma(_2410, 3.0, _1873);
                float _4694 = fma(_2408, 3.0, _1877);
                float3 _13450 = float3(_4694, _4692, float(int(_1896)));
                float3 _13452 = select(_13450, float3(0.0), isnan(_13450));
                float _4696 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13452.xy, uint(rint(_13452.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13452.xy, uint(rint(_13452.z))).x;
                float _4698 = _1875 + _4636;
                float _4700 = _2412 * 6.0;
                float _4702 = -_4698;
                float _4704 = _4702 + _4696;
                float _4706 = _4704 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _4708 = precise::max(_4706, _4700);
                float _4710 = precise::min(0.0, _4708);
                bool _4712 = _4710 != _4706;
                bool _4714 = isnan(_4710);
                bool _4716 = _4712 || _4714;
                bool _4718 = isnan(_4706);
                bool _4720 = _4716 || _4718;
                bool _4722 = !_4720;
                if (!_4722)
                {
                    float _4724 = fma(_2410, 4.0, _1873);
                    float _4726 = fma(_2408, 4.0, _1877);
                    float3 _13504 = float3(_4726, _4724, float(int(_1896)));
                    float3 _13506 = select(_13504, float3(0.0), isnan(_13504));
                    float _4728 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13506.xy, uint(rint(_13506.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13506.xy, uint(rint(_13506.z))).x;
                    float _4730 = fma(_2412, 4.0, _1875);
                    float _4732 = _2412 * 7.5;
                    float _4734 = -_4730;
                    float _4736 = _4734 + _4728;
                    float _4738 = _4736 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _4740 = precise::max(_4738, _4732);
                    float _4742 = precise::min(0.0, _4740);
                    bool _4744 = _4742 != _4738;
                    bool _4746 = isnan(_4742);
                    bool _4748 = _4744 || _4746;
                    bool _4750 = isnan(_4738);
                    bool _4752 = _4748 || _4750;
                    bool _4754 = !_4752;
                    if (!_4754)
                    {
                        float _4756 = fma(_2410, 5.0, _1873);
                        float _4758 = fma(_2408, 5.0, _1877);
                        float3 _13558 = float3(_4758, _4756, float(int(_1896)));
                        float3 _13560 = select(_13558, float3(0.0), isnan(_13558));
                        float _4760 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13560.xy, uint(rint(_13560.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13560.xy, uint(rint(_13560.z))).x;
                        float _4762 = fma(_2412, 5.0, _1875);
                        float _4764 = fma(_2412, 9.0, -1.0);
                        float _4766 = -_4762;
                        float _4768 = _4766 + _4760;
                        float _4770 = _4768 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _4772 = precise::max(_4770, _4764);
                        float _4774 = precise::min(0.0, _4772);
                        bool _4776 = _4774 != _4770;
                        bool _4778 = isnan(_4774);
                        bool _4780 = _4776 || _4778;
                        bool _4782 = isnan(_4770);
                        bool _4784 = _4780 || _4782;
                        bool _4786 = !_4784;
                        if (!_4786)
                        {
                            float _4788 = fma(_2410, 6.0, _1873);
                            float _4790 = fma(_2408, 6.0, _1877);
                            float3 _13612 = float3(_4790, _4788, float(int(_1896)));
                            float3 _13614 = select(_13612, float3(0.0), isnan(_13612));
                            float _4792 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13614.xy, uint(rint(_13614.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13614.xy, uint(rint(_13614.z))).x;
                            float _4794 = _1875 + _4700;
                            float _4796 = fma(_2412, 10.5, -1.0);
                            float _4798 = -_4794;
                            float _4800 = _4798 + _4792;
                            float _4802 = _4800 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _4804 = precise::max(_4802, _4796);
                            float _4806 = precise::min(0.0, _4804);
                            bool _4808 = _4806 != _4802;
                            bool _4810 = isnan(_4806);
                            bool _4812 = _4808 || _4810;
                            bool _4814 = isnan(_4802);
                            bool _4816 = _4812 || _4814;
                            _4818 = _4816;
                        }
                    }
                }
            }
        }
    }
    if (!_4818)
    {
        float _4820 = _4606 + 1.0;
        _4626 = _4820;
    }
    _4818 = false;
    float _4822 = _4626;
    float _4824 = _2418 * 1.5;
    float _4826 = precise::max(_2446, _4824);
    float _4828 = precise::min(0.0, _4826);
    bool _4830 = _4828 != _2446;
    bool _4832 = isnan(_4828);
    bool _4834 = _4830 || _4832;
    bool _4836 = isnan(_2446);
    bool _4838 = _4834 || _4836;
    bool _4840 = !_4838;
    float _4842 = _4822;
    if (!_4840)
    {
        float _4844 = _1873 + _2416;
        float _4846 = _1877 + _2414;
        float3 _13702 = float3(_4846, _4844, float(int(_1896)));
        float3 _13704 = select(_13702, float3(0.0), isnan(_13702));
        float _4848 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13704.xy, uint(rint(_13704.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13704.xy, uint(rint(_13704.z))).x;
        float _4850 = _1875 + _2418;
        float _4852 = _2418 * 3.0;
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
            float _4876 = fma(_2416, 2.0, _1873);
            float _4878 = fma(_2414, 2.0, _1877);
            float3 _13756 = float3(_4878, _4876, float(int(_1896)));
            float3 _13758 = select(_13756, float3(0.0), isnan(_13756));
            float _4880 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13758.xy, uint(rint(_13758.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13758.xy, uint(rint(_13758.z))).x;
            float _4882 = fma(_2418, 2.0, _1875);
            float _4884 = _2418 * 4.5;
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
                float _4908 = fma(_2416, 3.0, _1873);
                float _4910 = fma(_2414, 3.0, _1877);
                float3 _13810 = float3(_4910, _4908, float(int(_1896)));
                float3 _13812 = select(_13810, float3(0.0), isnan(_13810));
                float _4912 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13812.xy, uint(rint(_13812.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13812.xy, uint(rint(_13812.z))).x;
                float _4914 = _1875 + _4852;
                float _4916 = _2418 * 6.0;
                float _4918 = -_4914;
                float _4920 = _4918 + _4912;
                float _4922 = _4920 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _4924 = precise::max(_4922, _4916);
                float _4926 = precise::min(0.0, _4924);
                bool _4928 = _4926 != _4922;
                bool _4930 = isnan(_4926);
                bool _4932 = _4928 || _4930;
                bool _4934 = isnan(_4922);
                bool _4936 = _4932 || _4934;
                bool _4938 = !_4936;
                if (!_4938)
                {
                    float _4940 = fma(_2416, 4.0, _1873);
                    float _4942 = fma(_2414, 4.0, _1877);
                    float3 _13864 = float3(_4942, _4940, float(int(_1896)));
                    float3 _13866 = select(_13864, float3(0.0), isnan(_13864));
                    float _4944 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13866.xy, uint(rint(_13866.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13866.xy, uint(rint(_13866.z))).x;
                    float _4946 = fma(_2418, 4.0, _1875);
                    float _4948 = _2418 * 7.5;
                    float _4950 = -_4946;
                    float _4952 = _4950 + _4944;
                    float _4954 = _4952 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _4956 = precise::max(_4954, _4948);
                    float _4958 = precise::min(0.0, _4956);
                    bool _4960 = _4958 != _4954;
                    bool _4962 = isnan(_4958);
                    bool _4964 = _4960 || _4962;
                    bool _4966 = isnan(_4954);
                    bool _4968 = _4964 || _4966;
                    bool _4970 = !_4968;
                    if (!_4970)
                    {
                        float _4972 = fma(_2416, 5.0, _1873);
                        float _4974 = fma(_2414, 5.0, _1877);
                        float3 _13918 = float3(_4974, _4972, float(int(_1896)));
                        float3 _13920 = select(_13918, float3(0.0), isnan(_13918));
                        float _4976 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13920.xy, uint(rint(_13920.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13920.xy, uint(rint(_13920.z))).x;
                        float _4978 = fma(_2418, 5.0, _1875);
                        float _4980 = fma(_2418, 9.0, -1.0);
                        float _4982 = -_4978;
                        float _4984 = _4982 + _4976;
                        float _4986 = _4984 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _4988 = precise::max(_4986, _4980);
                        float _4990 = precise::min(0.0, _4988);
                        bool _4992 = _4990 != _4986;
                        bool _4994 = isnan(_4990);
                        bool _4996 = _4992 || _4994;
                        bool _4998 = isnan(_4986);
                        bool _5000 = _4996 || _4998;
                        bool _5002 = !_5000;
                        if (!_5002)
                        {
                            float _5004 = fma(_2416, 6.0, _1873);
                            float _5006 = fma(_2414, 6.0, _1877);
                            float3 _13972 = float3(_5006, _5004, float(int(_1896)));
                            float3 _13974 = select(_13972, float3(0.0), isnan(_13972));
                            float _5008 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13974.xy, uint(rint(_13974.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13974.xy, uint(rint(_13974.z))).x;
                            float _5010 = _1875 + _4916;
                            float _5012 = -_5010;
                            float _5014 = _5012 + _5008;
                            float _5016 = fma(_2418, 10.5, -1.0);
                            float _5018 = _5014 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _5020 = precise::max(_5018, _5016);
                            float _5022 = precise::min(0.0, _5020);
                            bool _5024 = _5022 != _5018;
                            bool _5026 = isnan(_5022);
                            bool _5028 = _5024 || _5026;
                            bool _5030 = isnan(_5018);
                            bool _5032 = _5028 || _5030;
                            _5034 = _5032;
                        }
                    }
                }
            }
        }
    }
    if (!_5034)
    {
        float _5036 = _4822 + 1.0;
        _4842 = _5036;
    }
    _5034 = false;
    float _5038 = _4842;
    float _5040 = _2424 * 1.5;
    float _5042 = precise::max(_2446, _5040);
    float _5044 = precise::min(0.0, _5042);
    bool _5046 = _5044 != _2446;
    bool _5048 = isnan(_5044);
    bool _5050 = _5046 || _5048;
    bool _5052 = isnan(_2446);
    bool _5054 = _5050 || _5052;
    bool _5056 = !_5054;
    float _5058 = _5038;
    if (!_5056)
    {
        float _5060 = _1873 + _2422;
        float _5062 = _1877 + _2420;
        float3 _14062 = float3(_5062, _5060, float(int(_1896)));
        float3 _14064 = select(_14062, float3(0.0), isnan(_14062));
        float _5064 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14064.xy, uint(rint(_14064.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14064.xy, uint(rint(_14064.z))).x;
        float _5066 = _1875 + _2424;
        float _5068 = _2424 * 3.0;
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
            float _5092 = fma(_2422, 2.0, _1873);
            float _5094 = fma(_2420, 2.0, _1877);
            float3 _14116 = float3(_5094, _5092, float(int(_1896)));
            float3 _14118 = select(_14116, float3(0.0), isnan(_14116));
            float _5096 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14118.xy, uint(rint(_14118.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14118.xy, uint(rint(_14118.z))).x;
            float _5098 = fma(_2424, 2.0, _1875);
            float _5100 = _2424 * 4.5;
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
                float _5124 = fma(_2422, 3.0, _1873);
                float _5126 = fma(_2420, 3.0, _1877);
                float3 _14170 = float3(_5126, _5124, float(int(_1896)));
                float3 _14172 = select(_14170, float3(0.0), isnan(_14170));
                float _5128 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14172.xy, uint(rint(_14172.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14172.xy, uint(rint(_14172.z))).x;
                float _5130 = _1875 + _5068;
                float _5132 = _2424 * 6.0;
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
                    float _5156 = fma(_2422, 4.0, _1873);
                    float _5158 = fma(_2420, 4.0, _1877);
                    float3 _14224 = float3(_5158, _5156, float(int(_1896)));
                    float3 _14226 = select(_14224, float3(0.0), isnan(_14224));
                    float _5160 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14226.xy, uint(rint(_14226.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14226.xy, uint(rint(_14226.z))).x;
                    float _5162 = fma(_2424, 4.0, _1875);
                    float _5164 = _2424 * 7.5;
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
                        float _5188 = fma(_2422, 5.0, _1873);
                        float _5190 = fma(_2420, 5.0, _1877);
                        float3 _14278 = float3(_5190, _5188, float(int(_1896)));
                        float3 _14280 = select(_14278, float3(0.0), isnan(_14278));
                        float _5192 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14280.xy, uint(rint(_14280.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14280.xy, uint(rint(_14280.z))).x;
                        float _5194 = fma(_2424, 5.0, _1875);
                        float _5196 = fma(_2424, 9.0, -1.0);
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
                            float _5220 = fma(_2422, 6.0, _1873);
                            float _5222 = fma(_2420, 6.0, _1877);
                            float3 _14332 = float3(_5222, _5220, float(int(_1896)));
                            float3 _14334 = select(_14332, float3(0.0), isnan(_14332));
                            float _5224 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14334.xy, uint(rint(_14334.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14334.xy, uint(rint(_14334.z))).x;
                            float _5226 = _1875 + _5132;
                            float _5228 = fma(_2424, 10.5, -1.0);
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
    if (!_5250)
    {
        float _5252 = _5038 + 1.0;
        _5058 = _5252;
    }
    _5250 = false;
    float _5254 = _5058;
    float _5256 = _2430 * 1.5;
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
        float _5276 = _1873 + _2428;
        float _5278 = _1877 + _2426;
        float3 _14422 = float3(_5278, _5276, float(int(_1896)));
        float3 _14424 = select(_14422, float3(0.0), isnan(_14422));
        float _5280 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14424.xy, uint(rint(_14424.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14424.xy, uint(rint(_14424.z))).x;
        float _5282 = _1875 + _2430;
        float _5284 = _2430 * 3.0;
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
            float _5308 = fma(_2428, 2.0, _1873);
            float _5310 = fma(_2426, 2.0, _1877);
            float3 _14476 = float3(_5310, _5308, float(int(_1896)));
            float3 _14478 = select(_14476, float3(0.0), isnan(_14476));
            float _5312 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14478.xy, uint(rint(_14478.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14478.xy, uint(rint(_14478.z))).x;
            float _5314 = fma(_2430, 2.0, _1875);
            float _5316 = _2430 * 4.5;
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
                float _5340 = fma(_2428, 3.0, _1873);
                float _5342 = fma(_2426, 3.0, _1877);
                float3 _14530 = float3(_5342, _5340, float(int(_1896)));
                float3 _14532 = select(_14530, float3(0.0), isnan(_14530));
                float _5344 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14532.xy, uint(rint(_14532.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14532.xy, uint(rint(_14532.z))).x;
                float _5346 = _1875 + _5284;
                float _5348 = _2430 * 6.0;
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
                    float _5372 = fma(_2428, 4.0, _1873);
                    float _5374 = fma(_2426, 4.0, _1877);
                    float3 _14584 = float3(_5374, _5372, float(int(_1896)));
                    float3 _14586 = select(_14584, float3(0.0), isnan(_14584));
                    float _5376 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14586.xy, uint(rint(_14586.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14586.xy, uint(rint(_14586.z))).x;
                    float _5378 = fma(_2430, 4.0, _1875);
                    float _5380 = _2430 * 7.5;
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
                        float _5404 = fma(_2428, 5.0, _1873);
                        float _5406 = fma(_2426, 5.0, _1877);
                        float3 _14638 = float3(_5406, _5404, float(int(_1896)));
                        float3 _14640 = select(_14638, float3(0.0), isnan(_14638));
                        float _5408 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14640.xy, uint(rint(_14640.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14640.xy, uint(rint(_14640.z))).x;
                        float _5410 = fma(_2430, 5.0, _1875);
                        float _5412 = fma(_2430, 9.0, -1.0);
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
                            float _5436 = fma(_2428, 6.0, _1873);
                            float _5438 = fma(_2426, 6.0, _1877);
                            float3 _14692 = float3(_5438, _5436, float(int(_1896)));
                            float3 _14694 = select(_14692, float3(0.0), isnan(_14692));
                            float _5440 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14694.xy, uint(rint(_14694.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14694.xy, uint(rint(_14694.z))).x;
                            float _5442 = _1875 + _5348;
                            float _5444 = -_5442;
                            float _5446 = _5444 + _5440;
                            float _5448 = fma(_2430, 10.5, -1.0);
                            float _5450 = _5446 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _5452 = precise::max(_5450, _5448);
                            float _5454 = precise::min(0.0, _5452);
                            bool _5456 = _5454 != _5450;
                            bool _5458 = isnan(_5454);
                            bool _5460 = _5456 || _5458;
                            bool _5462 = isnan(_5450);
                            bool _5464 = _5460 || _5462;
                            _5466 = _5464;
                        }
                    }
                }
            }
        }
    }
    if (!_5466)
    {
        float _5468 = _5254 + 1.0;
        _5274 = _5468;
    }
    _5466 = false;
    float _5470 = _5274;
    float _5472 = _2436 * 1.5;
    float _5474 = precise::max(_2446, _5472);
    float _5476 = precise::min(0.0, _5474);
    bool _5478 = _5476 != _2446;
    bool _5480 = isnan(_5476);
    bool _5482 = _5478 || _5480;
    bool _5484 = isnan(_2446);
    bool _5486 = _5482 || _5484;
    bool _5488 = !_5486;
    float _5684;
    if (!_5488)
    {
        float _5490 = _1873 + _2434;
        float _5492 = _1877 + _2432;
        float3 _14781 = float3(_5492, _5490, float(int(_1896)));
        float3 _14783 = select(_14781, float3(0.0), isnan(_14781));
        float _5494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14783.xy, uint(rint(_14783.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14783.xy, uint(rint(_14783.z))).x;
        float _5496 = _1875 + _2436;
        float _5498 = _2436 * 3.0;
        float _5500 = -_5496;
        float _5502 = _5500 + _5494;
        float _5504 = _5502 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _5506 = precise::max(_5504, _5498);
        float _5508 = precise::min(0.0, _5506);
        bool _5510 = _5508 != _5504;
        bool _5512 = isnan(_5508);
        bool _5514 = _5510 || _5512;
        bool _5516 = isnan(_5504);
        bool _5518 = _5514 || _5516;
        bool _5520 = !_5518;
        if (!_5520)
        {
            float _5522 = fma(_2434, 2.0, _1873);
            float _5524 = fma(_2432, 2.0, _1877);
            float3 _14835 = float3(_5524, _5522, float(int(_1896)));
            float3 _14837 = select(_14835, float3(0.0), isnan(_14835));
            float _5526 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14837.xy, uint(rint(_14837.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14837.xy, uint(rint(_14837.z))).x;
            float _5528 = fma(_2436, 2.0, _1875);
            float _5530 = _2436 * 4.5;
            float _5532 = -_5528;
            float _5534 = _5532 + _5526;
            float _5536 = _5534 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _5538 = precise::max(_5536, _5530);
            float _5540 = precise::min(0.0, _5538);
            bool _5542 = _5540 != _5536;
            bool _5544 = isnan(_5540);
            bool _5546 = _5542 || _5544;
            bool _5548 = isnan(_5536);
            bool _5550 = _5546 || _5548;
            bool _5552 = !_5550;
            if (!_5552)
            {
                float _5554 = fma(_2434, 3.0, _1873);
                float _5556 = fma(_2432, 3.0, _1877);
                float3 _14889 = float3(_5556, _5554, float(int(_1896)));
                float3 _14891 = select(_14889, float3(0.0), isnan(_14889));
                float _5558 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14891.xy, uint(rint(_14891.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14891.xy, uint(rint(_14891.z))).x;
                float _5560 = _1875 + _5498;
                float _5562 = _2436 * 6.0;
                float _5564 = -_5560;
                float _5566 = _5564 + _5558;
                float _5568 = _5566 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _5570 = precise::max(_5568, _5562);
                float _5572 = precise::min(0.0, _5570);
                bool _5574 = _5572 != _5568;
                bool _5576 = isnan(_5572);
                bool _5578 = _5574 || _5576;
                bool _5580 = isnan(_5568);
                bool _5582 = _5578 || _5580;
                bool _5584 = !_5582;
                if (!_5584)
                {
                    float _5586 = fma(_2434, 4.0, _1873);
                    float _5588 = fma(_2432, 4.0, _1877);
                    float3 _14943 = float3(_5588, _5586, float(int(_1896)));
                    float3 _14945 = select(_14943, float3(0.0), isnan(_14943));
                    float _5590 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14945.xy, uint(rint(_14945.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14945.xy, uint(rint(_14945.z))).x;
                    float _5592 = fma(_2436, 4.0, _1875);
                    float _5594 = _2436 * 7.5;
                    float _5596 = -_5592;
                    float _5598 = _5596 + _5590;
                    float _5600 = _5598 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _5602 = precise::max(_5600, _5594);
                    float _5604 = precise::min(0.0, _5602);
                    bool _5606 = _5604 != _5600;
                    bool _5608 = isnan(_5604);
                    bool _5610 = _5606 || _5608;
                    bool _5612 = isnan(_5600);
                    bool _5614 = _5610 || _5612;
                    bool _5616 = !_5614;
                    if (!_5616)
                    {
                        float _5618 = fma(_2434, 5.0, _1873);
                        float _5620 = fma(_2432, 5.0, _1877);
                        float3 _14997 = float3(_5620, _5618, float(int(_1896)));
                        float3 _14999 = select(_14997, float3(0.0), isnan(_14997));
                        float _5622 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14999.xy, uint(rint(_14999.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14999.xy, uint(rint(_14999.z))).x;
                        float _5624 = fma(_2436, 5.0, _1875);
                        float _5626 = fma(_2436, 9.0, -1.0);
                        float _5628 = -_5624;
                        float _5630 = _5628 + _5622;
                        float _5632 = _5630 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _5634 = precise::max(_5632, _5626);
                        float _5636 = precise::min(0.0, _5634);
                        bool _5638 = _5636 != _5632;
                        bool _5640 = isnan(_5636);
                        bool _5642 = _5638 || _5640;
                        bool _5644 = isnan(_5632);
                        bool _5646 = _5642 || _5644;
                        bool _5648 = !_5646;
                        if (!_5648)
                        {
                            float _5650 = fma(_2434, 6.0, _1873);
                            float _5652 = fma(_2432, 6.0, _1877);
                            float3 _15051 = float3(_5652, _5650, float(int(_1896)));
                            float3 _15053 = select(_15051, float3(0.0), isnan(_15051));
                            float _5654 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15053.xy, uint(rint(_15053.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15053.xy, uint(rint(_15053.z))).x;
                            float _5656 = _1875 + _5562;
                            float _5658 = fma(_2436, 10.5, -1.0);
                            float _5660 = -_5656;
                            float _5662 = _5660 + _5654;
                            float _5664 = _5662 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _5666 = precise::max(_5664, _5658);
                            float _5668 = precise::min(0.0, _5666);
                            bool _5670 = _5668 != _5664;
                            bool _5672 = isnan(_5668);
                            bool _5674 = _5670 || _5672;
                            bool _5676 = isnan(_5664);
                            bool _5678 = _5674 || _5676;
                            float _5680 = _5668;
                            if (_5678)
                            {
                                _5680 = _5470;
                            }
                            float _5682 = _5680;
                            _5684 = _5682;
                            _5686 = _5678;
                        }
                    }
                }
            }
        }
    }
    if (!_5686)
    {
        float _5688 = _5470 + 1.0;
        _5684 = _5688;
    }
    _5686 = false;
    float _5690 = _5684;
    float _5692 = _2440 * 1.5;
    float _5694 = precise::max(_2446, _5692);
    float _5696 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _5698 = 1.0 + _5696;
    float _5700 = precise::min(0.0, _5694);
    bool _5702 = _5700 != _2446;
    bool _5704 = isnan(_5700);
    bool _5706 = _5702 || _5704;
    bool _5708 = isnan(_2446);
    bool _5710 = _5706 || _5708;
    float _5712 = fma(_5698, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _5714 = _5712 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _5716 = !_5710;
    float _5718 = _5690;
    if (!_5716)
    {
        float _5720 = _1873 + _2094;
        float _5722 = _1877 + _2438;
        float3 _15163 = float3(_5722, _5720, float(int(_1896)));
        float3 _15165 = select(_15163, float3(0.0), isnan(_15163));
        float _5724 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15165.xy, uint(rint(_15165.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15165.xy, uint(rint(_15165.z))).x;
        float _5726 = _1875 + _2440;
        float _5728 = _2440 * 3.0;
        float _5730 = -_5726;
        float _5732 = _5730 + _5724;
        float _5734 = _5732 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _5736 = precise::max(_5734, _5728);
        float _5738 = precise::min(0.0, _5736);
        bool _5740 = _5738 != _5734;
        bool _5742 = isnan(_5738);
        bool _5744 = _5740 || _5742;
        bool _5746 = isnan(_5734);
        bool _5748 = _5744 || _5746;
        bool _5750 = !_5748;
        if (!_5750)
        {
            float _5752 = fma(_2094, 2.0, _1873);
            float _5754 = fma(_2438, 2.0, _1877);
            float3 _15217 = float3(_5754, _5752, float(int(_1896)));
            float3 _15219 = select(_15217, float3(0.0), isnan(_15217));
            float _5756 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15219.xy, uint(rint(_15219.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15219.xy, uint(rint(_15219.z))).x;
            float _5758 = fma(_2440, 2.0, _1875);
            float _5760 = _2440 * 4.5;
            float _5762 = -_5758;
            float _5764 = _5762 + _5756;
            float _5766 = _5764 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _5768 = precise::max(_5766, _5760);
            float _5770 = precise::min(0.0, _5768);
            bool _5772 = _5770 != _5766;
            bool _5774 = isnan(_5770);
            bool _5776 = _5772 || _5774;
            bool _5778 = isnan(_5766);
            bool _5780 = _5776 || _5778;
            bool _5782 = !_5780;
            if (!_5782)
            {
                float _5784 = fma(_2094, 3.0, _1873);
                float _5786 = fma(_2438, 3.0, _1877);
                float3 _15271 = float3(_5786, _5784, float(int(_1896)));
                float3 _15273 = select(_15271, float3(0.0), isnan(_15271));
                float _5788 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15273.xy, uint(rint(_15273.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15273.xy, uint(rint(_15273.z))).x;
                float _5790 = _1875 + _5728;
                float _5792 = _2440 * 6.0;
                float _5794 = -_5790;
                float _5796 = _5794 + _5788;
                float _5798 = _5796 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _5800 = precise::max(_5798, _5792);
                float _5802 = precise::min(0.0, _5800);
                bool _5804 = _5802 != _5798;
                bool _5806 = isnan(_5802);
                bool _5808 = _5804 || _5806;
                bool _5810 = isnan(_5798);
                bool _5812 = _5808 || _5810;
                bool _5814 = !_5812;
                if (!_5814)
                {
                    float _5816 = fma(_2094, 4.0, _1873);
                    float _5818 = fma(_2438, 4.0, _1877);
                    float3 _15325 = float3(_5818, _5816, float(int(_1896)));
                    float3 _15327 = select(_15325, float3(0.0), isnan(_15325));
                    float _5820 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15327.xy, uint(rint(_15327.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15327.xy, uint(rint(_15327.z))).x;
                    float _5822 = fma(_2440, 4.0, _1875);
                    float _5824 = _2440 * 7.5;
                    float _5826 = -_5822;
                    float _5828 = _5826 + _5820;
                    float _5830 = _5828 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _5832 = precise::max(_5830, _5824);
                    float _5834 = precise::min(0.0, _5832);
                    bool _5836 = _5834 != _5830;
                    bool _5838 = isnan(_5834);
                    bool _5840 = _5836 || _5838;
                    bool _5842 = isnan(_5830);
                    bool _5844 = _5840 || _5842;
                    bool _5846 = !_5844;
                    if (!_5846)
                    {
                        float _5848 = fma(_2094, 5.0, _1873);
                        float _5850 = fma(_2438, 5.0, _1877);
                        float3 _15379 = float3(_5850, _5848, float(int(_1896)));
                        float3 _15381 = select(_15379, float3(0.0), isnan(_15379));
                        float _5852 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15381.xy, uint(rint(_15381.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15381.xy, uint(rint(_15381.z))).x;
                        float _5854 = fma(_2440, 5.0, _1875);
                        float _5856 = fma(_2440, 9.0, -1.0);
                        float _5858 = -_5854;
                        float _5860 = _5858 + _5852;
                        float _5862 = _5860 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _5864 = precise::max(_5862, _5856);
                        float _5866 = precise::min(0.0, _5864);
                        bool _5868 = _5866 != _5862;
                        bool _5870 = isnan(_5866);
                        bool _5872 = _5868 || _5870;
                        bool _5874 = isnan(_5862);
                        bool _5876 = _5872 || _5874;
                        bool _5878 = !_5876;
                        if (!_5878)
                        {
                            float _5880 = fma(_2094, 6.0, _1873);
                            float _5882 = fma(_2438, 6.0, _1877);
                            float3 _15433 = float3(_5882, _5880, float(int(_1896)));
                            float3 _15435 = select(_15433, float3(0.0), isnan(_15433));
                            float _5884 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15435.xy, uint(rint(_15435.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15435.xy, uint(rint(_15435.z))).x;
                            float _5886 = _1875 + _5792;
                            float _5888 = fma(_2440, 10.5, -1.0);
                            float _5890 = -_5886;
                            float _5892 = _5890 + _5884;
                            float _5894 = _5892 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _5896 = precise::max(_5894, _5888);
                            float _5898 = precise::min(0.0, _5896);
                            bool _5900 = _5898 != _5894;
                            bool _5902 = isnan(_5898);
                            bool _5904 = _5900 || _5902;
                            bool _5906 = isnan(_5894);
                            bool _5908 = _5904 || _5906;
                            _5910 = _5908;
                        }
                    }
                }
            }
        }
    }
    if (!_5910)
    {
        float _5912 = _5690 + 1.0;
        _5718 = _5912;
    }
    _5910 = false;
    float _5914 = _5718;
    float _5916 = _5914 * 0.0625;
    float _5918 = -_5916;
    float _5920 = fma(_5918, _5714, 1.0);
    out.m_39.x = _5920;
    return out;
}

