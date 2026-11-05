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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_64 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_62 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 m_82 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(0)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1632 = false;
    bool _753 = false;
    bool _181 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1937 = as_type<float>(_121);
        out.gl_Position.z = _1937;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_53.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    if (_135)
    {
        float _143 = float(_105);
        _141 = _143;
    }
    float _145 = _141;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    if (_151)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _115;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2005 = as_type<float>(_157);
        out.gl_Position.z = _2005;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _161 = !_159;
    float _179;
    if (!_161)
    {
        float _163 = in.m_55.x;
        float _165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _167 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _169 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _171 = _169 * _165;
        float _173 = floor(_171);
        float _175 = -_173;
        float _177 = _171 + _175;
        _179 = _177;
        _181 = true;
    }
    else
    {
        float _183 = float(_105);
        float _185 = 1.0 / _183;
        float _187 = _139 * _185;
        _179 = _187;
    }
    _181 = false;
    float _189 = _179;
    float _191 = as_type<float>(int(gl_VertexIndex));
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _195 = _189 + _193;
    float _197 = in.m_55.x;
    float _199 = in.m_55.y;
    float _201 = in.m_55.z;
    float _203 = in.m_55.w;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _207 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _205;
    float _209 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _211 = 1.0 / _207;
    float _213 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _209);
    bool _215 = _189 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _217 = isnan(_189);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    bool _227 = _189 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _229 = isnan(_189);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _213);
    float _241 = -_225;
    float _243 = _241 + 1.0;
    float _245 = sqrt(_239);
    float _247 = _237 * _243;
    int _249 = as_type<int>(_191) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_191) & 2;
    bool _255 = _253 != 0;
    float _257 = -_237;
    float _259 = _257 + 1.0;
    float _261 = in.m_48.x;
    float _263 = in.m_48.y;
    float _265 = in.m_48.z;
    float _267 = _195 * _211;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = rsqrt(_239);
    float _279 = in.m_60.x;
    float _281 = in.m_60.y;
    float _283 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _285 = fma(_275, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _287 = _283 * _247;
    float _289 = precise::max(_245, 2.0);
    float _291 = _285 * _247;
    bool _293 = !_255;
    float _295 = _293 ? (-0.5) : 0.5;
    float _297 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[143].x, _287);
    bool _299 = !_251;
    float _301 = _299 ? (-0.5) : 0.5;
    float _303 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[143].y, _291);
    float _305 = precise::min(_289, 15.0);
    float _307 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].x, _297);
    bool _309 = _197 > 0.5;
    float _311 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].y, _303);
    bool _313 = _201 > 0.5;
    float _315 = fma(_305, 0.061538465321063995361328125, -0.12307693064212799072265625);
    float _317 = -_263;
    float _319 = _295 + _317;
    float _321 = -_261;
    float _323 = _301 + _321;
    float _325 = _263 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _327 = _199 > 0.5;
    float _329 = -_319;
    float _331 = fma(_319, _277, _329);
    float _333 = -_323;
    float _335 = fma(_323, _277, _333);
    float _337 = _311 * _281;
    float _339 = _307 * _279;
    float _341 = fma(_315, _331, _319);
    float _343 = fma(_315, _335, _323);
    float _345 = _337 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _347 = _339 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _349 = _341 + _263;
    float _351 = _343 + _261;
    float _353 = -_277;
    float _355 = fma(_353, _265, _265);
    float _357 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].x, _325);
    float _359 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _349);
    float _361 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _351);
    float _363 = _315 * _355;
    float _365 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[4].z, _357);
    float _367 = _345 * _359;
    float _369 = _347 * _361;
    float _371 = _263 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _373 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _363);
    float _375 = _367 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _377 = _367 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _379 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].x, _371);
    float _381 = _365 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _383 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[24].x, _375);
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[26].x, _377);
    float _387 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[6].z, _379);
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[24].z, _383);
    float _391 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[26].z, _385);
    float _393 = _387 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _395 = _389 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _397 = _391 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _399 = _263 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _401 = _367 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _403 = _381 + _395;
    float _405 = _393 + _397;
    float _407 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].x, _399);
    float _409 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _411 = _403 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _415 = _405 + _413;
    float _417 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[25].x, _401);
    float _419 = _411 * _411;
    float _421 = _415 * _415;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _425 = _423 != 0;
    out.m_62.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_62.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_62.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _427 = -_301;
    float _429 = _309 ? _427 : _301;
    float _431 = _419 + _421;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _435 = _433 != 0;
    float _437 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[5].z, _407);
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _441 = _439 != 0;
    float _443 = sqrt(_431);
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _447 = _445 != 0;
    float _449 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[25].z, _417);
    bool _451 = _203 > 0.5;
    float _453 = _437 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _455 = _449 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _457 = !_425;
    float _459 = _457 ? _301 : _429;
    float _461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _463 = -_301;
    int _465 = _313 ? as_type<int>(_463) : as_type<int>(_301);
    float _467 = _453 + _455;
    float _469 = -_295;
    int _471 = _327 ? as_type<int>(_469) : as_type<int>(_295);
    float _473 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    bool _475 = !_441;
    float _477 = _475 ? _301 : as_type<float>(_465);
    float _479 = _349 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _481 = -_295;
    int _483 = _451 ? as_type<int>(_481) : as_type<int>(_295);
    float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _487 = _443 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _489 = _479 * _479;
    bool _491 = !_435;
    float _493 = _491 ? _295 : as_type<float>(_471);
    bool _495 = !_447;
    float _497 = _495 ? _295 : as_type<float>(_483);
    float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _501 = _363;
    float _503 = _295;
    float _505 = _429;
    float _507 = _349;
    float _509 = _203;
    if (!_487)
    {
        _501 = _421;
    }
    float _511 = _501;
    float _513 = _511;
    if (!_487)
    {
        _503 = _419;
    }
    float _515 = _503;
    float _517 = _515;
    if (!_487)
    {
        _505 = _403;
    }
    float _519 = _505;
    float _521 = _519;
    if (!_487)
    {
        _507 = _405;
    }
    float _523 = _507;
    float _525 = _523;
    if (!_487)
    {
        _509 = _467;
    }
    float _527 = _509;
    bool _529 = !_487;
    float _531 = _527;
    if (!_529)
    {
        float _533 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _535 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _537 = _443 + _535;
        float _539 = _467 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _541 = rsqrt(_431);
        float _543 = _537 * _533;
        float _545 = _543 * 0.15915493667125701904296875;
        float _547 = _545 * 6.283185482025146484375;
        float _549 = sin(_547);
        float _551 = _545 * 6.283185482025146484375;
        float _553 = cos(_551);
        float _555 = fma(_549, _539, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _557 = _541 * _555;
        float _559 = _553 + (-1.0);
        float _561 = fma(_411, _557, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _563 = fma(_415, _557, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _565 = _559 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _567 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _569 = _561 + _567;
        float _571 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _573 = _563 + _571;
        float _575 = fma(_467, _553, _565);
        float _577 = _569 * _569;
        float _579 = _573 * _573;
        _531 = _575;
        _517 = _577;
        _513 = _579;
        _525 = _563;
        _521 = _561;
    }
    float _581 = _531;
    float _583 = _517;
    float _585 = _513;
    float _587 = _525;
    float _589 = _521;
    float _591 = fma(_473, _473, _489);
    float _593 = _479 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _595 = _351 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _597 = _479 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _599 = _479 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _601 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _603 = _581 + _601;
    float _605 = rsqrt(_591);
    float _607 = _459 + 0.5;
    float _609 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[24].x, _593);
    float _611 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[25].x, _597);
    float _613 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[26].x, _599);
    float _615 = fma(_603, _603, _583);
    float _617 = _607 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _619 = _477 + 0.5;
    float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _623 = _615 + _585;
    float _625 = _617 * _461;
    float _627 = _619 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _629 = -_497;
    float _631 = _629 + 0.5;
    float _633 = -_493;
    float _635 = _633 + 0.5;
    float _637 = _627 * _499;
    float _639 = _479 * _605;
    float _641 = _631 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _643 = _473 * _605;
    float _645 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _647 = _639 * _645;
    float _649 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _651 = _639 * _649;
    float _653 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _655 = _639 * _653;
    float _657 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[24].y, _647);
    float _659 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[25].y, _651);
    float _661 = _641 * _621;
    float _663 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[26].y, _655);
    float _665 = _635 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _667 = sqrt(_623);
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _681 = _665 * _485;
    float _683 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[24].z, _609);
    float _685 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[25].z, _611);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _689 = _669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _691 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[26].z, _613);
    out.m_64.x = _689;
    out.m_64.y = _691;
    out.m_64.z = _693;
    out.m_64.w = _687;
    bool _703 = _667 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _705 = isnan(_667);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _711 = _707 || _709;
    out.m_66.x = _695;
    out.m_66.y = _697;
    out.m_66.z = _699;
    out.m_68.x = _625;
    out.m_68.y = _681;
    out.m_68.z = _637;
    out.m_68.w = _661;
    out.m_70.x = _657;
    out.m_70.y = _659;
    out.m_70.z = _663;
    float _713 = _623;
    float _715 = _691;
    float _717 = _667;
    if (!_711)
    {
        _713 = 1.0;
    }
    float _719 = _713;
    out.m_72.x = _683;
    out.m_72.y = _685;
    out.m_72.z = _701;
    bool _721 = !_711;
    float _723 = _719;
    if (!_721)
    {
        bool _725 = _667 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _727 = isnan(_667);
        bool _729 = _725 || _727;
        bool _731 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _733 = _729 || _731;
        if (!_733)
        {
            float _735 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _737 = _667 + _735;
            float _739 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _741 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _739;
            float _743 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _745 = _743 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _747 = 1.0 / _741;
            float _749 = _737 * _747;
            float _751 = fma(_749, _745, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _723 = _751;
            _753 = true;
        }
        else
        {
            bool _755 = _667 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _757 = isnan(_667);
            bool _759 = _755 || _757;
            bool _761 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _763 = _759 || _761;
            if (!_763)
            {
                float _765 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _767 = _667 + _765;
                float _769 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _771 = _769 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _773 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _775 = _773 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _777 = 1.0 / _771;
                float _779 = _767 * _777;
                float _781 = fma(_779, _775, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _723 = _781;
                _753 = true;
            }
            else
            {
                _723 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _753 = false;
    float _783 = _723;
    float _785 = _453 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _787 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _789 = _581 + _787;
    float _791 = fma(_381, (*spvDescriptorSet0.vp_c8)._m0[11].x, _785);
    float _793 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _795 = _587 + _793;
    bool _797 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _799 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _801 = _797 || _799;
    bool _803 = isnan(0.5);
    bool _805 = _801 || _803;
    float _807 = fma(_393, (*spvDescriptorSet0.vp_c8)._m0[11].z, _791);
    float _809 = _453 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _811 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _813 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _815 = _811 || _813;
    bool _817 = isnan(0.5);
    bool _819 = _815 || _817;
    float _821 = fma(_789, _783, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _823 = _807 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _825 = fma(_381, (*spvDescriptorSet0.vp_c8)._m0[10].x, _809);
    float _827 = 1.0 / _823;
    float _829 = fma(_393, (*spvDescriptorSet0.vp_c8)._m0[10].z, _825);
    float _831 = _829 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _833 = _831 + _823;
    float _835 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _837 = _589 + _835;
    float _839 = fma(_837, _783, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _841 = fma(_795, _783, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _843 = _833 * _827;
    float _845 = _843 * 0.5;
    float _847 = _827;
    float _849 = _837;
    float _851 = _845;
    float _853 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _855 = _839;
    float _857 = _821;
    if (_805)
    {
        _847 = 1.0;
    }
    float _859 = _847;
    float _861 = _859;
    if (_819)
    {
        _849 = _821;
    }
    float _863 = _849;
    float _865 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _867 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[30].w, _865);
    float _869 = _863;
    if (_819)
    {
        _851 = _839;
    }
    float _871 = _851;
    float _873 = _871;
    if (_819)
    {
        _853 = _841;
    }
    float _875 = _853;
    float _877 = 1.0 / _867;
    float _879 = _875;
    if (!_819)
    {
        float _881 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _883 = _453 + _881;
        float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _887 = _381 + _885;
        float _889 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _891 = _883 * _883;
        float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _895 = _393 + _893;
        float _897 = fma(_887, _887, _891);
        float _899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _901 = fma(_895, _895, _897);
        float _903 = sqrt(_901);
        float _905 = _889 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _907 = -_453;
        float _909 = _907 + _821;
        float _911 = precise::min(_903, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _913 = _911 * _899;
        float _915 = -_393;
        float _917 = _915 + _841;
        float _919 = _905 * _913;
        float _921 = -_381;
        float _923 = _921 + _839;
        float _925 = fma(_909, _919, _453);
        float _927 = fma(_923, _919, _381);
        float _929 = fma(_917, _919, _393);
        _869 = _925;
        _873 = _927;
        _879 = _929;
    }
    float _931 = _869;
    float _933 = _873;
    float _935 = _879;
    if (_805)
    {
        _855 = 1.0;
    }
    float _937 = _855;
    float _939 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _941 = _877 * _939;
    float _943 = _937;
    if (!_805)
    {
        float _945 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _947 = _945 * 0.15915493667125701904296875;
        float _949 = _947 * 6.283185482025146484375;
        float _951 = cos(_949);
        float _953 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _955 = _953 * 0.15915493667125701904296875;
        float _957 = _947 * 6.283185482025146484375;
        float _959 = sin(_957);
        float _961 = 1.0 / _951;
        float _963 = _955 * 6.283185482025146484375;
        float _965 = cos(_963);
        float _967 = _959 * _961;
        float _969 = _955 * 6.283185482025146484375;
        float _971 = sin(_969);
        float _973 = _965 * _967;
        float _975 = 1.0 / _973;
        float _977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _979 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _977;
        float _981 = 1.0 / _979;
        float _983 = _971 * _975;
        float _985 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _987 = fma(_941, _983, _985);
        float _989 = _987 * _981;
        float _991 = precise::clamp(_989, 0.0, 1.0);
        _715 = _947;
        _861 = _991;
    }
    float _993 = _715;
    float _995 = _861;
    float _997 = _993;
    if (!_805)
    {
        float _999 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1001 = _999 * 0.15915493667125701904296875;
        float _1003 = _1001 * 6.283185482025146484375;
        float _1005 = cos(_1003);
        float _1007 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1009 = _1007 * 0.15915493667125701904296875;
        float _1011 = _1001 * 6.283185482025146484375;
        float _1013 = sin(_1011);
        float _1015 = 1.0 / _1005;
        float _1017 = _1009 * 6.283185482025146484375;
        float _1019 = cos(_1017);
        float _1021 = _1013 * _1015;
        float _1023 = _1009 * 6.283185482025146484375;
        float _1025 = sin(_1023);
        float _1027 = _1019 * _1021;
        float _1029 = 1.0 / _1027;
        float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1033 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1031;
        float _1035 = 1.0 / _1033;
        float _1037 = _1025 * _1029;
        float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1041 = fma(_941, _1037, _1039);
        float _1043 = _1041 * _1035;
        float _1045 = precise::clamp(_1043, 0.0, 1.0);
        float _1047 = -_1045;
        float _1049 = _1047 + 1.0;
        _857 = _1029;
        _943 = _1049;
    }
    float _1051 = _857;
    float _1053 = _943;
    float _1055 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1057 = _931 + _1055;
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1061 = _933 + _1059;
    float _1063 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1065 = _935 + _1063;
    float _1067 = _1057 * _1057;
    float _1069 = fma(_1061, _1061, _1067);
    float _1071 = fma(_1065, _1065, _1069);
    float _1073 = rsqrt(_1071);
    float _1075 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1077 = _1061 * _1075;
    float _1079 = _1065 * _1075;
    float _1081 = _1077 * _1077;
    float _1083 = _1079 * _1079;
    float _1085 = _1081 + _1083;
    float _1087 = sqrt(_1085);
    bool _1089 = _1087 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1091 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1093 = _1087 + _1091;
    float _1095 = _1051;
    float _1097 = _1093;
    float _1099 = _1057;
    if (_1089)
    {
        float _1101 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1095 = _1101;
    }
    float _1103 = _1095;
    if (_1089)
    {
        float _1105 = rsqrt(_1085);
        _997 = _1105;
    }
    float _1107 = _997;
    float _1109 = _1103;
    float _1111 = _1107;
    if (_1089)
    {
        float _1113 = _1093 * _1103;
        _1097 = _1113;
    }
    float _1115 = _1097;
    if (_1089)
    {
        float _1117 = _1115 * 0.15915493667125701904296875;
        _1109 = _1117;
    }
    float _1119 = _1109;
    float _1121 = _1065;
    float _1123 = _1119;
    if (_1089)
    {
        float _1125 = _1119 * 6.283185482025146484375;
        float _1127 = sin(_1125);
        _1121 = _1127;
    }
    float _1129 = _1121;
    float _1131 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1133 = precise::max(0.0, _1131);
    float _1135 = _1073;
    float _1137 = _1133;
    if (_1089)
    {
        float _1139 = _1119 * 6.283185482025146484375;
        float _1141 = cos(_1139);
        _1135 = _1141;
    }
    float _1143 = _1135;
    float _1145 = -_1075;
    float _1147 = -_1133;
    float _1149 = fma(_1057, _1145, _1147);
    float _1151 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1089)
    {
        float _1153 = _1149 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1099 = _1153;
    }
    float _1155 = _1099;
    float _1157 = _1155;
    if (!_1089)
    {
        _1123 = _1077;
    }
    float _1159 = _1123;
    float _1161 = fma(_381, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1163 = _1159;
    if (_1089)
    {
        float _1165 = fma(_1129, _1155, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1157 = _1165;
    }
    float _1167 = _1157;
    float _1169 = sqrt(_1071);
    float _1171 = _1167;
    float _1173 = _1143;
    if (_1089)
    {
        float _1175 = _1143 + (-1.0);
        _1137 = _1175;
    }
    float _1177 = _1137;
    float _1179 = _1177;
    if (_1089)
    {
        float _1181 = _1107 * _1167;
        _717 = _1181;
    }
    float _1183 = _717;
    if (!_1089)
    {
        _1111 = _1149;
    }
    float _1185 = _1111;
    float _1187 = _1185;
    if (_1089)
    {
        float _1189 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1151 = _1189;
    }
    float _1191 = _1151;
    if (_1089)
    {
        float _1193 = _1077 * _1183;
        _1163 = _1193;
    }
    float _1195 = _1163;
    if (!_1089)
    {
        _1179 = _1079;
    }
    float _1197 = _1179;
    float _1199 = _1197;
    if (_1089)
    {
        float _1201 = _1079 * _1183;
        _1199 = _1201;
    }
    float _1203 = _1199;
    if (!_1089)
    {
        _1171 = _1081;
    }
    float _1205 = _1171;
    float _1207 = _1205;
    if (_1089)
    {
        float _1209 = fma(_1149, _1143, _1191);
        _1187 = _1209;
    }
    float _1211 = _1187;
    if (_1089)
    {
        float _1213 = _1195 * _1195;
        _1207 = _1213;
    }
    float _1215 = _1207;
    float _1217 = _931 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1089)
    {
        _1173 = _1083;
    }
    float _1219 = _1173;
    float _1221 = _1219;
    if (_1089)
    {
        float _1223 = _1203 * _1203;
        _1221 = _1223;
    }
    float _1225 = _1221;
    float _1227 = fma(_1211, _1211, _1215);
    float _1229 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1217);
    float _1231 = floor(_1161);
    float _1233 = _1227 + _1225;
    float _1235 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1229);
    float _1237 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1239 = _1235 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1241 = rsqrt(_1233);
    float _1243 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1245 = fma(_1169, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1243);
    float _1247 = precise::clamp(_1245, 0.0, 1.0);
    float _1249 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1251 = -_1247;
    float _1253 = _1251 + 1.0;
    float _1255 = -_1249;
    float _1257 = fma(_1255, _1237, 1.0);
    float _1259 = _931 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1261 = fma(_393, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1263 = _931 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1265 = _931 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1267 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1259);
    float _1269 = abs(_1253);
    float _1271 = log2(_1269);
    float _1273 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1263);
    float _1275 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1265);
    float _1277 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1267);
    float _1279 = _1241 * _1195;
    float _1281 = _1241 * _1211;
    float _1283 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1273);
    float _1285 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1287 = _1279 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1289 = _1241 * _1203;
    float _1291 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1293 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1275);
    float _1295 = -_1287;
    float _1297 = fma(_1281, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1295);
    float _1299 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1301 = floor(_1261);
    float _1303 = -_1231;
    float _1305 = _1161 + _1303;
    float _1307 = -_1289;
    float _1309 = fma(_1307, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1297);
    float _1311 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1299);
    float _1313 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1315 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1317 = fma(_1309, -0.5, 0.5);
    float _1319 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1311);
    float _1321 = log2(_1257);
    float _1323 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1315);
    float _1325 = exp2(_1313);
    float _1327 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1329 = -_1301;
    float _1331 = _1261 + _1329;
    float _1333 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1319);
    float _1335 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1337 = sqrt(_1317);
    float _1339 = fma(_1309, 0.5, 0.5);
    float _1341 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1335);
    float _1343 = _1281 + 1.0;
    float _1345 = _1321 * 0.693147182464599609375;
    float _1347 = fma(_1339, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1349 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1341);
    float _1351 = 1.0 / _1333;
    float _1353 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1323);
    float _1355 = fma(_1339, _1347, -0.212114393711090087890625);
    float _1357 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1349);
    float2 _4015 = float2(_1305, _1331);
    float _1359 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4015, float2(0.0), isnan(_4015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4015, float2(0.0), isnan(_4015)), level(0.0)).x;
    float _1361 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1353);
    float _1363 = fma(_1339, _1355, 1.570728778839111328125);
    float _1365 = -_1281;
    float _1367 = fma(_1325, _1343, _1365);
    float _1369 = _1337 * 0.636619746685028076171875;
    float _1371 = -_1363;
    float _1373 = fma(_1369, _1371, 1.0);
    float _1375 = fma(_1367, 0.5, 0.5);
    float _1377 = _1361 * _1351;
    float _1379 = _1357 * _1351;
    float _1381 = _1345 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1383 = fma(_1377, 0.5, 0.5);
    float _1385 = fma(_1379, -0.5, 0.5);
    float3 _4065 = float3(_1383, _1385, _1381);
    float _1387 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4065, float3(0.0), isnan(_4065)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4065, float3(0.0), isnan(_4065)), level(0.0)).x;
    float3 _4076 = float3(_1383, _1385, _1381);
    float4 _1390 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4076, float3(0.0), isnan(_4076)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4076, float3(0.0), isnan(_4076)), level(0.0)).xyzw;
    float _1392 = _1390.x;
    float _1394 = _1390.y;
    float _1396 = _1390.z;
    float _1398 = _1390.w;
    float2 _4092 = float2(_1373, _1375);
    float3 _1402 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4092, float2(0.0), isnan(_4092)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4092, float2(0.0), isnan(_4092)), level(0.0)).xyz;
    float _1404 = _1402.x;
    float _1406 = _1402.y;
    float _1408 = _1402.z;
    float _1410 = abs(_941);
    float _1412 = log2(_1410);
    float _1414 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_74.x = _933;
    out.m_74.y = _931;
    out.m_74.z = _935;
    bool _1416 = _1169 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1418 = isnan(_1169);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1424 = _1420 || _1422;
    float _1426 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1414);
    float _1428 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1426);
    float _1430 = in.m_76.x;
    float _1432 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1428);
    float _1434 = _1412 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1436 = exp2(_1434);
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1440 = precise::clamp(_1438, 0.0, 1.0);
    float _1442 = fma(_1440, -2.0, 3.0);
    float _1444 = _1440 * _1440;
    float _1446 = _1444 * _1442;
    float _1448 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1450 = _941 <= 8000.0;
    bool _1452 = isnan(_941);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan(8000.0);
    bool _1458 = _1454 || _1456;
    float _1460 = float(_1458);
    float _1462 = -_1446;
    float _1464 = _1462 + 1.0;
    float _1466 = exp2(_1448);
    float _1468 = fma(_1464, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1446);
    float _1470 = _1432 + _1333;
    out.gl_Position.x = _1361;
    out.gl_Position.y = _1357;
    out.gl_Position.z = _1432;
    out.gl_Position.w = _1333;
    float _1472 = _1460 * _1468;
    float _1474 = _1470 * 0.5;
    float _1476 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_78.z = _1474;
    out.m_78.w = _1333;
    float _1478 = -_1466;
    float _1480 = _1478 + 1.0;
    float _1482 = _1333;
    float _1484 = _1432;
    float _1486 = _1357;
    float _1488 = _1361;
    if (!_1424)
    {
        _1482 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1490 = _1482;
    float _1492 = _1490;
    float _1494 = _1490;
    if (!_1424)
    {
        _1484 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1496 = _1484;
    float _1498 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1500 = _1496;
    float _1502 = _1496;
    if (!_1424)
    {
        _1486 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1504 = _1486;
    float _1506 = _1504;
    float _1508 = _1504;
    if (!_1424)
    {
        _1488 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1510 = _1488;
    float _1512 = -_1359;
    float _1514 = _1512 + 1.0;
    float _1516 = _1514 * _1476;
    float _1518 = precise::clamp(_1516, 0.0, 1.0);
    float _1520 = -_1518;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1524 = _1522 * _1430;
    float _1526 = _1524 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1528 = _1498 * _1387;
    float _1530 = -_1498;
    float _1532 = _1530 + 1.0;
    out.m_80.x = _1526;
    float _1534 = _1398 * _1528;
    float _1536 = _1408 * _1528;
    float _1538 = _1398 * _1532;
    float _1540 = fma(_1404, _1534, _1392);
    float _1542 = fma(_1406, _1534, _1394);
    float _1544 = fma(_1398, _1536, _1396);
    float _1546 = _995 * _1053;
    float _1548 = _1392;
    float _1550 = _1546;
    float _1552 = _1510;
    float _1554 = _1510;
    if (!_1424)
    {
        _1548 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1556 = _1548;
    out.m_82.x = _1540;
    out.m_82.y = _1542;
    out.m_82.z = _1544;
    out.m_82.w = _1538;
    float _1558 = _1546 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1560 = _1556;
    float _1562 = _1556;
    if (!_1424)
    {
        _1550 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1564 = _1550;
    bool _1566 = !_1424;
    float _1568 = _1564;
    float _1570 = _1564;
    if (!_1566)
    {
        bool _1572 = _1169 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1574 = isnan(_1169);
        bool _1576 = _1572 || _1574;
        bool _1578 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1580 = _1576 || _1578;
        if (!_1580)
        {
            float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1584 = _1169 + _1582;
            float _1586 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1588 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1586;
            float _1590 = 1.0 / _1588;
            float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1594 = _1592 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1598 = _1596 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1602 = _1600 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1604 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1606 = _1604 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1610 = _1608 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1612 = _1584 * _1590;
            float _1614 = precise::clamp(_1612, 0.0, 1.0);
            float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1618 = _1616 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1620 = fma(_1614, _1594, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1622 = fma(_1614, _1618, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1624 = fma(_1614, _1598, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1626 = fma(_1614, _1602, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1628 = fma(_1614, _1606, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1630 = fma(_1614, _1610, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1494 = _1622;
            _1554 = _1628;
            _1562 = _1620;
            _1508 = _1626;
            _1502 = _1624;
            _1570 = _1630;
            _1632 = true;
        }
        else
        {
            bool _1634 = _1169 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1636 = isnan(_1169);
            bool _1638 = _1634 || _1636;
            bool _1640 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1642 = _1638 || _1640;
            if (!_1642)
            {
                _1560 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1644 = _1560;
            _1562 = _1644;
            if (!_1642)
            {
                _1492 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1646 = _1492;
            _1494 = _1646;
            if (!_1642)
            {
                _1500 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1648 = _1500;
            _1502 = _1648;
            if (!_1642)
            {
                _1506 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1650 = _1506;
            _1508 = _1650;
            if (!_1642)
            {
                _1552 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1652 = _1552;
            _1554 = _1652;
            if (!_1642)
            {
                _1568 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1654 = _1568;
            bool _1656 = !_1642;
            _1570 = _1654;
            if (!_1656)
            {
                bool _1658 = _1169 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1660 = isnan(_1169);
                bool _1662 = _1658 || _1660;
                bool _1664 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1666 = _1662 || _1664;
                if (!_1666)
                {
                    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1670 = _1169 + _1668;
                    float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1674 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1672;
                    float _1676 = 1.0 / _1674;
                    float _1678 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1680 = _1678 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1684 = _1682 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1686 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1688 = _1686 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1692 = _1690 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1694 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1696 = _1694 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1698 = _1670 * _1676;
                    float _1700 = precise::clamp(_1698, 0.0, 1.0);
                    float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1704 = _1702 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1706 = fma(_1700, _1680, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1708 = fma(_1700, _1704, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1710 = fma(_1700, _1684, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1712 = fma(_1700, _1688, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1714 = fma(_1700, _1692, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1716 = fma(_1700, _1696, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1494 = _1708;
                    _1554 = _1714;
                    _1562 = _1706;
                    _1508 = _1712;
                    _1502 = _1710;
                    _1570 = _1716;
                    _1632 = true;
                }
                else
                {
                    _1494 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1554 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1562 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1508 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1502 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1570 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1632 = false;
    float _1718 = _1494;
    float _1720 = _1554;
    float _1722 = _1562;
    float _1724 = _1508;
    float _1726 = _1502;
    float _1728 = _1570;
    float _1730 = fma(_685, -0.5, 0.5);
    float _1732 = precise::clamp(_1730, 0.0, 1.0);
    float _1734 = -_1718;
    float _1736 = _1734 + _1720;
    float _1738 = _1558 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1740 = -_1722;
    float _1742 = _1740 + _1724;
    out.m_84.x = 0.0;
    float _1744 = fma(_1732, _1736, _1718);
    float _1746 = fma(_1732, _1742, _1722);
    out.m_51.x = _1738;
    float _1748 = -_1726;
    float _1750 = _1748 + _1728;
    float _1752 = _1744 * 0.586610972881317138671875;
    bool _1754 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1756 = fma(_1732, _1750, _1726);
    float _1758 = fma(_1746, 0.298911988735198974609375, _1752);
    bool _1760 = _995 > 0.0;
    bool _1762 = isnan(_995);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan(0.0);
    bool _1768 = _1764 || _1766;
    float _1770 = fma(_1756, 0.114477999508380889892578125, _1758);
    bool _1772 = _1053 <= 0.0;
    bool _1774 = !_1768;
    bool _1776 = _1772 || _1774;
    float _1778 = -_1770;
    float _1780 = _1746 + _1778;
    float _1782 = -_1770;
    float _1784 = _1744 + _1782;
    float _1786 = -_1770;
    float _1788 = _1756 + _1786;
    float _1790 = fma(_1780, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1770);
    float _1792 = fma(_1784, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1770);
    float _1794 = fma(_1788, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1770);
    bool _1796 = !_1754;
    if (!_1796)
    {
        float _1798 = -_931;
        float _1800 = _1798 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1802 = -_933;
        float _1804 = _1802 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1806 = -_935;
        float _1808 = _1806 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1810 = _1800 * _1800;
        float _1812 = fma(_1804, _1804, _1810);
        float _1814 = fma(_1808, _1808, _1812);
        float _1816 = sqrt(_1814);
        float _1818 = rsqrt(_1814);
        float _1820 = -_1816;
        float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1824 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1826 = precise::clamp(_1824, 0.0, 1.0);
        float _1828 = _1804 * _1818;
        float _1830 = _1800 * _1818;
        float _1832 = abs(_1826);
        float _1834 = log2(_1832);
        float _1836 = _1808 * _1818;
        float _1838 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1840 = _685 * _1830;
        float _1842 = -_1830;
        float _1844 = -_1838;
        float _1846 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1844);
        float _1848 = fma(_683, _1828, _1840);
        float _1850 = -_1836;
        float _1852 = fma(_1850, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1846);
        float _1854 = fma(_701, _1836, _1848);
        float _1856 = precise::clamp(_1854, 0.0, 1.0);
        float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1860 = _1852 + _1858;
        float _1862 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1864 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1866 = precise::clamp(_1864, 0.0, 1.0);
        float _1868 = exp2(_1862);
        float _1870 = _1868 * _1866;
        float _1872 = _1856 * _1870;
        float _1874 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1876 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1878 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _1874;
        out.m_84.y = _1876;
        out.m_84.z = _1878;
    }
    out.m_86.x = _1790;
    out.m_86.y = _1792;
    out.m_86.z = _1794;
    if (!_1776)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _1880 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1880;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1632 = false;
    bool _753 = false;
    bool _181 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1937 = as_type<float>(_121);
        out.gl_Position.z = _1937;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_53.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    if (_135)
    {
        float _143 = float(_105);
        _141 = _143;
    }
    float _145 = _141;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    if (_151)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _115;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2005 = as_type<float>(_157);
        out.gl_Position.z = _2005;
    }
    if (_151)
    {
        return out;
    }
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _161 = !_159;
    float _179;
    if (!_161)
    {
        float _163 = in.m_55.x;
        float _165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _167 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _169 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _171 = _169 * _165;
        float _173 = floor(_171);
        float _175 = -_173;
        float _177 = _171 + _175;
        _179 = _177;
        _181 = true;
    }
    else
    {
        float _183 = float(_105);
        float _185 = 1.0 / _183;
        float _187 = _139 * _185;
        _179 = _187;
    }
    _181 = false;
    float _189 = _179;
    float _191 = as_type<float>(int(gl_VertexIndex));
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _195 = _189 + _193;
    float _197 = in.m_55.x;
    float _199 = in.m_55.y;
    float _201 = in.m_55.z;
    float _203 = in.m_55.w;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _207 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _205;
    float _209 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _211 = 1.0 / _207;
    float _213 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _209);
    bool _215 = _189 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _217 = isnan(_189);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    bool _227 = _189 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _229 = isnan(_189);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _213);
    float _241 = -_225;
    float _243 = _241 + 1.0;
    float _245 = sqrt(_239);
    float _247 = _237 * _243;
    int _249 = as_type<int>(_191) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_191) & 2;
    bool _255 = _253 != 0;
    float _257 = -_237;
    float _259 = _257 + 1.0;
    float _261 = in.m_48.x;
    float _263 = in.m_48.y;
    float _265 = in.m_48.z;
    float _267 = _195 * _211;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = rsqrt(_239);
    float _279 = in.m_60.x;
    float _281 = in.m_60.y;
    float _283 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _285 = fma(_275, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _287 = _283 * _247;
    float _289 = precise::max(_245, 2.0);
    float _291 = _285 * _247;
    bool _293 = !_255;
    float _295 = _293 ? (-0.5) : 0.5;
    float _297 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[143].x, _287);
    bool _299 = !_251;
    float _301 = _299 ? (-0.5) : 0.5;
    float _303 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[143].y, _291);
    float _305 = precise::min(_289, 15.0);
    float _307 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].x, _297);
    bool _309 = _197 > 0.5;
    float _311 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].y, _303);
    bool _313 = _201 > 0.5;
    float _315 = fma(_305, 0.061538465321063995361328125, -0.12307693064212799072265625);
    float _317 = -_263;
    float _319 = _295 + _317;
    float _321 = -_261;
    float _323 = _301 + _321;
    float _325 = _263 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _327 = _199 > 0.5;
    float _329 = -_319;
    float _331 = fma(_319, _277, _329);
    float _333 = -_323;
    float _335 = fma(_323, _277, _333);
    float _337 = _311 * _281;
    float _339 = _307 * _279;
    float _341 = fma(_315, _331, _319);
    float _343 = fma(_315, _335, _323);
    float _345 = _337 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _347 = _339 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _349 = _341 + _263;
    float _351 = _343 + _261;
    float _353 = -_277;
    float _355 = fma(_353, _265, _265);
    float _357 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].x, _325);
    float _359 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _349);
    float _361 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _351);
    float _363 = _315 * _355;
    float _365 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[4].z, _357);
    float _367 = _345 * _359;
    float _369 = _347 * _361;
    float _371 = _263 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _373 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _363);
    float _375 = _367 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _377 = _367 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _379 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].x, _371);
    float _381 = _365 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _383 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[24].x, _375);
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[26].x, _377);
    float _387 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[6].z, _379);
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[24].z, _383);
    float _391 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[26].z, _385);
    float _393 = _387 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _395 = _389 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _397 = _391 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _399 = _263 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _401 = _367 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _403 = _381 + _395;
    float _405 = _393 + _397;
    float _407 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].x, _399);
    float _409 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _411 = _403 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _415 = _405 + _413;
    float _417 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[25].x, _401);
    float _419 = _411 * _411;
    float _421 = _415 * _415;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _425 = _423 != 0;
    out.m_62.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_62.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_62.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _427 = -_301;
    float _429 = _309 ? _427 : _301;
    float _431 = _419 + _421;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _435 = _433 != 0;
    float _437 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[5].z, _407);
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _441 = _439 != 0;
    float _443 = sqrt(_431);
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _447 = _445 != 0;
    float _449 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[25].z, _417);
    bool _451 = _203 > 0.5;
    float _453 = _437 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _455 = _449 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _457 = !_425;
    float _459 = _457 ? _301 : _429;
    float _461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _463 = -_301;
    int _465 = _313 ? as_type<int>(_463) : as_type<int>(_301);
    float _467 = _453 + _455;
    float _469 = -_295;
    int _471 = _327 ? as_type<int>(_469) : as_type<int>(_295);
    float _473 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    bool _475 = !_441;
    float _477 = _475 ? _301 : as_type<float>(_465);
    float _479 = _349 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _481 = -_295;
    int _483 = _451 ? as_type<int>(_481) : as_type<int>(_295);
    float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _487 = _443 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _489 = _479 * _479;
    bool _491 = !_435;
    float _493 = _491 ? _295 : as_type<float>(_471);
    bool _495 = !_447;
    float _497 = _495 ? _295 : as_type<float>(_483);
    float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _501 = _363;
    float _503 = _295;
    float _505 = _429;
    float _507 = _349;
    float _509 = _203;
    if (!_487)
    {
        _501 = _421;
    }
    float _511 = _501;
    float _513 = _511;
    if (!_487)
    {
        _503 = _419;
    }
    float _515 = _503;
    float _517 = _515;
    if (!_487)
    {
        _505 = _403;
    }
    float _519 = _505;
    float _521 = _519;
    if (!_487)
    {
        _507 = _405;
    }
    float _523 = _507;
    float _525 = _523;
    if (!_487)
    {
        _509 = _467;
    }
    float _527 = _509;
    bool _529 = !_487;
    float _531 = _527;
    if (!_529)
    {
        float _533 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _535 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _537 = _443 + _535;
        float _539 = _467 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _541 = rsqrt(_431);
        float _543 = _537 * _533;
        float _545 = _543 * 0.15915493667125701904296875;
        float _547 = _545 * 6.283185482025146484375;
        float _549 = sin(_547);
        float _551 = _545 * 6.283185482025146484375;
        float _553 = cos(_551);
        float _555 = fma(_549, _539, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _557 = _541 * _555;
        float _559 = _553 + (-1.0);
        float _561 = fma(_411, _557, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _563 = fma(_415, _557, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _565 = _559 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _567 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _569 = _561 + _567;
        float _571 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _573 = _563 + _571;
        float _575 = fma(_467, _553, _565);
        float _577 = _569 * _569;
        float _579 = _573 * _573;
        _531 = _575;
        _517 = _577;
        _513 = _579;
        _525 = _563;
        _521 = _561;
    }
    float _581 = _531;
    float _583 = _517;
    float _585 = _513;
    float _587 = _525;
    float _589 = _521;
    float _591 = fma(_473, _473, _489);
    float _593 = _479 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _595 = _351 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _597 = _479 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _599 = _479 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _601 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _603 = _581 + _601;
    float _605 = rsqrt(_591);
    float _607 = _459 + 0.5;
    float _609 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[24].x, _593);
    float _611 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[25].x, _597);
    float _613 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[26].x, _599);
    float _615 = fma(_603, _603, _583);
    float _617 = _607 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _619 = _477 + 0.5;
    float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _623 = _615 + _585;
    float _625 = _617 * _461;
    float _627 = _619 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _629 = -_497;
    float _631 = _629 + 0.5;
    float _633 = -_493;
    float _635 = _633 + 0.5;
    float _637 = _627 * _499;
    float _639 = _479 * _605;
    float _641 = _631 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _643 = _473 * _605;
    float _645 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _647 = _639 * _645;
    float _649 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _651 = _639 * _649;
    float _653 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _655 = _639 * _653;
    float _657 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[24].y, _647);
    float _659 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[25].y, _651);
    float _661 = _641 * _621;
    float _663 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[26].y, _655);
    float _665 = _635 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _667 = sqrt(_623);
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _681 = _665 * _485;
    float _683 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[24].z, _609);
    float _685 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[25].z, _611);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _689 = _669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _691 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[26].z, _613);
    out.m_64.x = _689;
    out.m_64.y = _691;
    out.m_64.z = _693;
    out.m_64.w = _687;
    bool _703 = _667 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _705 = isnan(_667);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _711 = _707 || _709;
    out.m_66.x = _695;
    out.m_66.y = _697;
    out.m_66.z = _699;
    out.m_68.x = _625;
    out.m_68.y = _681;
    out.m_68.z = _637;
    out.m_68.w = _661;
    out.m_70.x = _657;
    out.m_70.y = _659;
    out.m_70.z = _663;
    float _713 = _623;
    float _715 = _691;
    float _717 = _667;
    if (!_711)
    {
        _713 = 1.0;
    }
    float _719 = _713;
    out.m_72.x = _683;
    out.m_72.y = _685;
    out.m_72.z = _701;
    bool _721 = !_711;
    float _723 = _719;
    if (!_721)
    {
        bool _725 = _667 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _727 = isnan(_667);
        bool _729 = _725 || _727;
        bool _731 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _733 = _729 || _731;
        if (!_733)
        {
            float _735 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _737 = _667 + _735;
            float _739 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _741 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _739;
            float _743 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _745 = _743 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _747 = 1.0 / _741;
            float _749 = _737 * _747;
            float _751 = fma(_749, _745, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _723 = _751;
            _753 = true;
        }
        else
        {
            bool _755 = _667 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _757 = isnan(_667);
            bool _759 = _755 || _757;
            bool _761 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _763 = _759 || _761;
            if (!_763)
            {
                float _765 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _767 = _667 + _765;
                float _769 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _771 = _769 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _773 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _775 = _773 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _777 = 1.0 / _771;
                float _779 = _767 * _777;
                float _781 = fma(_779, _775, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _723 = _781;
                _753 = true;
            }
            else
            {
                _723 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _753 = false;
    float _783 = _723;
    float _785 = _453 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _787 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _789 = _581 + _787;
    float _791 = fma(_381, (*spvDescriptorSet0.vp_c8)._m0[11].x, _785);
    float _793 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _795 = _587 + _793;
    bool _797 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _799 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _801 = _797 || _799;
    bool _803 = isnan(0.5);
    bool _805 = _801 || _803;
    float _807 = fma(_393, (*spvDescriptorSet0.vp_c8)._m0[11].z, _791);
    float _809 = _453 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _811 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _813 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _815 = _811 || _813;
    bool _817 = isnan(0.5);
    bool _819 = _815 || _817;
    float _821 = fma(_789, _783, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _823 = _807 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _825 = fma(_381, (*spvDescriptorSet0.vp_c8)._m0[10].x, _809);
    float _827 = 1.0 / _823;
    float _829 = fma(_393, (*spvDescriptorSet0.vp_c8)._m0[10].z, _825);
    float _831 = _829 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _833 = _831 + _823;
    float _835 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _837 = _589 + _835;
    float _839 = fma(_837, _783, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _841 = fma(_795, _783, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _843 = _833 * _827;
    float _845 = _843 * 0.5;
    float _847 = _827;
    float _849 = _837;
    float _851 = _845;
    float _853 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _855 = _839;
    float _857 = _821;
    if (_805)
    {
        _847 = 1.0;
    }
    float _859 = _847;
    float _861 = _859;
    if (_819)
    {
        _849 = _821;
    }
    float _863 = _849;
    float _865 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _867 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[30].w, _865);
    float _869 = _863;
    if (_819)
    {
        _851 = _839;
    }
    float _871 = _851;
    float _873 = _871;
    if (_819)
    {
        _853 = _841;
    }
    float _875 = _853;
    float _877 = 1.0 / _867;
    float _879 = _875;
    if (!_819)
    {
        float _881 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _883 = _453 + _881;
        float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _887 = _381 + _885;
        float _889 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _891 = _883 * _883;
        float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _895 = _393 + _893;
        float _897 = fma(_887, _887, _891);
        float _899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _901 = fma(_895, _895, _897);
        float _903 = sqrt(_901);
        float _905 = _889 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _907 = -_453;
        float _909 = _907 + _821;
        float _911 = precise::min(_903, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _913 = _911 * _899;
        float _915 = -_393;
        float _917 = _915 + _841;
        float _919 = _905 * _913;
        float _921 = -_381;
        float _923 = _921 + _839;
        float _925 = fma(_909, _919, _453);
        float _927 = fma(_923, _919, _381);
        float _929 = fma(_917, _919, _393);
        _869 = _925;
        _873 = _927;
        _879 = _929;
    }
    float _931 = _869;
    float _933 = _873;
    float _935 = _879;
    if (_805)
    {
        _855 = 1.0;
    }
    float _937 = _855;
    float _939 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _941 = _877 * _939;
    float _943 = _937;
    if (!_805)
    {
        float _945 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _947 = _945 * 0.15915493667125701904296875;
        float _949 = _947 * 6.283185482025146484375;
        float _951 = cos(_949);
        float _953 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _955 = _953 * 0.15915493667125701904296875;
        float _957 = _947 * 6.283185482025146484375;
        float _959 = sin(_957);
        float _961 = 1.0 / _951;
        float _963 = _955 * 6.283185482025146484375;
        float _965 = cos(_963);
        float _967 = _959 * _961;
        float _969 = _955 * 6.283185482025146484375;
        float _971 = sin(_969);
        float _973 = _965 * _967;
        float _975 = 1.0 / _973;
        float _977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _979 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _977;
        float _981 = 1.0 / _979;
        float _983 = _971 * _975;
        float _985 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _987 = fma(_941, _983, _985);
        float _989 = _987 * _981;
        float _991 = precise::clamp(_989, 0.0, 1.0);
        _715 = _947;
        _861 = _991;
    }
    float _993 = _715;
    float _995 = _861;
    float _997 = _993;
    if (!_805)
    {
        float _999 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1001 = _999 * 0.15915493667125701904296875;
        float _1003 = _1001 * 6.283185482025146484375;
        float _1005 = cos(_1003);
        float _1007 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1009 = _1007 * 0.15915493667125701904296875;
        float _1011 = _1001 * 6.283185482025146484375;
        float _1013 = sin(_1011);
        float _1015 = 1.0 / _1005;
        float _1017 = _1009 * 6.283185482025146484375;
        float _1019 = cos(_1017);
        float _1021 = _1013 * _1015;
        float _1023 = _1009 * 6.283185482025146484375;
        float _1025 = sin(_1023);
        float _1027 = _1019 * _1021;
        float _1029 = 1.0 / _1027;
        float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1033 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1031;
        float _1035 = 1.0 / _1033;
        float _1037 = _1025 * _1029;
        float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1041 = fma(_941, _1037, _1039);
        float _1043 = _1041 * _1035;
        float _1045 = precise::clamp(_1043, 0.0, 1.0);
        float _1047 = -_1045;
        float _1049 = _1047 + 1.0;
        _857 = _1029;
        _943 = _1049;
    }
    float _1051 = _857;
    float _1053 = _943;
    float _1055 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1057 = _931 + _1055;
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1061 = _933 + _1059;
    float _1063 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1065 = _935 + _1063;
    float _1067 = _1057 * _1057;
    float _1069 = fma(_1061, _1061, _1067);
    float _1071 = fma(_1065, _1065, _1069);
    float _1073 = rsqrt(_1071);
    float _1075 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1077 = _1061 * _1075;
    float _1079 = _1065 * _1075;
    float _1081 = _1077 * _1077;
    float _1083 = _1079 * _1079;
    float _1085 = _1081 + _1083;
    float _1087 = sqrt(_1085);
    bool _1089 = _1087 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1091 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1093 = _1087 + _1091;
    float _1095 = _1051;
    float _1097 = _1093;
    float _1099 = _1057;
    if (_1089)
    {
        float _1101 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1095 = _1101;
    }
    float _1103 = _1095;
    if (_1089)
    {
        float _1105 = rsqrt(_1085);
        _997 = _1105;
    }
    float _1107 = _997;
    float _1109 = _1103;
    float _1111 = _1107;
    if (_1089)
    {
        float _1113 = _1093 * _1103;
        _1097 = _1113;
    }
    float _1115 = _1097;
    if (_1089)
    {
        float _1117 = _1115 * 0.15915493667125701904296875;
        _1109 = _1117;
    }
    float _1119 = _1109;
    float _1121 = _1065;
    float _1123 = _1119;
    if (_1089)
    {
        float _1125 = _1119 * 6.283185482025146484375;
        float _1127 = sin(_1125);
        _1121 = _1127;
    }
    float _1129 = _1121;
    float _1131 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1133 = precise::max(0.0, _1131);
    float _1135 = _1073;
    float _1137 = _1133;
    if (_1089)
    {
        float _1139 = _1119 * 6.283185482025146484375;
        float _1141 = cos(_1139);
        _1135 = _1141;
    }
    float _1143 = _1135;
    float _1145 = -_1075;
    float _1147 = -_1133;
    float _1149 = fma(_1057, _1145, _1147);
    float _1151 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1089)
    {
        float _1153 = _1149 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1099 = _1153;
    }
    float _1155 = _1099;
    float _1157 = _1155;
    if (!_1089)
    {
        _1123 = _1077;
    }
    float _1159 = _1123;
    float _1161 = fma(_381, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1163 = _1159;
    if (_1089)
    {
        float _1165 = fma(_1129, _1155, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1157 = _1165;
    }
    float _1167 = _1157;
    float _1169 = sqrt(_1071);
    float _1171 = _1167;
    float _1173 = _1143;
    if (_1089)
    {
        float _1175 = _1143 + (-1.0);
        _1137 = _1175;
    }
    float _1177 = _1137;
    float _1179 = _1177;
    if (_1089)
    {
        float _1181 = _1107 * _1167;
        _717 = _1181;
    }
    float _1183 = _717;
    if (!_1089)
    {
        _1111 = _1149;
    }
    float _1185 = _1111;
    float _1187 = _1185;
    if (_1089)
    {
        float _1189 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1151 = _1189;
    }
    float _1191 = _1151;
    if (_1089)
    {
        float _1193 = _1077 * _1183;
        _1163 = _1193;
    }
    float _1195 = _1163;
    if (!_1089)
    {
        _1179 = _1079;
    }
    float _1197 = _1179;
    float _1199 = _1197;
    if (_1089)
    {
        float _1201 = _1079 * _1183;
        _1199 = _1201;
    }
    float _1203 = _1199;
    if (!_1089)
    {
        _1171 = _1081;
    }
    float _1205 = _1171;
    float _1207 = _1205;
    if (_1089)
    {
        float _1209 = fma(_1149, _1143, _1191);
        _1187 = _1209;
    }
    float _1211 = _1187;
    if (_1089)
    {
        float _1213 = _1195 * _1195;
        _1207 = _1213;
    }
    float _1215 = _1207;
    float _1217 = _931 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1089)
    {
        _1173 = _1083;
    }
    float _1219 = _1173;
    float _1221 = _1219;
    if (_1089)
    {
        float _1223 = _1203 * _1203;
        _1221 = _1223;
    }
    float _1225 = _1221;
    float _1227 = fma(_1211, _1211, _1215);
    float _1229 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1217);
    float _1231 = floor(_1161);
    float _1233 = _1227 + _1225;
    float _1235 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1229);
    float _1237 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1239 = _1235 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1241 = rsqrt(_1233);
    float _1243 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1245 = fma(_1169, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1243);
    float _1247 = precise::clamp(_1245, 0.0, 1.0);
    float _1249 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1251 = -_1247;
    float _1253 = _1251 + 1.0;
    float _1255 = -_1249;
    float _1257 = fma(_1255, _1237, 1.0);
    float _1259 = _931 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1261 = fma(_393, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1263 = _931 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1265 = _931 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1267 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1259);
    float _1269 = abs(_1253);
    float _1271 = log2(_1269);
    float _1273 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1263);
    float _1275 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1265);
    float _1277 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1267);
    float _1279 = _1241 * _1195;
    float _1281 = _1241 * _1211;
    float _1283 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1273);
    float _1285 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1287 = _1279 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1289 = _1241 * _1203;
    float _1291 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1293 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1275);
    float _1295 = -_1287;
    float _1297 = fma(_1281, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1295);
    float _1299 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1301 = floor(_1261);
    float _1303 = -_1231;
    float _1305 = _1161 + _1303;
    float _1307 = -_1289;
    float _1309 = fma(_1307, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1297);
    float _1311 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1299);
    float _1313 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1315 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1317 = fma(_1309, -0.5, 0.5);
    float _1319 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1311);
    float _1321 = log2(_1257);
    float _1323 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1315);
    float _1325 = exp2(_1313);
    float _1327 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1329 = -_1301;
    float _1331 = _1261 + _1329;
    float _1333 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1319);
    float _1335 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1337 = sqrt(_1317);
    float _1339 = fma(_1309, 0.5, 0.5);
    float _1341 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1335);
    float _1343 = _1281 + 1.0;
    float _1345 = _1321 * 0.693147182464599609375;
    float _1347 = fma(_1339, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1349 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1341);
    float _1351 = 1.0 / _1333;
    float _1353 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1323);
    float _1355 = fma(_1339, _1347, -0.212114393711090087890625);
    float _1357 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1349);
    float2 _4015 = float2(_1305, _1331);
    float _1359 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4015, float2(0.0), isnan(_4015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4015, float2(0.0), isnan(_4015)), level(0.0)).x;
    float _1361 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1353);
    float _1363 = fma(_1339, _1355, 1.570728778839111328125);
    float _1365 = -_1281;
    float _1367 = fma(_1325, _1343, _1365);
    float _1369 = _1337 * 0.636619746685028076171875;
    float _1371 = -_1363;
    float _1373 = fma(_1369, _1371, 1.0);
    float _1375 = fma(_1367, 0.5, 0.5);
    float _1377 = _1361 * _1351;
    float _1379 = _1357 * _1351;
    float _1381 = _1345 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1383 = fma(_1377, 0.5, 0.5);
    float _1385 = fma(_1379, -0.5, 0.5);
    float3 _4065 = float3(_1383, _1385, _1381);
    float _1387 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4065, float3(0.0), isnan(_4065)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4065, float3(0.0), isnan(_4065)), level(0.0)).x;
    float3 _4076 = float3(_1383, _1385, _1381);
    float4 _1390 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4076, float3(0.0), isnan(_4076)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4076, float3(0.0), isnan(_4076)), level(0.0)).xyzw;
    float _1392 = _1390.x;
    float _1394 = _1390.y;
    float _1396 = _1390.z;
    float _1398 = _1390.w;
    float2 _4092 = float2(_1373, _1375);
    float3 _1402 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4092, float2(0.0), isnan(_4092)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4092, float2(0.0), isnan(_4092)), level(0.0)).xyz;
    float _1404 = _1402.x;
    float _1406 = _1402.y;
    float _1408 = _1402.z;
    float _1410 = abs(_941);
    float _1412 = log2(_1410);
    float _1414 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_74.x = _933;
    out.m_74.y = _931;
    out.m_74.z = _935;
    bool _1416 = _1169 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1418 = isnan(_1169);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1424 = _1420 || _1422;
    float _1426 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1414);
    float _1428 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1426);
    float _1430 = in.m_76.x;
    float _1432 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1428);
    float _1434 = _1412 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1436 = exp2(_1434);
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1440 = precise::clamp(_1438, 0.0, 1.0);
    float _1442 = fma(_1440, -2.0, 3.0);
    float _1444 = _1440 * _1440;
    float _1446 = _1444 * _1442;
    float _1448 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1450 = _941 <= 8000.0;
    bool _1452 = isnan(_941);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan(8000.0);
    bool _1458 = _1454 || _1456;
    float _1460 = float(_1458);
    float _1462 = -_1446;
    float _1464 = _1462 + 1.0;
    float _1466 = exp2(_1448);
    float _1468 = fma(_1464, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1446);
    float _1470 = _1432 + _1333;
    out.gl_Position.x = _1361;
    out.gl_Position.y = _1357;
    out.gl_Position.z = _1432;
    out.gl_Position.w = _1333;
    float _1472 = _1460 * _1468;
    float _1474 = _1470 * 0.5;
    float _1476 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_78.z = _1474;
    out.m_78.w = _1333;
    float _1478 = -_1466;
    float _1480 = _1478 + 1.0;
    float _1482 = _1333;
    float _1484 = _1432;
    float _1486 = _1357;
    float _1488 = _1361;
    if (!_1424)
    {
        _1482 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1490 = _1482;
    float _1492 = _1490;
    float _1494 = _1490;
    if (!_1424)
    {
        _1484 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1496 = _1484;
    float _1498 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1500 = _1496;
    float _1502 = _1496;
    if (!_1424)
    {
        _1486 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1504 = _1486;
    float _1506 = _1504;
    float _1508 = _1504;
    if (!_1424)
    {
        _1488 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1510 = _1488;
    float _1512 = -_1359;
    float _1514 = _1512 + 1.0;
    float _1516 = _1514 * _1476;
    float _1518 = precise::clamp(_1516, 0.0, 1.0);
    float _1520 = -_1518;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1524 = _1522 * _1430;
    float _1526 = _1524 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1528 = _1498 * _1387;
    float _1530 = -_1498;
    float _1532 = _1530 + 1.0;
    out.m_80.x = _1526;
    float _1534 = _1398 * _1528;
    float _1536 = _1408 * _1528;
    float _1538 = _1398 * _1532;
    float _1540 = fma(_1404, _1534, _1392);
    float _1542 = fma(_1406, _1534, _1394);
    float _1544 = fma(_1398, _1536, _1396);
    float _1546 = _995 * _1053;
    float _1548 = _1392;
    float _1550 = _1546;
    float _1552 = _1510;
    float _1554 = _1510;
    if (!_1424)
    {
        _1548 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1556 = _1548;
    out.m_82.x = _1540;
    out.m_82.y = _1542;
    out.m_82.z = _1544;
    out.m_82.w = _1538;
    float _1558 = _1546 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1560 = _1556;
    float _1562 = _1556;
    if (!_1424)
    {
        _1550 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1564 = _1550;
    bool _1566 = !_1424;
    float _1568 = _1564;
    float _1570 = _1564;
    if (!_1566)
    {
        bool _1572 = _1169 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1574 = isnan(_1169);
        bool _1576 = _1572 || _1574;
        bool _1578 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1580 = _1576 || _1578;
        if (!_1580)
        {
            float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1584 = _1169 + _1582;
            float _1586 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1588 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1586;
            float _1590 = 1.0 / _1588;
            float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1594 = _1592 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1598 = _1596 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1602 = _1600 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1604 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1606 = _1604 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1610 = _1608 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1612 = _1584 * _1590;
            float _1614 = precise::clamp(_1612, 0.0, 1.0);
            float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1618 = _1616 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1620 = fma(_1614, _1594, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1622 = fma(_1614, _1618, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1624 = fma(_1614, _1598, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1626 = fma(_1614, _1602, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1628 = fma(_1614, _1606, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1630 = fma(_1614, _1610, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1494 = _1622;
            _1554 = _1628;
            _1562 = _1620;
            _1508 = _1626;
            _1502 = _1624;
            _1570 = _1630;
            _1632 = true;
        }
        else
        {
            bool _1634 = _1169 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1636 = isnan(_1169);
            bool _1638 = _1634 || _1636;
            bool _1640 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1642 = _1638 || _1640;
            if (!_1642)
            {
                _1560 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1644 = _1560;
            _1562 = _1644;
            if (!_1642)
            {
                _1492 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1646 = _1492;
            _1494 = _1646;
            if (!_1642)
            {
                _1500 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1648 = _1500;
            _1502 = _1648;
            if (!_1642)
            {
                _1506 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1650 = _1506;
            _1508 = _1650;
            if (!_1642)
            {
                _1552 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1652 = _1552;
            _1554 = _1652;
            if (!_1642)
            {
                _1568 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1654 = _1568;
            bool _1656 = !_1642;
            _1570 = _1654;
            if (!_1656)
            {
                bool _1658 = _1169 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1660 = isnan(_1169);
                bool _1662 = _1658 || _1660;
                bool _1664 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1666 = _1662 || _1664;
                if (!_1666)
                {
                    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1670 = _1169 + _1668;
                    float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1674 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1672;
                    float _1676 = 1.0 / _1674;
                    float _1678 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1680 = _1678 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1684 = _1682 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1686 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1688 = _1686 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1692 = _1690 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1694 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1696 = _1694 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1698 = _1670 * _1676;
                    float _1700 = precise::clamp(_1698, 0.0, 1.0);
                    float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1704 = _1702 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1706 = fma(_1700, _1680, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1708 = fma(_1700, _1704, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1710 = fma(_1700, _1684, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1712 = fma(_1700, _1688, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1714 = fma(_1700, _1692, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1716 = fma(_1700, _1696, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1494 = _1708;
                    _1554 = _1714;
                    _1562 = _1706;
                    _1508 = _1712;
                    _1502 = _1710;
                    _1570 = _1716;
                    _1632 = true;
                }
                else
                {
                    _1494 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1554 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1562 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1508 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1502 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1570 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1632 = false;
    float _1718 = _1494;
    float _1720 = _1554;
    float _1722 = _1562;
    float _1724 = _1508;
    float _1726 = _1502;
    float _1728 = _1570;
    float _1730 = fma(_685, -0.5, 0.5);
    float _1732 = precise::clamp(_1730, 0.0, 1.0);
    float _1734 = -_1718;
    float _1736 = _1734 + _1720;
    float _1738 = _1558 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1740 = -_1722;
    float _1742 = _1740 + _1724;
    out.m_84.x = 0.0;
    float _1744 = fma(_1732, _1736, _1718);
    float _1746 = fma(_1732, _1742, _1722);
    out.m_51.x = _1738;
    float _1748 = -_1726;
    float _1750 = _1748 + _1728;
    float _1752 = _1744 * 0.586610972881317138671875;
    bool _1754 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1756 = fma(_1732, _1750, _1726);
    float _1758 = fma(_1746, 0.298911988735198974609375, _1752);
    bool _1760 = _995 > 0.0;
    bool _1762 = isnan(_995);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan(0.0);
    bool _1768 = _1764 || _1766;
    float _1770 = fma(_1756, 0.114477999508380889892578125, _1758);
    bool _1772 = _1053 <= 0.0;
    bool _1774 = !_1768;
    bool _1776 = _1772 || _1774;
    float _1778 = -_1770;
    float _1780 = _1746 + _1778;
    float _1782 = -_1770;
    float _1784 = _1744 + _1782;
    float _1786 = -_1770;
    float _1788 = _1756 + _1786;
    float _1790 = fma(_1780, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1770);
    float _1792 = fma(_1784, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1770);
    float _1794 = fma(_1788, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1770);
    bool _1796 = !_1754;
    if (!_1796)
    {
        float _1798 = -_931;
        float _1800 = _1798 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1802 = -_933;
        float _1804 = _1802 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1806 = -_935;
        float _1808 = _1806 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1810 = _1800 * _1800;
        float _1812 = fma(_1804, _1804, _1810);
        float _1814 = fma(_1808, _1808, _1812);
        float _1816 = sqrt(_1814);
        float _1818 = rsqrt(_1814);
        float _1820 = -_1816;
        float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1824 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1826 = precise::clamp(_1824, 0.0, 1.0);
        float _1828 = _1804 * _1818;
        float _1830 = _1800 * _1818;
        float _1832 = abs(_1826);
        float _1834 = log2(_1832);
        float _1836 = _1808 * _1818;
        float _1838 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1840 = _685 * _1830;
        float _1842 = -_1830;
        float _1844 = -_1838;
        float _1846 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1844);
        float _1848 = fma(_683, _1828, _1840);
        float _1850 = -_1836;
        float _1852 = fma(_1850, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1846);
        float _1854 = fma(_701, _1836, _1848);
        float _1856 = precise::clamp(_1854, 0.0, 1.0);
        float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1860 = _1852 + _1858;
        float _1862 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1864 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1866 = precise::clamp(_1864, 0.0, 1.0);
        float _1868 = exp2(_1862);
        float _1870 = _1868 * _1866;
        float _1872 = _1856 * _1870;
        float _1874 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1876 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1878 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _1874;
        out.m_84.y = _1876;
        out.m_84.z = _1878;
    }
    out.m_86.x = _1790;
    out.m_86.y = _1792;
    out.m_86.z = _1794;
    if (!_1776)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _1880 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1880;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1632 = false;
    bool _753 = false;
    bool _181 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1937 = as_type<float>(_121);
        out.gl_Position.z = _1937;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_53.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    if (_135)
    {
        float _143 = float(_105);
        _141 = _143;
    }
    float _145 = _141;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    if (_151)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _115;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2005 = as_type<float>(_157);
        out.gl_Position.z = _2005;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _161 = !_159;
    float _179;
    if (!_161)
    {
        float _163 = in.m_55.x;
        float _165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _167 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _169 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _171 = _169 * _165;
        float _173 = floor(_171);
        float _175 = -_173;
        float _177 = _171 + _175;
        _179 = _177;
        _181 = true;
    }
    else
    {
        float _183 = float(_105);
        float _185 = 1.0 / _183;
        float _187 = _139 * _185;
        _179 = _187;
    }
    _181 = false;
    float _189 = _179;
    float _191 = as_type<float>(int(gl_VertexIndex));
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _195 = _189 + _193;
    float _197 = in.m_55.x;
    float _199 = in.m_55.y;
    float _201 = in.m_55.z;
    float _203 = in.m_55.w;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _207 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _205;
    float _209 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _211 = 1.0 / _207;
    float _213 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _209);
    bool _215 = _189 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _217 = isnan(_189);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    bool _227 = _189 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _229 = isnan(_189);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _213);
    float _241 = -_225;
    float _243 = _241 + 1.0;
    float _245 = sqrt(_239);
    float _247 = _237 * _243;
    int _249 = as_type<int>(_191) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_191) & 2;
    bool _255 = _253 != 0;
    float _257 = -_237;
    float _259 = _257 + 1.0;
    float _261 = in.m_48.x;
    float _263 = in.m_48.y;
    float _265 = in.m_48.z;
    float _267 = _195 * _211;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = rsqrt(_239);
    float _279 = in.m_60.x;
    float _281 = in.m_60.y;
    float _283 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _285 = fma(_275, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _287 = _283 * _247;
    float _289 = precise::max(_245, 2.0);
    float _291 = _285 * _247;
    bool _293 = !_255;
    float _295 = _293 ? (-0.5) : 0.5;
    float _297 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[143].x, _287);
    bool _299 = !_251;
    float _301 = _299 ? (-0.5) : 0.5;
    float _303 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[143].y, _291);
    float _305 = precise::min(_289, 15.0);
    float _307 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].x, _297);
    bool _309 = _197 > 0.5;
    float _311 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].y, _303);
    bool _313 = _201 > 0.5;
    float _315 = fma(_305, 0.061538465321063995361328125, -0.12307693064212799072265625);
    float _317 = -_263;
    float _319 = _295 + _317;
    float _321 = -_261;
    float _323 = _301 + _321;
    float _325 = _263 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _327 = _199 > 0.5;
    float _329 = -_319;
    float _331 = fma(_319, _277, _329);
    float _333 = -_323;
    float _335 = fma(_323, _277, _333);
    float _337 = _311 * _281;
    float _339 = _307 * _279;
    float _341 = fma(_315, _331, _319);
    float _343 = fma(_315, _335, _323);
    float _345 = _337 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _347 = _339 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _349 = _341 + _263;
    float _351 = _343 + _261;
    float _353 = -_277;
    float _355 = fma(_353, _265, _265);
    float _357 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].x, _325);
    float _359 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _349);
    float _361 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _351);
    float _363 = _315 * _355;
    float _365 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[4].z, _357);
    float _367 = _345 * _359;
    float _369 = _347 * _361;
    float _371 = _263 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _373 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _363);
    float _375 = _367 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _377 = _367 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _379 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].x, _371);
    float _381 = _365 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _383 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[24].x, _375);
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[26].x, _377);
    float _387 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[6].z, _379);
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[24].z, _383);
    float _391 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[26].z, _385);
    float _393 = _387 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _395 = _389 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _397 = _391 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _399 = _263 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _401 = _367 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _403 = _381 + _395;
    float _405 = _393 + _397;
    float _407 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].x, _399);
    float _409 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _411 = _403 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _415 = _405 + _413;
    float _417 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[25].x, _401);
    float _419 = _411 * _411;
    float _421 = _415 * _415;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _425 = _423 != 0;
    out.m_62.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_62.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_62.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _427 = -_301;
    float _429 = _309 ? _427 : _301;
    float _431 = _419 + _421;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _435 = _433 != 0;
    float _437 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[5].z, _407);
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _441 = _439 != 0;
    float _443 = sqrt(_431);
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _447 = _445 != 0;
    float _449 = fma(_373, (*spvDescriptorSet0.vp_c8)._m0[25].z, _417);
    bool _451 = _203 > 0.5;
    float _453 = _437 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _455 = _449 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _457 = !_425;
    float _459 = _457 ? _301 : _429;
    float _461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _463 = -_301;
    int _465 = _313 ? as_type<int>(_463) : as_type<int>(_301);
    float _467 = _453 + _455;
    float _469 = -_295;
    int _471 = _327 ? as_type<int>(_469) : as_type<int>(_295);
    float _473 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    bool _475 = !_441;
    float _477 = _475 ? _301 : as_type<float>(_465);
    float _479 = _349 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _481 = -_295;
    int _483 = _451 ? as_type<int>(_481) : as_type<int>(_295);
    float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _487 = _443 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _489 = _479 * _479;
    bool _491 = !_435;
    float _493 = _491 ? _295 : as_type<float>(_471);
    bool _495 = !_447;
    float _497 = _495 ? _295 : as_type<float>(_483);
    float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _501 = _363;
    float _503 = _295;
    float _505 = _429;
    float _507 = _349;
    float _509 = _203;
    if (!_487)
    {
        _501 = _421;
    }
    float _511 = _501;
    float _513 = _511;
    if (!_487)
    {
        _503 = _419;
    }
    float _515 = _503;
    float _517 = _515;
    if (!_487)
    {
        _505 = _403;
    }
    float _519 = _505;
    float _521 = _519;
    if (!_487)
    {
        _507 = _405;
    }
    float _523 = _507;
    float _525 = _523;
    if (!_487)
    {
        _509 = _467;
    }
    float _527 = _509;
    bool _529 = !_487;
    float _531 = _527;
    if (!_529)
    {
        float _533 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _535 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _537 = _443 + _535;
        float _539 = _467 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _541 = rsqrt(_431);
        float _543 = _537 * _533;
        float _545 = _543 * 0.15915493667125701904296875;
        float _547 = _545 * 6.283185482025146484375;
        float _549 = sin(_547);
        float _551 = _545 * 6.283185482025146484375;
        float _553 = cos(_551);
        float _555 = fma(_549, _539, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _557 = _541 * _555;
        float _559 = _553 + (-1.0);
        float _561 = fma(_411, _557, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _563 = fma(_415, _557, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _565 = _559 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _567 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _569 = _561 + _567;
        float _571 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _573 = _563 + _571;
        float _575 = fma(_467, _553, _565);
        float _577 = _569 * _569;
        float _579 = _573 * _573;
        _531 = _575;
        _517 = _577;
        _513 = _579;
        _525 = _563;
        _521 = _561;
    }
    float _581 = _531;
    float _583 = _517;
    float _585 = _513;
    float _587 = _525;
    float _589 = _521;
    float _591 = fma(_473, _473, _489);
    float _593 = _479 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _595 = _351 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _597 = _479 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _599 = _479 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _601 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _603 = _581 + _601;
    float _605 = rsqrt(_591);
    float _607 = _459 + 0.5;
    float _609 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[24].x, _593);
    float _611 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[25].x, _597);
    float _613 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[26].x, _599);
    float _615 = fma(_603, _603, _583);
    float _617 = _607 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _619 = _477 + 0.5;
    float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _623 = _615 + _585;
    float _625 = _617 * _461;
    float _627 = _619 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _629 = -_497;
    float _631 = _629 + 0.5;
    float _633 = -_493;
    float _635 = _633 + 0.5;
    float _637 = _627 * _499;
    float _639 = _479 * _605;
    float _641 = _631 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _643 = _473 * _605;
    float _645 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _647 = _639 * _645;
    float _649 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _651 = _639 * _649;
    float _653 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _655 = _639 * _653;
    float _657 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[24].y, _647);
    float _659 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[25].y, _651);
    float _661 = _641 * _621;
    float _663 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[26].y, _655);
    float _665 = _635 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _667 = sqrt(_623);
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _681 = _665 * _485;
    float _683 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[24].z, _609);
    float _685 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[25].z, _611);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _689 = _669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _691 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[26].z, _613);
    out.m_64.x = _689;
    out.m_64.y = _691;
    out.m_64.z = _693;
    out.m_64.w = _687;
    bool _703 = _667 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _705 = isnan(_667);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _711 = _707 || _709;
    out.m_66.x = _695;
    out.m_66.y = _697;
    out.m_66.z = _699;
    out.m_68.x = _625;
    out.m_68.y = _681;
    out.m_68.z = _637;
    out.m_68.w = _661;
    out.m_70.x = _657;
    out.m_70.y = _659;
    out.m_70.z = _663;
    float _713 = _623;
    float _715 = _691;
    float _717 = _667;
    if (!_711)
    {
        _713 = 1.0;
    }
    float _719 = _713;
    out.m_72.x = _683;
    out.m_72.y = _685;
    out.m_72.z = _701;
    bool _721 = !_711;
    float _723 = _719;
    if (!_721)
    {
        bool _725 = _667 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _727 = isnan(_667);
        bool _729 = _725 || _727;
        bool _731 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _733 = _729 || _731;
        if (!_733)
        {
            float _735 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _737 = _667 + _735;
            float _739 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _741 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _739;
            float _743 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _745 = _743 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _747 = 1.0 / _741;
            float _749 = _737 * _747;
            float _751 = fma(_749, _745, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _723 = _751;
            _753 = true;
        }
        else
        {
            bool _755 = _667 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _757 = isnan(_667);
            bool _759 = _755 || _757;
            bool _761 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _763 = _759 || _761;
            if (!_763)
            {
                float _765 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _767 = _667 + _765;
                float _769 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _771 = _769 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _773 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _775 = _773 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _777 = 1.0 / _771;
                float _779 = _767 * _777;
                float _781 = fma(_779, _775, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _723 = _781;
                _753 = true;
            }
            else
            {
                _723 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _753 = false;
    float _783 = _723;
    float _785 = _453 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _787 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _789 = _581 + _787;
    float _791 = fma(_381, (*spvDescriptorSet0.vp_c8)._m0[11].x, _785);
    float _793 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _795 = _587 + _793;
    bool _797 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _799 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _801 = _797 || _799;
    bool _803 = isnan(0.5);
    bool _805 = _801 || _803;
    float _807 = fma(_393, (*spvDescriptorSet0.vp_c8)._m0[11].z, _791);
    float _809 = _453 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _811 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _813 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _815 = _811 || _813;
    bool _817 = isnan(0.5);
    bool _819 = _815 || _817;
    float _821 = fma(_789, _783, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _823 = _807 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _825 = fma(_381, (*spvDescriptorSet0.vp_c8)._m0[10].x, _809);
    float _827 = 1.0 / _823;
    float _829 = fma(_393, (*spvDescriptorSet0.vp_c8)._m0[10].z, _825);
    float _831 = _829 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _833 = _831 + _823;
    float _835 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _837 = _589 + _835;
    float _839 = fma(_837, _783, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _841 = fma(_795, _783, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _843 = _833 * _827;
    float _845 = _843 * 0.5;
    float _847 = _827;
    float _849 = _837;
    float _851 = _845;
    float _853 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _855 = _839;
    float _857 = _821;
    if (_805)
    {
        _847 = 1.0;
    }
    float _859 = _847;
    float _861 = _859;
    if (_819)
    {
        _849 = _821;
    }
    float _863 = _849;
    float _865 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _867 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[30].w, _865);
    float _869 = _863;
    if (_819)
    {
        _851 = _839;
    }
    float _871 = _851;
    float _873 = _871;
    if (_819)
    {
        _853 = _841;
    }
    float _875 = _853;
    float _877 = 1.0 / _867;
    float _879 = _875;
    if (!_819)
    {
        float _881 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _883 = _453 + _881;
        float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _887 = _381 + _885;
        float _889 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _891 = _883 * _883;
        float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _895 = _393 + _893;
        float _897 = fma(_887, _887, _891);
        float _899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _901 = fma(_895, _895, _897);
        float _903 = sqrt(_901);
        float _905 = _889 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _907 = -_453;
        float _909 = _907 + _821;
        float _911 = precise::min(_903, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _913 = _911 * _899;
        float _915 = -_393;
        float _917 = _915 + _841;
        float _919 = _905 * _913;
        float _921 = -_381;
        float _923 = _921 + _839;
        float _925 = fma(_909, _919, _453);
        float _927 = fma(_923, _919, _381);
        float _929 = fma(_917, _919, _393);
        _869 = _925;
        _873 = _927;
        _879 = _929;
    }
    float _931 = _869;
    float _933 = _873;
    float _935 = _879;
    if (_805)
    {
        _855 = 1.0;
    }
    float _937 = _855;
    float _939 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _941 = _877 * _939;
    float _943 = _937;
    if (!_805)
    {
        float _945 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _947 = _945 * 0.15915493667125701904296875;
        float _949 = _947 * 6.283185482025146484375;
        float _951 = cos(_949);
        float _953 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _955 = _953 * 0.15915493667125701904296875;
        float _957 = _947 * 6.283185482025146484375;
        float _959 = sin(_957);
        float _961 = 1.0 / _951;
        float _963 = _955 * 6.283185482025146484375;
        float _965 = cos(_963);
        float _967 = _959 * _961;
        float _969 = _955 * 6.283185482025146484375;
        float _971 = sin(_969);
        float _973 = _965 * _967;
        float _975 = 1.0 / _973;
        float _977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _979 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _977;
        float _981 = 1.0 / _979;
        float _983 = _971 * _975;
        float _985 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _987 = fma(_941, _983, _985);
        float _989 = _987 * _981;
        float _991 = precise::clamp(_989, 0.0, 1.0);
        _715 = _947;
        _861 = _991;
    }
    float _993 = _715;
    float _995 = _861;
    float _997 = _993;
    if (!_805)
    {
        float _999 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1001 = _999 * 0.15915493667125701904296875;
        float _1003 = _1001 * 6.283185482025146484375;
        float _1005 = cos(_1003);
        float _1007 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1009 = _1007 * 0.15915493667125701904296875;
        float _1011 = _1001 * 6.283185482025146484375;
        float _1013 = sin(_1011);
        float _1015 = 1.0 / _1005;
        float _1017 = _1009 * 6.283185482025146484375;
        float _1019 = cos(_1017);
        float _1021 = _1013 * _1015;
        float _1023 = _1009 * 6.283185482025146484375;
        float _1025 = sin(_1023);
        float _1027 = _1019 * _1021;
        float _1029 = 1.0 / _1027;
        float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1033 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1031;
        float _1035 = 1.0 / _1033;
        float _1037 = _1025 * _1029;
        float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1041 = fma(_941, _1037, _1039);
        float _1043 = _1041 * _1035;
        float _1045 = precise::clamp(_1043, 0.0, 1.0);
        float _1047 = -_1045;
        float _1049 = _1047 + 1.0;
        _857 = _1029;
        _943 = _1049;
    }
    float _1051 = _857;
    float _1053 = _943;
    float _1055 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1057 = _931 + _1055;
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1061 = _933 + _1059;
    float _1063 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1065 = _935 + _1063;
    float _1067 = _1057 * _1057;
    float _1069 = fma(_1061, _1061, _1067);
    float _1071 = fma(_1065, _1065, _1069);
    float _1073 = rsqrt(_1071);
    float _1075 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1077 = _1061 * _1075;
    float _1079 = _1065 * _1075;
    float _1081 = _1077 * _1077;
    float _1083 = _1079 * _1079;
    float _1085 = _1081 + _1083;
    float _1087 = sqrt(_1085);
    bool _1089 = _1087 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1091 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1093 = _1087 + _1091;
    float _1095 = _1051;
    float _1097 = _1093;
    float _1099 = _1057;
    if (_1089)
    {
        float _1101 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1095 = _1101;
    }
    float _1103 = _1095;
    if (_1089)
    {
        float _1105 = rsqrt(_1085);
        _997 = _1105;
    }
    float _1107 = _997;
    float _1109 = _1103;
    float _1111 = _1107;
    if (_1089)
    {
        float _1113 = _1093 * _1103;
        _1097 = _1113;
    }
    float _1115 = _1097;
    if (_1089)
    {
        float _1117 = _1115 * 0.15915493667125701904296875;
        _1109 = _1117;
    }
    float _1119 = _1109;
    float _1121 = _1065;
    float _1123 = _1119;
    if (_1089)
    {
        float _1125 = _1119 * 6.283185482025146484375;
        float _1127 = sin(_1125);
        _1121 = _1127;
    }
    float _1129 = _1121;
    float _1131 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1133 = precise::max(0.0, _1131);
    float _1135 = _1073;
    float _1137 = _1133;
    if (_1089)
    {
        float _1139 = _1119 * 6.283185482025146484375;
        float _1141 = cos(_1139);
        _1135 = _1141;
    }
    float _1143 = _1135;
    float _1145 = -_1075;
    float _1147 = -_1133;
    float _1149 = fma(_1057, _1145, _1147);
    float _1151 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1089)
    {
        float _1153 = _1149 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1099 = _1153;
    }
    float _1155 = _1099;
    float _1157 = _1155;
    if (!_1089)
    {
        _1123 = _1077;
    }
    float _1159 = _1123;
    float _1161 = fma(_381, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1163 = _1159;
    if (_1089)
    {
        float _1165 = fma(_1129, _1155, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1157 = _1165;
    }
    float _1167 = _1157;
    float _1169 = sqrt(_1071);
    float _1171 = _1167;
    float _1173 = _1143;
    if (_1089)
    {
        float _1175 = _1143 + (-1.0);
        _1137 = _1175;
    }
    float _1177 = _1137;
    float _1179 = _1177;
    if (_1089)
    {
        float _1181 = _1107 * _1167;
        _717 = _1181;
    }
    float _1183 = _717;
    if (!_1089)
    {
        _1111 = _1149;
    }
    float _1185 = _1111;
    float _1187 = _1185;
    if (_1089)
    {
        float _1189 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1151 = _1189;
    }
    float _1191 = _1151;
    if (_1089)
    {
        float _1193 = _1077 * _1183;
        _1163 = _1193;
    }
    float _1195 = _1163;
    if (!_1089)
    {
        _1179 = _1079;
    }
    float _1197 = _1179;
    float _1199 = _1197;
    if (_1089)
    {
        float _1201 = _1079 * _1183;
        _1199 = _1201;
    }
    float _1203 = _1199;
    if (!_1089)
    {
        _1171 = _1081;
    }
    float _1205 = _1171;
    float _1207 = _1205;
    if (_1089)
    {
        float _1209 = fma(_1149, _1143, _1191);
        _1187 = _1209;
    }
    float _1211 = _1187;
    if (_1089)
    {
        float _1213 = _1195 * _1195;
        _1207 = _1213;
    }
    float _1215 = _1207;
    float _1217 = _931 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1089)
    {
        _1173 = _1083;
    }
    float _1219 = _1173;
    float _1221 = _1219;
    if (_1089)
    {
        float _1223 = _1203 * _1203;
        _1221 = _1223;
    }
    float _1225 = _1221;
    float _1227 = fma(_1211, _1211, _1215);
    float _1229 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1217);
    float _1231 = floor(_1161);
    float _1233 = _1227 + _1225;
    float _1235 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1229);
    float _1237 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1239 = _1235 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1241 = rsqrt(_1233);
    float _1243 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1245 = fma(_1169, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1243);
    float _1247 = precise::clamp(_1245, 0.0, 1.0);
    float _1249 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1251 = -_1247;
    float _1253 = _1251 + 1.0;
    float _1255 = -_1249;
    float _1257 = fma(_1255, _1237, 1.0);
    float _1259 = _931 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1261 = fma(_393, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1263 = _931 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1265 = _931 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1267 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1259);
    float _1269 = abs(_1253);
    float _1271 = log2(_1269);
    float _1273 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1263);
    float _1275 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1265);
    float _1277 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1267);
    float _1279 = _1241 * _1195;
    float _1281 = _1241 * _1211;
    float _1283 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1273);
    float _1285 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1287 = _1279 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1289 = _1241 * _1203;
    float _1291 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1293 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1275);
    float _1295 = -_1287;
    float _1297 = fma(_1281, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1295);
    float _1299 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1301 = floor(_1261);
    float _1303 = -_1231;
    float _1305 = _1161 + _1303;
    float _1307 = -_1289;
    float _1309 = fma(_1307, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1297);
    float _1311 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1299);
    float _1313 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1315 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1317 = fma(_1309, -0.5, 0.5);
    float _1319 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1311);
    float _1321 = log2(_1257);
    float _1323 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1315);
    float _1325 = exp2(_1313);
    float _1327 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1329 = -_1301;
    float _1331 = _1261 + _1329;
    float _1333 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1319);
    float _1335 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1337 = sqrt(_1317);
    float _1339 = fma(_1309, 0.5, 0.5);
    float _1341 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1335);
    float _1343 = _1281 + 1.0;
    float _1345 = _1321 * 0.693147182464599609375;
    float _1347 = fma(_1339, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1349 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1341);
    float _1351 = 1.0 / _1333;
    float _1353 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1323);
    float _1355 = fma(_1339, _1347, -0.212114393711090087890625);
    float _1357 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1349);
    float2 _4015 = float2(_1305, _1331);
    float _1359 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4015, float2(0.0), isnan(_4015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4015, float2(0.0), isnan(_4015)), level(0.0)).x;
    float _1361 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1353);
    float _1363 = fma(_1339, _1355, 1.570728778839111328125);
    float _1365 = -_1281;
    float _1367 = fma(_1325, _1343, _1365);
    float _1369 = _1337 * 0.636619746685028076171875;
    float _1371 = -_1363;
    float _1373 = fma(_1369, _1371, 1.0);
    float _1375 = fma(_1367, 0.5, 0.5);
    float _1377 = _1361 * _1351;
    float _1379 = _1357 * _1351;
    float _1381 = _1345 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1383 = fma(_1377, 0.5, 0.5);
    float _1385 = fma(_1379, -0.5, 0.5);
    float3 _4065 = float3(_1383, _1385, _1381);
    float _1387 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4065, float3(0.0), isnan(_4065)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4065, float3(0.0), isnan(_4065)), level(0.0)).x;
    float3 _4076 = float3(_1383, _1385, _1381);
    float4 _1390 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4076, float3(0.0), isnan(_4076)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4076, float3(0.0), isnan(_4076)), level(0.0)).xyzw;
    float _1392 = _1390.x;
    float _1394 = _1390.y;
    float _1396 = _1390.z;
    float _1398 = _1390.w;
    float2 _4092 = float2(_1373, _1375);
    float3 _1402 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4092, float2(0.0), isnan(_4092)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4092, float2(0.0), isnan(_4092)), level(0.0)).xyz;
    float _1404 = _1402.x;
    float _1406 = _1402.y;
    float _1408 = _1402.z;
    float _1410 = abs(_941);
    float _1412 = log2(_1410);
    float _1414 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_74.x = _933;
    out.m_74.y = _931;
    out.m_74.z = _935;
    bool _1416 = _1169 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1418 = isnan(_1169);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1424 = _1420 || _1422;
    float _1426 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1414);
    float _1428 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1426);
    float _1430 = in.m_76.x;
    float _1432 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1428);
    float _1434 = _1412 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1436 = exp2(_1434);
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1440 = precise::clamp(_1438, 0.0, 1.0);
    float _1442 = fma(_1440, -2.0, 3.0);
    float _1444 = _1440 * _1440;
    float _1446 = _1444 * _1442;
    float _1448 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1450 = _941 <= 8000.0;
    bool _1452 = isnan(_941);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan(8000.0);
    bool _1458 = _1454 || _1456;
    float _1460 = float(_1458);
    float _1462 = -_1446;
    float _1464 = _1462 + 1.0;
    float _1466 = exp2(_1448);
    float _1468 = fma(_1464, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1446);
    float _1470 = _1432 + _1333;
    out.gl_Position.x = _1361;
    out.gl_Position.y = _1357;
    out.gl_Position.z = _1432;
    out.gl_Position.w = _1333;
    float _1472 = _1460 * _1468;
    float _1474 = _1470 * 0.5;
    float _1476 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_78.z = _1474;
    out.m_78.w = _1333;
    float _1478 = -_1466;
    float _1480 = _1478 + 1.0;
    float _1482 = _1333;
    float _1484 = _1432;
    float _1486 = _1357;
    float _1488 = _1361;
    if (!_1424)
    {
        _1482 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1490 = _1482;
    float _1492 = _1490;
    float _1494 = _1490;
    if (!_1424)
    {
        _1484 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1496 = _1484;
    float _1498 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1500 = _1496;
    float _1502 = _1496;
    if (!_1424)
    {
        _1486 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1504 = _1486;
    float _1506 = _1504;
    float _1508 = _1504;
    if (!_1424)
    {
        _1488 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1510 = _1488;
    float _1512 = -_1359;
    float _1514 = _1512 + 1.0;
    float _1516 = _1514 * _1476;
    float _1518 = precise::clamp(_1516, 0.0, 1.0);
    float _1520 = -_1518;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1524 = _1522 * _1430;
    float _1526 = _1524 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1528 = _1498 * _1387;
    float _1530 = -_1498;
    float _1532 = _1530 + 1.0;
    out.m_80.x = _1526;
    float _1534 = _1398 * _1528;
    float _1536 = _1408 * _1528;
    float _1538 = _1398 * _1532;
    float _1540 = fma(_1404, _1534, _1392);
    float _1542 = fma(_1406, _1534, _1394);
    float _1544 = fma(_1398, _1536, _1396);
    float _1546 = _995 * _1053;
    float _1548 = _1392;
    float _1550 = _1546;
    float _1552 = _1510;
    float _1554 = _1510;
    if (!_1424)
    {
        _1548 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1556 = _1548;
    out.m_82.x = _1540;
    out.m_82.y = _1542;
    out.m_82.z = _1544;
    out.m_82.w = _1538;
    float _1558 = _1546 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1560 = _1556;
    float _1562 = _1556;
    if (!_1424)
    {
        _1550 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1564 = _1550;
    bool _1566 = !_1424;
    float _1568 = _1564;
    float _1570 = _1564;
    if (!_1566)
    {
        bool _1572 = _1169 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1574 = isnan(_1169);
        bool _1576 = _1572 || _1574;
        bool _1578 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1580 = _1576 || _1578;
        if (!_1580)
        {
            float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1584 = _1169 + _1582;
            float _1586 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1588 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1586;
            float _1590 = 1.0 / _1588;
            float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1594 = _1592 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1598 = _1596 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1602 = _1600 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1604 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1606 = _1604 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1610 = _1608 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1612 = _1584 * _1590;
            float _1614 = precise::clamp(_1612, 0.0, 1.0);
            float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1618 = _1616 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1620 = fma(_1614, _1594, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1622 = fma(_1614, _1618, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1624 = fma(_1614, _1598, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1626 = fma(_1614, _1602, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1628 = fma(_1614, _1606, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1630 = fma(_1614, _1610, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1494 = _1622;
            _1554 = _1628;
            _1562 = _1620;
            _1508 = _1626;
            _1502 = _1624;
            _1570 = _1630;
            _1632 = true;
        }
        else
        {
            bool _1634 = _1169 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1636 = isnan(_1169);
            bool _1638 = _1634 || _1636;
            bool _1640 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1642 = _1638 || _1640;
            if (!_1642)
            {
                _1560 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1644 = _1560;
            _1562 = _1644;
            if (!_1642)
            {
                _1492 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1646 = _1492;
            _1494 = _1646;
            if (!_1642)
            {
                _1500 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1648 = _1500;
            _1502 = _1648;
            if (!_1642)
            {
                _1506 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1650 = _1506;
            _1508 = _1650;
            if (!_1642)
            {
                _1552 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1652 = _1552;
            _1554 = _1652;
            if (!_1642)
            {
                _1568 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1654 = _1568;
            bool _1656 = !_1642;
            _1570 = _1654;
            if (!_1656)
            {
                bool _1658 = _1169 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1660 = isnan(_1169);
                bool _1662 = _1658 || _1660;
                bool _1664 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1666 = _1662 || _1664;
                if (!_1666)
                {
                    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1670 = _1169 + _1668;
                    float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1674 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1672;
                    float _1676 = 1.0 / _1674;
                    float _1678 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1680 = _1678 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1684 = _1682 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1686 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1688 = _1686 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1692 = _1690 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1694 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1696 = _1694 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1698 = _1670 * _1676;
                    float _1700 = precise::clamp(_1698, 0.0, 1.0);
                    float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1704 = _1702 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1706 = fma(_1700, _1680, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1708 = fma(_1700, _1704, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1710 = fma(_1700, _1684, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1712 = fma(_1700, _1688, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1714 = fma(_1700, _1692, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1716 = fma(_1700, _1696, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1494 = _1708;
                    _1554 = _1714;
                    _1562 = _1706;
                    _1508 = _1712;
                    _1502 = _1710;
                    _1570 = _1716;
                    _1632 = true;
                }
                else
                {
                    _1494 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1554 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1562 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1508 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1502 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1570 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1632 = false;
    float _1718 = _1494;
    float _1720 = _1554;
    float _1722 = _1562;
    float _1724 = _1508;
    float _1726 = _1502;
    float _1728 = _1570;
    float _1730 = fma(_685, -0.5, 0.5);
    float _1732 = precise::clamp(_1730, 0.0, 1.0);
    float _1734 = -_1718;
    float _1736 = _1734 + _1720;
    float _1738 = _1558 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1740 = -_1722;
    float _1742 = _1740 + _1724;
    out.m_84.x = 0.0;
    float _1744 = fma(_1732, _1736, _1718);
    float _1746 = fma(_1732, _1742, _1722);
    out.m_51.x = _1738;
    float _1748 = -_1726;
    float _1750 = _1748 + _1728;
    float _1752 = _1744 * 0.586610972881317138671875;
    bool _1754 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1756 = fma(_1732, _1750, _1726);
    float _1758 = fma(_1746, 0.298911988735198974609375, _1752);
    bool _1760 = _995 > 0.0;
    bool _1762 = isnan(_995);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan(0.0);
    bool _1768 = _1764 || _1766;
    float _1770 = fma(_1756, 0.114477999508380889892578125, _1758);
    bool _1772 = _1053 <= 0.0;
    bool _1774 = !_1768;
    bool _1776 = _1772 || _1774;
    float _1778 = -_1770;
    float _1780 = _1746 + _1778;
    float _1782 = -_1770;
    float _1784 = _1744 + _1782;
    float _1786 = -_1770;
    float _1788 = _1756 + _1786;
    float _1790 = fma(_1780, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1770);
    float _1792 = fma(_1784, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1770);
    float _1794 = fma(_1788, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1770);
    bool _1796 = !_1754;
    if (!_1796)
    {
        float _1798 = -_931;
        float _1800 = _1798 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1802 = -_933;
        float _1804 = _1802 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1806 = -_935;
        float _1808 = _1806 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1810 = _1800 * _1800;
        float _1812 = fma(_1804, _1804, _1810);
        float _1814 = fma(_1808, _1808, _1812);
        float _1816 = sqrt(_1814);
        float _1818 = rsqrt(_1814);
        float _1820 = -_1816;
        float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1824 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1826 = precise::clamp(_1824, 0.0, 1.0);
        float _1828 = _1804 * _1818;
        float _1830 = _1800 * _1818;
        float _1832 = abs(_1826);
        float _1834 = log2(_1832);
        float _1836 = _1808 * _1818;
        float _1838 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1840 = _685 * _1830;
        float _1842 = -_1830;
        float _1844 = -_1838;
        float _1846 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1844);
        float _1848 = fma(_683, _1828, _1840);
        float _1850 = -_1836;
        float _1852 = fma(_1850, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1846);
        float _1854 = fma(_701, _1836, _1848);
        float _1856 = precise::clamp(_1854, 0.0, 1.0);
        float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1860 = _1852 + _1858;
        float _1862 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1864 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1866 = precise::clamp(_1864, 0.0, 1.0);
        float _1868 = exp2(_1862);
        float _1870 = _1868 * _1866;
        float _1872 = _1856 * _1870;
        float _1874 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1876 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1878 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _1874;
        out.m_84.y = _1876;
        out.m_84.z = _1878;
    }
    out.m_86.x = _1790;
    out.m_86.y = _1792;
    out.m_86.z = _1794;
    if (!_1776)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _1880 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1880;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

