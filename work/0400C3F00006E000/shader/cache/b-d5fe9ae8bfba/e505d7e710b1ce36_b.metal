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
    texture2d<float> vp_t_tcb_10 [[id(5)]];
    sampler vp_t_tcb_10Smplr [[id(6)]];
    sampler vp_t_tcb_10Smplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_52 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_70 [[user(locn3)]];
    float4 m_38 [[user(locn4)]];
    float4 m_58 [[user(locn5)]];
    float4 m_64 [[user(locn6)]];
    float4 m_66 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_35 [[attribute(5)]];
    float4 m_40 [[attribute(6)]];
    float4 m_60 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
    float4 m_50 [[attribute(9)]];
    float4 m_48 [[attribute(10)]];
    float4 m_56 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _971 = false;
    bool _829 = false;
    bool _649 = false;
    bool _489 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_35.w;
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
        out.m_38.x = 0.0;
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
        float _2342 = as_type<float>(_105);
        out.gl_Position.z = _2342;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_40.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    float _141 = _139;
    if (_135)
    {
        out.m_38.x = 0.0;
    }
    if (_135)
    {
        float _143 = _139 * 5.0;
        _107 = as_type<int>(_143);
    }
    int _145 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2412 = as_type<float>(_145);
        out.gl_Position.z = _2412;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = in.m_40.x;
    float _149 = in.m_40.y;
    float _151 = in.m_40.z;
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
    float _191 = 0.0;
    if (!_187)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _153 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _153);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _221;
        _191 = _209;
        _141 = _211;
    }
    float _223 = _189;
    float _225 = _191;
    float _227 = _141;
    bool _229 = !_163;
    float _231 = _227;
    float _233 = _225;
    if (!_229)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _153 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _231 = _241;
        _165 = _253;
    }
    float _255 = _231;
    float _257 = _165;
    float _259 = _255;
    if (!_163)
    {
        _259 = _123;
    }
    float _261 = _259;
    float _263 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _265 = _261;
    if (!_163)
    {
        float _267 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _267;
    }
    float _269 = _233;
    bool _271 = !_163;
    float _273 = _269;
    if (!_271)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = _123 * _277;
        float _287 = 1.0 / _281;
        float _289 = _283 * 0.693147182464599609375;
        float _291 = exp2(_285);
        float _293 = 1.0 / _289;
        float _295 = _291 + (-1.0);
        float _297 = -_295;
        float _299 = fma(_297, _293, _123);
        float _301 = _299 * _287;
        float _303 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _273 = _303;
    }
    float _305 = _273;
    bool _307 = !_163;
    if (!_307)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = 1.0 / _315;
        float _319 = _123 * _311;
        float _321 = exp2(_319);
        float _323 = -_321;
        float _325 = _323 + 1.0;
        float _327 = _325 * _317;
        _265 = _327;
    }
    float _329 = _265;
    float _331 = fma(_257, _147, _263);
    float _333 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _335 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = fma(_257, _149, _333);
    float _343 = fma(_329, _149, _335);
    float _345 = fma(_329, _147, _337);
    float _347 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = fma(_329, _151, _339);
    float _351 = -_343;
    float _353 = _341 + _351;
    float _355 = -_345;
    float _357 = _331 + _355;
    float _359 = fma(_257, _151, _347);
    float _361 = in.m_42.y;
    float _363 = _353 * _353;
    float _365 = -_349;
    float _367 = _359 + _365;
    float _369 = in.m_44.y;
    float _371 = fma(_357, _357, _363);
    float _373 = in.m_46.y;
    float _375 = fma(_367, _367, _371);
    float _377 = in.m_44.x;
    float _379 = sqrt(_375);
    float _381 = in.m_42.x;
    float _383 = in.m_46.x;
    float _385 = in.m_44.z;
    float _387 = _353 * _361;
    float _389 = in.m_42.z;
    float _391 = _353 * _369;
    bool _393 = _379 >= 9.9999999747524270787835121154785e-07;
    bool _395 = isnan(_379);
    bool _397 = _393 || _395;
    bool _399 = isnan(9.9999999747524270787835121154785e-07);
    bool _401 = _397 || _399;
    float _403 = in.m_46.z;
    float _405 = _353 * _373;
    float _407 = _361 * _361;
    float _409 = in.m_48.w;
    float _411 = fma(_357, _377, _391);
    float _413 = fma(_369, _369, _407);
    float _415 = in.m_35.x;
    float _417 = in.m_35.y;
    float _419 = in.m_35.z;
    float _421 = fma(_357, _381, _387);
    float _423 = fma(_373, _373, _413);
    float _425 = fma(_357, _383, _405);
    float _427 = fma(_367, _385, _411);
    float _429 = fma(_367, _389, _421);
    float _431 = fma(_367, _403, _425);
    float _433 = fma(_331, _409, _415);
    float _435 = fma(_341, _409, _417);
    float _437 = fma(_359, _409, _419);
    float _439 = _427;
    float _441 = _429;
    float _443 = _431;
    float _445 = _429;
    float _447 = _427;
    float _449 = _431;
    if (!_401)
    {
        bool _451 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _453 = !_451;
        if (!_453)
        {
            float _455 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _457 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _459 = _373 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _461 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[16].x, _455);
            float _463 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[16].x, _457);
            float _465 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[16].x, _459);
            float _467 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[16].z, _461);
            float _469 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[16].z, _463);
            float _471 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[16].z, _465);
            float _473 = _467 * _467;
            float _475 = fma(_469, _469, _473);
            float _477 = fma(_471, _471, _475);
            float _479 = rsqrt(_477);
            float _481 = _479 * 9.9999999747524270787835121154785e-07;
            float _483 = _469 * _481;
            float _485 = _467 * _481;
            float _487 = _471 * _481;
            _445 = _485;
            _447 = _483;
            _449 = _487;
            _489 = true;
        }
        else
        {
            float _491 = _149 * _149;
            float _493 = fma(_147, _147, _491);
            float _495 = fma(_151, _151, _493);
            float _497 = sqrt(_495);
            bool _499 = _497 >= 9.9999999747524270787835121154785e-07;
            bool _501 = isnan(_497);
            bool _503 = _499 || _501;
            bool _505 = isnan(9.9999999747524270787835121154785e-07);
            bool _507 = _503 || _505;
            float _509 = _497;
            if (!_507)
            {
                float _511 = _417 * _417;
                float _513 = fma(_415, _415, _511);
                float _515 = fma(_419, _419, _513);
                float _517 = sqrt(_515);
                bool _519 = _517 >= 9.9999999747524270787835121154785e-07;
                bool _521 = isnan(_517);
                bool _523 = _519 || _521;
                bool _525 = isnan(9.9999999747524270787835121154785e-07);
                bool _527 = _523 || _525;
                float _529 = _423;
                if (!_527)
                {
                    float _531 = rsqrt(_423);
                    _529 = _531;
                }
                float _533 = _529;
                if (!_527)
                {
                    float _535 = _533 * 9.9999999747524270787835121154785e-07;
                    _509 = _535;
                }
                float _537 = _509;
                if (!_527)
                {
                    float _539 = _369 * _537;
                    _439 = _539;
                }
                float _541 = _439;
                _447 = _541;
                if (!_527)
                {
                    float _543 = _361 * _537;
                    _441 = _543;
                }
                float _545 = _441;
                _445 = _545;
                if (!_527)
                {
                    float _547 = _373 * _537;
                    _443 = _547;
                }
                float _549 = _443;
                bool _551 = !_527;
                _449 = _549;
                _489 = _551;
                if (!_489)
                {
                    float _553 = _361 * _417;
                    float _555 = _369 * _417;
                    float _557 = _373 * _417;
                    float _559 = fma(_415, _381, _553);
                    float _561 = fma(_415, _377, _555);
                    float _563 = fma(_415, _383, _557);
                    float _565 = fma(_419, _389, _559);
                    float _567 = fma(_419, _385, _561);
                    float _569 = fma(_419, _403, _563);
                    float _571 = _565 * _565;
                    float _573 = fma(_567, _567, _571);
                    float _575 = fma(_569, _569, _573);
                    float _577 = rsqrt(_575);
                    float _579 = _577 * 9.9999999747524270787835121154785e-07;
                    float _581 = _567 * _579;
                    float _583 = _565 * _579;
                    float _585 = _569 * _579;
                    _445 = _583;
                    _447 = _581;
                    _449 = _585;
                    _489 = true;
                }
            }
            else
            {
                float _587 = _361 * _149;
                float _589 = _369 * _149;
                float _591 = _373 * _149;
                float _593 = fma(_147, _381, _587);
                float _595 = fma(_147, _377, _589);
                float _597 = fma(_147, _383, _591);
                float _599 = fma(_151, _389, _593);
                float _601 = fma(_151, _385, _595);
                float _603 = fma(_151, _403, _597);
                float _605 = _599 * _599;
                float _607 = fma(_601, _601, _605);
                float _609 = fma(_603, _603, _607);
                float _611 = rsqrt(_609);
                float _613 = _611 * 9.9999999747524270787835121154785e-07;
                float _615 = _601 * _613;
                float _617 = _599 * _613;
                float _619 = _603 * _613;
                _445 = _617;
                _447 = _615;
                _449 = _619;
            }
        }
    }
    _489 = false;
    float _621 = _445;
    float _623 = _447;
    float _625 = _449;
    bool _627 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _629 = !_627;
    float _647;
    if (!_629)
    {
        float _631 = in.m_50.x;
        float _633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _635 = _631 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _637 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _639 = _637 * _633;
        float _641 = floor(_639);
        float _643 = -_641;
        float _645 = _639 + _643;
        _647 = _645;
        _649 = true;
    }
    else
    {
        float _651 = float(_89);
        float _653 = 1.0 / _651;
        float _655 = _123 * _653;
        _647 = _655;
    }
    _649 = false;
    float _657 = _647;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _661 = _657 + _659;
    bool _663 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _665 = isnan(_657);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _677 = _657 + _675;
    bool _679 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _681 = isnan(_657);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _699 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _701 = isnan(_657);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = -_673;
    float _713 = _711 + 1.0;
    float _715 = 1.0 / _697;
    float _717 = _709 * _713;
    float _719 = -_709;
    float _721 = _719 + 1.0;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _723;
    bool _727 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _729 = 1.0 / _693;
    float _731 = _689 * _721;
    float _733 = -_689;
    float _735 = _733 + 1.0;
    float _737 = _677 * _715;
    float _739 = _661 * _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _741;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _745;
    float _749 = fma(_725, _739, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _751 = fma(_743, _739, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _753 = fma(_747, _739, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _755 = in.m_48.x;
    float _757 = in.m_48.y;
    float _759 = in.m_48.z;
    float _761 = _749 * _731;
    float _763 = _751 * _731;
    float _765 = _753 * _731;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _779 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[143].x, _761);
    float _781 = fma(_769, _737, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _783 = fma(_773, _737, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _785 = fma(_777, _737, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _787 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[143].y, _763);
    float _789 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[143].z, _765);
    float _791 = fma(_781, _717, _779);
    float _793 = fma(_783, _717, _787);
    float _795 = fma(_785, _717, _789);
    float _797 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[145].x, _791);
    float _799 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[145].y, _793);
    float _801 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[145].z, _795);
    float _803 = _797 * _755;
    float _805 = _799 * _757;
    float _807 = _801 * _759;
    bool _809 = !_727;
    float _827;
    if (!_809)
    {
        float _811 = in.m_50.x;
        float _813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _815 = _811 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _817 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _819 = _817 * _813;
        float _821 = floor(_819);
        float _823 = -_821;
        float _825 = _819 + _823;
        _827 = _825;
        _829 = true;
    }
    else
    {
        float _831 = float(_89);
        float _833 = 1.0 / _831;
        float _835 = _123 * _833;
        _827 = _835;
    }
    _829 = false;
    float _837 = _827;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _841 = _837 + _839;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _847 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _849 = isnan(_837);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _863 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _865 = isnan(_837);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _875;
    bool _879 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _881 = isnan(_837);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = 1.0 / _845;
    float _893 = -_857;
    float _895 = _893 + 1.0;
    bool _897 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _899 = _873 * _895;
    float _901 = -_873;
    float _903 = _901 + 1.0;
    float _905 = 1.0 / _861;
    float _907 = _877 * _891;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _913 = fma(_907, _841, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _915 = _911 * _905;
    float _917 = _913 * _899;
    float _919 = -_889;
    float _921 = _919 + 1.0;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _925 = _837 + _923;
    float _927 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[115].x, _917);
    float _929 = _857 * _921;
    float _931 = fma(_915, _925, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _935 = fma(_931, _929, _927);
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _941 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[117].x, _935);
    float _943 = _933 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = _937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _947 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _949 = _941 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_52.x = _943;
    out.m_52.y = _945;
    out.m_52.z = _947;
    out.m_52.w = _949;
    bool _951 = !_897;
    float _969;
    if (!_951)
    {
        float _953 = in.m_50.x;
        float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _957 = _953 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _961 = _959 * _955;
        float _963 = floor(_961);
        float _965 = -_963;
        float _967 = _961 + _965;
        _969 = _967;
        _971 = true;
    }
    else
    {
        float _973 = float(_89);
        float _975 = 1.0 / _973;
        float _977 = _123 * _975;
        _969 = _977;
    }
    _971 = false;
    float _979 = _969;
    float _981 = _621 * _621;
    float _983 = _435 * _373;
    float _985 = in.m_46.w;
    float _987 = _805 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _989 = fma(_623, _623, _981);
    float _991 = fma(_433, _383, _983);
    float _993 = in.m_44.w;
    float _995 = fma(_625, _625, _989);
    float _997 = _803 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _999 = _807 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1001 = fma(_437, _403, _991);
    float _1003 = rsqrt(_995);
    float _1005 = _1001 + _985;
    float _1007 = _1003 * _625;
    float _1009 = _1003 * _623;
    float _1011 = _1003 * _621;
    float _1013 = _435 * _369;
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1017 = _1007 * _1015;
    float _1019 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1021 = _1009 * _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1025 = _1011 * _1023;
    float _1027 = fma(_433, _377, _1013);
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1031 = -_1017;
    float _1033 = fma(_1009, _1029, _1031);
    float _1035 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1037 = -_1021;
    float _1039 = fma(_1011, _1035, _1037);
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1043 = -_1025;
    float _1045 = fma(_1007, _1041, _1043);
    float _1047 = in.m_54.x;
    float _1049 = in.m_54.y;
    float _1051 = in.m_54.z;
    float _1053 = _1033 * _1033;
    float _1055 = fma(_437, _385, _1027);
    float _1057 = _435 * _361;
    float _1059 = fma(_1045, _1045, _1053);
    float _1061 = _1055 + _993;
    float _1063 = fma(_433, _381, _1057);
    float _1065 = fma(_1039, _1039, _1059);
    float _1067 = fma(_437, _389, _1063);
    float _1069 = rsqrt(_1065);
    float _1071 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1049);
    float _1073 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1047);
    float _1075 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1051);
    float _1077 = _987 * _1071;
    float _1079 = _997 * _1073;
    float _1081 = _999 * _1075;
    float _1083 = _1033 * _1069;
    float _1085 = _1077 * _1007;
    float _1087 = _1039 * _1069;
    float _1089 = _1045 * _1069;
    float _1091 = _1009 * _1083;
    float _1093 = _1077 * _1009;
    float _1095 = fma(_1079, _1087, _1085);
    float _1097 = _1011 * _1087;
    float _1099 = -_1091;
    float _1101 = fma(_1011, _1089, _1099);
    float _1103 = fma(_1079, _1089, _1093);
    float _1105 = in.m_42.w;
    float _1107 = -_1097;
    float _1109 = fma(_1007, _1083, _1107);
    float _1111 = fma(_1081, _1101, _1095);
    float _1113 = _1077 * _1011;
    float _1115 = _1007 * _1089;
    float _1117 = fma(_1081, _1109, _1103);
    float _1119 = _1005 + _1111;
    float _1121 = fma(_1079, _1083, _1113);
    float _1123 = -_1115;
    float _1125 = fma(_1009, _1087, _1123);
    float _1127 = _1061 + _1117;
    float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1131 = _1119 + _1129;
    float _1133 = fma(_1081, _1125, _1121);
    float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1137 = _1127 + _1135;
    float _1139 = _1131 * _1131;
    float _1141 = fma(_1137, _1137, _1139);
    float _1143 = sqrt(_1141);
    float _1145 = _1067 + _1105;
    float _1147 = _1145 + _1133;
    bool _1149 = _1143 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1151 = 0.0;
    float _1153 = _1127;
    float _1155 = _1119;
    float _1157 = 0.5;
    if (!_1149)
    {
        _1151 = _1147;
    }
    float _1159 = _1151;
    bool _1161 = !_1149;
    float _1163 = _1159;
    if (!_1161)
    {
        float _1165 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1169 = _1143 + _1167;
        float _1171 = rsqrt(_1141);
        float _1173 = _1169 * _1165;
        float _1175 = _1147 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1177 = _1173 * 0.15915493667125701904296875;
        float _1179 = _1177 * 6.283185482025146484375;
        float _1181 = cos(_1179);
        float _1183 = _1177 * 6.283185482025146484375;
        float _1185 = sin(_1183);
        float _1187 = _1181 + (-1.0);
        float _1189 = _1187 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1191 = fma(_1185, _1175, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1193 = fma(_1147, _1181, _1189);
        float _1195 = _1171 * _1191;
        float _1197 = fma(_1137, _1195, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1199 = fma(_1131, _1195, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1163 = _1193;
        _1153 = _1197;
        _1155 = _1199;
    }
    float _1201 = _1163;
    float _1203 = _1153;
    float _1205 = _1155;
    float _1207 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1209 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1211 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1207);
    float _1213 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1215 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1209);
    float _1217 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1219 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1211);
    float _1221 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1213);
    float _1223 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1215);
    float _1225 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1227 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1217);
    float _1229 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1221);
    float _1231 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1233 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1235 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1227);
    float _1237 = _1229 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1239 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1241 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1233);
    float _1243 = _1235 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1245 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1247 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1239);
    float _1249 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1241);
    float _1251 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1245);
    float _1253 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1247);
    float _1255 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1249);
    float _1257 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1251);
    float _1259 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1253);
    float _1261 = 1.0 / _1255;
    float _1263 = _1255 * 0.5;
    float _1265 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1257);
    float _1267 = _1259 + _1255;
    float _1269 = fma(_1265, -0.5, _1263);
    float _1271 = _1267 * 0.5;
    float _1273 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.707099974155426025390625, _1269);
    float _1275 = _1271 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1277 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.92390000820159912109375, _1271);
    float _1279 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.707099974155426025390625, _1271);
    float _1281 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.3826999962329864501953125, _1271);
    float _1283 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.92390000820159912109375, _1271);
    float _1285 = _1271 * _1261;
    float _1287 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.707099974155426025390625, _1271);
    float _1289 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.3826999962329864501953125, _1271);
    float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1293 = _1271 + _1291;
    float _1295 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.3826999962329864501953125, _1269);
    float _1297 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.92390000820159912109375, _1269);
    float _1299 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.3826999962329864501953125, _1269);
    float _1301 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.707099974155426025390625, _1269);
    float _1303 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.92390000820159912109375, _1269);
    float _1305 = _1269 * _1261;
    float _1307 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1311 = _1269 + _1309;
    float _1313 = _1275 * _1261;
    float _1315 = _1261 * _1277;
    float _1317 = _1261 * _1295;
    float _1319 = _1261 * _1279;
    float _1321 = _1261 * _1273;
    float _1323 = _1261 * _1281;
    float _1325 = _1261 * _1297;
    float2 _4329 = float2(_1313, _1305);
    float _1327 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4329, float2(0.0), isnan(_4329)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4329, float2(0.0), isnan(_4329)), level(0.0)).x;
    float2 _4339 = float2(_1315, _1317);
    float _1329 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4339, float2(0.0), isnan(_4339)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4339, float2(0.0), isnan(_4339)), level(0.0)).x;
    float2 _4347 = float2(_1319, _1321);
    float _1331 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4347, float2(0.0), isnan(_4347)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4347, float2(0.0), isnan(_4347)), level(0.0)).x;
    float2 _4355 = float2(_1323, _1325);
    float _1333 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4355, float2(0.0), isnan(_4355)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4355, float2(0.0), isnan(_4355)), level(0.0)).x;
    float _1335 = _1261 * _1307;
    float _1337 = _1261 * _1283;
    float _1339 = _1261 * _1287;
    float _1341 = _1261 * _1289;
    float _1343 = _1261 * _1293;
    float _1345 = _1261 * _1299;
    float2 _4381 = float2(_1285, _1335);
    float _1347 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4381, float2(0.0), isnan(_4381)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4381, float2(0.0), isnan(_4381)), level(0.0)).x;
    float2 _4389 = float2(_1337, _1317);
    float _1349 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4389, float2(0.0), isnan(_4389)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4389, float2(0.0), isnan(_4389)), level(0.0)).x;
    float2 _4397 = float2(_1339, _1321);
    float _1351 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4397, float2(0.0), isnan(_4397)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4397, float2(0.0), isnan(_4397)), level(0.0)).x;
    float2 _4405 = float2(_1341, _1325);
    float _1353 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4405, float2(0.0), isnan(_4405)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4405, float2(0.0), isnan(_4405)), level(0.0)).x;
    float2 _4413 = float2(_1343, _1305);
    float _1355 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4413, float2(0.0), isnan(_4413)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4413, float2(0.0), isnan(_4413)), level(0.0)).x;
    float2 _4421 = float2(_1337, _1345);
    float _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4421, float2(0.0), isnan(_4421)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4421, float2(0.0), isnan(_4421)), level(0.0)).x;
    float2 _4429 = float2(_1315, _1345);
    float _1359 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4429, float2(0.0), isnan(_4429)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4429, float2(0.0), isnan(_4429)), level(0.0)).x;
    float _1361 = _1261 * _1301;
    float _1363 = _1261 * _1303;
    float _1365 = _1261 * _1311;
    float2 _4446 = float2(_1339, _1361);
    float _1367 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4446, float2(0.0), isnan(_4446)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4446, float2(0.0), isnan(_4446)), level(0.0)).x;
    float2 _4454 = float2(_1341, _1363);
    float _1369 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4454, float2(0.0), isnan(_4454)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4454, float2(0.0), isnan(_4454)), level(0.0)).x;
    float2 _4462 = float2(_1285, _1365);
    float _1371 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4462, float2(0.0), isnan(_4462)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4462, float2(0.0), isnan(_4462)), level(0.0)).x;
    float2 _4470 = float2(_1319, _1361);
    float _1373 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4470, float2(0.0), isnan(_4470)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4470, float2(0.0), isnan(_4470)), level(0.0)).x;
    float2 _4478 = float2(_1323, _1363);
    float _1375 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4478, float2(0.0), isnan(_4478)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4478, float2(0.0), isnan(_4478)), level(0.0)).x;
    float _1377 = in.m_50.x;
    float _1379 = in.m_50.y;
    float _1381 = in.m_50.z;
    float _1383 = in.m_50.w;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1387 = _979 + _1385;
    int _1389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1391 = _1389 != 0;
    int _1393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1395 = _1393 != 0;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1401 = _1399 != 0;
    int _1403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1405 = _1403 != 0;
    float _1407 = in.m_56.y;
    float _1409 = _1341;
    float _1411 = _1301;
    float _1413 = _1293;
    if (_1391)
    {
        float _1415 = in.m_50.x;
        _1409 = _1415;
    }
    float _1417 = _1409;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1421 = _1419 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    if (_1395)
    {
        float _1423 = in.m_50.z;
        _1411 = _1423;
    }
    float _1425 = _1411;
    float _1427 = 1.0 / _1421;
    out.m_58.x = 1.0;
    out.m_58.y = 1.0;
    out.m_58.z = 1.0;
    bool _1429 = _1383 > 0.5;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1433 = _1431 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1437 = 1.0 / _1433;
    float _1439 = -_1407;
    float _1441 = _1439 + 1.0;
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1445 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1447;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1453 = _1451 != 0;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1459 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1463 = false;
    float _1465 = _1381;
    float _1467 = _1407;
    bool _1469 = _1453;
    if (_1391)
    {
        bool _1471 = _1417 > 0.5;
        _1463 = _1471;
    }
    bool _1473 = _1463;
    float _1475 = fma(_1445, -2.0, _1435);
    int _1477 = _1429 ? as_type<int>(_1441) : as_type<int>(_1407);
    float _1479 = -_1443;
    float _1481 = fma(_1459, 2.0, _1479);
    float _1483 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1461);
    float _1485 = _1457 * _1437;
    float _1487 = in.m_60.x;
    float _1489 = in.m_60.y;
    float _1491 = in.m_60.z;
    float _1493 = _1401 ? as_type<float>(_1477) : _1407;
    float _1495 = _1449 * _1427;
    bool _1497 = _1049 != 0.0;
    bool _1499 = isnan(_1049);
    bool _1501 = _1497 || _1499;
    bool _1503 = isnan(0.0);
    bool _1505 = _1501 || _1503;
    float _1507 = in.m_56.x;
    if (!_1453)
    {
        _1413 = _1379;
    }
    float _1509 = _1413;
    float _1511 = fma(_1485, _1387, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1513 = _1047 == 0.0;
    bool _1515 = !_1505;
    bool _1517 = _1513 && _1515;
    float _1519 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1483);
    float _1521 = _1509;
    if (_1453)
    {
        _1521 = _1377;
    }
    float _1523 = _1521;
    bool _1525 = _1051 == 0.0;
    bool _1527 = _1525 && _1517;
    float _1529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1531 = 0.0;
    if (!_1453)
    {
        _1531 = _1381;
    }
    float _1533 = _1531;
    float _1535 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _1537 = _1379 > 0.5;
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1541 = _1533;
    if (_1453)
    {
        _1541 = _1379;
    }
    float _1543 = _1541;
    float _1545 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1535);
    if (_1453)
    {
        _1465 = _1379;
    }
    float _1547 = _1465;
    float _1549 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1539);
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1553 = _979 + _1551;
    float _1555 = _1487;
    float _1557 = _1489;
    float _1559 = _1491;
    if (!_1527)
    {
        float _1561 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1487);
        _1555 = _1561;
    }
    float _1563 = _1555;
    bool _1565 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1567 = isnan(_979);
    bool _1569 = _1565 || _1567;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1573 = _1569 || _1571;
    float _1575 = float(_1573);
    float _1577 = fma(_1495, _1553, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_1405)
    {
        float _1579 = _1537 ? _1441 : _1407;
        _1467 = _1579;
    }
    float _1581 = _1467;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_1395)
    {
        bool _1585 = _1425 > 0.5;
        _1469 = _1585;
    }
    bool _1587 = _1469;
    if (!_1527)
    {
        float _1589 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1489);
        _1557 = _1589;
    }
    float _1591 = _1557;
    float _1593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1595 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1597 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1599 = isnan(_979);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1605 = _1601 || _1603;
    float _1607 = float(_1605);
    float _1609 = -_1575;
    float _1611 = _1609 + 1.0;
    float _1613 = fma(_1547, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1583);
    float _1615 = fma(_1493, _1595, -0.5);
    bool _1617 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1619 = isnan(_979);
    bool _1621 = _1617 || _1619;
    bool _1623 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1625 = _1621 || _1623;
    int _1627 = _1625 ? 1065353216 : 0;
    float _1629 = _1607 * _1611;
    float _1631 = -_1607;
    float _1633 = _1631 + 1.0;
    float _1635 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1637 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1639 = as_type<float>(_1627) * _1633;
    float _1641 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1643 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1397);
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1647 = _1577 * _1639;
    float _1649 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1651 = fma(_1635, -2.0, _1641);
    float _1653 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1545);
    float _1655 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1657 = fma(_1649, _1581, -0.5);
    float _1659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1661 = _1653 * (-0.15915493667125701904296875);
    float _1663 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1665 = -_1645;
    float _1667 = fma(_1655, 2.0, _1665);
    int _1669 = as_type<int>(_1655);
    float _1671 = _1529;
    int _1673 = _1627;
    float _1675 = _1507;
    if (_1391)
    {
        float _1677 = -_1507;
        float _1679 = _1677 + 1.0;
        _1669 = as_type<int>(_1679);
    }
    int _1681 = _1669;
    float _1683 = -as_type<float>(_1627);
    float _1685 = _1683 + 1.0;
    float _1687 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1663);
    float _1689 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1637);
    float _1691 = _1661 * 6.283185482025146484375;
    float _1693 = sin(_1691);
    float _1695 = -_123;
    float _1697 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1481);
    if (!_1391)
    {
        _1671 = _1507;
    }
    float _1699 = _1671;
    float _1701 = fma(_1685, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1647);
    float _1703 = _1699;
    if (_1391)
    {
        float _1705 = _1473 ? as_type<float>(_1681) : _1507;
        _1703 = _1705;
    }
    float _1707 = _1703;
    float _1709 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1549);
    float _1711 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1475);
    float _1713 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1643);
    float _1715 = _1661 * 6.283185482025146484375;
    float _1717 = cos(_1715);
    float _1719 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1613);
    float _1721 = -_123;
    float _1723 = fma(_1721, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1667);
    float _1725 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1651);
    float _1727 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_1527)
    {
        float _1729 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1491);
        _1559 = _1729;
    }
    float _1731 = _1559;
    float _1733 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1689);
    float _1735 = -_1725;
    float _1737 = fma(_1719, _1615, _1735);
    float _1739 = fma(_1727, _1707, -0.5);
    float _1741 = _1693 * _1657;
    float _1743 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1747 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1687);
    if (_1395)
    {
        float _1749 = -_1507;
        float _1751 = _1749 + 1.0;
        _1673 = as_type<int>(_1751);
    }
    int _1753 = _1673;
    float _1755 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1743);
    float _1757 = fma(_1511, _1629, _1701);
    float _1759 = _1717 * _1657;
    float _1761 = -_1741;
    float _1763 = fma(_1717, _1739, _1761);
    float _1765 = _1747 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1395)
    {
        float _1767 = _1587 ? as_type<float>(_1753) : _1507;
        _1675 = _1767;
    }
    float _1769 = _1675;
    float _1771 = fma(_1693, _1739, _1759);
    float _1773 = fma(_1519, _1763, _1697);
    float _1775 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1755);
    float _1777 = _1733 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1779 = _1009 * _1591;
    float _1781 = _1011 * _1591;
    float _1783 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1775);
    float _1785 = 1.0 / _1777;
    float _1787 = _1745 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1789 = _1765 + _1777;
    float _1791 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1757);
    float _1793 = fma(_1089, _1563, _1779);
    float _1795 = fma(_1787, _1769, -0.5);
    float _1797 = fma(_1083, _1563, _1781);
    float _1799 = _1007 * _1591;
    float _1801 = _1783 + _1255;
    float _1803 = fma(_1713, _1795, _1723);
    float _1805 = _1801 * 0.5;
    float _1807 = fma(_1087, _1563, _1799);
    float _1809 = _1789 * _1785;
    float _1811 = _1809 * 0.5;
    float _1813 = fma(_1109, _1731, _1793);
    float _1815 = fma((*spvDescriptorSet0.vp_c9)._m0[139].x, (*spvDescriptorSet0.vp_c9)._m0[139].y, _1805);
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1819 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1821 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1823 = _1815 * _1261;
    float _1825 = -_1711;
    float _1827 = fma(_1709, _1771, _1825);
    float _1829 = _1817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1831 = _1819 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1833 = _1821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1835 = _1791 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1839 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1837);
    float _1841 = _1737 + 0.5;
    float _1843 = _1803 + 0.5;
    float _1845 = _1773 + 0.5;
    float _1847 = _1827 + 0.5;
    out.m_62.x = _1829;
    out.m_62.y = _1831;
    out.m_62.z = _1833;
    out.m_62.w = _1835;
    float _1849 = 1.0 / _1839;
    float _1851 = fma(_1125, _1731, _1797);
    float _1853 = fma(_1101, _1731, _1807);
    out.m_64.x = _1845;
    out.m_64.y = _1847;
    out.m_64.z = _1843;
    out.m_64.w = _1841;
    bool _1855 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1857 = isnan(0.5);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1863 = _1859 || _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1867 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1865);
    out.gl_Position.x = _1259;
    out.gl_Position.y = _1265;
    out.gl_Position.z = _1783;
    out.gl_Position.w = _1255;
    out.m_66.x = _1813;
    out.m_66.y = _1851;
    out.m_66.z = _1853;
    float _1869 = 1.0 / _1867;
    float _1871 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1873 = _1203 + _1871;
    float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1877 = _1201 + _1875;
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1881 = _1205 + _1879;
    out.m_68.x = _1873;
    out.m_68.y = _1877;
    out.m_68.z = _1881;
    out.m_70.z = _1805;
    out.m_70.w = _1255;
    float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1885 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1883);
    float _1887 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1889 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1887);
    float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1893 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1891);
    float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1897 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1895);
    float _1899 = 1.0 / _1885;
    float _1901 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1903 = _1849 * _1901;
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1907 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1905);
    float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1911 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1909);
    float _1913 = 1.0 / _1889;
    float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1917 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1915);
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1921 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1919);
    float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1925 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1923);
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1929 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1927);
    float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1933 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1931);
    float _1935 = 1.0 / _1897;
    float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1939 = -_1903;
    float _1941 = fma(_1899, _1937, _1939);
    float _1943 = precise::clamp(_1941, 0.0, 1.0);
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1947 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1945);
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1951 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1949);
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1955 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1953);
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1959 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1957);
    float _1961 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1963 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1961);
    float _1965 = 1.0 / _1893;
    float _1967 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1969 = -_1903;
    float _1971 = fma(_1913, _1967, _1969);
    float _1973 = precise::clamp(_1971, 0.0, 1.0);
    float _1975 = _1943 + _1973;
    float _1977 = 1.0 / _1907;
    float _1979 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1981 = -_1903;
    float _1983 = fma(_1935, _1979, _1981);
    float _1985 = precise::clamp(_1983, 0.0, 1.0);
    float _1987 = 1.0 / _1911;
    float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1991 = -_1903;
    float _1993 = fma(_1965, _1989, _1991);
    float _1995 = precise::clamp(_1993, 0.0, 1.0);
    float _1997 = _1975 + _1995;
    float _1999 = 1.0 / _1917;
    float _2001 = _1997 + _1985;
    float _2003 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2005 = -_1903;
    float _2007 = fma(_1977, _2003, _2005);
    float _2009 = precise::clamp(_2007, 0.0, 1.0);
    float _2011 = _2001 + _2009;
    float _2013 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2015 = -_1903;
    float _2017 = fma(_1987, _2013, _2015);
    float _2019 = precise::clamp(_2017, 0.0, 1.0);
    float _2021 = 1.0 / _1925;
    float _2023 = _2011 + _2019;
    float _2025 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2027 = -_1903;
    float _2029 = fma(_1999, _2025, _2027);
    float _2031 = precise::clamp(_2029, 0.0, 1.0);
    float _2033 = 1.0 / _1921;
    float _2035 = _2023 + _2031;
    float _2037 = _2023;
    float _2039 = _1873;
    if (!_1863)
    {
        float _2041 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        _2037 = _2041;
    }
    float _2043 = _2037;
    if (!_1863)
    {
        float _2045 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        _1157 = _2045;
    }
    float _2047 = _1157;
    float _2049 = _2047;
    if (!_1863)
    {
        float _2051 = _2043 * 0.15915493667125701904296875;
        _2039 = _2051;
    }
    float _2053 = _2039;
    if (!_1863)
    {
        float _2055 = _2047 * 0.15915493667125701904296875;
        _2049 = _2055;
    }
    float _2057 = _2049;
    float _2059 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2061 = -_1903;
    float _2063 = fma(_2021, _2059, _2061);
    float _2065 = precise::clamp(_2063, 0.0, 1.0);
    float _2067 = 1.0 / _1929;
    float _2069 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2071 = -_1903;
    float _2073 = fma(_2033, _2069, _2071);
    float _2075 = precise::clamp(_2073, 0.0, 1.0);
    float _2077 = _2033;
    float _2079 = _2075;
    if (!_1863)
    {
        float _2081 = _2053 * 6.283185482025146484375;
        float _2083 = cos(_2081);
        _2077 = _2083;
    }
    float _2085 = _2077;
    float _2087 = _2035 + _2075;
    float _2089 = _2087 + _2065;
    float _2091 = _2087;
    if (!_1863)
    {
        float _2093 = _2053 * 6.283185482025146484375;
        float _2095 = sin(_2093);
        _2079 = _2095;
    }
    float _2097 = _2079;
    float _2099 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2101 = -_1903;
    float _2103 = fma(_2067, _2099, _2101);
    float _2105 = precise::clamp(_2103, 0.0, 1.0);
    float _2107 = _2089 + _2105;
    float _2109 = _1255;
    float _2111 = _2097;
    float _2113 = _2107;
    if (!_1863)
    {
        float _2115 = 1.0 / _2085;
        _2109 = _2115;
    }
    float _2117 = _2109;
    float _2119 = _2035;
    if (!_1863)
    {
        float _2121 = _2057 * 6.283185482025146484375;
        float _2123 = cos(_2121);
        _2119 = _2123;
    }
    float _2125 = _2119;
    if (!_1863)
    {
        float _2127 = _2097 * _2117;
        _2091 = _2127;
    }
    float _2129 = _2091;
    float _2131 = 1.0 / _1947;
    float _2133 = _2125;
    if (!_1863)
    {
        float _2135 = _2125 * _2129;
        _2133 = _2135;
    }
    float _2137 = _2133;
    if (!_1863)
    {
        float _2139 = _2057 * 6.283185482025146484375;
        float _2141 = sin(_2139);
        _2111 = _2141;
    }
    float _2143 = _2111;
    float _2145 = _2137;
    float _2147 = _2143;
    if (!_1863)
    {
        float _2149 = 1.0 / _2137;
        _2145 = _2149;
    }
    float _2151 = _2145;
    float _2153 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2155 = -_1903;
    float _2157 = fma(_2131, _2153, _2155);
    float _2159 = precise::clamp(_2157, 0.0, 1.0);
    float _2161 = _2107 + _2159;
    float _2163 = _2161;
    if (!_1863)
    {
        _2113 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2165 = _2113;
    float _2167 = 1.0 / _1951;
    float _2169 = 1.0 / _1955;
    if (!_1863)
    {
        float _2171 = _2143 * _2151;
        _2147 = _2171;
    }
    float _2173 = _2147;
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2177 = _1869 * _2175;
    float _2179 = _2177;
    if (!_1863)
    {
        float _2181 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2183 = fma(_2177, _2173, _2181);
        _2179 = _2183;
    }
    float _2185 = _2179;
    float _2187 = 1.0 / _1933;
    float _2189 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2191 = -_1903;
    float _2193 = fma(_2167, _2189, _2191);
    float _2195 = precise::clamp(_2193, 0.0, 1.0);
    float _2197 = _2161 + _2195;
    if (!_1863)
    {
        float _2199 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2201 = _2165 + _2199;
        _2163 = _2201;
    }
    float _2203 = _2163;
    float _2205 = 1.0 / _1959;
    float _2207 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2209 = -_1903;
    float _2211 = fma(_2169, _2207, _2209);
    float _2213 = precise::clamp(_2211, 0.0, 1.0);
    float _2215 = _2197 + _2213;
    float _2217 = 1.0 / _1963;
    float _2219 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2221 = -_1903;
    float _2223 = fma(_2187, _2219, _2221);
    float _2225 = precise::clamp(_2223, 0.0, 1.0);
    float _2227 = _2215 + _2225;
    float _2229 = _2203;
    if (!_1863)
    {
        float _2231 = 1.0 / _2203;
        _2229 = _2231;
    }
    float _2233 = _2229;
    float _2235 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2237 = -_1903;
    float _2239 = fma(_2205, _2235, _2237);
    float _2241 = precise::clamp(_2239, 0.0, 1.0);
    float _2243 = _2227 + _2241;
    float _2245 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2247 = -_1903;
    float _2249 = fma(_2217, _2245, _2247);
    float _2251 = precise::clamp(_2249, 0.0, 1.0);
    float _2253 = _2217;
    if (_1863)
    {
        _2253 = 1.0;
    }
    float _2255 = _2253;
    float _2257 = _2251 + _2243;
    float _2259 = _2255;
    if (!_1863)
    {
        float _2261 = _2185 * _2233;
        float _2263 = precise::clamp(_2261, 0.0, 1.0);
        _2259 = _2263;
    }
    float _2265 = _2259;
    float _2267 = _2257 * 0.0625;
    float _2269 = _2267 * _2265;
    bool _2271 = _2265 > 0.0;
    bool _2273 = isnan(_2265);
    bool _2275 = _2271 || _2273;
    bool _2277 = isnan(0.0);
    bool _2279 = _2275 || _2277;
    float _2281 = _2269 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2283 = _2281 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_38.x = _2283;
    if (_2279)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_38.x = 0.0;
    float _2285 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2285;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _971 = false;
    bool _829 = false;
    bool _649 = false;
    bool _489 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_35.w;
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
        out.m_38.x = 0.0;
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
        float _2342 = as_type<float>(_105);
        out.gl_Position.z = _2342;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_40.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    float _141 = _139;
    if (_135)
    {
        out.m_38.x = 0.0;
    }
    if (_135)
    {
        float _143 = _139 * 5.0;
        _107 = as_type<int>(_143);
    }
    int _145 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2412 = as_type<float>(_145);
        out.gl_Position.z = _2412;
    }
    if (_135)
    {
        return out;
    }
    float _147 = in.m_40.x;
    float _149 = in.m_40.y;
    float _151 = in.m_40.z;
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
    float _191 = 0.0;
    if (!_187)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _153 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _153);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _221;
        _191 = _209;
        _141 = _211;
    }
    float _223 = _189;
    float _225 = _191;
    float _227 = _141;
    bool _229 = !_163;
    float _231 = _227;
    float _233 = _225;
    if (!_229)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _153 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _231 = _241;
        _165 = _253;
    }
    float _255 = _231;
    float _257 = _165;
    float _259 = _255;
    if (!_163)
    {
        _259 = _123;
    }
    float _261 = _259;
    float _263 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _265 = _261;
    if (!_163)
    {
        float _267 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _267;
    }
    float _269 = _233;
    bool _271 = !_163;
    float _273 = _269;
    if (!_271)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = _123 * _277;
        float _287 = 1.0 / _281;
        float _289 = _283 * 0.693147182464599609375;
        float _291 = exp2(_285);
        float _293 = 1.0 / _289;
        float _295 = _291 + (-1.0);
        float _297 = -_295;
        float _299 = fma(_297, _293, _123);
        float _301 = _299 * _287;
        float _303 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _273 = _303;
    }
    float _305 = _273;
    bool _307 = !_163;
    if (!_307)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = 1.0 / _315;
        float _319 = _123 * _311;
        float _321 = exp2(_319);
        float _323 = -_321;
        float _325 = _323 + 1.0;
        float _327 = _325 * _317;
        _265 = _327;
    }
    float _329 = _265;
    float _331 = fma(_257, _147, _263);
    float _333 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _335 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = fma(_257, _149, _333);
    float _343 = fma(_329, _149, _335);
    float _345 = fma(_329, _147, _337);
    float _347 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = fma(_329, _151, _339);
    float _351 = -_343;
    float _353 = _341 + _351;
    float _355 = -_345;
    float _357 = _331 + _355;
    float _359 = fma(_257, _151, _347);
    float _361 = in.m_42.y;
    float _363 = _353 * _353;
    float _365 = -_349;
    float _367 = _359 + _365;
    float _369 = in.m_44.y;
    float _371 = fma(_357, _357, _363);
    float _373 = in.m_46.y;
    float _375 = fma(_367, _367, _371);
    float _377 = in.m_44.x;
    float _379 = sqrt(_375);
    float _381 = in.m_42.x;
    float _383 = in.m_46.x;
    float _385 = in.m_44.z;
    float _387 = _353 * _361;
    float _389 = in.m_42.z;
    float _391 = _353 * _369;
    bool _393 = _379 >= 9.9999999747524270787835121154785e-07;
    bool _395 = isnan(_379);
    bool _397 = _393 || _395;
    bool _399 = isnan(9.9999999747524270787835121154785e-07);
    bool _401 = _397 || _399;
    float _403 = in.m_46.z;
    float _405 = _353 * _373;
    float _407 = _361 * _361;
    float _409 = in.m_48.w;
    float _411 = fma(_357, _377, _391);
    float _413 = fma(_369, _369, _407);
    float _415 = in.m_35.x;
    float _417 = in.m_35.y;
    float _419 = in.m_35.z;
    float _421 = fma(_357, _381, _387);
    float _423 = fma(_373, _373, _413);
    float _425 = fma(_357, _383, _405);
    float _427 = fma(_367, _385, _411);
    float _429 = fma(_367, _389, _421);
    float _431 = fma(_367, _403, _425);
    float _433 = fma(_331, _409, _415);
    float _435 = fma(_341, _409, _417);
    float _437 = fma(_359, _409, _419);
    float _439 = _427;
    float _441 = _429;
    float _443 = _431;
    float _445 = _429;
    float _447 = _427;
    float _449 = _431;
    if (!_401)
    {
        bool _451 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _453 = !_451;
        if (!_453)
        {
            float _455 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _457 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _459 = _373 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _461 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[16].x, _455);
            float _463 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[16].x, _457);
            float _465 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[16].x, _459);
            float _467 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[16].z, _461);
            float _469 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[16].z, _463);
            float _471 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[16].z, _465);
            float _473 = _467 * _467;
            float _475 = fma(_469, _469, _473);
            float _477 = fma(_471, _471, _475);
            float _479 = rsqrt(_477);
            float _481 = _479 * 9.9999999747524270787835121154785e-07;
            float _483 = _469 * _481;
            float _485 = _467 * _481;
            float _487 = _471 * _481;
            _445 = _485;
            _447 = _483;
            _449 = _487;
            _489 = true;
        }
        else
        {
            float _491 = _149 * _149;
            float _493 = fma(_147, _147, _491);
            float _495 = fma(_151, _151, _493);
            float _497 = sqrt(_495);
            bool _499 = _497 >= 9.9999999747524270787835121154785e-07;
            bool _501 = isnan(_497);
            bool _503 = _499 || _501;
            bool _505 = isnan(9.9999999747524270787835121154785e-07);
            bool _507 = _503 || _505;
            float _509 = _497;
            if (!_507)
            {
                float _511 = _417 * _417;
                float _513 = fma(_415, _415, _511);
                float _515 = fma(_419, _419, _513);
                float _517 = sqrt(_515);
                bool _519 = _517 >= 9.9999999747524270787835121154785e-07;
                bool _521 = isnan(_517);
                bool _523 = _519 || _521;
                bool _525 = isnan(9.9999999747524270787835121154785e-07);
                bool _527 = _523 || _525;
                float _529 = _423;
                if (!_527)
                {
                    float _531 = rsqrt(_423);
                    _529 = _531;
                }
                float _533 = _529;
                if (!_527)
                {
                    float _535 = _533 * 9.9999999747524270787835121154785e-07;
                    _509 = _535;
                }
                float _537 = _509;
                if (!_527)
                {
                    float _539 = _369 * _537;
                    _439 = _539;
                }
                float _541 = _439;
                _447 = _541;
                if (!_527)
                {
                    float _543 = _361 * _537;
                    _441 = _543;
                }
                float _545 = _441;
                _445 = _545;
                if (!_527)
                {
                    float _547 = _373 * _537;
                    _443 = _547;
                }
                float _549 = _443;
                bool _551 = !_527;
                _449 = _549;
                _489 = _551;
                if (!_489)
                {
                    float _553 = _361 * _417;
                    float _555 = _369 * _417;
                    float _557 = _373 * _417;
                    float _559 = fma(_415, _381, _553);
                    float _561 = fma(_415, _377, _555);
                    float _563 = fma(_415, _383, _557);
                    float _565 = fma(_419, _389, _559);
                    float _567 = fma(_419, _385, _561);
                    float _569 = fma(_419, _403, _563);
                    float _571 = _565 * _565;
                    float _573 = fma(_567, _567, _571);
                    float _575 = fma(_569, _569, _573);
                    float _577 = rsqrt(_575);
                    float _579 = _577 * 9.9999999747524270787835121154785e-07;
                    float _581 = _567 * _579;
                    float _583 = _565 * _579;
                    float _585 = _569 * _579;
                    _445 = _583;
                    _447 = _581;
                    _449 = _585;
                    _489 = true;
                }
            }
            else
            {
                float _587 = _361 * _149;
                float _589 = _369 * _149;
                float _591 = _373 * _149;
                float _593 = fma(_147, _381, _587);
                float _595 = fma(_147, _377, _589);
                float _597 = fma(_147, _383, _591);
                float _599 = fma(_151, _389, _593);
                float _601 = fma(_151, _385, _595);
                float _603 = fma(_151, _403, _597);
                float _605 = _599 * _599;
                float _607 = fma(_601, _601, _605);
                float _609 = fma(_603, _603, _607);
                float _611 = rsqrt(_609);
                float _613 = _611 * 9.9999999747524270787835121154785e-07;
                float _615 = _601 * _613;
                float _617 = _599 * _613;
                float _619 = _603 * _613;
                _445 = _617;
                _447 = _615;
                _449 = _619;
            }
        }
    }
    _489 = false;
    float _621 = _445;
    float _623 = _447;
    float _625 = _449;
    bool _627 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _629 = !_627;
    float _647;
    if (!_629)
    {
        float _631 = in.m_50.x;
        float _633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _635 = _631 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _637 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _639 = _637 * _633;
        float _641 = floor(_639);
        float _643 = -_641;
        float _645 = _639 + _643;
        _647 = _645;
        _649 = true;
    }
    else
    {
        float _651 = float(_89);
        float _653 = 1.0 / _651;
        float _655 = _123 * _653;
        _647 = _655;
    }
    _649 = false;
    float _657 = _647;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _661 = _657 + _659;
    bool _663 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _665 = isnan(_657);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _677 = _657 + _675;
    bool _679 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _681 = isnan(_657);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _699 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _701 = isnan(_657);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = -_673;
    float _713 = _711 + 1.0;
    float _715 = 1.0 / _697;
    float _717 = _709 * _713;
    float _719 = -_709;
    float _721 = _719 + 1.0;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _723;
    bool _727 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _729 = 1.0 / _693;
    float _731 = _689 * _721;
    float _733 = -_689;
    float _735 = _733 + 1.0;
    float _737 = _677 * _715;
    float _739 = _661 * _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _741;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _745;
    float _749 = fma(_725, _739, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _751 = fma(_743, _739, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _753 = fma(_747, _739, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _755 = in.m_48.x;
    float _757 = in.m_48.y;
    float _759 = in.m_48.z;
    float _761 = _749 * _731;
    float _763 = _751 * _731;
    float _765 = _753 * _731;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _779 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[143].x, _761);
    float _781 = fma(_769, _737, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _783 = fma(_773, _737, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _785 = fma(_777, _737, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _787 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[143].y, _763);
    float _789 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[143].z, _765);
    float _791 = fma(_781, _717, _779);
    float _793 = fma(_783, _717, _787);
    float _795 = fma(_785, _717, _789);
    float _797 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[145].x, _791);
    float _799 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[145].y, _793);
    float _801 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[145].z, _795);
    float _803 = _797 * _755;
    float _805 = _799 * _757;
    float _807 = _801 * _759;
    bool _809 = !_727;
    float _827;
    if (!_809)
    {
        float _811 = in.m_50.x;
        float _813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _815 = _811 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _817 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _819 = _817 * _813;
        float _821 = floor(_819);
        float _823 = -_821;
        float _825 = _819 + _823;
        _827 = _825;
        _829 = true;
    }
    else
    {
        float _831 = float(_89);
        float _833 = 1.0 / _831;
        float _835 = _123 * _833;
        _827 = _835;
    }
    _829 = false;
    float _837 = _827;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _841 = _837 + _839;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _847 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _849 = isnan(_837);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _863 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _865 = isnan(_837);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _875;
    bool _879 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _881 = isnan(_837);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = 1.0 / _845;
    float _893 = -_857;
    float _895 = _893 + 1.0;
    bool _897 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _899 = _873 * _895;
    float _901 = -_873;
    float _903 = _901 + 1.0;
    float _905 = 1.0 / _861;
    float _907 = _877 * _891;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _913 = fma(_907, _841, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _915 = _911 * _905;
    float _917 = _913 * _899;
    float _919 = -_889;
    float _921 = _919 + 1.0;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _925 = _837 + _923;
    float _927 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[115].x, _917);
    float _929 = _857 * _921;
    float _931 = fma(_915, _925, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _935 = fma(_931, _929, _927);
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _941 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[117].x, _935);
    float _943 = _933 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = _937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _947 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _949 = _941 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_52.x = _943;
    out.m_52.y = _945;
    out.m_52.z = _947;
    out.m_52.w = _949;
    bool _951 = !_897;
    float _969;
    if (!_951)
    {
        float _953 = in.m_50.x;
        float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _957 = _953 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _961 = _959 * _955;
        float _963 = floor(_961);
        float _965 = -_963;
        float _967 = _961 + _965;
        _969 = _967;
        _971 = true;
    }
    else
    {
        float _973 = float(_89);
        float _975 = 1.0 / _973;
        float _977 = _123 * _975;
        _969 = _977;
    }
    _971 = false;
    float _979 = _969;
    float _981 = _621 * _621;
    float _983 = _435 * _373;
    float _985 = in.m_46.w;
    float _987 = _805 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _989 = fma(_623, _623, _981);
    float _991 = fma(_433, _383, _983);
    float _993 = in.m_44.w;
    float _995 = fma(_625, _625, _989);
    float _997 = _803 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _999 = _807 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1001 = fma(_437, _403, _991);
    float _1003 = rsqrt(_995);
    float _1005 = _1001 + _985;
    float _1007 = _1003 * _625;
    float _1009 = _1003 * _623;
    float _1011 = _1003 * _621;
    float _1013 = _435 * _369;
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1017 = _1007 * _1015;
    float _1019 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1021 = _1009 * _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1025 = _1011 * _1023;
    float _1027 = fma(_433, _377, _1013);
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1031 = -_1017;
    float _1033 = fma(_1009, _1029, _1031);
    float _1035 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1037 = -_1021;
    float _1039 = fma(_1011, _1035, _1037);
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1043 = -_1025;
    float _1045 = fma(_1007, _1041, _1043);
    float _1047 = in.m_54.x;
    float _1049 = in.m_54.y;
    float _1051 = in.m_54.z;
    float _1053 = _1033 * _1033;
    float _1055 = fma(_437, _385, _1027);
    float _1057 = _435 * _361;
    float _1059 = fma(_1045, _1045, _1053);
    float _1061 = _1055 + _993;
    float _1063 = fma(_433, _381, _1057);
    float _1065 = fma(_1039, _1039, _1059);
    float _1067 = fma(_437, _389, _1063);
    float _1069 = rsqrt(_1065);
    float _1071 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1049);
    float _1073 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1047);
    float _1075 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1051);
    float _1077 = _987 * _1071;
    float _1079 = _997 * _1073;
    float _1081 = _999 * _1075;
    float _1083 = _1033 * _1069;
    float _1085 = _1077 * _1007;
    float _1087 = _1039 * _1069;
    float _1089 = _1045 * _1069;
    float _1091 = _1009 * _1083;
    float _1093 = _1077 * _1009;
    float _1095 = fma(_1079, _1087, _1085);
    float _1097 = _1011 * _1087;
    float _1099 = -_1091;
    float _1101 = fma(_1011, _1089, _1099);
    float _1103 = fma(_1079, _1089, _1093);
    float _1105 = in.m_42.w;
    float _1107 = -_1097;
    float _1109 = fma(_1007, _1083, _1107);
    float _1111 = fma(_1081, _1101, _1095);
    float _1113 = _1077 * _1011;
    float _1115 = _1007 * _1089;
    float _1117 = fma(_1081, _1109, _1103);
    float _1119 = _1005 + _1111;
    float _1121 = fma(_1079, _1083, _1113);
    float _1123 = -_1115;
    float _1125 = fma(_1009, _1087, _1123);
    float _1127 = _1061 + _1117;
    float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1131 = _1119 + _1129;
    float _1133 = fma(_1081, _1125, _1121);
    float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1137 = _1127 + _1135;
    float _1139 = _1131 * _1131;
    float _1141 = fma(_1137, _1137, _1139);
    float _1143 = sqrt(_1141);
    float _1145 = _1067 + _1105;
    float _1147 = _1145 + _1133;
    bool _1149 = _1143 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1151 = 0.0;
    float _1153 = _1127;
    float _1155 = _1119;
    float _1157 = 0.5;
    if (!_1149)
    {
        _1151 = _1147;
    }
    float _1159 = _1151;
    bool _1161 = !_1149;
    float _1163 = _1159;
    if (!_1161)
    {
        float _1165 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1169 = _1143 + _1167;
        float _1171 = rsqrt(_1141);
        float _1173 = _1169 * _1165;
        float _1175 = _1147 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1177 = _1173 * 0.15915493667125701904296875;
        float _1179 = _1177 * 6.283185482025146484375;
        float _1181 = cos(_1179);
        float _1183 = _1177 * 6.283185482025146484375;
        float _1185 = sin(_1183);
        float _1187 = _1181 + (-1.0);
        float _1189 = _1187 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1191 = fma(_1185, _1175, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1193 = fma(_1147, _1181, _1189);
        float _1195 = _1171 * _1191;
        float _1197 = fma(_1137, _1195, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1199 = fma(_1131, _1195, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1163 = _1193;
        _1153 = _1197;
        _1155 = _1199;
    }
    float _1201 = _1163;
    float _1203 = _1153;
    float _1205 = _1155;
    float _1207 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1209 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1211 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1207);
    float _1213 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1215 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1209);
    float _1217 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1219 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1211);
    float _1221 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1213);
    float _1223 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1215);
    float _1225 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1227 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1217);
    float _1229 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1221);
    float _1231 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1233 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1235 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1227);
    float _1237 = _1229 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1239 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1241 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1233);
    float _1243 = _1235 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1245 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1247 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1239);
    float _1249 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1241);
    float _1251 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1245);
    float _1253 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1247);
    float _1255 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1249);
    float _1257 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1251);
    float _1259 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1253);
    float _1261 = 1.0 / _1255;
    float _1263 = _1255 * 0.5;
    float _1265 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1257);
    float _1267 = _1259 + _1255;
    float _1269 = fma(_1265, -0.5, _1263);
    float _1271 = _1267 * 0.5;
    float _1273 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.707099974155426025390625, _1269);
    float _1275 = _1271 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1277 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.92390000820159912109375, _1271);
    float _1279 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.707099974155426025390625, _1271);
    float _1281 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.3826999962329864501953125, _1271);
    float _1283 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.92390000820159912109375, _1271);
    float _1285 = _1271 * _1261;
    float _1287 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.707099974155426025390625, _1271);
    float _1289 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.3826999962329864501953125, _1271);
    float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1293 = _1271 + _1291;
    float _1295 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.3826999962329864501953125, _1269);
    float _1297 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.92390000820159912109375, _1269);
    float _1299 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.3826999962329864501953125, _1269);
    float _1301 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.707099974155426025390625, _1269);
    float _1303 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.92390000820159912109375, _1269);
    float _1305 = _1269 * _1261;
    float _1307 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1311 = _1269 + _1309;
    float _1313 = _1275 * _1261;
    float _1315 = _1261 * _1277;
    float _1317 = _1261 * _1295;
    float _1319 = _1261 * _1279;
    float _1321 = _1261 * _1273;
    float _1323 = _1261 * _1281;
    float _1325 = _1261 * _1297;
    float2 _4329 = float2(_1313, _1305);
    float _1327 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4329, float2(0.0), isnan(_4329)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4329, float2(0.0), isnan(_4329)), level(0.0)).x;
    float2 _4339 = float2(_1315, _1317);
    float _1329 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4339, float2(0.0), isnan(_4339)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4339, float2(0.0), isnan(_4339)), level(0.0)).x;
    float2 _4347 = float2(_1319, _1321);
    float _1331 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4347, float2(0.0), isnan(_4347)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4347, float2(0.0), isnan(_4347)), level(0.0)).x;
    float2 _4355 = float2(_1323, _1325);
    float _1333 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4355, float2(0.0), isnan(_4355)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4355, float2(0.0), isnan(_4355)), level(0.0)).x;
    float _1335 = _1261 * _1307;
    float _1337 = _1261 * _1283;
    float _1339 = _1261 * _1287;
    float _1341 = _1261 * _1289;
    float _1343 = _1261 * _1293;
    float _1345 = _1261 * _1299;
    float2 _4381 = float2(_1285, _1335);
    float _1347 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4381, float2(0.0), isnan(_4381)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4381, float2(0.0), isnan(_4381)), level(0.0)).x;
    float2 _4389 = float2(_1337, _1317);
    float _1349 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4389, float2(0.0), isnan(_4389)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4389, float2(0.0), isnan(_4389)), level(0.0)).x;
    float2 _4397 = float2(_1339, _1321);
    float _1351 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4397, float2(0.0), isnan(_4397)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4397, float2(0.0), isnan(_4397)), level(0.0)).x;
    float2 _4405 = float2(_1341, _1325);
    float _1353 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4405, float2(0.0), isnan(_4405)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4405, float2(0.0), isnan(_4405)), level(0.0)).x;
    float2 _4413 = float2(_1343, _1305);
    float _1355 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4413, float2(0.0), isnan(_4413)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4413, float2(0.0), isnan(_4413)), level(0.0)).x;
    float2 _4421 = float2(_1337, _1345);
    float _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4421, float2(0.0), isnan(_4421)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4421, float2(0.0), isnan(_4421)), level(0.0)).x;
    float2 _4429 = float2(_1315, _1345);
    float _1359 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4429, float2(0.0), isnan(_4429)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4429, float2(0.0), isnan(_4429)), level(0.0)).x;
    float _1361 = _1261 * _1301;
    float _1363 = _1261 * _1303;
    float _1365 = _1261 * _1311;
    float2 _4446 = float2(_1339, _1361);
    float _1367 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4446, float2(0.0), isnan(_4446)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4446, float2(0.0), isnan(_4446)), level(0.0)).x;
    float2 _4454 = float2(_1341, _1363);
    float _1369 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4454, float2(0.0), isnan(_4454)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4454, float2(0.0), isnan(_4454)), level(0.0)).x;
    float2 _4462 = float2(_1285, _1365);
    float _1371 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4462, float2(0.0), isnan(_4462)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4462, float2(0.0), isnan(_4462)), level(0.0)).x;
    float2 _4470 = float2(_1319, _1361);
    float _1373 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4470, float2(0.0), isnan(_4470)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4470, float2(0.0), isnan(_4470)), level(0.0)).x;
    float2 _4478 = float2(_1323, _1363);
    float _1375 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4478, float2(0.0), isnan(_4478)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4478, float2(0.0), isnan(_4478)), level(0.0)).x;
    float _1377 = in.m_50.x;
    float _1379 = in.m_50.y;
    float _1381 = in.m_50.z;
    float _1383 = in.m_50.w;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1387 = _979 + _1385;
    int _1389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1391 = _1389 != 0;
    int _1393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1395 = _1393 != 0;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1401 = _1399 != 0;
    int _1403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1405 = _1403 != 0;
    float _1407 = in.m_56.y;
    float _1409 = _1341;
    float _1411 = _1301;
    float _1413 = _1293;
    if (_1391)
    {
        float _1415 = in.m_50.x;
        _1409 = _1415;
    }
    float _1417 = _1409;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1421 = _1419 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    if (_1395)
    {
        float _1423 = in.m_50.z;
        _1411 = _1423;
    }
    float _1425 = _1411;
    float _1427 = 1.0 / _1421;
    out.m_58.x = 1.0;
    out.m_58.y = 1.0;
    out.m_58.z = 1.0;
    bool _1429 = _1383 > 0.5;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1433 = _1431 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1437 = 1.0 / _1433;
    float _1439 = -_1407;
    float _1441 = _1439 + 1.0;
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1445 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1447;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1453 = _1451 != 0;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1459 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1463 = false;
    float _1465 = _1381;
    float _1467 = _1407;
    bool _1469 = _1453;
    if (_1391)
    {
        bool _1471 = _1417 > 0.5;
        _1463 = _1471;
    }
    bool _1473 = _1463;
    float _1475 = fma(_1445, -2.0, _1435);
    int _1477 = _1429 ? as_type<int>(_1441) : as_type<int>(_1407);
    float _1479 = -_1443;
    float _1481 = fma(_1459, 2.0, _1479);
    float _1483 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1461);
    float _1485 = _1457 * _1437;
    float _1487 = in.m_60.x;
    float _1489 = in.m_60.y;
    float _1491 = in.m_60.z;
    float _1493 = _1401 ? as_type<float>(_1477) : _1407;
    float _1495 = _1449 * _1427;
    bool _1497 = _1049 != 0.0;
    bool _1499 = isnan(_1049);
    bool _1501 = _1497 || _1499;
    bool _1503 = isnan(0.0);
    bool _1505 = _1501 || _1503;
    float _1507 = in.m_56.x;
    if (!_1453)
    {
        _1413 = _1379;
    }
    float _1509 = _1413;
    float _1511 = fma(_1485, _1387, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1513 = _1047 == 0.0;
    bool _1515 = !_1505;
    bool _1517 = _1513 && _1515;
    float _1519 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1483);
    float _1521 = _1509;
    if (_1453)
    {
        _1521 = _1377;
    }
    float _1523 = _1521;
    bool _1525 = _1051 == 0.0;
    bool _1527 = _1525 && _1517;
    float _1529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1531 = 0.0;
    if (!_1453)
    {
        _1531 = _1381;
    }
    float _1533 = _1531;
    float _1535 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _1537 = _1379 > 0.5;
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1541 = _1533;
    if (_1453)
    {
        _1541 = _1379;
    }
    float _1543 = _1541;
    float _1545 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1535);
    if (_1453)
    {
        _1465 = _1379;
    }
    float _1547 = _1465;
    float _1549 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1539);
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1553 = _979 + _1551;
    float _1555 = _1487;
    float _1557 = _1489;
    float _1559 = _1491;
    if (!_1527)
    {
        float _1561 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1487);
        _1555 = _1561;
    }
    float _1563 = _1555;
    bool _1565 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1567 = isnan(_979);
    bool _1569 = _1565 || _1567;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1573 = _1569 || _1571;
    float _1575 = float(_1573);
    float _1577 = fma(_1495, _1553, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_1405)
    {
        float _1579 = _1537 ? _1441 : _1407;
        _1467 = _1579;
    }
    float _1581 = _1467;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_1395)
    {
        bool _1585 = _1425 > 0.5;
        _1469 = _1585;
    }
    bool _1587 = _1469;
    if (!_1527)
    {
        float _1589 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1489);
        _1557 = _1589;
    }
    float _1591 = _1557;
    float _1593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1595 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1597 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1599 = isnan(_979);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1605 = _1601 || _1603;
    float _1607 = float(_1605);
    float _1609 = -_1575;
    float _1611 = _1609 + 1.0;
    float _1613 = fma(_1547, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1583);
    float _1615 = fma(_1493, _1595, -0.5);
    bool _1617 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1619 = isnan(_979);
    bool _1621 = _1617 || _1619;
    bool _1623 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1625 = _1621 || _1623;
    int _1627 = _1625 ? 1065353216 : 0;
    float _1629 = _1607 * _1611;
    float _1631 = -_1607;
    float _1633 = _1631 + 1.0;
    float _1635 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1637 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1639 = as_type<float>(_1627) * _1633;
    float _1641 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1643 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1397);
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1647 = _1577 * _1639;
    float _1649 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1651 = fma(_1635, -2.0, _1641);
    float _1653 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1545);
    float _1655 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1657 = fma(_1649, _1581, -0.5);
    float _1659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1661 = _1653 * (-0.15915493667125701904296875);
    float _1663 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1665 = -_1645;
    float _1667 = fma(_1655, 2.0, _1665);
    int _1669 = as_type<int>(_1655);
    float _1671 = _1529;
    int _1673 = _1627;
    float _1675 = _1507;
    if (_1391)
    {
        float _1677 = -_1507;
        float _1679 = _1677 + 1.0;
        _1669 = as_type<int>(_1679);
    }
    int _1681 = _1669;
    float _1683 = -as_type<float>(_1627);
    float _1685 = _1683 + 1.0;
    float _1687 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1663);
    float _1689 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1637);
    float _1691 = _1661 * 6.283185482025146484375;
    float _1693 = sin(_1691);
    float _1695 = -_123;
    float _1697 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1481);
    if (!_1391)
    {
        _1671 = _1507;
    }
    float _1699 = _1671;
    float _1701 = fma(_1685, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1647);
    float _1703 = _1699;
    if (_1391)
    {
        float _1705 = _1473 ? as_type<float>(_1681) : _1507;
        _1703 = _1705;
    }
    float _1707 = _1703;
    float _1709 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1549);
    float _1711 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1475);
    float _1713 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1643);
    float _1715 = _1661 * 6.283185482025146484375;
    float _1717 = cos(_1715);
    float _1719 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1613);
    float _1721 = -_123;
    float _1723 = fma(_1721, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1667);
    float _1725 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1651);
    float _1727 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_1527)
    {
        float _1729 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1491);
        _1559 = _1729;
    }
    float _1731 = _1559;
    float _1733 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1689);
    float _1735 = -_1725;
    float _1737 = fma(_1719, _1615, _1735);
    float _1739 = fma(_1727, _1707, -0.5);
    float _1741 = _1693 * _1657;
    float _1743 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1747 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1687);
    if (_1395)
    {
        float _1749 = -_1507;
        float _1751 = _1749 + 1.0;
        _1673 = as_type<int>(_1751);
    }
    int _1753 = _1673;
    float _1755 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1743);
    float _1757 = fma(_1511, _1629, _1701);
    float _1759 = _1717 * _1657;
    float _1761 = -_1741;
    float _1763 = fma(_1717, _1739, _1761);
    float _1765 = _1747 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1395)
    {
        float _1767 = _1587 ? as_type<float>(_1753) : _1507;
        _1675 = _1767;
    }
    float _1769 = _1675;
    float _1771 = fma(_1693, _1739, _1759);
    float _1773 = fma(_1519, _1763, _1697);
    float _1775 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1755);
    float _1777 = _1733 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1779 = _1009 * _1591;
    float _1781 = _1011 * _1591;
    float _1783 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1775);
    float _1785 = 1.0 / _1777;
    float _1787 = _1745 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1789 = _1765 + _1777;
    float _1791 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1757);
    float _1793 = fma(_1089, _1563, _1779);
    float _1795 = fma(_1787, _1769, -0.5);
    float _1797 = fma(_1083, _1563, _1781);
    float _1799 = _1007 * _1591;
    float _1801 = _1783 + _1255;
    float _1803 = fma(_1713, _1795, _1723);
    float _1805 = _1801 * 0.5;
    float _1807 = fma(_1087, _1563, _1799);
    float _1809 = _1789 * _1785;
    float _1811 = _1809 * 0.5;
    float _1813 = fma(_1109, _1731, _1793);
    float _1815 = fma((*spvDescriptorSet0.vp_c9)._m0[139].x, (*spvDescriptorSet0.vp_c9)._m0[139].y, _1805);
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1819 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1821 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1823 = _1815 * _1261;
    float _1825 = -_1711;
    float _1827 = fma(_1709, _1771, _1825);
    float _1829 = _1817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1831 = _1819 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1833 = _1821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1835 = _1791 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1839 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1837);
    float _1841 = _1737 + 0.5;
    float _1843 = _1803 + 0.5;
    float _1845 = _1773 + 0.5;
    float _1847 = _1827 + 0.5;
    out.m_62.x = _1829;
    out.m_62.y = _1831;
    out.m_62.z = _1833;
    out.m_62.w = _1835;
    float _1849 = 1.0 / _1839;
    float _1851 = fma(_1125, _1731, _1797);
    float _1853 = fma(_1101, _1731, _1807);
    out.m_64.x = _1845;
    out.m_64.y = _1847;
    out.m_64.z = _1843;
    out.m_64.w = _1841;
    bool _1855 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1857 = isnan(0.5);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1863 = _1859 || _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1867 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1865);
    out.gl_Position.x = _1259;
    out.gl_Position.y = _1265;
    out.gl_Position.z = _1783;
    out.gl_Position.w = _1255;
    out.m_66.x = _1813;
    out.m_66.y = _1851;
    out.m_66.z = _1853;
    float _1869 = 1.0 / _1867;
    float _1871 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1873 = _1203 + _1871;
    float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1877 = _1201 + _1875;
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1881 = _1205 + _1879;
    out.m_68.x = _1873;
    out.m_68.y = _1877;
    out.m_68.z = _1881;
    out.m_70.z = _1805;
    out.m_70.w = _1255;
    float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1885 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1883);
    float _1887 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1889 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1887);
    float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1893 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1891);
    float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1897 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1895);
    float _1899 = 1.0 / _1885;
    float _1901 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1903 = _1849 * _1901;
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1907 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1905);
    float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1911 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1909);
    float _1913 = 1.0 / _1889;
    float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1917 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1915);
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1921 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1919);
    float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1925 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1923);
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1929 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1927);
    float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1933 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1931);
    float _1935 = 1.0 / _1897;
    float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1939 = -_1903;
    float _1941 = fma(_1899, _1937, _1939);
    float _1943 = precise::clamp(_1941, 0.0, 1.0);
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1947 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1945);
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1951 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1949);
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1955 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1953);
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1959 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1957);
    float _1961 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1963 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1961);
    float _1965 = 1.0 / _1893;
    float _1967 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1969 = -_1903;
    float _1971 = fma(_1913, _1967, _1969);
    float _1973 = precise::clamp(_1971, 0.0, 1.0);
    float _1975 = _1943 + _1973;
    float _1977 = 1.0 / _1907;
    float _1979 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1981 = -_1903;
    float _1983 = fma(_1935, _1979, _1981);
    float _1985 = precise::clamp(_1983, 0.0, 1.0);
    float _1987 = 1.0 / _1911;
    float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1991 = -_1903;
    float _1993 = fma(_1965, _1989, _1991);
    float _1995 = precise::clamp(_1993, 0.0, 1.0);
    float _1997 = _1975 + _1995;
    float _1999 = 1.0 / _1917;
    float _2001 = _1997 + _1985;
    float _2003 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2005 = -_1903;
    float _2007 = fma(_1977, _2003, _2005);
    float _2009 = precise::clamp(_2007, 0.0, 1.0);
    float _2011 = _2001 + _2009;
    float _2013 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2015 = -_1903;
    float _2017 = fma(_1987, _2013, _2015);
    float _2019 = precise::clamp(_2017, 0.0, 1.0);
    float _2021 = 1.0 / _1925;
    float _2023 = _2011 + _2019;
    float _2025 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2027 = -_1903;
    float _2029 = fma(_1999, _2025, _2027);
    float _2031 = precise::clamp(_2029, 0.0, 1.0);
    float _2033 = 1.0 / _1921;
    float _2035 = _2023 + _2031;
    float _2037 = _2023;
    float _2039 = _1873;
    if (!_1863)
    {
        float _2041 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        _2037 = _2041;
    }
    float _2043 = _2037;
    if (!_1863)
    {
        float _2045 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        _1157 = _2045;
    }
    float _2047 = _1157;
    float _2049 = _2047;
    if (!_1863)
    {
        float _2051 = _2043 * 0.15915493667125701904296875;
        _2039 = _2051;
    }
    float _2053 = _2039;
    if (!_1863)
    {
        float _2055 = _2047 * 0.15915493667125701904296875;
        _2049 = _2055;
    }
    float _2057 = _2049;
    float _2059 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2061 = -_1903;
    float _2063 = fma(_2021, _2059, _2061);
    float _2065 = precise::clamp(_2063, 0.0, 1.0);
    float _2067 = 1.0 / _1929;
    float _2069 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2071 = -_1903;
    float _2073 = fma(_2033, _2069, _2071);
    float _2075 = precise::clamp(_2073, 0.0, 1.0);
    float _2077 = _2033;
    float _2079 = _2075;
    if (!_1863)
    {
        float _2081 = _2053 * 6.283185482025146484375;
        float _2083 = cos(_2081);
        _2077 = _2083;
    }
    float _2085 = _2077;
    float _2087 = _2035 + _2075;
    float _2089 = _2087 + _2065;
    float _2091 = _2087;
    if (!_1863)
    {
        float _2093 = _2053 * 6.283185482025146484375;
        float _2095 = sin(_2093);
        _2079 = _2095;
    }
    float _2097 = _2079;
    float _2099 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2101 = -_1903;
    float _2103 = fma(_2067, _2099, _2101);
    float _2105 = precise::clamp(_2103, 0.0, 1.0);
    float _2107 = _2089 + _2105;
    float _2109 = _1255;
    float _2111 = _2097;
    float _2113 = _2107;
    if (!_1863)
    {
        float _2115 = 1.0 / _2085;
        _2109 = _2115;
    }
    float _2117 = _2109;
    float _2119 = _2035;
    if (!_1863)
    {
        float _2121 = _2057 * 6.283185482025146484375;
        float _2123 = cos(_2121);
        _2119 = _2123;
    }
    float _2125 = _2119;
    if (!_1863)
    {
        float _2127 = _2097 * _2117;
        _2091 = _2127;
    }
    float _2129 = _2091;
    float _2131 = 1.0 / _1947;
    float _2133 = _2125;
    if (!_1863)
    {
        float _2135 = _2125 * _2129;
        _2133 = _2135;
    }
    float _2137 = _2133;
    if (!_1863)
    {
        float _2139 = _2057 * 6.283185482025146484375;
        float _2141 = sin(_2139);
        _2111 = _2141;
    }
    float _2143 = _2111;
    float _2145 = _2137;
    float _2147 = _2143;
    if (!_1863)
    {
        float _2149 = 1.0 / _2137;
        _2145 = _2149;
    }
    float _2151 = _2145;
    float _2153 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2155 = -_1903;
    float _2157 = fma(_2131, _2153, _2155);
    float _2159 = precise::clamp(_2157, 0.0, 1.0);
    float _2161 = _2107 + _2159;
    float _2163 = _2161;
    if (!_1863)
    {
        _2113 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2165 = _2113;
    float _2167 = 1.0 / _1951;
    float _2169 = 1.0 / _1955;
    if (!_1863)
    {
        float _2171 = _2143 * _2151;
        _2147 = _2171;
    }
    float _2173 = _2147;
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2177 = _1869 * _2175;
    float _2179 = _2177;
    if (!_1863)
    {
        float _2181 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2183 = fma(_2177, _2173, _2181);
        _2179 = _2183;
    }
    float _2185 = _2179;
    float _2187 = 1.0 / _1933;
    float _2189 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2191 = -_1903;
    float _2193 = fma(_2167, _2189, _2191);
    float _2195 = precise::clamp(_2193, 0.0, 1.0);
    float _2197 = _2161 + _2195;
    if (!_1863)
    {
        float _2199 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2201 = _2165 + _2199;
        _2163 = _2201;
    }
    float _2203 = _2163;
    float _2205 = 1.0 / _1959;
    float _2207 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2209 = -_1903;
    float _2211 = fma(_2169, _2207, _2209);
    float _2213 = precise::clamp(_2211, 0.0, 1.0);
    float _2215 = _2197 + _2213;
    float _2217 = 1.0 / _1963;
    float _2219 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2221 = -_1903;
    float _2223 = fma(_2187, _2219, _2221);
    float _2225 = precise::clamp(_2223, 0.0, 1.0);
    float _2227 = _2215 + _2225;
    float _2229 = _2203;
    if (!_1863)
    {
        float _2231 = 1.0 / _2203;
        _2229 = _2231;
    }
    float _2233 = _2229;
    float _2235 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2237 = -_1903;
    float _2239 = fma(_2205, _2235, _2237);
    float _2241 = precise::clamp(_2239, 0.0, 1.0);
    float _2243 = _2227 + _2241;
    float _2245 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2247 = -_1903;
    float _2249 = fma(_2217, _2245, _2247);
    float _2251 = precise::clamp(_2249, 0.0, 1.0);
    float _2253 = _2217;
    if (_1863)
    {
        _2253 = 1.0;
    }
    float _2255 = _2253;
    float _2257 = _2251 + _2243;
    float _2259 = _2255;
    if (!_1863)
    {
        float _2261 = _2185 * _2233;
        float _2263 = precise::clamp(_2261, 0.0, 1.0);
        _2259 = _2263;
    }
    float _2265 = _2259;
    float _2267 = _2257 * 0.0625;
    float _2269 = _2267 * _2265;
    bool _2271 = _2265 > 0.0;
    bool _2273 = isnan(_2265);
    bool _2275 = _2271 || _2273;
    bool _2277 = isnan(0.0);
    bool _2279 = _2275 || _2277;
    float _2281 = _2269 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2283 = _2281 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_38.x = _2283;
    if (_2279)
    {
        return out;
    }
    out.m_38.x = 0.0;
    float _2285 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2285;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _971 = false;
    bool _829 = false;
    bool _649 = false;
    bool _489 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_35.w;
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
        out.m_38.x = 0.0;
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
        float _2342 = as_type<float>(_105);
        out.gl_Position.z = _2342;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_40.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    float _141 = _139;
    if (_135)
    {
        out.m_38.x = 0.0;
    }
    if (_135)
    {
        float _143 = _139 * 5.0;
        _107 = as_type<int>(_143);
    }
    int _145 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2412 = as_type<float>(_145);
        out.gl_Position.z = _2412;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = in.m_40.x;
    float _149 = in.m_40.y;
    float _151 = in.m_40.z;
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
    float _191 = 0.0;
    if (!_187)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _153 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _153);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _221;
        _191 = _209;
        _141 = _211;
    }
    float _223 = _189;
    float _225 = _191;
    float _227 = _141;
    bool _229 = !_163;
    float _231 = _227;
    float _233 = _225;
    if (!_229)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _153 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _231 = _241;
        _165 = _253;
    }
    float _255 = _231;
    float _257 = _165;
    float _259 = _255;
    if (!_163)
    {
        _259 = _123;
    }
    float _261 = _259;
    float _263 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _265 = _261;
    if (!_163)
    {
        float _267 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _267;
    }
    float _269 = _233;
    bool _271 = !_163;
    float _273 = _269;
    if (!_271)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = _123 * _277;
        float _287 = 1.0 / _281;
        float _289 = _283 * 0.693147182464599609375;
        float _291 = exp2(_285);
        float _293 = 1.0 / _289;
        float _295 = _291 + (-1.0);
        float _297 = -_295;
        float _299 = fma(_297, _293, _123);
        float _301 = _299 * _287;
        float _303 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _273 = _303;
    }
    float _305 = _273;
    bool _307 = !_163;
    if (!_307)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = 1.0 / _315;
        float _319 = _123 * _311;
        float _321 = exp2(_319);
        float _323 = -_321;
        float _325 = _323 + 1.0;
        float _327 = _325 * _317;
        _265 = _327;
    }
    float _329 = _265;
    float _331 = fma(_257, _147, _263);
    float _333 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _335 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = fma(_257, _149, _333);
    float _343 = fma(_329, _149, _335);
    float _345 = fma(_329, _147, _337);
    float _347 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = fma(_329, _151, _339);
    float _351 = -_343;
    float _353 = _341 + _351;
    float _355 = -_345;
    float _357 = _331 + _355;
    float _359 = fma(_257, _151, _347);
    float _361 = in.m_42.y;
    float _363 = _353 * _353;
    float _365 = -_349;
    float _367 = _359 + _365;
    float _369 = in.m_44.y;
    float _371 = fma(_357, _357, _363);
    float _373 = in.m_46.y;
    float _375 = fma(_367, _367, _371);
    float _377 = in.m_44.x;
    float _379 = sqrt(_375);
    float _381 = in.m_42.x;
    float _383 = in.m_46.x;
    float _385 = in.m_44.z;
    float _387 = _353 * _361;
    float _389 = in.m_42.z;
    float _391 = _353 * _369;
    bool _393 = _379 >= 9.9999999747524270787835121154785e-07;
    bool _395 = isnan(_379);
    bool _397 = _393 || _395;
    bool _399 = isnan(9.9999999747524270787835121154785e-07);
    bool _401 = _397 || _399;
    float _403 = in.m_46.z;
    float _405 = _353 * _373;
    float _407 = _361 * _361;
    float _409 = in.m_48.w;
    float _411 = fma(_357, _377, _391);
    float _413 = fma(_369, _369, _407);
    float _415 = in.m_35.x;
    float _417 = in.m_35.y;
    float _419 = in.m_35.z;
    float _421 = fma(_357, _381, _387);
    float _423 = fma(_373, _373, _413);
    float _425 = fma(_357, _383, _405);
    float _427 = fma(_367, _385, _411);
    float _429 = fma(_367, _389, _421);
    float _431 = fma(_367, _403, _425);
    float _433 = fma(_331, _409, _415);
    float _435 = fma(_341, _409, _417);
    float _437 = fma(_359, _409, _419);
    float _439 = _427;
    float _441 = _429;
    float _443 = _431;
    float _445 = _429;
    float _447 = _427;
    float _449 = _431;
    if (!_401)
    {
        bool _451 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _453 = !_451;
        if (!_453)
        {
            float _455 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _457 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _459 = _373 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _461 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[16].x, _455);
            float _463 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[16].x, _457);
            float _465 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[16].x, _459);
            float _467 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[16].z, _461);
            float _469 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[16].z, _463);
            float _471 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[16].z, _465);
            float _473 = _467 * _467;
            float _475 = fma(_469, _469, _473);
            float _477 = fma(_471, _471, _475);
            float _479 = rsqrt(_477);
            float _481 = _479 * 9.9999999747524270787835121154785e-07;
            float _483 = _469 * _481;
            float _485 = _467 * _481;
            float _487 = _471 * _481;
            _445 = _485;
            _447 = _483;
            _449 = _487;
            _489 = true;
        }
        else
        {
            float _491 = _149 * _149;
            float _493 = fma(_147, _147, _491);
            float _495 = fma(_151, _151, _493);
            float _497 = sqrt(_495);
            bool _499 = _497 >= 9.9999999747524270787835121154785e-07;
            bool _501 = isnan(_497);
            bool _503 = _499 || _501;
            bool _505 = isnan(9.9999999747524270787835121154785e-07);
            bool _507 = _503 || _505;
            float _509 = _497;
            if (!_507)
            {
                float _511 = _417 * _417;
                float _513 = fma(_415, _415, _511);
                float _515 = fma(_419, _419, _513);
                float _517 = sqrt(_515);
                bool _519 = _517 >= 9.9999999747524270787835121154785e-07;
                bool _521 = isnan(_517);
                bool _523 = _519 || _521;
                bool _525 = isnan(9.9999999747524270787835121154785e-07);
                bool _527 = _523 || _525;
                float _529 = _423;
                if (!_527)
                {
                    float _531 = rsqrt(_423);
                    _529 = _531;
                }
                float _533 = _529;
                if (!_527)
                {
                    float _535 = _533 * 9.9999999747524270787835121154785e-07;
                    _509 = _535;
                }
                float _537 = _509;
                if (!_527)
                {
                    float _539 = _369 * _537;
                    _439 = _539;
                }
                float _541 = _439;
                _447 = _541;
                if (!_527)
                {
                    float _543 = _361 * _537;
                    _441 = _543;
                }
                float _545 = _441;
                _445 = _545;
                if (!_527)
                {
                    float _547 = _373 * _537;
                    _443 = _547;
                }
                float _549 = _443;
                bool _551 = !_527;
                _449 = _549;
                _489 = _551;
                if (!_489)
                {
                    float _553 = _361 * _417;
                    float _555 = _369 * _417;
                    float _557 = _373 * _417;
                    float _559 = fma(_415, _381, _553);
                    float _561 = fma(_415, _377, _555);
                    float _563 = fma(_415, _383, _557);
                    float _565 = fma(_419, _389, _559);
                    float _567 = fma(_419, _385, _561);
                    float _569 = fma(_419, _403, _563);
                    float _571 = _565 * _565;
                    float _573 = fma(_567, _567, _571);
                    float _575 = fma(_569, _569, _573);
                    float _577 = rsqrt(_575);
                    float _579 = _577 * 9.9999999747524270787835121154785e-07;
                    float _581 = _567 * _579;
                    float _583 = _565 * _579;
                    float _585 = _569 * _579;
                    _445 = _583;
                    _447 = _581;
                    _449 = _585;
                    _489 = true;
                }
            }
            else
            {
                float _587 = _361 * _149;
                float _589 = _369 * _149;
                float _591 = _373 * _149;
                float _593 = fma(_147, _381, _587);
                float _595 = fma(_147, _377, _589);
                float _597 = fma(_147, _383, _591);
                float _599 = fma(_151, _389, _593);
                float _601 = fma(_151, _385, _595);
                float _603 = fma(_151, _403, _597);
                float _605 = _599 * _599;
                float _607 = fma(_601, _601, _605);
                float _609 = fma(_603, _603, _607);
                float _611 = rsqrt(_609);
                float _613 = _611 * 9.9999999747524270787835121154785e-07;
                float _615 = _601 * _613;
                float _617 = _599 * _613;
                float _619 = _603 * _613;
                _445 = _617;
                _447 = _615;
                _449 = _619;
            }
        }
    }
    _489 = false;
    float _621 = _445;
    float _623 = _447;
    float _625 = _449;
    bool _627 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _629 = !_627;
    float _647;
    if (!_629)
    {
        float _631 = in.m_50.x;
        float _633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _635 = _631 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _637 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _639 = _637 * _633;
        float _641 = floor(_639);
        float _643 = -_641;
        float _645 = _639 + _643;
        _647 = _645;
        _649 = true;
    }
    else
    {
        float _651 = float(_89);
        float _653 = 1.0 / _651;
        float _655 = _123 * _653;
        _647 = _655;
    }
    _649 = false;
    float _657 = _647;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _661 = _657 + _659;
    bool _663 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _665 = isnan(_657);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _677 = _657 + _675;
    bool _679 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _681 = isnan(_657);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _699 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _701 = isnan(_657);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = -_673;
    float _713 = _711 + 1.0;
    float _715 = 1.0 / _697;
    float _717 = _709 * _713;
    float _719 = -_709;
    float _721 = _719 + 1.0;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _723;
    bool _727 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _729 = 1.0 / _693;
    float _731 = _689 * _721;
    float _733 = -_689;
    float _735 = _733 + 1.0;
    float _737 = _677 * _715;
    float _739 = _661 * _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _741;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _745;
    float _749 = fma(_725, _739, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _751 = fma(_743, _739, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _753 = fma(_747, _739, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _755 = in.m_48.x;
    float _757 = in.m_48.y;
    float _759 = in.m_48.z;
    float _761 = _749 * _731;
    float _763 = _751 * _731;
    float _765 = _753 * _731;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _779 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[143].x, _761);
    float _781 = fma(_769, _737, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _783 = fma(_773, _737, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _785 = fma(_777, _737, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _787 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[143].y, _763);
    float _789 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[143].z, _765);
    float _791 = fma(_781, _717, _779);
    float _793 = fma(_783, _717, _787);
    float _795 = fma(_785, _717, _789);
    float _797 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[145].x, _791);
    float _799 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[145].y, _793);
    float _801 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[145].z, _795);
    float _803 = _797 * _755;
    float _805 = _799 * _757;
    float _807 = _801 * _759;
    bool _809 = !_727;
    float _827;
    if (!_809)
    {
        float _811 = in.m_50.x;
        float _813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _815 = _811 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _817 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _819 = _817 * _813;
        float _821 = floor(_819);
        float _823 = -_821;
        float _825 = _819 + _823;
        _827 = _825;
        _829 = true;
    }
    else
    {
        float _831 = float(_89);
        float _833 = 1.0 / _831;
        float _835 = _123 * _833;
        _827 = _835;
    }
    _829 = false;
    float _837 = _827;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _841 = _837 + _839;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _847 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _849 = isnan(_837);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _863 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _865 = isnan(_837);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _875;
    bool _879 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _881 = isnan(_837);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = 1.0 / _845;
    float _893 = -_857;
    float _895 = _893 + 1.0;
    bool _897 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _899 = _873 * _895;
    float _901 = -_873;
    float _903 = _901 + 1.0;
    float _905 = 1.0 / _861;
    float _907 = _877 * _891;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _913 = fma(_907, _841, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _915 = _911 * _905;
    float _917 = _913 * _899;
    float _919 = -_889;
    float _921 = _919 + 1.0;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _925 = _837 + _923;
    float _927 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[115].x, _917);
    float _929 = _857 * _921;
    float _931 = fma(_915, _925, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _935 = fma(_931, _929, _927);
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _941 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[117].x, _935);
    float _943 = _933 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = _937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _947 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _949 = _941 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_52.x = _943;
    out.m_52.y = _945;
    out.m_52.z = _947;
    out.m_52.w = _949;
    bool _951 = !_897;
    float _969;
    if (!_951)
    {
        float _953 = in.m_50.x;
        float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _957 = _953 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _961 = _959 * _955;
        float _963 = floor(_961);
        float _965 = -_963;
        float _967 = _961 + _965;
        _969 = _967;
        _971 = true;
    }
    else
    {
        float _973 = float(_89);
        float _975 = 1.0 / _973;
        float _977 = _123 * _975;
        _969 = _977;
    }
    _971 = false;
    float _979 = _969;
    float _981 = _621 * _621;
    float _983 = _435 * _373;
    float _985 = in.m_46.w;
    float _987 = _805 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _989 = fma(_623, _623, _981);
    float _991 = fma(_433, _383, _983);
    float _993 = in.m_44.w;
    float _995 = fma(_625, _625, _989);
    float _997 = _803 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _999 = _807 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1001 = fma(_437, _403, _991);
    float _1003 = rsqrt(_995);
    float _1005 = _1001 + _985;
    float _1007 = _1003 * _625;
    float _1009 = _1003 * _623;
    float _1011 = _1003 * _621;
    float _1013 = _435 * _369;
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1017 = _1007 * _1015;
    float _1019 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1021 = _1009 * _1019;
    float _1023 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1025 = _1011 * _1023;
    float _1027 = fma(_433, _377, _1013);
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1031 = -_1017;
    float _1033 = fma(_1009, _1029, _1031);
    float _1035 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1037 = -_1021;
    float _1039 = fma(_1011, _1035, _1037);
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1043 = -_1025;
    float _1045 = fma(_1007, _1041, _1043);
    float _1047 = in.m_54.x;
    float _1049 = in.m_54.y;
    float _1051 = in.m_54.z;
    float _1053 = _1033 * _1033;
    float _1055 = fma(_437, _385, _1027);
    float _1057 = _435 * _361;
    float _1059 = fma(_1045, _1045, _1053);
    float _1061 = _1055 + _993;
    float _1063 = fma(_433, _381, _1057);
    float _1065 = fma(_1039, _1039, _1059);
    float _1067 = fma(_437, _389, _1063);
    float _1069 = rsqrt(_1065);
    float _1071 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1049);
    float _1073 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1047);
    float _1075 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1051);
    float _1077 = _987 * _1071;
    float _1079 = _997 * _1073;
    float _1081 = _999 * _1075;
    float _1083 = _1033 * _1069;
    float _1085 = _1077 * _1007;
    float _1087 = _1039 * _1069;
    float _1089 = _1045 * _1069;
    float _1091 = _1009 * _1083;
    float _1093 = _1077 * _1009;
    float _1095 = fma(_1079, _1087, _1085);
    float _1097 = _1011 * _1087;
    float _1099 = -_1091;
    float _1101 = fma(_1011, _1089, _1099);
    float _1103 = fma(_1079, _1089, _1093);
    float _1105 = in.m_42.w;
    float _1107 = -_1097;
    float _1109 = fma(_1007, _1083, _1107);
    float _1111 = fma(_1081, _1101, _1095);
    float _1113 = _1077 * _1011;
    float _1115 = _1007 * _1089;
    float _1117 = fma(_1081, _1109, _1103);
    float _1119 = _1005 + _1111;
    float _1121 = fma(_1079, _1083, _1113);
    float _1123 = -_1115;
    float _1125 = fma(_1009, _1087, _1123);
    float _1127 = _1061 + _1117;
    float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1131 = _1119 + _1129;
    float _1133 = fma(_1081, _1125, _1121);
    float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1137 = _1127 + _1135;
    float _1139 = _1131 * _1131;
    float _1141 = fma(_1137, _1137, _1139);
    float _1143 = sqrt(_1141);
    float _1145 = _1067 + _1105;
    float _1147 = _1145 + _1133;
    bool _1149 = _1143 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1151 = 0.0;
    float _1153 = _1127;
    float _1155 = _1119;
    float _1157 = 0.5;
    if (!_1149)
    {
        _1151 = _1147;
    }
    float _1159 = _1151;
    bool _1161 = !_1149;
    float _1163 = _1159;
    if (!_1161)
    {
        float _1165 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1169 = _1143 + _1167;
        float _1171 = rsqrt(_1141);
        float _1173 = _1169 * _1165;
        float _1175 = _1147 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1177 = _1173 * 0.15915493667125701904296875;
        float _1179 = _1177 * 6.283185482025146484375;
        float _1181 = cos(_1179);
        float _1183 = _1177 * 6.283185482025146484375;
        float _1185 = sin(_1183);
        float _1187 = _1181 + (-1.0);
        float _1189 = _1187 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1191 = fma(_1185, _1175, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1193 = fma(_1147, _1181, _1189);
        float _1195 = _1171 * _1191;
        float _1197 = fma(_1137, _1195, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1199 = fma(_1131, _1195, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1163 = _1193;
        _1153 = _1197;
        _1155 = _1199;
    }
    float _1201 = _1163;
    float _1203 = _1153;
    float _1205 = _1155;
    float _1207 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1209 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1211 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1207);
    float _1213 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1215 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1209);
    float _1217 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1219 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1211);
    float _1221 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1213);
    float _1223 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1215);
    float _1225 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1227 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1217);
    float _1229 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1221);
    float _1231 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1233 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1235 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1227);
    float _1237 = _1229 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1239 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1241 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1233);
    float _1243 = _1235 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1245 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1247 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1239);
    float _1249 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1241);
    float _1251 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1245);
    float _1253 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1247);
    float _1255 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1249);
    float _1257 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1251);
    float _1259 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1253);
    float _1261 = 1.0 / _1255;
    float _1263 = _1255 * 0.5;
    float _1265 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1257);
    float _1267 = _1259 + _1255;
    float _1269 = fma(_1265, -0.5, _1263);
    float _1271 = _1267 * 0.5;
    float _1273 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.707099974155426025390625, _1269);
    float _1275 = _1271 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1277 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.92390000820159912109375, _1271);
    float _1279 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.707099974155426025390625, _1271);
    float _1281 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.3826999962329864501953125, _1271);
    float _1283 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.92390000820159912109375, _1271);
    float _1285 = _1271 * _1261;
    float _1287 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.707099974155426025390625, _1271);
    float _1289 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.3826999962329864501953125, _1271);
    float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1293 = _1271 + _1291;
    float _1295 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.3826999962329864501953125, _1269);
    float _1297 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.92390000820159912109375, _1269);
    float _1299 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.3826999962329864501953125, _1269);
    float _1301 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.707099974155426025390625, _1269);
    float _1303 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.92390000820159912109375, _1269);
    float _1305 = _1269 * _1261;
    float _1307 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1311 = _1269 + _1309;
    float _1313 = _1275 * _1261;
    float _1315 = _1261 * _1277;
    float _1317 = _1261 * _1295;
    float _1319 = _1261 * _1279;
    float _1321 = _1261 * _1273;
    float _1323 = _1261 * _1281;
    float _1325 = _1261 * _1297;
    float2 _4329 = float2(_1313, _1305);
    float _1327 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4329, float2(0.0), isnan(_4329)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4329, float2(0.0), isnan(_4329)), level(0.0)).x;
    float2 _4339 = float2(_1315, _1317);
    float _1329 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4339, float2(0.0), isnan(_4339)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4339, float2(0.0), isnan(_4339)), level(0.0)).x;
    float2 _4347 = float2(_1319, _1321);
    float _1331 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4347, float2(0.0), isnan(_4347)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4347, float2(0.0), isnan(_4347)), level(0.0)).x;
    float2 _4355 = float2(_1323, _1325);
    float _1333 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4355, float2(0.0), isnan(_4355)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4355, float2(0.0), isnan(_4355)), level(0.0)).x;
    float _1335 = _1261 * _1307;
    float _1337 = _1261 * _1283;
    float _1339 = _1261 * _1287;
    float _1341 = _1261 * _1289;
    float _1343 = _1261 * _1293;
    float _1345 = _1261 * _1299;
    float2 _4381 = float2(_1285, _1335);
    float _1347 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4381, float2(0.0), isnan(_4381)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4381, float2(0.0), isnan(_4381)), level(0.0)).x;
    float2 _4389 = float2(_1337, _1317);
    float _1349 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4389, float2(0.0), isnan(_4389)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4389, float2(0.0), isnan(_4389)), level(0.0)).x;
    float2 _4397 = float2(_1339, _1321);
    float _1351 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4397, float2(0.0), isnan(_4397)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4397, float2(0.0), isnan(_4397)), level(0.0)).x;
    float2 _4405 = float2(_1341, _1325);
    float _1353 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4405, float2(0.0), isnan(_4405)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4405, float2(0.0), isnan(_4405)), level(0.0)).x;
    float2 _4413 = float2(_1343, _1305);
    float _1355 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4413, float2(0.0), isnan(_4413)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4413, float2(0.0), isnan(_4413)), level(0.0)).x;
    float2 _4421 = float2(_1337, _1345);
    float _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4421, float2(0.0), isnan(_4421)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4421, float2(0.0), isnan(_4421)), level(0.0)).x;
    float2 _4429 = float2(_1315, _1345);
    float _1359 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4429, float2(0.0), isnan(_4429)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4429, float2(0.0), isnan(_4429)), level(0.0)).x;
    float _1361 = _1261 * _1301;
    float _1363 = _1261 * _1303;
    float _1365 = _1261 * _1311;
    float2 _4446 = float2(_1339, _1361);
    float _1367 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4446, float2(0.0), isnan(_4446)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4446, float2(0.0), isnan(_4446)), level(0.0)).x;
    float2 _4454 = float2(_1341, _1363);
    float _1369 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4454, float2(0.0), isnan(_4454)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4454, float2(0.0), isnan(_4454)), level(0.0)).x;
    float2 _4462 = float2(_1285, _1365);
    float _1371 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4462, float2(0.0), isnan(_4462)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4462, float2(0.0), isnan(_4462)), level(0.0)).x;
    float2 _4470 = float2(_1319, _1361);
    float _1373 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4470, float2(0.0), isnan(_4470)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4470, float2(0.0), isnan(_4470)), level(0.0)).x;
    float2 _4478 = float2(_1323, _1363);
    float _1375 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4478, float2(0.0), isnan(_4478)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4478, float2(0.0), isnan(_4478)), level(0.0)).x;
    float _1377 = in.m_50.x;
    float _1379 = in.m_50.y;
    float _1381 = in.m_50.z;
    float _1383 = in.m_50.w;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1387 = _979 + _1385;
    int _1389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1391 = _1389 != 0;
    int _1393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1395 = _1393 != 0;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1401 = _1399 != 0;
    int _1403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1405 = _1403 != 0;
    float _1407 = in.m_56.y;
    float _1409 = _1341;
    float _1411 = _1301;
    float _1413 = _1293;
    if (_1391)
    {
        float _1415 = in.m_50.x;
        _1409 = _1415;
    }
    float _1417 = _1409;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1421 = _1419 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    if (_1395)
    {
        float _1423 = in.m_50.z;
        _1411 = _1423;
    }
    float _1425 = _1411;
    float _1427 = 1.0 / _1421;
    out.m_58.x = 1.0;
    out.m_58.y = 1.0;
    out.m_58.z = 1.0;
    bool _1429 = _1383 > 0.5;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1433 = _1431 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1437 = 1.0 / _1433;
    float _1439 = -_1407;
    float _1441 = _1439 + 1.0;
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1445 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1447;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1453 = _1451 != 0;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1459 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1463 = false;
    float _1465 = _1381;
    float _1467 = _1407;
    bool _1469 = _1453;
    if (_1391)
    {
        bool _1471 = _1417 > 0.5;
        _1463 = _1471;
    }
    bool _1473 = _1463;
    float _1475 = fma(_1445, -2.0, _1435);
    int _1477 = _1429 ? as_type<int>(_1441) : as_type<int>(_1407);
    float _1479 = -_1443;
    float _1481 = fma(_1459, 2.0, _1479);
    float _1483 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1461);
    float _1485 = _1457 * _1437;
    float _1487 = in.m_60.x;
    float _1489 = in.m_60.y;
    float _1491 = in.m_60.z;
    float _1493 = _1401 ? as_type<float>(_1477) : _1407;
    float _1495 = _1449 * _1427;
    bool _1497 = _1049 != 0.0;
    bool _1499 = isnan(_1049);
    bool _1501 = _1497 || _1499;
    bool _1503 = isnan(0.0);
    bool _1505 = _1501 || _1503;
    float _1507 = in.m_56.x;
    if (!_1453)
    {
        _1413 = _1379;
    }
    float _1509 = _1413;
    float _1511 = fma(_1485, _1387, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1513 = _1047 == 0.0;
    bool _1515 = !_1505;
    bool _1517 = _1513 && _1515;
    float _1519 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1483);
    float _1521 = _1509;
    if (_1453)
    {
        _1521 = _1377;
    }
    float _1523 = _1521;
    bool _1525 = _1051 == 0.0;
    bool _1527 = _1525 && _1517;
    float _1529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1531 = 0.0;
    if (!_1453)
    {
        _1531 = _1381;
    }
    float _1533 = _1531;
    float _1535 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _1537 = _1379 > 0.5;
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1541 = _1533;
    if (_1453)
    {
        _1541 = _1379;
    }
    float _1543 = _1541;
    float _1545 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1535);
    if (_1453)
    {
        _1465 = _1379;
    }
    float _1547 = _1465;
    float _1549 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1539);
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1553 = _979 + _1551;
    float _1555 = _1487;
    float _1557 = _1489;
    float _1559 = _1491;
    if (!_1527)
    {
        float _1561 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1487);
        _1555 = _1561;
    }
    float _1563 = _1555;
    bool _1565 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1567 = isnan(_979);
    bool _1569 = _1565 || _1567;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1573 = _1569 || _1571;
    float _1575 = float(_1573);
    float _1577 = fma(_1495, _1553, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_1405)
    {
        float _1579 = _1537 ? _1441 : _1407;
        _1467 = _1579;
    }
    float _1581 = _1467;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_1395)
    {
        bool _1585 = _1425 > 0.5;
        _1469 = _1585;
    }
    bool _1587 = _1469;
    if (!_1527)
    {
        float _1589 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1489);
        _1557 = _1589;
    }
    float _1591 = _1557;
    float _1593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1595 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1597 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1599 = isnan(_979);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1605 = _1601 || _1603;
    float _1607 = float(_1605);
    float _1609 = -_1575;
    float _1611 = _1609 + 1.0;
    float _1613 = fma(_1547, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1583);
    float _1615 = fma(_1493, _1595, -0.5);
    bool _1617 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1619 = isnan(_979);
    bool _1621 = _1617 || _1619;
    bool _1623 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1625 = _1621 || _1623;
    int _1627 = _1625 ? 1065353216 : 0;
    float _1629 = _1607 * _1611;
    float _1631 = -_1607;
    float _1633 = _1631 + 1.0;
    float _1635 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1637 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1639 = as_type<float>(_1627) * _1633;
    float _1641 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1643 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1397);
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1647 = _1577 * _1639;
    float _1649 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1651 = fma(_1635, -2.0, _1641);
    float _1653 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1545);
    float _1655 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1657 = fma(_1649, _1581, -0.5);
    float _1659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1661 = _1653 * (-0.15915493667125701904296875);
    float _1663 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1665 = -_1645;
    float _1667 = fma(_1655, 2.0, _1665);
    int _1669 = as_type<int>(_1655);
    float _1671 = _1529;
    int _1673 = _1627;
    float _1675 = _1507;
    if (_1391)
    {
        float _1677 = -_1507;
        float _1679 = _1677 + 1.0;
        _1669 = as_type<int>(_1679);
    }
    int _1681 = _1669;
    float _1683 = -as_type<float>(_1627);
    float _1685 = _1683 + 1.0;
    float _1687 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1663);
    float _1689 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1637);
    float _1691 = _1661 * 6.283185482025146484375;
    float _1693 = sin(_1691);
    float _1695 = -_123;
    float _1697 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1481);
    if (!_1391)
    {
        _1671 = _1507;
    }
    float _1699 = _1671;
    float _1701 = fma(_1685, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1647);
    float _1703 = _1699;
    if (_1391)
    {
        float _1705 = _1473 ? as_type<float>(_1681) : _1507;
        _1703 = _1705;
    }
    float _1707 = _1703;
    float _1709 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1549);
    float _1711 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1475);
    float _1713 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1643);
    float _1715 = _1661 * 6.283185482025146484375;
    float _1717 = cos(_1715);
    float _1719 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1613);
    float _1721 = -_123;
    float _1723 = fma(_1721, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1667);
    float _1725 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1651);
    float _1727 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_1527)
    {
        float _1729 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1491);
        _1559 = _1729;
    }
    float _1731 = _1559;
    float _1733 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1689);
    float _1735 = -_1725;
    float _1737 = fma(_1719, _1615, _1735);
    float _1739 = fma(_1727, _1707, -0.5);
    float _1741 = _1693 * _1657;
    float _1743 = _1225 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1747 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1687);
    if (_1395)
    {
        float _1749 = -_1507;
        float _1751 = _1749 + 1.0;
        _1673 = as_type<int>(_1751);
    }
    int _1753 = _1673;
    float _1755 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1743);
    float _1757 = fma(_1511, _1629, _1701);
    float _1759 = _1717 * _1657;
    float _1761 = -_1741;
    float _1763 = fma(_1717, _1739, _1761);
    float _1765 = _1747 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1395)
    {
        float _1767 = _1587 ? as_type<float>(_1753) : _1507;
        _1675 = _1767;
    }
    float _1769 = _1675;
    float _1771 = fma(_1693, _1739, _1759);
    float _1773 = fma(_1519, _1763, _1697);
    float _1775 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1755);
    float _1777 = _1733 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1779 = _1009 * _1591;
    float _1781 = _1011 * _1591;
    float _1783 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1775);
    float _1785 = 1.0 / _1777;
    float _1787 = _1745 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1789 = _1765 + _1777;
    float _1791 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1757);
    float _1793 = fma(_1089, _1563, _1779);
    float _1795 = fma(_1787, _1769, -0.5);
    float _1797 = fma(_1083, _1563, _1781);
    float _1799 = _1007 * _1591;
    float _1801 = _1783 + _1255;
    float _1803 = fma(_1713, _1795, _1723);
    float _1805 = _1801 * 0.5;
    float _1807 = fma(_1087, _1563, _1799);
    float _1809 = _1789 * _1785;
    float _1811 = _1809 * 0.5;
    float _1813 = fma(_1109, _1731, _1793);
    float _1815 = fma((*spvDescriptorSet0.vp_c9)._m0[139].x, (*spvDescriptorSet0.vp_c9)._m0[139].y, _1805);
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1819 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1821 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1823 = _1815 * _1261;
    float _1825 = -_1711;
    float _1827 = fma(_1709, _1771, _1825);
    float _1829 = _1817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1831 = _1819 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1833 = _1821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1835 = _1791 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1839 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1837);
    float _1841 = _1737 + 0.5;
    float _1843 = _1803 + 0.5;
    float _1845 = _1773 + 0.5;
    float _1847 = _1827 + 0.5;
    out.m_62.x = _1829;
    out.m_62.y = _1831;
    out.m_62.z = _1833;
    out.m_62.w = _1835;
    float _1849 = 1.0 / _1839;
    float _1851 = fma(_1125, _1731, _1797);
    float _1853 = fma(_1101, _1731, _1807);
    out.m_64.x = _1845;
    out.m_64.y = _1847;
    out.m_64.z = _1843;
    out.m_64.w = _1841;
    bool _1855 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1857 = isnan(0.5);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1863 = _1859 || _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1867 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1865);
    out.gl_Position.x = _1259;
    out.gl_Position.y = _1265;
    out.gl_Position.z = _1783;
    out.gl_Position.w = _1255;
    out.m_66.x = _1813;
    out.m_66.y = _1851;
    out.m_66.z = _1853;
    float _1869 = 1.0 / _1867;
    float _1871 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1873 = _1203 + _1871;
    float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1877 = _1201 + _1875;
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1881 = _1205 + _1879;
    out.m_68.x = _1873;
    out.m_68.y = _1877;
    out.m_68.z = _1881;
    out.m_70.z = _1805;
    out.m_70.w = _1255;
    float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1885 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1883);
    float _1887 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1889 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1887);
    float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1893 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1891);
    float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1897 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1895);
    float _1899 = 1.0 / _1885;
    float _1901 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1903 = _1849 * _1901;
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1907 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1905);
    float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1911 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1909);
    float _1913 = 1.0 / _1889;
    float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1917 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1915);
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1921 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1919);
    float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1925 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1923);
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1929 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1927);
    float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1933 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1931);
    float _1935 = 1.0 / _1897;
    float _1937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1939 = -_1903;
    float _1941 = fma(_1899, _1937, _1939);
    float _1943 = precise::clamp(_1941, 0.0, 1.0);
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1947 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1945);
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1951 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1949);
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1955 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1953);
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1959 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1957);
    float _1961 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1963 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1961);
    float _1965 = 1.0 / _1893;
    float _1967 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1969 = -_1903;
    float _1971 = fma(_1913, _1967, _1969);
    float _1973 = precise::clamp(_1971, 0.0, 1.0);
    float _1975 = _1943 + _1973;
    float _1977 = 1.0 / _1907;
    float _1979 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1981 = -_1903;
    float _1983 = fma(_1935, _1979, _1981);
    float _1985 = precise::clamp(_1983, 0.0, 1.0);
    float _1987 = 1.0 / _1911;
    float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1991 = -_1903;
    float _1993 = fma(_1965, _1989, _1991);
    float _1995 = precise::clamp(_1993, 0.0, 1.0);
    float _1997 = _1975 + _1995;
    float _1999 = 1.0 / _1917;
    float _2001 = _1997 + _1985;
    float _2003 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2005 = -_1903;
    float _2007 = fma(_1977, _2003, _2005);
    float _2009 = precise::clamp(_2007, 0.0, 1.0);
    float _2011 = _2001 + _2009;
    float _2013 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2015 = -_1903;
    float _2017 = fma(_1987, _2013, _2015);
    float _2019 = precise::clamp(_2017, 0.0, 1.0);
    float _2021 = 1.0 / _1925;
    float _2023 = _2011 + _2019;
    float _2025 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2027 = -_1903;
    float _2029 = fma(_1999, _2025, _2027);
    float _2031 = precise::clamp(_2029, 0.0, 1.0);
    float _2033 = 1.0 / _1921;
    float _2035 = _2023 + _2031;
    float _2037 = _2023;
    float _2039 = _1873;
    if (!_1863)
    {
        float _2041 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        _2037 = _2041;
    }
    float _2043 = _2037;
    if (!_1863)
    {
        float _2045 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        _1157 = _2045;
    }
    float _2047 = _1157;
    float _2049 = _2047;
    if (!_1863)
    {
        float _2051 = _2043 * 0.15915493667125701904296875;
        _2039 = _2051;
    }
    float _2053 = _2039;
    if (!_1863)
    {
        float _2055 = _2047 * 0.15915493667125701904296875;
        _2049 = _2055;
    }
    float _2057 = _2049;
    float _2059 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2061 = -_1903;
    float _2063 = fma(_2021, _2059, _2061);
    float _2065 = precise::clamp(_2063, 0.0, 1.0);
    float _2067 = 1.0 / _1929;
    float _2069 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2071 = -_1903;
    float _2073 = fma(_2033, _2069, _2071);
    float _2075 = precise::clamp(_2073, 0.0, 1.0);
    float _2077 = _2033;
    float _2079 = _2075;
    if (!_1863)
    {
        float _2081 = _2053 * 6.283185482025146484375;
        float _2083 = cos(_2081);
        _2077 = _2083;
    }
    float _2085 = _2077;
    float _2087 = _2035 + _2075;
    float _2089 = _2087 + _2065;
    float _2091 = _2087;
    if (!_1863)
    {
        float _2093 = _2053 * 6.283185482025146484375;
        float _2095 = sin(_2093);
        _2079 = _2095;
    }
    float _2097 = _2079;
    float _2099 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2101 = -_1903;
    float _2103 = fma(_2067, _2099, _2101);
    float _2105 = precise::clamp(_2103, 0.0, 1.0);
    float _2107 = _2089 + _2105;
    float _2109 = _1255;
    float _2111 = _2097;
    float _2113 = _2107;
    if (!_1863)
    {
        float _2115 = 1.0 / _2085;
        _2109 = _2115;
    }
    float _2117 = _2109;
    float _2119 = _2035;
    if (!_1863)
    {
        float _2121 = _2057 * 6.283185482025146484375;
        float _2123 = cos(_2121);
        _2119 = _2123;
    }
    float _2125 = _2119;
    if (!_1863)
    {
        float _2127 = _2097 * _2117;
        _2091 = _2127;
    }
    float _2129 = _2091;
    float _2131 = 1.0 / _1947;
    float _2133 = _2125;
    if (!_1863)
    {
        float _2135 = _2125 * _2129;
        _2133 = _2135;
    }
    float _2137 = _2133;
    if (!_1863)
    {
        float _2139 = _2057 * 6.283185482025146484375;
        float _2141 = sin(_2139);
        _2111 = _2141;
    }
    float _2143 = _2111;
    float _2145 = _2137;
    float _2147 = _2143;
    if (!_1863)
    {
        float _2149 = 1.0 / _2137;
        _2145 = _2149;
    }
    float _2151 = _2145;
    float _2153 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2155 = -_1903;
    float _2157 = fma(_2131, _2153, _2155);
    float _2159 = precise::clamp(_2157, 0.0, 1.0);
    float _2161 = _2107 + _2159;
    float _2163 = _2161;
    if (!_1863)
    {
        _2113 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2165 = _2113;
    float _2167 = 1.0 / _1951;
    float _2169 = 1.0 / _1955;
    if (!_1863)
    {
        float _2171 = _2143 * _2151;
        _2147 = _2171;
    }
    float _2173 = _2147;
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2177 = _1869 * _2175;
    float _2179 = _2177;
    if (!_1863)
    {
        float _2181 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2183 = fma(_2177, _2173, _2181);
        _2179 = _2183;
    }
    float _2185 = _2179;
    float _2187 = 1.0 / _1933;
    float _2189 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2191 = -_1903;
    float _2193 = fma(_2167, _2189, _2191);
    float _2195 = precise::clamp(_2193, 0.0, 1.0);
    float _2197 = _2161 + _2195;
    if (!_1863)
    {
        float _2199 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2201 = _2165 + _2199;
        _2163 = _2201;
    }
    float _2203 = _2163;
    float _2205 = 1.0 / _1959;
    float _2207 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2209 = -_1903;
    float _2211 = fma(_2169, _2207, _2209);
    float _2213 = precise::clamp(_2211, 0.0, 1.0);
    float _2215 = _2197 + _2213;
    float _2217 = 1.0 / _1963;
    float _2219 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2221 = -_1903;
    float _2223 = fma(_2187, _2219, _2221);
    float _2225 = precise::clamp(_2223, 0.0, 1.0);
    float _2227 = _2215 + _2225;
    float _2229 = _2203;
    if (!_1863)
    {
        float _2231 = 1.0 / _2203;
        _2229 = _2231;
    }
    float _2233 = _2229;
    float _2235 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2237 = -_1903;
    float _2239 = fma(_2205, _2235, _2237);
    float _2241 = precise::clamp(_2239, 0.0, 1.0);
    float _2243 = _2227 + _2241;
    float _2245 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2247 = -_1903;
    float _2249 = fma(_2217, _2245, _2247);
    float _2251 = precise::clamp(_2249, 0.0, 1.0);
    float _2253 = _2217;
    if (_1863)
    {
        _2253 = 1.0;
    }
    float _2255 = _2253;
    float _2257 = _2251 + _2243;
    float _2259 = _2255;
    if (!_1863)
    {
        float _2261 = _2185 * _2233;
        float _2263 = precise::clamp(_2261, 0.0, 1.0);
        _2259 = _2263;
    }
    float _2265 = _2259;
    float _2267 = _2257 * 0.0625;
    float _2269 = _2267 * _2265;
    bool _2271 = _2265 > 0.0;
    bool _2273 = isnan(_2265);
    bool _2275 = _2271 || _2273;
    bool _2277 = isnan(0.0);
    bool _2279 = _2275 || _2277;
    float _2281 = _2269 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2283 = _2281 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_38.x = _2283;
    if (_2279)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_38.x = 0.0;
    float _2285 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2285;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

