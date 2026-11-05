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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_66 [[user(locn0)]];
    float4 m_68 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_70 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_54 [[attribute(5)]];
    float4 m_42 [[attribute(6)]];
    float4 m_47 [[attribute(7)]];
    float4 m_49 [[attribute(8)]];
    float4 m_62 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _413 = false;
    bool _313 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1457 = as_type<float>(_105);
        out.gl_Position.z = _1457;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1526 = as_type<float>(_141);
        out.gl_Position.z = _1526;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = in.m_54.x;
    float _153 = in.m_54.y;
    float _155 = in.m_54.z;
    float _157 = in.m_56.x;
    float _159 = in.m_56.y;
    float _161 = in.m_56.z;
    float _163 = in.m_58.x;
    float _165 = in.m_58.y;
    float _167 = in.m_58.z;
    float _169 = _147 * _145;
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    float _177 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    int _179 = as_type<int>(_149) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_149) & 2;
    bool _185 = _183 != 0;
    float _187 = _177 * 6.283185482025146484375;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = floor(_177);
    float _195 = _187 * 0.15915493667125701904296875;
    bool _197 = !_185;
    float _199 = _197 ? (-0.5) : 0.5;
    int _201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _203 = _201 != 0;
    int _205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _207 = _205 != 0;
    float _209 = _153 * _159;
    bool _211 = !_191;
    int _213 = _211 ? 0 : 1;
    float _215 = _195 * 6.283185482025146484375;
    float _217 = cos(_215);
    float _219 = _153 * _165;
    bool _221 = !_203;
    int _223 = _221 ? 0 : 1;
    float _225 = fma(_151, _157, _209);
    bool _227 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _229 = _153 * _173;
    int _231 = abs(_223);
    float _233 = fma(_151, _163, _219);
    float _235 = -_193;
    float _237 = _177 + _235;
    float _239 = fma(_151, _171, _229);
    int _241 = abs(_213);
    float _243 = -_237;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _247 = !_207;
    int _249 = _247 ? 0 : 1;
    float _251 = float(_231);
    float _253 = fma(_217, 0.5, 0.5);
    int _255 = abs(_249);
    bool _257 = _237 < 0.5;
    float _259 = float(_257);
    float _261 = abs(_245);
    float _263 = _251 * _261;
    float _265 = float(_241);
    float _267 = -_253;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = -_259;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _275 = fma(_155, _167, _233);
    float _277 = fma(_265, _269, _263);
    float _279 = float(_255);
    float _281 = fma(_155, _161, _225);
    float _283 = fma(_155, _175, _239);
    bool _285 = !_181;
    float _287 = _285 ? (-0.5) : 0.5;
    float _289 = abs(_273);
    float _291 = fma(_279, _289, _277);
    bool _293 = !_227;
    float _295 = _283;
    float _311;
    if (!_293)
    {
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _299 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_89);
        float _317 = 1.0 / _315;
        float _319 = _123 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = _321 + _323;
    bool _327 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_321);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _339;
    float _343 = -_337;
    float _345 = _343 + 1.0;
    bool _347 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _349 = isnan(_321);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _365 = 1.0 / _341;
    float _367 = _357 * _345;
    float _369 = -_357;
    float _371 = _369 + 1.0;
    float _373 = _325 * _365;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _375;
    float _379 = fma(_361, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _381 = fma(_377, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _383 = _379 * _367;
    float _385 = _381 * _367;
    float _387 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _383);
    float _389 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _385);
    float _391 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[144].x, _387);
    float _393 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[144].y, _389);
    bool _395 = !_363;
    float _411;
    if (!_395)
    {
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _399 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _411 = _409;
        _413 = true;
    }
    else
    {
        float _415 = float(_89);
        float _417 = 1.0 / _415;
        float _419 = _123 * _417;
        _411 = _419;
    }
    _413 = false;
    float _421 = _411;
    float _423 = in.m_62.x;
    float _425 = in.m_62.y;
    float _427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _429 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _287);
    float _431 = in.m_42.x;
    float _433 = in.m_42.y;
    float _435 = in.m_42.z;
    float _437 = in.m_60.w;
    float _439 = in.m_56.w;
    float _441 = _393 * _425;
    float _443 = _391 * _423;
    float _445 = _291 * _441;
    float _447 = _291 * _443;
    float _449 = _173 * _433;
    float _451 = _159 * _433;
    float _453 = _445 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _455 = _447 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _457 = fma(_171, _431, _449);
    float _459 = fma(_157, _431, _451);
    float _461 = _453 * _427;
    float _463 = _455 * _429;
    float _465 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _467 = _165 * _433;
    float _469 = _461 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _471 = _461 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _473 = fma(_163, _431, _467);
    float _475 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].x, _469);
    float _477 = fma(_175, _435, _457);
    float _479 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].x, _471);
    float _481 = fma(_167, _435, _473);
    float _483 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[26].z, _475);
    float _485 = fma(_161, _435, _459);
    float _487 = _477 + _437;
    float _489 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[24].z, _479);
    float _491 = _483 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _493 = _485 + _439;
    float _495 = in.m_58.w;
    float _497 = _489 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _499 = _487 + _491;
    float _501 = _493 + _497;
    float _503 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _505 = _499 + _503;
    float _507 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _509 = _501 + _507;
    float _511 = _505 * _505;
    float _513 = fma(_509, _509, _511);
    float _515 = _461 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _517 = sqrt(_513);
    float _519 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].x, _515);
    float _521 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[25].z, _519);
    float _523 = _481 + _495;
    float _525 = _521 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _527 = _523 + _525;
    bool _529 = _517 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _531 = _515;
    float _533 = _525;
    float _535 = _501;
    if (!_529)
    {
        _531 = _501;
    }
    float _537 = _531;
    float _539 = _537;
    if (!_529)
    {
        _533 = _499;
    }
    float _541 = _533;
    float _543 = _541;
    if (!_529)
    {
        _535 = _527;
    }
    float _545 = _535;
    bool _547 = !_529;
    float _549 = _545;
    if (!_547)
    {
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _553 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _555 = _517 + _553;
        float _557 = _527 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _559 = _555 * _551;
        float _561 = rsqrt(_513);
        float _563 = _559 * 0.15915493667125701904296875;
        float _565 = _563 * 6.283185482025146484375;
        float _567 = cos(_565);
        float _569 = _563 * 6.283185482025146484375;
        float _571 = sin(_569);
        float _573 = _567 + (-1.0);
        float _575 = _573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _577 = fma(_571, _557, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _579 = fma(_527, _567, _575);
        float _581 = _561 * _577;
        float _583 = fma(_509, _581, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _585 = fma(_505, _581, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _549 = _579;
        _539 = _583;
        _543 = _585;
    }
    float _587 = _549;
    float _589 = _539;
    float _591 = _543;
    float _593 = -_523;
    float _595 = _593 + _587;
    float _597 = -_493;
    float _599 = _597 + _589;
    float _601 = -_487;
    float _603 = _601 + _591;
    float _605 = _523 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _607 = _595 * _595;
    bool _609 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _611 = isnan(0.5);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _617 = _613 || _615;
    float _619 = fma(_599, _599, _607);
    bool _621 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _623 = isnan(0.5);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _629 = _625 || _627;
    float _631 = fma(_603, _603, _619);
    float _633 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[11].x, _605);
    float _635 = _523 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _637 = sqrt(_631);
    float _639 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[11].z, _633);
    float _641 = _639 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _643 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[10].x, _635);
    float _645 = 1.0 / _641;
    float _647 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[10].z, _643);
    float _649 = _647 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _651 = _637 > 0.0;
    float _653 = _649 + _641;
    float _655 = _653 * _645;
    float _657 = _655 * 0.5;
    bool _659 = !_651;
    float _661 = _589;
    float _663 = _587;
    float _665 = _591;
    float _667 = _631;
    float _669 = _637;
    float _671 = _599;
    float _673 = _595;
    if (!_659)
    {
        float _675 = _275 * _275;
        float _677 = rsqrt(_631);
        float _679 = fma(_281, _281, _675);
        float _681 = fma(_283, _283, _679);
        float _683 = sqrt(_681);
        float _685 = _599 * _677;
        float _687 = _595 * _677;
        float _689 = _603 * _677;
        bool _691 = _683 > 0.0;
        bool _693 = !_691;
        _667 = _677;
        _669 = _683;
        if (!_693)
        {
            float _695 = rsqrt(_681);
            float _697 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _699 = _275 * _695;
            float _701 = _281 * _695;
            float _703 = _687 * _699;
            float _705 = _283 * _695;
            float _707 = fma(_685, _701, _703);
            float _709 = _697 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _711 = fma(_689, _705, _707);
            float _713 = _711 * _709;
            float _715 = fma(_281, _713, _589);
            float _717 = fma(_275, _713, _587);
            float _719 = fma(_283, _713, _591);
            _661 = _715;
            _663 = _717;
            _665 = _719;
            _667 = _701;
            _669 = _711;
            _671 = _713;
        }
    }
    float _721 = _661;
    float _723 = _663;
    float _725 = _665;
    float _727 = _667;
    float _729 = _669;
    float _731 = _671;
    float _733 = _727;
    float _735 = _723;
    float _737 = _721;
    float _739 = _725;
    float _741 = _729;
    float _743 = _731;
    if (_629)
    {
        _733 = 1.0;
    }
    float _745 = _733;
    float _747 = _745;
    if (!_617)
    {
        float _749 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _751 = _523 + _749;
        float _753 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _755 = _493 + _753;
        float _757 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _759 = -_493;
        float _761 = _759 + _721;
        float _763 = _751 * _751;
        float _765 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _767 = _487 + _765;
        float _769 = fma(_755, _755, _763);
        float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _773 = fma(_767, _767, _769);
        float _775 = sqrt(_773);
        float _777 = _757 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _779 = precise::min(_775, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _781 = _779 * _771;
        float _783 = _777 * _781;
        float _785 = -_523;
        float _787 = _785 + _723;
        float _789 = -_487;
        float _791 = _789 + _725;
        float _793 = fma(_761, _783, _493);
        float _795 = fma(_787, _783, _523);
        float _797 = fma(_791, _783, _487);
        _735 = _795;
        _737 = _793;
        _739 = _797;
        _295 = _757;
        _741 = _791;
    }
    float _799 = _735;
    float _801 = _737;
    float _803 = _739;
    float _805 = _295;
    float _807 = _741;
    float _809 = _807;
    float _811 = _805;
    if (!_629)
    {
        float _813 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _815 = _813 * 0.15915493667125701904296875;
        float _817 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _819 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _821 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[30].w, _819);
        float _823 = _815 * 6.283185482025146484375;
        float _825 = cos(_823);
        float _827 = _817 * 0.15915493667125701904296875;
        float _829 = _815 * 6.283185482025146484375;
        float _831 = sin(_829);
        float _833 = 1.0 / _825;
        float _835 = _827 * 6.283185482025146484375;
        float _837 = cos(_835);
        float _839 = _831 * _833;
        float _841 = _827 * 6.283185482025146484375;
        float _843 = sin(_841);
        float _845 = _837 * _839;
        float _847 = 1.0 / _821;
        float _849 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _851 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _849;
        float _853 = 1.0 / _845;
        float _855 = 1.0 / _851;
        float _857 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _859 = _847 * _857;
        float _861 = _843 * _853;
        float _863 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _865 = fma(_861, _859, _863);
        float _867 = _865 * _855;
        float _869 = precise::clamp(_867, 0.0, 1.0);
        _809 = _827;
        _747 = _869;
    }
    float _871 = _809;
    float _873 = _747;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _877 = _799 + _875;
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _881 = _801 + _879;
    float _883 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _885 = _803 + _883;
    float _887 = _877 * _877;
    float _889 = fma(_881, _881, _887);
    float _891 = fma(_885, _885, _889);
    float _893 = rsqrt(_891);
    float _895 = _893 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _897 = _881 * _895;
    float _899 = _885 * _895;
    float _901 = _897 * _897;
    float _903 = _899 * _899;
    float _905 = _901 + _903;
    float _907 = sqrt(_905);
    bool _909 = _907 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _911 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _913 = _907 + _911;
    float _915 = _885;
    float _917 = _905;
    float _919 = _913;
    float _921 = _897;
    float _923 = _901;
    if (_909)
    {
        float _925 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _915 = _925;
    }
    float _927 = _915;
    if (_909)
    {
        float _929 = rsqrt(_905);
        _917 = _929;
    }
    float _931 = _917;
    if (_909)
    {
        float _933 = _913 * _927;
        _919 = _933;
    }
    float _935 = _919;
    if (_909)
    {
        float _937 = _935 * 0.15915493667125701904296875;
        _811 = _937;
    }
    float _939 = _811;
    float _941 = _893;
    if (_909)
    {
        float _943 = _939 * 6.283185482025146484375;
        float _945 = sin(_943);
        _941 = _945;
    }
    float _947 = _941;
    float _949 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _951 = precise::max(0.0, _949);
    float _953 = _871;
    float _955 = _951;
    float _957 = _949;
    if (_909)
    {
        float _959 = _939 * 6.283185482025146484375;
        float _961 = cos(_959);
        _953 = _961;
    }
    float _963 = _953;
    float _965 = -_895;
    float _967 = -_951;
    float _969 = fma(_877, _965, _967);
    if (_909)
    {
        float _971 = _969 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _955 = _971;
    }
    float _973 = _955;
    float _975 = sqrt(_891);
    float _977 = _973;
    float _979 = _947;
    if (_909)
    {
        float _981 = fma(_947, _973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _977 = _981;
    }
    float _983 = _977;
    float _985 = _983;
    if (!_909)
    {
        _979 = _969;
    }
    float _987 = _979;
    float _989 = _987;
    if (_909)
    {
        float _991 = _963 + (-1.0);
        _957 = _991;
    }
    float _993 = _957;
    float _995 = _993;
    if (_909)
    {
        float _997 = _931 * _983;
        _673 = _997;
    }
    float _999 = _673;
    if (!_909)
    {
        _985 = _899;
    }
    float _1001 = _985;
    float _1003 = _1001;
    if (_909)
    {
        float _1005 = _993 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _743 = _1005;
    }
    float _1007 = _743;
    if (_909)
    {
        float _1009 = _897 * _999;
        _921 = _1009;
    }
    float _1011 = _921;
    if (_909)
    {
        float _1013 = _899 * _999;
        _1003 = _1013;
    }
    float _1015 = _1003;
    if (!_909)
    {
        _995 = _903;
    }
    float _1017 = _995;
    float _1019 = _1017;
    if (_909)
    {
        float _1021 = fma(_969, _963, _1007);
        _989 = _1021;
    }
    float _1023 = _989;
    if (_909)
    {
        float _1025 = _1011 * _1011;
        _923 = _1025;
    }
    float _1027 = _923;
    if (_909)
    {
        float _1029 = _1015 * _1015;
        _1019 = _1029;
    }
    float _1031 = _1019;
    float _1033 = fma(_1023, _1023, _1027);
    float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1037 = fma(_975, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1035);
    float _1039 = precise::clamp(_1037, 0.0, 1.0);
    float _1041 = _1033 + _1031;
    float _1043 = _799 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1045 = -_1039;
    float _1047 = _1045 + 1.0;
    float _1049 = rsqrt(_1041);
    float _1051 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1043);
    float _1053 = _799 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1055 = _799 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1057 = _799 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1059 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1051);
    float _1061 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1053);
    float _1063 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1055);
    float _1065 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1057);
    float _1067 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1069 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1061);
    float _1071 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1063);
    float _1073 = abs(_1047);
    float _1075 = log2(_1073);
    float _1077 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1065);
    float _1079 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1081 = _1071 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1083 = _1049 * _1011;
    float _1085 = _1049 * _1023;
    float _1087 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1089 = _1049 * _1015;
    float _1091 = _1083 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1093 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1095 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1087);
    float _1097 = _1067 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1099 = -_1091;
    float _1101 = fma(_1085, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1099);
    float _1103 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1105 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1095);
    float _1107 = -_1097;
    float _1109 = fma(_1107, _1093, 1.0);
    float _1111 = -_1089;
    float _1113 = fma(_1111, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1101);
    float _1115 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1117 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1105);
    float _1119 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1121 = fma(_1113, -0.5, 0.5);
    float _1123 = log2(_1109);
    float _1125 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1127 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1119);
    float _1129 = fma(_1113, 0.5, 0.5);
    float _1131 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1125);
    float _1133 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1127);
    float _1135 = fma(_1129, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1137 = 1.0 / _1117;
    float _1139 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1131);
    float _1141 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1133);
    float _1143 = fma(_1129, _1135, -0.212114393711090087890625);
    float _1145 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1139);
    float _1147 = fma(_1129, _1143, 1.570728778839111328125);
    float _1149 = exp2(_1115);
    float _1151 = _1123 * 0.693147182464599609375;
    float _1153 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1155 = sqrt(_1121);
    float _1157 = _1085 + 1.0;
    float _1159 = _1141 * _1137;
    float _1161 = _1145 * _1137;
    float _1163 = fma(_1159, 0.5, 0.5);
    float _1165 = fma(_1161, -0.5, 0.5);
    float _1167 = -_1085;
    float _1169 = fma(_1149, _1157, _1167);
    float _1171 = fma(_1169, 0.5, 0.5);
    float _1173 = _1155 * 0.636619746685028076171875;
    float _1175 = -_1147;
    float _1177 = fma(_1173, _1175, 1.0);
    float3 _3124 = float3(_1163, _1165, _1153);
    float _1179 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3124, float3(0.0), isnan(_3124)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3124, float3(0.0), isnan(_3124)), level(0.0)).x;
    float3 _3135 = float3(_1163, _1165, _1153);
    float4 _1182 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3135, float3(0.0), isnan(_3135)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3135, float3(0.0), isnan(_3135)), level(0.0)).xyzw;
    float _1184 = _1182.x;
    float _1186 = _1182.y;
    float _1188 = _1182.z;
    float _1190 = _1182.w;
    float2 _3152 = float2(_1177, _1171);
    float3 _1194 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3152, float2(0.0), isnan(_3152)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3152, float2(0.0), isnan(_3152)), level(0.0)).xyz;
    float _1196 = _1194.x;
    float _1198 = _1194.y;
    float _1200 = _1194.z;
    float _1202 = in.m_49.y;
    float _1204 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1206 = _143 > 0.5;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1210 = _421 + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1212;
    float _1216 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1204);
    float _1218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1222 = _1220 != 0;
    float _1224 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1216);
    float _1226 = 1.0 / _1214;
    bool _1228 = _1202 > 0.5;
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1232 = -_287;
    int _1234 = _1206 ? as_type<int>(_1232) : as_type<int>(_287);
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1238 = _1236 != 0;
    float _1240 = -_199;
    int _1242 = _1228 ? as_type<int>(_1240) : as_type<int>(_199);
    float _1244 = _1210 * _1226;
    bool _1246 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1248 = isnan(_421);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    bool _1258 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1260 = isnan(_421);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1266 = _1262 || _1264;
    float _1268 = float(_1266);
    bool _1270 = !_1238;
    float _1272 = _1270 ? _199 : as_type<float>(_1242);
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1274;
    bool _1278 = !_1222;
    float _1280 = _1278 ? _287 : as_type<float>(_1234);
    float _1282 = -_1268;
    float _1284 = _1282 + 1.0;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1286;
    float _1290 = fma(_1276, _1244, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1292 = _1256 * _1284;
    float _1294 = -_1272;
    float _1296 = _1294 + 0.5;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1298;
    float _1302 = fma(_1288, _1244, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1304 = _1290 * _1292;
    float _1306 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1308 = fma(_1300, _1244, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1310 = _1302 * _1292;
    float _1312 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1224);
    float _1314 = exp2(_1306);
    float _1316 = _1308 * _1292;
    float _1318 = -_1256;
    float _1320 = _1318 + 1.0;
    float _1322 = _1280 + 0.5;
    float _1324 = _873 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1326 = _873 > 0.0;
    bool _1328 = isnan(_873);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(0.0);
    bool _1334 = _1330 || _1332;
    float _1336 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1304);
    float _1338 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1310);
    float _1340 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1316);
    float _1342 = _1312 + _1117;
    float _1344 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1346 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1336);
    float _1348 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1338);
    float _1350 = _1342 * 0.5;
    float _1352 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1340);
    float _1354 = _1344 * _1218;
    float _1356 = -_1314;
    float _1358 = _1356 + 1.0;
    float _1360 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1362 = _1346 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1364 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1366 = _1324 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1368 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1370 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1372 = -_1364;
    float _1374 = _1372 + 1.0;
    out.gl_Position.x = _1141;
    out.gl_Position.y = _1145;
    out.gl_Position.z = _1312;
    out.gl_Position.w = _1117;
    float _1376 = _1360 * _1230;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1380 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1382 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1384 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _1354;
    out.m_64.y = _1376;
    out.m_66.x = _1380;
    out.m_66.y = _1382;
    out.m_66.z = _1384;
    out.m_66.w = _1378;
    out.m_68.z = _1350;
    out.m_68.w = _1117;
    out.m_45.x = _1366;
    float _1386 = _1364 * _1179;
    float _1388 = _1190 * _1374;
    float _1390 = _1190 * _1386;
    float _1392 = _1200 * _1386;
    float _1394 = fma(_1196, _1390, _1184);
    float _1396 = fma(_1198, _1390, _1186);
    float _1398 = fma(_1190, _1392, _1188);
    out.m_70.x = _1394;
    out.m_70.y = _1396;
    out.m_70.z = _1398;
    out.m_70.w = _1388;
    if (_1334)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1400 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1400;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _413 = false;
    bool _313 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1457 = as_type<float>(_105);
        out.gl_Position.z = _1457;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1526 = as_type<float>(_141);
        out.gl_Position.z = _1526;
    }
    if (_133)
    {
        return out;
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = in.m_54.x;
    float _153 = in.m_54.y;
    float _155 = in.m_54.z;
    float _157 = in.m_56.x;
    float _159 = in.m_56.y;
    float _161 = in.m_56.z;
    float _163 = in.m_58.x;
    float _165 = in.m_58.y;
    float _167 = in.m_58.z;
    float _169 = _147 * _145;
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    float _177 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    int _179 = as_type<int>(_149) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_149) & 2;
    bool _185 = _183 != 0;
    float _187 = _177 * 6.283185482025146484375;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = floor(_177);
    float _195 = _187 * 0.15915493667125701904296875;
    bool _197 = !_185;
    float _199 = _197 ? (-0.5) : 0.5;
    int _201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _203 = _201 != 0;
    int _205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _207 = _205 != 0;
    float _209 = _153 * _159;
    bool _211 = !_191;
    int _213 = _211 ? 0 : 1;
    float _215 = _195 * 6.283185482025146484375;
    float _217 = cos(_215);
    float _219 = _153 * _165;
    bool _221 = !_203;
    int _223 = _221 ? 0 : 1;
    float _225 = fma(_151, _157, _209);
    bool _227 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _229 = _153 * _173;
    int _231 = abs(_223);
    float _233 = fma(_151, _163, _219);
    float _235 = -_193;
    float _237 = _177 + _235;
    float _239 = fma(_151, _171, _229);
    int _241 = abs(_213);
    float _243 = -_237;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _247 = !_207;
    int _249 = _247 ? 0 : 1;
    float _251 = float(_231);
    float _253 = fma(_217, 0.5, 0.5);
    int _255 = abs(_249);
    bool _257 = _237 < 0.5;
    float _259 = float(_257);
    float _261 = abs(_245);
    float _263 = _251 * _261;
    float _265 = float(_241);
    float _267 = -_253;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = -_259;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _275 = fma(_155, _167, _233);
    float _277 = fma(_265, _269, _263);
    float _279 = float(_255);
    float _281 = fma(_155, _161, _225);
    float _283 = fma(_155, _175, _239);
    bool _285 = !_181;
    float _287 = _285 ? (-0.5) : 0.5;
    float _289 = abs(_273);
    float _291 = fma(_279, _289, _277);
    bool _293 = !_227;
    float _295 = _283;
    float _311;
    if (!_293)
    {
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _299 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_89);
        float _317 = 1.0 / _315;
        float _319 = _123 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = _321 + _323;
    bool _327 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_321);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _339;
    float _343 = -_337;
    float _345 = _343 + 1.0;
    bool _347 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _349 = isnan(_321);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _365 = 1.0 / _341;
    float _367 = _357 * _345;
    float _369 = -_357;
    float _371 = _369 + 1.0;
    float _373 = _325 * _365;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _375;
    float _379 = fma(_361, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _381 = fma(_377, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _383 = _379 * _367;
    float _385 = _381 * _367;
    float _387 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _383);
    float _389 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _385);
    float _391 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[144].x, _387);
    float _393 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[144].y, _389);
    bool _395 = !_363;
    float _411;
    if (!_395)
    {
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _399 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _411 = _409;
        _413 = true;
    }
    else
    {
        float _415 = float(_89);
        float _417 = 1.0 / _415;
        float _419 = _123 * _417;
        _411 = _419;
    }
    _413 = false;
    float _421 = _411;
    float _423 = in.m_62.x;
    float _425 = in.m_62.y;
    float _427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _429 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _287);
    float _431 = in.m_42.x;
    float _433 = in.m_42.y;
    float _435 = in.m_42.z;
    float _437 = in.m_60.w;
    float _439 = in.m_56.w;
    float _441 = _393 * _425;
    float _443 = _391 * _423;
    float _445 = _291 * _441;
    float _447 = _291 * _443;
    float _449 = _173 * _433;
    float _451 = _159 * _433;
    float _453 = _445 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _455 = _447 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _457 = fma(_171, _431, _449);
    float _459 = fma(_157, _431, _451);
    float _461 = _453 * _427;
    float _463 = _455 * _429;
    float _465 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _467 = _165 * _433;
    float _469 = _461 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _471 = _461 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _473 = fma(_163, _431, _467);
    float _475 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].x, _469);
    float _477 = fma(_175, _435, _457);
    float _479 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].x, _471);
    float _481 = fma(_167, _435, _473);
    float _483 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[26].z, _475);
    float _485 = fma(_161, _435, _459);
    float _487 = _477 + _437;
    float _489 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[24].z, _479);
    float _491 = _483 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _493 = _485 + _439;
    float _495 = in.m_58.w;
    float _497 = _489 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _499 = _487 + _491;
    float _501 = _493 + _497;
    float _503 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _505 = _499 + _503;
    float _507 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _509 = _501 + _507;
    float _511 = _505 * _505;
    float _513 = fma(_509, _509, _511);
    float _515 = _461 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _517 = sqrt(_513);
    float _519 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].x, _515);
    float _521 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[25].z, _519);
    float _523 = _481 + _495;
    float _525 = _521 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _527 = _523 + _525;
    bool _529 = _517 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _531 = _515;
    float _533 = _525;
    float _535 = _501;
    if (!_529)
    {
        _531 = _501;
    }
    float _537 = _531;
    float _539 = _537;
    if (!_529)
    {
        _533 = _499;
    }
    float _541 = _533;
    float _543 = _541;
    if (!_529)
    {
        _535 = _527;
    }
    float _545 = _535;
    bool _547 = !_529;
    float _549 = _545;
    if (!_547)
    {
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _553 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _555 = _517 + _553;
        float _557 = _527 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _559 = _555 * _551;
        float _561 = rsqrt(_513);
        float _563 = _559 * 0.15915493667125701904296875;
        float _565 = _563 * 6.283185482025146484375;
        float _567 = cos(_565);
        float _569 = _563 * 6.283185482025146484375;
        float _571 = sin(_569);
        float _573 = _567 + (-1.0);
        float _575 = _573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _577 = fma(_571, _557, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _579 = fma(_527, _567, _575);
        float _581 = _561 * _577;
        float _583 = fma(_509, _581, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _585 = fma(_505, _581, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _549 = _579;
        _539 = _583;
        _543 = _585;
    }
    float _587 = _549;
    float _589 = _539;
    float _591 = _543;
    float _593 = -_523;
    float _595 = _593 + _587;
    float _597 = -_493;
    float _599 = _597 + _589;
    float _601 = -_487;
    float _603 = _601 + _591;
    float _605 = _523 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _607 = _595 * _595;
    bool _609 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _611 = isnan(0.5);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _617 = _613 || _615;
    float _619 = fma(_599, _599, _607);
    bool _621 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _623 = isnan(0.5);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _629 = _625 || _627;
    float _631 = fma(_603, _603, _619);
    float _633 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[11].x, _605);
    float _635 = _523 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _637 = sqrt(_631);
    float _639 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[11].z, _633);
    float _641 = _639 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _643 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[10].x, _635);
    float _645 = 1.0 / _641;
    float _647 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[10].z, _643);
    float _649 = _647 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _651 = _637 > 0.0;
    float _653 = _649 + _641;
    float _655 = _653 * _645;
    float _657 = _655 * 0.5;
    bool _659 = !_651;
    float _661 = _589;
    float _663 = _587;
    float _665 = _591;
    float _667 = _631;
    float _669 = _637;
    float _671 = _599;
    float _673 = _595;
    if (!_659)
    {
        float _675 = _275 * _275;
        float _677 = rsqrt(_631);
        float _679 = fma(_281, _281, _675);
        float _681 = fma(_283, _283, _679);
        float _683 = sqrt(_681);
        float _685 = _599 * _677;
        float _687 = _595 * _677;
        float _689 = _603 * _677;
        bool _691 = _683 > 0.0;
        bool _693 = !_691;
        _667 = _677;
        _669 = _683;
        if (!_693)
        {
            float _695 = rsqrt(_681);
            float _697 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _699 = _275 * _695;
            float _701 = _281 * _695;
            float _703 = _687 * _699;
            float _705 = _283 * _695;
            float _707 = fma(_685, _701, _703);
            float _709 = _697 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _711 = fma(_689, _705, _707);
            float _713 = _711 * _709;
            float _715 = fma(_281, _713, _589);
            float _717 = fma(_275, _713, _587);
            float _719 = fma(_283, _713, _591);
            _661 = _715;
            _663 = _717;
            _665 = _719;
            _667 = _701;
            _669 = _711;
            _671 = _713;
        }
    }
    float _721 = _661;
    float _723 = _663;
    float _725 = _665;
    float _727 = _667;
    float _729 = _669;
    float _731 = _671;
    float _733 = _727;
    float _735 = _723;
    float _737 = _721;
    float _739 = _725;
    float _741 = _729;
    float _743 = _731;
    if (_629)
    {
        _733 = 1.0;
    }
    float _745 = _733;
    float _747 = _745;
    if (!_617)
    {
        float _749 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _751 = _523 + _749;
        float _753 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _755 = _493 + _753;
        float _757 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _759 = -_493;
        float _761 = _759 + _721;
        float _763 = _751 * _751;
        float _765 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _767 = _487 + _765;
        float _769 = fma(_755, _755, _763);
        float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _773 = fma(_767, _767, _769);
        float _775 = sqrt(_773);
        float _777 = _757 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _779 = precise::min(_775, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _781 = _779 * _771;
        float _783 = _777 * _781;
        float _785 = -_523;
        float _787 = _785 + _723;
        float _789 = -_487;
        float _791 = _789 + _725;
        float _793 = fma(_761, _783, _493);
        float _795 = fma(_787, _783, _523);
        float _797 = fma(_791, _783, _487);
        _735 = _795;
        _737 = _793;
        _739 = _797;
        _295 = _757;
        _741 = _791;
    }
    float _799 = _735;
    float _801 = _737;
    float _803 = _739;
    float _805 = _295;
    float _807 = _741;
    float _809 = _807;
    float _811 = _805;
    if (!_629)
    {
        float _813 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _815 = _813 * 0.15915493667125701904296875;
        float _817 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _819 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _821 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[30].w, _819);
        float _823 = _815 * 6.283185482025146484375;
        float _825 = cos(_823);
        float _827 = _817 * 0.15915493667125701904296875;
        float _829 = _815 * 6.283185482025146484375;
        float _831 = sin(_829);
        float _833 = 1.0 / _825;
        float _835 = _827 * 6.283185482025146484375;
        float _837 = cos(_835);
        float _839 = _831 * _833;
        float _841 = _827 * 6.283185482025146484375;
        float _843 = sin(_841);
        float _845 = _837 * _839;
        float _847 = 1.0 / _821;
        float _849 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _851 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _849;
        float _853 = 1.0 / _845;
        float _855 = 1.0 / _851;
        float _857 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _859 = _847 * _857;
        float _861 = _843 * _853;
        float _863 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _865 = fma(_861, _859, _863);
        float _867 = _865 * _855;
        float _869 = precise::clamp(_867, 0.0, 1.0);
        _809 = _827;
        _747 = _869;
    }
    float _871 = _809;
    float _873 = _747;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _877 = _799 + _875;
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _881 = _801 + _879;
    float _883 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _885 = _803 + _883;
    float _887 = _877 * _877;
    float _889 = fma(_881, _881, _887);
    float _891 = fma(_885, _885, _889);
    float _893 = rsqrt(_891);
    float _895 = _893 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _897 = _881 * _895;
    float _899 = _885 * _895;
    float _901 = _897 * _897;
    float _903 = _899 * _899;
    float _905 = _901 + _903;
    float _907 = sqrt(_905);
    bool _909 = _907 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _911 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _913 = _907 + _911;
    float _915 = _885;
    float _917 = _905;
    float _919 = _913;
    float _921 = _897;
    float _923 = _901;
    if (_909)
    {
        float _925 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _915 = _925;
    }
    float _927 = _915;
    if (_909)
    {
        float _929 = rsqrt(_905);
        _917 = _929;
    }
    float _931 = _917;
    if (_909)
    {
        float _933 = _913 * _927;
        _919 = _933;
    }
    float _935 = _919;
    if (_909)
    {
        float _937 = _935 * 0.15915493667125701904296875;
        _811 = _937;
    }
    float _939 = _811;
    float _941 = _893;
    if (_909)
    {
        float _943 = _939 * 6.283185482025146484375;
        float _945 = sin(_943);
        _941 = _945;
    }
    float _947 = _941;
    float _949 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _951 = precise::max(0.0, _949);
    float _953 = _871;
    float _955 = _951;
    float _957 = _949;
    if (_909)
    {
        float _959 = _939 * 6.283185482025146484375;
        float _961 = cos(_959);
        _953 = _961;
    }
    float _963 = _953;
    float _965 = -_895;
    float _967 = -_951;
    float _969 = fma(_877, _965, _967);
    if (_909)
    {
        float _971 = _969 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _955 = _971;
    }
    float _973 = _955;
    float _975 = sqrt(_891);
    float _977 = _973;
    float _979 = _947;
    if (_909)
    {
        float _981 = fma(_947, _973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _977 = _981;
    }
    float _983 = _977;
    float _985 = _983;
    if (!_909)
    {
        _979 = _969;
    }
    float _987 = _979;
    float _989 = _987;
    if (_909)
    {
        float _991 = _963 + (-1.0);
        _957 = _991;
    }
    float _993 = _957;
    float _995 = _993;
    if (_909)
    {
        float _997 = _931 * _983;
        _673 = _997;
    }
    float _999 = _673;
    if (!_909)
    {
        _985 = _899;
    }
    float _1001 = _985;
    float _1003 = _1001;
    if (_909)
    {
        float _1005 = _993 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _743 = _1005;
    }
    float _1007 = _743;
    if (_909)
    {
        float _1009 = _897 * _999;
        _921 = _1009;
    }
    float _1011 = _921;
    if (_909)
    {
        float _1013 = _899 * _999;
        _1003 = _1013;
    }
    float _1015 = _1003;
    if (!_909)
    {
        _995 = _903;
    }
    float _1017 = _995;
    float _1019 = _1017;
    if (_909)
    {
        float _1021 = fma(_969, _963, _1007);
        _989 = _1021;
    }
    float _1023 = _989;
    if (_909)
    {
        float _1025 = _1011 * _1011;
        _923 = _1025;
    }
    float _1027 = _923;
    if (_909)
    {
        float _1029 = _1015 * _1015;
        _1019 = _1029;
    }
    float _1031 = _1019;
    float _1033 = fma(_1023, _1023, _1027);
    float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1037 = fma(_975, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1035);
    float _1039 = precise::clamp(_1037, 0.0, 1.0);
    float _1041 = _1033 + _1031;
    float _1043 = _799 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1045 = -_1039;
    float _1047 = _1045 + 1.0;
    float _1049 = rsqrt(_1041);
    float _1051 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1043);
    float _1053 = _799 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1055 = _799 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1057 = _799 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1059 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1051);
    float _1061 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1053);
    float _1063 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1055);
    float _1065 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1057);
    float _1067 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1069 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1061);
    float _1071 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1063);
    float _1073 = abs(_1047);
    float _1075 = log2(_1073);
    float _1077 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1065);
    float _1079 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1081 = _1071 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1083 = _1049 * _1011;
    float _1085 = _1049 * _1023;
    float _1087 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1089 = _1049 * _1015;
    float _1091 = _1083 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1093 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1095 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1087);
    float _1097 = _1067 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1099 = -_1091;
    float _1101 = fma(_1085, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1099);
    float _1103 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1105 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1095);
    float _1107 = -_1097;
    float _1109 = fma(_1107, _1093, 1.0);
    float _1111 = -_1089;
    float _1113 = fma(_1111, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1101);
    float _1115 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1117 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1105);
    float _1119 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1121 = fma(_1113, -0.5, 0.5);
    float _1123 = log2(_1109);
    float _1125 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1127 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1119);
    float _1129 = fma(_1113, 0.5, 0.5);
    float _1131 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1125);
    float _1133 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1127);
    float _1135 = fma(_1129, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1137 = 1.0 / _1117;
    float _1139 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1131);
    float _1141 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1133);
    float _1143 = fma(_1129, _1135, -0.212114393711090087890625);
    float _1145 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1139);
    float _1147 = fma(_1129, _1143, 1.570728778839111328125);
    float _1149 = exp2(_1115);
    float _1151 = _1123 * 0.693147182464599609375;
    float _1153 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1155 = sqrt(_1121);
    float _1157 = _1085 + 1.0;
    float _1159 = _1141 * _1137;
    float _1161 = _1145 * _1137;
    float _1163 = fma(_1159, 0.5, 0.5);
    float _1165 = fma(_1161, -0.5, 0.5);
    float _1167 = -_1085;
    float _1169 = fma(_1149, _1157, _1167);
    float _1171 = fma(_1169, 0.5, 0.5);
    float _1173 = _1155 * 0.636619746685028076171875;
    float _1175 = -_1147;
    float _1177 = fma(_1173, _1175, 1.0);
    float3 _3124 = float3(_1163, _1165, _1153);
    float _1179 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3124, float3(0.0), isnan(_3124)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3124, float3(0.0), isnan(_3124)), level(0.0)).x;
    float3 _3135 = float3(_1163, _1165, _1153);
    float4 _1182 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3135, float3(0.0), isnan(_3135)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3135, float3(0.0), isnan(_3135)), level(0.0)).xyzw;
    float _1184 = _1182.x;
    float _1186 = _1182.y;
    float _1188 = _1182.z;
    float _1190 = _1182.w;
    float2 _3152 = float2(_1177, _1171);
    float3 _1194 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3152, float2(0.0), isnan(_3152)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3152, float2(0.0), isnan(_3152)), level(0.0)).xyz;
    float _1196 = _1194.x;
    float _1198 = _1194.y;
    float _1200 = _1194.z;
    float _1202 = in.m_49.y;
    float _1204 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1206 = _143 > 0.5;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1210 = _421 + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1212;
    float _1216 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1204);
    float _1218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1222 = _1220 != 0;
    float _1224 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1216);
    float _1226 = 1.0 / _1214;
    bool _1228 = _1202 > 0.5;
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1232 = -_287;
    int _1234 = _1206 ? as_type<int>(_1232) : as_type<int>(_287);
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1238 = _1236 != 0;
    float _1240 = -_199;
    int _1242 = _1228 ? as_type<int>(_1240) : as_type<int>(_199);
    float _1244 = _1210 * _1226;
    bool _1246 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1248 = isnan(_421);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    bool _1258 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1260 = isnan(_421);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1266 = _1262 || _1264;
    float _1268 = float(_1266);
    bool _1270 = !_1238;
    float _1272 = _1270 ? _199 : as_type<float>(_1242);
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1274;
    bool _1278 = !_1222;
    float _1280 = _1278 ? _287 : as_type<float>(_1234);
    float _1282 = -_1268;
    float _1284 = _1282 + 1.0;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1286;
    float _1290 = fma(_1276, _1244, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1292 = _1256 * _1284;
    float _1294 = -_1272;
    float _1296 = _1294 + 0.5;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1298;
    float _1302 = fma(_1288, _1244, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1304 = _1290 * _1292;
    float _1306 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1308 = fma(_1300, _1244, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1310 = _1302 * _1292;
    float _1312 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1224);
    float _1314 = exp2(_1306);
    float _1316 = _1308 * _1292;
    float _1318 = -_1256;
    float _1320 = _1318 + 1.0;
    float _1322 = _1280 + 0.5;
    float _1324 = _873 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1326 = _873 > 0.0;
    bool _1328 = isnan(_873);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(0.0);
    bool _1334 = _1330 || _1332;
    float _1336 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1304);
    float _1338 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1310);
    float _1340 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1316);
    float _1342 = _1312 + _1117;
    float _1344 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1346 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1336);
    float _1348 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1338);
    float _1350 = _1342 * 0.5;
    float _1352 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1340);
    float _1354 = _1344 * _1218;
    float _1356 = -_1314;
    float _1358 = _1356 + 1.0;
    float _1360 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1362 = _1346 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1364 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1366 = _1324 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1368 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1370 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1372 = -_1364;
    float _1374 = _1372 + 1.0;
    out.gl_Position.x = _1141;
    out.gl_Position.y = _1145;
    out.gl_Position.z = _1312;
    out.gl_Position.w = _1117;
    float _1376 = _1360 * _1230;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1380 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1382 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1384 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _1354;
    out.m_64.y = _1376;
    out.m_66.x = _1380;
    out.m_66.y = _1382;
    out.m_66.z = _1384;
    out.m_66.w = _1378;
    out.m_68.z = _1350;
    out.m_68.w = _1117;
    out.m_45.x = _1366;
    float _1386 = _1364 * _1179;
    float _1388 = _1190 * _1374;
    float _1390 = _1190 * _1386;
    float _1392 = _1200 * _1386;
    float _1394 = fma(_1196, _1390, _1184);
    float _1396 = fma(_1198, _1390, _1186);
    float _1398 = fma(_1190, _1392, _1188);
    out.m_70.x = _1394;
    out.m_70.y = _1396;
    out.m_70.z = _1398;
    out.m_70.w = _1388;
    if (_1334)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1400 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1400;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _413 = false;
    bool _313 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1457 = as_type<float>(_105);
        out.gl_Position.z = _1457;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1526 = as_type<float>(_141);
        out.gl_Position.z = _1526;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = in.m_54.x;
    float _153 = in.m_54.y;
    float _155 = in.m_54.z;
    float _157 = in.m_56.x;
    float _159 = in.m_56.y;
    float _161 = in.m_56.z;
    float _163 = in.m_58.x;
    float _165 = in.m_58.y;
    float _167 = in.m_58.z;
    float _169 = _147 * _145;
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    float _177 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    int _179 = as_type<int>(_149) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_149) & 2;
    bool _185 = _183 != 0;
    float _187 = _177 * 6.283185482025146484375;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = floor(_177);
    float _195 = _187 * 0.15915493667125701904296875;
    bool _197 = !_185;
    float _199 = _197 ? (-0.5) : 0.5;
    int _201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _203 = _201 != 0;
    int _205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _207 = _205 != 0;
    float _209 = _153 * _159;
    bool _211 = !_191;
    int _213 = _211 ? 0 : 1;
    float _215 = _195 * 6.283185482025146484375;
    float _217 = cos(_215);
    float _219 = _153 * _165;
    bool _221 = !_203;
    int _223 = _221 ? 0 : 1;
    float _225 = fma(_151, _157, _209);
    bool _227 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _229 = _153 * _173;
    int _231 = abs(_223);
    float _233 = fma(_151, _163, _219);
    float _235 = -_193;
    float _237 = _177 + _235;
    float _239 = fma(_151, _171, _229);
    int _241 = abs(_213);
    float _243 = -_237;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _247 = !_207;
    int _249 = _247 ? 0 : 1;
    float _251 = float(_231);
    float _253 = fma(_217, 0.5, 0.5);
    int _255 = abs(_249);
    bool _257 = _237 < 0.5;
    float _259 = float(_257);
    float _261 = abs(_245);
    float _263 = _251 * _261;
    float _265 = float(_241);
    float _267 = -_253;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = -_259;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _275 = fma(_155, _167, _233);
    float _277 = fma(_265, _269, _263);
    float _279 = float(_255);
    float _281 = fma(_155, _161, _225);
    float _283 = fma(_155, _175, _239);
    bool _285 = !_181;
    float _287 = _285 ? (-0.5) : 0.5;
    float _289 = abs(_273);
    float _291 = fma(_279, _289, _277);
    bool _293 = !_227;
    float _295 = _283;
    float _311;
    if (!_293)
    {
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _299 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_89);
        float _317 = 1.0 / _315;
        float _319 = _123 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = _321 + _323;
    bool _327 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_321);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _339;
    float _343 = -_337;
    float _345 = _343 + 1.0;
    bool _347 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _349 = isnan(_321);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _365 = 1.0 / _341;
    float _367 = _357 * _345;
    float _369 = -_357;
    float _371 = _369 + 1.0;
    float _373 = _325 * _365;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _375;
    float _379 = fma(_361, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _381 = fma(_377, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _383 = _379 * _367;
    float _385 = _381 * _367;
    float _387 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _383);
    float _389 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _385);
    float _391 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[144].x, _387);
    float _393 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[144].y, _389);
    bool _395 = !_363;
    float _411;
    if (!_395)
    {
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _399 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _411 = _409;
        _413 = true;
    }
    else
    {
        float _415 = float(_89);
        float _417 = 1.0 / _415;
        float _419 = _123 * _417;
        _411 = _419;
    }
    _413 = false;
    float _421 = _411;
    float _423 = in.m_62.x;
    float _425 = in.m_62.y;
    float _427 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _429 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _287);
    float _431 = in.m_42.x;
    float _433 = in.m_42.y;
    float _435 = in.m_42.z;
    float _437 = in.m_60.w;
    float _439 = in.m_56.w;
    float _441 = _393 * _425;
    float _443 = _391 * _423;
    float _445 = _291 * _441;
    float _447 = _291 * _443;
    float _449 = _173 * _433;
    float _451 = _159 * _433;
    float _453 = _445 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _455 = _447 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _457 = fma(_171, _431, _449);
    float _459 = fma(_157, _431, _451);
    float _461 = _453 * _427;
    float _463 = _455 * _429;
    float _465 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _467 = _165 * _433;
    float _469 = _461 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _471 = _461 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _473 = fma(_163, _431, _467);
    float _475 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].x, _469);
    float _477 = fma(_175, _435, _457);
    float _479 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].x, _471);
    float _481 = fma(_167, _435, _473);
    float _483 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[26].z, _475);
    float _485 = fma(_161, _435, _459);
    float _487 = _477 + _437;
    float _489 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[24].z, _479);
    float _491 = _483 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _493 = _485 + _439;
    float _495 = in.m_58.w;
    float _497 = _489 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _499 = _487 + _491;
    float _501 = _493 + _497;
    float _503 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _505 = _499 + _503;
    float _507 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _509 = _501 + _507;
    float _511 = _505 * _505;
    float _513 = fma(_509, _509, _511);
    float _515 = _461 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _517 = sqrt(_513);
    float _519 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].x, _515);
    float _521 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[25].z, _519);
    float _523 = _481 + _495;
    float _525 = _521 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _527 = _523 + _525;
    bool _529 = _517 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _531 = _515;
    float _533 = _525;
    float _535 = _501;
    if (!_529)
    {
        _531 = _501;
    }
    float _537 = _531;
    float _539 = _537;
    if (!_529)
    {
        _533 = _499;
    }
    float _541 = _533;
    float _543 = _541;
    if (!_529)
    {
        _535 = _527;
    }
    float _545 = _535;
    bool _547 = !_529;
    float _549 = _545;
    if (!_547)
    {
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _553 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _555 = _517 + _553;
        float _557 = _527 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _559 = _555 * _551;
        float _561 = rsqrt(_513);
        float _563 = _559 * 0.15915493667125701904296875;
        float _565 = _563 * 6.283185482025146484375;
        float _567 = cos(_565);
        float _569 = _563 * 6.283185482025146484375;
        float _571 = sin(_569);
        float _573 = _567 + (-1.0);
        float _575 = _573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _577 = fma(_571, _557, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _579 = fma(_527, _567, _575);
        float _581 = _561 * _577;
        float _583 = fma(_509, _581, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _585 = fma(_505, _581, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _549 = _579;
        _539 = _583;
        _543 = _585;
    }
    float _587 = _549;
    float _589 = _539;
    float _591 = _543;
    float _593 = -_523;
    float _595 = _593 + _587;
    float _597 = -_493;
    float _599 = _597 + _589;
    float _601 = -_487;
    float _603 = _601 + _591;
    float _605 = _523 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _607 = _595 * _595;
    bool _609 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _611 = isnan(0.5);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _617 = _613 || _615;
    float _619 = fma(_599, _599, _607);
    bool _621 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _623 = isnan(0.5);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _629 = _625 || _627;
    float _631 = fma(_603, _603, _619);
    float _633 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[11].x, _605);
    float _635 = _523 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _637 = sqrt(_631);
    float _639 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[11].z, _633);
    float _641 = _639 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _643 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[10].x, _635);
    float _645 = 1.0 / _641;
    float _647 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[10].z, _643);
    float _649 = _647 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _651 = _637 > 0.0;
    float _653 = _649 + _641;
    float _655 = _653 * _645;
    float _657 = _655 * 0.5;
    bool _659 = !_651;
    float _661 = _589;
    float _663 = _587;
    float _665 = _591;
    float _667 = _631;
    float _669 = _637;
    float _671 = _599;
    float _673 = _595;
    if (!_659)
    {
        float _675 = _275 * _275;
        float _677 = rsqrt(_631);
        float _679 = fma(_281, _281, _675);
        float _681 = fma(_283, _283, _679);
        float _683 = sqrt(_681);
        float _685 = _599 * _677;
        float _687 = _595 * _677;
        float _689 = _603 * _677;
        bool _691 = _683 > 0.0;
        bool _693 = !_691;
        _667 = _677;
        _669 = _683;
        if (!_693)
        {
            float _695 = rsqrt(_681);
            float _697 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _699 = _275 * _695;
            float _701 = _281 * _695;
            float _703 = _687 * _699;
            float _705 = _283 * _695;
            float _707 = fma(_685, _701, _703);
            float _709 = _697 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _711 = fma(_689, _705, _707);
            float _713 = _711 * _709;
            float _715 = fma(_281, _713, _589);
            float _717 = fma(_275, _713, _587);
            float _719 = fma(_283, _713, _591);
            _661 = _715;
            _663 = _717;
            _665 = _719;
            _667 = _701;
            _669 = _711;
            _671 = _713;
        }
    }
    float _721 = _661;
    float _723 = _663;
    float _725 = _665;
    float _727 = _667;
    float _729 = _669;
    float _731 = _671;
    float _733 = _727;
    float _735 = _723;
    float _737 = _721;
    float _739 = _725;
    float _741 = _729;
    float _743 = _731;
    if (_629)
    {
        _733 = 1.0;
    }
    float _745 = _733;
    float _747 = _745;
    if (!_617)
    {
        float _749 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _751 = _523 + _749;
        float _753 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _755 = _493 + _753;
        float _757 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _759 = -_493;
        float _761 = _759 + _721;
        float _763 = _751 * _751;
        float _765 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _767 = _487 + _765;
        float _769 = fma(_755, _755, _763);
        float _771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _773 = fma(_767, _767, _769);
        float _775 = sqrt(_773);
        float _777 = _757 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _779 = precise::min(_775, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _781 = _779 * _771;
        float _783 = _777 * _781;
        float _785 = -_523;
        float _787 = _785 + _723;
        float _789 = -_487;
        float _791 = _789 + _725;
        float _793 = fma(_761, _783, _493);
        float _795 = fma(_787, _783, _523);
        float _797 = fma(_791, _783, _487);
        _735 = _795;
        _737 = _793;
        _739 = _797;
        _295 = _757;
        _741 = _791;
    }
    float _799 = _735;
    float _801 = _737;
    float _803 = _739;
    float _805 = _295;
    float _807 = _741;
    float _809 = _807;
    float _811 = _805;
    if (!_629)
    {
        float _813 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _815 = _813 * 0.15915493667125701904296875;
        float _817 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _819 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _821 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[30].w, _819);
        float _823 = _815 * 6.283185482025146484375;
        float _825 = cos(_823);
        float _827 = _817 * 0.15915493667125701904296875;
        float _829 = _815 * 6.283185482025146484375;
        float _831 = sin(_829);
        float _833 = 1.0 / _825;
        float _835 = _827 * 6.283185482025146484375;
        float _837 = cos(_835);
        float _839 = _831 * _833;
        float _841 = _827 * 6.283185482025146484375;
        float _843 = sin(_841);
        float _845 = _837 * _839;
        float _847 = 1.0 / _821;
        float _849 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _851 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _849;
        float _853 = 1.0 / _845;
        float _855 = 1.0 / _851;
        float _857 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _859 = _847 * _857;
        float _861 = _843 * _853;
        float _863 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _865 = fma(_861, _859, _863);
        float _867 = _865 * _855;
        float _869 = precise::clamp(_867, 0.0, 1.0);
        _809 = _827;
        _747 = _869;
    }
    float _871 = _809;
    float _873 = _747;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _877 = _799 + _875;
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _881 = _801 + _879;
    float _883 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _885 = _803 + _883;
    float _887 = _877 * _877;
    float _889 = fma(_881, _881, _887);
    float _891 = fma(_885, _885, _889);
    float _893 = rsqrt(_891);
    float _895 = _893 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _897 = _881 * _895;
    float _899 = _885 * _895;
    float _901 = _897 * _897;
    float _903 = _899 * _899;
    float _905 = _901 + _903;
    float _907 = sqrt(_905);
    bool _909 = _907 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _911 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _913 = _907 + _911;
    float _915 = _885;
    float _917 = _905;
    float _919 = _913;
    float _921 = _897;
    float _923 = _901;
    if (_909)
    {
        float _925 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _915 = _925;
    }
    float _927 = _915;
    if (_909)
    {
        float _929 = rsqrt(_905);
        _917 = _929;
    }
    float _931 = _917;
    if (_909)
    {
        float _933 = _913 * _927;
        _919 = _933;
    }
    float _935 = _919;
    if (_909)
    {
        float _937 = _935 * 0.15915493667125701904296875;
        _811 = _937;
    }
    float _939 = _811;
    float _941 = _893;
    if (_909)
    {
        float _943 = _939 * 6.283185482025146484375;
        float _945 = sin(_943);
        _941 = _945;
    }
    float _947 = _941;
    float _949 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _951 = precise::max(0.0, _949);
    float _953 = _871;
    float _955 = _951;
    float _957 = _949;
    if (_909)
    {
        float _959 = _939 * 6.283185482025146484375;
        float _961 = cos(_959);
        _953 = _961;
    }
    float _963 = _953;
    float _965 = -_895;
    float _967 = -_951;
    float _969 = fma(_877, _965, _967);
    if (_909)
    {
        float _971 = _969 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _955 = _971;
    }
    float _973 = _955;
    float _975 = sqrt(_891);
    float _977 = _973;
    float _979 = _947;
    if (_909)
    {
        float _981 = fma(_947, _973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _977 = _981;
    }
    float _983 = _977;
    float _985 = _983;
    if (!_909)
    {
        _979 = _969;
    }
    float _987 = _979;
    float _989 = _987;
    if (_909)
    {
        float _991 = _963 + (-1.0);
        _957 = _991;
    }
    float _993 = _957;
    float _995 = _993;
    if (_909)
    {
        float _997 = _931 * _983;
        _673 = _997;
    }
    float _999 = _673;
    if (!_909)
    {
        _985 = _899;
    }
    float _1001 = _985;
    float _1003 = _1001;
    if (_909)
    {
        float _1005 = _993 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _743 = _1005;
    }
    float _1007 = _743;
    if (_909)
    {
        float _1009 = _897 * _999;
        _921 = _1009;
    }
    float _1011 = _921;
    if (_909)
    {
        float _1013 = _899 * _999;
        _1003 = _1013;
    }
    float _1015 = _1003;
    if (!_909)
    {
        _995 = _903;
    }
    float _1017 = _995;
    float _1019 = _1017;
    if (_909)
    {
        float _1021 = fma(_969, _963, _1007);
        _989 = _1021;
    }
    float _1023 = _989;
    if (_909)
    {
        float _1025 = _1011 * _1011;
        _923 = _1025;
    }
    float _1027 = _923;
    if (_909)
    {
        float _1029 = _1015 * _1015;
        _1019 = _1029;
    }
    float _1031 = _1019;
    float _1033 = fma(_1023, _1023, _1027);
    float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1037 = fma(_975, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1035);
    float _1039 = precise::clamp(_1037, 0.0, 1.0);
    float _1041 = _1033 + _1031;
    float _1043 = _799 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1045 = -_1039;
    float _1047 = _1045 + 1.0;
    float _1049 = rsqrt(_1041);
    float _1051 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1043);
    float _1053 = _799 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1055 = _799 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1057 = _799 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1059 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1051);
    float _1061 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1053);
    float _1063 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1055);
    float _1065 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1057);
    float _1067 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1069 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1061);
    float _1071 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1063);
    float _1073 = abs(_1047);
    float _1075 = log2(_1073);
    float _1077 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1065);
    float _1079 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1081 = _1071 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1083 = _1049 * _1011;
    float _1085 = _1049 * _1023;
    float _1087 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1089 = _1049 * _1015;
    float _1091 = _1083 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1093 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1095 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1087);
    float _1097 = _1067 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1099 = -_1091;
    float _1101 = fma(_1085, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1099);
    float _1103 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1105 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1095);
    float _1107 = -_1097;
    float _1109 = fma(_1107, _1093, 1.0);
    float _1111 = -_1089;
    float _1113 = fma(_1111, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1101);
    float _1115 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1117 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1105);
    float _1119 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1121 = fma(_1113, -0.5, 0.5);
    float _1123 = log2(_1109);
    float _1125 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1127 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1119);
    float _1129 = fma(_1113, 0.5, 0.5);
    float _1131 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1125);
    float _1133 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1127);
    float _1135 = fma(_1129, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1137 = 1.0 / _1117;
    float _1139 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1131);
    float _1141 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1133);
    float _1143 = fma(_1129, _1135, -0.212114393711090087890625);
    float _1145 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1139);
    float _1147 = fma(_1129, _1143, 1.570728778839111328125);
    float _1149 = exp2(_1115);
    float _1151 = _1123 * 0.693147182464599609375;
    float _1153 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1155 = sqrt(_1121);
    float _1157 = _1085 + 1.0;
    float _1159 = _1141 * _1137;
    float _1161 = _1145 * _1137;
    float _1163 = fma(_1159, 0.5, 0.5);
    float _1165 = fma(_1161, -0.5, 0.5);
    float _1167 = -_1085;
    float _1169 = fma(_1149, _1157, _1167);
    float _1171 = fma(_1169, 0.5, 0.5);
    float _1173 = _1155 * 0.636619746685028076171875;
    float _1175 = -_1147;
    float _1177 = fma(_1173, _1175, 1.0);
    float3 _3124 = float3(_1163, _1165, _1153);
    float _1179 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3124, float3(0.0), isnan(_3124)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3124, float3(0.0), isnan(_3124)), level(0.0)).x;
    float3 _3135 = float3(_1163, _1165, _1153);
    float4 _1182 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3135, float3(0.0), isnan(_3135)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3135, float3(0.0), isnan(_3135)), level(0.0)).xyzw;
    float _1184 = _1182.x;
    float _1186 = _1182.y;
    float _1188 = _1182.z;
    float _1190 = _1182.w;
    float2 _3152 = float2(_1177, _1171);
    float3 _1194 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3152, float2(0.0), isnan(_3152)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3152, float2(0.0), isnan(_3152)), level(0.0)).xyz;
    float _1196 = _1194.x;
    float _1198 = _1194.y;
    float _1200 = _1194.z;
    float _1202 = in.m_49.y;
    float _1204 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1206 = _143 > 0.5;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1210 = _421 + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1212;
    float _1216 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1204);
    float _1218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1222 = _1220 != 0;
    float _1224 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1216);
    float _1226 = 1.0 / _1214;
    bool _1228 = _1202 > 0.5;
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1232 = -_287;
    int _1234 = _1206 ? as_type<int>(_1232) : as_type<int>(_287);
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1238 = _1236 != 0;
    float _1240 = -_199;
    int _1242 = _1228 ? as_type<int>(_1240) : as_type<int>(_199);
    float _1244 = _1210 * _1226;
    bool _1246 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1248 = isnan(_421);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    bool _1258 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1260 = isnan(_421);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1266 = _1262 || _1264;
    float _1268 = float(_1266);
    bool _1270 = !_1238;
    float _1272 = _1270 ? _199 : as_type<float>(_1242);
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1274;
    bool _1278 = !_1222;
    float _1280 = _1278 ? _287 : as_type<float>(_1234);
    float _1282 = -_1268;
    float _1284 = _1282 + 1.0;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1286;
    float _1290 = fma(_1276, _1244, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1292 = _1256 * _1284;
    float _1294 = -_1272;
    float _1296 = _1294 + 0.5;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1298;
    float _1302 = fma(_1288, _1244, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1304 = _1290 * _1292;
    float _1306 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1308 = fma(_1300, _1244, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1310 = _1302 * _1292;
    float _1312 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1224);
    float _1314 = exp2(_1306);
    float _1316 = _1308 * _1292;
    float _1318 = -_1256;
    float _1320 = _1318 + 1.0;
    float _1322 = _1280 + 0.5;
    float _1324 = _873 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1326 = _873 > 0.0;
    bool _1328 = isnan(_873);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(0.0);
    bool _1334 = _1330 || _1332;
    float _1336 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1304);
    float _1338 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1310);
    float _1340 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1316);
    float _1342 = _1312 + _1117;
    float _1344 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1346 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1336);
    float _1348 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1338);
    float _1350 = _1342 * 0.5;
    float _1352 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1340);
    float _1354 = _1344 * _1218;
    float _1356 = -_1314;
    float _1358 = _1356 + 1.0;
    float _1360 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1362 = _1346 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1364 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1366 = _1324 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1368 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1370 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1372 = -_1364;
    float _1374 = _1372 + 1.0;
    out.gl_Position.x = _1141;
    out.gl_Position.y = _1145;
    out.gl_Position.z = _1312;
    out.gl_Position.w = _1117;
    float _1376 = _1360 * _1230;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1380 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1382 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1384 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _1354;
    out.m_64.y = _1376;
    out.m_66.x = _1380;
    out.m_66.y = _1382;
    out.m_66.z = _1384;
    out.m_66.w = _1378;
    out.m_68.z = _1350;
    out.m_68.w = _1117;
    out.m_45.x = _1366;
    float _1386 = _1364 * _1179;
    float _1388 = _1190 * _1374;
    float _1390 = _1190 * _1386;
    float _1392 = _1200 * _1386;
    float _1394 = fma(_1196, _1390, _1184);
    float _1396 = fma(_1198, _1390, _1186);
    float _1398 = fma(_1190, _1392, _1188);
    out.m_70.x = _1394;
    out.m_70.y = _1396;
    out.m_70.z = _1398;
    out.m_70.w = _1388;
    if (_1334)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1400 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1400;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

