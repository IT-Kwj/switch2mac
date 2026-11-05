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
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_47 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_70 [[user(locn3)]];
    float4 m_78 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
    float4 m_72 [[user(locn8)]];
    float4 m_58 [[user(locn9)]];
    float4 m_76 [[user(locn10)]];
    float4 m_74 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1818 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_44.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    float _105 = as_type<float>(_97);
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _103;
    if (!_101)
    {
        out.m_47.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2051 = as_type<float>(_113);
        out.gl_Position.z = _2051;
    }
    if (!_101)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_97);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    int _147 = 0;
    if (_141)
    {
        float _149 = _145 * 5.0;
        _147 = as_type<int>(_149);
    }
    int _151 = _147;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2121 = as_type<float>(_151);
        out.gl_Position.z = _2121;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _153 = in.m_51.z;
    float _155 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _157 = log2(_155);
    float _159 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _161 = in.m_51.x;
    float _163 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_51.y;
    float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_49.x;
    float _183 = in.m_49.y;
    float _185 = in.m_49.z;
    float _187 = _157 * _129;
    float _189 = exp2(_187);
    float _191 = _153 * 2.0;
    float _193 = _163 * _177;
    float _195 = _177;
    if (!_173)
    {
        _195 = _159;
    }
    float _197 = _195;
    float _199 = _161 * 2.0;
    float _201 = floor(_191);
    float _203 = _175 * 2.0;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    float _209 = floor(_199);
    int _211 = as_type<int>(_179) & 2;
    bool _213 = _211 != 0;
    float _215 = _179;
    float _217 = _197;
    float _219 = _161;
    if (!_173)
    {
        float _221 = _159 * _159;
        float _223 = _221 * 0.5;
        _215 = _223;
    }
    float _225 = _215;
    float _227 = _225;
    if (!_173)
    {
        float _229 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = _201 > 0.0;
    float _235 = floor(_203);
    bool _237 = _201 >= 0.0;
    bool _239 = isnan(_201);
    bool _241 = _237 || _239;
    bool _243 = isnan(0.0);
    bool _245 = _241 || _243;
    int _247 = _245 ? 0 : 1;
    bool _249 = _209 > 0.0;
    int _251 = ~_247;
    int _253 = _251 + 1;
    int _255 = _253 + 1;
    bool _257 = _209 >= 0.0;
    bool _259 = isnan(_209);
    bool _261 = _257 || _259;
    bool _263 = isnan(0.0);
    bool _265 = _261 || _263;
    int _267 = _255;
    float _269 = _231;
    if (!_233)
    {
        int _271 = ~_247;
        int _273 = _271 + 1;
        _267 = _273;
    }
    int _275 = _267;
    bool _277 = !_173;
    if (!_277)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _159 * _281;
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _159);
        float _305 = _303 * _291;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _269 = _307;
    }
    float _309 = _269;
    bool _311 = !_173;
    if (!_311)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = 1.0 / _319;
        float _323 = _159 * _315;
        float _325 = exp2(_323);
        float _327 = -_325;
        float _329 = _327 + 1.0;
        float _331 = _329 * _321;
        _217 = _331;
    }
    float _333 = _217;
    float _335 = in.m_56.w;
    float _337 = -_189;
    float _339 = _337 + 1.0;
    float _341 = in.m_44.x;
    float _343 = in.m_44.y;
    float _345 = in.m_44.z;
    bool _347 = !_207;
    float _349 = _347 ? (-0.5) : 0.5;
    float _351 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[20].x, _193);
    bool _353 = _175 > 0.5;
    bool _355 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _357 = isnan(0.0);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _363 = _359 || _361;
    int _365 = _265 ? 0 : 1;
    int _367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _369 = _367 != 0;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _373 = _371 != 0;
    float _375 = -_349;
    int _377 = _353 ? as_type<int>(_375) : as_type<int>(_349);
    bool _379 = _235 > 0.0;
    bool _381 = _235 >= 0.0;
    bool _383 = isnan(_235);
    bool _385 = _381 || _383;
    bool _387 = isnan(0.0);
    bool _389 = _385 || _387;
    float _391 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _393 = ~_365;
    int _395 = _393 + 1;
    int _397 = _395 + 1;
    float _399 = _363 ? _339 : 0.0;
    float _401 = fma(_333, _183, _391);
    int _403 = _397;
    float _405 = _349;
    if (!_249)
    {
        int _407 = ~_365;
        int _409 = _407 + 1;
        _403 = _409;
    }
    int _411 = _403;
    float _413 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _415 = !_369;
    float _417 = _415 ? _349 : as_type<float>(_377);
    float _419 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _421 = _153 > 0.5;
    float _423 = fma(_333, _185, _413);
    float _425 = fma(_333, _181, _419);
    float _427 = fma(_401, _335, _343);
    float _429 = fma(_425, _335, _341);
    float _431 = _427 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _433 = _427 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _435 = fma(_423, _335, _345);
    bool _437 = !_213;
    float _439 = _437 ? (-0.5) : 0.5;
    float _441 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].x, _431);
    float _443 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].x, _433);
    int _445 = _389 ? 0 : 1;
    float _447 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].z, _441);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].z, _443);
    float _451 = -_439;
    int _453 = _421 ? as_type<int>(_451) : as_type<int>(_439);
    float _455 = _447 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _457 = _449 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _461 = _459 != 0;
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _465 = _463 != 0;
    float _467 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _469 = _455 + _467;
    float _471 = -_457;
    float _473 = _471 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _475 = !_373;
    float _477 = _475 ? _439 : as_type<float>(_453);
    bool _479 = !_465;
    int _481 = _479 ? 0 : 1;
    float _483 = abs(_469);
    float _485 = abs(_473);
    float _487 = precise::max(_483, _485);
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _495 = _493 != 0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _499 = _497 != 0;
    float _501 = _175 + _153;
    bool _503 = _487 >= 16.0;
    float _505 = _501 + (-1.0);
    bool _507 = !_461;
    int _509 = _507 ? 0 : 1;
    int _511 = ~_445;
    int _513 = _511 + 1;
    int _515 = _513 + 1;
    int _517 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _519 = _517 != 0;
    int _521 = _515;
    float _523 = _469;
    float _525 = _473;
    if (!_379)
    {
        int _527 = ~_445;
        int _529 = _527 + 1;
        _521 = _529;
    }
    int _531 = _521;
    if (_503)
    {
        float _533 = _469 * 0.0625;
        _523 = _533;
    }
    float _535 = _523;
    bool _537 = !_491;
    int _539 = _537 ? 0 : 1;
    if (_503)
    {
        float _541 = _473 * 0.0625;
        _525 = _541;
    }
    float _543 = _525;
    bool _545 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _547 = isnan(1.0);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _553 = _549 || _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _557 = 1.0 + _555;
    int _559 = abs(_539);
    float _561 = _161 + _175;
    float _563 = 1.0 / _557;
    float _565 = float(_275);
    float _567 = _561 + (-1.0);
    float _569 = float(_559);
    float _571 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _573 = abs(_535);
    bool _575 = _573 != 0.0;
    bool _577 = isnan(_573);
    bool _579 = _575 || _577;
    bool _581 = isnan(0.0);
    bool _583 = _579 || _581;
    float _585 = _161 + _153;
    bool _587 = !_495;
    int _589 = _587 ? 0 : 1;
    float _591 = _569 * _565;
    float _593 = abs(_543);
    bool _595 = _593 == 0.0;
    bool _597 = !_583;
    bool _599 = _595 && _597;
    float _601 = _585 + (-1.0);
    bool _603 = !_499;
    int _605 = _603 ? 0 : 1;
    int _607 = abs(_589);
    bool _609 = _553;
    int _611 = as_type<int>(_571);
    int _613 = _583 ? (-1) : 0;
    if (_553)
    {
        float _615 = _399 * _563;
        _131 = _615;
    }
    float _617 = _131;
    int _619 = abs(_605);
    float _621 = _591 * (-2.0);
    float _623 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _625 = float(_411);
    float _627 = floor(_351);
    float _629 = float(_607);
    float _631 = _351 * 6.283185482025146484375;
    int _633 = as_type<int>(_625);
    if (_599)
    {
        bool _635 = as_type<int>(_543) >= 0;
        _609 = _635;
    }
    bool _637 = _609;
    float _639 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _641 = float(_531);
    float _643 = _629 * _625;
    float _645 = _631 * 0.15915493667125701904296875;
    if (_599)
    {
        int _647 = _637 ? 0 : 1078530011;
        _633 = _647;
    }
    int _649 = _633;
    float _651 = fma(_639, _621, _639);
    float _653 = abs(_543);
    bool _655 = _653 == 0.0;
    float _657 = _645 * 6.283185482025146484375;
    float _659 = cos(_657);
    float _661 = float(_619);
    float _663 = _161 + (-0.5);
    float _665 = _643 * (-2.0);
    float _667 = -_627;
    float _669 = _351 + _667;
    float _671 = _661 * _641;
    float _673 = _663 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _675 = _671 * (-2.0);
    float _677 = fma(_571, _665, _571);
    float _679 = fma(_651, _617, _673);
    if (_599)
    {
        int _681 = int(0x80000000) & as_type<int>(_535);
        int _683 = _649 | _681;
        _611 = _683;
    }
    int _685 = _611;
    float _687 = fma(_623, _675, _623);
    bool _689 = !_583;
    bool _691 = _689 && _655;
    int _693 = _685;
    float _695 = as_type<float>(_685);
    if (!_691)
    {
        float _697 = abs(_535);
        bool _699 = _697 != as_type<float>(0x7f800000u /* inf */);
        bool _701 = isnan(_697);
        bool _703 = _699 || _701;
        bool _705 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _707 = _703 || _705;
        float _709 = abs(_543);
        bool _711 = _709 == as_type<float>(0x7f800000u /* inf */);
        bool _713 = !_707;
        bool _715 = _711 && _713;
        if (_715)
        {
            bool _717 = as_type<int>(_543) >= 0;
            _613 = _717 ? (-1) : 0;
        }
        int _719 = _613;
        if (_715)
        {
            _693 = 1075235812;
        }
        int _721 = _693;
        int _723 = _721;
        if (_715)
        {
            int _725 = ~_719;
            int _727 = (_725 != 0) ? _721 : 1061752795;
            _723 = _727;
        }
        int _729 = _723;
        float _731 = abs(_543);
        bool _733 = _731 == as_type<float>(0x7f800000u /* inf */);
        float _735 = as_type<float>(_729);
        if (_715)
        {
            int _737 = int(0x80000000) & as_type<int>(_535);
            int _739 = _729 | _737;
            _735 = as_type<float>(_739);
        }
        float _741 = _735;
        bool _743 = !_707;
        bool _745 = _743 && _733;
        _695 = _741;
        if (!_745)
        {
            float _747 = abs(_535);
            float _749 = abs(_543);
            float _751 = precise::max(_747, _749);
            float _753 = abs(_535);
            float _755 = abs(_543);
            float _757 = precise::min(_753, _755);
            float _759 = 1.0 / _751;
            float _761 = abs(_535);
            float _763 = abs(_543);
            bool _765 = _761 > _763;
            bool _767 = as_type<int>(_543) >= 0;
            float _769 = _757 * _759;
            float _771 = _769 * _769;
            float _773 = _771 + 11.33538818359375;
            float _775 = fma(_771, _773, 28.84246826171875);
            float _777 = fma(_771, _775, 19.6966705322265625);
            float _779 = fma(_771, -0.82336294651031494140625, -5.674867153167724609375);
            float _781 = fma(_771, _779, -6.565555095672607421875);
            float _783 = 1.0 / _777;
            float _785 = _771 * _781;
            float _787 = abs(_535);
            float _789 = abs(_543);
            float _791 = _787 + _789;
            int _793 = as_type<int>(_535) & int(0x80000000);
            float _795 = _769 * _785;
            bool _797 = _791 > as_type<float>(0x7f800000u /* inf */);
            bool _799 = isnan(_791);
            bool _801 = _797 || _799;
            bool _803 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _805 = _801 || _803;
            float _807 = fma(_795, _783, _769);
            float _809 = _807;
            _695 = _791;
            if (_765)
            {
                float _811 = -_807;
                float _813 = _811 + 1.57079637050628662109375;
                _809 = _813;
            }
            float _815 = _809;
            int _817 = as_type<int>(_815);
            if (!_767)
            {
                float _819 = -_815;
                float _821 = _819 + 3.1415927410125732421875;
                _817 = as_type<int>(_821);
            }
            int _823 = _817;
            if (!_805)
            {
                int _825 = _793 | _823;
                _695 = as_type<float>(_825);
            }
        }
    }
    float _827 = _695;
    float _829 = _153 + (-0.5);
    float _831 = _175 + (-0.5);
    float _833 = _679 * 0.15915493667125701904296875;
    float _835 = _829 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _837 = _669 < 0.5;
    float _839 = float(_837);
    float _841 = _831 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _843 = -_669;
    float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _847 = fma(_687, _617, _835);
    int _849 = abs(_509);
    float _851 = -_839;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _855 = fma(_677, _617, _841);
    bool _857 = !_519;
    int _859 = _857 ? 0 : 1;
    float _861 = in.m_56.x;
    float _863 = in.m_56.y;
    float _865 = _847 * 0.15915493667125701904296875;
    float _867 = -_827;
    float _869 = _855 + _867;
    int _871 = abs(_859);
    float _873 = fma(_659, 0.5, 0.5);
    float _875 = _833 * 6.283185482025146484375;
    float _877 = sin(_875);
    int _879 = abs(_481);
    float _881 = _869 * 0.15915493667125701904296875;
    float _883 = float(_849);
    float _885 = -_873;
    float _887 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _889 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _891 = float(_871);
    float _893 = _833 * 6.283185482025146484375;
    float _895 = cos(_893);
    float _897 = _427 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[193].x + (-1.0);
    float _901 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].x, _897);
    float _903 = _865 * 6.283185482025146484375;
    float _905 = cos(_903);
    float _907 = abs(_845);
    float _909 = _883 * _907;
    bool _911 = !_213;
    float _913 = _911 ? 0.0 : 1.0;
    float _915 = _863 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _917 = float(_879);
    float _919 = fma(_891, _887, _909);
    float _921 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].z, _901);
    float _923 = fma(_913, _899, 1.0);
    float _925 = _881 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = abs(_853);
    float _931 = fma(_917, _929, _919);
    float _933 = _861 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _935 = _349 * _923;
    float _937 = _931 * _915;
    float _939 = _931 * _933;
    float _941 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _935);
    float _943 = _881 * 6.283185482025146484375;
    float _945 = cos(_943);
    float _947 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _439);
    float _949 = _939 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _951 = _937 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _953 = _949 * _941;
    float _955 = _951 * _947;
    float _957 = _865 * 6.283185482025146484375;
    float _959 = sin(_957);
    float _961 = _877 * _905;
    float _963 = _895 * _927;
    float _965 = _877 * _927;
    float _967 = _927 * _905;
    float _969 = _961 * _955;
    float _971 = _877 * _945;
    float _973 = _895 * _945;
    float _975 = _945 * _905;
    float _977 = _895 * _905;
    float _979 = -_963;
    float _981 = fma(_959, _971, _979);
    float _983 = -_955;
    float _985 = _959 * _983;
    float _987 = fma(_959, _965, _973);
    float _989 = fma(_959, _973, _965);
    float _991 = fma(_981, _953, _969);
    float _993 = fma(_975, _953, _985);
    float _995 = _977 * _955;
    float _997 = -_971;
    float _999 = fma(_959, _963, _997);
    float _1001 = fma(_987, _889, _991);
    float _1003 = fma(_967, _889, _993);
    float _1005 = fma(_989, _953, _995);
    float _1007 = _921 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1009 = _457 + _1001;
    float _1011 = _455 + _1003;
    float _1013 = fma(_999, _889, _1005);
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1017 = _1009 + _1015;
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1021 = _1011 + _1019;
    float _1023 = _1007 + _1013;
    float _1025 = _1017 * _1017;
    float _1027 = fma(_1021, _1021, _1025);
    float _1029 = sqrt(_1027);
    bool _1031 = _1029 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1033 = _973;
    float _1035 = _1011;
    float _1037 = _1009;
    float _1039 = _1029;
    float _1041 = _953;
    if (!_1031)
    {
        _1033 = _1023;
    }
    float _1043 = _1033;
    bool _1045 = !_1031;
    float _1047 = _1043;
    if (!_1045)
    {
        float _1049 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1053 = _1029 + _1051;
        float _1055 = rsqrt(_1027);
        float _1057 = _1053 * _1049;
        float _1059 = _1023 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1061 = _1057 * 0.15915493667125701904296875;
        float _1063 = _1061 * 6.283185482025146484375;
        float _1065 = cos(_1063);
        float _1067 = _1061 * 6.283185482025146484375;
        float _1069 = sin(_1067);
        float _1071 = _1065 + (-1.0);
        float _1073 = _1071 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1075 = fma(_1069, _1059, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1077 = fma(_1023, _1065, _1073);
        float _1079 = _1055 * _1075;
        float _1081 = fma(_1021, _1079, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1083 = fma(_1017, _1079, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1047 = _1077;
        _1035 = _1081;
        _1037 = _1083;
        _1039 = _1061;
    }
    float _1085 = _1047;
    float _1087 = _1035;
    float _1089 = _1037;
    float _1091 = _1039;
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1095 = _1085 + _1093;
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1099 = _1087 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1103 = _1089 + _1101;
    float _1105 = _1095 * _1095;
    float _1107 = fma(_1099, _1099, _1105);
    float _1109 = fma(_1103, _1103, _1107);
    float _1111 = rsqrt(_1109);
    float _1113 = sqrt(_1109);
    float _1115 = _1111 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1117 = _1099 * _1115;
    float _1119 = _1103 * _1115;
    float _1121 = _1117 * _1117;
    float _1123 = _1119 * _1119;
    float _1125 = _1121 + _1123;
    float _1127 = sqrt(_1125);
    bool _1129 = _1127 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1133 = _1127 + _1131;
    float _1135 = _1103;
    float _1137 = _1125;
    float _1139 = _1133;
    float _1141 = _1115;
    if (_1129)
    {
        float _1143 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1135 = _1143;
    }
    float _1145 = _1135;
    if (_1129)
    {
        float _1147 = rsqrt(_1125);
        _1137 = _1147;
    }
    float _1149 = _1137;
    float _1151 = _1149;
    if (_1129)
    {
        float _1153 = _1133 * _1145;
        _1139 = _1153;
    }
    float _1155 = _1139;
    if (_1129)
    {
        float _1157 = _1155 * 0.15915493667125701904296875;
        _1041 = _1157;
    }
    float _1159 = _1041;
    float _1161 = _1091;
    if (_1129)
    {
        float _1163 = _1159 * 6.283185482025146484375;
        float _1165 = sin(_1163);
        _1161 = _1165;
    }
    float _1167 = _1161;
    float _1169 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1171 = precise::max(0.0, _1169);
    float _1173 = _1111;
    float _1175 = _1171;
    float _1177 = _1169;
    if (_1129)
    {
        float _1179 = _1159 * 6.283185482025146484375;
        float _1181 = cos(_1179);
        _1173 = _1181;
    }
    float _1183 = _1173;
    float _1185 = -_1115;
    float _1187 = -_1171;
    float _1189 = fma(_1095, _1185, _1187);
    float _1191 = _1189;
    if (_1129)
    {
        float _1193 = _1189 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1175 = _1193;
    }
    float _1195 = _1175;
    float _1197 = _1167;
    float _1199 = _1195;
    if (_1129)
    {
        float _1201 = fma(_1167, _1195, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1197 = _1201;
    }
    float _1203 = _1197;
    float _1205 = _1203;
    if (!_1129)
    {
        _1199 = _1117;
    }
    float _1207 = _1199;
    float _1209 = _1207;
    float _1211 = _1183;
    if (_1129)
    {
        float _1213 = _1183 + (-1.0);
        _1177 = _1213;
    }
    float _1215 = _1177;
    float _1217 = _1215;
    if (_1129)
    {
        float _1219 = _1149 * _1203;
        _1205 = _1219;
    }
    float _1221 = _1205;
    if (!_1129)
    {
        _1151 = _1121;
    }
    float _1223 = _1151;
    float _1225 = _1223;
    if (_1129)
    {
        float _1227 = _1215 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1141 = _1227;
    }
    float _1229 = _1141;
    if (_1129)
    {
        float _1231 = _1117 * _1221;
        _1209 = _1231;
    }
    float _1233 = _1209;
    if (!_1129)
    {
        _1217 = _1119;
    }
    float _1235 = _1217;
    float _1237 = _1235;
    if (_1129)
    {
        float _1239 = _1119 * _1221;
        _1237 = _1239;
    }
    float _1241 = _1237;
    if (_1129)
    {
        float _1243 = fma(_1189, _1183, _1229);
        _1191 = _1243;
    }
    float _1245 = _1191;
    if (_1129)
    {
        float _1247 = _1233 * _1233;
        _1225 = _1247;
    }
    float _1249 = _1225;
    if (!_1129)
    {
        _1211 = _1123;
    }
    float _1251 = _1211;
    float _1253 = _1251;
    if (_1129)
    {
        float _1255 = _1241 * _1241;
        _1253 = _1255;
    }
    float _1257 = _1253;
    float _1259 = fma(_1245, _1245, _1249);
    float _1261 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1263 = _1259 + _1257;
    float _1265 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1261);
    float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1269 = fma(_1113, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1267);
    float _1271 = precise::clamp(_1269, 0.0, 1.0);
    float _1273 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1275 = rsqrt(_1263);
    float _1277 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1265);
    float _1279 = -_1271;
    float _1281 = _1279 + 1.0;
    float _1283 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1285 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1273);
    float _1287 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1289 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1291 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1283);
    float _1293 = abs(_1281);
    float _1295 = log2(_1293);
    float _1297 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1285);
    float _1299 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1289);
    float _1301 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1291);
    float _1303 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1305 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1307 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1299);
    float _1309 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1311 = _1275 * _1233;
    float _1313 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1315 = _1275 * _1245;
    float _1317 = _1287 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1319 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1321 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1313);
    float _1323 = _1275 * _1241;
    float _1325 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1327 = -_1319;
    float _1329 = fma(_1315, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1327);
    float _1331 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1333 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1321);
    float _1335 = -_1317;
    float _1337 = fma(_1335, _1303, 1.0);
    float _1339 = -_1323;
    float _1341 = fma(_1339, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1329);
    float _1343 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1345 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1333);
    float _1347 = exp2(_1331);
    float _1349 = fma(_1341, -0.5, 0.5);
    float _1351 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1353 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1343);
    float _1355 = fma(_1341, 0.5, 0.5);
    float _1357 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1351);
    float _1359 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1353);
    float _1361 = log2(_1337);
    float _1363 = _1315 + 1.0;
    float _1365 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1357);
    float _1367 = fma(_1355, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1369 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1359);
    float _1371 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1365);
    float _1373 = fma(_1355, _1367, -0.212114393711090087890625);
    float _1375 = 1.0 / _1345;
    float _1377 = -_1315;
    float _1379 = fma(_1347, _1363, _1377);
    float _1381 = fma(_1355, _1373, 1.570728778839111328125);
    float _1383 = sqrt(_1349);
    float _1385 = _1361 * 0.693147182464599609375;
    float _1387 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1389 = _1369 * _1375;
    float _1391 = _1371 * _1375;
    float _1393 = fma(_1389, 0.5, 0.5);
    float _1395 = fma(_1391, -0.5, 0.5);
    float _1397 = _1383 * 0.636619746685028076171875;
    float _1399 = fma(_1379, 0.5, 0.5);
    float3 _3983 = float3(_1393, _1395, _1387);
    float _1401 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3983, float3(0.0), isnan(_3983)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3983, float3(0.0), isnan(_3983)), level(0.0)).x;
    float _1403 = -_1381;
    float _1405 = fma(_1397, _1403, 1.0);
    float3 _3999 = float3(_1393, _1395, _1387);
    float4 _1408 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3999, float3(0.0), isnan(_3999)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3999, float3(0.0), isnan(_3999)), level(0.0)).xyzw;
    float _1410 = _1408.x;
    float _1412 = _1408.y;
    float _1414 = _1408.z;
    float _1416 = _1408.w;
    float2 _4016 = float2(_1405, _1399);
    float3 _1420 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4016, float2(0.0), isnan(_4016)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4016, float2(0.0), isnan(_4016)), level(0.0)).xyz;
    float _1422 = _1420.x;
    float _1424 = _1420.y;
    float _1426 = _1420.z;
    float _1428 = in.m_51.w;
    int _1430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1432 = _1430 != 0;
    float _1434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1438 = _1436 != 0;
    float _1440 = _417 + 0.5;
    bool _1442 = _161 > 0.5;
    float _1444 = -_477;
    float _1446 = _1444 + 0.5;
    bool _1448 = _175 > 0.5;
    float _1450 = _1440 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1454 = _1452 != 0;
    float _1456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1458 = -_439;
    int _1460 = _1448 ? as_type<int>(_1458) : as_type<int>(_439);
    float _1462 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1464 = _153 > 0.5;
    float _1466 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1470 = _1468 != 0;
    float _1472 = _935 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_58.x = _975;
    out.m_58.y = _989;
    out.m_58.z = _981;
    float _1474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1476 = 0.0;
    float _1478 = _1395;
    float _1480 = _1393;
    float _1482 = _1371;
    if (_1432)
    {
        float _1484 = _1428 * 3.1415927410125732421875;
        _1476 = _1484;
    }
    float _1486 = _1476;
    if (_1438)
    {
        float _1488 = _161 * 3.1415927410125732421875;
        _1478 = _1488;
    }
    float _1490 = _1478;
    bool _1492 = _1428 > 0.5;
    float _1494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _1496 = _1492;
    if (_1432)
    {
        float _1498 = _1486 * 0.15915493667125701904296875;
        _1480 = _1498;
    }
    float _1500 = _1480;
    if (_1438)
    {
        float _1502 = _1490 * 0.15915493667125701904296875;
        _219 = _1502;
    }
    float _1504 = _219;
    float _1506 = -_349;
    int _1508 = _1442 ? as_type<int>(_1506) : as_type<int>(_349);
    float _1510 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1466);
    int _1512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1514 = _1512 != 0;
    bool _1516 = !_1454;
    float _1518 = _1516 ? _349 : as_type<float>(_1508);
    float _1520 = _1500;
    bool _1522 = _1514;
    if (_1432)
    {
        float _1524 = _1500 * 6.283185482025146484375;
        float _1526 = sin(_1524);
        _1520 = _1526;
    }
    float _1528 = _1520;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1532 = _1530 != 0;
    float _1534 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1510);
    bool _1536 = !_1514;
    float _1538 = _1536 ? _439 : as_type<float>(_1460);
    float _1540 = _1518 + 0.5;
    float _1542 = -_349;
    int _1544 = _1464 ? as_type<int>(_1542) : as_type<int>(_349);
    float _1546 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1534);
    float _1548 = -_1538;
    float _1550 = _1548 + 0.5;
    bool _1552 = !_1470;
    float _1554 = _1552 ? _349 : as_type<float>(_1544);
    float _1556 = _1504;
    if (_1438)
    {
        float _1558 = _1504 * 6.283185482025146484375;
        float _1560 = sin(_1558);
        _1556 = _1560;
    }
    float _1562 = _1556;
    float _1564 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1566 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1568 = _1554 + 0.5;
    if (_1432)
    {
        bool _1570 = _1528 > 0.5;
        _1522 = _1570;
    }
    bool _1572 = _1522;
    float _1574 = -_439;
    int _1576 = _1492 ? as_type<int>(_1574) : as_type<int>(_439);
    float _1578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1580 = _1568 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1584 = !_1532;
    float _1586 = _1584 ? _439 : as_type<float>(_1576);
    float _1588 = _1564 * _1434;
    float _1590 = _1566 * _1456;
    float _1592 = _1580 * _1474;
    float _1594 = -_1586;
    float _1596 = _1594 + 0.5;
    if (_1438)
    {
        bool _1598 = _1562 > 0.5;
        _1496 = _1598;
    }
    bool _1600 = _1496;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1604 = _1582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1608 = _439 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1610 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1612 = _1602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1614 = _1606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1616 = fma(_1608, _1608, 1.0);
    float _1618 = _1610 * _1578;
    float _1620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1622 = _1578;
    if (!_1438)
    {
        _1622 = _439;
    }
    float _1624 = _1622;
    out.m_60.x = _1604;
    out.m_60.y = _1612;
    out.m_60.z = _1614;
    float _1626 = _1624;
    if (_1438)
    {
        float _1628 = -_439;
        float _1630 = _1600 ? _1628 : _439;
        _1626 = _1630;
    }
    float _1632 = _1626;
    if (_1432)
    {
        float _1634 = -_349;
        float _1636 = _1572 ? _1634 : _349;
        _405 = _1636;
    }
    float _1638 = _405;
    out.m_62.x = _1588;
    out.m_62.y = _1590;
    out.m_62.z = _1592;
    out.m_62.w = _1618;
    bool _1640 = _1113 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1642 = isnan(_1113);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1648 = _1644 || _1646;
    float _1650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1652 = -_1632;
    float _1654 = _1652 + 0.5;
    float _1656 = _1638 + 0.5;
    float _1658 = _1654 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1660 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1662 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1664 = rsqrt(_1616);
    float _1666 = _977 * _1608;
    float _1668 = -_1608;
    float _1670 = _959 * _1668;
    float _1672 = _1450 * _1620;
    float _1674 = _1662 * _1494;
    float _1676 = fma(_989, _1472, _1666);
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1680 = _1546 + _1678;
    float _1682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1684 = _1462 * _1650;
    float _1686 = _961 * _1608;
    float _1688 = fma(_975, _1472, _1670);
    float _1690 = _1345 + _1680;
    out.m_64.x = _1672;
    out.m_64.y = _1684;
    float _1692 = fma(_981, _1472, _1686);
    float _1694 = exp2(_1660);
    float _1696 = _1608 * _1664;
    float _1698 = _999 + _1676;
    float _1700 = _987 + _1692;
    float _1702 = -_1696;
    float _1704 = _967 * _1702;
    float _1706 = _1658 * _1682;
    float _1708 = -_1696;
    float _1710 = _999 * _1708;
    float _1712 = -_1696;
    float _1714 = _987 * _1712;
    out.m_66.x = _1674;
    out.m_66.y = _1706;
    float _1716 = -_1694;
    float _1718 = _1716 + 1.0;
    float _1720 = fma(_977, _1664, _1710);
    float _1722 = -_959;
    float _1724 = fma(_1722, _1664, _1704);
    float _1726 = fma(_961, _1664, _1714);
    float _1728 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1730 = _1690 * 0.5;
    float _1732 = _967 + _1688;
    float _1734 = -_1728;
    float _1736 = _1734 + 1.0;
    out.m_68.x = _1724;
    out.m_68.y = _1720;
    out.m_68.z = _1726;
    out.m_70.z = _1730;
    out.m_70.w = _1345;
    out.m_72.x = _1732;
    out.m_72.y = _1698;
    out.m_72.z = _1700;
    out.gl_Position.x = _1369;
    out.gl_Position.y = _1371;
    out.gl_Position.z = _1680;
    out.gl_Position.w = _1345;
    float _1738 = _1369;
    float _1740 = _1728;
    if (!_1648)
    {
        _1482 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1742 = _1482;
    float _1744 = _1742;
    float _1746 = _1742;
    if (!_1648)
    {
        _1738 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1748 = _1738;
    float _1750 = _1728 * _1401;
    float _1752 = _1748;
    float _1754 = _1748;
    if (!_1648)
    {
        _1740 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1756 = _1740;
    float _1758 = _1416 * _1750;
    float _1760 = _1416 * _1736;
    float _1762 = _1426 * _1750;
    float _1764 = fma(_1422, _1758, _1410);
    float _1766 = fma(_1424, _1758, _1412);
    float _1768 = fma(_1416, _1762, _1414);
    out.m_74.x = _1764;
    out.m_74.y = _1766;
    out.m_74.z = _1768;
    out.m_74.w = _1760;
    bool _1770 = !_1648;
    float _1772 = _1756;
    float _1774 = _1756;
    if (!_1770)
    {
        bool _1776 = _1113 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1778 = isnan(_1113);
        bool _1780 = _1776 || _1778;
        bool _1782 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1784 = _1780 || _1782;
        if (!_1784)
        {
            float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1788 = _1113 + _1786;
            float _1790 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1792 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1790;
            float _1794 = 1.0 / _1792;
            float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1798 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1802 = _1800 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1804 = _1788 * _1794;
            float _1806 = precise::clamp(_1804, 0.0, 1.0);
            float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1810 = _1808 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1812 = fma(_1806, _1802, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1814 = fma(_1806, _1810, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1816 = fma(_1806, _1798, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1754 = _1816;
            _1746 = _1814;
            _1774 = _1812;
            _1818 = true;
        }
        else
        {
            bool _1820 = _1113 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1822 = isnan(_1113);
            bool _1824 = _1820 || _1822;
            bool _1826 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1828 = _1824 || _1826;
            if (!_1828)
            {
                _1744 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1830 = _1744;
            _1746 = _1830;
            if (!_1828)
            {
                _1752 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1832 = _1752;
            _1754 = _1832;
            if (!_1828)
            {
                _1772 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1834 = _1772;
            bool _1836 = !_1828;
            _1774 = _1834;
            if (!_1836)
            {
                bool _1838 = _1113 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1840 = isnan(_1113);
                bool _1842 = _1838 || _1840;
                bool _1844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1846 = _1842 || _1844;
                if (!_1846)
                {
                    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1850 = _1113 + _1848;
                    float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1854 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1852;
                    float _1856 = 1.0 / _1854;
                    float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1860 = _1858 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1864 = _1862 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1866 = _1850 * _1856;
                    float _1868 = precise::clamp(_1866, 0.0, 1.0);
                    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1872 = _1870 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1874 = fma(_1868, _1864, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1876 = fma(_1868, _1872, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1878 = fma(_1868, _1860, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1754 = _1878;
                    _1746 = _1876;
                    _1774 = _1874;
                    _1818 = true;
                }
                else
                {
                    _1754 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1746 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1774 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1818 = false;
    float _1880 = _1754;
    float _1882 = _1746;
    float _1884 = _1774;
    float _1886 = _1880 * 0.586610972881317138671875;
    bool _1888 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_76.x = 0.0;
    float _1890 = fma(_1882, 0.298911988735198974609375, _1886);
    float _1892 = fma(_1884, 0.114477999508380889892578125, _1890);
    float _1894 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1896 = -_1892;
    float _1898 = _1896 + _1882;
    float _1900 = -_1892;
    float _1902 = _1900 + _1880;
    float _1904 = -_1892;
    float _1906 = _1904 + _1884;
    out.m_47.x = _1894;
    float _1908 = fma(_1898, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1892);
    float _1910 = fma(_1902, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1892);
    float _1912 = fma(_1906, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1892);
    out.m_78.x = _1908;
    out.m_78.y = _1910;
    out.m_78.z = _1912;
    if (!_1888)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1914 = -_1085;
    float _1916 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1918 = -_1087;
    float _1920 = _1918 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1922 = -_1089;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1926 = _1916 * _1916;
    float _1928 = fma(_1920, _1920, _1926);
    float _1930 = fma(_1924, _1924, _1928);
    float _1932 = sqrt(_1930);
    float _1934 = rsqrt(_1930);
    float _1936 = -_1932;
    float _1938 = _1936 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1940 = _1938 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1942 = precise::clamp(_1940, 0.0, 1.0);
    float _1944 = _1920 * _1934;
    float _1946 = _1916 * _1934;
    float _1948 = abs(_1942);
    float _1950 = log2(_1948);
    float _1952 = _1924 * _1934;
    float _1954 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1956 = _1698 * _1946;
    float _1958 = -_1946;
    float _1960 = -_1954;
    float _1962 = fma(_1958, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1960);
    float _1964 = fma(_1732, _1944, _1956);
    float _1966 = -_1952;
    float _1968 = fma(_1966, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1962);
    float _1970 = fma(_1700, _1952, _1964);
    float _1972 = precise::clamp(_1970, 0.0, 1.0);
    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1976 = _1968 + _1974;
    float _1978 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1980 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1982 = precise::clamp(_1980, 0.0, 1.0);
    float _1984 = exp2(_1978);
    float _1986 = _1984 * _1982;
    float _1988 = _1972 * _1986;
    float _1990 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1992 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1994 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_76.x = _1990;
    out.m_76.y = _1992;
    out.m_76.z = _1994;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1818 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_44.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    float _105 = as_type<float>(_97);
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _103;
    if (!_101)
    {
        out.m_47.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2051 = as_type<float>(_113);
        out.gl_Position.z = _2051;
    }
    if (!_101)
    {
        return out;
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_97);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    int _147 = 0;
    if (_141)
    {
        float _149 = _145 * 5.0;
        _147 = as_type<int>(_149);
    }
    int _151 = _147;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2121 = as_type<float>(_151);
        out.gl_Position.z = _2121;
    }
    if (_141)
    {
        return out;
    }
    float _153 = in.m_51.z;
    float _155 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _157 = log2(_155);
    float _159 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _161 = in.m_51.x;
    float _163 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_51.y;
    float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_49.x;
    float _183 = in.m_49.y;
    float _185 = in.m_49.z;
    float _187 = _157 * _129;
    float _189 = exp2(_187);
    float _191 = _153 * 2.0;
    float _193 = _163 * _177;
    float _195 = _177;
    if (!_173)
    {
        _195 = _159;
    }
    float _197 = _195;
    float _199 = _161 * 2.0;
    float _201 = floor(_191);
    float _203 = _175 * 2.0;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    float _209 = floor(_199);
    int _211 = as_type<int>(_179) & 2;
    bool _213 = _211 != 0;
    float _215 = _179;
    float _217 = _197;
    float _219 = _161;
    if (!_173)
    {
        float _221 = _159 * _159;
        float _223 = _221 * 0.5;
        _215 = _223;
    }
    float _225 = _215;
    float _227 = _225;
    if (!_173)
    {
        float _229 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = _201 > 0.0;
    float _235 = floor(_203);
    bool _237 = _201 >= 0.0;
    bool _239 = isnan(_201);
    bool _241 = _237 || _239;
    bool _243 = isnan(0.0);
    bool _245 = _241 || _243;
    int _247 = _245 ? 0 : 1;
    bool _249 = _209 > 0.0;
    int _251 = ~_247;
    int _253 = _251 + 1;
    int _255 = _253 + 1;
    bool _257 = _209 >= 0.0;
    bool _259 = isnan(_209);
    bool _261 = _257 || _259;
    bool _263 = isnan(0.0);
    bool _265 = _261 || _263;
    int _267 = _255;
    float _269 = _231;
    if (!_233)
    {
        int _271 = ~_247;
        int _273 = _271 + 1;
        _267 = _273;
    }
    int _275 = _267;
    bool _277 = !_173;
    if (!_277)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _159 * _281;
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _159);
        float _305 = _303 * _291;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _269 = _307;
    }
    float _309 = _269;
    bool _311 = !_173;
    if (!_311)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = 1.0 / _319;
        float _323 = _159 * _315;
        float _325 = exp2(_323);
        float _327 = -_325;
        float _329 = _327 + 1.0;
        float _331 = _329 * _321;
        _217 = _331;
    }
    float _333 = _217;
    float _335 = in.m_56.w;
    float _337 = -_189;
    float _339 = _337 + 1.0;
    float _341 = in.m_44.x;
    float _343 = in.m_44.y;
    float _345 = in.m_44.z;
    bool _347 = !_207;
    float _349 = _347 ? (-0.5) : 0.5;
    float _351 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[20].x, _193);
    bool _353 = _175 > 0.5;
    bool _355 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _357 = isnan(0.0);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _363 = _359 || _361;
    int _365 = _265 ? 0 : 1;
    int _367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _369 = _367 != 0;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _373 = _371 != 0;
    float _375 = -_349;
    int _377 = _353 ? as_type<int>(_375) : as_type<int>(_349);
    bool _379 = _235 > 0.0;
    bool _381 = _235 >= 0.0;
    bool _383 = isnan(_235);
    bool _385 = _381 || _383;
    bool _387 = isnan(0.0);
    bool _389 = _385 || _387;
    float _391 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _393 = ~_365;
    int _395 = _393 + 1;
    int _397 = _395 + 1;
    float _399 = _363 ? _339 : 0.0;
    float _401 = fma(_333, _183, _391);
    int _403 = _397;
    float _405 = _349;
    if (!_249)
    {
        int _407 = ~_365;
        int _409 = _407 + 1;
        _403 = _409;
    }
    int _411 = _403;
    float _413 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _415 = !_369;
    float _417 = _415 ? _349 : as_type<float>(_377);
    float _419 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _421 = _153 > 0.5;
    float _423 = fma(_333, _185, _413);
    float _425 = fma(_333, _181, _419);
    float _427 = fma(_401, _335, _343);
    float _429 = fma(_425, _335, _341);
    float _431 = _427 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _433 = _427 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _435 = fma(_423, _335, _345);
    bool _437 = !_213;
    float _439 = _437 ? (-0.5) : 0.5;
    float _441 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].x, _431);
    float _443 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].x, _433);
    int _445 = _389 ? 0 : 1;
    float _447 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].z, _441);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].z, _443);
    float _451 = -_439;
    int _453 = _421 ? as_type<int>(_451) : as_type<int>(_439);
    float _455 = _447 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _457 = _449 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _461 = _459 != 0;
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _465 = _463 != 0;
    float _467 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _469 = _455 + _467;
    float _471 = -_457;
    float _473 = _471 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _475 = !_373;
    float _477 = _475 ? _439 : as_type<float>(_453);
    bool _479 = !_465;
    int _481 = _479 ? 0 : 1;
    float _483 = abs(_469);
    float _485 = abs(_473);
    float _487 = precise::max(_483, _485);
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _495 = _493 != 0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _499 = _497 != 0;
    float _501 = _175 + _153;
    bool _503 = _487 >= 16.0;
    float _505 = _501 + (-1.0);
    bool _507 = !_461;
    int _509 = _507 ? 0 : 1;
    int _511 = ~_445;
    int _513 = _511 + 1;
    int _515 = _513 + 1;
    int _517 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _519 = _517 != 0;
    int _521 = _515;
    float _523 = _469;
    float _525 = _473;
    if (!_379)
    {
        int _527 = ~_445;
        int _529 = _527 + 1;
        _521 = _529;
    }
    int _531 = _521;
    if (_503)
    {
        float _533 = _469 * 0.0625;
        _523 = _533;
    }
    float _535 = _523;
    bool _537 = !_491;
    int _539 = _537 ? 0 : 1;
    if (_503)
    {
        float _541 = _473 * 0.0625;
        _525 = _541;
    }
    float _543 = _525;
    bool _545 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _547 = isnan(1.0);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _553 = _549 || _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _557 = 1.0 + _555;
    int _559 = abs(_539);
    float _561 = _161 + _175;
    float _563 = 1.0 / _557;
    float _565 = float(_275);
    float _567 = _561 + (-1.0);
    float _569 = float(_559);
    float _571 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _573 = abs(_535);
    bool _575 = _573 != 0.0;
    bool _577 = isnan(_573);
    bool _579 = _575 || _577;
    bool _581 = isnan(0.0);
    bool _583 = _579 || _581;
    float _585 = _161 + _153;
    bool _587 = !_495;
    int _589 = _587 ? 0 : 1;
    float _591 = _569 * _565;
    float _593 = abs(_543);
    bool _595 = _593 == 0.0;
    bool _597 = !_583;
    bool _599 = _595 && _597;
    float _601 = _585 + (-1.0);
    bool _603 = !_499;
    int _605 = _603 ? 0 : 1;
    int _607 = abs(_589);
    bool _609 = _553;
    int _611 = as_type<int>(_571);
    int _613 = _583 ? (-1) : 0;
    if (_553)
    {
        float _615 = _399 * _563;
        _131 = _615;
    }
    float _617 = _131;
    int _619 = abs(_605);
    float _621 = _591 * (-2.0);
    float _623 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _625 = float(_411);
    float _627 = floor(_351);
    float _629 = float(_607);
    float _631 = _351 * 6.283185482025146484375;
    int _633 = as_type<int>(_625);
    if (_599)
    {
        bool _635 = as_type<int>(_543) >= 0;
        _609 = _635;
    }
    bool _637 = _609;
    float _639 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _641 = float(_531);
    float _643 = _629 * _625;
    float _645 = _631 * 0.15915493667125701904296875;
    if (_599)
    {
        int _647 = _637 ? 0 : 1078530011;
        _633 = _647;
    }
    int _649 = _633;
    float _651 = fma(_639, _621, _639);
    float _653 = abs(_543);
    bool _655 = _653 == 0.0;
    float _657 = _645 * 6.283185482025146484375;
    float _659 = cos(_657);
    float _661 = float(_619);
    float _663 = _161 + (-0.5);
    float _665 = _643 * (-2.0);
    float _667 = -_627;
    float _669 = _351 + _667;
    float _671 = _661 * _641;
    float _673 = _663 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _675 = _671 * (-2.0);
    float _677 = fma(_571, _665, _571);
    float _679 = fma(_651, _617, _673);
    if (_599)
    {
        int _681 = int(0x80000000) & as_type<int>(_535);
        int _683 = _649 | _681;
        _611 = _683;
    }
    int _685 = _611;
    float _687 = fma(_623, _675, _623);
    bool _689 = !_583;
    bool _691 = _689 && _655;
    int _693 = _685;
    float _695 = as_type<float>(_685);
    if (!_691)
    {
        float _697 = abs(_535);
        bool _699 = _697 != as_type<float>(0x7f800000u /* inf */);
        bool _701 = isnan(_697);
        bool _703 = _699 || _701;
        bool _705 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _707 = _703 || _705;
        float _709 = abs(_543);
        bool _711 = _709 == as_type<float>(0x7f800000u /* inf */);
        bool _713 = !_707;
        bool _715 = _711 && _713;
        if (_715)
        {
            bool _717 = as_type<int>(_543) >= 0;
            _613 = _717 ? (-1) : 0;
        }
        int _719 = _613;
        if (_715)
        {
            _693 = 1075235812;
        }
        int _721 = _693;
        int _723 = _721;
        if (_715)
        {
            int _725 = ~_719;
            int _727 = (_725 != 0) ? _721 : 1061752795;
            _723 = _727;
        }
        int _729 = _723;
        float _731 = abs(_543);
        bool _733 = _731 == as_type<float>(0x7f800000u /* inf */);
        float _735 = as_type<float>(_729);
        if (_715)
        {
            int _737 = int(0x80000000) & as_type<int>(_535);
            int _739 = _729 | _737;
            _735 = as_type<float>(_739);
        }
        float _741 = _735;
        bool _743 = !_707;
        bool _745 = _743 && _733;
        _695 = _741;
        if (!_745)
        {
            float _747 = abs(_535);
            float _749 = abs(_543);
            float _751 = precise::max(_747, _749);
            float _753 = abs(_535);
            float _755 = abs(_543);
            float _757 = precise::min(_753, _755);
            float _759 = 1.0 / _751;
            float _761 = abs(_535);
            float _763 = abs(_543);
            bool _765 = _761 > _763;
            bool _767 = as_type<int>(_543) >= 0;
            float _769 = _757 * _759;
            float _771 = _769 * _769;
            float _773 = _771 + 11.33538818359375;
            float _775 = fma(_771, _773, 28.84246826171875);
            float _777 = fma(_771, _775, 19.6966705322265625);
            float _779 = fma(_771, -0.82336294651031494140625, -5.674867153167724609375);
            float _781 = fma(_771, _779, -6.565555095672607421875);
            float _783 = 1.0 / _777;
            float _785 = _771 * _781;
            float _787 = abs(_535);
            float _789 = abs(_543);
            float _791 = _787 + _789;
            int _793 = as_type<int>(_535) & int(0x80000000);
            float _795 = _769 * _785;
            bool _797 = _791 > as_type<float>(0x7f800000u /* inf */);
            bool _799 = isnan(_791);
            bool _801 = _797 || _799;
            bool _803 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _805 = _801 || _803;
            float _807 = fma(_795, _783, _769);
            float _809 = _807;
            _695 = _791;
            if (_765)
            {
                float _811 = -_807;
                float _813 = _811 + 1.57079637050628662109375;
                _809 = _813;
            }
            float _815 = _809;
            int _817 = as_type<int>(_815);
            if (!_767)
            {
                float _819 = -_815;
                float _821 = _819 + 3.1415927410125732421875;
                _817 = as_type<int>(_821);
            }
            int _823 = _817;
            if (!_805)
            {
                int _825 = _793 | _823;
                _695 = as_type<float>(_825);
            }
        }
    }
    float _827 = _695;
    float _829 = _153 + (-0.5);
    float _831 = _175 + (-0.5);
    float _833 = _679 * 0.15915493667125701904296875;
    float _835 = _829 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _837 = _669 < 0.5;
    float _839 = float(_837);
    float _841 = _831 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _843 = -_669;
    float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _847 = fma(_687, _617, _835);
    int _849 = abs(_509);
    float _851 = -_839;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _855 = fma(_677, _617, _841);
    bool _857 = !_519;
    int _859 = _857 ? 0 : 1;
    float _861 = in.m_56.x;
    float _863 = in.m_56.y;
    float _865 = _847 * 0.15915493667125701904296875;
    float _867 = -_827;
    float _869 = _855 + _867;
    int _871 = abs(_859);
    float _873 = fma(_659, 0.5, 0.5);
    float _875 = _833 * 6.283185482025146484375;
    float _877 = sin(_875);
    int _879 = abs(_481);
    float _881 = _869 * 0.15915493667125701904296875;
    float _883 = float(_849);
    float _885 = -_873;
    float _887 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _889 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _891 = float(_871);
    float _893 = _833 * 6.283185482025146484375;
    float _895 = cos(_893);
    float _897 = _427 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[193].x + (-1.0);
    float _901 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].x, _897);
    float _903 = _865 * 6.283185482025146484375;
    float _905 = cos(_903);
    float _907 = abs(_845);
    float _909 = _883 * _907;
    bool _911 = !_213;
    float _913 = _911 ? 0.0 : 1.0;
    float _915 = _863 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _917 = float(_879);
    float _919 = fma(_891, _887, _909);
    float _921 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].z, _901);
    float _923 = fma(_913, _899, 1.0);
    float _925 = _881 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = abs(_853);
    float _931 = fma(_917, _929, _919);
    float _933 = _861 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _935 = _349 * _923;
    float _937 = _931 * _915;
    float _939 = _931 * _933;
    float _941 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _935);
    float _943 = _881 * 6.283185482025146484375;
    float _945 = cos(_943);
    float _947 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _439);
    float _949 = _939 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _951 = _937 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _953 = _949 * _941;
    float _955 = _951 * _947;
    float _957 = _865 * 6.283185482025146484375;
    float _959 = sin(_957);
    float _961 = _877 * _905;
    float _963 = _895 * _927;
    float _965 = _877 * _927;
    float _967 = _927 * _905;
    float _969 = _961 * _955;
    float _971 = _877 * _945;
    float _973 = _895 * _945;
    float _975 = _945 * _905;
    float _977 = _895 * _905;
    float _979 = -_963;
    float _981 = fma(_959, _971, _979);
    float _983 = -_955;
    float _985 = _959 * _983;
    float _987 = fma(_959, _965, _973);
    float _989 = fma(_959, _973, _965);
    float _991 = fma(_981, _953, _969);
    float _993 = fma(_975, _953, _985);
    float _995 = _977 * _955;
    float _997 = -_971;
    float _999 = fma(_959, _963, _997);
    float _1001 = fma(_987, _889, _991);
    float _1003 = fma(_967, _889, _993);
    float _1005 = fma(_989, _953, _995);
    float _1007 = _921 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1009 = _457 + _1001;
    float _1011 = _455 + _1003;
    float _1013 = fma(_999, _889, _1005);
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1017 = _1009 + _1015;
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1021 = _1011 + _1019;
    float _1023 = _1007 + _1013;
    float _1025 = _1017 * _1017;
    float _1027 = fma(_1021, _1021, _1025);
    float _1029 = sqrt(_1027);
    bool _1031 = _1029 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1033 = _973;
    float _1035 = _1011;
    float _1037 = _1009;
    float _1039 = _1029;
    float _1041 = _953;
    if (!_1031)
    {
        _1033 = _1023;
    }
    float _1043 = _1033;
    bool _1045 = !_1031;
    float _1047 = _1043;
    if (!_1045)
    {
        float _1049 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1053 = _1029 + _1051;
        float _1055 = rsqrt(_1027);
        float _1057 = _1053 * _1049;
        float _1059 = _1023 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1061 = _1057 * 0.15915493667125701904296875;
        float _1063 = _1061 * 6.283185482025146484375;
        float _1065 = cos(_1063);
        float _1067 = _1061 * 6.283185482025146484375;
        float _1069 = sin(_1067);
        float _1071 = _1065 + (-1.0);
        float _1073 = _1071 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1075 = fma(_1069, _1059, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1077 = fma(_1023, _1065, _1073);
        float _1079 = _1055 * _1075;
        float _1081 = fma(_1021, _1079, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1083 = fma(_1017, _1079, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1047 = _1077;
        _1035 = _1081;
        _1037 = _1083;
        _1039 = _1061;
    }
    float _1085 = _1047;
    float _1087 = _1035;
    float _1089 = _1037;
    float _1091 = _1039;
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1095 = _1085 + _1093;
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1099 = _1087 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1103 = _1089 + _1101;
    float _1105 = _1095 * _1095;
    float _1107 = fma(_1099, _1099, _1105);
    float _1109 = fma(_1103, _1103, _1107);
    float _1111 = rsqrt(_1109);
    float _1113 = sqrt(_1109);
    float _1115 = _1111 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1117 = _1099 * _1115;
    float _1119 = _1103 * _1115;
    float _1121 = _1117 * _1117;
    float _1123 = _1119 * _1119;
    float _1125 = _1121 + _1123;
    float _1127 = sqrt(_1125);
    bool _1129 = _1127 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1133 = _1127 + _1131;
    float _1135 = _1103;
    float _1137 = _1125;
    float _1139 = _1133;
    float _1141 = _1115;
    if (_1129)
    {
        float _1143 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1135 = _1143;
    }
    float _1145 = _1135;
    if (_1129)
    {
        float _1147 = rsqrt(_1125);
        _1137 = _1147;
    }
    float _1149 = _1137;
    float _1151 = _1149;
    if (_1129)
    {
        float _1153 = _1133 * _1145;
        _1139 = _1153;
    }
    float _1155 = _1139;
    if (_1129)
    {
        float _1157 = _1155 * 0.15915493667125701904296875;
        _1041 = _1157;
    }
    float _1159 = _1041;
    float _1161 = _1091;
    if (_1129)
    {
        float _1163 = _1159 * 6.283185482025146484375;
        float _1165 = sin(_1163);
        _1161 = _1165;
    }
    float _1167 = _1161;
    float _1169 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1171 = precise::max(0.0, _1169);
    float _1173 = _1111;
    float _1175 = _1171;
    float _1177 = _1169;
    if (_1129)
    {
        float _1179 = _1159 * 6.283185482025146484375;
        float _1181 = cos(_1179);
        _1173 = _1181;
    }
    float _1183 = _1173;
    float _1185 = -_1115;
    float _1187 = -_1171;
    float _1189 = fma(_1095, _1185, _1187);
    float _1191 = _1189;
    if (_1129)
    {
        float _1193 = _1189 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1175 = _1193;
    }
    float _1195 = _1175;
    float _1197 = _1167;
    float _1199 = _1195;
    if (_1129)
    {
        float _1201 = fma(_1167, _1195, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1197 = _1201;
    }
    float _1203 = _1197;
    float _1205 = _1203;
    if (!_1129)
    {
        _1199 = _1117;
    }
    float _1207 = _1199;
    float _1209 = _1207;
    float _1211 = _1183;
    if (_1129)
    {
        float _1213 = _1183 + (-1.0);
        _1177 = _1213;
    }
    float _1215 = _1177;
    float _1217 = _1215;
    if (_1129)
    {
        float _1219 = _1149 * _1203;
        _1205 = _1219;
    }
    float _1221 = _1205;
    if (!_1129)
    {
        _1151 = _1121;
    }
    float _1223 = _1151;
    float _1225 = _1223;
    if (_1129)
    {
        float _1227 = _1215 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1141 = _1227;
    }
    float _1229 = _1141;
    if (_1129)
    {
        float _1231 = _1117 * _1221;
        _1209 = _1231;
    }
    float _1233 = _1209;
    if (!_1129)
    {
        _1217 = _1119;
    }
    float _1235 = _1217;
    float _1237 = _1235;
    if (_1129)
    {
        float _1239 = _1119 * _1221;
        _1237 = _1239;
    }
    float _1241 = _1237;
    if (_1129)
    {
        float _1243 = fma(_1189, _1183, _1229);
        _1191 = _1243;
    }
    float _1245 = _1191;
    if (_1129)
    {
        float _1247 = _1233 * _1233;
        _1225 = _1247;
    }
    float _1249 = _1225;
    if (!_1129)
    {
        _1211 = _1123;
    }
    float _1251 = _1211;
    float _1253 = _1251;
    if (_1129)
    {
        float _1255 = _1241 * _1241;
        _1253 = _1255;
    }
    float _1257 = _1253;
    float _1259 = fma(_1245, _1245, _1249);
    float _1261 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1263 = _1259 + _1257;
    float _1265 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1261);
    float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1269 = fma(_1113, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1267);
    float _1271 = precise::clamp(_1269, 0.0, 1.0);
    float _1273 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1275 = rsqrt(_1263);
    float _1277 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1265);
    float _1279 = -_1271;
    float _1281 = _1279 + 1.0;
    float _1283 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1285 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1273);
    float _1287 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1289 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1291 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1283);
    float _1293 = abs(_1281);
    float _1295 = log2(_1293);
    float _1297 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1285);
    float _1299 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1289);
    float _1301 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1291);
    float _1303 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1305 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1307 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1299);
    float _1309 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1311 = _1275 * _1233;
    float _1313 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1315 = _1275 * _1245;
    float _1317 = _1287 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1319 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1321 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1313);
    float _1323 = _1275 * _1241;
    float _1325 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1327 = -_1319;
    float _1329 = fma(_1315, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1327);
    float _1331 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1333 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1321);
    float _1335 = -_1317;
    float _1337 = fma(_1335, _1303, 1.0);
    float _1339 = -_1323;
    float _1341 = fma(_1339, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1329);
    float _1343 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1345 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1333);
    float _1347 = exp2(_1331);
    float _1349 = fma(_1341, -0.5, 0.5);
    float _1351 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1353 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1343);
    float _1355 = fma(_1341, 0.5, 0.5);
    float _1357 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1351);
    float _1359 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1353);
    float _1361 = log2(_1337);
    float _1363 = _1315 + 1.0;
    float _1365 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1357);
    float _1367 = fma(_1355, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1369 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1359);
    float _1371 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1365);
    float _1373 = fma(_1355, _1367, -0.212114393711090087890625);
    float _1375 = 1.0 / _1345;
    float _1377 = -_1315;
    float _1379 = fma(_1347, _1363, _1377);
    float _1381 = fma(_1355, _1373, 1.570728778839111328125);
    float _1383 = sqrt(_1349);
    float _1385 = _1361 * 0.693147182464599609375;
    float _1387 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1389 = _1369 * _1375;
    float _1391 = _1371 * _1375;
    float _1393 = fma(_1389, 0.5, 0.5);
    float _1395 = fma(_1391, -0.5, 0.5);
    float _1397 = _1383 * 0.636619746685028076171875;
    float _1399 = fma(_1379, 0.5, 0.5);
    float3 _3983 = float3(_1393, _1395, _1387);
    float _1401 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3983, float3(0.0), isnan(_3983)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3983, float3(0.0), isnan(_3983)), level(0.0)).x;
    float _1403 = -_1381;
    float _1405 = fma(_1397, _1403, 1.0);
    float3 _3999 = float3(_1393, _1395, _1387);
    float4 _1408 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3999, float3(0.0), isnan(_3999)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3999, float3(0.0), isnan(_3999)), level(0.0)).xyzw;
    float _1410 = _1408.x;
    float _1412 = _1408.y;
    float _1414 = _1408.z;
    float _1416 = _1408.w;
    float2 _4016 = float2(_1405, _1399);
    float3 _1420 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4016, float2(0.0), isnan(_4016)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4016, float2(0.0), isnan(_4016)), level(0.0)).xyz;
    float _1422 = _1420.x;
    float _1424 = _1420.y;
    float _1426 = _1420.z;
    float _1428 = in.m_51.w;
    int _1430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1432 = _1430 != 0;
    float _1434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1438 = _1436 != 0;
    float _1440 = _417 + 0.5;
    bool _1442 = _161 > 0.5;
    float _1444 = -_477;
    float _1446 = _1444 + 0.5;
    bool _1448 = _175 > 0.5;
    float _1450 = _1440 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1454 = _1452 != 0;
    float _1456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1458 = -_439;
    int _1460 = _1448 ? as_type<int>(_1458) : as_type<int>(_439);
    float _1462 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1464 = _153 > 0.5;
    float _1466 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1470 = _1468 != 0;
    float _1472 = _935 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_58.x = _975;
    out.m_58.y = _989;
    out.m_58.z = _981;
    float _1474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1476 = 0.0;
    float _1478 = _1395;
    float _1480 = _1393;
    float _1482 = _1371;
    if (_1432)
    {
        float _1484 = _1428 * 3.1415927410125732421875;
        _1476 = _1484;
    }
    float _1486 = _1476;
    if (_1438)
    {
        float _1488 = _161 * 3.1415927410125732421875;
        _1478 = _1488;
    }
    float _1490 = _1478;
    bool _1492 = _1428 > 0.5;
    float _1494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _1496 = _1492;
    if (_1432)
    {
        float _1498 = _1486 * 0.15915493667125701904296875;
        _1480 = _1498;
    }
    float _1500 = _1480;
    if (_1438)
    {
        float _1502 = _1490 * 0.15915493667125701904296875;
        _219 = _1502;
    }
    float _1504 = _219;
    float _1506 = -_349;
    int _1508 = _1442 ? as_type<int>(_1506) : as_type<int>(_349);
    float _1510 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1466);
    int _1512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1514 = _1512 != 0;
    bool _1516 = !_1454;
    float _1518 = _1516 ? _349 : as_type<float>(_1508);
    float _1520 = _1500;
    bool _1522 = _1514;
    if (_1432)
    {
        float _1524 = _1500 * 6.283185482025146484375;
        float _1526 = sin(_1524);
        _1520 = _1526;
    }
    float _1528 = _1520;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1532 = _1530 != 0;
    float _1534 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1510);
    bool _1536 = !_1514;
    float _1538 = _1536 ? _439 : as_type<float>(_1460);
    float _1540 = _1518 + 0.5;
    float _1542 = -_349;
    int _1544 = _1464 ? as_type<int>(_1542) : as_type<int>(_349);
    float _1546 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1534);
    float _1548 = -_1538;
    float _1550 = _1548 + 0.5;
    bool _1552 = !_1470;
    float _1554 = _1552 ? _349 : as_type<float>(_1544);
    float _1556 = _1504;
    if (_1438)
    {
        float _1558 = _1504 * 6.283185482025146484375;
        float _1560 = sin(_1558);
        _1556 = _1560;
    }
    float _1562 = _1556;
    float _1564 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1566 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1568 = _1554 + 0.5;
    if (_1432)
    {
        bool _1570 = _1528 > 0.5;
        _1522 = _1570;
    }
    bool _1572 = _1522;
    float _1574 = -_439;
    int _1576 = _1492 ? as_type<int>(_1574) : as_type<int>(_439);
    float _1578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1580 = _1568 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1584 = !_1532;
    float _1586 = _1584 ? _439 : as_type<float>(_1576);
    float _1588 = _1564 * _1434;
    float _1590 = _1566 * _1456;
    float _1592 = _1580 * _1474;
    float _1594 = -_1586;
    float _1596 = _1594 + 0.5;
    if (_1438)
    {
        bool _1598 = _1562 > 0.5;
        _1496 = _1598;
    }
    bool _1600 = _1496;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1604 = _1582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1608 = _439 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1610 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1612 = _1602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1614 = _1606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1616 = fma(_1608, _1608, 1.0);
    float _1618 = _1610 * _1578;
    float _1620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1622 = _1578;
    if (!_1438)
    {
        _1622 = _439;
    }
    float _1624 = _1622;
    out.m_60.x = _1604;
    out.m_60.y = _1612;
    out.m_60.z = _1614;
    float _1626 = _1624;
    if (_1438)
    {
        float _1628 = -_439;
        float _1630 = _1600 ? _1628 : _439;
        _1626 = _1630;
    }
    float _1632 = _1626;
    if (_1432)
    {
        float _1634 = -_349;
        float _1636 = _1572 ? _1634 : _349;
        _405 = _1636;
    }
    float _1638 = _405;
    out.m_62.x = _1588;
    out.m_62.y = _1590;
    out.m_62.z = _1592;
    out.m_62.w = _1618;
    bool _1640 = _1113 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1642 = isnan(_1113);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1648 = _1644 || _1646;
    float _1650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1652 = -_1632;
    float _1654 = _1652 + 0.5;
    float _1656 = _1638 + 0.5;
    float _1658 = _1654 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1660 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1662 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1664 = rsqrt(_1616);
    float _1666 = _977 * _1608;
    float _1668 = -_1608;
    float _1670 = _959 * _1668;
    float _1672 = _1450 * _1620;
    float _1674 = _1662 * _1494;
    float _1676 = fma(_989, _1472, _1666);
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1680 = _1546 + _1678;
    float _1682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1684 = _1462 * _1650;
    float _1686 = _961 * _1608;
    float _1688 = fma(_975, _1472, _1670);
    float _1690 = _1345 + _1680;
    out.m_64.x = _1672;
    out.m_64.y = _1684;
    float _1692 = fma(_981, _1472, _1686);
    float _1694 = exp2(_1660);
    float _1696 = _1608 * _1664;
    float _1698 = _999 + _1676;
    float _1700 = _987 + _1692;
    float _1702 = -_1696;
    float _1704 = _967 * _1702;
    float _1706 = _1658 * _1682;
    float _1708 = -_1696;
    float _1710 = _999 * _1708;
    float _1712 = -_1696;
    float _1714 = _987 * _1712;
    out.m_66.x = _1674;
    out.m_66.y = _1706;
    float _1716 = -_1694;
    float _1718 = _1716 + 1.0;
    float _1720 = fma(_977, _1664, _1710);
    float _1722 = -_959;
    float _1724 = fma(_1722, _1664, _1704);
    float _1726 = fma(_961, _1664, _1714);
    float _1728 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1730 = _1690 * 0.5;
    float _1732 = _967 + _1688;
    float _1734 = -_1728;
    float _1736 = _1734 + 1.0;
    out.m_68.x = _1724;
    out.m_68.y = _1720;
    out.m_68.z = _1726;
    out.m_70.z = _1730;
    out.m_70.w = _1345;
    out.m_72.x = _1732;
    out.m_72.y = _1698;
    out.m_72.z = _1700;
    out.gl_Position.x = _1369;
    out.gl_Position.y = _1371;
    out.gl_Position.z = _1680;
    out.gl_Position.w = _1345;
    float _1738 = _1369;
    float _1740 = _1728;
    if (!_1648)
    {
        _1482 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1742 = _1482;
    float _1744 = _1742;
    float _1746 = _1742;
    if (!_1648)
    {
        _1738 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1748 = _1738;
    float _1750 = _1728 * _1401;
    float _1752 = _1748;
    float _1754 = _1748;
    if (!_1648)
    {
        _1740 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1756 = _1740;
    float _1758 = _1416 * _1750;
    float _1760 = _1416 * _1736;
    float _1762 = _1426 * _1750;
    float _1764 = fma(_1422, _1758, _1410);
    float _1766 = fma(_1424, _1758, _1412);
    float _1768 = fma(_1416, _1762, _1414);
    out.m_74.x = _1764;
    out.m_74.y = _1766;
    out.m_74.z = _1768;
    out.m_74.w = _1760;
    bool _1770 = !_1648;
    float _1772 = _1756;
    float _1774 = _1756;
    if (!_1770)
    {
        bool _1776 = _1113 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1778 = isnan(_1113);
        bool _1780 = _1776 || _1778;
        bool _1782 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1784 = _1780 || _1782;
        if (!_1784)
        {
            float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1788 = _1113 + _1786;
            float _1790 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1792 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1790;
            float _1794 = 1.0 / _1792;
            float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1798 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1802 = _1800 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1804 = _1788 * _1794;
            float _1806 = precise::clamp(_1804, 0.0, 1.0);
            float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1810 = _1808 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1812 = fma(_1806, _1802, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1814 = fma(_1806, _1810, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1816 = fma(_1806, _1798, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1754 = _1816;
            _1746 = _1814;
            _1774 = _1812;
            _1818 = true;
        }
        else
        {
            bool _1820 = _1113 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1822 = isnan(_1113);
            bool _1824 = _1820 || _1822;
            bool _1826 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1828 = _1824 || _1826;
            if (!_1828)
            {
                _1744 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1830 = _1744;
            _1746 = _1830;
            if (!_1828)
            {
                _1752 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1832 = _1752;
            _1754 = _1832;
            if (!_1828)
            {
                _1772 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1834 = _1772;
            bool _1836 = !_1828;
            _1774 = _1834;
            if (!_1836)
            {
                bool _1838 = _1113 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1840 = isnan(_1113);
                bool _1842 = _1838 || _1840;
                bool _1844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1846 = _1842 || _1844;
                if (!_1846)
                {
                    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1850 = _1113 + _1848;
                    float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1854 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1852;
                    float _1856 = 1.0 / _1854;
                    float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1860 = _1858 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1864 = _1862 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1866 = _1850 * _1856;
                    float _1868 = precise::clamp(_1866, 0.0, 1.0);
                    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1872 = _1870 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1874 = fma(_1868, _1864, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1876 = fma(_1868, _1872, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1878 = fma(_1868, _1860, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1754 = _1878;
                    _1746 = _1876;
                    _1774 = _1874;
                    _1818 = true;
                }
                else
                {
                    _1754 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1746 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1774 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1818 = false;
    float _1880 = _1754;
    float _1882 = _1746;
    float _1884 = _1774;
    float _1886 = _1880 * 0.586610972881317138671875;
    bool _1888 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_76.x = 0.0;
    float _1890 = fma(_1882, 0.298911988735198974609375, _1886);
    float _1892 = fma(_1884, 0.114477999508380889892578125, _1890);
    float _1894 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1896 = -_1892;
    float _1898 = _1896 + _1882;
    float _1900 = -_1892;
    float _1902 = _1900 + _1880;
    float _1904 = -_1892;
    float _1906 = _1904 + _1884;
    out.m_47.x = _1894;
    float _1908 = fma(_1898, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1892);
    float _1910 = fma(_1902, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1892);
    float _1912 = fma(_1906, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1892);
    out.m_78.x = _1908;
    out.m_78.y = _1910;
    out.m_78.z = _1912;
    if (!_1888)
    {
        return out;
    }
    float _1914 = -_1085;
    float _1916 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1918 = -_1087;
    float _1920 = _1918 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1922 = -_1089;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1926 = _1916 * _1916;
    float _1928 = fma(_1920, _1920, _1926);
    float _1930 = fma(_1924, _1924, _1928);
    float _1932 = sqrt(_1930);
    float _1934 = rsqrt(_1930);
    float _1936 = -_1932;
    float _1938 = _1936 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1940 = _1938 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1942 = precise::clamp(_1940, 0.0, 1.0);
    float _1944 = _1920 * _1934;
    float _1946 = _1916 * _1934;
    float _1948 = abs(_1942);
    float _1950 = log2(_1948);
    float _1952 = _1924 * _1934;
    float _1954 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1956 = _1698 * _1946;
    float _1958 = -_1946;
    float _1960 = -_1954;
    float _1962 = fma(_1958, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1960);
    float _1964 = fma(_1732, _1944, _1956);
    float _1966 = -_1952;
    float _1968 = fma(_1966, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1962);
    float _1970 = fma(_1700, _1952, _1964);
    float _1972 = precise::clamp(_1970, 0.0, 1.0);
    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1976 = _1968 + _1974;
    float _1978 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1980 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1982 = precise::clamp(_1980, 0.0, 1.0);
    float _1984 = exp2(_1978);
    float _1986 = _1984 * _1982;
    float _1988 = _1972 * _1986;
    float _1990 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1992 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1994 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_76.x = _1990;
    out.m_76.y = _1992;
    out.m_76.z = _1994;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1818 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_44.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    float _105 = as_type<float>(_97);
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _103;
    if (!_101)
    {
        out.m_47.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2051 = as_type<float>(_113);
        out.gl_Position.z = _2051;
    }
    if (!_101)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_97);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    int _147 = 0;
    if (_141)
    {
        float _149 = _145 * 5.0;
        _147 = as_type<int>(_149);
    }
    int _151 = _147;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2121 = as_type<float>(_151);
        out.gl_Position.z = _2121;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _153 = in.m_51.z;
    float _155 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _157 = log2(_155);
    float _159 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _161 = in.m_51.x;
    float _163 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_51.y;
    float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_49.x;
    float _183 = in.m_49.y;
    float _185 = in.m_49.z;
    float _187 = _157 * _129;
    float _189 = exp2(_187);
    float _191 = _153 * 2.0;
    float _193 = _163 * _177;
    float _195 = _177;
    if (!_173)
    {
        _195 = _159;
    }
    float _197 = _195;
    float _199 = _161 * 2.0;
    float _201 = floor(_191);
    float _203 = _175 * 2.0;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    float _209 = floor(_199);
    int _211 = as_type<int>(_179) & 2;
    bool _213 = _211 != 0;
    float _215 = _179;
    float _217 = _197;
    float _219 = _161;
    if (!_173)
    {
        float _221 = _159 * _159;
        float _223 = _221 * 0.5;
        _215 = _223;
    }
    float _225 = _215;
    float _227 = _225;
    if (!_173)
    {
        float _229 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = _201 > 0.0;
    float _235 = floor(_203);
    bool _237 = _201 >= 0.0;
    bool _239 = isnan(_201);
    bool _241 = _237 || _239;
    bool _243 = isnan(0.0);
    bool _245 = _241 || _243;
    int _247 = _245 ? 0 : 1;
    bool _249 = _209 > 0.0;
    int _251 = ~_247;
    int _253 = _251 + 1;
    int _255 = _253 + 1;
    bool _257 = _209 >= 0.0;
    bool _259 = isnan(_209);
    bool _261 = _257 || _259;
    bool _263 = isnan(0.0);
    bool _265 = _261 || _263;
    int _267 = _255;
    float _269 = _231;
    if (!_233)
    {
        int _271 = ~_247;
        int _273 = _271 + 1;
        _267 = _273;
    }
    int _275 = _267;
    bool _277 = !_173;
    if (!_277)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _159 * _281;
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _159);
        float _305 = _303 * _291;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _269 = _307;
    }
    float _309 = _269;
    bool _311 = !_173;
    if (!_311)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = 1.0 / _319;
        float _323 = _159 * _315;
        float _325 = exp2(_323);
        float _327 = -_325;
        float _329 = _327 + 1.0;
        float _331 = _329 * _321;
        _217 = _331;
    }
    float _333 = _217;
    float _335 = in.m_56.w;
    float _337 = -_189;
    float _339 = _337 + 1.0;
    float _341 = in.m_44.x;
    float _343 = in.m_44.y;
    float _345 = in.m_44.z;
    bool _347 = !_207;
    float _349 = _347 ? (-0.5) : 0.5;
    float _351 = fma(_161, (*spvDescriptorSet0.vp_c9)._m0[20].x, _193);
    bool _353 = _175 > 0.5;
    bool _355 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _357 = isnan(0.0);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _363 = _359 || _361;
    int _365 = _265 ? 0 : 1;
    int _367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _369 = _367 != 0;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _373 = _371 != 0;
    float _375 = -_349;
    int _377 = _353 ? as_type<int>(_375) : as_type<int>(_349);
    bool _379 = _235 > 0.0;
    bool _381 = _235 >= 0.0;
    bool _383 = isnan(_235);
    bool _385 = _381 || _383;
    bool _387 = isnan(0.0);
    bool _389 = _385 || _387;
    float _391 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _393 = ~_365;
    int _395 = _393 + 1;
    int _397 = _395 + 1;
    float _399 = _363 ? _339 : 0.0;
    float _401 = fma(_333, _183, _391);
    int _403 = _397;
    float _405 = _349;
    if (!_249)
    {
        int _407 = ~_365;
        int _409 = _407 + 1;
        _403 = _409;
    }
    int _411 = _403;
    float _413 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _415 = !_369;
    float _417 = _415 ? _349 : as_type<float>(_377);
    float _419 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _421 = _153 > 0.5;
    float _423 = fma(_333, _185, _413);
    float _425 = fma(_333, _181, _419);
    float _427 = fma(_401, _335, _343);
    float _429 = fma(_425, _335, _341);
    float _431 = _427 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _433 = _427 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _435 = fma(_423, _335, _345);
    bool _437 = !_213;
    float _439 = _437 ? (-0.5) : 0.5;
    float _441 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].x, _431);
    float _443 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].x, _433);
    int _445 = _389 ? 0 : 1;
    float _447 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].z, _441);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].z, _443);
    float _451 = -_439;
    int _453 = _421 ? as_type<int>(_451) : as_type<int>(_439);
    float _455 = _447 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _457 = _449 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _461 = _459 != 0;
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _465 = _463 != 0;
    float _467 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _469 = _455 + _467;
    float _471 = -_457;
    float _473 = _471 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _475 = !_373;
    float _477 = _475 ? _439 : as_type<float>(_453);
    bool _479 = !_465;
    int _481 = _479 ? 0 : 1;
    float _483 = abs(_469);
    float _485 = abs(_473);
    float _487 = precise::max(_483, _485);
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _495 = _493 != 0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _499 = _497 != 0;
    float _501 = _175 + _153;
    bool _503 = _487 >= 16.0;
    float _505 = _501 + (-1.0);
    bool _507 = !_461;
    int _509 = _507 ? 0 : 1;
    int _511 = ~_445;
    int _513 = _511 + 1;
    int _515 = _513 + 1;
    int _517 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _519 = _517 != 0;
    int _521 = _515;
    float _523 = _469;
    float _525 = _473;
    if (!_379)
    {
        int _527 = ~_445;
        int _529 = _527 + 1;
        _521 = _529;
    }
    int _531 = _521;
    if (_503)
    {
        float _533 = _469 * 0.0625;
        _523 = _533;
    }
    float _535 = _523;
    bool _537 = !_491;
    int _539 = _537 ? 0 : 1;
    if (_503)
    {
        float _541 = _473 * 0.0625;
        _525 = _541;
    }
    float _543 = _525;
    bool _545 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _547 = isnan(1.0);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _553 = _549 || _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _557 = 1.0 + _555;
    int _559 = abs(_539);
    float _561 = _161 + _175;
    float _563 = 1.0 / _557;
    float _565 = float(_275);
    float _567 = _561 + (-1.0);
    float _569 = float(_559);
    float _571 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _573 = abs(_535);
    bool _575 = _573 != 0.0;
    bool _577 = isnan(_573);
    bool _579 = _575 || _577;
    bool _581 = isnan(0.0);
    bool _583 = _579 || _581;
    float _585 = _161 + _153;
    bool _587 = !_495;
    int _589 = _587 ? 0 : 1;
    float _591 = _569 * _565;
    float _593 = abs(_543);
    bool _595 = _593 == 0.0;
    bool _597 = !_583;
    bool _599 = _595 && _597;
    float _601 = _585 + (-1.0);
    bool _603 = !_499;
    int _605 = _603 ? 0 : 1;
    int _607 = abs(_589);
    bool _609 = _553;
    int _611 = as_type<int>(_571);
    int _613 = _583 ? (-1) : 0;
    if (_553)
    {
        float _615 = _399 * _563;
        _131 = _615;
    }
    float _617 = _131;
    int _619 = abs(_605);
    float _621 = _591 * (-2.0);
    float _623 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _625 = float(_411);
    float _627 = floor(_351);
    float _629 = float(_607);
    float _631 = _351 * 6.283185482025146484375;
    int _633 = as_type<int>(_625);
    if (_599)
    {
        bool _635 = as_type<int>(_543) >= 0;
        _609 = _635;
    }
    bool _637 = _609;
    float _639 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _641 = float(_531);
    float _643 = _629 * _625;
    float _645 = _631 * 0.15915493667125701904296875;
    if (_599)
    {
        int _647 = _637 ? 0 : 1078530011;
        _633 = _647;
    }
    int _649 = _633;
    float _651 = fma(_639, _621, _639);
    float _653 = abs(_543);
    bool _655 = _653 == 0.0;
    float _657 = _645 * 6.283185482025146484375;
    float _659 = cos(_657);
    float _661 = float(_619);
    float _663 = _161 + (-0.5);
    float _665 = _643 * (-2.0);
    float _667 = -_627;
    float _669 = _351 + _667;
    float _671 = _661 * _641;
    float _673 = _663 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _675 = _671 * (-2.0);
    float _677 = fma(_571, _665, _571);
    float _679 = fma(_651, _617, _673);
    if (_599)
    {
        int _681 = int(0x80000000) & as_type<int>(_535);
        int _683 = _649 | _681;
        _611 = _683;
    }
    int _685 = _611;
    float _687 = fma(_623, _675, _623);
    bool _689 = !_583;
    bool _691 = _689 && _655;
    int _693 = _685;
    float _695 = as_type<float>(_685);
    if (!_691)
    {
        float _697 = abs(_535);
        bool _699 = _697 != as_type<float>(0x7f800000u /* inf */);
        bool _701 = isnan(_697);
        bool _703 = _699 || _701;
        bool _705 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _707 = _703 || _705;
        float _709 = abs(_543);
        bool _711 = _709 == as_type<float>(0x7f800000u /* inf */);
        bool _713 = !_707;
        bool _715 = _711 && _713;
        if (_715)
        {
            bool _717 = as_type<int>(_543) >= 0;
            _613 = _717 ? (-1) : 0;
        }
        int _719 = _613;
        if (_715)
        {
            _693 = 1075235812;
        }
        int _721 = _693;
        int _723 = _721;
        if (_715)
        {
            int _725 = ~_719;
            int _727 = (_725 != 0) ? _721 : 1061752795;
            _723 = _727;
        }
        int _729 = _723;
        float _731 = abs(_543);
        bool _733 = _731 == as_type<float>(0x7f800000u /* inf */);
        float _735 = as_type<float>(_729);
        if (_715)
        {
            int _737 = int(0x80000000) & as_type<int>(_535);
            int _739 = _729 | _737;
            _735 = as_type<float>(_739);
        }
        float _741 = _735;
        bool _743 = !_707;
        bool _745 = _743 && _733;
        _695 = _741;
        if (!_745)
        {
            float _747 = abs(_535);
            float _749 = abs(_543);
            float _751 = precise::max(_747, _749);
            float _753 = abs(_535);
            float _755 = abs(_543);
            float _757 = precise::min(_753, _755);
            float _759 = 1.0 / _751;
            float _761 = abs(_535);
            float _763 = abs(_543);
            bool _765 = _761 > _763;
            bool _767 = as_type<int>(_543) >= 0;
            float _769 = _757 * _759;
            float _771 = _769 * _769;
            float _773 = _771 + 11.33538818359375;
            float _775 = fma(_771, _773, 28.84246826171875);
            float _777 = fma(_771, _775, 19.6966705322265625);
            float _779 = fma(_771, -0.82336294651031494140625, -5.674867153167724609375);
            float _781 = fma(_771, _779, -6.565555095672607421875);
            float _783 = 1.0 / _777;
            float _785 = _771 * _781;
            float _787 = abs(_535);
            float _789 = abs(_543);
            float _791 = _787 + _789;
            int _793 = as_type<int>(_535) & int(0x80000000);
            float _795 = _769 * _785;
            bool _797 = _791 > as_type<float>(0x7f800000u /* inf */);
            bool _799 = isnan(_791);
            bool _801 = _797 || _799;
            bool _803 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _805 = _801 || _803;
            float _807 = fma(_795, _783, _769);
            float _809 = _807;
            _695 = _791;
            if (_765)
            {
                float _811 = -_807;
                float _813 = _811 + 1.57079637050628662109375;
                _809 = _813;
            }
            float _815 = _809;
            int _817 = as_type<int>(_815);
            if (!_767)
            {
                float _819 = -_815;
                float _821 = _819 + 3.1415927410125732421875;
                _817 = as_type<int>(_821);
            }
            int _823 = _817;
            if (!_805)
            {
                int _825 = _793 | _823;
                _695 = as_type<float>(_825);
            }
        }
    }
    float _827 = _695;
    float _829 = _153 + (-0.5);
    float _831 = _175 + (-0.5);
    float _833 = _679 * 0.15915493667125701904296875;
    float _835 = _829 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _837 = _669 < 0.5;
    float _839 = float(_837);
    float _841 = _831 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _843 = -_669;
    float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _847 = fma(_687, _617, _835);
    int _849 = abs(_509);
    float _851 = -_839;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _855 = fma(_677, _617, _841);
    bool _857 = !_519;
    int _859 = _857 ? 0 : 1;
    float _861 = in.m_56.x;
    float _863 = in.m_56.y;
    float _865 = _847 * 0.15915493667125701904296875;
    float _867 = -_827;
    float _869 = _855 + _867;
    int _871 = abs(_859);
    float _873 = fma(_659, 0.5, 0.5);
    float _875 = _833 * 6.283185482025146484375;
    float _877 = sin(_875);
    int _879 = abs(_481);
    float _881 = _869 * 0.15915493667125701904296875;
    float _883 = float(_849);
    float _885 = -_873;
    float _887 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _889 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _891 = float(_871);
    float _893 = _833 * 6.283185482025146484375;
    float _895 = cos(_893);
    float _897 = _427 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[193].x + (-1.0);
    float _901 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].x, _897);
    float _903 = _865 * 6.283185482025146484375;
    float _905 = cos(_903);
    float _907 = abs(_845);
    float _909 = _883 * _907;
    bool _911 = !_213;
    float _913 = _911 ? 0.0 : 1.0;
    float _915 = _863 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _917 = float(_879);
    float _919 = fma(_891, _887, _909);
    float _921 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].z, _901);
    float _923 = fma(_913, _899, 1.0);
    float _925 = _881 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = abs(_853);
    float _931 = fma(_917, _929, _919);
    float _933 = _861 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _935 = _349 * _923;
    float _937 = _931 * _915;
    float _939 = _931 * _933;
    float _941 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _935);
    float _943 = _881 * 6.283185482025146484375;
    float _945 = cos(_943);
    float _947 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _439);
    float _949 = _939 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _951 = _937 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _953 = _949 * _941;
    float _955 = _951 * _947;
    float _957 = _865 * 6.283185482025146484375;
    float _959 = sin(_957);
    float _961 = _877 * _905;
    float _963 = _895 * _927;
    float _965 = _877 * _927;
    float _967 = _927 * _905;
    float _969 = _961 * _955;
    float _971 = _877 * _945;
    float _973 = _895 * _945;
    float _975 = _945 * _905;
    float _977 = _895 * _905;
    float _979 = -_963;
    float _981 = fma(_959, _971, _979);
    float _983 = -_955;
    float _985 = _959 * _983;
    float _987 = fma(_959, _965, _973);
    float _989 = fma(_959, _973, _965);
    float _991 = fma(_981, _953, _969);
    float _993 = fma(_975, _953, _985);
    float _995 = _977 * _955;
    float _997 = -_971;
    float _999 = fma(_959, _963, _997);
    float _1001 = fma(_987, _889, _991);
    float _1003 = fma(_967, _889, _993);
    float _1005 = fma(_989, _953, _995);
    float _1007 = _921 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1009 = _457 + _1001;
    float _1011 = _455 + _1003;
    float _1013 = fma(_999, _889, _1005);
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1017 = _1009 + _1015;
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1021 = _1011 + _1019;
    float _1023 = _1007 + _1013;
    float _1025 = _1017 * _1017;
    float _1027 = fma(_1021, _1021, _1025);
    float _1029 = sqrt(_1027);
    bool _1031 = _1029 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1033 = _973;
    float _1035 = _1011;
    float _1037 = _1009;
    float _1039 = _1029;
    float _1041 = _953;
    if (!_1031)
    {
        _1033 = _1023;
    }
    float _1043 = _1033;
    bool _1045 = !_1031;
    float _1047 = _1043;
    if (!_1045)
    {
        float _1049 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1053 = _1029 + _1051;
        float _1055 = rsqrt(_1027);
        float _1057 = _1053 * _1049;
        float _1059 = _1023 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1061 = _1057 * 0.15915493667125701904296875;
        float _1063 = _1061 * 6.283185482025146484375;
        float _1065 = cos(_1063);
        float _1067 = _1061 * 6.283185482025146484375;
        float _1069 = sin(_1067);
        float _1071 = _1065 + (-1.0);
        float _1073 = _1071 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1075 = fma(_1069, _1059, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1077 = fma(_1023, _1065, _1073);
        float _1079 = _1055 * _1075;
        float _1081 = fma(_1021, _1079, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1083 = fma(_1017, _1079, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1047 = _1077;
        _1035 = _1081;
        _1037 = _1083;
        _1039 = _1061;
    }
    float _1085 = _1047;
    float _1087 = _1035;
    float _1089 = _1037;
    float _1091 = _1039;
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1095 = _1085 + _1093;
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1099 = _1087 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1103 = _1089 + _1101;
    float _1105 = _1095 * _1095;
    float _1107 = fma(_1099, _1099, _1105);
    float _1109 = fma(_1103, _1103, _1107);
    float _1111 = rsqrt(_1109);
    float _1113 = sqrt(_1109);
    float _1115 = _1111 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1117 = _1099 * _1115;
    float _1119 = _1103 * _1115;
    float _1121 = _1117 * _1117;
    float _1123 = _1119 * _1119;
    float _1125 = _1121 + _1123;
    float _1127 = sqrt(_1125);
    bool _1129 = _1127 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1133 = _1127 + _1131;
    float _1135 = _1103;
    float _1137 = _1125;
    float _1139 = _1133;
    float _1141 = _1115;
    if (_1129)
    {
        float _1143 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1135 = _1143;
    }
    float _1145 = _1135;
    if (_1129)
    {
        float _1147 = rsqrt(_1125);
        _1137 = _1147;
    }
    float _1149 = _1137;
    float _1151 = _1149;
    if (_1129)
    {
        float _1153 = _1133 * _1145;
        _1139 = _1153;
    }
    float _1155 = _1139;
    if (_1129)
    {
        float _1157 = _1155 * 0.15915493667125701904296875;
        _1041 = _1157;
    }
    float _1159 = _1041;
    float _1161 = _1091;
    if (_1129)
    {
        float _1163 = _1159 * 6.283185482025146484375;
        float _1165 = sin(_1163);
        _1161 = _1165;
    }
    float _1167 = _1161;
    float _1169 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1171 = precise::max(0.0, _1169);
    float _1173 = _1111;
    float _1175 = _1171;
    float _1177 = _1169;
    if (_1129)
    {
        float _1179 = _1159 * 6.283185482025146484375;
        float _1181 = cos(_1179);
        _1173 = _1181;
    }
    float _1183 = _1173;
    float _1185 = -_1115;
    float _1187 = -_1171;
    float _1189 = fma(_1095, _1185, _1187);
    float _1191 = _1189;
    if (_1129)
    {
        float _1193 = _1189 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1175 = _1193;
    }
    float _1195 = _1175;
    float _1197 = _1167;
    float _1199 = _1195;
    if (_1129)
    {
        float _1201 = fma(_1167, _1195, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1197 = _1201;
    }
    float _1203 = _1197;
    float _1205 = _1203;
    if (!_1129)
    {
        _1199 = _1117;
    }
    float _1207 = _1199;
    float _1209 = _1207;
    float _1211 = _1183;
    if (_1129)
    {
        float _1213 = _1183 + (-1.0);
        _1177 = _1213;
    }
    float _1215 = _1177;
    float _1217 = _1215;
    if (_1129)
    {
        float _1219 = _1149 * _1203;
        _1205 = _1219;
    }
    float _1221 = _1205;
    if (!_1129)
    {
        _1151 = _1121;
    }
    float _1223 = _1151;
    float _1225 = _1223;
    if (_1129)
    {
        float _1227 = _1215 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1141 = _1227;
    }
    float _1229 = _1141;
    if (_1129)
    {
        float _1231 = _1117 * _1221;
        _1209 = _1231;
    }
    float _1233 = _1209;
    if (!_1129)
    {
        _1217 = _1119;
    }
    float _1235 = _1217;
    float _1237 = _1235;
    if (_1129)
    {
        float _1239 = _1119 * _1221;
        _1237 = _1239;
    }
    float _1241 = _1237;
    if (_1129)
    {
        float _1243 = fma(_1189, _1183, _1229);
        _1191 = _1243;
    }
    float _1245 = _1191;
    if (_1129)
    {
        float _1247 = _1233 * _1233;
        _1225 = _1247;
    }
    float _1249 = _1225;
    if (!_1129)
    {
        _1211 = _1123;
    }
    float _1251 = _1211;
    float _1253 = _1251;
    if (_1129)
    {
        float _1255 = _1241 * _1241;
        _1253 = _1255;
    }
    float _1257 = _1253;
    float _1259 = fma(_1245, _1245, _1249);
    float _1261 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1263 = _1259 + _1257;
    float _1265 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1261);
    float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1269 = fma(_1113, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1267);
    float _1271 = precise::clamp(_1269, 0.0, 1.0);
    float _1273 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1275 = rsqrt(_1263);
    float _1277 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1265);
    float _1279 = -_1271;
    float _1281 = _1279 + 1.0;
    float _1283 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1285 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1273);
    float _1287 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1289 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1291 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1283);
    float _1293 = abs(_1281);
    float _1295 = log2(_1293);
    float _1297 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1285);
    float _1299 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1289);
    float _1301 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1291);
    float _1303 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1305 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1307 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1299);
    float _1309 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1311 = _1275 * _1233;
    float _1313 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1315 = _1275 * _1245;
    float _1317 = _1287 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1319 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1321 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1313);
    float _1323 = _1275 * _1241;
    float _1325 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1327 = -_1319;
    float _1329 = fma(_1315, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1327);
    float _1331 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1333 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1321);
    float _1335 = -_1317;
    float _1337 = fma(_1335, _1303, 1.0);
    float _1339 = -_1323;
    float _1341 = fma(_1339, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1329);
    float _1343 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1345 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1333);
    float _1347 = exp2(_1331);
    float _1349 = fma(_1341, -0.5, 0.5);
    float _1351 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1353 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1343);
    float _1355 = fma(_1341, 0.5, 0.5);
    float _1357 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1351);
    float _1359 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1353);
    float _1361 = log2(_1337);
    float _1363 = _1315 + 1.0;
    float _1365 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1357);
    float _1367 = fma(_1355, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1369 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1359);
    float _1371 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1365);
    float _1373 = fma(_1355, _1367, -0.212114393711090087890625);
    float _1375 = 1.0 / _1345;
    float _1377 = -_1315;
    float _1379 = fma(_1347, _1363, _1377);
    float _1381 = fma(_1355, _1373, 1.570728778839111328125);
    float _1383 = sqrt(_1349);
    float _1385 = _1361 * 0.693147182464599609375;
    float _1387 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1389 = _1369 * _1375;
    float _1391 = _1371 * _1375;
    float _1393 = fma(_1389, 0.5, 0.5);
    float _1395 = fma(_1391, -0.5, 0.5);
    float _1397 = _1383 * 0.636619746685028076171875;
    float _1399 = fma(_1379, 0.5, 0.5);
    float3 _3983 = float3(_1393, _1395, _1387);
    float _1401 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3983, float3(0.0), isnan(_3983)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3983, float3(0.0), isnan(_3983)), level(0.0)).x;
    float _1403 = -_1381;
    float _1405 = fma(_1397, _1403, 1.0);
    float3 _3999 = float3(_1393, _1395, _1387);
    float4 _1408 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3999, float3(0.0), isnan(_3999)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3999, float3(0.0), isnan(_3999)), level(0.0)).xyzw;
    float _1410 = _1408.x;
    float _1412 = _1408.y;
    float _1414 = _1408.z;
    float _1416 = _1408.w;
    float2 _4016 = float2(_1405, _1399);
    float3 _1420 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4016, float2(0.0), isnan(_4016)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4016, float2(0.0), isnan(_4016)), level(0.0)).xyz;
    float _1422 = _1420.x;
    float _1424 = _1420.y;
    float _1426 = _1420.z;
    float _1428 = in.m_51.w;
    int _1430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1432 = _1430 != 0;
    float _1434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1438 = _1436 != 0;
    float _1440 = _417 + 0.5;
    bool _1442 = _161 > 0.5;
    float _1444 = -_477;
    float _1446 = _1444 + 0.5;
    bool _1448 = _175 > 0.5;
    float _1450 = _1440 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1454 = _1452 != 0;
    float _1456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1458 = -_439;
    int _1460 = _1448 ? as_type<int>(_1458) : as_type<int>(_439);
    float _1462 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1464 = _153 > 0.5;
    float _1466 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1470 = _1468 != 0;
    float _1472 = _935 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_58.x = _975;
    out.m_58.y = _989;
    out.m_58.z = _981;
    float _1474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1476 = 0.0;
    float _1478 = _1395;
    float _1480 = _1393;
    float _1482 = _1371;
    if (_1432)
    {
        float _1484 = _1428 * 3.1415927410125732421875;
        _1476 = _1484;
    }
    float _1486 = _1476;
    if (_1438)
    {
        float _1488 = _161 * 3.1415927410125732421875;
        _1478 = _1488;
    }
    float _1490 = _1478;
    bool _1492 = _1428 > 0.5;
    float _1494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _1496 = _1492;
    if (_1432)
    {
        float _1498 = _1486 * 0.15915493667125701904296875;
        _1480 = _1498;
    }
    float _1500 = _1480;
    if (_1438)
    {
        float _1502 = _1490 * 0.15915493667125701904296875;
        _219 = _1502;
    }
    float _1504 = _219;
    float _1506 = -_349;
    int _1508 = _1442 ? as_type<int>(_1506) : as_type<int>(_349);
    float _1510 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1466);
    int _1512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1514 = _1512 != 0;
    bool _1516 = !_1454;
    float _1518 = _1516 ? _349 : as_type<float>(_1508);
    float _1520 = _1500;
    bool _1522 = _1514;
    if (_1432)
    {
        float _1524 = _1500 * 6.283185482025146484375;
        float _1526 = sin(_1524);
        _1520 = _1526;
    }
    float _1528 = _1520;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1532 = _1530 != 0;
    float _1534 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1510);
    bool _1536 = !_1514;
    float _1538 = _1536 ? _439 : as_type<float>(_1460);
    float _1540 = _1518 + 0.5;
    float _1542 = -_349;
    int _1544 = _1464 ? as_type<int>(_1542) : as_type<int>(_349);
    float _1546 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1534);
    float _1548 = -_1538;
    float _1550 = _1548 + 0.5;
    bool _1552 = !_1470;
    float _1554 = _1552 ? _349 : as_type<float>(_1544);
    float _1556 = _1504;
    if (_1438)
    {
        float _1558 = _1504 * 6.283185482025146484375;
        float _1560 = sin(_1558);
        _1556 = _1560;
    }
    float _1562 = _1556;
    float _1564 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1566 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1568 = _1554 + 0.5;
    if (_1432)
    {
        bool _1570 = _1528 > 0.5;
        _1522 = _1570;
    }
    bool _1572 = _1522;
    float _1574 = -_439;
    int _1576 = _1492 ? as_type<int>(_1574) : as_type<int>(_439);
    float _1578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1580 = _1568 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1584 = !_1532;
    float _1586 = _1584 ? _439 : as_type<float>(_1576);
    float _1588 = _1564 * _1434;
    float _1590 = _1566 * _1456;
    float _1592 = _1580 * _1474;
    float _1594 = -_1586;
    float _1596 = _1594 + 0.5;
    if (_1438)
    {
        bool _1598 = _1562 > 0.5;
        _1496 = _1598;
    }
    bool _1600 = _1496;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1604 = _1582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1608 = _439 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1610 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1612 = _1602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1614 = _1606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1616 = fma(_1608, _1608, 1.0);
    float _1618 = _1610 * _1578;
    float _1620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1622 = _1578;
    if (!_1438)
    {
        _1622 = _439;
    }
    float _1624 = _1622;
    out.m_60.x = _1604;
    out.m_60.y = _1612;
    out.m_60.z = _1614;
    float _1626 = _1624;
    if (_1438)
    {
        float _1628 = -_439;
        float _1630 = _1600 ? _1628 : _439;
        _1626 = _1630;
    }
    float _1632 = _1626;
    if (_1432)
    {
        float _1634 = -_349;
        float _1636 = _1572 ? _1634 : _349;
        _405 = _1636;
    }
    float _1638 = _405;
    out.m_62.x = _1588;
    out.m_62.y = _1590;
    out.m_62.z = _1592;
    out.m_62.w = _1618;
    bool _1640 = _1113 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1642 = isnan(_1113);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1648 = _1644 || _1646;
    float _1650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1652 = -_1632;
    float _1654 = _1652 + 0.5;
    float _1656 = _1638 + 0.5;
    float _1658 = _1654 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1660 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1662 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1664 = rsqrt(_1616);
    float _1666 = _977 * _1608;
    float _1668 = -_1608;
    float _1670 = _959 * _1668;
    float _1672 = _1450 * _1620;
    float _1674 = _1662 * _1494;
    float _1676 = fma(_989, _1472, _1666);
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1680 = _1546 + _1678;
    float _1682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1684 = _1462 * _1650;
    float _1686 = _961 * _1608;
    float _1688 = fma(_975, _1472, _1670);
    float _1690 = _1345 + _1680;
    out.m_64.x = _1672;
    out.m_64.y = _1684;
    float _1692 = fma(_981, _1472, _1686);
    float _1694 = exp2(_1660);
    float _1696 = _1608 * _1664;
    float _1698 = _999 + _1676;
    float _1700 = _987 + _1692;
    float _1702 = -_1696;
    float _1704 = _967 * _1702;
    float _1706 = _1658 * _1682;
    float _1708 = -_1696;
    float _1710 = _999 * _1708;
    float _1712 = -_1696;
    float _1714 = _987 * _1712;
    out.m_66.x = _1674;
    out.m_66.y = _1706;
    float _1716 = -_1694;
    float _1718 = _1716 + 1.0;
    float _1720 = fma(_977, _1664, _1710);
    float _1722 = -_959;
    float _1724 = fma(_1722, _1664, _1704);
    float _1726 = fma(_961, _1664, _1714);
    float _1728 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1730 = _1690 * 0.5;
    float _1732 = _967 + _1688;
    float _1734 = -_1728;
    float _1736 = _1734 + 1.0;
    out.m_68.x = _1724;
    out.m_68.y = _1720;
    out.m_68.z = _1726;
    out.m_70.z = _1730;
    out.m_70.w = _1345;
    out.m_72.x = _1732;
    out.m_72.y = _1698;
    out.m_72.z = _1700;
    out.gl_Position.x = _1369;
    out.gl_Position.y = _1371;
    out.gl_Position.z = _1680;
    out.gl_Position.w = _1345;
    float _1738 = _1369;
    float _1740 = _1728;
    if (!_1648)
    {
        _1482 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1742 = _1482;
    float _1744 = _1742;
    float _1746 = _1742;
    if (!_1648)
    {
        _1738 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1748 = _1738;
    float _1750 = _1728 * _1401;
    float _1752 = _1748;
    float _1754 = _1748;
    if (!_1648)
    {
        _1740 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1756 = _1740;
    float _1758 = _1416 * _1750;
    float _1760 = _1416 * _1736;
    float _1762 = _1426 * _1750;
    float _1764 = fma(_1422, _1758, _1410);
    float _1766 = fma(_1424, _1758, _1412);
    float _1768 = fma(_1416, _1762, _1414);
    out.m_74.x = _1764;
    out.m_74.y = _1766;
    out.m_74.z = _1768;
    out.m_74.w = _1760;
    bool _1770 = !_1648;
    float _1772 = _1756;
    float _1774 = _1756;
    if (!_1770)
    {
        bool _1776 = _1113 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1778 = isnan(_1113);
        bool _1780 = _1776 || _1778;
        bool _1782 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1784 = _1780 || _1782;
        if (!_1784)
        {
            float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1788 = _1113 + _1786;
            float _1790 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1792 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1790;
            float _1794 = 1.0 / _1792;
            float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1798 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1802 = _1800 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1804 = _1788 * _1794;
            float _1806 = precise::clamp(_1804, 0.0, 1.0);
            float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1810 = _1808 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1812 = fma(_1806, _1802, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1814 = fma(_1806, _1810, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1816 = fma(_1806, _1798, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1754 = _1816;
            _1746 = _1814;
            _1774 = _1812;
            _1818 = true;
        }
        else
        {
            bool _1820 = _1113 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1822 = isnan(_1113);
            bool _1824 = _1820 || _1822;
            bool _1826 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1828 = _1824 || _1826;
            if (!_1828)
            {
                _1744 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1830 = _1744;
            _1746 = _1830;
            if (!_1828)
            {
                _1752 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1832 = _1752;
            _1754 = _1832;
            if (!_1828)
            {
                _1772 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1834 = _1772;
            bool _1836 = !_1828;
            _1774 = _1834;
            if (!_1836)
            {
                bool _1838 = _1113 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1840 = isnan(_1113);
                bool _1842 = _1838 || _1840;
                bool _1844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1846 = _1842 || _1844;
                if (!_1846)
                {
                    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1850 = _1113 + _1848;
                    float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1854 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1852;
                    float _1856 = 1.0 / _1854;
                    float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1860 = _1858 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1864 = _1862 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1866 = _1850 * _1856;
                    float _1868 = precise::clamp(_1866, 0.0, 1.0);
                    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1872 = _1870 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1874 = fma(_1868, _1864, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1876 = fma(_1868, _1872, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1878 = fma(_1868, _1860, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1754 = _1878;
                    _1746 = _1876;
                    _1774 = _1874;
                    _1818 = true;
                }
                else
                {
                    _1754 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1746 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1774 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1818 = false;
    float _1880 = _1754;
    float _1882 = _1746;
    float _1884 = _1774;
    float _1886 = _1880 * 0.586610972881317138671875;
    bool _1888 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_76.x = 0.0;
    float _1890 = fma(_1882, 0.298911988735198974609375, _1886);
    float _1892 = fma(_1884, 0.114477999508380889892578125, _1890);
    float _1894 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1896 = -_1892;
    float _1898 = _1896 + _1882;
    float _1900 = -_1892;
    float _1902 = _1900 + _1880;
    float _1904 = -_1892;
    float _1906 = _1904 + _1884;
    out.m_47.x = _1894;
    float _1908 = fma(_1898, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1892);
    float _1910 = fma(_1902, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1892);
    float _1912 = fma(_1906, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1892);
    out.m_78.x = _1908;
    out.m_78.y = _1910;
    out.m_78.z = _1912;
    if (!_1888)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1914 = -_1085;
    float _1916 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1918 = -_1087;
    float _1920 = _1918 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1922 = -_1089;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1926 = _1916 * _1916;
    float _1928 = fma(_1920, _1920, _1926);
    float _1930 = fma(_1924, _1924, _1928);
    float _1932 = sqrt(_1930);
    float _1934 = rsqrt(_1930);
    float _1936 = -_1932;
    float _1938 = _1936 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1940 = _1938 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1942 = precise::clamp(_1940, 0.0, 1.0);
    float _1944 = _1920 * _1934;
    float _1946 = _1916 * _1934;
    float _1948 = abs(_1942);
    float _1950 = log2(_1948);
    float _1952 = _1924 * _1934;
    float _1954 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1956 = _1698 * _1946;
    float _1958 = -_1946;
    float _1960 = -_1954;
    float _1962 = fma(_1958, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1960);
    float _1964 = fma(_1732, _1944, _1956);
    float _1966 = -_1952;
    float _1968 = fma(_1966, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1962);
    float _1970 = fma(_1700, _1952, _1964);
    float _1972 = precise::clamp(_1970, 0.0, 1.0);
    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1976 = _1968 + _1974;
    float _1978 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1980 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1982 = precise::clamp(_1980, 0.0, 1.0);
    float _1984 = exp2(_1978);
    float _1986 = _1984 * _1982;
    float _1988 = _1972 * _1986;
    float _1990 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1992 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1994 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_76.x = _1990;
    out.m_76.y = _1992;
    out.m_76.z = _1994;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

