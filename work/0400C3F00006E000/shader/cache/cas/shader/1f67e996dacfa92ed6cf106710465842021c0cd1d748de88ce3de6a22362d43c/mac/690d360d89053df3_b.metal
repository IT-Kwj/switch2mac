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
    float4 m_64 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_70 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_49 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _901 = false;
    bool _661 = false;
    bool _497 = false;
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
        float _2173 = as_type<float>(_105);
        out.gl_Position.z = _2173;
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
    float _125 = 0.0;
    float _127 = 0.0;
    if (_119)
    {
        float _129 = float(_89);
        _99 = _129;
    }
    float _131 = _99;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _107 = as_type<int>(_143);
    }
    int _145 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2242 = as_type<float>(_145);
        out.gl_Position.z = _2242;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = in.m_47.x;
    float _149 = in.m_47.y;
    float _151 = in.m_47.z;
    float _153 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _153;
    if (!_163)
    {
        float _167 = _153 * _153;
        float _169 = _167 * 0.5;
        _125 = _169;
    }
    float _171 = _125;
    float _173 = 0.0;
    float _175 = _171;
    if (!_163)
    {
        float _177 = _123 * _123;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    if (!_163)
    {
        float _183 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _183;
    }
    float _185 = _175;
    bool _187 = !_163;
    float _189 = _185;
    if (!_187)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _153 * _193;
        float _203 = 1.0 / _197;
        float _205 = _199 * 0.693147182464599609375;
        float _207 = exp2(_201);
        float _209 = 1.0 / _205;
        float _211 = _207 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _209, _153);
        float _217 = _215 * _203;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _219;
        _127 = _209;
    }
    float _221 = _189;
    float _223 = _127;
    bool _225 = !_163;
    float _227 = _223;
    float _229 = _221;
    if (!_225)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _153 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _165 = _249;
        _227 = _237;
    }
    float _251 = _165;
    float _253 = _227;
    float _255 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = _253;
    if (!_163)
    {
        _261 = _123;
    }
    float _263 = _261;
    float _265 = fma(_251, _147, _255);
    float _267 = _263;
    if (!_163)
    {
        float _269 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _269;
    }
    float _271 = _229;
    bool _273 = !_163;
    float _275 = _271;
    if (!_273)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = _123 * _279;
        float _289 = 1.0 / _283;
        float _291 = _285 * 0.693147182464599609375;
        float _293 = exp2(_287);
        float _295 = 1.0 / _291;
        float _297 = _293 + (-1.0);
        float _299 = -_297;
        float _301 = fma(_299, _295, _123);
        float _303 = _301 * _289;
        float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _305;
    }
    float _307 = _275;
    bool _309 = !_163;
    if (!_309)
    {
        float _311 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = log2(_311);
        float _315 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _317 = _315 + 1.0;
        float _319 = 1.0 / _317;
        float _321 = _123 * _313;
        float _323 = exp2(_321);
        float _325 = -_323;
        float _327 = _325 + 1.0;
        float _329 = _327 * _319;
        _267 = _329;
    }
    float _331 = _267;
    float _333 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _335 = fma(_251, _149, _257);
    float _337 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = fma(_331, _149, _333);
    float _343 = fma(_251, _151, _259);
    float _345 = fma(_331, _147, _337);
    float _347 = fma(_331, _151, _339);
    float _349 = -_341;
    float _351 = _335 + _349;
    float _353 = in.m_49.y;
    float _355 = -_345;
    float _357 = _265 + _355;
    float _359 = -_347;
    float _361 = _343 + _359;
    float _363 = _351 * _351;
    float _365 = in.m_51.y;
    float _367 = fma(_357, _357, _363);
    float _369 = in.m_53.y;
    float _371 = fma(_361, _361, _367);
    float _373 = in.m_49.x;
    float _375 = in.m_51.x;
    float _377 = sqrt(_371);
    float _379 = in.m_53.x;
    float _381 = in.m_49.z;
    float _383 = _351 * _353;
    float _385 = in.m_51.z;
    float _387 = _351 * _365;
    float _389 = in.m_53.z;
    bool _391 = _377 >= 9.9999999747524270787835121154785e-07;
    bool _393 = isnan(_377);
    bool _395 = _391 || _393;
    bool _397 = isnan(9.9999999747524270787835121154785e-07);
    bool _399 = _395 || _397;
    float _401 = _351 * _369;
    float _403 = _353 * _353;
    float _405 = in.m_55.w;
    float _407 = fma(_357, _373, _383);
    float _409 = fma(_365, _365, _403);
    float _411 = in.m_42.x;
    float _413 = in.m_42.y;
    float _415 = in.m_42.z;
    float _417 = fma(_357, _375, _387);
    float _419 = fma(_369, _369, _409);
    float _421 = fma(_357, _379, _401);
    float _423 = fma(_361, _381, _407);
    float _425 = fma(_361, _385, _417);
    float _427 = fma(_361, _389, _421);
    float _429 = _421;
    float _431 = _405;
    float _433 = _343;
    float _435 = _423;
    float _437 = _423;
    float _439 = _345;
    if (_399)
    {
        _429 = _425;
    }
    float _441 = _429;
    float _443 = fma(_265, _405, _411);
    float _445 = fma(_335, _405, _413);
    float _447 = fma(_343, _405, _415);
    float _449 = _441;
    float _451 = _441;
    if (_399)
    {
        _431 = _427;
    }
    float _453 = _431;
    float _455 = _453;
    float _457 = _453;
    if (!_399)
    {
        bool _459 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _461 = !_459;
        if (!_461)
        {
            float _463 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _465 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _467 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _469 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[16].x, _463);
            float _471 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[16].x, _465);
            float _473 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[16].x, _467);
            float _475 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[16].z, _469);
            float _477 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[16].z, _471);
            float _479 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[16].z, _473);
            float _481 = _475 * _475;
            float _483 = fma(_477, _477, _481);
            float _485 = fma(_479, _479, _483);
            float _487 = rsqrt(_485);
            float _489 = _487 * 9.9999999747524270787835121154785e-07;
            float _491 = _477 * _489;
            float _493 = _475 * _489;
            float _495 = _479 * _489;
            _437 = _493;
            _451 = _491;
            _457 = _495;
            _497 = true;
        }
        else
        {
            float _499 = _149 * _149;
            float _501 = fma(_147, _147, _499);
            float _503 = fma(_151, _151, _501);
            float _505 = sqrt(_503);
            bool _507 = _505 >= 9.9999999747524270787835121154785e-07;
            bool _509 = isnan(_505);
            bool _511 = _507 || _509;
            bool _513 = isnan(9.9999999747524270787835121154785e-07);
            bool _515 = _511 || _513;
            if (!_515)
            {
                float _517 = _413 * _413;
                float _519 = fma(_411, _411, _517);
                float _521 = fma(_415, _415, _519);
                float _523 = sqrt(_521);
                bool _525 = _523 >= 9.9999999747524270787835121154785e-07;
                bool _527 = isnan(_523);
                bool _529 = _525 || _527;
                bool _531 = isnan(9.9999999747524270787835121154785e-07);
                bool _533 = _529 || _531;
                float _535 = _419;
                if (!_533)
                {
                    float _537 = rsqrt(_419);
                    _535 = _537;
                }
                float _539 = _535;
                if (!_533)
                {
                    float _541 = _539 * 9.9999999747524270787835121154785e-07;
                    _433 = _541;
                }
                float _543 = _433;
                if (!_533)
                {
                    float _545 = _365 * _543;
                    _449 = _545;
                }
                float _547 = _449;
                _451 = _547;
                if (!_533)
                {
                    float _549 = _353 * _543;
                    _435 = _549;
                }
                float _551 = _435;
                _437 = _551;
                if (!_533)
                {
                    float _553 = _369 * _543;
                    _455 = _553;
                }
                float _555 = _455;
                bool _557 = !_533;
                _457 = _555;
                _497 = _557;
                if (!_497)
                {
                    float _559 = _353 * _413;
                    float _561 = _365 * _413;
                    float _563 = _369 * _413;
                    float _565 = fma(_411, _373, _559);
                    float _567 = fma(_411, _375, _561);
                    float _569 = fma(_411, _379, _563);
                    float _571 = fma(_415, _381, _565);
                    float _573 = fma(_415, _385, _567);
                    float _575 = fma(_415, _389, _569);
                    float _577 = _571 * _571;
                    float _579 = fma(_573, _573, _577);
                    float _581 = fma(_575, _575, _579);
                    float _583 = rsqrt(_581);
                    float _585 = _583 * 9.9999999747524270787835121154785e-07;
                    float _587 = _573 * _585;
                    float _589 = _571 * _585;
                    float _591 = _575 * _585;
                    _437 = _589;
                    _451 = _587;
                    _457 = _591;
                    _497 = true;
                }
            }
            else
            {
                float _593 = _353 * _149;
                float _595 = _365 * _149;
                float _597 = _369 * _149;
                float _599 = fma(_147, _373, _593);
                float _601 = fma(_147, _375, _595);
                float _603 = fma(_147, _379, _597);
                float _605 = fma(_151, _381, _599);
                float _607 = fma(_151, _385, _601);
                float _609 = fma(_151, _389, _603);
                float _611 = _605 * _605;
                float _613 = fma(_607, _607, _611);
                float _615 = fma(_609, _609, _613);
                float _617 = rsqrt(_615);
                float _619 = _617 * 9.9999999747524270787835121154785e-07;
                float _621 = _607 * _619;
                float _623 = _605 * _619;
                float _625 = _609 * _619;
                _437 = _623;
                _451 = _621;
                _457 = _625;
            }
        }
    }
    _497 = false;
    float _627 = _437;
    float _629 = _451;
    float _631 = _457;
    bool _633 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _635 = !_633;
    float _637 = _627;
    float _639 = _629;
    float _641 = _631;
    float _659;
    if (!_635)
    {
        float _643 = in.m_57.x;
        float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _647 = _643 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _651 = _649 * _645;
        float _653 = floor(_651);
        float _655 = -_653;
        float _657 = _651 + _655;
        _659 = _657;
        _661 = true;
    }
    else
    {
        float _663 = float(_89);
        float _665 = 1.0 / _663;
        float _667 = _123 * _665;
        _659 = _667;
    }
    _661 = false;
    float _669 = _659;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _673 = _669 + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _677 = _669 + _675;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _681 = _669 + _679;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _699 = 1.0 / _685;
    bool _701 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _703 = isnan(_669);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = 1.0 / _689;
    bool _715 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _717 = 1.0 / _693;
    float _719 = _673 * _699;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _723 = _669 + _721;
    bool _725 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _727 = isnan(_669);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = 1.0 / _697;
    float _739 = _677 * _713;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _741;
    float _745 = fma(_743, _719, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _747 = _681 * _717;
    bool _749 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _751 = isnan(_669);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _761;
    bool _765 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _767 = isnan(_669);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = fma(_763, _719, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _779 = -_759;
    float _781 = _779 + 1.0;
    float _783 = _723 * _737;
    float _785 = -_735;
    float _787 = _785 + 1.0;
    float _789 = _711 * _781;
    float _791 = -_711;
    float _793 = _791 + 1.0;
    float _795 = _775 * _787;
    float _797 = -_775;
    float _799 = _797 + 1.0;
    bool _801 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _803 = isnan(_669);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = _759 * _799;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _819 = _811 * _793;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _825 = -_811;
    float _827 = _825 + 1.0;
    float _829 = fma(_817, _739, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _831 = _745 * _819;
    float _833 = _777 * _819;
    float _835 = fma(_823, _739, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _837;
    float _841 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[143].x, _831);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _843;
    float _847 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[143].y, _833);
    float _849 = fma(_839, _747, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _855 = fma(_845, _747, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _861 = fma(_835, _789, _841);
    float _863 = fma(_829, _789, _847);
    float _865 = fma(_853, _783, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _867 = fma(_859, _783, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _869 = fma(_849, _813, _861);
    float _871 = fma(_855, _813, _863);
    float _873 = fma(_865, _795, _869);
    float _875 = fma(_867, _795, _871);
    float _877 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[147].x, _873);
    float _879 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[147].y, _875);
    bool _881 = !_715;
    float _899;
    if (!_881)
    {
        float _883 = in.m_57.x;
        float _885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _887 = _883 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _889 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _891 = _889 * _885;
        float _893 = floor(_891);
        float _895 = -_893;
        float _897 = _891 + _895;
        _899 = _897;
        _901 = true;
    }
    else
    {
        float _903 = float(_89);
        float _905 = 1.0 / _903;
        float _907 = _123 * _905;
        _899 = _907;
    }
    _901 = false;
    float _909 = _899;
    float _911 = _627 * _627;
    float _913 = as_type<float>(int(gl_VertexIndex));
    float _915 = fma(_629, _629, _911);
    float _917 = in.m_51.w;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _923 = fma(_631, _631, _915);
    float _925 = in.m_55.x;
    float _927 = in.m_55.y;
    float _929 = 1.0 / _921;
    float _931 = rsqrt(_923);
    int _933 = as_type<int>(_913) & 1;
    bool _935 = _933 != 0;
    int _937 = as_type<int>(_913) & 2;
    bool _939 = _937 != 0;
    float _941 = _445 * _365;
    float _943 = fma(_443, _375, _941);
    float _945 = _877 * _925;
    float _947 = _931 * _631;
    float _949 = _931 * _629;
    float _951 = _931 * _627;
    float _953 = fma(_447, _385, _943);
    float _955 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _957 = _947 * _955;
    float _959 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _961 = _949 * _959;
    float _963 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _965 = _951 * _963;
    float _967 = _945 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _971 = -_957;
    float _973 = fma(_949, _969, _971);
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _977 = -_961;
    float _979 = fma(_951, _975, _977);
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _983 = -_965;
    float _985 = fma(_947, _981, _983);
    float _987 = _879 * _927;
    float _989 = _973 * _973;
    float _991 = in.m_53.w;
    float _993 = _953 + _917;
    float _995 = _987 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _997 = fma(_985, _985, _989);
    float _999 = fma(_979, _979, _997);
    bool _1001 = !_939;
    float _1003 = _1001 ? (-0.5) : 0.5;
    float _1005 = rsqrt(_999);
    bool _1007 = !_935;
    float _1009 = _1007 ? (-0.5) : 0.5;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1013 = _1011 != 0;
    float _1015 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1003);
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1009);
    float _1019 = _995 * _1015;
    float _1021 = _967 * _1017;
    float _1023 = in.m_57.x;
    float _1025 = in.m_57.y;
    float _1027 = _445 * _369;
    float _1029 = _1019 * _947;
    float _1031 = _1019 * _949;
    float _1033 = _445 * _353;
    float _1035 = _973 * _1005;
    float _1037 = fma(_443, _379, _1027);
    float _1039 = _985 * _1005;
    float _1041 = _979 * _1005;
    float _1043 = _949 * _1035;
    float _1045 = fma(_447, _389, _1037);
    float _1047 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1049 = _951 * _1041;
    float _1051 = fma(_1021, _1041, _1029);
    float _1053 = -_1043;
    float _1055 = fma(_951, _1039, _1053);
    float _1057 = fma(_1021, _1039, _1031);
    float _1059 = -_1049;
    float _1061 = fma(_947, _1035, _1059);
    float _1063 = _1045 + _991;
    float _1065 = fma(_1047, _1055, _1051);
    float _1067 = _1019 * _951;
    float _1069 = fma(_1047, _1061, _1057);
    float _1071 = in.m_49.w;
    float _1073 = _1063 + _1065;
    float _1075 = fma(_443, _373, _1033);
    float _1077 = _993 + _1069;
    bool _1079 = _1023 > 0.5;
    float _1081 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1083 = _1073 + _1081;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1085;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1091 = _1077 + _1089;
    float _1093 = fma(_447, _381, _1075);
    float _1095 = _1083 * _1083;
    float _1097 = _1087 * _929;
    bool _1099 = _1025 > 0.5;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1103 = _909 + _1101;
    float _1105 = fma(_1091, _1091, _1095);
    bool _1107 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1109 = isnan(_909);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    float _1119 = _947 * _1039;
    bool _1121 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1123 = isnan(_909);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1129 = _1125 || _1127;
    float _1131 = float(_1129);
    float _1133 = sqrt(_1105);
    float _1135 = fma(_1097, _1103, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1137 = -_1117;
    float _1139 = _1137 + 1.0;
    float _1141 = -_1009;
    int _1143 = _1079 ? as_type<int>(_1141) : as_type<int>(_1009);
    float _1145 = -_1119;
    float _1147 = fma(_949, _1041, _1145);
    float _1149 = -_1003;
    int _1151 = _1099 ? as_type<int>(_1149) : as_type<int>(_1003);
    float _1153 = _1131 * _1139;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1157 = _1155 != 0;
    float _1159 = _1093 + _1071;
    float _1161 = fma(_1021, _1035, _1067);
    float _1163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1165 = _1135 * _1153;
    float _1167 = -_1131;
    float _1169 = _1167 + 1.0;
    bool _1171 = !_1157;
    float _1173 = _1171 ? _1003 : as_type<float>(_1151);
    float _1175 = fma(_1047, _1147, _1161);
    bool _1177 = !_1013;
    float _1179 = _1177 ? _1009 : as_type<float>(_1143);
    float _1181 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1165);
    bool _1183 = _1133 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1187 = -_1173;
    float _1189 = _1187 + 0.5;
    float _1191 = _1159 + _1175;
    float _1193 = _1179 + 0.5;
    float _1195 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1181);
    float _1197 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1199 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1201 = _1189;
    float _1203 = _1077;
    float _1205 = _1073;
    float _1207 = _923;
    if (!_1183)
    {
        _1201 = _1077;
    }
    float _1209 = _1201;
    float _1211 = _1209;
    if (!_1183)
    {
        _1203 = _1191;
    }
    float _1213 = _1203;
    bool _1215 = !_1183;
    float _1217 = _1213;
    if (!_1215)
    {
        float _1219 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1221 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1223 = _1133 + _1221;
        float _1225 = _1191 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1227 = rsqrt(_1105);
        float _1229 = _1223 * _1219;
        float _1231 = _1229 * 0.15915493667125701904296875;
        float _1233 = _1231 * 6.283185482025146484375;
        float _1235 = cos(_1233);
        float _1237 = _1231 * 6.283185482025146484375;
        float _1239 = sin(_1237);
        float _1241 = _1235 + (-1.0);
        float _1243 = fma(_1239, _1225, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1245 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1247 = _1227 * _1243;
        float _1249 = fma(_1191, _1235, _1245);
        float _1251 = fma(_1091, _1247, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1253 = fma(_1083, _1247, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1217 = _1249;
        _1211 = _1251;
        _1205 = _1253;
    }
    float _1255 = _1217;
    float _1257 = _1211;
    float _1259 = _1205;
    float _1261 = -_1159;
    float _1263 = _1261 + _1255;
    float _1265 = _1197 * _1185;
    float _1267 = -_993;
    float _1269 = _1267 + _1257;
    float _1271 = -_1063;
    float _1273 = _1271 + _1259;
    float _1275 = _1263 * _1263;
    float _1277 = _1199 * _1163;
    float _1279 = fma(_1269, _1269, _1275);
    float _1281 = fma(_1273, _1273, _1279);
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1285 = sqrt(_1281);
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1303 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1305 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1309 = _1195 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _1277;
    out.m_62.y = _1265;
    bool _1311 = _1285 > 0.0;
    out.m_64.x = _1301;
    out.m_64.y = _1303;
    out.m_64.z = _1305;
    out.m_66.x = _1297;
    out.m_66.y = _1299;
    out.m_66.z = _1307;
    out.m_66.w = _1309;
    bool _1313 = !_1311;
    float _1315 = _1309;
    float _1317 = _1299;
    float _1319 = _1301;
    float _1321 = _1301;
    float _1323 = _1257;
    float _1325 = _1255;
    float _1327 = _1259;
    float _1329 = _1301;
    if (!_1313)
    {
        bool _1331 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1333 = _1303;
        if (_1331)
        {
            float _1335 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1333 = _1335;
        }
        float _1337 = _1333;
        float _1339 = _1337;
        if (_1331)
        {
            float _1341 = _1337 * _629;
            _1315 = _1341;
        }
        float _1343 = _1315;
        float _1345 = _1343;
        if (_1331)
        {
            float _1347 = _1337 * _627;
            _1317 = _1347;
        }
        float _1349 = _1317;
        float _1351 = _1349;
        if (_1331)
        {
            float _1353 = _1337 * _631;
            _1339 = _1353;
        }
        float _1355 = _1339;
        float _1357 = _1355;
        if (!_1331)
        {
            float _1359 = _123 + 1.0;
            float _1361 = _1359;
            if (!_163)
            {
                float _1363 = _1359 * _1359;
                float _1365 = _1363 * 0.5;
                _1319 = _1365;
            }
            float _1367 = _1319;
            float _1369 = _1367;
            if (!_163)
            {
                float _1371 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1369 = _1371;
            }
            float _1373 = _1369;
            bool _1375 = !_163;
            float _1377 = _1373;
            if (!_1375)
            {
                float _1379 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1381 = log2(_1379);
                float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1385 = _1383 + 1.0;
                float _1387 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1389 = _1381 * _1359;
                float _1391 = 1.0 / _1385;
                float _1393 = _1387 * 0.693147182464599609375;
                float _1395 = exp2(_1389);
                float _1397 = 1.0 / _1393;
                float _1399 = _1395 + (-1.0);
                float _1401 = -_1399;
                float _1403 = fma(_1401, _1397, _1359);
                float _1405 = _1403 * _1391;
                float _1407 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1377 = _1407;
            }
            float _1409 = _1377;
            float _1411 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1413 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1415 = !_163;
            _1321 = _1409;
            if (!_1415)
            {
                float _1417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1419 = log2(_1417);
                float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1423 = _1421 + 1.0;
                float _1425 = 1.0 / _1423;
                float _1427 = _1419 * _1359;
                float _1429 = exp2(_1427);
                float _1431 = -_1429;
                float _1433 = _1431 + 1.0;
                float _1435 = _1433 * _1425;
                _1361 = _1435;
            }
            float _1437 = _1361;
            float _1439 = fma(_1437, _149, _1413);
            float _1441 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1443 = fma(_1437, _147, _1411);
            float _1445 = -_341;
            float _1447 = _1445 + _1439;
            float _1449 = fma(_1437, _151, _1441);
            float _1451 = -_345;
            float _1453 = _1451 + _1443;
            float _1455 = _1447 * _353;
            float _1457 = -_347;
            float _1459 = _1457 + _1449;
            float _1461 = _1447 * _365;
            float _1463 = _1447 * _369;
            float _1465 = fma(_1453, _373, _1455);
            float _1467 = fma(_1453, _375, _1461);
            float _1469 = fma(_1453, _379, _1463);
            float _1471 = fma(_1459, _381, _1465);
            float _1473 = fma(_1459, _385, _1467);
            float _1475 = fma(_1459, _389, _1469);
            float _1477 = _1471 * _1471;
            float _1479 = fma(_1473, _1473, _1477);
            float _1481 = fma(_1475, _1475, _1479);
            _1207 = _1481;
            _637 = _1471;
            _639 = _1473;
            _641 = _1475;
            _1345 = _1473;
            _1351 = _1471;
            _1357 = _1475;
        }
        float _1483 = _1207;
        float _1485 = _637;
        float _1487 = _639;
        float _1489 = _641;
        float _1491 = _1345;
        float _1493 = _1351;
        float _1495 = _1357;
        float _1497 = _1321;
        float _1499 = sqrt(_1483);
        float _1501 = rsqrt(_1281);
        bool _1503 = _1499 > 0.0;
        float _1505 = _1269 * _1501;
        float _1507 = _1263 * _1501;
        float _1509 = _1273 * _1501;
        bool _1511 = !_1503;
        _1329 = _1497;
        if (!_1511)
        {
            float _1513 = rsqrt(_1483);
            float _1515 = _1513 * _1485;
            float _1517 = _1513 * _1487;
            float _1519 = _1507 * _1515;
            float _1521 = _1513 * _1489;
            float _1523 = fma(_1505, _1517, _1519);
            float _1525 = fma(_1509, _1521, _1523);
            float _1527 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1529 = fma(_1491, _1527, _1257);
            float _1531 = fma(_1493, _1527, _1255);
            float _1533 = fma(_1495, _1527, _1259);
            _1323 = _1529;
            _1325 = _1531;
            _1327 = _1533;
        }
    }
    float _1535 = _1323;
    float _1537 = _1325;
    float _1539 = _1327;
    float _1541 = _1329;
    float _1543 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1545 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1547 = isnan(0.5);
    bool _1549 = _1545 || _1547;
    bool _1551 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1553 = _1549 || _1551;
    bool _1555 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1557 = isnan(0.5);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1563 = _1559 || _1561;
    float _1565 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1543);
    float _1567 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1569 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1565);
    float _1571 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1567);
    float _1573 = _1569 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1575 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1571);
    float _1577 = _1567;
    float _1579 = _1537;
    float _1581 = _1539;
    float _1583 = _1541;
    if (_1553)
    {
        _1577 = _1535;
    }
    float _1585 = _1577;
    float _1587 = 1.0 / _1573;
    float _1589 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1591 = _1589 + _1573;
    float _1593 = _1585;
    if (!_1553)
    {
        float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1597 = _1159 + _1595;
        float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1601 = _993 + _1599;
        float _1603 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1605 = -_1159;
        float _1607 = _1605 + _1537;
        float _1609 = _1597 * _1597;
        float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1613 = _1063 + _1611;
        float _1615 = fma(_1601, _1601, _1609);
        float _1617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1619 = fma(_1613, _1613, _1615);
        float _1621 = sqrt(_1619);
        float _1623 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1625 = precise::min(_1621, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1627 = _1625 * _1617;
        float _1629 = -_993;
        float _1631 = _1629 + _1535;
        float _1633 = _1623 * _1627;
        float _1635 = -_1063;
        float _1637 = _1635 + _1539;
        float _1639 = fma(_1631, _1633, _993);
        float _1641 = fma(_1607, _1633, _1159);
        float _1643 = fma(_1637, _1633, _1063);
        _1579 = _1641;
        _1593 = _1639;
        _1581 = _1643;
    }
    float _1645 = _1579;
    float _1647 = _1593;
    float _1649 = _1581;
    if (_1563)
    {
        _1583 = 1.0;
    }
    float _1651 = _1583;
    float _1653 = _1591 * _1587;
    float _1655 = _1653 * 0.5;
    float _1657 = _1651;
    if (!_1563)
    {
        float _1659 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1661 = _1659 * 0.15915493667125701904296875;
        float _1663 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1665 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1667 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1665);
        float _1669 = _1661 * 6.283185482025146484375;
        float _1671 = cos(_1669);
        float _1673 = _1663 * 0.15915493667125701904296875;
        float _1675 = _1661 * 6.283185482025146484375;
        float _1677 = sin(_1675);
        float _1679 = 1.0 / _1671;
        float _1681 = _1673 * 6.283185482025146484375;
        float _1683 = cos(_1681);
        float _1685 = _1677 * _1679;
        float _1687 = _1673 * 6.283185482025146484375;
        float _1689 = sin(_1687);
        float _1691 = _1683 * _1685;
        float _1693 = 1.0 / _1667;
        float _1695 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1697 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1695;
        float _1699 = 1.0 / _1691;
        float _1701 = 1.0 / _1697;
        float _1703 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1705 = _1693 * _1703;
        float _1707 = _1689 * _1699;
        float _1709 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1711 = fma(_1707, _1705, _1709);
        float _1713 = _1711 * _1701;
        float _1715 = precise::clamp(_1713, 0.0, 1.0);
        _1657 = _1715;
    }
    float _1717 = _1657;
    float _1719 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1721 = _1645 + _1719;
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1725 = _1647 + _1723;
    float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1729 = _1649 + _1727;
    float _1731 = _1721 * _1721;
    float _1733 = fma(_1725, _1725, _1731);
    float _1735 = fma(_1729, _1729, _1733);
    float _1737 = rsqrt(_1735);
    float _1739 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1741 = _1725 * _1739;
    float _1743 = _1729 * _1739;
    float _1745 = _1741 * _1741;
    float _1747 = _1743 * _1743;
    float _1749 = _1745 + _1747;
    float _1751 = sqrt(_1749);
    bool _1753 = _1751 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1755 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1757 = _1751 + _1755;
    float _1759 = _1655;
    float _1761 = _1749;
    float _1763 = _1757;
    float _1765 = _1721;
    float _1767 = _1741;
    if (_1753)
    {
        float _1769 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1759 = _1769;
    }
    float _1771 = _1759;
    if (_1753)
    {
        float _1773 = rsqrt(_1749);
        _1761 = _1773;
    }
    float _1775 = _1761;
    float _1777 = _1771;
    if (_1753)
    {
        float _1779 = _1757 * _1771;
        _1763 = _1779;
    }
    float _1781 = _1763;
    if (_1753)
    {
        float _1783 = _1781 * 0.15915493667125701904296875;
        _1777 = _1783;
    }
    float _1785 = _1777;
    float _1787 = _1729;
    float _1789 = _1785;
    if (_1753)
    {
        float _1791 = _1785 * 6.283185482025146484375;
        float _1793 = sin(_1791);
        _1787 = _1793;
    }
    float _1795 = _1787;
    float _1797 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1799 = precise::max(0.0, _1797);
    float _1801 = _1737;
    float _1803 = _1799;
    if (_1753)
    {
        float _1805 = _1785 * 6.283185482025146484375;
        float _1807 = cos(_1805);
        _1801 = _1807;
    }
    float _1809 = _1801;
    float _1811 = -_1739;
    float _1813 = -_1799;
    float _1815 = fma(_1721, _1811, _1813);
    if (_1753)
    {
        float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1765 = _1817;
    }
    float _1819 = _1765;
    float _1821 = _1819;
    float _1823 = _1795;
    if (_1753)
    {
        float _1825 = fma(_1795, _1819, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1821 = _1825;
    }
    float _1827 = _1821;
    float _1829 = _1827;
    if (!_1753)
    {
        _1823 = _1815;
    }
    float _1831 = _1823;
    float _1833 = _1831;
    float _1835 = _1809;
    if (_1753)
    {
        float _1837 = _1809 + (-1.0);
        _1803 = _1837;
    }
    float _1839 = _1803;
    float _1841 = _1839;
    if (_1753)
    {
        float _1843 = _1775 * _1827;
        _439 = _1843;
    }
    float _1845 = _439;
    if (!_1753)
    {
        _1829 = _1745;
    }
    float _1847 = _1829;
    float _1849 = sqrt(_1735);
    float _1851 = _1847;
    if (_1753)
    {
        float _1853 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1789 = _1853;
    }
    float _1855 = _1789;
    if (_1753)
    {
        float _1857 = _1741 * _1845;
        _1767 = _1857;
    }
    float _1859 = _1767;
    if (!_1753)
    {
        _1841 = _1743;
    }
    float _1861 = _1841;
    float _1863 = _1861;
    if (_1753)
    {
        float _1865 = _1743 * _1845;
        _1863 = _1865;
    }
    float _1867 = _1863;
    if (_1753)
    {
        float _1869 = fma(_1815, _1809, _1855);
        _1833 = _1869;
    }
    float _1871 = _1833;
    if (_1753)
    {
        float _1873 = _1859 * _1859;
        _1851 = _1873;
    }
    float _1875 = _1851;
    if (!_1753)
    {
        _1835 = _1747;
    }
    float _1877 = _1835;
    float _1879 = _1877;
    if (_1753)
    {
        float _1881 = _1867 * _1867;
        _1879 = _1881;
    }
    float _1883 = _1879;
    float _1885 = fma(_1871, _1871, _1875);
    float _1887 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1889 = _1885 + _1883;
    float _1891 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1895 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1893);
    float _1897 = precise::clamp(_1895, 0.0, 1.0);
    float _1899 = rsqrt(_1889);
    float _1901 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1891);
    float _1903 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1905 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1907 = -_1897;
    float _1909 = _1907 + 1.0;
    float _1911 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1901);
    float _1913 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1915 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1903);
    float _1917 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1887);
    float _1919 = _1911 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1921 = abs(_1909);
    float _1923 = log2(_1921);
    float _1925 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1913);
    float _1927 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1915);
    float _1929 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1931 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1925);
    float _1933 = _1927 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1935 = _1899 * _1859;
    float _1937 = -_1929;
    float _1939 = fma(_1937, _1905, 1.0);
    float _1941 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1943 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1917);
    float _1945 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1947 = _1899 * _1871;
    float _1949 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1951 = _1899 * _1867;
    float _1953 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1945);
    float _1955 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1957 = -_1949;
    float _1959 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1957);
    float _1961 = _1943 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1963 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1953);
    float _1965 = exp2(_1955);
    float _1967 = -_1951;
    float _1969 = fma(_1967, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1959);
    float _1971 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1973 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1963);
    float _1975 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1977 = fma(_1969, -0.5, 0.5);
    float _1979 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1971);
    float _1981 = fma(_1969, 0.5, 0.5);
    float _1983 = log2(_1939);
    float _1985 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1975);
    float _1987 = _1947 + 1.0;
    float _1989 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1979);
    float _1991 = fma(_1981, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1993 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1985);
    float _1995 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1989);
    float _1997 = 1.0 / _1973;
    float _1999 = -_1947;
    float _2001 = fma(_1965, _1987, _1999);
    float _2003 = fma(_1981, _1991, -0.212114393711090087890625);
    float _2005 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1993);
    float _2007 = fma(_1981, _2003, 1.570728778839111328125);
    float _2009 = sqrt(_1977);
    float _2011 = _1983 * 0.693147182464599609375;
    float _2013 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2015 = _1995 * _1997;
    float _2017 = _2005 * _1997;
    float _2019 = fma(_2015, 0.5, 0.5);
    float _2021 = fma(_2017, -0.5, 0.5);
    float _2023 = fma(_2001, 0.5, 0.5);
    float _2025 = _2009 * 0.636619746685028076171875;
    float3 _5195 = float3(_2019, _2021, _2013);
    float _2027 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5195, float3(0.0), isnan(_5195)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5195, float3(0.0), isnan(_5195)), level(0.0)).x;
    float3 _5206 = float3(_2019, _2021, _2013);
    float4 _2030 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5206, float3(0.0), isnan(_5206)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5206, float3(0.0), isnan(_5206)), level(0.0)).xyzw;
    float _2032 = _2030.x;
    float _2034 = _2030.y;
    float _2036 = _2030.z;
    float _2038 = _2030.w;
    float _2040 = -_2007;
    float _2042 = fma(_2025, _2040, 1.0);
    float2 _5228 = float2(_2042, _2023);
    float3 _2046 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5228, float2(0.0), isnan(_5228)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5228, float2(0.0), isnan(_5228)), level(0.0)).xyz;
    float _2048 = _2046.x;
    float _2050 = _2046.y;
    float _2052 = _2046.z;
    float _2054 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2056 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2058 = _1973 * 0.5;
    bool _2060 = _1717 > 0.0;
    bool _2062 = isnan(_1717);
    bool _2064 = _2060 || _2062;
    bool _2066 = isnan(0.0);
    bool _2068 = _2064 || _2066;
    float _2070 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2072 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2056);
    float _2074 = exp2(_2054);
    float _2076 = _1995 + _1973;
    float _2078 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2072);
    float _2080 = _2076 * 0.5;
    float _2082 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2078);
    float _2084 = fma(_2005, -0.5, _2058);
    float _2086 = _2082 + _1973;
    out.gl_Position.x = _1995;
    out.gl_Position.y = _2005;
    out.gl_Position.z = _2082;
    out.gl_Position.w = _1973;
    float _2088 = _2086 * 0.5;
    float _2090 = -_2074;
    float _2092 = _2090 + 1.0;
    float _2094 = _2070 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2096 = _2092 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2080;
    out.m_68.y = _2084;
    out.m_68.z = _2088;
    out.m_68.w = _1973;
    float _2098 = -_2096;
    float _2100 = _2098 + 1.0;
    out.m_45.x = _2094;
    float _2102 = _2096 * _2027;
    float _2104 = _2038 * _2100;
    float _2106 = _2038 * _2102;
    float _2108 = _2052 * _2102;
    float _2110 = fma(_2048, _2106, _2032);
    float _2112 = fma(_2050, _2106, _2034);
    float _2114 = fma(_2038, _2108, _2036);
    out.m_70.x = _2110;
    out.m_70.y = _2112;
    out.m_70.z = _2114;
    out.m_70.w = _2104;
    if (_2068)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2116 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2116;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _901 = false;
    bool _661 = false;
    bool _497 = false;
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
        float _2173 = as_type<float>(_105);
        out.gl_Position.z = _2173;
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
    float _125 = 0.0;
    float _127 = 0.0;
    if (_119)
    {
        float _129 = float(_89);
        _99 = _129;
    }
    float _131 = _99;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _107 = as_type<int>(_143);
    }
    int _145 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2242 = as_type<float>(_145);
        out.gl_Position.z = _2242;
    }
    if (_137)
    {
        return out;
    }
    float _147 = in.m_47.x;
    float _149 = in.m_47.y;
    float _151 = in.m_47.z;
    float _153 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _153;
    if (!_163)
    {
        float _167 = _153 * _153;
        float _169 = _167 * 0.5;
        _125 = _169;
    }
    float _171 = _125;
    float _173 = 0.0;
    float _175 = _171;
    if (!_163)
    {
        float _177 = _123 * _123;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    if (!_163)
    {
        float _183 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _183;
    }
    float _185 = _175;
    bool _187 = !_163;
    float _189 = _185;
    if (!_187)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _153 * _193;
        float _203 = 1.0 / _197;
        float _205 = _199 * 0.693147182464599609375;
        float _207 = exp2(_201);
        float _209 = 1.0 / _205;
        float _211 = _207 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _209, _153);
        float _217 = _215 * _203;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _219;
        _127 = _209;
    }
    float _221 = _189;
    float _223 = _127;
    bool _225 = !_163;
    float _227 = _223;
    float _229 = _221;
    if (!_225)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _153 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _165 = _249;
        _227 = _237;
    }
    float _251 = _165;
    float _253 = _227;
    float _255 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = _253;
    if (!_163)
    {
        _261 = _123;
    }
    float _263 = _261;
    float _265 = fma(_251, _147, _255);
    float _267 = _263;
    if (!_163)
    {
        float _269 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _269;
    }
    float _271 = _229;
    bool _273 = !_163;
    float _275 = _271;
    if (!_273)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = _123 * _279;
        float _289 = 1.0 / _283;
        float _291 = _285 * 0.693147182464599609375;
        float _293 = exp2(_287);
        float _295 = 1.0 / _291;
        float _297 = _293 + (-1.0);
        float _299 = -_297;
        float _301 = fma(_299, _295, _123);
        float _303 = _301 * _289;
        float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _305;
    }
    float _307 = _275;
    bool _309 = !_163;
    if (!_309)
    {
        float _311 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = log2(_311);
        float _315 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _317 = _315 + 1.0;
        float _319 = 1.0 / _317;
        float _321 = _123 * _313;
        float _323 = exp2(_321);
        float _325 = -_323;
        float _327 = _325 + 1.0;
        float _329 = _327 * _319;
        _267 = _329;
    }
    float _331 = _267;
    float _333 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _335 = fma(_251, _149, _257);
    float _337 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = fma(_331, _149, _333);
    float _343 = fma(_251, _151, _259);
    float _345 = fma(_331, _147, _337);
    float _347 = fma(_331, _151, _339);
    float _349 = -_341;
    float _351 = _335 + _349;
    float _353 = in.m_49.y;
    float _355 = -_345;
    float _357 = _265 + _355;
    float _359 = -_347;
    float _361 = _343 + _359;
    float _363 = _351 * _351;
    float _365 = in.m_51.y;
    float _367 = fma(_357, _357, _363);
    float _369 = in.m_53.y;
    float _371 = fma(_361, _361, _367);
    float _373 = in.m_49.x;
    float _375 = in.m_51.x;
    float _377 = sqrt(_371);
    float _379 = in.m_53.x;
    float _381 = in.m_49.z;
    float _383 = _351 * _353;
    float _385 = in.m_51.z;
    float _387 = _351 * _365;
    float _389 = in.m_53.z;
    bool _391 = _377 >= 9.9999999747524270787835121154785e-07;
    bool _393 = isnan(_377);
    bool _395 = _391 || _393;
    bool _397 = isnan(9.9999999747524270787835121154785e-07);
    bool _399 = _395 || _397;
    float _401 = _351 * _369;
    float _403 = _353 * _353;
    float _405 = in.m_55.w;
    float _407 = fma(_357, _373, _383);
    float _409 = fma(_365, _365, _403);
    float _411 = in.m_42.x;
    float _413 = in.m_42.y;
    float _415 = in.m_42.z;
    float _417 = fma(_357, _375, _387);
    float _419 = fma(_369, _369, _409);
    float _421 = fma(_357, _379, _401);
    float _423 = fma(_361, _381, _407);
    float _425 = fma(_361, _385, _417);
    float _427 = fma(_361, _389, _421);
    float _429 = _421;
    float _431 = _405;
    float _433 = _343;
    float _435 = _423;
    float _437 = _423;
    float _439 = _345;
    if (_399)
    {
        _429 = _425;
    }
    float _441 = _429;
    float _443 = fma(_265, _405, _411);
    float _445 = fma(_335, _405, _413);
    float _447 = fma(_343, _405, _415);
    float _449 = _441;
    float _451 = _441;
    if (_399)
    {
        _431 = _427;
    }
    float _453 = _431;
    float _455 = _453;
    float _457 = _453;
    if (!_399)
    {
        bool _459 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _461 = !_459;
        if (!_461)
        {
            float _463 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _465 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _467 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _469 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[16].x, _463);
            float _471 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[16].x, _465);
            float _473 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[16].x, _467);
            float _475 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[16].z, _469);
            float _477 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[16].z, _471);
            float _479 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[16].z, _473);
            float _481 = _475 * _475;
            float _483 = fma(_477, _477, _481);
            float _485 = fma(_479, _479, _483);
            float _487 = rsqrt(_485);
            float _489 = _487 * 9.9999999747524270787835121154785e-07;
            float _491 = _477 * _489;
            float _493 = _475 * _489;
            float _495 = _479 * _489;
            _437 = _493;
            _451 = _491;
            _457 = _495;
            _497 = true;
        }
        else
        {
            float _499 = _149 * _149;
            float _501 = fma(_147, _147, _499);
            float _503 = fma(_151, _151, _501);
            float _505 = sqrt(_503);
            bool _507 = _505 >= 9.9999999747524270787835121154785e-07;
            bool _509 = isnan(_505);
            bool _511 = _507 || _509;
            bool _513 = isnan(9.9999999747524270787835121154785e-07);
            bool _515 = _511 || _513;
            if (!_515)
            {
                float _517 = _413 * _413;
                float _519 = fma(_411, _411, _517);
                float _521 = fma(_415, _415, _519);
                float _523 = sqrt(_521);
                bool _525 = _523 >= 9.9999999747524270787835121154785e-07;
                bool _527 = isnan(_523);
                bool _529 = _525 || _527;
                bool _531 = isnan(9.9999999747524270787835121154785e-07);
                bool _533 = _529 || _531;
                float _535 = _419;
                if (!_533)
                {
                    float _537 = rsqrt(_419);
                    _535 = _537;
                }
                float _539 = _535;
                if (!_533)
                {
                    float _541 = _539 * 9.9999999747524270787835121154785e-07;
                    _433 = _541;
                }
                float _543 = _433;
                if (!_533)
                {
                    float _545 = _365 * _543;
                    _449 = _545;
                }
                float _547 = _449;
                _451 = _547;
                if (!_533)
                {
                    float _549 = _353 * _543;
                    _435 = _549;
                }
                float _551 = _435;
                _437 = _551;
                if (!_533)
                {
                    float _553 = _369 * _543;
                    _455 = _553;
                }
                float _555 = _455;
                bool _557 = !_533;
                _457 = _555;
                _497 = _557;
                if (!_497)
                {
                    float _559 = _353 * _413;
                    float _561 = _365 * _413;
                    float _563 = _369 * _413;
                    float _565 = fma(_411, _373, _559);
                    float _567 = fma(_411, _375, _561);
                    float _569 = fma(_411, _379, _563);
                    float _571 = fma(_415, _381, _565);
                    float _573 = fma(_415, _385, _567);
                    float _575 = fma(_415, _389, _569);
                    float _577 = _571 * _571;
                    float _579 = fma(_573, _573, _577);
                    float _581 = fma(_575, _575, _579);
                    float _583 = rsqrt(_581);
                    float _585 = _583 * 9.9999999747524270787835121154785e-07;
                    float _587 = _573 * _585;
                    float _589 = _571 * _585;
                    float _591 = _575 * _585;
                    _437 = _589;
                    _451 = _587;
                    _457 = _591;
                    _497 = true;
                }
            }
            else
            {
                float _593 = _353 * _149;
                float _595 = _365 * _149;
                float _597 = _369 * _149;
                float _599 = fma(_147, _373, _593);
                float _601 = fma(_147, _375, _595);
                float _603 = fma(_147, _379, _597);
                float _605 = fma(_151, _381, _599);
                float _607 = fma(_151, _385, _601);
                float _609 = fma(_151, _389, _603);
                float _611 = _605 * _605;
                float _613 = fma(_607, _607, _611);
                float _615 = fma(_609, _609, _613);
                float _617 = rsqrt(_615);
                float _619 = _617 * 9.9999999747524270787835121154785e-07;
                float _621 = _607 * _619;
                float _623 = _605 * _619;
                float _625 = _609 * _619;
                _437 = _623;
                _451 = _621;
                _457 = _625;
            }
        }
    }
    _497 = false;
    float _627 = _437;
    float _629 = _451;
    float _631 = _457;
    bool _633 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _635 = !_633;
    float _637 = _627;
    float _639 = _629;
    float _641 = _631;
    float _659;
    if (!_635)
    {
        float _643 = in.m_57.x;
        float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _647 = _643 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _651 = _649 * _645;
        float _653 = floor(_651);
        float _655 = -_653;
        float _657 = _651 + _655;
        _659 = _657;
        _661 = true;
    }
    else
    {
        float _663 = float(_89);
        float _665 = 1.0 / _663;
        float _667 = _123 * _665;
        _659 = _667;
    }
    _661 = false;
    float _669 = _659;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _673 = _669 + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _677 = _669 + _675;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _681 = _669 + _679;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _699 = 1.0 / _685;
    bool _701 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _703 = isnan(_669);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = 1.0 / _689;
    bool _715 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _717 = 1.0 / _693;
    float _719 = _673 * _699;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _723 = _669 + _721;
    bool _725 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _727 = isnan(_669);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = 1.0 / _697;
    float _739 = _677 * _713;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _741;
    float _745 = fma(_743, _719, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _747 = _681 * _717;
    bool _749 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _751 = isnan(_669);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _761;
    bool _765 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _767 = isnan(_669);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = fma(_763, _719, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _779 = -_759;
    float _781 = _779 + 1.0;
    float _783 = _723 * _737;
    float _785 = -_735;
    float _787 = _785 + 1.0;
    float _789 = _711 * _781;
    float _791 = -_711;
    float _793 = _791 + 1.0;
    float _795 = _775 * _787;
    float _797 = -_775;
    float _799 = _797 + 1.0;
    bool _801 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _803 = isnan(_669);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = _759 * _799;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _819 = _811 * _793;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _825 = -_811;
    float _827 = _825 + 1.0;
    float _829 = fma(_817, _739, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _831 = _745 * _819;
    float _833 = _777 * _819;
    float _835 = fma(_823, _739, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _837;
    float _841 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[143].x, _831);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _843;
    float _847 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[143].y, _833);
    float _849 = fma(_839, _747, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _855 = fma(_845, _747, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _861 = fma(_835, _789, _841);
    float _863 = fma(_829, _789, _847);
    float _865 = fma(_853, _783, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _867 = fma(_859, _783, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _869 = fma(_849, _813, _861);
    float _871 = fma(_855, _813, _863);
    float _873 = fma(_865, _795, _869);
    float _875 = fma(_867, _795, _871);
    float _877 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[147].x, _873);
    float _879 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[147].y, _875);
    bool _881 = !_715;
    float _899;
    if (!_881)
    {
        float _883 = in.m_57.x;
        float _885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _887 = _883 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _889 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _891 = _889 * _885;
        float _893 = floor(_891);
        float _895 = -_893;
        float _897 = _891 + _895;
        _899 = _897;
        _901 = true;
    }
    else
    {
        float _903 = float(_89);
        float _905 = 1.0 / _903;
        float _907 = _123 * _905;
        _899 = _907;
    }
    _901 = false;
    float _909 = _899;
    float _911 = _627 * _627;
    float _913 = as_type<float>(int(gl_VertexIndex));
    float _915 = fma(_629, _629, _911);
    float _917 = in.m_51.w;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _923 = fma(_631, _631, _915);
    float _925 = in.m_55.x;
    float _927 = in.m_55.y;
    float _929 = 1.0 / _921;
    float _931 = rsqrt(_923);
    int _933 = as_type<int>(_913) & 1;
    bool _935 = _933 != 0;
    int _937 = as_type<int>(_913) & 2;
    bool _939 = _937 != 0;
    float _941 = _445 * _365;
    float _943 = fma(_443, _375, _941);
    float _945 = _877 * _925;
    float _947 = _931 * _631;
    float _949 = _931 * _629;
    float _951 = _931 * _627;
    float _953 = fma(_447, _385, _943);
    float _955 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _957 = _947 * _955;
    float _959 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _961 = _949 * _959;
    float _963 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _965 = _951 * _963;
    float _967 = _945 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _971 = -_957;
    float _973 = fma(_949, _969, _971);
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _977 = -_961;
    float _979 = fma(_951, _975, _977);
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _983 = -_965;
    float _985 = fma(_947, _981, _983);
    float _987 = _879 * _927;
    float _989 = _973 * _973;
    float _991 = in.m_53.w;
    float _993 = _953 + _917;
    float _995 = _987 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _997 = fma(_985, _985, _989);
    float _999 = fma(_979, _979, _997);
    bool _1001 = !_939;
    float _1003 = _1001 ? (-0.5) : 0.5;
    float _1005 = rsqrt(_999);
    bool _1007 = !_935;
    float _1009 = _1007 ? (-0.5) : 0.5;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1013 = _1011 != 0;
    float _1015 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1003);
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1009);
    float _1019 = _995 * _1015;
    float _1021 = _967 * _1017;
    float _1023 = in.m_57.x;
    float _1025 = in.m_57.y;
    float _1027 = _445 * _369;
    float _1029 = _1019 * _947;
    float _1031 = _1019 * _949;
    float _1033 = _445 * _353;
    float _1035 = _973 * _1005;
    float _1037 = fma(_443, _379, _1027);
    float _1039 = _985 * _1005;
    float _1041 = _979 * _1005;
    float _1043 = _949 * _1035;
    float _1045 = fma(_447, _389, _1037);
    float _1047 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1049 = _951 * _1041;
    float _1051 = fma(_1021, _1041, _1029);
    float _1053 = -_1043;
    float _1055 = fma(_951, _1039, _1053);
    float _1057 = fma(_1021, _1039, _1031);
    float _1059 = -_1049;
    float _1061 = fma(_947, _1035, _1059);
    float _1063 = _1045 + _991;
    float _1065 = fma(_1047, _1055, _1051);
    float _1067 = _1019 * _951;
    float _1069 = fma(_1047, _1061, _1057);
    float _1071 = in.m_49.w;
    float _1073 = _1063 + _1065;
    float _1075 = fma(_443, _373, _1033);
    float _1077 = _993 + _1069;
    bool _1079 = _1023 > 0.5;
    float _1081 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1083 = _1073 + _1081;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1085;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1091 = _1077 + _1089;
    float _1093 = fma(_447, _381, _1075);
    float _1095 = _1083 * _1083;
    float _1097 = _1087 * _929;
    bool _1099 = _1025 > 0.5;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1103 = _909 + _1101;
    float _1105 = fma(_1091, _1091, _1095);
    bool _1107 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1109 = isnan(_909);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    float _1119 = _947 * _1039;
    bool _1121 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1123 = isnan(_909);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1129 = _1125 || _1127;
    float _1131 = float(_1129);
    float _1133 = sqrt(_1105);
    float _1135 = fma(_1097, _1103, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1137 = -_1117;
    float _1139 = _1137 + 1.0;
    float _1141 = -_1009;
    int _1143 = _1079 ? as_type<int>(_1141) : as_type<int>(_1009);
    float _1145 = -_1119;
    float _1147 = fma(_949, _1041, _1145);
    float _1149 = -_1003;
    int _1151 = _1099 ? as_type<int>(_1149) : as_type<int>(_1003);
    float _1153 = _1131 * _1139;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1157 = _1155 != 0;
    float _1159 = _1093 + _1071;
    float _1161 = fma(_1021, _1035, _1067);
    float _1163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1165 = _1135 * _1153;
    float _1167 = -_1131;
    float _1169 = _1167 + 1.0;
    bool _1171 = !_1157;
    float _1173 = _1171 ? _1003 : as_type<float>(_1151);
    float _1175 = fma(_1047, _1147, _1161);
    bool _1177 = !_1013;
    float _1179 = _1177 ? _1009 : as_type<float>(_1143);
    float _1181 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1165);
    bool _1183 = _1133 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1187 = -_1173;
    float _1189 = _1187 + 0.5;
    float _1191 = _1159 + _1175;
    float _1193 = _1179 + 0.5;
    float _1195 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1181);
    float _1197 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1199 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1201 = _1189;
    float _1203 = _1077;
    float _1205 = _1073;
    float _1207 = _923;
    if (!_1183)
    {
        _1201 = _1077;
    }
    float _1209 = _1201;
    float _1211 = _1209;
    if (!_1183)
    {
        _1203 = _1191;
    }
    float _1213 = _1203;
    bool _1215 = !_1183;
    float _1217 = _1213;
    if (!_1215)
    {
        float _1219 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1221 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1223 = _1133 + _1221;
        float _1225 = _1191 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1227 = rsqrt(_1105);
        float _1229 = _1223 * _1219;
        float _1231 = _1229 * 0.15915493667125701904296875;
        float _1233 = _1231 * 6.283185482025146484375;
        float _1235 = cos(_1233);
        float _1237 = _1231 * 6.283185482025146484375;
        float _1239 = sin(_1237);
        float _1241 = _1235 + (-1.0);
        float _1243 = fma(_1239, _1225, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1245 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1247 = _1227 * _1243;
        float _1249 = fma(_1191, _1235, _1245);
        float _1251 = fma(_1091, _1247, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1253 = fma(_1083, _1247, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1217 = _1249;
        _1211 = _1251;
        _1205 = _1253;
    }
    float _1255 = _1217;
    float _1257 = _1211;
    float _1259 = _1205;
    float _1261 = -_1159;
    float _1263 = _1261 + _1255;
    float _1265 = _1197 * _1185;
    float _1267 = -_993;
    float _1269 = _1267 + _1257;
    float _1271 = -_1063;
    float _1273 = _1271 + _1259;
    float _1275 = _1263 * _1263;
    float _1277 = _1199 * _1163;
    float _1279 = fma(_1269, _1269, _1275);
    float _1281 = fma(_1273, _1273, _1279);
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1285 = sqrt(_1281);
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1303 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1305 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1309 = _1195 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _1277;
    out.m_62.y = _1265;
    bool _1311 = _1285 > 0.0;
    out.m_64.x = _1301;
    out.m_64.y = _1303;
    out.m_64.z = _1305;
    out.m_66.x = _1297;
    out.m_66.y = _1299;
    out.m_66.z = _1307;
    out.m_66.w = _1309;
    bool _1313 = !_1311;
    float _1315 = _1309;
    float _1317 = _1299;
    float _1319 = _1301;
    float _1321 = _1301;
    float _1323 = _1257;
    float _1325 = _1255;
    float _1327 = _1259;
    float _1329 = _1301;
    if (!_1313)
    {
        bool _1331 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1333 = _1303;
        if (_1331)
        {
            float _1335 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1333 = _1335;
        }
        float _1337 = _1333;
        float _1339 = _1337;
        if (_1331)
        {
            float _1341 = _1337 * _629;
            _1315 = _1341;
        }
        float _1343 = _1315;
        float _1345 = _1343;
        if (_1331)
        {
            float _1347 = _1337 * _627;
            _1317 = _1347;
        }
        float _1349 = _1317;
        float _1351 = _1349;
        if (_1331)
        {
            float _1353 = _1337 * _631;
            _1339 = _1353;
        }
        float _1355 = _1339;
        float _1357 = _1355;
        if (!_1331)
        {
            float _1359 = _123 + 1.0;
            float _1361 = _1359;
            if (!_163)
            {
                float _1363 = _1359 * _1359;
                float _1365 = _1363 * 0.5;
                _1319 = _1365;
            }
            float _1367 = _1319;
            float _1369 = _1367;
            if (!_163)
            {
                float _1371 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1369 = _1371;
            }
            float _1373 = _1369;
            bool _1375 = !_163;
            float _1377 = _1373;
            if (!_1375)
            {
                float _1379 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1381 = log2(_1379);
                float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1385 = _1383 + 1.0;
                float _1387 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1389 = _1381 * _1359;
                float _1391 = 1.0 / _1385;
                float _1393 = _1387 * 0.693147182464599609375;
                float _1395 = exp2(_1389);
                float _1397 = 1.0 / _1393;
                float _1399 = _1395 + (-1.0);
                float _1401 = -_1399;
                float _1403 = fma(_1401, _1397, _1359);
                float _1405 = _1403 * _1391;
                float _1407 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1377 = _1407;
            }
            float _1409 = _1377;
            float _1411 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1413 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1415 = !_163;
            _1321 = _1409;
            if (!_1415)
            {
                float _1417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1419 = log2(_1417);
                float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1423 = _1421 + 1.0;
                float _1425 = 1.0 / _1423;
                float _1427 = _1419 * _1359;
                float _1429 = exp2(_1427);
                float _1431 = -_1429;
                float _1433 = _1431 + 1.0;
                float _1435 = _1433 * _1425;
                _1361 = _1435;
            }
            float _1437 = _1361;
            float _1439 = fma(_1437, _149, _1413);
            float _1441 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1443 = fma(_1437, _147, _1411);
            float _1445 = -_341;
            float _1447 = _1445 + _1439;
            float _1449 = fma(_1437, _151, _1441);
            float _1451 = -_345;
            float _1453 = _1451 + _1443;
            float _1455 = _1447 * _353;
            float _1457 = -_347;
            float _1459 = _1457 + _1449;
            float _1461 = _1447 * _365;
            float _1463 = _1447 * _369;
            float _1465 = fma(_1453, _373, _1455);
            float _1467 = fma(_1453, _375, _1461);
            float _1469 = fma(_1453, _379, _1463);
            float _1471 = fma(_1459, _381, _1465);
            float _1473 = fma(_1459, _385, _1467);
            float _1475 = fma(_1459, _389, _1469);
            float _1477 = _1471 * _1471;
            float _1479 = fma(_1473, _1473, _1477);
            float _1481 = fma(_1475, _1475, _1479);
            _1207 = _1481;
            _637 = _1471;
            _639 = _1473;
            _641 = _1475;
            _1345 = _1473;
            _1351 = _1471;
            _1357 = _1475;
        }
        float _1483 = _1207;
        float _1485 = _637;
        float _1487 = _639;
        float _1489 = _641;
        float _1491 = _1345;
        float _1493 = _1351;
        float _1495 = _1357;
        float _1497 = _1321;
        float _1499 = sqrt(_1483);
        float _1501 = rsqrt(_1281);
        bool _1503 = _1499 > 0.0;
        float _1505 = _1269 * _1501;
        float _1507 = _1263 * _1501;
        float _1509 = _1273 * _1501;
        bool _1511 = !_1503;
        _1329 = _1497;
        if (!_1511)
        {
            float _1513 = rsqrt(_1483);
            float _1515 = _1513 * _1485;
            float _1517 = _1513 * _1487;
            float _1519 = _1507 * _1515;
            float _1521 = _1513 * _1489;
            float _1523 = fma(_1505, _1517, _1519);
            float _1525 = fma(_1509, _1521, _1523);
            float _1527 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1529 = fma(_1491, _1527, _1257);
            float _1531 = fma(_1493, _1527, _1255);
            float _1533 = fma(_1495, _1527, _1259);
            _1323 = _1529;
            _1325 = _1531;
            _1327 = _1533;
        }
    }
    float _1535 = _1323;
    float _1537 = _1325;
    float _1539 = _1327;
    float _1541 = _1329;
    float _1543 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1545 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1547 = isnan(0.5);
    bool _1549 = _1545 || _1547;
    bool _1551 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1553 = _1549 || _1551;
    bool _1555 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1557 = isnan(0.5);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1563 = _1559 || _1561;
    float _1565 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1543);
    float _1567 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1569 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1565);
    float _1571 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1567);
    float _1573 = _1569 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1575 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1571);
    float _1577 = _1567;
    float _1579 = _1537;
    float _1581 = _1539;
    float _1583 = _1541;
    if (_1553)
    {
        _1577 = _1535;
    }
    float _1585 = _1577;
    float _1587 = 1.0 / _1573;
    float _1589 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1591 = _1589 + _1573;
    float _1593 = _1585;
    if (!_1553)
    {
        float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1597 = _1159 + _1595;
        float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1601 = _993 + _1599;
        float _1603 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1605 = -_1159;
        float _1607 = _1605 + _1537;
        float _1609 = _1597 * _1597;
        float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1613 = _1063 + _1611;
        float _1615 = fma(_1601, _1601, _1609);
        float _1617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1619 = fma(_1613, _1613, _1615);
        float _1621 = sqrt(_1619);
        float _1623 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1625 = precise::min(_1621, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1627 = _1625 * _1617;
        float _1629 = -_993;
        float _1631 = _1629 + _1535;
        float _1633 = _1623 * _1627;
        float _1635 = -_1063;
        float _1637 = _1635 + _1539;
        float _1639 = fma(_1631, _1633, _993);
        float _1641 = fma(_1607, _1633, _1159);
        float _1643 = fma(_1637, _1633, _1063);
        _1579 = _1641;
        _1593 = _1639;
        _1581 = _1643;
    }
    float _1645 = _1579;
    float _1647 = _1593;
    float _1649 = _1581;
    if (_1563)
    {
        _1583 = 1.0;
    }
    float _1651 = _1583;
    float _1653 = _1591 * _1587;
    float _1655 = _1653 * 0.5;
    float _1657 = _1651;
    if (!_1563)
    {
        float _1659 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1661 = _1659 * 0.15915493667125701904296875;
        float _1663 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1665 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1667 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1665);
        float _1669 = _1661 * 6.283185482025146484375;
        float _1671 = cos(_1669);
        float _1673 = _1663 * 0.15915493667125701904296875;
        float _1675 = _1661 * 6.283185482025146484375;
        float _1677 = sin(_1675);
        float _1679 = 1.0 / _1671;
        float _1681 = _1673 * 6.283185482025146484375;
        float _1683 = cos(_1681);
        float _1685 = _1677 * _1679;
        float _1687 = _1673 * 6.283185482025146484375;
        float _1689 = sin(_1687);
        float _1691 = _1683 * _1685;
        float _1693 = 1.0 / _1667;
        float _1695 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1697 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1695;
        float _1699 = 1.0 / _1691;
        float _1701 = 1.0 / _1697;
        float _1703 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1705 = _1693 * _1703;
        float _1707 = _1689 * _1699;
        float _1709 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1711 = fma(_1707, _1705, _1709);
        float _1713 = _1711 * _1701;
        float _1715 = precise::clamp(_1713, 0.0, 1.0);
        _1657 = _1715;
    }
    float _1717 = _1657;
    float _1719 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1721 = _1645 + _1719;
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1725 = _1647 + _1723;
    float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1729 = _1649 + _1727;
    float _1731 = _1721 * _1721;
    float _1733 = fma(_1725, _1725, _1731);
    float _1735 = fma(_1729, _1729, _1733);
    float _1737 = rsqrt(_1735);
    float _1739 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1741 = _1725 * _1739;
    float _1743 = _1729 * _1739;
    float _1745 = _1741 * _1741;
    float _1747 = _1743 * _1743;
    float _1749 = _1745 + _1747;
    float _1751 = sqrt(_1749);
    bool _1753 = _1751 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1755 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1757 = _1751 + _1755;
    float _1759 = _1655;
    float _1761 = _1749;
    float _1763 = _1757;
    float _1765 = _1721;
    float _1767 = _1741;
    if (_1753)
    {
        float _1769 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1759 = _1769;
    }
    float _1771 = _1759;
    if (_1753)
    {
        float _1773 = rsqrt(_1749);
        _1761 = _1773;
    }
    float _1775 = _1761;
    float _1777 = _1771;
    if (_1753)
    {
        float _1779 = _1757 * _1771;
        _1763 = _1779;
    }
    float _1781 = _1763;
    if (_1753)
    {
        float _1783 = _1781 * 0.15915493667125701904296875;
        _1777 = _1783;
    }
    float _1785 = _1777;
    float _1787 = _1729;
    float _1789 = _1785;
    if (_1753)
    {
        float _1791 = _1785 * 6.283185482025146484375;
        float _1793 = sin(_1791);
        _1787 = _1793;
    }
    float _1795 = _1787;
    float _1797 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1799 = precise::max(0.0, _1797);
    float _1801 = _1737;
    float _1803 = _1799;
    if (_1753)
    {
        float _1805 = _1785 * 6.283185482025146484375;
        float _1807 = cos(_1805);
        _1801 = _1807;
    }
    float _1809 = _1801;
    float _1811 = -_1739;
    float _1813 = -_1799;
    float _1815 = fma(_1721, _1811, _1813);
    if (_1753)
    {
        float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1765 = _1817;
    }
    float _1819 = _1765;
    float _1821 = _1819;
    float _1823 = _1795;
    if (_1753)
    {
        float _1825 = fma(_1795, _1819, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1821 = _1825;
    }
    float _1827 = _1821;
    float _1829 = _1827;
    if (!_1753)
    {
        _1823 = _1815;
    }
    float _1831 = _1823;
    float _1833 = _1831;
    float _1835 = _1809;
    if (_1753)
    {
        float _1837 = _1809 + (-1.0);
        _1803 = _1837;
    }
    float _1839 = _1803;
    float _1841 = _1839;
    if (_1753)
    {
        float _1843 = _1775 * _1827;
        _439 = _1843;
    }
    float _1845 = _439;
    if (!_1753)
    {
        _1829 = _1745;
    }
    float _1847 = _1829;
    float _1849 = sqrt(_1735);
    float _1851 = _1847;
    if (_1753)
    {
        float _1853 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1789 = _1853;
    }
    float _1855 = _1789;
    if (_1753)
    {
        float _1857 = _1741 * _1845;
        _1767 = _1857;
    }
    float _1859 = _1767;
    if (!_1753)
    {
        _1841 = _1743;
    }
    float _1861 = _1841;
    float _1863 = _1861;
    if (_1753)
    {
        float _1865 = _1743 * _1845;
        _1863 = _1865;
    }
    float _1867 = _1863;
    if (_1753)
    {
        float _1869 = fma(_1815, _1809, _1855);
        _1833 = _1869;
    }
    float _1871 = _1833;
    if (_1753)
    {
        float _1873 = _1859 * _1859;
        _1851 = _1873;
    }
    float _1875 = _1851;
    if (!_1753)
    {
        _1835 = _1747;
    }
    float _1877 = _1835;
    float _1879 = _1877;
    if (_1753)
    {
        float _1881 = _1867 * _1867;
        _1879 = _1881;
    }
    float _1883 = _1879;
    float _1885 = fma(_1871, _1871, _1875);
    float _1887 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1889 = _1885 + _1883;
    float _1891 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1895 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1893);
    float _1897 = precise::clamp(_1895, 0.0, 1.0);
    float _1899 = rsqrt(_1889);
    float _1901 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1891);
    float _1903 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1905 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1907 = -_1897;
    float _1909 = _1907 + 1.0;
    float _1911 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1901);
    float _1913 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1915 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1903);
    float _1917 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1887);
    float _1919 = _1911 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1921 = abs(_1909);
    float _1923 = log2(_1921);
    float _1925 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1913);
    float _1927 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1915);
    float _1929 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1931 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1925);
    float _1933 = _1927 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1935 = _1899 * _1859;
    float _1937 = -_1929;
    float _1939 = fma(_1937, _1905, 1.0);
    float _1941 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1943 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1917);
    float _1945 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1947 = _1899 * _1871;
    float _1949 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1951 = _1899 * _1867;
    float _1953 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1945);
    float _1955 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1957 = -_1949;
    float _1959 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1957);
    float _1961 = _1943 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1963 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1953);
    float _1965 = exp2(_1955);
    float _1967 = -_1951;
    float _1969 = fma(_1967, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1959);
    float _1971 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1973 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1963);
    float _1975 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1977 = fma(_1969, -0.5, 0.5);
    float _1979 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1971);
    float _1981 = fma(_1969, 0.5, 0.5);
    float _1983 = log2(_1939);
    float _1985 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1975);
    float _1987 = _1947 + 1.0;
    float _1989 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1979);
    float _1991 = fma(_1981, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1993 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1985);
    float _1995 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1989);
    float _1997 = 1.0 / _1973;
    float _1999 = -_1947;
    float _2001 = fma(_1965, _1987, _1999);
    float _2003 = fma(_1981, _1991, -0.212114393711090087890625);
    float _2005 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1993);
    float _2007 = fma(_1981, _2003, 1.570728778839111328125);
    float _2009 = sqrt(_1977);
    float _2011 = _1983 * 0.693147182464599609375;
    float _2013 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2015 = _1995 * _1997;
    float _2017 = _2005 * _1997;
    float _2019 = fma(_2015, 0.5, 0.5);
    float _2021 = fma(_2017, -0.5, 0.5);
    float _2023 = fma(_2001, 0.5, 0.5);
    float _2025 = _2009 * 0.636619746685028076171875;
    float3 _5195 = float3(_2019, _2021, _2013);
    float _2027 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5195, float3(0.0), isnan(_5195)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5195, float3(0.0), isnan(_5195)), level(0.0)).x;
    float3 _5206 = float3(_2019, _2021, _2013);
    float4 _2030 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5206, float3(0.0), isnan(_5206)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5206, float3(0.0), isnan(_5206)), level(0.0)).xyzw;
    float _2032 = _2030.x;
    float _2034 = _2030.y;
    float _2036 = _2030.z;
    float _2038 = _2030.w;
    float _2040 = -_2007;
    float _2042 = fma(_2025, _2040, 1.0);
    float2 _5228 = float2(_2042, _2023);
    float3 _2046 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5228, float2(0.0), isnan(_5228)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5228, float2(0.0), isnan(_5228)), level(0.0)).xyz;
    float _2048 = _2046.x;
    float _2050 = _2046.y;
    float _2052 = _2046.z;
    float _2054 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2056 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2058 = _1973 * 0.5;
    bool _2060 = _1717 > 0.0;
    bool _2062 = isnan(_1717);
    bool _2064 = _2060 || _2062;
    bool _2066 = isnan(0.0);
    bool _2068 = _2064 || _2066;
    float _2070 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2072 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2056);
    float _2074 = exp2(_2054);
    float _2076 = _1995 + _1973;
    float _2078 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2072);
    float _2080 = _2076 * 0.5;
    float _2082 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2078);
    float _2084 = fma(_2005, -0.5, _2058);
    float _2086 = _2082 + _1973;
    out.gl_Position.x = _1995;
    out.gl_Position.y = _2005;
    out.gl_Position.z = _2082;
    out.gl_Position.w = _1973;
    float _2088 = _2086 * 0.5;
    float _2090 = -_2074;
    float _2092 = _2090 + 1.0;
    float _2094 = _2070 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2096 = _2092 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2080;
    out.m_68.y = _2084;
    out.m_68.z = _2088;
    out.m_68.w = _1973;
    float _2098 = -_2096;
    float _2100 = _2098 + 1.0;
    out.m_45.x = _2094;
    float _2102 = _2096 * _2027;
    float _2104 = _2038 * _2100;
    float _2106 = _2038 * _2102;
    float _2108 = _2052 * _2102;
    float _2110 = fma(_2048, _2106, _2032);
    float _2112 = fma(_2050, _2106, _2034);
    float _2114 = fma(_2038, _2108, _2036);
    out.m_70.x = _2110;
    out.m_70.y = _2112;
    out.m_70.z = _2114;
    out.m_70.w = _2104;
    if (_2068)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2116 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2116;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _901 = false;
    bool _661 = false;
    bool _497 = false;
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
        float _2173 = as_type<float>(_105);
        out.gl_Position.z = _2173;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = 0.0;
    if (_119)
    {
        float _129 = float(_89);
        _99 = _129;
    }
    float _131 = _99;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _107 = as_type<int>(_143);
    }
    int _145 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2242 = as_type<float>(_145);
        out.gl_Position.z = _2242;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = in.m_47.x;
    float _149 = in.m_47.y;
    float _151 = in.m_47.z;
    float _153 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _153;
    if (!_163)
    {
        float _167 = _153 * _153;
        float _169 = _167 * 0.5;
        _125 = _169;
    }
    float _171 = _125;
    float _173 = 0.0;
    float _175 = _171;
    if (!_163)
    {
        float _177 = _123 * _123;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    if (!_163)
    {
        float _183 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _183;
    }
    float _185 = _175;
    bool _187 = !_163;
    float _189 = _185;
    if (!_187)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _153 * _193;
        float _203 = 1.0 / _197;
        float _205 = _199 * 0.693147182464599609375;
        float _207 = exp2(_201);
        float _209 = 1.0 / _205;
        float _211 = _207 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _209, _153);
        float _217 = _215 * _203;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _219;
        _127 = _209;
    }
    float _221 = _189;
    float _223 = _127;
    bool _225 = !_163;
    float _227 = _223;
    float _229 = _221;
    if (!_225)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _153 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _165 = _249;
        _227 = _237;
    }
    float _251 = _165;
    float _253 = _227;
    float _255 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = _253;
    if (!_163)
    {
        _261 = _123;
    }
    float _263 = _261;
    float _265 = fma(_251, _147, _255);
    float _267 = _263;
    if (!_163)
    {
        float _269 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _269;
    }
    float _271 = _229;
    bool _273 = !_163;
    float _275 = _271;
    if (!_273)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = _123 * _279;
        float _289 = 1.0 / _283;
        float _291 = _285 * 0.693147182464599609375;
        float _293 = exp2(_287);
        float _295 = 1.0 / _291;
        float _297 = _293 + (-1.0);
        float _299 = -_297;
        float _301 = fma(_299, _295, _123);
        float _303 = _301 * _289;
        float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _305;
    }
    float _307 = _275;
    bool _309 = !_163;
    if (!_309)
    {
        float _311 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = log2(_311);
        float _315 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _317 = _315 + 1.0;
        float _319 = 1.0 / _317;
        float _321 = _123 * _313;
        float _323 = exp2(_321);
        float _325 = -_323;
        float _327 = _325 + 1.0;
        float _329 = _327 * _319;
        _267 = _329;
    }
    float _331 = _267;
    float _333 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _335 = fma(_251, _149, _257);
    float _337 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = fma(_331, _149, _333);
    float _343 = fma(_251, _151, _259);
    float _345 = fma(_331, _147, _337);
    float _347 = fma(_331, _151, _339);
    float _349 = -_341;
    float _351 = _335 + _349;
    float _353 = in.m_49.y;
    float _355 = -_345;
    float _357 = _265 + _355;
    float _359 = -_347;
    float _361 = _343 + _359;
    float _363 = _351 * _351;
    float _365 = in.m_51.y;
    float _367 = fma(_357, _357, _363);
    float _369 = in.m_53.y;
    float _371 = fma(_361, _361, _367);
    float _373 = in.m_49.x;
    float _375 = in.m_51.x;
    float _377 = sqrt(_371);
    float _379 = in.m_53.x;
    float _381 = in.m_49.z;
    float _383 = _351 * _353;
    float _385 = in.m_51.z;
    float _387 = _351 * _365;
    float _389 = in.m_53.z;
    bool _391 = _377 >= 9.9999999747524270787835121154785e-07;
    bool _393 = isnan(_377);
    bool _395 = _391 || _393;
    bool _397 = isnan(9.9999999747524270787835121154785e-07);
    bool _399 = _395 || _397;
    float _401 = _351 * _369;
    float _403 = _353 * _353;
    float _405 = in.m_55.w;
    float _407 = fma(_357, _373, _383);
    float _409 = fma(_365, _365, _403);
    float _411 = in.m_42.x;
    float _413 = in.m_42.y;
    float _415 = in.m_42.z;
    float _417 = fma(_357, _375, _387);
    float _419 = fma(_369, _369, _409);
    float _421 = fma(_357, _379, _401);
    float _423 = fma(_361, _381, _407);
    float _425 = fma(_361, _385, _417);
    float _427 = fma(_361, _389, _421);
    float _429 = _421;
    float _431 = _405;
    float _433 = _343;
    float _435 = _423;
    float _437 = _423;
    float _439 = _345;
    if (_399)
    {
        _429 = _425;
    }
    float _441 = _429;
    float _443 = fma(_265, _405, _411);
    float _445 = fma(_335, _405, _413);
    float _447 = fma(_343, _405, _415);
    float _449 = _441;
    float _451 = _441;
    if (_399)
    {
        _431 = _427;
    }
    float _453 = _431;
    float _455 = _453;
    float _457 = _453;
    if (!_399)
    {
        bool _459 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _461 = !_459;
        if (!_461)
        {
            float _463 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _465 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _467 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _469 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[16].x, _463);
            float _471 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[16].x, _465);
            float _473 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[16].x, _467);
            float _475 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[16].z, _469);
            float _477 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[16].z, _471);
            float _479 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[16].z, _473);
            float _481 = _475 * _475;
            float _483 = fma(_477, _477, _481);
            float _485 = fma(_479, _479, _483);
            float _487 = rsqrt(_485);
            float _489 = _487 * 9.9999999747524270787835121154785e-07;
            float _491 = _477 * _489;
            float _493 = _475 * _489;
            float _495 = _479 * _489;
            _437 = _493;
            _451 = _491;
            _457 = _495;
            _497 = true;
        }
        else
        {
            float _499 = _149 * _149;
            float _501 = fma(_147, _147, _499);
            float _503 = fma(_151, _151, _501);
            float _505 = sqrt(_503);
            bool _507 = _505 >= 9.9999999747524270787835121154785e-07;
            bool _509 = isnan(_505);
            bool _511 = _507 || _509;
            bool _513 = isnan(9.9999999747524270787835121154785e-07);
            bool _515 = _511 || _513;
            if (!_515)
            {
                float _517 = _413 * _413;
                float _519 = fma(_411, _411, _517);
                float _521 = fma(_415, _415, _519);
                float _523 = sqrt(_521);
                bool _525 = _523 >= 9.9999999747524270787835121154785e-07;
                bool _527 = isnan(_523);
                bool _529 = _525 || _527;
                bool _531 = isnan(9.9999999747524270787835121154785e-07);
                bool _533 = _529 || _531;
                float _535 = _419;
                if (!_533)
                {
                    float _537 = rsqrt(_419);
                    _535 = _537;
                }
                float _539 = _535;
                if (!_533)
                {
                    float _541 = _539 * 9.9999999747524270787835121154785e-07;
                    _433 = _541;
                }
                float _543 = _433;
                if (!_533)
                {
                    float _545 = _365 * _543;
                    _449 = _545;
                }
                float _547 = _449;
                _451 = _547;
                if (!_533)
                {
                    float _549 = _353 * _543;
                    _435 = _549;
                }
                float _551 = _435;
                _437 = _551;
                if (!_533)
                {
                    float _553 = _369 * _543;
                    _455 = _553;
                }
                float _555 = _455;
                bool _557 = !_533;
                _457 = _555;
                _497 = _557;
                if (!_497)
                {
                    float _559 = _353 * _413;
                    float _561 = _365 * _413;
                    float _563 = _369 * _413;
                    float _565 = fma(_411, _373, _559);
                    float _567 = fma(_411, _375, _561);
                    float _569 = fma(_411, _379, _563);
                    float _571 = fma(_415, _381, _565);
                    float _573 = fma(_415, _385, _567);
                    float _575 = fma(_415, _389, _569);
                    float _577 = _571 * _571;
                    float _579 = fma(_573, _573, _577);
                    float _581 = fma(_575, _575, _579);
                    float _583 = rsqrt(_581);
                    float _585 = _583 * 9.9999999747524270787835121154785e-07;
                    float _587 = _573 * _585;
                    float _589 = _571 * _585;
                    float _591 = _575 * _585;
                    _437 = _589;
                    _451 = _587;
                    _457 = _591;
                    _497 = true;
                }
            }
            else
            {
                float _593 = _353 * _149;
                float _595 = _365 * _149;
                float _597 = _369 * _149;
                float _599 = fma(_147, _373, _593);
                float _601 = fma(_147, _375, _595);
                float _603 = fma(_147, _379, _597);
                float _605 = fma(_151, _381, _599);
                float _607 = fma(_151, _385, _601);
                float _609 = fma(_151, _389, _603);
                float _611 = _605 * _605;
                float _613 = fma(_607, _607, _611);
                float _615 = fma(_609, _609, _613);
                float _617 = rsqrt(_615);
                float _619 = _617 * 9.9999999747524270787835121154785e-07;
                float _621 = _607 * _619;
                float _623 = _605 * _619;
                float _625 = _609 * _619;
                _437 = _623;
                _451 = _621;
                _457 = _625;
            }
        }
    }
    _497 = false;
    float _627 = _437;
    float _629 = _451;
    float _631 = _457;
    bool _633 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _635 = !_633;
    float _637 = _627;
    float _639 = _629;
    float _641 = _631;
    float _659;
    if (!_635)
    {
        float _643 = in.m_57.x;
        float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _647 = _643 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _651 = _649 * _645;
        float _653 = floor(_651);
        float _655 = -_653;
        float _657 = _651 + _655;
        _659 = _657;
        _661 = true;
    }
    else
    {
        float _663 = float(_89);
        float _665 = 1.0 / _663;
        float _667 = _123 * _665;
        _659 = _667;
    }
    _661 = false;
    float _669 = _659;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _673 = _669 + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _677 = _669 + _675;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _681 = _669 + _679;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _699 = 1.0 / _685;
    bool _701 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _703 = isnan(_669);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = 1.0 / _689;
    bool _715 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _717 = 1.0 / _693;
    float _719 = _673 * _699;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _723 = _669 + _721;
    bool _725 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _727 = isnan(_669);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = 1.0 / _697;
    float _739 = _677 * _713;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _741;
    float _745 = fma(_743, _719, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _747 = _681 * _717;
    bool _749 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _751 = isnan(_669);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _761;
    bool _765 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _767 = isnan(_669);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = fma(_763, _719, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _779 = -_759;
    float _781 = _779 + 1.0;
    float _783 = _723 * _737;
    float _785 = -_735;
    float _787 = _785 + 1.0;
    float _789 = _711 * _781;
    float _791 = -_711;
    float _793 = _791 + 1.0;
    float _795 = _775 * _787;
    float _797 = -_775;
    float _799 = _797 + 1.0;
    bool _801 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _803 = isnan(_669);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = _759 * _799;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _819 = _811 * _793;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _825 = -_811;
    float _827 = _825 + 1.0;
    float _829 = fma(_817, _739, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _831 = _745 * _819;
    float _833 = _777 * _819;
    float _835 = fma(_823, _739, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _837;
    float _841 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[143].x, _831);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _843;
    float _847 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[143].y, _833);
    float _849 = fma(_839, _747, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _855 = fma(_845, _747, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _861 = fma(_835, _789, _841);
    float _863 = fma(_829, _789, _847);
    float _865 = fma(_853, _783, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _867 = fma(_859, _783, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _869 = fma(_849, _813, _861);
    float _871 = fma(_855, _813, _863);
    float _873 = fma(_865, _795, _869);
    float _875 = fma(_867, _795, _871);
    float _877 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[147].x, _873);
    float _879 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[147].y, _875);
    bool _881 = !_715;
    float _899;
    if (!_881)
    {
        float _883 = in.m_57.x;
        float _885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _887 = _883 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _889 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _891 = _889 * _885;
        float _893 = floor(_891);
        float _895 = -_893;
        float _897 = _891 + _895;
        _899 = _897;
        _901 = true;
    }
    else
    {
        float _903 = float(_89);
        float _905 = 1.0 / _903;
        float _907 = _123 * _905;
        _899 = _907;
    }
    _901 = false;
    float _909 = _899;
    float _911 = _627 * _627;
    float _913 = as_type<float>(int(gl_VertexIndex));
    float _915 = fma(_629, _629, _911);
    float _917 = in.m_51.w;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _923 = fma(_631, _631, _915);
    float _925 = in.m_55.x;
    float _927 = in.m_55.y;
    float _929 = 1.0 / _921;
    float _931 = rsqrt(_923);
    int _933 = as_type<int>(_913) & 1;
    bool _935 = _933 != 0;
    int _937 = as_type<int>(_913) & 2;
    bool _939 = _937 != 0;
    float _941 = _445 * _365;
    float _943 = fma(_443, _375, _941);
    float _945 = _877 * _925;
    float _947 = _931 * _631;
    float _949 = _931 * _629;
    float _951 = _931 * _627;
    float _953 = fma(_447, _385, _943);
    float _955 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _957 = _947 * _955;
    float _959 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _961 = _949 * _959;
    float _963 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _965 = _951 * _963;
    float _967 = _945 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _971 = -_957;
    float _973 = fma(_949, _969, _971);
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _977 = -_961;
    float _979 = fma(_951, _975, _977);
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _983 = -_965;
    float _985 = fma(_947, _981, _983);
    float _987 = _879 * _927;
    float _989 = _973 * _973;
    float _991 = in.m_53.w;
    float _993 = _953 + _917;
    float _995 = _987 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _997 = fma(_985, _985, _989);
    float _999 = fma(_979, _979, _997);
    bool _1001 = !_939;
    float _1003 = _1001 ? (-0.5) : 0.5;
    float _1005 = rsqrt(_999);
    bool _1007 = !_935;
    float _1009 = _1007 ? (-0.5) : 0.5;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1013 = _1011 != 0;
    float _1015 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1003);
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1009);
    float _1019 = _995 * _1015;
    float _1021 = _967 * _1017;
    float _1023 = in.m_57.x;
    float _1025 = in.m_57.y;
    float _1027 = _445 * _369;
    float _1029 = _1019 * _947;
    float _1031 = _1019 * _949;
    float _1033 = _445 * _353;
    float _1035 = _973 * _1005;
    float _1037 = fma(_443, _379, _1027);
    float _1039 = _985 * _1005;
    float _1041 = _979 * _1005;
    float _1043 = _949 * _1035;
    float _1045 = fma(_447, _389, _1037);
    float _1047 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1049 = _951 * _1041;
    float _1051 = fma(_1021, _1041, _1029);
    float _1053 = -_1043;
    float _1055 = fma(_951, _1039, _1053);
    float _1057 = fma(_1021, _1039, _1031);
    float _1059 = -_1049;
    float _1061 = fma(_947, _1035, _1059);
    float _1063 = _1045 + _991;
    float _1065 = fma(_1047, _1055, _1051);
    float _1067 = _1019 * _951;
    float _1069 = fma(_1047, _1061, _1057);
    float _1071 = in.m_49.w;
    float _1073 = _1063 + _1065;
    float _1075 = fma(_443, _373, _1033);
    float _1077 = _993 + _1069;
    bool _1079 = _1023 > 0.5;
    float _1081 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1083 = _1073 + _1081;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1085;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1091 = _1077 + _1089;
    float _1093 = fma(_447, _381, _1075);
    float _1095 = _1083 * _1083;
    float _1097 = _1087 * _929;
    bool _1099 = _1025 > 0.5;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1103 = _909 + _1101;
    float _1105 = fma(_1091, _1091, _1095);
    bool _1107 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1109 = isnan(_909);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    float _1119 = _947 * _1039;
    bool _1121 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1123 = isnan(_909);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1129 = _1125 || _1127;
    float _1131 = float(_1129);
    float _1133 = sqrt(_1105);
    float _1135 = fma(_1097, _1103, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1137 = -_1117;
    float _1139 = _1137 + 1.0;
    float _1141 = -_1009;
    int _1143 = _1079 ? as_type<int>(_1141) : as_type<int>(_1009);
    float _1145 = -_1119;
    float _1147 = fma(_949, _1041, _1145);
    float _1149 = -_1003;
    int _1151 = _1099 ? as_type<int>(_1149) : as_type<int>(_1003);
    float _1153 = _1131 * _1139;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1157 = _1155 != 0;
    float _1159 = _1093 + _1071;
    float _1161 = fma(_1021, _1035, _1067);
    float _1163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1165 = _1135 * _1153;
    float _1167 = -_1131;
    float _1169 = _1167 + 1.0;
    bool _1171 = !_1157;
    float _1173 = _1171 ? _1003 : as_type<float>(_1151);
    float _1175 = fma(_1047, _1147, _1161);
    bool _1177 = !_1013;
    float _1179 = _1177 ? _1009 : as_type<float>(_1143);
    float _1181 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1165);
    bool _1183 = _1133 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1187 = -_1173;
    float _1189 = _1187 + 0.5;
    float _1191 = _1159 + _1175;
    float _1193 = _1179 + 0.5;
    float _1195 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1181);
    float _1197 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1199 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1201 = _1189;
    float _1203 = _1077;
    float _1205 = _1073;
    float _1207 = _923;
    if (!_1183)
    {
        _1201 = _1077;
    }
    float _1209 = _1201;
    float _1211 = _1209;
    if (!_1183)
    {
        _1203 = _1191;
    }
    float _1213 = _1203;
    bool _1215 = !_1183;
    float _1217 = _1213;
    if (!_1215)
    {
        float _1219 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1221 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1223 = _1133 + _1221;
        float _1225 = _1191 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1227 = rsqrt(_1105);
        float _1229 = _1223 * _1219;
        float _1231 = _1229 * 0.15915493667125701904296875;
        float _1233 = _1231 * 6.283185482025146484375;
        float _1235 = cos(_1233);
        float _1237 = _1231 * 6.283185482025146484375;
        float _1239 = sin(_1237);
        float _1241 = _1235 + (-1.0);
        float _1243 = fma(_1239, _1225, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1245 = _1241 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1247 = _1227 * _1243;
        float _1249 = fma(_1191, _1235, _1245);
        float _1251 = fma(_1091, _1247, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1253 = fma(_1083, _1247, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1217 = _1249;
        _1211 = _1251;
        _1205 = _1253;
    }
    float _1255 = _1217;
    float _1257 = _1211;
    float _1259 = _1205;
    float _1261 = -_1159;
    float _1263 = _1261 + _1255;
    float _1265 = _1197 * _1185;
    float _1267 = -_993;
    float _1269 = _1267 + _1257;
    float _1271 = -_1063;
    float _1273 = _1271 + _1259;
    float _1275 = _1263 * _1263;
    float _1277 = _1199 * _1163;
    float _1279 = fma(_1269, _1269, _1275);
    float _1281 = fma(_1273, _1273, _1279);
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1285 = sqrt(_1281);
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1291 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1303 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1305 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1309 = _1195 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _1277;
    out.m_62.y = _1265;
    bool _1311 = _1285 > 0.0;
    out.m_64.x = _1301;
    out.m_64.y = _1303;
    out.m_64.z = _1305;
    out.m_66.x = _1297;
    out.m_66.y = _1299;
    out.m_66.z = _1307;
    out.m_66.w = _1309;
    bool _1313 = !_1311;
    float _1315 = _1309;
    float _1317 = _1299;
    float _1319 = _1301;
    float _1321 = _1301;
    float _1323 = _1257;
    float _1325 = _1255;
    float _1327 = _1259;
    float _1329 = _1301;
    if (!_1313)
    {
        bool _1331 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1333 = _1303;
        if (_1331)
        {
            float _1335 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1333 = _1335;
        }
        float _1337 = _1333;
        float _1339 = _1337;
        if (_1331)
        {
            float _1341 = _1337 * _629;
            _1315 = _1341;
        }
        float _1343 = _1315;
        float _1345 = _1343;
        if (_1331)
        {
            float _1347 = _1337 * _627;
            _1317 = _1347;
        }
        float _1349 = _1317;
        float _1351 = _1349;
        if (_1331)
        {
            float _1353 = _1337 * _631;
            _1339 = _1353;
        }
        float _1355 = _1339;
        float _1357 = _1355;
        if (!_1331)
        {
            float _1359 = _123 + 1.0;
            float _1361 = _1359;
            if (!_163)
            {
                float _1363 = _1359 * _1359;
                float _1365 = _1363 * 0.5;
                _1319 = _1365;
            }
            float _1367 = _1319;
            float _1369 = _1367;
            if (!_163)
            {
                float _1371 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1369 = _1371;
            }
            float _1373 = _1369;
            bool _1375 = !_163;
            float _1377 = _1373;
            if (!_1375)
            {
                float _1379 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1381 = log2(_1379);
                float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1385 = _1383 + 1.0;
                float _1387 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1389 = _1381 * _1359;
                float _1391 = 1.0 / _1385;
                float _1393 = _1387 * 0.693147182464599609375;
                float _1395 = exp2(_1389);
                float _1397 = 1.0 / _1393;
                float _1399 = _1395 + (-1.0);
                float _1401 = -_1399;
                float _1403 = fma(_1401, _1397, _1359);
                float _1405 = _1403 * _1391;
                float _1407 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1377 = _1407;
            }
            float _1409 = _1377;
            float _1411 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1413 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1415 = !_163;
            _1321 = _1409;
            if (!_1415)
            {
                float _1417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1419 = log2(_1417);
                float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1423 = _1421 + 1.0;
                float _1425 = 1.0 / _1423;
                float _1427 = _1419 * _1359;
                float _1429 = exp2(_1427);
                float _1431 = -_1429;
                float _1433 = _1431 + 1.0;
                float _1435 = _1433 * _1425;
                _1361 = _1435;
            }
            float _1437 = _1361;
            float _1439 = fma(_1437, _149, _1413);
            float _1441 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1443 = fma(_1437, _147, _1411);
            float _1445 = -_341;
            float _1447 = _1445 + _1439;
            float _1449 = fma(_1437, _151, _1441);
            float _1451 = -_345;
            float _1453 = _1451 + _1443;
            float _1455 = _1447 * _353;
            float _1457 = -_347;
            float _1459 = _1457 + _1449;
            float _1461 = _1447 * _365;
            float _1463 = _1447 * _369;
            float _1465 = fma(_1453, _373, _1455);
            float _1467 = fma(_1453, _375, _1461);
            float _1469 = fma(_1453, _379, _1463);
            float _1471 = fma(_1459, _381, _1465);
            float _1473 = fma(_1459, _385, _1467);
            float _1475 = fma(_1459, _389, _1469);
            float _1477 = _1471 * _1471;
            float _1479 = fma(_1473, _1473, _1477);
            float _1481 = fma(_1475, _1475, _1479);
            _1207 = _1481;
            _637 = _1471;
            _639 = _1473;
            _641 = _1475;
            _1345 = _1473;
            _1351 = _1471;
            _1357 = _1475;
        }
        float _1483 = _1207;
        float _1485 = _637;
        float _1487 = _639;
        float _1489 = _641;
        float _1491 = _1345;
        float _1493 = _1351;
        float _1495 = _1357;
        float _1497 = _1321;
        float _1499 = sqrt(_1483);
        float _1501 = rsqrt(_1281);
        bool _1503 = _1499 > 0.0;
        float _1505 = _1269 * _1501;
        float _1507 = _1263 * _1501;
        float _1509 = _1273 * _1501;
        bool _1511 = !_1503;
        _1329 = _1497;
        if (!_1511)
        {
            float _1513 = rsqrt(_1483);
            float _1515 = _1513 * _1485;
            float _1517 = _1513 * _1487;
            float _1519 = _1507 * _1515;
            float _1521 = _1513 * _1489;
            float _1523 = fma(_1505, _1517, _1519);
            float _1525 = fma(_1509, _1521, _1523);
            float _1527 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1529 = fma(_1491, _1527, _1257);
            float _1531 = fma(_1493, _1527, _1255);
            float _1533 = fma(_1495, _1527, _1259);
            _1323 = _1529;
            _1325 = _1531;
            _1327 = _1533;
        }
    }
    float _1535 = _1323;
    float _1537 = _1325;
    float _1539 = _1327;
    float _1541 = _1329;
    float _1543 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1545 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1547 = isnan(0.5);
    bool _1549 = _1545 || _1547;
    bool _1551 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1553 = _1549 || _1551;
    bool _1555 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1557 = isnan(0.5);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1563 = _1559 || _1561;
    float _1565 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1543);
    float _1567 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1569 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1565);
    float _1571 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1567);
    float _1573 = _1569 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1575 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1571);
    float _1577 = _1567;
    float _1579 = _1537;
    float _1581 = _1539;
    float _1583 = _1541;
    if (_1553)
    {
        _1577 = _1535;
    }
    float _1585 = _1577;
    float _1587 = 1.0 / _1573;
    float _1589 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1591 = _1589 + _1573;
    float _1593 = _1585;
    if (!_1553)
    {
        float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1597 = _1159 + _1595;
        float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1601 = _993 + _1599;
        float _1603 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1605 = -_1159;
        float _1607 = _1605 + _1537;
        float _1609 = _1597 * _1597;
        float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1613 = _1063 + _1611;
        float _1615 = fma(_1601, _1601, _1609);
        float _1617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1619 = fma(_1613, _1613, _1615);
        float _1621 = sqrt(_1619);
        float _1623 = _1603 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1625 = precise::min(_1621, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1627 = _1625 * _1617;
        float _1629 = -_993;
        float _1631 = _1629 + _1535;
        float _1633 = _1623 * _1627;
        float _1635 = -_1063;
        float _1637 = _1635 + _1539;
        float _1639 = fma(_1631, _1633, _993);
        float _1641 = fma(_1607, _1633, _1159);
        float _1643 = fma(_1637, _1633, _1063);
        _1579 = _1641;
        _1593 = _1639;
        _1581 = _1643;
    }
    float _1645 = _1579;
    float _1647 = _1593;
    float _1649 = _1581;
    if (_1563)
    {
        _1583 = 1.0;
    }
    float _1651 = _1583;
    float _1653 = _1591 * _1587;
    float _1655 = _1653 * 0.5;
    float _1657 = _1651;
    if (!_1563)
    {
        float _1659 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1661 = _1659 * 0.15915493667125701904296875;
        float _1663 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1665 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1667 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1665);
        float _1669 = _1661 * 6.283185482025146484375;
        float _1671 = cos(_1669);
        float _1673 = _1663 * 0.15915493667125701904296875;
        float _1675 = _1661 * 6.283185482025146484375;
        float _1677 = sin(_1675);
        float _1679 = 1.0 / _1671;
        float _1681 = _1673 * 6.283185482025146484375;
        float _1683 = cos(_1681);
        float _1685 = _1677 * _1679;
        float _1687 = _1673 * 6.283185482025146484375;
        float _1689 = sin(_1687);
        float _1691 = _1683 * _1685;
        float _1693 = 1.0 / _1667;
        float _1695 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1697 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1695;
        float _1699 = 1.0 / _1691;
        float _1701 = 1.0 / _1697;
        float _1703 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1705 = _1693 * _1703;
        float _1707 = _1689 * _1699;
        float _1709 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1711 = fma(_1707, _1705, _1709);
        float _1713 = _1711 * _1701;
        float _1715 = precise::clamp(_1713, 0.0, 1.0);
        _1657 = _1715;
    }
    float _1717 = _1657;
    float _1719 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1721 = _1645 + _1719;
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1725 = _1647 + _1723;
    float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1729 = _1649 + _1727;
    float _1731 = _1721 * _1721;
    float _1733 = fma(_1725, _1725, _1731);
    float _1735 = fma(_1729, _1729, _1733);
    float _1737 = rsqrt(_1735);
    float _1739 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1741 = _1725 * _1739;
    float _1743 = _1729 * _1739;
    float _1745 = _1741 * _1741;
    float _1747 = _1743 * _1743;
    float _1749 = _1745 + _1747;
    float _1751 = sqrt(_1749);
    bool _1753 = _1751 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1755 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1757 = _1751 + _1755;
    float _1759 = _1655;
    float _1761 = _1749;
    float _1763 = _1757;
    float _1765 = _1721;
    float _1767 = _1741;
    if (_1753)
    {
        float _1769 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1759 = _1769;
    }
    float _1771 = _1759;
    if (_1753)
    {
        float _1773 = rsqrt(_1749);
        _1761 = _1773;
    }
    float _1775 = _1761;
    float _1777 = _1771;
    if (_1753)
    {
        float _1779 = _1757 * _1771;
        _1763 = _1779;
    }
    float _1781 = _1763;
    if (_1753)
    {
        float _1783 = _1781 * 0.15915493667125701904296875;
        _1777 = _1783;
    }
    float _1785 = _1777;
    float _1787 = _1729;
    float _1789 = _1785;
    if (_1753)
    {
        float _1791 = _1785 * 6.283185482025146484375;
        float _1793 = sin(_1791);
        _1787 = _1793;
    }
    float _1795 = _1787;
    float _1797 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1799 = precise::max(0.0, _1797);
    float _1801 = _1737;
    float _1803 = _1799;
    if (_1753)
    {
        float _1805 = _1785 * 6.283185482025146484375;
        float _1807 = cos(_1805);
        _1801 = _1807;
    }
    float _1809 = _1801;
    float _1811 = -_1739;
    float _1813 = -_1799;
    float _1815 = fma(_1721, _1811, _1813);
    if (_1753)
    {
        float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1765 = _1817;
    }
    float _1819 = _1765;
    float _1821 = _1819;
    float _1823 = _1795;
    if (_1753)
    {
        float _1825 = fma(_1795, _1819, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1821 = _1825;
    }
    float _1827 = _1821;
    float _1829 = _1827;
    if (!_1753)
    {
        _1823 = _1815;
    }
    float _1831 = _1823;
    float _1833 = _1831;
    float _1835 = _1809;
    if (_1753)
    {
        float _1837 = _1809 + (-1.0);
        _1803 = _1837;
    }
    float _1839 = _1803;
    float _1841 = _1839;
    if (_1753)
    {
        float _1843 = _1775 * _1827;
        _439 = _1843;
    }
    float _1845 = _439;
    if (!_1753)
    {
        _1829 = _1745;
    }
    float _1847 = _1829;
    float _1849 = sqrt(_1735);
    float _1851 = _1847;
    if (_1753)
    {
        float _1853 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1789 = _1853;
    }
    float _1855 = _1789;
    if (_1753)
    {
        float _1857 = _1741 * _1845;
        _1767 = _1857;
    }
    float _1859 = _1767;
    if (!_1753)
    {
        _1841 = _1743;
    }
    float _1861 = _1841;
    float _1863 = _1861;
    if (_1753)
    {
        float _1865 = _1743 * _1845;
        _1863 = _1865;
    }
    float _1867 = _1863;
    if (_1753)
    {
        float _1869 = fma(_1815, _1809, _1855);
        _1833 = _1869;
    }
    float _1871 = _1833;
    if (_1753)
    {
        float _1873 = _1859 * _1859;
        _1851 = _1873;
    }
    float _1875 = _1851;
    if (!_1753)
    {
        _1835 = _1747;
    }
    float _1877 = _1835;
    float _1879 = _1877;
    if (_1753)
    {
        float _1881 = _1867 * _1867;
        _1879 = _1881;
    }
    float _1883 = _1879;
    float _1885 = fma(_1871, _1871, _1875);
    float _1887 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1889 = _1885 + _1883;
    float _1891 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1895 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1893);
    float _1897 = precise::clamp(_1895, 0.0, 1.0);
    float _1899 = rsqrt(_1889);
    float _1901 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1891);
    float _1903 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1905 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1907 = -_1897;
    float _1909 = _1907 + 1.0;
    float _1911 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1901);
    float _1913 = _1645 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1915 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1903);
    float _1917 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1887);
    float _1919 = _1911 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1921 = abs(_1909);
    float _1923 = log2(_1921);
    float _1925 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1913);
    float _1927 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1915);
    float _1929 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1931 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1925);
    float _1933 = _1927 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1935 = _1899 * _1859;
    float _1937 = -_1929;
    float _1939 = fma(_1937, _1905, 1.0);
    float _1941 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1943 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1917);
    float _1945 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1947 = _1899 * _1871;
    float _1949 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1951 = _1899 * _1867;
    float _1953 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1945);
    float _1955 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1957 = -_1949;
    float _1959 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1957);
    float _1961 = _1943 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1963 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1953);
    float _1965 = exp2(_1955);
    float _1967 = -_1951;
    float _1969 = fma(_1967, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1959);
    float _1971 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1973 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1963);
    float _1975 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1977 = fma(_1969, -0.5, 0.5);
    float _1979 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1971);
    float _1981 = fma(_1969, 0.5, 0.5);
    float _1983 = log2(_1939);
    float _1985 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1975);
    float _1987 = _1947 + 1.0;
    float _1989 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1979);
    float _1991 = fma(_1981, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1993 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1985);
    float _1995 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1989);
    float _1997 = 1.0 / _1973;
    float _1999 = -_1947;
    float _2001 = fma(_1965, _1987, _1999);
    float _2003 = fma(_1981, _1991, -0.212114393711090087890625);
    float _2005 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1993);
    float _2007 = fma(_1981, _2003, 1.570728778839111328125);
    float _2009 = sqrt(_1977);
    float _2011 = _1983 * 0.693147182464599609375;
    float _2013 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2015 = _1995 * _1997;
    float _2017 = _2005 * _1997;
    float _2019 = fma(_2015, 0.5, 0.5);
    float _2021 = fma(_2017, -0.5, 0.5);
    float _2023 = fma(_2001, 0.5, 0.5);
    float _2025 = _2009 * 0.636619746685028076171875;
    float3 _5195 = float3(_2019, _2021, _2013);
    float _2027 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5195, float3(0.0), isnan(_5195)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5195, float3(0.0), isnan(_5195)), level(0.0)).x;
    float3 _5206 = float3(_2019, _2021, _2013);
    float4 _2030 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5206, float3(0.0), isnan(_5206)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5206, float3(0.0), isnan(_5206)), level(0.0)).xyzw;
    float _2032 = _2030.x;
    float _2034 = _2030.y;
    float _2036 = _2030.z;
    float _2038 = _2030.w;
    float _2040 = -_2007;
    float _2042 = fma(_2025, _2040, 1.0);
    float2 _5228 = float2(_2042, _2023);
    float3 _2046 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5228, float2(0.0), isnan(_5228)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5228, float2(0.0), isnan(_5228)), level(0.0)).xyz;
    float _2048 = _2046.x;
    float _2050 = _2046.y;
    float _2052 = _2046.z;
    float _2054 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2056 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2058 = _1973 * 0.5;
    bool _2060 = _1717 > 0.0;
    bool _2062 = isnan(_1717);
    bool _2064 = _2060 || _2062;
    bool _2066 = isnan(0.0);
    bool _2068 = _2064 || _2066;
    float _2070 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2072 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2056);
    float _2074 = exp2(_2054);
    float _2076 = _1995 + _1973;
    float _2078 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2072);
    float _2080 = _2076 * 0.5;
    float _2082 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2078);
    float _2084 = fma(_2005, -0.5, _2058);
    float _2086 = _2082 + _1973;
    out.gl_Position.x = _1995;
    out.gl_Position.y = _2005;
    out.gl_Position.z = _2082;
    out.gl_Position.w = _1973;
    float _2088 = _2086 * 0.5;
    float _2090 = -_2074;
    float _2092 = _2090 + 1.0;
    float _2094 = _2070 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2096 = _2092 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2080;
    out.m_68.y = _2084;
    out.m_68.z = _2088;
    out.m_68.w = _1973;
    float _2098 = -_2096;
    float _2100 = _2098 + 1.0;
    out.m_45.x = _2094;
    float _2102 = _2096 * _2027;
    float _2104 = _2038 * _2100;
    float _2106 = _2038 * _2102;
    float _2108 = _2052 * _2102;
    float _2110 = fma(_2048, _2106, _2032);
    float _2112 = fma(_2050, _2106, _2034);
    float _2114 = fma(_2038, _2108, _2036);
    out.m_70.x = _2110;
    out.m_70.y = _2112;
    out.m_70.z = _2114;
    out.m_70.w = _2104;
    if (_2068)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2116 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2116;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

