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
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_61 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_68 [[user(locn4)]];
    float4 m_74 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2047 = false;
    bool _1057 = false;
    bool _953 = false;
    bool _839 = false;
    bool _673 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2805 = as_type<float>(_109);
        out.gl_Position.z = _2805;
    }
    if (!_97)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = _127;
    if (_123)
    {
        float _131 = float(_93);
        _103 = _131;
    }
    float _133 = _103;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2875 = as_type<float>(_147);
        out.gl_Position.z = _2875;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _149 = in.m_51.x;
    float _151 = in.m_51.y;
    float _153 = in.m_51.z;
    float _155 = in.m_53.x;
    float _157 = in.m_53.y;
    float _159 = in.m_53.z;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = in.m_55.x;
    float _173 = in.m_55.y;
    float _175 = in.m_55.z;
    float _177 = _149 * _149;
    float _179 = _151 * _151;
    float _181 = fma(_155, _155, _177);
    float _183 = fma(_157, _157, _179);
    float _185 = fma(_171, _171, _181);
    float _187 = _153 * _153;
    float _189 = fma(_173, _173, _183);
    float _191 = sqrt(_185);
    float _193 = fma(_159, _159, _187);
    float _195 = fma(_175, _175, _193);
    float _197 = sqrt(_189);
    float _199 = sqrt(_195);
    bool _201 = _191 > 0.0;
    bool _203 = _197 > 0.0;
    float _205 = 0.0;
    float _207 = _185;
    float _209 = _175;
    float _211 = _149;
    if (_201)
    {
        float _213 = rsqrt(_185);
        _205 = _213;
    }
    float _215 = _205;
    float _217 = 0.0;
    if (!_201)
    {
        _217 = 0.0;
    }
    float _219 = _217;
    bool _221 = _199 > 0.0;
    float _223 = in.m_49.x;
    float _225 = in.m_49.y;
    float _227 = in.m_49.z;
    float _229 = 0.0;
    float _231 = _219;
    if (!_201)
    {
        _229 = 0.0;
    }
    float _233 = _229;
    float _235 = 0.0;
    float _237 = 0.0;
    float _239 = _233;
    if (!_203)
    {
        _235 = 0.0;
        _237 = 0.0;
    }
    float _241 = _235;
    float _243 = _237;
    float _245 = 0.0;
    float _247 = _241;
    float _249 = _243;
    if (_203)
    {
        float _251 = rsqrt(_189);
        _245 = _251;
    }
    float _253 = _245;
    float _255 = 0.0;
    if (!_201)
    {
        _255 = 0.0;
    }
    float _257 = _255;
    float _259 = 0.0;
    float _261 = _257;
    if (!_203)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = _195;
    float _267 = _263;
    if (_221)
    {
        float _269 = rsqrt(_195);
        _265 = _269;
    }
    float _271 = _265;
    if (_201)
    {
        float _273 = _215 * _155;
        _231 = _273;
    }
    float _275 = _231;
    if (_201)
    {
        float _277 = _215 * _149;
        _239 = _277;
    }
    float _279 = _239;
    if (_201)
    {
        float _281 = _215 * _171;
        _261 = _281;
    }
    float _283 = _261;
    float _285 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _287 = 0.0;
    float _289 = 0.0;
    float _291 = _285;
    if (!_221)
    {
        _287 = 0.0;
        _289 = 0.0;
    }
    float _293 = _287;
    float _295 = _289;
    float _297 = 0.0;
    float _299 = _295;
    float _301 = _293;
    if (!_221)
    {
        _297 = 0.0;
    }
    float _303 = _297;
    float _305 = _303;
    if (!_169)
    {
        float _307 = _285 * _285;
        float _309 = _307 * 0.5;
        _207 = _309;
    }
    float _311 = _207;
    float _313 = _311;
    if (_203)
    {
        float _315 = _253 * _157;
        _267 = _315;
    }
    float _317 = _267;
    if (_203)
    {
        float _319 = _253 * _151;
        _247 = _319;
    }
    float _321 = _247;
    if (_203)
    {
        float _323 = _253 * _173;
        _249 = _323;
    }
    float _325 = _249;
    if (!_169)
    {
        float _327 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _313 = _327;
    }
    float _329 = _313;
    float _331 = _329;
    if (_221)
    {
        float _333 = _271 * _159;
        _299 = _333;
    }
    float _335 = _299;
    if (_221)
    {
        float _337 = _271 * _153;
        _301 = _337;
    }
    float _339 = _301;
    if (_221)
    {
        float _341 = _271 * _175;
        _305 = _341;
    }
    float _343 = _305;
    bool _345 = !_169;
    if (!_345)
    {
        float _347 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = log2(_347);
        float _351 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _353 = _351 + 1.0;
        float _355 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _357 = _285 * _349;
        float _359 = 1.0 / _353;
        float _361 = _355 * 0.693147182464599609375;
        float _363 = exp2(_357);
        float _365 = 1.0 / _361;
        float _367 = _363 + (-1.0);
        float _369 = -_367;
        float _371 = fma(_369, _365, _285);
        float _373 = _371 * _359;
        float _375 = _373 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _331 = _375;
    }
    float _377 = _331;
    float _379 = _377 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _381 = !_169;
    float _383 = _377;
    if (!_381)
    {
        float _385 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _387 = log2(_385);
        float _389 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _391 = _389 + 1.0;
        float _393 = 1.0 / _391;
        float _395 = _285 * _387;
        float _397 = exp2(_395);
        float _399 = -_397;
        float _401 = _399 + 1.0;
        float _403 = _401 * _393;
        _291 = _403;
    }
    float _405 = _291;
    float _407 = _377 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _409 = _379 * _279;
    float _411 = _379 * _321;
    float _413 = _379 * _339;
    float _415 = 0.0;
    if (!_169)
    {
        float _417 = _127 * _127;
        float _419 = _417 * 0.5;
        _415 = _419;
    }
    float _421 = _415;
    float _423 = fma(_407, _275, _409);
    float _425 = _377 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _427 = fma(_407, _317, _411);
    float _429 = fma(_407, _335, _413);
    if (!_169)
    {
        float _431 = _421 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _383 = _431;
    }
    float _433 = _383;
    bool _435 = !_169;
    float _437 = _433;
    if (!_435)
    {
        float _439 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _441 = log2(_439);
        float _443 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _445 = _443 + 1.0;
        float _447 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _449 = _127 * _441;
        float _451 = 1.0 / _445;
        float _453 = _447 * 0.693147182464599609375;
        float _455 = exp2(_449);
        float _457 = 1.0 / _453;
        float _459 = _455 + (-1.0);
        float _461 = -_459;
        float _463 = fma(_461, _457, _127);
        float _465 = _463 * _451;
        float _467 = _465 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _437 = _467;
    }
    float _469 = _437;
    float _471 = fma(_425, _283, _423);
    float _473 = _469 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _475 = fma(_425, _325, _427);
    float _477 = fma(_425, _343, _429);
    float _479 = _469 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _481 = _473 * _321;
    float _483 = _469 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _485 = _473 * _279;
    float _487 = _473 * _339;
    float _489 = fma(_479, _317, _481);
    float _491 = fma(_405, _225, _475);
    float _493 = fma(_479, _275, _485);
    float _495 = fma(_479, _335, _487);
    float _497 = fma(_483, _325, _489);
    float _499 = _481;
    if (!_169)
    {
        _499 = _127;
    }
    float _501 = _499;
    bool _503 = !_169;
    float _505 = _501;
    if (!_503)
    {
        float _507 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _509 = log2(_507);
        float _511 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _513 = _511 + 1.0;
        float _515 = 1.0 / _513;
        float _517 = _127 * _509;
        float _519 = exp2(_517);
        float _521 = -_519;
        float _523 = _521 + 1.0;
        float _525 = _523 * _515;
        _505 = _525;
    }
    float _527 = _505;
    float _529 = fma(_483, _283, _493);
    float _531 = fma(_527, _225, _497);
    float _533 = fma(_483, _343, _495);
    float _535 = fma(_405, _223, _471);
    float _537 = fma(_527, _223, _529);
    float _539 = -_531;
    float _541 = _491 + _539;
    float _543 = fma(_405, _227, _477);
    float _545 = fma(_527, _227, _533);
    float _547 = -_537;
    float _549 = _535 + _547;
    float _551 = _541 * _541;
    float _553 = in.m_57.w;
    float _555 = -_545;
    float _557 = _543 + _555;
    float _559 = _541 * _173;
    float _561 = fma(_549, _549, _551);
    float _563 = _541 * _157;
    float _565 = _541 * _151;
    float _567 = fma(_549, _171, _559);
    float _569 = fma(_557, _557, _561);
    float _571 = fma(_549, _155, _563);
    float _573 = in.m_44.x;
    float _575 = in.m_44.y;
    float _577 = in.m_44.z;
    float _579 = fma(_549, _149, _565);
    float _581 = fma(_557, _159, _571);
    float _583 = sqrt(_569);
    float _585 = fma(_557, _153, _579);
    bool _587 = _583 >= 9.9999999747524270787835121154785e-07;
    bool _589 = isnan(_583);
    bool _591 = _587 || _589;
    bool _593 = isnan(9.9999999747524270787835121154785e-07);
    bool _595 = _591 || _593;
    float _597 = fma(_557, _175, _567);
    float _599 = fma(_535, _553, _573);
    float _601 = fma(_491, _553, _575);
    float _603 = fma(_543, _553, _577);
    float _605 = _597;
    float _607 = _581;
    float _609 = _585;
    float _611 = _585;
    float _613 = _581;
    float _615 = _597;
    if (!_595)
    {
        bool _617 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _619 = !_617;
        if (!_619)
        {
            float _621 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _623 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _625 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _627 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[16].x, _621);
            float _629 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[16].x, _623);
            float _631 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[16].x, _625);
            float _633 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[16].z, _627);
            float _635 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[16].z, _629);
            float _637 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[16].z, _631);
            float _639 = _633 * _151;
            float _641 = _633 * _157;
            float _643 = _633 * _173;
            float _645 = fma(_635, _149, _639);
            float _647 = fma(_635, _155, _641);
            float _649 = fma(_635, _171, _643);
            float _651 = fma(_637, _153, _645);
            float _653 = fma(_637, _159, _647);
            float _655 = fma(_637, _175, _649);
            float _657 = _651 * _651;
            float _659 = fma(_653, _653, _657);
            float _661 = fma(_655, _655, _659);
            float _663 = rsqrt(_661);
            float _665 = _663 * 9.9999999747524270787835121154785e-07;
            float _667 = _653 * _665;
            float _669 = _651 * _665;
            float _671 = _655 * _665;
            _611 = _669;
            _613 = _667;
            _615 = _671;
            _673 = true;
        }
        else
        {
            float _675 = _225 * _225;
            float _677 = fma(_223, _223, _675);
            float _679 = fma(_227, _227, _677);
            float _681 = sqrt(_679);
            bool _683 = _681 >= 9.9999999747524270787835121154785e-07;
            bool _685 = isnan(_681);
            bool _687 = _683 || _685;
            bool _689 = isnan(9.9999999747524270787835121154785e-07);
            bool _691 = _687 || _689;
            if (!_691)
            {
                float _693 = _575 * _575;
                float _695 = fma(_573, _573, _693);
                float _697 = fma(_577, _577, _695);
                float _699 = sqrt(_697);
                bool _701 = _699 >= 9.9999999747524270787835121154785e-07;
                bool _703 = isnan(_699);
                bool _705 = _701 || _703;
                bool _707 = isnan(9.9999999747524270787835121154785e-07);
                bool _709 = _705 || _707;
                float _711 = _189;
                if (!_709)
                {
                    float _713 = rsqrt(_189);
                    _711 = _713;
                }
                float _715 = _711;
                if (!_709)
                {
                    float _717 = _715 * 9.9999999747524270787835121154785e-07;
                    _605 = _717;
                }
                float _719 = _605;
                float _721 = _719;
                if (!_709)
                {
                    float _723 = _157 * _719;
                    _607 = _723;
                }
                float _725 = _607;
                _613 = _725;
                if (!_709)
                {
                    float _727 = _151 * _719;
                    _609 = _727;
                }
                float _729 = _609;
                _611 = _729;
                if (!_709)
                {
                    float _731 = _173 * _719;
                    _721 = _731;
                }
                float _733 = _721;
                bool _735 = !_709;
                _615 = _733;
                _673 = _735;
                if (!_673)
                {
                    float _737 = _151 * _575;
                    float _739 = _157 * _575;
                    float _741 = _173 * _575;
                    float _743 = fma(_149, _573, _737);
                    float _745 = fma(_155, _573, _739);
                    float _747 = fma(_171, _573, _741);
                    float _749 = fma(_153, _577, _743);
                    float _751 = fma(_159, _577, _745);
                    float _753 = fma(_175, _577, _747);
                    float _755 = _749 * _749;
                    float _757 = fma(_751, _751, _755);
                    float _759 = fma(_753, _753, _757);
                    float _761 = rsqrt(_759);
                    float _763 = _761 * 9.9999999747524270787835121154785e-07;
                    float _765 = _751 * _763;
                    float _767 = _749 * _763;
                    float _769 = _753 * _763;
                    _611 = _767;
                    _613 = _765;
                    _615 = _769;
                    _673 = true;
                }
            }
            else
            {
                float _771 = _151 * _225;
                float _773 = _157 * _225;
                float _775 = _173 * _225;
                float _777 = fma(_149, _223, _771);
                float _779 = fma(_155, _223, _773);
                float _781 = fma(_171, _223, _775);
                float _783 = fma(_153, _227, _777);
                float _785 = fma(_159, _227, _779);
                float _787 = fma(_175, _227, _781);
                float _789 = _783 * _783;
                float _791 = fma(_785, _785, _789);
                float _793 = fma(_787, _787, _791);
                float _795 = rsqrt(_793);
                float _797 = _795 * 9.9999999747524270787835121154785e-07;
                float _799 = _785 * _797;
                float _801 = _783 * _797;
                float _803 = _787 * _797;
                _611 = _801;
                _613 = _799;
                _615 = _803;
            }
        }
    }
    _673 = false;
    float _805 = _611;
    float _807 = _613;
    float _809 = _615;
    bool _811 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    bool _813 = !_811;
    float _815 = _805;
    float _817 = _807;
    float _819 = _809;
    float _837;
    if (!_813)
    {
        float _821 = in.m_59.x;
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _825 = _821 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _829 = _827 * _823;
        float _831 = floor(_829);
        float _833 = -_831;
        float _835 = _829 + _833;
        _837 = _835;
        _839 = true;
    }
    else
    {
        float _841 = float(_93);
        float _843 = 1.0 / _841;
        float _845 = _127 * _843;
        _837 = _845;
    }
    _839 = false;
    float _847 = _837;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _851 = _847 + _849;
    bool _853 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _855 = isnan(_847);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _865;
    bool _869 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _871 = isnan(_847);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = -_863;
    float _883 = _881 + 1.0;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _885;
    float _889 = 1.0 / _867;
    bool _891 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _893 = _879 * _883;
    float _895 = -_879;
    float _897 = _895 + 1.0;
    float _899 = _851 * _889;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _901;
    float _905 = fma(_887, _899, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _907;
    float _911 = fma(_903, _899, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _913 = _905 * _893;
    float _915 = fma(_909, _899, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _917 = _911 * _893;
    float _919 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[107].x, _913);
    float _921 = _915 * _893;
    float _923 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[107].z, _917);
    float _925 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[108].x, _919);
    float _927 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[107].y, _921);
    float _929 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[108].z, _923);
    float _931 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[108].y, _927);
    bool _933 = !_891;
    float _951;
    if (!_933)
    {
        float _935 = in.m_59.x;
        float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _939 = _935 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _943 = _941 * _937;
        float _945 = floor(_943);
        float _947 = -_945;
        float _949 = _943 + _947;
        _951 = _949;
        _953 = true;
    }
    else
    {
        float _955 = float(_93);
        float _957 = 1.0 / _955;
        float _959 = _127 * _957;
        _951 = _959;
    }
    _953 = false;
    float _961 = _951;
    bool _963 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _965 = isnan(_961);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _979 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _981 = isnan(_961);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _987 = _983 || _985;
    float _989 = float(_987);
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _991;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _997 = _961 + _995;
    float _999 = -_973;
    float _1001 = _999 + 1.0;
    bool _1003 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1005 = 1.0 / _977;
    float _1007 = _989 * _1001;
    float _1009 = -_989;
    float _1011 = _1009 + 1.0;
    float _1013 = _929 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1015 = _993 * _1005;
    float _1017 = _931 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1019 = fma(_1015, _997, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1021 = _925 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1023 = _1019 * _1007;
    float _1025 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1023);
    float _1027 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1025);
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1031 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1033 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1035 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _1029;
    out.m_61.y = _1031;
    out.m_61.z = _1033;
    out.m_61.w = _1035;
    bool _1037 = !_1003;
    float _1055;
    if (!_1037)
    {
        float _1039 = in.m_59.x;
        float _1041 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1043 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _1047 = _1045 * _1041;
        float _1049 = floor(_1047);
        float _1051 = -_1049;
        float _1053 = _1047 + _1051;
        _1055 = _1053;
        _1057 = true;
    }
    else
    {
        float _1059 = float(_93);
        float _1061 = 1.0 / _1059;
        float _1063 = _127 * _1061;
        _1055 = _1063;
    }
    _1057 = false;
    float _1065 = _1055;
    float _1067 = in.m_59.x;
    float _1069 = in.m_59.y;
    float _1071 = in.m_59.z;
    float _1073 = in.m_59.w;
    float _1075 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1077 = log2(_1075);
    float _1079 = _601 * _151;
    float _1081 = as_type<float>(int(gl_VertexIndex));
    float _1083 = fma(_599, _149, _1079);
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1085;
    float _1089 = _127 * _1077;
    float _1091 = 1.0 / _1087;
    float _1093 = _1071 * 2.0;
    float _1095 = _1067 * 2.0;
    float _1097 = _1069 * 2.0;
    int _1099 = as_type<int>(_1081) & 1;
    bool _1101 = _1099 != 0;
    int _1103 = as_type<int>(_1081) & 2;
    bool _1105 = _1103 != 0;
    float _1107 = floor(_1095);
    float _1109 = _601 * _157;
    float _1111 = _601 * _173;
    float _1113 = floor(_1093);
    float _1115 = floor(_1097);
    bool _1117 = _1107 > 0.0;
    bool _1119 = _1107 >= 0.0;
    bool _1121 = isnan(_1107);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan(0.0);
    bool _1127 = _1123 || _1125;
    int _1129 = _1127 ? 0 : 1;
    float _1131 = exp2(_1089);
    bool _1133 = _1113 > 0.0;
    float _1135 = fma(_599, _171, _1111);
    bool _1137 = _1113 >= 0.0;
    bool _1139 = isnan(_1113);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan(0.0);
    bool _1145 = _1141 || _1143;
    float _1147 = fma(_599, _155, _1109);
    int _1149 = _1145 ? 0 : 1;
    float _1151 = fma(_603, _159, _1147);
    bool _1153 = _1115 >= 0.0;
    bool _1155 = isnan(_1115);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan(0.0);
    bool _1161 = _1157 || _1159;
    int _1163 = ~_1149;
    int _1165 = _1163 + 1;
    int _1167 = _1165 + 1;
    float _1169 = _1151 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1171 = ~_1129;
    int _1173 = _1171 + 1;
    int _1175 = _1173 + 1;
    int _1177 = _1167;
    int _1179 = _1175;
    if (!_1133)
    {
        int _1181 = ~_1149;
        int _1183 = _1181 + 1;
        _1177 = _1183;
    }
    int _1185 = _1177;
    float _1187 = -_1131;
    float _1189 = _1187 + 1.0;
    if (!_1117)
    {
        int _1191 = ~_1129;
        int _1193 = _1191 + 1;
        _1179 = _1193;
    }
    int _1195 = _1179;
    float _1197 = _1071 + _1067;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1201 = _1199 != 0;
    int _1203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1205 = _1203 != 0;
    int _1207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1209 = _1207 != 0;
    float _1211 = fma(_603, _153, _1083);
    float _1213 = fma(_603, _175, _1135);
    float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1217 = _1169 + _1215;
    float _1219 = _1211 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1221 = !_1205;
    int _1223 = _1221 ? 0 : 1;
    float _1225 = _1213 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1227 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1229 = isnan(0.0);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1235 = _1231 || _1233;
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1239 = _1219 + _1237;
    bool _1241 = !_1201;
    int _1243 = _1241 ? 0 : 1;
    float _1245 = _1197 + (-1.0);
    float _1247 = _1235 ? _1189 : 0.0;
    float _1249 = _1239 * _1239;
    bool _1251 = _1115 > 0.0;
    float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1255 = _1225 + _1253;
    bool _1257 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1259 = isnan(1.0);
    bool _1261 = _1257 || _1259;
    bool _1263 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1265 = _1261 || _1263;
    float _1267 = fma(_1217, _1217, _1249);
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1271 = 1.0 + _1269;
    float _1273 = _1069 + _1071;
    int _1275 = _1161 ? 0 : 1;
    float _1277 = fma(_1255, _1255, _1267);
    float _1279 = 1.0 / _1271;
    bool _1281 = _1073 > 0.5;
    float _1283 = _1069 + _1067;
    float _1285 = _1273 + (-1.0);
    int _1287 = abs(_1243);
    float _1289 = _1283 + (-1.0);
    float _1291 = fma(_1285, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1293 = rsqrt(_1277);
    float _1295 = _805 * _805;
    float _1297 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1299 = abs(_1223);
    float _1301 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1303 = fma(_807, _807, _1295);
    float _1305 = float(_1185);
    float _1307 = _1067 + (-0.5);
    float _1309 = _1247 * _1279;
    float _1311 = fma(_809, _809, _1303);
    int _1313 = ~_1275;
    int _1315 = _1313 + 1;
    int _1317 = _1315 + 1;
    float _1319 = rsqrt(_1311);
    int _1321 = _1317;
    float _1323 = _1311;
    if (!_1251)
    {
        int _1325 = ~_1275;
        int _1327 = _1325 + 1;
        _1321 = _1327;
    }
    int _1329 = _1321;
    float _1331 = float(_1287);
    float _1333 = _1239 * _1293;
    float _1335 = float(_1299);
    float _1337 = _1217 * _1293;
    float _1339 = float(_1195);
    float _1341 = -_1333;
    float _1343 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1239);
    float _1345 = _1331 * _1305;
    float _1347 = -_1337;
    float _1349 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1217);
    bool _1351 = !_1209;
    int _1353 = _1351 ? 0 : 1;
    float _1355 = _1335 * _1339;
    float _1357 = _1343 * _1343;
    float _1359 = in.m_66.x;
    float _1361 = in.m_66.y;
    float _1363 = in.m_66.z;
    int _1365 = abs(_1353);
    float _1367 = _1319 * _809;
    float _1369 = fma(_1349, _1349, _1357);
    float _1371 = _1319 * _807;
    float _1373 = _1319 * _805;
    float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1377 = _1367 * _1375;
    float _1379 = _1345 * (-2.0);
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1383 = _1371 * _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1387 = _1373 * _1385;
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1391 = -_1377;
    float _1393 = fma(_1371, _1389, _1391);
    float _1395 = _1255 * _1293;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1399 = -_1387;
    float _1401 = fma(_1367, _1397, _1399);
    float _1403 = _1393 * _1393;
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1407 = -_1383;
    float _1409 = fma(_1373, _1405, _1407);
    float _1411 = float(_1365);
    float _1413 = -_1395;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1255);
    float _1417 = fma(_1401, _1401, _1403);
    float _1419 = fma(_1415, _1415, _1369);
    float _1421 = fma(_1409, _1409, _1417);
    float _1423 = float(_1329);
    float _1425 = fma(_1379, _1359, _1359);
    float _1427 = fma(_1297, _1379, _1297);
    float _1429 = _1355 * (-2.0);
    bool _1431 = !_1265;
    float _1433 = _1431 ? _127 : _1309;
    float _1435 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1425);
    float _1437 = _1411 * _1423;
    float _1439 = _1069 + (-0.5);
    float _1441 = fma(_1429, _1361, _1361);
    float _1443 = fma(_1433, _1427, _1435);
    float _1445 = _1437 * (-2.0);
    float _1447 = fma(_1291, _1429, _1291);
    float _1449 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1441);
    float _1451 = sqrt(_1419);
    float _1453 = _1443 * 0.15915493667125701904296875;
    float _1455 = fma(_1445, _1363, _1363);
    float _1457 = fma(_1433, _1447, _1449);
    float _1459 = _1071 + (-0.5);
    bool _1461 = !_1101;
    float _1463 = _1461 ? (-0.5) : 0.5;
    float _1465 = rsqrt(_1421);
    float _1467 = fma(_1301, _1445, _1301);
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1473 = _1471 != 0;
    float _1475 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1455);
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1479 = _1477 != 0;
    float _1481 = -_1469;
    float _1483 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[77].x, _1481);
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1487 = _1485 != 0;
    float _1489 = fma(_1433, _1467, _1475);
    int _1491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1493 = _1491 != 0;
    float _1495 = _1457 * 0.15915493667125701904296875;
    bool _1497 = !_1105;
    float _1499 = _1497 ? (-0.5) : 0.5;
    float _1501 = _1489 * 0.15915493667125701904296875;
    bool _1503 = _1071 > 0.5;
    float _1505 = _1495 * 6.283185482025146484375;
    float _1507 = sin(_1505);
    float _1509 = in.m_57.x;
    float _1511 = in.m_57.y;
    float _1513 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1515 = -_1499;
    int _1517 = _1281 ? as_type<int>(_1515) : as_type<int>(_1499);
    float _1519 = _1401 * _1465;
    bool _1521 = _1069 > 0.5;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1525 = _1495 * 6.283185482025146484375;
    float _1527 = cos(_1525);
    float _1529 = _1393 * _1465;
    float _1531 = _1409 * _1465;
    float _1533 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1499);
    bool _1535 = !_1493;
    float _1537 = _1535 ? _1499 : as_type<float>(_1517);
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1541 = _1367 * _1519;
    float _1543 = _1453 * 6.283185482025146484375;
    float _1545 = sin(_1543);
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1549 = _1293 * _1451;
    float _1551 = fma(_1513, -2.0, _1539);
    float _1553 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1547);
    float _1555 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1551);
    float _1557 = _1453 * 6.283185482025146484375;
    float _1559 = cos(_1557);
    float _1561 = _1509 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1563 = _1511 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1565 = _1561 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1567 = _1501 * 6.283185482025146484375;
    float _1569 = cos(_1567);
    float _1571 = -_1499;
    int _1573 = _1521 ? as_type<int>(_1571) : as_type<int>(_1499);
    float _1575 = _1545 * _1507;
    bool _1577 = _1067 > 0.5;
    float _1579 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1523);
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1583 = _1065 + _1581;
    float _1585 = _1545 * _1527;
    float _1587 = _1565 * _1549;
    float _1589 = _1501 * 6.283185482025146484375;
    float _1591 = sin(_1589);
    float _1593 = _1583 * _1091;
    float _1595 = _1559 * _1527;
    bool _1597 = !_1479;
    float _1599 = _1597 ? _1499 : as_type<float>(_1573);
    float _1601 = _1545 * _1569;
    float _1603 = _1559 * _1507;
    float _1605 = _1527 * _1569;
    float _1607 = _1559 * _1569;
    float _1609 = _1507 * _1569;
    float _1611 = fma(_1591, _1595, _1575);
    float _1613 = fma(_1591, _1575, _1595);
    float _1615 = _1563 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1617 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1463);
    float _1619 = -_1603;
    float _1621 = fma(_1591, _1585, _1619);
    float _1623 = _1607 * _1367;
    float _1625 = _1615 * _1549;
    float _1627 = _1587 * _1617;
    float _1629 = _1607 * _1371;
    float _1631 = _1373 * _1531;
    float _1633 = -_1585;
    float _1635 = fma(_1591, _1603, _1633);
    float _1637 = _1371 * _1529;
    float _1639 = -_1591;
    float _1641 = fma(_1639, _1519, _1629);
    float _1643 = -_1631;
    float _1645 = fma(_1367, _1529, _1643);
    float _1647 = -_1591;
    float _1649 = fma(_1647, _1531, _1623);
    float _1651 = _1611 * _1371;
    float _1653 = _1635 * _1371;
    float _1655 = _1611 * _1367;
    float _1657 = -_1637;
    float _1659 = fma(_1373, _1519, _1657);
    float _1661 = _1625 * _1533;
    float _1663 = fma(_1605, _1519, _1651);
    float _1665 = fma(_1601, _1645, _1641);
    float _1667 = fma(_1609, _1519, _1653);
    float _1669 = fma(_1605, _1531, _1655);
    float _1671 = _1635 * _1367;
    float _1673 = fma(_1601, _1659, _1649);
    float _1675 = _1661 * _1665;
    float _1677 = fma(_1621, _1645, _1663);
    float _1679 = fma(_1621, _1659, _1669);
    float _1681 = fma(_1609, _1531, _1671);
    float _1683 = _1661 * _1673;
    float _1685 = fma(_1613, _1645, _1667);
    float _1687 = fma(_1627, _1677, _1675);
    float _1689 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1691 = _1689 * 0.5;
    float _1693 = fma(_1613, _1659, _1681);
    float _1695 = fma(_1627, _1679, _1683);
    float _1697 = fma(_1691, _1685, _1687);
    float _1699 = -_1463;
    int _1701 = _1577 ? as_type<int>(_1699) : as_type<int>(_1463);
    float _1703 = fma(_1691, _1693, _1695);
    float _1705 = _1607 * _1373;
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1709 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1707;
    float _1711 = _1169 + _1697;
    float _1713 = _1225 + _1703;
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1717 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1715;
    float _1719 = fma(_1709, _1593, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1721 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1723 = _1711 + _1721;
    float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1727 = _1713 + _1725;
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1729;
    bool _1733 = !_1473;
    float _1735 = _1733 ? _1463 : as_type<float>(_1701);
    float _1737 = _1723 * _1723;
    float _1739 = _1727 * _1727;
    float _1741 = -_1541;
    float _1743 = fma(_1371, _1531, _1741);
    float _1745 = -_1591;
    float _1747 = fma(_1745, _1529, _1705);
    float _1749 = _1611 * _1373;
    float _1751 = _1737 + _1739;
    float _1753 = fma(_1717, _1593, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1755 = fma(_1731, _1593, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1759 = _1635 * _1373;
    float _1761 = fma(_1605, _1529, _1749);
    float _1763 = fma(_1601, _1743, _1747);
    bool _1765 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1767 = isnan(_1065);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1773 = _1769 || _1771;
    float _1775 = float(_1773);
    float _1777 = fma(_1609, _1529, _1759);
    float _1779 = fma(_1621, _1743, _1761);
    float _1781 = _1661 * _1763;
    float _1783 = sqrt(_1751);
    bool _1785 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1787 = isnan(_1065);
    bool _1789 = _1785 || _1787;
    bool _1791 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1793 = _1789 || _1791;
    float _1795 = float(_1793);
    float _1797 = -_1775;
    float _1799 = _1797 + 1.0;
    float _1801 = fma(_1613, _1743, _1777);
    float _1803 = fma(_1627, _1779, _1781);
    float _1805 = -_127;
    float _1807 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1483);
    float _1809 = _1795 * _1799;
    float _1811 = -_1463;
    int _1813 = _1503 ? as_type<int>(_1811) : as_type<int>(_1463);
    float _1815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1817 = fma(_1691, _1801, _1803);
    float _1819 = _1719 * _1809;
    float _1821 = _1753 * _1809;
    float _1823 = _1755 * _1809;
    float _1825 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1827 = _1599 + (-0.5);
    float _1829 = _1219 + _1817;
    bool _1831 = _1783 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1835 = _1735 + 0.5;
    float _1837 = -_1825;
    float _1839 = -_1555;
    float _1841 = fma(_1837, _1827, _1839);
    bool _1843 = !_1487;
    float _1845 = _1843 ? _1463 : as_type<float>(_1813);
    float _1847 = -_1795;
    float _1849 = _1847 + 1.0;
    float _1851 = _1815 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1853 = fma(_1851, _1835, _1807);
    float _1855 = _1827;
    float _1857 = _1737;
    float _1859 = _1739;
    float _1861 = _1711;
    float _1863 = _1713;
    if (!_1831)
    {
        _1855 = _1829;
    }
    float _1865 = _1855;
    bool _1867 = !_1831;
    float _1869 = _1865;
    if (!_1867)
    {
        float _1871 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1875 = _1783 + _1873;
        float _1877 = rsqrt(_1751);
        float _1879 = _1875 * _1871;
        float _1881 = _1829 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1883 = _1879 * 0.15915493667125701904296875;
        float _1885 = _1883 * 6.283185482025146484375;
        float _1887 = sin(_1885);
        float _1889 = _1883 * 6.283185482025146484375;
        float _1891 = cos(_1889);
        float _1893 = fma(_1887, _1881, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1895 = _1877 * _1893;
        float _1897 = _1891 + (-1.0);
        float _1899 = fma(_1723, _1895, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1901 = fma(_1727, _1895, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1903 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1907 = _1899 + _1905;
        float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1911 = _1901 + _1909;
        float _1913 = fma(_1829, _1891, _1903);
        float _1915 = _1907 * _1907;
        float _1917 = _1911 * _1911;
        _1869 = _1913;
        _1857 = _1915;
        _1859 = _1917;
        _1861 = _1899;
        _1863 = _1901;
    }
    float _1919 = _1869;
    float _1921 = _1857;
    float _1923 = _1859;
    float _1925 = _1861;
    float _1927 = _1863;
    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1931 = _1919 + _1929;
    float _1933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1935 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1819);
    float _1937 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1821);
    float _1939 = fma(_1931, _1931, _1921);
    float _1941 = _1845 + 0.5;
    float _1943 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1823);
    float _1945 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1579);
    float _1947 = _1939 + _1923;
    float _1949 = -_1537;
    float _1951 = _1949 + 0.5;
    float _1953 = _1941 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1955 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1935);
    float _1957 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1937);
    float _1959 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1943);
    float _1961 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1553);
    float _1963 = sqrt(_1947);
    float _1965 = -_1945;
    float _1967 = _1965 + 1.0;
    float _1969 = _1951 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1971 = _1953 * _1833;
    float _1973 = -_1961;
    float _1975 = _1973 + 1.0;
    float _1977 = _1955 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1979 = _1957 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1981 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1983 = -_1967;
    float _1985 = fma(_1735, _1983, _1853);
    float _1987 = fma(_1599, _1975, _1841);
    float _1989 = _1969 * _1933;
    float _1991 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1993 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = _1979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1997 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _1985;
    out.m_68.y = _1987;
    out.m_68.z = _1971;
    out.m_68.w = _1989;
    bool _1999 = _1963 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2001 = isnan(_1963);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2007 = _2003 || _2005;
    out.m_70.x = _1993;
    out.m_70.y = _1995;
    out.m_70.z = _1997;
    out.m_70.w = _1991;
    float _2009 = _1955;
    float _2011 = _1991;
    if (!_2007)
    {
        _2009 = 1.0;
    }
    float _2013 = _2009;
    bool _2015 = !_2007;
    float _2017 = _2013;
    if (!_2015)
    {
        bool _2019 = _1963 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2021 = isnan(_1963);
        bool _2023 = _2019 || _2021;
        bool _2025 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2027 = _2023 || _2025;
        if (!_2027)
        {
            float _2029 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2031 = _1963 + _2029;
            float _2033 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2035 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2033;
            float _2037 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2039 = _2037 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2041 = 1.0 / _2035;
            float _2043 = _2031 * _2041;
            float _2045 = fma(_2043, _2039, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2017 = _2045;
            _2047 = true;
        }
        else
        {
            bool _2049 = _1963 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2051 = isnan(_1963);
            bool _2053 = _2049 || _2051;
            bool _2055 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2057 = _2053 || _2055;
            if (!_2057)
            {
                float _2059 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2061 = _1963 + _2059;
                float _2063 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2065 = _2063 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2067 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2069 = _2067 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2071 = 1.0 / _2065;
                float _2073 = _2061 * _2071;
                float _2075 = fma(_2073, _2069, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2017 = _2075;
                _2047 = true;
            }
            else
            {
                _2017 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2047 = false;
    float _2077 = _2017;
    float _2079 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2081 = _1919 + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2085 = _1925 + _2083;
    float _2087 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2089 = _1927 + _2087;
    float _2091 = fma(_2081, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2093 = fma(_2085, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2095 = fma(_2089, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2097 = -_1219;
    float _2099 = _2097 + _2091;
    float _2101 = -_1169;
    float _2103 = _2101 + _2093;
    float _2105 = -_1225;
    float _2107 = _2105 + _2095;
    float _2109 = _2099 * _2099;
    float _2111 = fma(_2103, _2103, _2109);
    float _2113 = fma(_2107, _2107, _2111);
    float _2115 = sqrt(_2113);
    bool _2117 = _2115 > 0.0;
    bool _2119 = !_2117;
    float _2121 = _2115;
    float _2123 = _2091;
    float _2125 = _2093;
    float _2127 = _2095;
    if (!_2119)
    {
        bool _2129 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2131 = _1995;
        if (_2129)
        {
            float _2133 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2131 = _2133;
        }
        float _2135 = _2131;
        float _2137 = _2135;
        if (_2129)
        {
            float _2139 = _2135 * _807;
            _2121 = _2139;
        }
        float _2141 = _2121;
        float _2143 = _2141;
        if (_2129)
        {
            float _2145 = _2135 * _805;
            _2011 = _2145;
        }
        float _2147 = _2011;
        float _2149 = _2147;
        if (_2129)
        {
            float _2151 = _2135 * _809;
            _2137 = _2151;
        }
        float _2153 = _2137;
        float _2155 = _2153;
        if (!_2129)
        {
            float _2157 = _127 + 1.0;
            if (!_169)
            {
                float _2159 = _2157 * _2157;
                float _2161 = _2159 * 0.5;
                _129 = _2161;
            }
            float _2163 = _129;
            float _2165 = _2163;
            if (!_169)
            {
                float _2167 = _2163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2165 = _2167;
            }
            float _2169 = _2165;
            bool _2171 = !_169;
            float _2173 = _2169;
            if (!_2171)
            {
                float _2175 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2177 = log2(_2175);
                float _2179 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2181 = _2179 + 1.0;
                float _2183 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2185 = _2177 * _2157;
                float _2187 = 1.0 / _2181;
                float _2189 = _2183 * 0.693147182464599609375;
                float _2191 = exp2(_2185);
                float _2193 = 1.0 / _2189;
                float _2195 = _2191 + (-1.0);
                float _2197 = -_2195;
                float _2199 = fma(_2197, _2193, _2157);
                float _2201 = _2199 * _2187;
                float _2203 = _2201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2173 = _2203;
            }
            float _2205 = _2173;
            float _2207 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2209 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2211 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2213 = _2205;
            if (!_169)
            {
                _2213 = _2157;
            }
            float _2215 = _2213;
            float _2217 = _2207 * _321;
            float _2219 = _2207 * _279;
            float _2221 = _2207 * _339;
            float _2223 = fma(_2209, _317, _2217);
            float _2225 = fma(_2209, _275, _2219);
            float _2227 = fma(_2211, _325, _2223);
            bool _2229 = !_169;
            float _2231 = _2215;
            if (!_2229)
            {
                float _2233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2235 = log2(_2233);
                float _2237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2239 = _2237 + 1.0;
                float _2241 = 1.0 / _2239;
                float _2243 = _2235 * _2157;
                float _2245 = exp2(_2243);
                float _2247 = -_2245;
                float _2249 = _2247 + 1.0;
                float _2251 = _2249 * _2241;
                _2231 = _2251;
            }
            float _2253 = _2231;
            float _2255 = fma(_2209, _335, _2221);
            float _2257 = fma(_2211, _283, _2225);
            float _2259 = fma(_2253, _225, _2227);
            float _2261 = fma(_2211, _343, _2255);
            float _2263 = fma(_2253, _223, _2257);
            float _2265 = -_531;
            float _2267 = _2265 + _2259;
            float _2269 = fma(_2253, _227, _2261);
            float _2271 = -_537;
            float _2273 = _2271 + _2263;
            float _2275 = _2267 * _151;
            float _2277 = _2267 * _157;
            float _2279 = -_545;
            float _2281 = _2279 + _2269;
            float _2283 = _2267 * _173;
            float _2285 = fma(_2273, _149, _2275);
            float _2287 = fma(_2273, _155, _2277);
            float _2289 = fma(_2273, _171, _2283);
            float _2291 = fma(_2281, _153, _2285);
            float _2293 = fma(_2281, _159, _2287);
            float _2295 = fma(_2281, _175, _2289);
            float _2297 = _2291 * _2291;
            float _2299 = fma(_2293, _2293, _2297);
            float _2301 = fma(_2295, _2295, _2299);
            _1323 = _2301;
            _815 = _2291;
            _817 = _2293;
            _819 = _2295;
            _2143 = _2293;
            _2149 = _2291;
            _2155 = _2295;
        }
        float _2303 = _1323;
        float _2305 = _815;
        float _2307 = _817;
        float _2309 = _819;
        float _2311 = _2143;
        float _2313 = _2149;
        float _2315 = _2155;
        float _2317 = sqrt(_2303);
        float _2319 = rsqrt(_2113);
        bool _2321 = _2317 > 0.0;
        float _2323 = _2103 * _2319;
        float _2325 = _2099 * _2319;
        float _2327 = _2107 * _2319;
        bool _2329 = !_2321;
        if (!_2329)
        {
            float _2331 = rsqrt(_2303);
            float _2333 = _2331 * _2305;
            float _2335 = _2331 * _2307;
            float _2337 = _2331 * _2309;
            float _2339 = _2325 * _2333;
            float _2341 = fma(_2323, _2335, _2339);
            float _2343 = fma(_2327, _2337, _2341);
            float _2345 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2347 = fma(_2311, _2345, _2093);
            float _2349 = fma(_2313, _2345, _2091);
            float _2351 = fma(_2315, _2345, _2095);
            _2123 = _2349;
            _2125 = _2347;
            _2127 = _2351;
        }
    }
    float _2353 = _2123;
    float _2355 = _2125;
    float _2357 = _2127;
    float _2359 = -_1333;
    float _2361 = fma(_2359, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2353);
    float _2363 = -_1337;
    float _2365 = fma(_2363, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2355);
    float _2367 = -_1395;
    float _2369 = fma(_2367, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2357);
    float _2371 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2373 = _2361 + _2371;
    float _2375 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2377 = _2365 + _2375;
    float _2379 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2381 = _2369 + _2379;
    float _2383 = _2373 * _2373;
    float _2385 = fma(_2377, _2377, _2383);
    float _2387 = fma(_2381, _2381, _2385);
    float _2389 = rsqrt(_2387);
    float _2391 = sqrt(_2387);
    float _2393 = _2389 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2395 = _2377 * _2393;
    float _2397 = _2381 * _2393;
    float _2399 = _2395 * _2395;
    float _2401 = _2397 * _2397;
    float _2403 = _2399 + _2401;
    float _2405 = sqrt(_2403);
    bool _2407 = _2405 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2411 = _2405 + _2409;
    float _2413 = _2389;
    float _2415 = _2403;
    float _2417 = _2411;
    float _2419 = _2373;
    if (_2407)
    {
        float _2421 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2413 = _2421;
    }
    float _2423 = _2413;
    if (_2407)
    {
        float _2425 = rsqrt(_2403);
        _2415 = _2425;
    }
    float _2427 = _2415;
    float _2429 = _2427;
    if (_2407)
    {
        float _2431 = _2411 * _2423;
        _2417 = _2431;
    }
    float _2433 = _2417;
    if (_2407)
    {
        float _2435 = _2433 * 0.15915493667125701904296875;
        _209 = _2435;
    }
    float _2437 = _209;
    float _2439 = _2381;
    float _2441 = _2437;
    if (_2407)
    {
        float _2443 = _2437 * 6.283185482025146484375;
        float _2445 = sin(_2443);
        _2439 = _2445;
    }
    float _2447 = _2439;
    float _2449 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2451 = precise::max(0.0, _2449);
    float _2453 = _2423;
    float _2455 = _2451;
    if (_2407)
    {
        float _2457 = _2437 * 6.283185482025146484375;
        float _2459 = cos(_2457);
        _2453 = _2459;
    }
    float _2461 = _2453;
    float _2463 = -_2393;
    float _2465 = -_2451;
    float _2467 = fma(_2373, _2463, _2465);
    if (_2407)
    {
        float _2469 = _2467 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2419 = _2469;
    }
    float _2471 = _2419;
    float _2473 = _2471;
    float _2475 = _2447;
    if (_2407)
    {
        float _2477 = fma(_2447, _2471, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2473 = _2477;
    }
    float _2479 = _2473;
    float _2481 = _2479;
    if (!_2407)
    {
        _2475 = _2395;
    }
    float _2483 = _2475;
    float _2485 = _2483;
    float _2487 = _2461;
    if (_2407)
    {
        float _2489 = _2461 + (-1.0);
        _2455 = _2489;
    }
    float _2491 = _2455;
    float _2493 = _2491;
    if (_2407)
    {
        float _2495 = _2427 * _2479;
        _211 = _2495;
    }
    float _2497 = _211;
    if (!_2407)
    {
        _2481 = _2467;
    }
    float _2499 = _2481;
    float _2501 = _2499;
    if (_2407)
    {
        float _2503 = _2491 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2441 = _2503;
    }
    float _2505 = _2441;
    if (_2407)
    {
        float _2507 = _2395 * _2497;
        _2485 = _2507;
    }
    float _2509 = _2485;
    if (!_2407)
    {
        _2493 = _2397;
    }
    float _2511 = _2493;
    float _2513 = _2511;
    if (_2407)
    {
        float _2515 = _2397 * _2497;
        _2513 = _2515;
    }
    float _2517 = _2513;
    if (!_2407)
    {
        _2429 = _2399;
    }
    float _2519 = _2429;
    float _2521 = _2519;
    if (_2407)
    {
        float _2523 = fma(_2467, _2461, _2505);
        _2501 = _2523;
    }
    float _2525 = _2501;
    if (_2407)
    {
        float _2527 = _2509 * _2509;
        _2521 = _2527;
    }
    float _2529 = _2521;
    if (!_2407)
    {
        _2487 = _2401;
    }
    float _2531 = _2487;
    float _2533 = _2531;
    if (_2407)
    {
        float _2535 = _2517 * _2517;
        _2533 = _2535;
    }
    float _2537 = _2533;
    float _2539 = fma(_2525, _2525, _2529);
    float _2541 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2543 = _2539 + _2537;
    float _2545 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2547 = fma(_2391, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2545);
    float _2549 = precise::clamp(_2547, 0.0, 1.0);
    float _2551 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2541);
    float _2553 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2555 = rsqrt(_2543);
    float _2557 = -_2549;
    float _2559 = _2557 + 1.0;
    float _2561 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2551);
    float _2563 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2565 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2553);
    float _2567 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2569 = _2561 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2571 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2563);
    float _2573 = abs(_2559);
    float _2575 = log2(_2573);
    float _2577 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2565);
    float _2579 = _2569 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2581 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2571);
    float _2583 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2585 = _2577 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2587 = -_2579;
    float _2589 = fma(_2587, _2567, 1.0);
    float _2591 = _2581 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2593 = _2555 * _2509;
    float _2595 = _2555 * _2525;
    float _2597 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2583);
    float _2599 = _2585 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2601 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2603 = _2555 * _2517;
    float _2605 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2597);
    float _2607 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2599);
    float _2609 = -_2601;
    float _2611 = fma(_2595, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2609);
    float _2613 = _2575 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2615 = _2605 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2617 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2607);
    float _2619 = -_2603;
    float _2621 = fma(_2619, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2611);
    float _2623 = exp2(_2613);
    float _2625 = _2585 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2627 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2617);
    float _2629 = fma(_2621, -0.5, 0.5);
    float _2631 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2625);
    float _2633 = log2(_2589);
    float _2635 = fma(_2621, 0.5, 0.5);
    float _2637 = _2595 + 1.0;
    float _2639 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2631);
    float _2641 = fma(_2635, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2643 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2639);
    float _2645 = 1.0 / _2627;
    float _2647 = _2585 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2649 = -_2595;
    float _2651 = fma(_2623, _2637, _2649);
    float _2653 = fma(_2635, _2641, -0.212114393711090087890625);
    float _2655 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2647);
    float _2657 = fma(_2651, 0.5, 0.5);
    float _2659 = fma(_2635, _2653, 1.570728778839111328125);
    float _2661 = sqrt(_2629);
    float _2663 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2655);
    float _2665 = _2633 * 0.693147182464599609375;
    float _2667 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2663);
    float _2669 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2671 = _2643 * _2645;
    float _2673 = _2667 * _2645;
    float _2675 = fma(_2671, 0.5, 0.5);
    float _2677 = fma(_2673, -0.5, 0.5);
    float _2679 = _2661 * 0.636619746685028076171875;
    float3 _6839 = float3(_2675, _2677, _2669);
    float _2681 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6839, float3(0.0), isnan(_6839)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6839, float3(0.0), isnan(_6839)), level(0.0)).x;
    float3 _6850 = float3(_2675, _2677, _2669);
    float4 _2684 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6850, float3(0.0), isnan(_6850)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6850, float3(0.0), isnan(_6850)), level(0.0)).xyzw;
    float _2686 = _2684.x;
    float _2688 = _2684.y;
    float _2690 = _2684.z;
    float _2692 = _2684.w;
    float _2694 = -_2659;
    float _2696 = fma(_2679, _2694, 1.0);
    float2 _6872 = float2(_2696, _2657);
    float3 _2700 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6872, float2(0.0), isnan(_6872)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6872, float2(0.0), isnan(_6872)), level(0.0)).xyz;
    float _2702 = _2700.x;
    float _2704 = _2700.y;
    float _2706 = _2700.z;
    float _2708 = _2575 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2710 = _2585 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2712 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2710);
    float _2714 = exp2(_2708);
    float _2716 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2712);
    float _2718 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2716);
    float _2720 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2722 = _2718 + _2627;
    out.gl_Position.x = _2643;
    out.gl_Position.y = _2667;
    out.gl_Position.z = _2718;
    out.gl_Position.w = _2627;
    float _2724 = _2722 * 0.5;
    float _2726 = -_2714;
    float _2728 = _2726 + 1.0;
    out.m_47.x = _2720;
    float _2730 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_72.z = _2724;
    out.m_72.w = _2627;
    float _2732 = _2730 * _2681;
    float _2734 = -_2730;
    float _2736 = _2734 + 1.0;
    float _2738 = _2692 * _2732;
    float _2740 = _2692 * _2736;
    float _2742 = _2706 * _2732;
    float _2744 = fma(_2702, _2738, _2686);
    float _2746 = fma(_2704, _2738, _2688);
    float _2748 = fma(_2692, _2742, _2690);
    out.m_74.x = _2744;
    out.m_74.y = _2746;
    out.m_74.z = _2748;
    out.m_74.w = _2740;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2047 = false;
    bool _1057 = false;
    bool _953 = false;
    bool _839 = false;
    bool _673 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2805 = as_type<float>(_109);
        out.gl_Position.z = _2805;
    }
    if (!_97)
    {
        return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = _127;
    if (_123)
    {
        float _131 = float(_93);
        _103 = _131;
    }
    float _133 = _103;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2875 = as_type<float>(_147);
        out.gl_Position.z = _2875;
    }
    if (_139)
    {
        return out;
    }
    float _149 = in.m_51.x;
    float _151 = in.m_51.y;
    float _153 = in.m_51.z;
    float _155 = in.m_53.x;
    float _157 = in.m_53.y;
    float _159 = in.m_53.z;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = in.m_55.x;
    float _173 = in.m_55.y;
    float _175 = in.m_55.z;
    float _177 = _149 * _149;
    float _179 = _151 * _151;
    float _181 = fma(_155, _155, _177);
    float _183 = fma(_157, _157, _179);
    float _185 = fma(_171, _171, _181);
    float _187 = _153 * _153;
    float _189 = fma(_173, _173, _183);
    float _191 = sqrt(_185);
    float _193 = fma(_159, _159, _187);
    float _195 = fma(_175, _175, _193);
    float _197 = sqrt(_189);
    float _199 = sqrt(_195);
    bool _201 = _191 > 0.0;
    bool _203 = _197 > 0.0;
    float _205 = 0.0;
    float _207 = _185;
    float _209 = _175;
    float _211 = _149;
    if (_201)
    {
        float _213 = rsqrt(_185);
        _205 = _213;
    }
    float _215 = _205;
    float _217 = 0.0;
    if (!_201)
    {
        _217 = 0.0;
    }
    float _219 = _217;
    bool _221 = _199 > 0.0;
    float _223 = in.m_49.x;
    float _225 = in.m_49.y;
    float _227 = in.m_49.z;
    float _229 = 0.0;
    float _231 = _219;
    if (!_201)
    {
        _229 = 0.0;
    }
    float _233 = _229;
    float _235 = 0.0;
    float _237 = 0.0;
    float _239 = _233;
    if (!_203)
    {
        _235 = 0.0;
        _237 = 0.0;
    }
    float _241 = _235;
    float _243 = _237;
    float _245 = 0.0;
    float _247 = _241;
    float _249 = _243;
    if (_203)
    {
        float _251 = rsqrt(_189);
        _245 = _251;
    }
    float _253 = _245;
    float _255 = 0.0;
    if (!_201)
    {
        _255 = 0.0;
    }
    float _257 = _255;
    float _259 = 0.0;
    float _261 = _257;
    if (!_203)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = _195;
    float _267 = _263;
    if (_221)
    {
        float _269 = rsqrt(_195);
        _265 = _269;
    }
    float _271 = _265;
    if (_201)
    {
        float _273 = _215 * _155;
        _231 = _273;
    }
    float _275 = _231;
    if (_201)
    {
        float _277 = _215 * _149;
        _239 = _277;
    }
    float _279 = _239;
    if (_201)
    {
        float _281 = _215 * _171;
        _261 = _281;
    }
    float _283 = _261;
    float _285 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _287 = 0.0;
    float _289 = 0.0;
    float _291 = _285;
    if (!_221)
    {
        _287 = 0.0;
        _289 = 0.0;
    }
    float _293 = _287;
    float _295 = _289;
    float _297 = 0.0;
    float _299 = _295;
    float _301 = _293;
    if (!_221)
    {
        _297 = 0.0;
    }
    float _303 = _297;
    float _305 = _303;
    if (!_169)
    {
        float _307 = _285 * _285;
        float _309 = _307 * 0.5;
        _207 = _309;
    }
    float _311 = _207;
    float _313 = _311;
    if (_203)
    {
        float _315 = _253 * _157;
        _267 = _315;
    }
    float _317 = _267;
    if (_203)
    {
        float _319 = _253 * _151;
        _247 = _319;
    }
    float _321 = _247;
    if (_203)
    {
        float _323 = _253 * _173;
        _249 = _323;
    }
    float _325 = _249;
    if (!_169)
    {
        float _327 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _313 = _327;
    }
    float _329 = _313;
    float _331 = _329;
    if (_221)
    {
        float _333 = _271 * _159;
        _299 = _333;
    }
    float _335 = _299;
    if (_221)
    {
        float _337 = _271 * _153;
        _301 = _337;
    }
    float _339 = _301;
    if (_221)
    {
        float _341 = _271 * _175;
        _305 = _341;
    }
    float _343 = _305;
    bool _345 = !_169;
    if (!_345)
    {
        float _347 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = log2(_347);
        float _351 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _353 = _351 + 1.0;
        float _355 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _357 = _285 * _349;
        float _359 = 1.0 / _353;
        float _361 = _355 * 0.693147182464599609375;
        float _363 = exp2(_357);
        float _365 = 1.0 / _361;
        float _367 = _363 + (-1.0);
        float _369 = -_367;
        float _371 = fma(_369, _365, _285);
        float _373 = _371 * _359;
        float _375 = _373 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _331 = _375;
    }
    float _377 = _331;
    float _379 = _377 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _381 = !_169;
    float _383 = _377;
    if (!_381)
    {
        float _385 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _387 = log2(_385);
        float _389 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _391 = _389 + 1.0;
        float _393 = 1.0 / _391;
        float _395 = _285 * _387;
        float _397 = exp2(_395);
        float _399 = -_397;
        float _401 = _399 + 1.0;
        float _403 = _401 * _393;
        _291 = _403;
    }
    float _405 = _291;
    float _407 = _377 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _409 = _379 * _279;
    float _411 = _379 * _321;
    float _413 = _379 * _339;
    float _415 = 0.0;
    if (!_169)
    {
        float _417 = _127 * _127;
        float _419 = _417 * 0.5;
        _415 = _419;
    }
    float _421 = _415;
    float _423 = fma(_407, _275, _409);
    float _425 = _377 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _427 = fma(_407, _317, _411);
    float _429 = fma(_407, _335, _413);
    if (!_169)
    {
        float _431 = _421 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _383 = _431;
    }
    float _433 = _383;
    bool _435 = !_169;
    float _437 = _433;
    if (!_435)
    {
        float _439 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _441 = log2(_439);
        float _443 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _445 = _443 + 1.0;
        float _447 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _449 = _127 * _441;
        float _451 = 1.0 / _445;
        float _453 = _447 * 0.693147182464599609375;
        float _455 = exp2(_449);
        float _457 = 1.0 / _453;
        float _459 = _455 + (-1.0);
        float _461 = -_459;
        float _463 = fma(_461, _457, _127);
        float _465 = _463 * _451;
        float _467 = _465 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _437 = _467;
    }
    float _469 = _437;
    float _471 = fma(_425, _283, _423);
    float _473 = _469 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _475 = fma(_425, _325, _427);
    float _477 = fma(_425, _343, _429);
    float _479 = _469 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _481 = _473 * _321;
    float _483 = _469 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _485 = _473 * _279;
    float _487 = _473 * _339;
    float _489 = fma(_479, _317, _481);
    float _491 = fma(_405, _225, _475);
    float _493 = fma(_479, _275, _485);
    float _495 = fma(_479, _335, _487);
    float _497 = fma(_483, _325, _489);
    float _499 = _481;
    if (!_169)
    {
        _499 = _127;
    }
    float _501 = _499;
    bool _503 = !_169;
    float _505 = _501;
    if (!_503)
    {
        float _507 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _509 = log2(_507);
        float _511 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _513 = _511 + 1.0;
        float _515 = 1.0 / _513;
        float _517 = _127 * _509;
        float _519 = exp2(_517);
        float _521 = -_519;
        float _523 = _521 + 1.0;
        float _525 = _523 * _515;
        _505 = _525;
    }
    float _527 = _505;
    float _529 = fma(_483, _283, _493);
    float _531 = fma(_527, _225, _497);
    float _533 = fma(_483, _343, _495);
    float _535 = fma(_405, _223, _471);
    float _537 = fma(_527, _223, _529);
    float _539 = -_531;
    float _541 = _491 + _539;
    float _543 = fma(_405, _227, _477);
    float _545 = fma(_527, _227, _533);
    float _547 = -_537;
    float _549 = _535 + _547;
    float _551 = _541 * _541;
    float _553 = in.m_57.w;
    float _555 = -_545;
    float _557 = _543 + _555;
    float _559 = _541 * _173;
    float _561 = fma(_549, _549, _551);
    float _563 = _541 * _157;
    float _565 = _541 * _151;
    float _567 = fma(_549, _171, _559);
    float _569 = fma(_557, _557, _561);
    float _571 = fma(_549, _155, _563);
    float _573 = in.m_44.x;
    float _575 = in.m_44.y;
    float _577 = in.m_44.z;
    float _579 = fma(_549, _149, _565);
    float _581 = fma(_557, _159, _571);
    float _583 = sqrt(_569);
    float _585 = fma(_557, _153, _579);
    bool _587 = _583 >= 9.9999999747524270787835121154785e-07;
    bool _589 = isnan(_583);
    bool _591 = _587 || _589;
    bool _593 = isnan(9.9999999747524270787835121154785e-07);
    bool _595 = _591 || _593;
    float _597 = fma(_557, _175, _567);
    float _599 = fma(_535, _553, _573);
    float _601 = fma(_491, _553, _575);
    float _603 = fma(_543, _553, _577);
    float _605 = _597;
    float _607 = _581;
    float _609 = _585;
    float _611 = _585;
    float _613 = _581;
    float _615 = _597;
    if (!_595)
    {
        bool _617 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _619 = !_617;
        if (!_619)
        {
            float _621 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _623 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _625 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _627 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[16].x, _621);
            float _629 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[16].x, _623);
            float _631 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[16].x, _625);
            float _633 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[16].z, _627);
            float _635 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[16].z, _629);
            float _637 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[16].z, _631);
            float _639 = _633 * _151;
            float _641 = _633 * _157;
            float _643 = _633 * _173;
            float _645 = fma(_635, _149, _639);
            float _647 = fma(_635, _155, _641);
            float _649 = fma(_635, _171, _643);
            float _651 = fma(_637, _153, _645);
            float _653 = fma(_637, _159, _647);
            float _655 = fma(_637, _175, _649);
            float _657 = _651 * _651;
            float _659 = fma(_653, _653, _657);
            float _661 = fma(_655, _655, _659);
            float _663 = rsqrt(_661);
            float _665 = _663 * 9.9999999747524270787835121154785e-07;
            float _667 = _653 * _665;
            float _669 = _651 * _665;
            float _671 = _655 * _665;
            _611 = _669;
            _613 = _667;
            _615 = _671;
            _673 = true;
        }
        else
        {
            float _675 = _225 * _225;
            float _677 = fma(_223, _223, _675);
            float _679 = fma(_227, _227, _677);
            float _681 = sqrt(_679);
            bool _683 = _681 >= 9.9999999747524270787835121154785e-07;
            bool _685 = isnan(_681);
            bool _687 = _683 || _685;
            bool _689 = isnan(9.9999999747524270787835121154785e-07);
            bool _691 = _687 || _689;
            if (!_691)
            {
                float _693 = _575 * _575;
                float _695 = fma(_573, _573, _693);
                float _697 = fma(_577, _577, _695);
                float _699 = sqrt(_697);
                bool _701 = _699 >= 9.9999999747524270787835121154785e-07;
                bool _703 = isnan(_699);
                bool _705 = _701 || _703;
                bool _707 = isnan(9.9999999747524270787835121154785e-07);
                bool _709 = _705 || _707;
                float _711 = _189;
                if (!_709)
                {
                    float _713 = rsqrt(_189);
                    _711 = _713;
                }
                float _715 = _711;
                if (!_709)
                {
                    float _717 = _715 * 9.9999999747524270787835121154785e-07;
                    _605 = _717;
                }
                float _719 = _605;
                float _721 = _719;
                if (!_709)
                {
                    float _723 = _157 * _719;
                    _607 = _723;
                }
                float _725 = _607;
                _613 = _725;
                if (!_709)
                {
                    float _727 = _151 * _719;
                    _609 = _727;
                }
                float _729 = _609;
                _611 = _729;
                if (!_709)
                {
                    float _731 = _173 * _719;
                    _721 = _731;
                }
                float _733 = _721;
                bool _735 = !_709;
                _615 = _733;
                _673 = _735;
                if (!_673)
                {
                    float _737 = _151 * _575;
                    float _739 = _157 * _575;
                    float _741 = _173 * _575;
                    float _743 = fma(_149, _573, _737);
                    float _745 = fma(_155, _573, _739);
                    float _747 = fma(_171, _573, _741);
                    float _749 = fma(_153, _577, _743);
                    float _751 = fma(_159, _577, _745);
                    float _753 = fma(_175, _577, _747);
                    float _755 = _749 * _749;
                    float _757 = fma(_751, _751, _755);
                    float _759 = fma(_753, _753, _757);
                    float _761 = rsqrt(_759);
                    float _763 = _761 * 9.9999999747524270787835121154785e-07;
                    float _765 = _751 * _763;
                    float _767 = _749 * _763;
                    float _769 = _753 * _763;
                    _611 = _767;
                    _613 = _765;
                    _615 = _769;
                    _673 = true;
                }
            }
            else
            {
                float _771 = _151 * _225;
                float _773 = _157 * _225;
                float _775 = _173 * _225;
                float _777 = fma(_149, _223, _771);
                float _779 = fma(_155, _223, _773);
                float _781 = fma(_171, _223, _775);
                float _783 = fma(_153, _227, _777);
                float _785 = fma(_159, _227, _779);
                float _787 = fma(_175, _227, _781);
                float _789 = _783 * _783;
                float _791 = fma(_785, _785, _789);
                float _793 = fma(_787, _787, _791);
                float _795 = rsqrt(_793);
                float _797 = _795 * 9.9999999747524270787835121154785e-07;
                float _799 = _785 * _797;
                float _801 = _783 * _797;
                float _803 = _787 * _797;
                _611 = _801;
                _613 = _799;
                _615 = _803;
            }
        }
    }
    _673 = false;
    float _805 = _611;
    float _807 = _613;
    float _809 = _615;
    bool _811 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    bool _813 = !_811;
    float _815 = _805;
    float _817 = _807;
    float _819 = _809;
    float _837;
    if (!_813)
    {
        float _821 = in.m_59.x;
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _825 = _821 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _829 = _827 * _823;
        float _831 = floor(_829);
        float _833 = -_831;
        float _835 = _829 + _833;
        _837 = _835;
        _839 = true;
    }
    else
    {
        float _841 = float(_93);
        float _843 = 1.0 / _841;
        float _845 = _127 * _843;
        _837 = _845;
    }
    _839 = false;
    float _847 = _837;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _851 = _847 + _849;
    bool _853 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _855 = isnan(_847);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _865;
    bool _869 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _871 = isnan(_847);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = -_863;
    float _883 = _881 + 1.0;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _885;
    float _889 = 1.0 / _867;
    bool _891 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _893 = _879 * _883;
    float _895 = -_879;
    float _897 = _895 + 1.0;
    float _899 = _851 * _889;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _901;
    float _905 = fma(_887, _899, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _907;
    float _911 = fma(_903, _899, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _913 = _905 * _893;
    float _915 = fma(_909, _899, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _917 = _911 * _893;
    float _919 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[107].x, _913);
    float _921 = _915 * _893;
    float _923 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[107].z, _917);
    float _925 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[108].x, _919);
    float _927 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[107].y, _921);
    float _929 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[108].z, _923);
    float _931 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[108].y, _927);
    bool _933 = !_891;
    float _951;
    if (!_933)
    {
        float _935 = in.m_59.x;
        float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _939 = _935 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _943 = _941 * _937;
        float _945 = floor(_943);
        float _947 = -_945;
        float _949 = _943 + _947;
        _951 = _949;
        _953 = true;
    }
    else
    {
        float _955 = float(_93);
        float _957 = 1.0 / _955;
        float _959 = _127 * _957;
        _951 = _959;
    }
    _953 = false;
    float _961 = _951;
    bool _963 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _965 = isnan(_961);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _979 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _981 = isnan(_961);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _987 = _983 || _985;
    float _989 = float(_987);
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _991;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _997 = _961 + _995;
    float _999 = -_973;
    float _1001 = _999 + 1.0;
    bool _1003 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1005 = 1.0 / _977;
    float _1007 = _989 * _1001;
    float _1009 = -_989;
    float _1011 = _1009 + 1.0;
    float _1013 = _929 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1015 = _993 * _1005;
    float _1017 = _931 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1019 = fma(_1015, _997, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1021 = _925 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1023 = _1019 * _1007;
    float _1025 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1023);
    float _1027 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1025);
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1031 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1033 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1035 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _1029;
    out.m_61.y = _1031;
    out.m_61.z = _1033;
    out.m_61.w = _1035;
    bool _1037 = !_1003;
    float _1055;
    if (!_1037)
    {
        float _1039 = in.m_59.x;
        float _1041 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1043 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _1047 = _1045 * _1041;
        float _1049 = floor(_1047);
        float _1051 = -_1049;
        float _1053 = _1047 + _1051;
        _1055 = _1053;
        _1057 = true;
    }
    else
    {
        float _1059 = float(_93);
        float _1061 = 1.0 / _1059;
        float _1063 = _127 * _1061;
        _1055 = _1063;
    }
    _1057 = false;
    float _1065 = _1055;
    float _1067 = in.m_59.x;
    float _1069 = in.m_59.y;
    float _1071 = in.m_59.z;
    float _1073 = in.m_59.w;
    float _1075 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1077 = log2(_1075);
    float _1079 = _601 * _151;
    float _1081 = as_type<float>(int(gl_VertexIndex));
    float _1083 = fma(_599, _149, _1079);
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1085;
    float _1089 = _127 * _1077;
    float _1091 = 1.0 / _1087;
    float _1093 = _1071 * 2.0;
    float _1095 = _1067 * 2.0;
    float _1097 = _1069 * 2.0;
    int _1099 = as_type<int>(_1081) & 1;
    bool _1101 = _1099 != 0;
    int _1103 = as_type<int>(_1081) & 2;
    bool _1105 = _1103 != 0;
    float _1107 = floor(_1095);
    float _1109 = _601 * _157;
    float _1111 = _601 * _173;
    float _1113 = floor(_1093);
    float _1115 = floor(_1097);
    bool _1117 = _1107 > 0.0;
    bool _1119 = _1107 >= 0.0;
    bool _1121 = isnan(_1107);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan(0.0);
    bool _1127 = _1123 || _1125;
    int _1129 = _1127 ? 0 : 1;
    float _1131 = exp2(_1089);
    bool _1133 = _1113 > 0.0;
    float _1135 = fma(_599, _171, _1111);
    bool _1137 = _1113 >= 0.0;
    bool _1139 = isnan(_1113);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan(0.0);
    bool _1145 = _1141 || _1143;
    float _1147 = fma(_599, _155, _1109);
    int _1149 = _1145 ? 0 : 1;
    float _1151 = fma(_603, _159, _1147);
    bool _1153 = _1115 >= 0.0;
    bool _1155 = isnan(_1115);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan(0.0);
    bool _1161 = _1157 || _1159;
    int _1163 = ~_1149;
    int _1165 = _1163 + 1;
    int _1167 = _1165 + 1;
    float _1169 = _1151 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1171 = ~_1129;
    int _1173 = _1171 + 1;
    int _1175 = _1173 + 1;
    int _1177 = _1167;
    int _1179 = _1175;
    if (!_1133)
    {
        int _1181 = ~_1149;
        int _1183 = _1181 + 1;
        _1177 = _1183;
    }
    int _1185 = _1177;
    float _1187 = -_1131;
    float _1189 = _1187 + 1.0;
    if (!_1117)
    {
        int _1191 = ~_1129;
        int _1193 = _1191 + 1;
        _1179 = _1193;
    }
    int _1195 = _1179;
    float _1197 = _1071 + _1067;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1201 = _1199 != 0;
    int _1203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1205 = _1203 != 0;
    int _1207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1209 = _1207 != 0;
    float _1211 = fma(_603, _153, _1083);
    float _1213 = fma(_603, _175, _1135);
    float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1217 = _1169 + _1215;
    float _1219 = _1211 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1221 = !_1205;
    int _1223 = _1221 ? 0 : 1;
    float _1225 = _1213 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1227 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1229 = isnan(0.0);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1235 = _1231 || _1233;
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1239 = _1219 + _1237;
    bool _1241 = !_1201;
    int _1243 = _1241 ? 0 : 1;
    float _1245 = _1197 + (-1.0);
    float _1247 = _1235 ? _1189 : 0.0;
    float _1249 = _1239 * _1239;
    bool _1251 = _1115 > 0.0;
    float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1255 = _1225 + _1253;
    bool _1257 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1259 = isnan(1.0);
    bool _1261 = _1257 || _1259;
    bool _1263 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1265 = _1261 || _1263;
    float _1267 = fma(_1217, _1217, _1249);
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1271 = 1.0 + _1269;
    float _1273 = _1069 + _1071;
    int _1275 = _1161 ? 0 : 1;
    float _1277 = fma(_1255, _1255, _1267);
    float _1279 = 1.0 / _1271;
    bool _1281 = _1073 > 0.5;
    float _1283 = _1069 + _1067;
    float _1285 = _1273 + (-1.0);
    int _1287 = abs(_1243);
    float _1289 = _1283 + (-1.0);
    float _1291 = fma(_1285, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1293 = rsqrt(_1277);
    float _1295 = _805 * _805;
    float _1297 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1299 = abs(_1223);
    float _1301 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1303 = fma(_807, _807, _1295);
    float _1305 = float(_1185);
    float _1307 = _1067 + (-0.5);
    float _1309 = _1247 * _1279;
    float _1311 = fma(_809, _809, _1303);
    int _1313 = ~_1275;
    int _1315 = _1313 + 1;
    int _1317 = _1315 + 1;
    float _1319 = rsqrt(_1311);
    int _1321 = _1317;
    float _1323 = _1311;
    if (!_1251)
    {
        int _1325 = ~_1275;
        int _1327 = _1325 + 1;
        _1321 = _1327;
    }
    int _1329 = _1321;
    float _1331 = float(_1287);
    float _1333 = _1239 * _1293;
    float _1335 = float(_1299);
    float _1337 = _1217 * _1293;
    float _1339 = float(_1195);
    float _1341 = -_1333;
    float _1343 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1239);
    float _1345 = _1331 * _1305;
    float _1347 = -_1337;
    float _1349 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1217);
    bool _1351 = !_1209;
    int _1353 = _1351 ? 0 : 1;
    float _1355 = _1335 * _1339;
    float _1357 = _1343 * _1343;
    float _1359 = in.m_66.x;
    float _1361 = in.m_66.y;
    float _1363 = in.m_66.z;
    int _1365 = abs(_1353);
    float _1367 = _1319 * _809;
    float _1369 = fma(_1349, _1349, _1357);
    float _1371 = _1319 * _807;
    float _1373 = _1319 * _805;
    float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1377 = _1367 * _1375;
    float _1379 = _1345 * (-2.0);
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1383 = _1371 * _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1387 = _1373 * _1385;
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1391 = -_1377;
    float _1393 = fma(_1371, _1389, _1391);
    float _1395 = _1255 * _1293;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1399 = -_1387;
    float _1401 = fma(_1367, _1397, _1399);
    float _1403 = _1393 * _1393;
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1407 = -_1383;
    float _1409 = fma(_1373, _1405, _1407);
    float _1411 = float(_1365);
    float _1413 = -_1395;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1255);
    float _1417 = fma(_1401, _1401, _1403);
    float _1419 = fma(_1415, _1415, _1369);
    float _1421 = fma(_1409, _1409, _1417);
    float _1423 = float(_1329);
    float _1425 = fma(_1379, _1359, _1359);
    float _1427 = fma(_1297, _1379, _1297);
    float _1429 = _1355 * (-2.0);
    bool _1431 = !_1265;
    float _1433 = _1431 ? _127 : _1309;
    float _1435 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1425);
    float _1437 = _1411 * _1423;
    float _1439 = _1069 + (-0.5);
    float _1441 = fma(_1429, _1361, _1361);
    float _1443 = fma(_1433, _1427, _1435);
    float _1445 = _1437 * (-2.0);
    float _1447 = fma(_1291, _1429, _1291);
    float _1449 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1441);
    float _1451 = sqrt(_1419);
    float _1453 = _1443 * 0.15915493667125701904296875;
    float _1455 = fma(_1445, _1363, _1363);
    float _1457 = fma(_1433, _1447, _1449);
    float _1459 = _1071 + (-0.5);
    bool _1461 = !_1101;
    float _1463 = _1461 ? (-0.5) : 0.5;
    float _1465 = rsqrt(_1421);
    float _1467 = fma(_1301, _1445, _1301);
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1473 = _1471 != 0;
    float _1475 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1455);
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1479 = _1477 != 0;
    float _1481 = -_1469;
    float _1483 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[77].x, _1481);
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1487 = _1485 != 0;
    float _1489 = fma(_1433, _1467, _1475);
    int _1491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1493 = _1491 != 0;
    float _1495 = _1457 * 0.15915493667125701904296875;
    bool _1497 = !_1105;
    float _1499 = _1497 ? (-0.5) : 0.5;
    float _1501 = _1489 * 0.15915493667125701904296875;
    bool _1503 = _1071 > 0.5;
    float _1505 = _1495 * 6.283185482025146484375;
    float _1507 = sin(_1505);
    float _1509 = in.m_57.x;
    float _1511 = in.m_57.y;
    float _1513 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1515 = -_1499;
    int _1517 = _1281 ? as_type<int>(_1515) : as_type<int>(_1499);
    float _1519 = _1401 * _1465;
    bool _1521 = _1069 > 0.5;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1525 = _1495 * 6.283185482025146484375;
    float _1527 = cos(_1525);
    float _1529 = _1393 * _1465;
    float _1531 = _1409 * _1465;
    float _1533 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1499);
    bool _1535 = !_1493;
    float _1537 = _1535 ? _1499 : as_type<float>(_1517);
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1541 = _1367 * _1519;
    float _1543 = _1453 * 6.283185482025146484375;
    float _1545 = sin(_1543);
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1549 = _1293 * _1451;
    float _1551 = fma(_1513, -2.0, _1539);
    float _1553 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1547);
    float _1555 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1551);
    float _1557 = _1453 * 6.283185482025146484375;
    float _1559 = cos(_1557);
    float _1561 = _1509 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1563 = _1511 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1565 = _1561 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1567 = _1501 * 6.283185482025146484375;
    float _1569 = cos(_1567);
    float _1571 = -_1499;
    int _1573 = _1521 ? as_type<int>(_1571) : as_type<int>(_1499);
    float _1575 = _1545 * _1507;
    bool _1577 = _1067 > 0.5;
    float _1579 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1523);
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1583 = _1065 + _1581;
    float _1585 = _1545 * _1527;
    float _1587 = _1565 * _1549;
    float _1589 = _1501 * 6.283185482025146484375;
    float _1591 = sin(_1589);
    float _1593 = _1583 * _1091;
    float _1595 = _1559 * _1527;
    bool _1597 = !_1479;
    float _1599 = _1597 ? _1499 : as_type<float>(_1573);
    float _1601 = _1545 * _1569;
    float _1603 = _1559 * _1507;
    float _1605 = _1527 * _1569;
    float _1607 = _1559 * _1569;
    float _1609 = _1507 * _1569;
    float _1611 = fma(_1591, _1595, _1575);
    float _1613 = fma(_1591, _1575, _1595);
    float _1615 = _1563 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1617 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1463);
    float _1619 = -_1603;
    float _1621 = fma(_1591, _1585, _1619);
    float _1623 = _1607 * _1367;
    float _1625 = _1615 * _1549;
    float _1627 = _1587 * _1617;
    float _1629 = _1607 * _1371;
    float _1631 = _1373 * _1531;
    float _1633 = -_1585;
    float _1635 = fma(_1591, _1603, _1633);
    float _1637 = _1371 * _1529;
    float _1639 = -_1591;
    float _1641 = fma(_1639, _1519, _1629);
    float _1643 = -_1631;
    float _1645 = fma(_1367, _1529, _1643);
    float _1647 = -_1591;
    float _1649 = fma(_1647, _1531, _1623);
    float _1651 = _1611 * _1371;
    float _1653 = _1635 * _1371;
    float _1655 = _1611 * _1367;
    float _1657 = -_1637;
    float _1659 = fma(_1373, _1519, _1657);
    float _1661 = _1625 * _1533;
    float _1663 = fma(_1605, _1519, _1651);
    float _1665 = fma(_1601, _1645, _1641);
    float _1667 = fma(_1609, _1519, _1653);
    float _1669 = fma(_1605, _1531, _1655);
    float _1671 = _1635 * _1367;
    float _1673 = fma(_1601, _1659, _1649);
    float _1675 = _1661 * _1665;
    float _1677 = fma(_1621, _1645, _1663);
    float _1679 = fma(_1621, _1659, _1669);
    float _1681 = fma(_1609, _1531, _1671);
    float _1683 = _1661 * _1673;
    float _1685 = fma(_1613, _1645, _1667);
    float _1687 = fma(_1627, _1677, _1675);
    float _1689 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1691 = _1689 * 0.5;
    float _1693 = fma(_1613, _1659, _1681);
    float _1695 = fma(_1627, _1679, _1683);
    float _1697 = fma(_1691, _1685, _1687);
    float _1699 = -_1463;
    int _1701 = _1577 ? as_type<int>(_1699) : as_type<int>(_1463);
    float _1703 = fma(_1691, _1693, _1695);
    float _1705 = _1607 * _1373;
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1709 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1707;
    float _1711 = _1169 + _1697;
    float _1713 = _1225 + _1703;
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1717 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1715;
    float _1719 = fma(_1709, _1593, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1721 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1723 = _1711 + _1721;
    float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1727 = _1713 + _1725;
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1729;
    bool _1733 = !_1473;
    float _1735 = _1733 ? _1463 : as_type<float>(_1701);
    float _1737 = _1723 * _1723;
    float _1739 = _1727 * _1727;
    float _1741 = -_1541;
    float _1743 = fma(_1371, _1531, _1741);
    float _1745 = -_1591;
    float _1747 = fma(_1745, _1529, _1705);
    float _1749 = _1611 * _1373;
    float _1751 = _1737 + _1739;
    float _1753 = fma(_1717, _1593, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1755 = fma(_1731, _1593, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1759 = _1635 * _1373;
    float _1761 = fma(_1605, _1529, _1749);
    float _1763 = fma(_1601, _1743, _1747);
    bool _1765 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1767 = isnan(_1065);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1773 = _1769 || _1771;
    float _1775 = float(_1773);
    float _1777 = fma(_1609, _1529, _1759);
    float _1779 = fma(_1621, _1743, _1761);
    float _1781 = _1661 * _1763;
    float _1783 = sqrt(_1751);
    bool _1785 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1787 = isnan(_1065);
    bool _1789 = _1785 || _1787;
    bool _1791 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1793 = _1789 || _1791;
    float _1795 = float(_1793);
    float _1797 = -_1775;
    float _1799 = _1797 + 1.0;
    float _1801 = fma(_1613, _1743, _1777);
    float _1803 = fma(_1627, _1779, _1781);
    float _1805 = -_127;
    float _1807 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1483);
    float _1809 = _1795 * _1799;
    float _1811 = -_1463;
    int _1813 = _1503 ? as_type<int>(_1811) : as_type<int>(_1463);
    float _1815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1817 = fma(_1691, _1801, _1803);
    float _1819 = _1719 * _1809;
    float _1821 = _1753 * _1809;
    float _1823 = _1755 * _1809;
    float _1825 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1827 = _1599 + (-0.5);
    float _1829 = _1219 + _1817;
    bool _1831 = _1783 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1835 = _1735 + 0.5;
    float _1837 = -_1825;
    float _1839 = -_1555;
    float _1841 = fma(_1837, _1827, _1839);
    bool _1843 = !_1487;
    float _1845 = _1843 ? _1463 : as_type<float>(_1813);
    float _1847 = -_1795;
    float _1849 = _1847 + 1.0;
    float _1851 = _1815 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1853 = fma(_1851, _1835, _1807);
    float _1855 = _1827;
    float _1857 = _1737;
    float _1859 = _1739;
    float _1861 = _1711;
    float _1863 = _1713;
    if (!_1831)
    {
        _1855 = _1829;
    }
    float _1865 = _1855;
    bool _1867 = !_1831;
    float _1869 = _1865;
    if (!_1867)
    {
        float _1871 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1875 = _1783 + _1873;
        float _1877 = rsqrt(_1751);
        float _1879 = _1875 * _1871;
        float _1881 = _1829 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1883 = _1879 * 0.15915493667125701904296875;
        float _1885 = _1883 * 6.283185482025146484375;
        float _1887 = sin(_1885);
        float _1889 = _1883 * 6.283185482025146484375;
        float _1891 = cos(_1889);
        float _1893 = fma(_1887, _1881, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1895 = _1877 * _1893;
        float _1897 = _1891 + (-1.0);
        float _1899 = fma(_1723, _1895, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1901 = fma(_1727, _1895, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1903 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1907 = _1899 + _1905;
        float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1911 = _1901 + _1909;
        float _1913 = fma(_1829, _1891, _1903);
        float _1915 = _1907 * _1907;
        float _1917 = _1911 * _1911;
        _1869 = _1913;
        _1857 = _1915;
        _1859 = _1917;
        _1861 = _1899;
        _1863 = _1901;
    }
    float _1919 = _1869;
    float _1921 = _1857;
    float _1923 = _1859;
    float _1925 = _1861;
    float _1927 = _1863;
    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1931 = _1919 + _1929;
    float _1933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1935 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1819);
    float _1937 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1821);
    float _1939 = fma(_1931, _1931, _1921);
    float _1941 = _1845 + 0.5;
    float _1943 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1823);
    float _1945 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1579);
    float _1947 = _1939 + _1923;
    float _1949 = -_1537;
    float _1951 = _1949 + 0.5;
    float _1953 = _1941 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1955 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1935);
    float _1957 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1937);
    float _1959 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1943);
    float _1961 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1553);
    float _1963 = sqrt(_1947);
    float _1965 = -_1945;
    float _1967 = _1965 + 1.0;
    float _1969 = _1951 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1971 = _1953 * _1833;
    float _1973 = -_1961;
    float _1975 = _1973 + 1.0;
    float _1977 = _1955 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1979 = _1957 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1981 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1983 = -_1967;
    float _1985 = fma(_1735, _1983, _1853);
    float _1987 = fma(_1599, _1975, _1841);
    float _1989 = _1969 * _1933;
    float _1991 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1993 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = _1979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1997 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _1985;
    out.m_68.y = _1987;
    out.m_68.z = _1971;
    out.m_68.w = _1989;
    bool _1999 = _1963 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2001 = isnan(_1963);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2007 = _2003 || _2005;
    out.m_70.x = _1993;
    out.m_70.y = _1995;
    out.m_70.z = _1997;
    out.m_70.w = _1991;
    float _2009 = _1955;
    float _2011 = _1991;
    if (!_2007)
    {
        _2009 = 1.0;
    }
    float _2013 = _2009;
    bool _2015 = !_2007;
    float _2017 = _2013;
    if (!_2015)
    {
        bool _2019 = _1963 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2021 = isnan(_1963);
        bool _2023 = _2019 || _2021;
        bool _2025 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2027 = _2023 || _2025;
        if (!_2027)
        {
            float _2029 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2031 = _1963 + _2029;
            float _2033 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2035 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2033;
            float _2037 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2039 = _2037 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2041 = 1.0 / _2035;
            float _2043 = _2031 * _2041;
            float _2045 = fma(_2043, _2039, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2017 = _2045;
            _2047 = true;
        }
        else
        {
            bool _2049 = _1963 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2051 = isnan(_1963);
            bool _2053 = _2049 || _2051;
            bool _2055 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2057 = _2053 || _2055;
            if (!_2057)
            {
                float _2059 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2061 = _1963 + _2059;
                float _2063 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2065 = _2063 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2067 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2069 = _2067 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2071 = 1.0 / _2065;
                float _2073 = _2061 * _2071;
                float _2075 = fma(_2073, _2069, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2017 = _2075;
                _2047 = true;
            }
            else
            {
                _2017 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2047 = false;
    float _2077 = _2017;
    float _2079 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2081 = _1919 + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2085 = _1925 + _2083;
    float _2087 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2089 = _1927 + _2087;
    float _2091 = fma(_2081, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2093 = fma(_2085, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2095 = fma(_2089, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2097 = -_1219;
    float _2099 = _2097 + _2091;
    float _2101 = -_1169;
    float _2103 = _2101 + _2093;
    float _2105 = -_1225;
    float _2107 = _2105 + _2095;
    float _2109 = _2099 * _2099;
    float _2111 = fma(_2103, _2103, _2109);
    float _2113 = fma(_2107, _2107, _2111);
    float _2115 = sqrt(_2113);
    bool _2117 = _2115 > 0.0;
    bool _2119 = !_2117;
    float _2121 = _2115;
    float _2123 = _2091;
    float _2125 = _2093;
    float _2127 = _2095;
    if (!_2119)
    {
        bool _2129 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2131 = _1995;
        if (_2129)
        {
            float _2133 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2131 = _2133;
        }
        float _2135 = _2131;
        float _2137 = _2135;
        if (_2129)
        {
            float _2139 = _2135 * _807;
            _2121 = _2139;
        }
        float _2141 = _2121;
        float _2143 = _2141;
        if (_2129)
        {
            float _2145 = _2135 * _805;
            _2011 = _2145;
        }
        float _2147 = _2011;
        float _2149 = _2147;
        if (_2129)
        {
            float _2151 = _2135 * _809;
            _2137 = _2151;
        }
        float _2153 = _2137;
        float _2155 = _2153;
        if (!_2129)
        {
            float _2157 = _127 + 1.0;
            if (!_169)
            {
                float _2159 = _2157 * _2157;
                float _2161 = _2159 * 0.5;
                _129 = _2161;
            }
            float _2163 = _129;
            float _2165 = _2163;
            if (!_169)
            {
                float _2167 = _2163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2165 = _2167;
            }
            float _2169 = _2165;
            bool _2171 = !_169;
            float _2173 = _2169;
            if (!_2171)
            {
                float _2175 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2177 = log2(_2175);
                float _2179 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2181 = _2179 + 1.0;
                float _2183 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2185 = _2177 * _2157;
                float _2187 = 1.0 / _2181;
                float _2189 = _2183 * 0.693147182464599609375;
                float _2191 = exp2(_2185);
                float _2193 = 1.0 / _2189;
                float _2195 = _2191 + (-1.0);
                float _2197 = -_2195;
                float _2199 = fma(_2197, _2193, _2157);
                float _2201 = _2199 * _2187;
                float _2203 = _2201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2173 = _2203;
            }
            float _2205 = _2173;
            float _2207 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2209 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2211 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2213 = _2205;
            if (!_169)
            {
                _2213 = _2157;
            }
            float _2215 = _2213;
            float _2217 = _2207 * _321;
            float _2219 = _2207 * _279;
            float _2221 = _2207 * _339;
            float _2223 = fma(_2209, _317, _2217);
            float _2225 = fma(_2209, _275, _2219);
            float _2227 = fma(_2211, _325, _2223);
            bool _2229 = !_169;
            float _2231 = _2215;
            if (!_2229)
            {
                float _2233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2235 = log2(_2233);
                float _2237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2239 = _2237 + 1.0;
                float _2241 = 1.0 / _2239;
                float _2243 = _2235 * _2157;
                float _2245 = exp2(_2243);
                float _2247 = -_2245;
                float _2249 = _2247 + 1.0;
                float _2251 = _2249 * _2241;
                _2231 = _2251;
            }
            float _2253 = _2231;
            float _2255 = fma(_2209, _335, _2221);
            float _2257 = fma(_2211, _283, _2225);
            float _2259 = fma(_2253, _225, _2227);
            float _2261 = fma(_2211, _343, _2255);
            float _2263 = fma(_2253, _223, _2257);
            float _2265 = -_531;
            float _2267 = _2265 + _2259;
            float _2269 = fma(_2253, _227, _2261);
            float _2271 = -_537;
            float _2273 = _2271 + _2263;
            float _2275 = _2267 * _151;
            float _2277 = _2267 * _157;
            float _2279 = -_545;
            float _2281 = _2279 + _2269;
            float _2283 = _2267 * _173;
            float _2285 = fma(_2273, _149, _2275);
            float _2287 = fma(_2273, _155, _2277);
            float _2289 = fma(_2273, _171, _2283);
            float _2291 = fma(_2281, _153, _2285);
            float _2293 = fma(_2281, _159, _2287);
            float _2295 = fma(_2281, _175, _2289);
            float _2297 = _2291 * _2291;
            float _2299 = fma(_2293, _2293, _2297);
            float _2301 = fma(_2295, _2295, _2299);
            _1323 = _2301;
            _815 = _2291;
            _817 = _2293;
            _819 = _2295;
            _2143 = _2293;
            _2149 = _2291;
            _2155 = _2295;
        }
        float _2303 = _1323;
        float _2305 = _815;
        float _2307 = _817;
        float _2309 = _819;
        float _2311 = _2143;
        float _2313 = _2149;
        float _2315 = _2155;
        float _2317 = sqrt(_2303);
        float _2319 = rsqrt(_2113);
        bool _2321 = _2317 > 0.0;
        float _2323 = _2103 * _2319;
        float _2325 = _2099 * _2319;
        float _2327 = _2107 * _2319;
        bool _2329 = !_2321;
        if (!_2329)
        {
            float _2331 = rsqrt(_2303);
            float _2333 = _2331 * _2305;
            float _2335 = _2331 * _2307;
            float _2337 = _2331 * _2309;
            float _2339 = _2325 * _2333;
            float _2341 = fma(_2323, _2335, _2339);
            float _2343 = fma(_2327, _2337, _2341);
            float _2345 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2347 = fma(_2311, _2345, _2093);
            float _2349 = fma(_2313, _2345, _2091);
            float _2351 = fma(_2315, _2345, _2095);
            _2123 = _2349;
            _2125 = _2347;
            _2127 = _2351;
        }
    }
    float _2353 = _2123;
    float _2355 = _2125;
    float _2357 = _2127;
    float _2359 = -_1333;
    float _2361 = fma(_2359, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2353);
    float _2363 = -_1337;
    float _2365 = fma(_2363, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2355);
    float _2367 = -_1395;
    float _2369 = fma(_2367, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2357);
    float _2371 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2373 = _2361 + _2371;
    float _2375 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2377 = _2365 + _2375;
    float _2379 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2381 = _2369 + _2379;
    float _2383 = _2373 * _2373;
    float _2385 = fma(_2377, _2377, _2383);
    float _2387 = fma(_2381, _2381, _2385);
    float _2389 = rsqrt(_2387);
    float _2391 = sqrt(_2387);
    float _2393 = _2389 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2395 = _2377 * _2393;
    float _2397 = _2381 * _2393;
    float _2399 = _2395 * _2395;
    float _2401 = _2397 * _2397;
    float _2403 = _2399 + _2401;
    float _2405 = sqrt(_2403);
    bool _2407 = _2405 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2411 = _2405 + _2409;
    float _2413 = _2389;
    float _2415 = _2403;
    float _2417 = _2411;
    float _2419 = _2373;
    if (_2407)
    {
        float _2421 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2413 = _2421;
    }
    float _2423 = _2413;
    if (_2407)
    {
        float _2425 = rsqrt(_2403);
        _2415 = _2425;
    }
    float _2427 = _2415;
    float _2429 = _2427;
    if (_2407)
    {
        float _2431 = _2411 * _2423;
        _2417 = _2431;
    }
    float _2433 = _2417;
    if (_2407)
    {
        float _2435 = _2433 * 0.15915493667125701904296875;
        _209 = _2435;
    }
    float _2437 = _209;
    float _2439 = _2381;
    float _2441 = _2437;
    if (_2407)
    {
        float _2443 = _2437 * 6.283185482025146484375;
        float _2445 = sin(_2443);
        _2439 = _2445;
    }
    float _2447 = _2439;
    float _2449 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2451 = precise::max(0.0, _2449);
    float _2453 = _2423;
    float _2455 = _2451;
    if (_2407)
    {
        float _2457 = _2437 * 6.283185482025146484375;
        float _2459 = cos(_2457);
        _2453 = _2459;
    }
    float _2461 = _2453;
    float _2463 = -_2393;
    float _2465 = -_2451;
    float _2467 = fma(_2373, _2463, _2465);
    if (_2407)
    {
        float _2469 = _2467 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2419 = _2469;
    }
    float _2471 = _2419;
    float _2473 = _2471;
    float _2475 = _2447;
    if (_2407)
    {
        float _2477 = fma(_2447, _2471, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2473 = _2477;
    }
    float _2479 = _2473;
    float _2481 = _2479;
    if (!_2407)
    {
        _2475 = _2395;
    }
    float _2483 = _2475;
    float _2485 = _2483;
    float _2487 = _2461;
    if (_2407)
    {
        float _2489 = _2461 + (-1.0);
        _2455 = _2489;
    }
    float _2491 = _2455;
    float _2493 = _2491;
    if (_2407)
    {
        float _2495 = _2427 * _2479;
        _211 = _2495;
    }
    float _2497 = _211;
    if (!_2407)
    {
        _2481 = _2467;
    }
    float _2499 = _2481;
    float _2501 = _2499;
    if (_2407)
    {
        float _2503 = _2491 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2441 = _2503;
    }
    float _2505 = _2441;
    if (_2407)
    {
        float _2507 = _2395 * _2497;
        _2485 = _2507;
    }
    float _2509 = _2485;
    if (!_2407)
    {
        _2493 = _2397;
    }
    float _2511 = _2493;
    float _2513 = _2511;
    if (_2407)
    {
        float _2515 = _2397 * _2497;
        _2513 = _2515;
    }
    float _2517 = _2513;
    if (!_2407)
    {
        _2429 = _2399;
    }
    float _2519 = _2429;
    float _2521 = _2519;
    if (_2407)
    {
        float _2523 = fma(_2467, _2461, _2505);
        _2501 = _2523;
    }
    float _2525 = _2501;
    if (_2407)
    {
        float _2527 = _2509 * _2509;
        _2521 = _2527;
    }
    float _2529 = _2521;
    if (!_2407)
    {
        _2487 = _2401;
    }
    float _2531 = _2487;
    float _2533 = _2531;
    if (_2407)
    {
        float _2535 = _2517 * _2517;
        _2533 = _2535;
    }
    float _2537 = _2533;
    float _2539 = fma(_2525, _2525, _2529);
    float _2541 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2543 = _2539 + _2537;
    float _2545 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2547 = fma(_2391, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2545);
    float _2549 = precise::clamp(_2547, 0.0, 1.0);
    float _2551 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2541);
    float _2553 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2555 = rsqrt(_2543);
    float _2557 = -_2549;
    float _2559 = _2557 + 1.0;
    float _2561 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2551);
    float _2563 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2565 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2553);
    float _2567 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2569 = _2561 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2571 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2563);
    float _2573 = abs(_2559);
    float _2575 = log2(_2573);
    float _2577 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2565);
    float _2579 = _2569 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2581 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2571);
    float _2583 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2585 = _2577 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2587 = -_2579;
    float _2589 = fma(_2587, _2567, 1.0);
    float _2591 = _2581 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2593 = _2555 * _2509;
    float _2595 = _2555 * _2525;
    float _2597 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2583);
    float _2599 = _2585 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2601 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2603 = _2555 * _2517;
    float _2605 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2597);
    float _2607 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2599);
    float _2609 = -_2601;
    float _2611 = fma(_2595, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2609);
    float _2613 = _2575 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2615 = _2605 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2617 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2607);
    float _2619 = -_2603;
    float _2621 = fma(_2619, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2611);
    float _2623 = exp2(_2613);
    float _2625 = _2585 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2627 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2617);
    float _2629 = fma(_2621, -0.5, 0.5);
    float _2631 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2625);
    float _2633 = log2(_2589);
    float _2635 = fma(_2621, 0.5, 0.5);
    float _2637 = _2595 + 1.0;
    float _2639 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2631);
    float _2641 = fma(_2635, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2643 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2639);
    float _2645 = 1.0 / _2627;
    float _2647 = _2585 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2649 = -_2595;
    float _2651 = fma(_2623, _2637, _2649);
    float _2653 = fma(_2635, _2641, -0.212114393711090087890625);
    float _2655 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2647);
    float _2657 = fma(_2651, 0.5, 0.5);
    float _2659 = fma(_2635, _2653, 1.570728778839111328125);
    float _2661 = sqrt(_2629);
    float _2663 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2655);
    float _2665 = _2633 * 0.693147182464599609375;
    float _2667 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2663);
    float _2669 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2671 = _2643 * _2645;
    float _2673 = _2667 * _2645;
    float _2675 = fma(_2671, 0.5, 0.5);
    float _2677 = fma(_2673, -0.5, 0.5);
    float _2679 = _2661 * 0.636619746685028076171875;
    float3 _6839 = float3(_2675, _2677, _2669);
    float _2681 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6839, float3(0.0), isnan(_6839)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6839, float3(0.0), isnan(_6839)), level(0.0)).x;
    float3 _6850 = float3(_2675, _2677, _2669);
    float4 _2684 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6850, float3(0.0), isnan(_6850)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6850, float3(0.0), isnan(_6850)), level(0.0)).xyzw;
    float _2686 = _2684.x;
    float _2688 = _2684.y;
    float _2690 = _2684.z;
    float _2692 = _2684.w;
    float _2694 = -_2659;
    float _2696 = fma(_2679, _2694, 1.0);
    float2 _6872 = float2(_2696, _2657);
    float3 _2700 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6872, float2(0.0), isnan(_6872)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6872, float2(0.0), isnan(_6872)), level(0.0)).xyz;
    float _2702 = _2700.x;
    float _2704 = _2700.y;
    float _2706 = _2700.z;
    float _2708 = _2575 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2710 = _2585 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2712 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2710);
    float _2714 = exp2(_2708);
    float _2716 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2712);
    float _2718 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2716);
    float _2720 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2722 = _2718 + _2627;
    out.gl_Position.x = _2643;
    out.gl_Position.y = _2667;
    out.gl_Position.z = _2718;
    out.gl_Position.w = _2627;
    float _2724 = _2722 * 0.5;
    float _2726 = -_2714;
    float _2728 = _2726 + 1.0;
    out.m_47.x = _2720;
    float _2730 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_72.z = _2724;
    out.m_72.w = _2627;
    float _2732 = _2730 * _2681;
    float _2734 = -_2730;
    float _2736 = _2734 + 1.0;
    float _2738 = _2692 * _2732;
    float _2740 = _2692 * _2736;
    float _2742 = _2706 * _2732;
    float _2744 = fma(_2702, _2738, _2686);
    float _2746 = fma(_2704, _2738, _2688);
    float _2748 = fma(_2692, _2742, _2690);
    out.m_74.x = _2744;
    out.m_74.y = _2746;
    out.m_74.z = _2748;
    out.m_74.w = _2740;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2047 = false;
    bool _1057 = false;
    bool _953 = false;
    bool _839 = false;
    bool _673 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2805 = as_type<float>(_109);
        out.gl_Position.z = _2805;
    }
    if (!_97)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = _127;
    if (_123)
    {
        float _131 = float(_93);
        _103 = _131;
    }
    float _133 = _103;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2875 = as_type<float>(_147);
        out.gl_Position.z = _2875;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _149 = in.m_51.x;
    float _151 = in.m_51.y;
    float _153 = in.m_51.z;
    float _155 = in.m_53.x;
    float _157 = in.m_53.y;
    float _159 = in.m_53.z;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = in.m_55.x;
    float _173 = in.m_55.y;
    float _175 = in.m_55.z;
    float _177 = _149 * _149;
    float _179 = _151 * _151;
    float _181 = fma(_155, _155, _177);
    float _183 = fma(_157, _157, _179);
    float _185 = fma(_171, _171, _181);
    float _187 = _153 * _153;
    float _189 = fma(_173, _173, _183);
    float _191 = sqrt(_185);
    float _193 = fma(_159, _159, _187);
    float _195 = fma(_175, _175, _193);
    float _197 = sqrt(_189);
    float _199 = sqrt(_195);
    bool _201 = _191 > 0.0;
    bool _203 = _197 > 0.0;
    float _205 = 0.0;
    float _207 = _185;
    float _209 = _175;
    float _211 = _149;
    if (_201)
    {
        float _213 = rsqrt(_185);
        _205 = _213;
    }
    float _215 = _205;
    float _217 = 0.0;
    if (!_201)
    {
        _217 = 0.0;
    }
    float _219 = _217;
    bool _221 = _199 > 0.0;
    float _223 = in.m_49.x;
    float _225 = in.m_49.y;
    float _227 = in.m_49.z;
    float _229 = 0.0;
    float _231 = _219;
    if (!_201)
    {
        _229 = 0.0;
    }
    float _233 = _229;
    float _235 = 0.0;
    float _237 = 0.0;
    float _239 = _233;
    if (!_203)
    {
        _235 = 0.0;
        _237 = 0.0;
    }
    float _241 = _235;
    float _243 = _237;
    float _245 = 0.0;
    float _247 = _241;
    float _249 = _243;
    if (_203)
    {
        float _251 = rsqrt(_189);
        _245 = _251;
    }
    float _253 = _245;
    float _255 = 0.0;
    if (!_201)
    {
        _255 = 0.0;
    }
    float _257 = _255;
    float _259 = 0.0;
    float _261 = _257;
    if (!_203)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = _195;
    float _267 = _263;
    if (_221)
    {
        float _269 = rsqrt(_195);
        _265 = _269;
    }
    float _271 = _265;
    if (_201)
    {
        float _273 = _215 * _155;
        _231 = _273;
    }
    float _275 = _231;
    if (_201)
    {
        float _277 = _215 * _149;
        _239 = _277;
    }
    float _279 = _239;
    if (_201)
    {
        float _281 = _215 * _171;
        _261 = _281;
    }
    float _283 = _261;
    float _285 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _287 = 0.0;
    float _289 = 0.0;
    float _291 = _285;
    if (!_221)
    {
        _287 = 0.0;
        _289 = 0.0;
    }
    float _293 = _287;
    float _295 = _289;
    float _297 = 0.0;
    float _299 = _295;
    float _301 = _293;
    if (!_221)
    {
        _297 = 0.0;
    }
    float _303 = _297;
    float _305 = _303;
    if (!_169)
    {
        float _307 = _285 * _285;
        float _309 = _307 * 0.5;
        _207 = _309;
    }
    float _311 = _207;
    float _313 = _311;
    if (_203)
    {
        float _315 = _253 * _157;
        _267 = _315;
    }
    float _317 = _267;
    if (_203)
    {
        float _319 = _253 * _151;
        _247 = _319;
    }
    float _321 = _247;
    if (_203)
    {
        float _323 = _253 * _173;
        _249 = _323;
    }
    float _325 = _249;
    if (!_169)
    {
        float _327 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _313 = _327;
    }
    float _329 = _313;
    float _331 = _329;
    if (_221)
    {
        float _333 = _271 * _159;
        _299 = _333;
    }
    float _335 = _299;
    if (_221)
    {
        float _337 = _271 * _153;
        _301 = _337;
    }
    float _339 = _301;
    if (_221)
    {
        float _341 = _271 * _175;
        _305 = _341;
    }
    float _343 = _305;
    bool _345 = !_169;
    if (!_345)
    {
        float _347 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = log2(_347);
        float _351 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _353 = _351 + 1.0;
        float _355 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _357 = _285 * _349;
        float _359 = 1.0 / _353;
        float _361 = _355 * 0.693147182464599609375;
        float _363 = exp2(_357);
        float _365 = 1.0 / _361;
        float _367 = _363 + (-1.0);
        float _369 = -_367;
        float _371 = fma(_369, _365, _285);
        float _373 = _371 * _359;
        float _375 = _373 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _331 = _375;
    }
    float _377 = _331;
    float _379 = _377 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _381 = !_169;
    float _383 = _377;
    if (!_381)
    {
        float _385 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _387 = log2(_385);
        float _389 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _391 = _389 + 1.0;
        float _393 = 1.0 / _391;
        float _395 = _285 * _387;
        float _397 = exp2(_395);
        float _399 = -_397;
        float _401 = _399 + 1.0;
        float _403 = _401 * _393;
        _291 = _403;
    }
    float _405 = _291;
    float _407 = _377 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _409 = _379 * _279;
    float _411 = _379 * _321;
    float _413 = _379 * _339;
    float _415 = 0.0;
    if (!_169)
    {
        float _417 = _127 * _127;
        float _419 = _417 * 0.5;
        _415 = _419;
    }
    float _421 = _415;
    float _423 = fma(_407, _275, _409);
    float _425 = _377 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _427 = fma(_407, _317, _411);
    float _429 = fma(_407, _335, _413);
    if (!_169)
    {
        float _431 = _421 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _383 = _431;
    }
    float _433 = _383;
    bool _435 = !_169;
    float _437 = _433;
    if (!_435)
    {
        float _439 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _441 = log2(_439);
        float _443 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _445 = _443 + 1.0;
        float _447 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _449 = _127 * _441;
        float _451 = 1.0 / _445;
        float _453 = _447 * 0.693147182464599609375;
        float _455 = exp2(_449);
        float _457 = 1.0 / _453;
        float _459 = _455 + (-1.0);
        float _461 = -_459;
        float _463 = fma(_461, _457, _127);
        float _465 = _463 * _451;
        float _467 = _465 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _437 = _467;
    }
    float _469 = _437;
    float _471 = fma(_425, _283, _423);
    float _473 = _469 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _475 = fma(_425, _325, _427);
    float _477 = fma(_425, _343, _429);
    float _479 = _469 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _481 = _473 * _321;
    float _483 = _469 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _485 = _473 * _279;
    float _487 = _473 * _339;
    float _489 = fma(_479, _317, _481);
    float _491 = fma(_405, _225, _475);
    float _493 = fma(_479, _275, _485);
    float _495 = fma(_479, _335, _487);
    float _497 = fma(_483, _325, _489);
    float _499 = _481;
    if (!_169)
    {
        _499 = _127;
    }
    float _501 = _499;
    bool _503 = !_169;
    float _505 = _501;
    if (!_503)
    {
        float _507 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _509 = log2(_507);
        float _511 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _513 = _511 + 1.0;
        float _515 = 1.0 / _513;
        float _517 = _127 * _509;
        float _519 = exp2(_517);
        float _521 = -_519;
        float _523 = _521 + 1.0;
        float _525 = _523 * _515;
        _505 = _525;
    }
    float _527 = _505;
    float _529 = fma(_483, _283, _493);
    float _531 = fma(_527, _225, _497);
    float _533 = fma(_483, _343, _495);
    float _535 = fma(_405, _223, _471);
    float _537 = fma(_527, _223, _529);
    float _539 = -_531;
    float _541 = _491 + _539;
    float _543 = fma(_405, _227, _477);
    float _545 = fma(_527, _227, _533);
    float _547 = -_537;
    float _549 = _535 + _547;
    float _551 = _541 * _541;
    float _553 = in.m_57.w;
    float _555 = -_545;
    float _557 = _543 + _555;
    float _559 = _541 * _173;
    float _561 = fma(_549, _549, _551);
    float _563 = _541 * _157;
    float _565 = _541 * _151;
    float _567 = fma(_549, _171, _559);
    float _569 = fma(_557, _557, _561);
    float _571 = fma(_549, _155, _563);
    float _573 = in.m_44.x;
    float _575 = in.m_44.y;
    float _577 = in.m_44.z;
    float _579 = fma(_549, _149, _565);
    float _581 = fma(_557, _159, _571);
    float _583 = sqrt(_569);
    float _585 = fma(_557, _153, _579);
    bool _587 = _583 >= 9.9999999747524270787835121154785e-07;
    bool _589 = isnan(_583);
    bool _591 = _587 || _589;
    bool _593 = isnan(9.9999999747524270787835121154785e-07);
    bool _595 = _591 || _593;
    float _597 = fma(_557, _175, _567);
    float _599 = fma(_535, _553, _573);
    float _601 = fma(_491, _553, _575);
    float _603 = fma(_543, _553, _577);
    float _605 = _597;
    float _607 = _581;
    float _609 = _585;
    float _611 = _585;
    float _613 = _581;
    float _615 = _597;
    if (!_595)
    {
        bool _617 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _619 = !_617;
        if (!_619)
        {
            float _621 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _623 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _625 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _627 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[16].x, _621);
            float _629 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[16].x, _623);
            float _631 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[16].x, _625);
            float _633 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[16].z, _627);
            float _635 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[16].z, _629);
            float _637 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[16].z, _631);
            float _639 = _633 * _151;
            float _641 = _633 * _157;
            float _643 = _633 * _173;
            float _645 = fma(_635, _149, _639);
            float _647 = fma(_635, _155, _641);
            float _649 = fma(_635, _171, _643);
            float _651 = fma(_637, _153, _645);
            float _653 = fma(_637, _159, _647);
            float _655 = fma(_637, _175, _649);
            float _657 = _651 * _651;
            float _659 = fma(_653, _653, _657);
            float _661 = fma(_655, _655, _659);
            float _663 = rsqrt(_661);
            float _665 = _663 * 9.9999999747524270787835121154785e-07;
            float _667 = _653 * _665;
            float _669 = _651 * _665;
            float _671 = _655 * _665;
            _611 = _669;
            _613 = _667;
            _615 = _671;
            _673 = true;
        }
        else
        {
            float _675 = _225 * _225;
            float _677 = fma(_223, _223, _675);
            float _679 = fma(_227, _227, _677);
            float _681 = sqrt(_679);
            bool _683 = _681 >= 9.9999999747524270787835121154785e-07;
            bool _685 = isnan(_681);
            bool _687 = _683 || _685;
            bool _689 = isnan(9.9999999747524270787835121154785e-07);
            bool _691 = _687 || _689;
            if (!_691)
            {
                float _693 = _575 * _575;
                float _695 = fma(_573, _573, _693);
                float _697 = fma(_577, _577, _695);
                float _699 = sqrt(_697);
                bool _701 = _699 >= 9.9999999747524270787835121154785e-07;
                bool _703 = isnan(_699);
                bool _705 = _701 || _703;
                bool _707 = isnan(9.9999999747524270787835121154785e-07);
                bool _709 = _705 || _707;
                float _711 = _189;
                if (!_709)
                {
                    float _713 = rsqrt(_189);
                    _711 = _713;
                }
                float _715 = _711;
                if (!_709)
                {
                    float _717 = _715 * 9.9999999747524270787835121154785e-07;
                    _605 = _717;
                }
                float _719 = _605;
                float _721 = _719;
                if (!_709)
                {
                    float _723 = _157 * _719;
                    _607 = _723;
                }
                float _725 = _607;
                _613 = _725;
                if (!_709)
                {
                    float _727 = _151 * _719;
                    _609 = _727;
                }
                float _729 = _609;
                _611 = _729;
                if (!_709)
                {
                    float _731 = _173 * _719;
                    _721 = _731;
                }
                float _733 = _721;
                bool _735 = !_709;
                _615 = _733;
                _673 = _735;
                if (!_673)
                {
                    float _737 = _151 * _575;
                    float _739 = _157 * _575;
                    float _741 = _173 * _575;
                    float _743 = fma(_149, _573, _737);
                    float _745 = fma(_155, _573, _739);
                    float _747 = fma(_171, _573, _741);
                    float _749 = fma(_153, _577, _743);
                    float _751 = fma(_159, _577, _745);
                    float _753 = fma(_175, _577, _747);
                    float _755 = _749 * _749;
                    float _757 = fma(_751, _751, _755);
                    float _759 = fma(_753, _753, _757);
                    float _761 = rsqrt(_759);
                    float _763 = _761 * 9.9999999747524270787835121154785e-07;
                    float _765 = _751 * _763;
                    float _767 = _749 * _763;
                    float _769 = _753 * _763;
                    _611 = _767;
                    _613 = _765;
                    _615 = _769;
                    _673 = true;
                }
            }
            else
            {
                float _771 = _151 * _225;
                float _773 = _157 * _225;
                float _775 = _173 * _225;
                float _777 = fma(_149, _223, _771);
                float _779 = fma(_155, _223, _773);
                float _781 = fma(_171, _223, _775);
                float _783 = fma(_153, _227, _777);
                float _785 = fma(_159, _227, _779);
                float _787 = fma(_175, _227, _781);
                float _789 = _783 * _783;
                float _791 = fma(_785, _785, _789);
                float _793 = fma(_787, _787, _791);
                float _795 = rsqrt(_793);
                float _797 = _795 * 9.9999999747524270787835121154785e-07;
                float _799 = _785 * _797;
                float _801 = _783 * _797;
                float _803 = _787 * _797;
                _611 = _801;
                _613 = _799;
                _615 = _803;
            }
        }
    }
    _673 = false;
    float _805 = _611;
    float _807 = _613;
    float _809 = _615;
    bool _811 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    bool _813 = !_811;
    float _815 = _805;
    float _817 = _807;
    float _819 = _809;
    float _837;
    if (!_813)
    {
        float _821 = in.m_59.x;
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _825 = _821 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _829 = _827 * _823;
        float _831 = floor(_829);
        float _833 = -_831;
        float _835 = _829 + _833;
        _837 = _835;
        _839 = true;
    }
    else
    {
        float _841 = float(_93);
        float _843 = 1.0 / _841;
        float _845 = _127 * _843;
        _837 = _845;
    }
    _839 = false;
    float _847 = _837;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _851 = _847 + _849;
    bool _853 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _855 = isnan(_847);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _865;
    bool _869 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _871 = isnan(_847);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = -_863;
    float _883 = _881 + 1.0;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _885;
    float _889 = 1.0 / _867;
    bool _891 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _893 = _879 * _883;
    float _895 = -_879;
    float _897 = _895 + 1.0;
    float _899 = _851 * _889;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _901;
    float _905 = fma(_887, _899, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _907;
    float _911 = fma(_903, _899, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _913 = _905 * _893;
    float _915 = fma(_909, _899, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _917 = _911 * _893;
    float _919 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[107].x, _913);
    float _921 = _915 * _893;
    float _923 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[107].z, _917);
    float _925 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[108].x, _919);
    float _927 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[107].y, _921);
    float _929 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[108].z, _923);
    float _931 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[108].y, _927);
    bool _933 = !_891;
    float _951;
    if (!_933)
    {
        float _935 = in.m_59.x;
        float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _939 = _935 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _943 = _941 * _937;
        float _945 = floor(_943);
        float _947 = -_945;
        float _949 = _943 + _947;
        _951 = _949;
        _953 = true;
    }
    else
    {
        float _955 = float(_93);
        float _957 = 1.0 / _955;
        float _959 = _127 * _957;
        _951 = _959;
    }
    _953 = false;
    float _961 = _951;
    bool _963 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _965 = isnan(_961);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _979 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _981 = isnan(_961);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _987 = _983 || _985;
    float _989 = float(_987);
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _991;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _997 = _961 + _995;
    float _999 = -_973;
    float _1001 = _999 + 1.0;
    bool _1003 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1005 = 1.0 / _977;
    float _1007 = _989 * _1001;
    float _1009 = -_989;
    float _1011 = _1009 + 1.0;
    float _1013 = _929 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1015 = _993 * _1005;
    float _1017 = _931 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1019 = fma(_1015, _997, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1021 = _925 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1023 = _1019 * _1007;
    float _1025 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1023);
    float _1027 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1025);
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1031 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1033 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1035 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _1029;
    out.m_61.y = _1031;
    out.m_61.z = _1033;
    out.m_61.w = _1035;
    bool _1037 = !_1003;
    float _1055;
    if (!_1037)
    {
        float _1039 = in.m_59.x;
        float _1041 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1043 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _1047 = _1045 * _1041;
        float _1049 = floor(_1047);
        float _1051 = -_1049;
        float _1053 = _1047 + _1051;
        _1055 = _1053;
        _1057 = true;
    }
    else
    {
        float _1059 = float(_93);
        float _1061 = 1.0 / _1059;
        float _1063 = _127 * _1061;
        _1055 = _1063;
    }
    _1057 = false;
    float _1065 = _1055;
    float _1067 = in.m_59.x;
    float _1069 = in.m_59.y;
    float _1071 = in.m_59.z;
    float _1073 = in.m_59.w;
    float _1075 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1077 = log2(_1075);
    float _1079 = _601 * _151;
    float _1081 = as_type<float>(int(gl_VertexIndex));
    float _1083 = fma(_599, _149, _1079);
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1085;
    float _1089 = _127 * _1077;
    float _1091 = 1.0 / _1087;
    float _1093 = _1071 * 2.0;
    float _1095 = _1067 * 2.0;
    float _1097 = _1069 * 2.0;
    int _1099 = as_type<int>(_1081) & 1;
    bool _1101 = _1099 != 0;
    int _1103 = as_type<int>(_1081) & 2;
    bool _1105 = _1103 != 0;
    float _1107 = floor(_1095);
    float _1109 = _601 * _157;
    float _1111 = _601 * _173;
    float _1113 = floor(_1093);
    float _1115 = floor(_1097);
    bool _1117 = _1107 > 0.0;
    bool _1119 = _1107 >= 0.0;
    bool _1121 = isnan(_1107);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan(0.0);
    bool _1127 = _1123 || _1125;
    int _1129 = _1127 ? 0 : 1;
    float _1131 = exp2(_1089);
    bool _1133 = _1113 > 0.0;
    float _1135 = fma(_599, _171, _1111);
    bool _1137 = _1113 >= 0.0;
    bool _1139 = isnan(_1113);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan(0.0);
    bool _1145 = _1141 || _1143;
    float _1147 = fma(_599, _155, _1109);
    int _1149 = _1145 ? 0 : 1;
    float _1151 = fma(_603, _159, _1147);
    bool _1153 = _1115 >= 0.0;
    bool _1155 = isnan(_1115);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan(0.0);
    bool _1161 = _1157 || _1159;
    int _1163 = ~_1149;
    int _1165 = _1163 + 1;
    int _1167 = _1165 + 1;
    float _1169 = _1151 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1171 = ~_1129;
    int _1173 = _1171 + 1;
    int _1175 = _1173 + 1;
    int _1177 = _1167;
    int _1179 = _1175;
    if (!_1133)
    {
        int _1181 = ~_1149;
        int _1183 = _1181 + 1;
        _1177 = _1183;
    }
    int _1185 = _1177;
    float _1187 = -_1131;
    float _1189 = _1187 + 1.0;
    if (!_1117)
    {
        int _1191 = ~_1129;
        int _1193 = _1191 + 1;
        _1179 = _1193;
    }
    int _1195 = _1179;
    float _1197 = _1071 + _1067;
    int _1199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1201 = _1199 != 0;
    int _1203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1205 = _1203 != 0;
    int _1207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1209 = _1207 != 0;
    float _1211 = fma(_603, _153, _1083);
    float _1213 = fma(_603, _175, _1135);
    float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1217 = _1169 + _1215;
    float _1219 = _1211 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1221 = !_1205;
    int _1223 = _1221 ? 0 : 1;
    float _1225 = _1213 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1227 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1229 = isnan(0.0);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1235 = _1231 || _1233;
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1239 = _1219 + _1237;
    bool _1241 = !_1201;
    int _1243 = _1241 ? 0 : 1;
    float _1245 = _1197 + (-1.0);
    float _1247 = _1235 ? _1189 : 0.0;
    float _1249 = _1239 * _1239;
    bool _1251 = _1115 > 0.0;
    float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1255 = _1225 + _1253;
    bool _1257 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1259 = isnan(1.0);
    bool _1261 = _1257 || _1259;
    bool _1263 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1265 = _1261 || _1263;
    float _1267 = fma(_1217, _1217, _1249);
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1271 = 1.0 + _1269;
    float _1273 = _1069 + _1071;
    int _1275 = _1161 ? 0 : 1;
    float _1277 = fma(_1255, _1255, _1267);
    float _1279 = 1.0 / _1271;
    bool _1281 = _1073 > 0.5;
    float _1283 = _1069 + _1067;
    float _1285 = _1273 + (-1.0);
    int _1287 = abs(_1243);
    float _1289 = _1283 + (-1.0);
    float _1291 = fma(_1285, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1293 = rsqrt(_1277);
    float _1295 = _805 * _805;
    float _1297 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1299 = abs(_1223);
    float _1301 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1303 = fma(_807, _807, _1295);
    float _1305 = float(_1185);
    float _1307 = _1067 + (-0.5);
    float _1309 = _1247 * _1279;
    float _1311 = fma(_809, _809, _1303);
    int _1313 = ~_1275;
    int _1315 = _1313 + 1;
    int _1317 = _1315 + 1;
    float _1319 = rsqrt(_1311);
    int _1321 = _1317;
    float _1323 = _1311;
    if (!_1251)
    {
        int _1325 = ~_1275;
        int _1327 = _1325 + 1;
        _1321 = _1327;
    }
    int _1329 = _1321;
    float _1331 = float(_1287);
    float _1333 = _1239 * _1293;
    float _1335 = float(_1299);
    float _1337 = _1217 * _1293;
    float _1339 = float(_1195);
    float _1341 = -_1333;
    float _1343 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1239);
    float _1345 = _1331 * _1305;
    float _1347 = -_1337;
    float _1349 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1217);
    bool _1351 = !_1209;
    int _1353 = _1351 ? 0 : 1;
    float _1355 = _1335 * _1339;
    float _1357 = _1343 * _1343;
    float _1359 = in.m_66.x;
    float _1361 = in.m_66.y;
    float _1363 = in.m_66.z;
    int _1365 = abs(_1353);
    float _1367 = _1319 * _809;
    float _1369 = fma(_1349, _1349, _1357);
    float _1371 = _1319 * _807;
    float _1373 = _1319 * _805;
    float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1377 = _1367 * _1375;
    float _1379 = _1345 * (-2.0);
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1383 = _1371 * _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1387 = _1373 * _1385;
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1391 = -_1377;
    float _1393 = fma(_1371, _1389, _1391);
    float _1395 = _1255 * _1293;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1399 = -_1387;
    float _1401 = fma(_1367, _1397, _1399);
    float _1403 = _1393 * _1393;
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1407 = -_1383;
    float _1409 = fma(_1373, _1405, _1407);
    float _1411 = float(_1365);
    float _1413 = -_1395;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1255);
    float _1417 = fma(_1401, _1401, _1403);
    float _1419 = fma(_1415, _1415, _1369);
    float _1421 = fma(_1409, _1409, _1417);
    float _1423 = float(_1329);
    float _1425 = fma(_1379, _1359, _1359);
    float _1427 = fma(_1297, _1379, _1297);
    float _1429 = _1355 * (-2.0);
    bool _1431 = !_1265;
    float _1433 = _1431 ? _127 : _1309;
    float _1435 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1425);
    float _1437 = _1411 * _1423;
    float _1439 = _1069 + (-0.5);
    float _1441 = fma(_1429, _1361, _1361);
    float _1443 = fma(_1433, _1427, _1435);
    float _1445 = _1437 * (-2.0);
    float _1447 = fma(_1291, _1429, _1291);
    float _1449 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1441);
    float _1451 = sqrt(_1419);
    float _1453 = _1443 * 0.15915493667125701904296875;
    float _1455 = fma(_1445, _1363, _1363);
    float _1457 = fma(_1433, _1447, _1449);
    float _1459 = _1071 + (-0.5);
    bool _1461 = !_1101;
    float _1463 = _1461 ? (-0.5) : 0.5;
    float _1465 = rsqrt(_1421);
    float _1467 = fma(_1301, _1445, _1301);
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1473 = _1471 != 0;
    float _1475 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1455);
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1479 = _1477 != 0;
    float _1481 = -_1469;
    float _1483 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[77].x, _1481);
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1487 = _1485 != 0;
    float _1489 = fma(_1433, _1467, _1475);
    int _1491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1493 = _1491 != 0;
    float _1495 = _1457 * 0.15915493667125701904296875;
    bool _1497 = !_1105;
    float _1499 = _1497 ? (-0.5) : 0.5;
    float _1501 = _1489 * 0.15915493667125701904296875;
    bool _1503 = _1071 > 0.5;
    float _1505 = _1495 * 6.283185482025146484375;
    float _1507 = sin(_1505);
    float _1509 = in.m_57.x;
    float _1511 = in.m_57.y;
    float _1513 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1515 = -_1499;
    int _1517 = _1281 ? as_type<int>(_1515) : as_type<int>(_1499);
    float _1519 = _1401 * _1465;
    bool _1521 = _1069 > 0.5;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1525 = _1495 * 6.283185482025146484375;
    float _1527 = cos(_1525);
    float _1529 = _1393 * _1465;
    float _1531 = _1409 * _1465;
    float _1533 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1499);
    bool _1535 = !_1493;
    float _1537 = _1535 ? _1499 : as_type<float>(_1517);
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1541 = _1367 * _1519;
    float _1543 = _1453 * 6.283185482025146484375;
    float _1545 = sin(_1543);
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1549 = _1293 * _1451;
    float _1551 = fma(_1513, -2.0, _1539);
    float _1553 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1547);
    float _1555 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1551);
    float _1557 = _1453 * 6.283185482025146484375;
    float _1559 = cos(_1557);
    float _1561 = _1509 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1563 = _1511 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1565 = _1561 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1567 = _1501 * 6.283185482025146484375;
    float _1569 = cos(_1567);
    float _1571 = -_1499;
    int _1573 = _1521 ? as_type<int>(_1571) : as_type<int>(_1499);
    float _1575 = _1545 * _1507;
    bool _1577 = _1067 > 0.5;
    float _1579 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1523);
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1583 = _1065 + _1581;
    float _1585 = _1545 * _1527;
    float _1587 = _1565 * _1549;
    float _1589 = _1501 * 6.283185482025146484375;
    float _1591 = sin(_1589);
    float _1593 = _1583 * _1091;
    float _1595 = _1559 * _1527;
    bool _1597 = !_1479;
    float _1599 = _1597 ? _1499 : as_type<float>(_1573);
    float _1601 = _1545 * _1569;
    float _1603 = _1559 * _1507;
    float _1605 = _1527 * _1569;
    float _1607 = _1559 * _1569;
    float _1609 = _1507 * _1569;
    float _1611 = fma(_1591, _1595, _1575);
    float _1613 = fma(_1591, _1575, _1595);
    float _1615 = _1563 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1617 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1463);
    float _1619 = -_1603;
    float _1621 = fma(_1591, _1585, _1619);
    float _1623 = _1607 * _1367;
    float _1625 = _1615 * _1549;
    float _1627 = _1587 * _1617;
    float _1629 = _1607 * _1371;
    float _1631 = _1373 * _1531;
    float _1633 = -_1585;
    float _1635 = fma(_1591, _1603, _1633);
    float _1637 = _1371 * _1529;
    float _1639 = -_1591;
    float _1641 = fma(_1639, _1519, _1629);
    float _1643 = -_1631;
    float _1645 = fma(_1367, _1529, _1643);
    float _1647 = -_1591;
    float _1649 = fma(_1647, _1531, _1623);
    float _1651 = _1611 * _1371;
    float _1653 = _1635 * _1371;
    float _1655 = _1611 * _1367;
    float _1657 = -_1637;
    float _1659 = fma(_1373, _1519, _1657);
    float _1661 = _1625 * _1533;
    float _1663 = fma(_1605, _1519, _1651);
    float _1665 = fma(_1601, _1645, _1641);
    float _1667 = fma(_1609, _1519, _1653);
    float _1669 = fma(_1605, _1531, _1655);
    float _1671 = _1635 * _1367;
    float _1673 = fma(_1601, _1659, _1649);
    float _1675 = _1661 * _1665;
    float _1677 = fma(_1621, _1645, _1663);
    float _1679 = fma(_1621, _1659, _1669);
    float _1681 = fma(_1609, _1531, _1671);
    float _1683 = _1661 * _1673;
    float _1685 = fma(_1613, _1645, _1667);
    float _1687 = fma(_1627, _1677, _1675);
    float _1689 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1691 = _1689 * 0.5;
    float _1693 = fma(_1613, _1659, _1681);
    float _1695 = fma(_1627, _1679, _1683);
    float _1697 = fma(_1691, _1685, _1687);
    float _1699 = -_1463;
    int _1701 = _1577 ? as_type<int>(_1699) : as_type<int>(_1463);
    float _1703 = fma(_1691, _1693, _1695);
    float _1705 = _1607 * _1373;
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1709 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1707;
    float _1711 = _1169 + _1697;
    float _1713 = _1225 + _1703;
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1717 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1715;
    float _1719 = fma(_1709, _1593, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1721 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1723 = _1711 + _1721;
    float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1727 = _1713 + _1725;
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1729;
    bool _1733 = !_1473;
    float _1735 = _1733 ? _1463 : as_type<float>(_1701);
    float _1737 = _1723 * _1723;
    float _1739 = _1727 * _1727;
    float _1741 = -_1541;
    float _1743 = fma(_1371, _1531, _1741);
    float _1745 = -_1591;
    float _1747 = fma(_1745, _1529, _1705);
    float _1749 = _1611 * _1373;
    float _1751 = _1737 + _1739;
    float _1753 = fma(_1717, _1593, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1755 = fma(_1731, _1593, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1759 = _1635 * _1373;
    float _1761 = fma(_1605, _1529, _1749);
    float _1763 = fma(_1601, _1743, _1747);
    bool _1765 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1767 = isnan(_1065);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1773 = _1769 || _1771;
    float _1775 = float(_1773);
    float _1777 = fma(_1609, _1529, _1759);
    float _1779 = fma(_1621, _1743, _1761);
    float _1781 = _1661 * _1763;
    float _1783 = sqrt(_1751);
    bool _1785 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1787 = isnan(_1065);
    bool _1789 = _1785 || _1787;
    bool _1791 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1793 = _1789 || _1791;
    float _1795 = float(_1793);
    float _1797 = -_1775;
    float _1799 = _1797 + 1.0;
    float _1801 = fma(_1613, _1743, _1777);
    float _1803 = fma(_1627, _1779, _1781);
    float _1805 = -_127;
    float _1807 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1483);
    float _1809 = _1795 * _1799;
    float _1811 = -_1463;
    int _1813 = _1503 ? as_type<int>(_1811) : as_type<int>(_1463);
    float _1815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1817 = fma(_1691, _1801, _1803);
    float _1819 = _1719 * _1809;
    float _1821 = _1753 * _1809;
    float _1823 = _1755 * _1809;
    float _1825 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1827 = _1599 + (-0.5);
    float _1829 = _1219 + _1817;
    bool _1831 = _1783 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1835 = _1735 + 0.5;
    float _1837 = -_1825;
    float _1839 = -_1555;
    float _1841 = fma(_1837, _1827, _1839);
    bool _1843 = !_1487;
    float _1845 = _1843 ? _1463 : as_type<float>(_1813);
    float _1847 = -_1795;
    float _1849 = _1847 + 1.0;
    float _1851 = _1815 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1853 = fma(_1851, _1835, _1807);
    float _1855 = _1827;
    float _1857 = _1737;
    float _1859 = _1739;
    float _1861 = _1711;
    float _1863 = _1713;
    if (!_1831)
    {
        _1855 = _1829;
    }
    float _1865 = _1855;
    bool _1867 = !_1831;
    float _1869 = _1865;
    if (!_1867)
    {
        float _1871 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1875 = _1783 + _1873;
        float _1877 = rsqrt(_1751);
        float _1879 = _1875 * _1871;
        float _1881 = _1829 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1883 = _1879 * 0.15915493667125701904296875;
        float _1885 = _1883 * 6.283185482025146484375;
        float _1887 = sin(_1885);
        float _1889 = _1883 * 6.283185482025146484375;
        float _1891 = cos(_1889);
        float _1893 = fma(_1887, _1881, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1895 = _1877 * _1893;
        float _1897 = _1891 + (-1.0);
        float _1899 = fma(_1723, _1895, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1901 = fma(_1727, _1895, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1903 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1907 = _1899 + _1905;
        float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1911 = _1901 + _1909;
        float _1913 = fma(_1829, _1891, _1903);
        float _1915 = _1907 * _1907;
        float _1917 = _1911 * _1911;
        _1869 = _1913;
        _1857 = _1915;
        _1859 = _1917;
        _1861 = _1899;
        _1863 = _1901;
    }
    float _1919 = _1869;
    float _1921 = _1857;
    float _1923 = _1859;
    float _1925 = _1861;
    float _1927 = _1863;
    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1931 = _1919 + _1929;
    float _1933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1935 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1819);
    float _1937 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1821);
    float _1939 = fma(_1931, _1931, _1921);
    float _1941 = _1845 + 0.5;
    float _1943 = fma(_1849, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1823);
    float _1945 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1579);
    float _1947 = _1939 + _1923;
    float _1949 = -_1537;
    float _1951 = _1949 + 0.5;
    float _1953 = _1941 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1955 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1935);
    float _1957 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1937);
    float _1959 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1943);
    float _1961 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1553);
    float _1963 = sqrt(_1947);
    float _1965 = -_1945;
    float _1967 = _1965 + 1.0;
    float _1969 = _1951 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1971 = _1953 * _1833;
    float _1973 = -_1961;
    float _1975 = _1973 + 1.0;
    float _1977 = _1955 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1979 = _1957 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1981 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1983 = -_1967;
    float _1985 = fma(_1735, _1983, _1853);
    float _1987 = fma(_1599, _1975, _1841);
    float _1989 = _1969 * _1933;
    float _1991 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1993 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = _1979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1997 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _1985;
    out.m_68.y = _1987;
    out.m_68.z = _1971;
    out.m_68.w = _1989;
    bool _1999 = _1963 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2001 = isnan(_1963);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2007 = _2003 || _2005;
    out.m_70.x = _1993;
    out.m_70.y = _1995;
    out.m_70.z = _1997;
    out.m_70.w = _1991;
    float _2009 = _1955;
    float _2011 = _1991;
    if (!_2007)
    {
        _2009 = 1.0;
    }
    float _2013 = _2009;
    bool _2015 = !_2007;
    float _2017 = _2013;
    if (!_2015)
    {
        bool _2019 = _1963 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2021 = isnan(_1963);
        bool _2023 = _2019 || _2021;
        bool _2025 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2027 = _2023 || _2025;
        if (!_2027)
        {
            float _2029 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2031 = _1963 + _2029;
            float _2033 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2035 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2033;
            float _2037 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2039 = _2037 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2041 = 1.0 / _2035;
            float _2043 = _2031 * _2041;
            float _2045 = fma(_2043, _2039, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2017 = _2045;
            _2047 = true;
        }
        else
        {
            bool _2049 = _1963 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2051 = isnan(_1963);
            bool _2053 = _2049 || _2051;
            bool _2055 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2057 = _2053 || _2055;
            if (!_2057)
            {
                float _2059 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2061 = _1963 + _2059;
                float _2063 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2065 = _2063 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2067 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2069 = _2067 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2071 = 1.0 / _2065;
                float _2073 = _2061 * _2071;
                float _2075 = fma(_2073, _2069, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2017 = _2075;
                _2047 = true;
            }
            else
            {
                _2017 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2047 = false;
    float _2077 = _2017;
    float _2079 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2081 = _1919 + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2085 = _1925 + _2083;
    float _2087 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2089 = _1927 + _2087;
    float _2091 = fma(_2081, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2093 = fma(_2085, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2095 = fma(_2089, _2077, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2097 = -_1219;
    float _2099 = _2097 + _2091;
    float _2101 = -_1169;
    float _2103 = _2101 + _2093;
    float _2105 = -_1225;
    float _2107 = _2105 + _2095;
    float _2109 = _2099 * _2099;
    float _2111 = fma(_2103, _2103, _2109);
    float _2113 = fma(_2107, _2107, _2111);
    float _2115 = sqrt(_2113);
    bool _2117 = _2115 > 0.0;
    bool _2119 = !_2117;
    float _2121 = _2115;
    float _2123 = _2091;
    float _2125 = _2093;
    float _2127 = _2095;
    if (!_2119)
    {
        bool _2129 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2131 = _1995;
        if (_2129)
        {
            float _2133 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2131 = _2133;
        }
        float _2135 = _2131;
        float _2137 = _2135;
        if (_2129)
        {
            float _2139 = _2135 * _807;
            _2121 = _2139;
        }
        float _2141 = _2121;
        float _2143 = _2141;
        if (_2129)
        {
            float _2145 = _2135 * _805;
            _2011 = _2145;
        }
        float _2147 = _2011;
        float _2149 = _2147;
        if (_2129)
        {
            float _2151 = _2135 * _809;
            _2137 = _2151;
        }
        float _2153 = _2137;
        float _2155 = _2153;
        if (!_2129)
        {
            float _2157 = _127 + 1.0;
            if (!_169)
            {
                float _2159 = _2157 * _2157;
                float _2161 = _2159 * 0.5;
                _129 = _2161;
            }
            float _2163 = _129;
            float _2165 = _2163;
            if (!_169)
            {
                float _2167 = _2163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2165 = _2167;
            }
            float _2169 = _2165;
            bool _2171 = !_169;
            float _2173 = _2169;
            if (!_2171)
            {
                float _2175 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2177 = log2(_2175);
                float _2179 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2181 = _2179 + 1.0;
                float _2183 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2185 = _2177 * _2157;
                float _2187 = 1.0 / _2181;
                float _2189 = _2183 * 0.693147182464599609375;
                float _2191 = exp2(_2185);
                float _2193 = 1.0 / _2189;
                float _2195 = _2191 + (-1.0);
                float _2197 = -_2195;
                float _2199 = fma(_2197, _2193, _2157);
                float _2201 = _2199 * _2187;
                float _2203 = _2201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2173 = _2203;
            }
            float _2205 = _2173;
            float _2207 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2209 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2211 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2213 = _2205;
            if (!_169)
            {
                _2213 = _2157;
            }
            float _2215 = _2213;
            float _2217 = _2207 * _321;
            float _2219 = _2207 * _279;
            float _2221 = _2207 * _339;
            float _2223 = fma(_2209, _317, _2217);
            float _2225 = fma(_2209, _275, _2219);
            float _2227 = fma(_2211, _325, _2223);
            bool _2229 = !_169;
            float _2231 = _2215;
            if (!_2229)
            {
                float _2233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2235 = log2(_2233);
                float _2237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2239 = _2237 + 1.0;
                float _2241 = 1.0 / _2239;
                float _2243 = _2235 * _2157;
                float _2245 = exp2(_2243);
                float _2247 = -_2245;
                float _2249 = _2247 + 1.0;
                float _2251 = _2249 * _2241;
                _2231 = _2251;
            }
            float _2253 = _2231;
            float _2255 = fma(_2209, _335, _2221);
            float _2257 = fma(_2211, _283, _2225);
            float _2259 = fma(_2253, _225, _2227);
            float _2261 = fma(_2211, _343, _2255);
            float _2263 = fma(_2253, _223, _2257);
            float _2265 = -_531;
            float _2267 = _2265 + _2259;
            float _2269 = fma(_2253, _227, _2261);
            float _2271 = -_537;
            float _2273 = _2271 + _2263;
            float _2275 = _2267 * _151;
            float _2277 = _2267 * _157;
            float _2279 = -_545;
            float _2281 = _2279 + _2269;
            float _2283 = _2267 * _173;
            float _2285 = fma(_2273, _149, _2275);
            float _2287 = fma(_2273, _155, _2277);
            float _2289 = fma(_2273, _171, _2283);
            float _2291 = fma(_2281, _153, _2285);
            float _2293 = fma(_2281, _159, _2287);
            float _2295 = fma(_2281, _175, _2289);
            float _2297 = _2291 * _2291;
            float _2299 = fma(_2293, _2293, _2297);
            float _2301 = fma(_2295, _2295, _2299);
            _1323 = _2301;
            _815 = _2291;
            _817 = _2293;
            _819 = _2295;
            _2143 = _2293;
            _2149 = _2291;
            _2155 = _2295;
        }
        float _2303 = _1323;
        float _2305 = _815;
        float _2307 = _817;
        float _2309 = _819;
        float _2311 = _2143;
        float _2313 = _2149;
        float _2315 = _2155;
        float _2317 = sqrt(_2303);
        float _2319 = rsqrt(_2113);
        bool _2321 = _2317 > 0.0;
        float _2323 = _2103 * _2319;
        float _2325 = _2099 * _2319;
        float _2327 = _2107 * _2319;
        bool _2329 = !_2321;
        if (!_2329)
        {
            float _2331 = rsqrt(_2303);
            float _2333 = _2331 * _2305;
            float _2335 = _2331 * _2307;
            float _2337 = _2331 * _2309;
            float _2339 = _2325 * _2333;
            float _2341 = fma(_2323, _2335, _2339);
            float _2343 = fma(_2327, _2337, _2341);
            float _2345 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2347 = fma(_2311, _2345, _2093);
            float _2349 = fma(_2313, _2345, _2091);
            float _2351 = fma(_2315, _2345, _2095);
            _2123 = _2349;
            _2125 = _2347;
            _2127 = _2351;
        }
    }
    float _2353 = _2123;
    float _2355 = _2125;
    float _2357 = _2127;
    float _2359 = -_1333;
    float _2361 = fma(_2359, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2353);
    float _2363 = -_1337;
    float _2365 = fma(_2363, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2355);
    float _2367 = -_1395;
    float _2369 = fma(_2367, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2357);
    float _2371 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2373 = _2361 + _2371;
    float _2375 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2377 = _2365 + _2375;
    float _2379 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2381 = _2369 + _2379;
    float _2383 = _2373 * _2373;
    float _2385 = fma(_2377, _2377, _2383);
    float _2387 = fma(_2381, _2381, _2385);
    float _2389 = rsqrt(_2387);
    float _2391 = sqrt(_2387);
    float _2393 = _2389 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2395 = _2377 * _2393;
    float _2397 = _2381 * _2393;
    float _2399 = _2395 * _2395;
    float _2401 = _2397 * _2397;
    float _2403 = _2399 + _2401;
    float _2405 = sqrt(_2403);
    bool _2407 = _2405 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2411 = _2405 + _2409;
    float _2413 = _2389;
    float _2415 = _2403;
    float _2417 = _2411;
    float _2419 = _2373;
    if (_2407)
    {
        float _2421 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2413 = _2421;
    }
    float _2423 = _2413;
    if (_2407)
    {
        float _2425 = rsqrt(_2403);
        _2415 = _2425;
    }
    float _2427 = _2415;
    float _2429 = _2427;
    if (_2407)
    {
        float _2431 = _2411 * _2423;
        _2417 = _2431;
    }
    float _2433 = _2417;
    if (_2407)
    {
        float _2435 = _2433 * 0.15915493667125701904296875;
        _209 = _2435;
    }
    float _2437 = _209;
    float _2439 = _2381;
    float _2441 = _2437;
    if (_2407)
    {
        float _2443 = _2437 * 6.283185482025146484375;
        float _2445 = sin(_2443);
        _2439 = _2445;
    }
    float _2447 = _2439;
    float _2449 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2451 = precise::max(0.0, _2449);
    float _2453 = _2423;
    float _2455 = _2451;
    if (_2407)
    {
        float _2457 = _2437 * 6.283185482025146484375;
        float _2459 = cos(_2457);
        _2453 = _2459;
    }
    float _2461 = _2453;
    float _2463 = -_2393;
    float _2465 = -_2451;
    float _2467 = fma(_2373, _2463, _2465);
    if (_2407)
    {
        float _2469 = _2467 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2419 = _2469;
    }
    float _2471 = _2419;
    float _2473 = _2471;
    float _2475 = _2447;
    if (_2407)
    {
        float _2477 = fma(_2447, _2471, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2473 = _2477;
    }
    float _2479 = _2473;
    float _2481 = _2479;
    if (!_2407)
    {
        _2475 = _2395;
    }
    float _2483 = _2475;
    float _2485 = _2483;
    float _2487 = _2461;
    if (_2407)
    {
        float _2489 = _2461 + (-1.0);
        _2455 = _2489;
    }
    float _2491 = _2455;
    float _2493 = _2491;
    if (_2407)
    {
        float _2495 = _2427 * _2479;
        _211 = _2495;
    }
    float _2497 = _211;
    if (!_2407)
    {
        _2481 = _2467;
    }
    float _2499 = _2481;
    float _2501 = _2499;
    if (_2407)
    {
        float _2503 = _2491 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2441 = _2503;
    }
    float _2505 = _2441;
    if (_2407)
    {
        float _2507 = _2395 * _2497;
        _2485 = _2507;
    }
    float _2509 = _2485;
    if (!_2407)
    {
        _2493 = _2397;
    }
    float _2511 = _2493;
    float _2513 = _2511;
    if (_2407)
    {
        float _2515 = _2397 * _2497;
        _2513 = _2515;
    }
    float _2517 = _2513;
    if (!_2407)
    {
        _2429 = _2399;
    }
    float _2519 = _2429;
    float _2521 = _2519;
    if (_2407)
    {
        float _2523 = fma(_2467, _2461, _2505);
        _2501 = _2523;
    }
    float _2525 = _2501;
    if (_2407)
    {
        float _2527 = _2509 * _2509;
        _2521 = _2527;
    }
    float _2529 = _2521;
    if (!_2407)
    {
        _2487 = _2401;
    }
    float _2531 = _2487;
    float _2533 = _2531;
    if (_2407)
    {
        float _2535 = _2517 * _2517;
        _2533 = _2535;
    }
    float _2537 = _2533;
    float _2539 = fma(_2525, _2525, _2529);
    float _2541 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2543 = _2539 + _2537;
    float _2545 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2547 = fma(_2391, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2545);
    float _2549 = precise::clamp(_2547, 0.0, 1.0);
    float _2551 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2541);
    float _2553 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2555 = rsqrt(_2543);
    float _2557 = -_2549;
    float _2559 = _2557 + 1.0;
    float _2561 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2551);
    float _2563 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2565 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2553);
    float _2567 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2569 = _2561 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2571 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2563);
    float _2573 = abs(_2559);
    float _2575 = log2(_2573);
    float _2577 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2565);
    float _2579 = _2569 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2581 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2571);
    float _2583 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2585 = _2577 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2587 = -_2579;
    float _2589 = fma(_2587, _2567, 1.0);
    float _2591 = _2581 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2593 = _2555 * _2509;
    float _2595 = _2555 * _2525;
    float _2597 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2583);
    float _2599 = _2585 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2601 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2603 = _2555 * _2517;
    float _2605 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2597);
    float _2607 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2599);
    float _2609 = -_2601;
    float _2611 = fma(_2595, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2609);
    float _2613 = _2575 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2615 = _2605 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2617 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2607);
    float _2619 = -_2603;
    float _2621 = fma(_2619, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2611);
    float _2623 = exp2(_2613);
    float _2625 = _2585 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2627 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2617);
    float _2629 = fma(_2621, -0.5, 0.5);
    float _2631 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2625);
    float _2633 = log2(_2589);
    float _2635 = fma(_2621, 0.5, 0.5);
    float _2637 = _2595 + 1.0;
    float _2639 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2631);
    float _2641 = fma(_2635, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2643 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2639);
    float _2645 = 1.0 / _2627;
    float _2647 = _2585 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2649 = -_2595;
    float _2651 = fma(_2623, _2637, _2649);
    float _2653 = fma(_2635, _2641, -0.212114393711090087890625);
    float _2655 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2647);
    float _2657 = fma(_2651, 0.5, 0.5);
    float _2659 = fma(_2635, _2653, 1.570728778839111328125);
    float _2661 = sqrt(_2629);
    float _2663 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2655);
    float _2665 = _2633 * 0.693147182464599609375;
    float _2667 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2663);
    float _2669 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2671 = _2643 * _2645;
    float _2673 = _2667 * _2645;
    float _2675 = fma(_2671, 0.5, 0.5);
    float _2677 = fma(_2673, -0.5, 0.5);
    float _2679 = _2661 * 0.636619746685028076171875;
    float3 _6839 = float3(_2675, _2677, _2669);
    float _2681 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6839, float3(0.0), isnan(_6839)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6839, float3(0.0), isnan(_6839)), level(0.0)).x;
    float3 _6850 = float3(_2675, _2677, _2669);
    float4 _2684 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6850, float3(0.0), isnan(_6850)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6850, float3(0.0), isnan(_6850)), level(0.0)).xyzw;
    float _2686 = _2684.x;
    float _2688 = _2684.y;
    float _2690 = _2684.z;
    float _2692 = _2684.w;
    float _2694 = -_2659;
    float _2696 = fma(_2679, _2694, 1.0);
    float2 _6872 = float2(_2696, _2657);
    float3 _2700 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6872, float2(0.0), isnan(_6872)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6872, float2(0.0), isnan(_6872)), level(0.0)).xyz;
    float _2702 = _2700.x;
    float _2704 = _2700.y;
    float _2706 = _2700.z;
    float _2708 = _2575 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2710 = _2585 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2712 = fma(_2591, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2710);
    float _2714 = exp2(_2708);
    float _2716 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2712);
    float _2718 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2716);
    float _2720 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2722 = _2718 + _2627;
    out.gl_Position.x = _2643;
    out.gl_Position.y = _2667;
    out.gl_Position.z = _2718;
    out.gl_Position.w = _2627;
    float _2724 = _2722 * 0.5;
    float _2726 = -_2714;
    float _2728 = _2726 + 1.0;
    out.m_47.x = _2720;
    float _2730 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_72.z = _2724;
    out.m_72.w = _2627;
    float _2732 = _2730 * _2681;
    float _2734 = -_2730;
    float _2736 = _2734 + 1.0;
    float _2738 = _2692 * _2732;
    float _2740 = _2692 * _2736;
    float _2742 = _2706 * _2732;
    float _2744 = fma(_2702, _2738, _2686);
    float _2746 = fma(_2704, _2738, _2688);
    float _2748 = fma(_2692, _2742, _2690);
    out.m_74.x = _2744;
    out.m_74.y = _2746;
    out.m_74.z = _2748;
    out.m_74.w = _2740;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

