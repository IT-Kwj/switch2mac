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
    float4 m_66 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_70 [[user(locn4)]];
    float4 m_74 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1669 = false;
    bool _667 = false;
    bool _505 = false;
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
        float _2377 = as_type<float>(_109);
        out.gl_Position.z = _2377;
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
    float _145 = _143;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    if (_139)
    {
        float _147 = _143 * 5.0;
        _111 = as_type<int>(_147);
    }
    int _149 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2448 = as_type<float>(_149);
        out.gl_Position.z = _2448;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = in.m_49.x;
    float _153 = in.m_49.y;
    float _155 = in.m_49.z;
    float _157 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = 0.0;
    float _171 = _157;
    if (!_167)
    {
        float _173 = _157 * _157;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = 0.0;
    float _181 = _177;
    if (!_167)
    {
        float _183 = _127 * _127;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    if (!_167)
    {
        float _189 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _189;
    }
    float _191 = _181;
    bool _193 = !_167;
    float _195 = _191;
    float _197 = 0.0;
    if (!_193)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _157 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _157);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _145 = _213;
        _195 = _227;
        _197 = _215;
    }
    float _229 = _145;
    float _231 = _195;
    float _233 = _197;
    bool _235 = !_167;
    float _237 = _229;
    float _239 = _233;
    if (!_235)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _157 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _237 = _253;
        _239 = _247;
        _171 = _259;
    }
    float _261 = _237;
    float _263 = _239;
    float _265 = _171;
    float _267 = _263;
    float _269 = _261;
    if (!_167)
    {
        _267 = _127;
    }
    float _271 = _267;
    float _273 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _275 = _271;
    if (!_167)
    {
        float _277 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _269 = _277;
    }
    float _279 = _269;
    bool _281 = !_167;
    float _283 = _279;
    if (!_281)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = _127 * _287;
        float _297 = 1.0 / _291;
        float _299 = _293 * 0.693147182464599609375;
        float _301 = exp2(_295);
        float _303 = 1.0 / _299;
        float _305 = _301 + (-1.0);
        float _307 = -_305;
        float _309 = fma(_307, _303, _127);
        float _311 = _309 * _297;
        float _313 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _283 = _313;
    }
    float _315 = _283;
    bool _317 = !_167;
    if (!_317)
    {
        float _319 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _321 = log2(_319);
        float _323 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _325 = _323 + 1.0;
        float _327 = 1.0 / _325;
        float _329 = _127 * _321;
        float _331 = exp2(_329);
        float _333 = -_331;
        float _335 = _333 + 1.0;
        float _337 = _335 * _327;
        _275 = _337;
    }
    float _339 = _275;
    float _341 = fma(_265, _151, _273);
    float _343 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _345 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _347 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _349 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = fma(_265, _153, _343);
    float _353 = fma(_339, _153, _345);
    float _355 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _357 = fma(_339, _151, _347);
    float _359 = fma(_339, _155, _349);
    float _361 = -_353;
    float _363 = _351 + _361;
    float _365 = fma(_265, _155, _355);
    float _367 = -_357;
    float _369 = _341 + _367;
    float _371 = in.m_51.y;
    float _373 = _363 * _363;
    float _375 = -_359;
    float _377 = _365 + _375;
    float _379 = in.m_53.y;
    float _381 = fma(_369, _369, _373);
    float _383 = in.m_55.y;
    float _385 = fma(_377, _377, _381);
    float _387 = in.m_51.x;
    float _389 = sqrt(_385);
    float _391 = in.m_53.x;
    float _393 = in.m_51.z;
    float _395 = in.m_55.x;
    float _397 = _363 * _371;
    float _399 = in.m_53.z;
    float _401 = _363 * _379;
    bool _403 = _389 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_389);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = in.m_55.z;
    float _415 = _363 * _383;
    float _417 = _383 * _383;
    float _419 = in.m_57.w;
    float _421 = fma(_369, _387, _397);
    float _423 = in.m_44.x;
    float _425 = in.m_44.y;
    float _427 = in.m_44.z;
    float _429 = fma(_369, _391, _401);
    float _431 = fma(_377, _393, _421);
    float _433 = fma(_371, _371, _417);
    float _435 = fma(_369, _395, _415);
    float _437 = fma(_379, _379, _433);
    float _439 = fma(_377, _399, _429);
    float _441 = _429;
    float _443 = _433;
    if (_411)
    {
        _441 = _431;
    }
    float _445 = _441;
    float _447 = fma(_377, _413, _435);
    float _449 = _445;
    float _451 = _447;
    float _453 = _447;
    float _455 = _445;
    if (_411)
    {
        _443 = _439;
    }
    float _457 = _443;
    float _459 = fma(_341, _419, _423);
    float _461 = fma(_351, _419, _425);
    float _463 = fma(_365, _419, _427);
    float _465 = _457;
    if (!_411)
    {
        bool _467 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _469 = !_467;
        if (!_469)
        {
            float _471 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _473 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _475 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _477 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[16].x, _471);
            float _479 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[16].x, _473);
            float _481 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[16].x, _475);
            float _483 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[16].z, _477);
            float _485 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[16].z, _479);
            float _487 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[16].z, _481);
            float _489 = _483 * _483;
            float _491 = fma(_485, _485, _489);
            float _493 = fma(_487, _487, _491);
            float _495 = rsqrt(_493);
            float _497 = _495 * 9.9999999747524270787835121154785e-07;
            float _499 = _485 * _497;
            float _501 = _483 * _497;
            float _503 = _487 * _497;
            _453 = _501;
            _455 = _499;
            _465 = _503;
            _505 = true;
        }
        else
        {
            float _507 = _153 * _153;
            float _509 = fma(_151, _151, _507);
            float _511 = fma(_155, _155, _509);
            float _513 = sqrt(_511);
            bool _515 = _513 >= 9.9999999747524270787835121154785e-07;
            bool _517 = isnan(_513);
            bool _519 = _515 || _517;
            bool _521 = isnan(9.9999999747524270787835121154785e-07);
            bool _523 = _519 || _521;
            float _525 = _513;
            if (!_523)
            {
                float _527 = _425 * _425;
                float _529 = fma(_423, _423, _527);
                float _531 = fma(_427, _427, _529);
                float _533 = sqrt(_531);
                bool _535 = _533 >= 9.9999999747524270787835121154785e-07;
                bool _537 = isnan(_533);
                bool _539 = _535 || _537;
                bool _541 = isnan(9.9999999747524270787835121154785e-07);
                bool _543 = _539 || _541;
                float _545 = _437;
                if (!_543)
                {
                    float _547 = rsqrt(_437);
                    _545 = _547;
                }
                float _549 = _545;
                if (!_543)
                {
                    float _551 = _549 * 9.9999999747524270787835121154785e-07;
                    _525 = _551;
                }
                float _553 = _525;
                float _555 = _553;
                if (!_543)
                {
                    float _557 = _371 * _553;
                    _449 = _557;
                }
                float _559 = _449;
                _455 = _559;
                if (!_543)
                {
                    float _561 = _383 * _553;
                    _451 = _561;
                }
                float _563 = _451;
                _453 = _563;
                if (!_543)
                {
                    float _565 = _379 * _553;
                    _555 = _565;
                }
                float _567 = _555;
                bool _569 = !_543;
                _465 = _567;
                _505 = _569;
                if (!_505)
                {
                    float _571 = _383 * _425;
                    float _573 = _371 * _425;
                    float _575 = _379 * _425;
                    float _577 = fma(_423, _395, _571);
                    float _579 = fma(_423, _387, _573);
                    float _581 = fma(_423, _391, _575);
                    float _583 = fma(_427, _413, _577);
                    float _585 = fma(_427, _393, _579);
                    float _587 = fma(_427, _399, _581);
                    float _589 = _583 * _583;
                    float _591 = fma(_585, _585, _589);
                    float _593 = fma(_587, _587, _591);
                    float _595 = rsqrt(_593);
                    float _597 = _595 * 9.9999999747524270787835121154785e-07;
                    float _599 = _585 * _597;
                    float _601 = _583 * _597;
                    float _603 = _587 * _597;
                    _453 = _601;
                    _455 = _599;
                    _465 = _603;
                    _505 = true;
                }
            }
            else
            {
                float _605 = _383 * _153;
                float _607 = _371 * _153;
                float _609 = _379 * _153;
                float _611 = fma(_151, _395, _605);
                float _613 = fma(_151, _387, _607);
                float _615 = fma(_151, _391, _609);
                float _617 = fma(_155, _413, _611);
                float _619 = fma(_155, _393, _613);
                float _621 = fma(_155, _399, _615);
                float _623 = _617 * _617;
                float _625 = fma(_619, _619, _623);
                float _627 = fma(_621, _621, _625);
                float _629 = rsqrt(_627);
                float _631 = _629 * 9.9999999747524270787835121154785e-07;
                float _633 = _619 * _631;
                float _635 = _617 * _631;
                float _637 = _621 * _631;
                _453 = _635;
                _455 = _633;
                _465 = _637;
            }
        }
    }
    _505 = false;
    float _639 = _453;
    float _641 = _455;
    float _643 = _465;
    bool _645 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _647 = !_645;
    float _665;
    if (!_647)
    {
        float _649 = in.m_59.x;
        float _651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _653 = _649 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _655 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _657 = _655 * _651;
        float _659 = floor(_657);
        float _661 = -_659;
        float _663 = _657 + _661;
        _665 = _663;
        _667 = true;
    }
    else
    {
        float _669 = float(_93);
        float _671 = 1.0 / _669;
        float _673 = _127 * _671;
        _665 = _673;
    }
    _667 = false;
    float _675 = _665;
    float _677 = in.m_59.z;
    float _679 = _461 * _371;
    float _681 = in.m_59.x;
    float _683 = in.m_59.y;
    float _685 = _461 * _379;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _695;
    float _699 = fma(_459, _387, _679);
    float _701 = 1.0 / _689;
    float _703 = fma(_459, _391, _685);
    float _705 = _461 * _383;
    float _707 = fma(_463, _393, _699);
    float _709 = fma(_463, _399, _703);
    float _711 = 1.0 / _693;
    float _713 = fma(_459, _395, _705);
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _717 = _715 != 0;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _721 = _719 != 0;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _725 = _723 != 0;
    float _727 = fma(_463, _413, _713);
    float _729 = _677 * 2.0;
    float _731 = 1.0 / _697;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _735 = _675 + _733;
    float _737 = _681 * 2.0;
    float _739 = _683 * 2.0;
    float _741 = _735 * _701;
    float _743 = _683 + _681;
    float _745 = floor(_729);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _749 = _675 + _747;
    float _751 = _743 + (-1.0);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _753;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _761 = _749 * _711;
    float _763 = _683 + _677;
    float _765 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _767 = floor(_737);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _771 = _675 + _769;
    float _773 = _763 + (-1.0);
    float _775 = fma(_759, _761, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _777 = fma(_755, _741, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _779 = _771 * _731;
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _783 = _639 * _639;
    float _785 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _787 = log2(_785);
    bool _789 = _745 > 0.0;
    float _791 = _727 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _793 = _745 >= 0.0;
    bool _795 = isnan(_745);
    bool _797 = _793 || _795;
    bool _799 = isnan(0.0);
    bool _801 = _797 || _799;
    float _803 = fma(_641, _641, _783);
    float _805 = _677 + _681;
    float _807 = _683 + (-0.5);
    int _809 = _801 ? 0 : 1;
    float _811 = floor(_739);
    bool _813 = _767 > 0.0;
    float _815 = _805 + (-1.0);
    bool _817 = _767 >= 0.0;
    bool _819 = isnan(_767);
    bool _821 = _817 || _819;
    bool _823 = isnan(0.0);
    bool _825 = _821 || _823;
    float _827 = fma(_643, _643, _803);
    bool _829 = !_717;
    int _831 = _829 ? 0 : 1;
    float _833 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _835 = ~_809;
    int _837 = _835 + 1;
    int _839 = _837 + 1;
    float _841 = _787 * _127;
    int _843 = _839;
    float _845 = _683;
    float _847 = _681;
    if (!_789)
    {
        int _849 = ~_809;
        int _851 = _849 + 1;
        _843 = _851;
    }
    int _853 = _843;
    float _855 = rsqrt(_827);
    int _857 = abs(_831);
    float _859 = in.m_61.x;
    float _861 = in.m_61.y;
    float _863 = in.m_61.z;
    bool _865 = _811 > 0.0;
    bool _867 = _811 >= 0.0;
    bool _869 = isnan(_811);
    bool _871 = _867 || _869;
    bool _873 = isnan(0.0);
    bool _875 = _871 || _873;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _885 = exp2(_841);
    bool _887 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _889 = isnan(1.0);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _895 = _891 || _893;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _899 = 1.0 + _897;
    float _901 = fma(_883, _761, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _903 = !_721;
    int _905 = _903 ? 0 : 1;
    float _907 = fma(_879, _741, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _909 = float(_857);
    float _911 = float(_853);
    float _913 = 1.0 / _899;
    int _915 = _825 ? 0 : 1;
    int _917 = abs(_905);
    float _919 = _909 * _911;
    int _921 = ~_915;
    int _923 = _921 + 1;
    int _925 = _923 + 1;
    int _927 = _925;
    if (!_813)
    {
        int _929 = ~_915;
        int _931 = _929 + 1;
        _927 = _931;
    }
    int _933 = _927;
    float _935 = -_885;
    float _937 = _935 + 1.0;
    float _939 = _855 * _641;
    float _941 = float(_933);
    float _943 = float(_917);
    float _945 = _855 * _643;
    bool _947 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _949 = isnan(0.0);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _955 = _951 || _953;
    float _957 = _919 * (-2.0);
    int _959 = _875 ? 0 : 1;
    float _961 = _943 * _941;
    float _963 = _955 ? _937 : 0.0;
    float _965 = _681 + (-0.5);
    float _967 = fma(_957, _859, _859);
    float _969 = fma(_765, _957, _765);
    float _971 = _855 * _639;
    float _973 = _971;
    if (_895)
    {
        float _975 = _963 * _913;
        _129 = _975;
    }
    float _977 = _129;
    float _979 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[196].x, _967);
    float _981 = _961 * (-2.0);
    float _983 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _985 = _791 + _983;
    bool _987 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _989 = isnan(_675);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = fma(_969, _977, _979);
    float _1001 = _707 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1003 = fma(_781, _981, _781);
    float _1005 = fma(_981, _861, _861);
    float _1007 = _709 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1011 = _945 * _1009;
    float _1013 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1015 = _1001 + _1013;
    float _1017 = _985 * _985;
    int _1019 = ~_959;
    int _1021 = _1019 + 1;
    int _1023 = _1021 + 1;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1027 = -_1011;
    float _1029 = fma(_939, _1025, _1027);
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1033 = _1007 + _1031;
    float _1035 = fma(_1015, _1015, _1017);
    int _1037 = _1023;
    if (!_865)
    {
        int _1039 = ~_959;
        int _1041 = _1039 + 1;
        _1037 = _1041;
    }
    int _1043 = _1037;
    float _1045 = -_997;
    float _1047 = _1045 + 1.0;
    bool _1049 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1051 = isnan(_675);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1057 = _1053 || _1055;
    float _1059 = float(_1057);
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1063 = _971 * _1061;
    bool _1065 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1067 = isnan(_675);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1073 = _1069 || _1071;
    float _1075 = float(_1073);
    float _1077 = fma(_1033, _1033, _1035);
    bool _1079 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1081 = isnan(_675);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1087 = _1083 || _1085;
    float _1089 = float(_1087);
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1093 = -_1063;
    float _1095 = fma(_945, _1091, _1093);
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1099 = _939 * _1097;
    float _1101 = _1029 * _1029;
    float _1103 = _999 * 0.15915493667125701904296875;
    float _1105 = _1089 * _1047;
    float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1109 = -_1099;
    float _1111 = fma(_971, _1107, _1109);
    float _1113 = rsqrt(_1077);
    float _1115 = fma(_1095, _1095, _1101);
    bool _1117 = !_725;
    int _1119 = _1117 ? 0 : 1;
    float _1121 = -_1075;
    float _1123 = _1121 + 1.0;
    float _1125 = -_1089;
    float _1127 = _1125 + 1.0;
    float _1129 = fma(_1111, _1111, _1115);
    int _1131 = abs(_1119);
    float _1133 = _1059 * _1123;
    float _1135 = _1075 * _1127;
    float _1137 = float(_1043);
    float _1139 = -_1059;
    float _1141 = _1139 + 1.0;
    float _1143 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1005);
    float _1145 = _777 * _1133;
    float _1147 = _907 * _1133;
    float _1149 = float(_1131);
    float _1151 = _985 * _1113;
    float _1153 = _1015 * _1113;
    float _1155 = fma(_1003, _977, _1143);
    float _1157 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1147);
    float _1159 = -_1151;
    float _1161 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[18].w, _985);
    float _1163 = -_1153;
    float _1165 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1015);
    float _1167 = _1149 * _1137;
    float _1169 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1145);
    float _1171 = _1161 * _1161;
    float _1173 = _677 + (-0.5);
    float _1175 = _1167 * (-2.0);
    float _1177 = _1103 * 6.283185482025146484375;
    float _1179 = sin(_1177);
    float _1181 = fma(_1165, _1165, _1171);
    float _1183 = in.m_57.x;
    float _1185 = in.m_57.y;
    float _1187 = fma(_1175, _863, _863);
    float _1189 = _1033 * _1113;
    float _1191 = fma(_833, _1175, _833);
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1193;
    float _1197 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1187);
    float _1199 = _1103 * 6.283185482025146484375;
    float _1201 = cos(_1199);
    float _1203 = as_type<float>(int(gl_VertexIndex));
    float _1205 = -_1189;
    float _1207 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1033);
    float _1209 = fma(_1191, _977, _1197);
    float _1211 = fma(_1195, _779, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1213 = fma(_775, _1135, _1169);
    float _1215 = fma(_1207, _1207, _1181);
    float _1217 = _1209 * 0.15915493667125701904296875;
    float _1219 = rsqrt(_1129);
    float _1221 = fma(_1211, _1105, _1213);
    float _1223 = fma(_901, _1135, _1157);
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1225;
    float _1229 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1221);
    float _1231 = sqrt(_1215);
    float _1233 = _1155 * 0.15915493667125701904296875;
    float _1235 = fma(_1227, _779, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1237 = fma(_1235, _1105, _1223);
    float _1239 = _1229 * _1183;
    float _1241 = _1233 * 6.283185482025146484375;
    float _1243 = sin(_1241);
    int _1245 = as_type<int>(_1203) & 1;
    bool _1247 = _1245 != 0;
    int _1249 = as_type<int>(_1203) & 2;
    bool _1251 = _1249 != 0;
    float _1253 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1237);
    float _1255 = _1029 * _1219;
    float _1257 = _1095 * _1219;
    float _1259 = _1253 * _1185;
    float _1261 = _1111 * _1219;
    float _1263 = _1233 * 6.283185482025146484375;
    float _1265 = cos(_1263);
    bool _1267 = !_1247;
    float _1269 = _1267 ? (-0.5) : 0.5;
    float _1271 = _1259 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1273 = _939 * _1255;
    bool _1275 = _681 > 0.5;
    float _1277 = _1217 * 6.283185482025146484375;
    float _1279 = cos(_1277);
    float _1281 = _1179 * _1243;
    float _1283 = _1201 * _1243;
    float _1285 = _1217 * 6.283185482025146484375;
    float _1287 = sin(_1285);
    float _1289 = _1179 * _1265;
    float _1291 = _1201 * _1265;
    float _1293 = _1179 * _1279;
    float _1295 = _1265 * _1279;
    float _1297 = _1201 * _1279;
    float _1299 = _1243 * _1279;
    float _1301 = _1113 * _1231;
    float _1303 = _1239 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1305 = !_1251;
    float _1307 = _1305 ? (-0.5) : 0.5;
    float _1309 = _1297 * _945;
    float _1311 = fma(_1287, _1291, _1281);
    float _1313 = fma(_1287, _1281, _1291);
    float _1315 = _1303 * _1301;
    float _1317 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1269);
    float _1319 = -_1283;
    float _1321 = fma(_1287, _1289, _1319);
    float _1323 = -_1289;
    float _1325 = fma(_1287, _1283, _1323);
    float _1327 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1307);
    float _1329 = _1271 * _1301;
    float _1331 = _1315 * _1317;
    float _1333 = _971 * _1261;
    float _1335 = _1325 * _939;
    float _1337 = _1329 * _1327;
    float _1339 = _1297 * _939;
    float _1341 = -_1287;
    float _1343 = fma(_1341, _1261, _1309);
    float _1345 = -_1273;
    float _1347 = fma(_971, _1257, _1345);
    float _1349 = -_1333;
    float _1351 = fma(_945, _1255, _1349);
    float _1353 = -_1287;
    float _1355 = fma(_1353, _1257, _1339);
    float _1357 = _1311 * _939;
    float _1359 = fma(_1299, _1257, _1335);
    float _1361 = _1311 * _945;
    float _1363 = fma(_1293, _1351, _1355);
    float _1365 = fma(_1295, _1257, _1357);
    float _1367 = _1325 * _945;
    float _1369 = fma(_1313, _1351, _1359);
    float _1371 = fma(_1293, _1347, _1343);
    float _1373 = fma(_1321, _1351, _1365);
    float _1375 = fma(_1295, _1261, _1361);
    float _1377 = fma(_1299, _1261, _1367);
    float _1379 = _1337 * _1363;
    float _1381 = _1337 * _1371;
    float _1383 = fma(_1321, _1347, _1375);
    float _1385 = fma(_1313, _1347, _1377);
    float _1387 = fma(_1331, _1373, _1379);
    float _1389 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1391 = _1389 * 0.5;
    float _1393 = fma(_1331, _1383, _1381);
    float _1395 = fma(_1391, _1369, _1387);
    float _1397 = fma(_1391, _1385, _1393);
    float _1399 = _945 * _1257;
    float _1401 = _1297 * _971;
    float _1403 = _1001 + _1395;
    float _1405 = _1007 + _1397;
    float _1407 = -_1399;
    float _1409 = fma(_939, _1261, _1407);
    float _1411 = _1311 * _971;
    float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1415 = _1403 + _1413;
    float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1419 = _1405 + _1417;
    float _1421 = -_1287;
    float _1423 = fma(_1421, _1255, _1401);
    float _1425 = _1325 * _971;
    float _1427 = _1415 * _1415;
    float _1429 = _1419 * _1419;
    float _1431 = fma(_1295, _1255, _1411);
    float _1433 = fma(_1293, _1409, _1423);
    float _1435 = fma(_1299, _1255, _1425);
    float _1437 = _1427 + _1429;
    float _1439 = fma(_1321, _1409, _1431);
    float _1441 = _1337 * _1433;
    float _1443 = fma(_1313, _1409, _1435);
    float _1445 = sqrt(_1437);
    float _1447 = fma(_1331, _1439, _1441);
    float _1449 = -_1269;
    float _1451 = _1275 ? _1449 : _1269;
    int _1453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1455 = _1453 != 0;
    float _1457 = fma(_1391, _1443, _1447);
    bool _1459 = _683 > 0.5;
    float _1461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1463 = !_1455;
    float _1465 = _1463 ? _1269 : _1451;
    float _1467 = _791 + _1457;
    bool _1469 = _1445 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1471 = _1425;
    float _1473 = _1451;
    float _1475 = _1189;
    float _1477 = _1301;
    if (!_1469)
    {
        _1471 = _1429;
    }
    float _1479 = _1471;
    float _1481 = _1479;
    if (!_1469)
    {
        _973 = _1427;
    }
    float _1483 = _973;
    float _1485 = _1483;
    if (!_1469)
    {
        _845 = _1403;
    }
    float _1487 = _845;
    float _1489 = _1487;
    if (!_1469)
    {
        _847 = _1405;
    }
    float _1491 = _847;
    float _1493 = _1491;
    if (!_1469)
    {
        _1473 = _1467;
    }
    float _1495 = _1473;
    bool _1497 = !_1469;
    float _1499 = _1495;
    if (!_1497)
    {
        float _1501 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1503 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1505 = _1445 + _1503;
        float _1507 = rsqrt(_1437);
        float _1509 = _1505 * _1501;
        float _1511 = _1467 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1513 = _1509 * 0.15915493667125701904296875;
        float _1515 = _1513 * 6.283185482025146484375;
        float _1517 = sin(_1515);
        float _1519 = _1513 * 6.283185482025146484375;
        float _1521 = cos(_1519);
        float _1523 = fma(_1517, _1511, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1525 = _1507 * _1523;
        float _1527 = _1521 + (-1.0);
        float _1529 = fma(_1415, _1525, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1531 = fma(_1419, _1525, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1533 = _1527 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1535 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1537 = _1529 + _1535;
        float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1541 = _1531 + _1539;
        float _1543 = fma(_1467, _1521, _1533);
        float _1545 = _1537 * _1537;
        float _1547 = _1541 * _1541;
        _1499 = _1543;
        _1485 = _1545;
        _1481 = _1547;
        _1489 = _1529;
        _1493 = _1531;
    }
    float _1549 = _1499;
    float _1551 = _1485;
    float _1553 = _1481;
    float _1555 = _1489;
    float _1557 = _1493;
    float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1561 = _1549 + _1559;
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1565 = _1563 != 0;
    float _1567 = _1465 + 0.5;
    float _1569 = -_1307;
    int _1571 = _1459 ? as_type<int>(_1569) : as_type<int>(_1307);
    float _1573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1575 = fma(_1561, _1561, _1551);
    float _1577 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1579 = !_1565;
    float _1581 = _1579 ? _1307 : as_type<float>(_1571);
    float _1583 = _1575 + _1553;
    float _1585 = _1577 * _1461;
    float _1587 = -_1581;
    float _1589 = _1587 + 0.5;
    float _1591 = sqrt(_1583);
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1605 = _1589 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1609 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1611 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1613 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1615 = _1599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1617 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1619 = _1603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1621 = _1605 * _1573;
    out.m_66.x = _1609;
    out.m_66.y = _1611;
    out.m_66.z = _1613;
    out.m_66.w = _1607;
    bool _1623 = _1591 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1625 = isnan(_1591);
    bool _1627 = _1623 || _1625;
    bool _1629 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1631 = _1627 || _1629;
    out.m_68.x = _1615;
    out.m_68.y = _1617;
    out.m_68.z = _1619;
    out.m_70.x = _1585;
    out.m_70.y = _1621;
    float _1633 = _1583;
    if (!_1631)
    {
        _1633 = 1.0;
    }
    float _1635 = _1633;
    bool _1637 = !_1631;
    float _1639 = _1635;
    if (!_1637)
    {
        bool _1641 = _1591 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1643 = isnan(_1591);
        bool _1645 = _1641 || _1643;
        bool _1647 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1649 = _1645 || _1647;
        if (!_1649)
        {
            float _1651 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1653 = _1591 + _1651;
            float _1655 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1657 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1655;
            float _1659 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1661 = _1659 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1663 = 1.0 / _1657;
            float _1665 = _1653 * _1663;
            float _1667 = fma(_1665, _1661, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1639 = _1667;
            _1669 = true;
        }
        else
        {
            bool _1671 = _1591 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1673 = isnan(_1591);
            bool _1675 = _1671 || _1673;
            bool _1677 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1679 = _1675 || _1677;
            if (!_1679)
            {
                float _1681 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1683 = _1591 + _1681;
                float _1685 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1687 = _1685 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1689 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1691 = _1689 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1693 = 1.0 / _1687;
                float _1695 = _1683 * _1693;
                float _1697 = fma(_1695, _1691, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1639 = _1697;
                _1669 = true;
            }
            else
            {
                _1639 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1669 = false;
    float _1699 = _1639;
    float _1701 = -_1151;
    float _1703 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _791);
    float _1705 = -_1153;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1001);
    float _1709 = -_1189;
    float _1711 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1007);
    float _1713 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1715 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1717 = _1555 + _1715;
    float _1719 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1721 = _1549 + _1719;
    bool _1723 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan(0.5);
    bool _1731 = _1727 || _1729;
    float _1733 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1713);
    float _1735 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1737 = _1557 + _1735;
    float _1739 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1741 = fma(_1717, _1699, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1743 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1733);
    float _1745 = fma(_1737, _1699, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1747 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1739);
    float _1749 = -_1153;
    float _1751 = fma(_1749, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1741);
    float _1753 = _1743 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1755 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1747);
    float _1757 = fma(_1721, _1699, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1759 = 1.0 / _1753;
    float _1761 = -_1189;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1745);
    float _1765 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1767 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan(0.5);
    bool _1775 = _1771 || _1773;
    float _1777 = -_1151;
    float _1779 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1757);
    float _1781 = _1779;
    float _1783 = _1763;
    float _1785 = _1765;
    if (_1731)
    {
        _1475 = _1751;
    }
    float _1787 = _1475;
    float _1789 = _1765 + _1753;
    float _1791 = _1787;
    if (!_1731)
    {
        float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1795 = _1703 + _1793;
        float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1799 = _1707 + _1797;
        float _1801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1803 = -_1007;
        float _1805 = _1803 + _1745;
        float _1807 = _1795 * _1795;
        float _1809 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1811 = _1711 + _1809;
        float _1813 = -_1001;
        float _1815 = _1813 + _1741;
        float _1817 = -_791;
        float _1819 = _1817 + _1757;
        float _1821 = fma(_1799, _1799, _1807);
        float _1823 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1825 = fma(_1811, _1811, _1821);
        float _1827 = sqrt(_1825);
        float _1829 = 1.0 / _1301;
        float _1831 = precise::min(_1827, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1833 = _1831 * _1801;
        float _1835 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1837 = _1833 * _1829;
        float _1839 = _1835 * _1837;
        float _1841 = _1805 * _1837;
        float _1843 = fma(_1815, _1839, _1707);
        float _1845 = fma(_1819, _1839, _1703);
        float _1847 = fma(_1835, _1841, _1711);
        _1781 = _1845;
        _1791 = _1843;
        _1783 = _1847;
        _1785 = _1841;
    }
    float _1849 = _1781;
    float _1851 = _1791;
    float _1853 = _1783;
    float _1855 = _1785;
    float _1857 = _1855;
    if (_1775)
    {
        _1857 = 1.0;
    }
    float _1859 = _1857;
    float _1861 = _1789 * _1759;
    float _1863 = _1861 * 0.5;
    float _1865 = _1859;
    if (!_1775)
    {
        float _1867 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1869 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1871 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1869);
        float _1873 = _1867 * 0.15915493667125701904296875;
        float _1875 = _1873 * 6.283185482025146484375;
        float _1877 = cos(_1875);
        float _1879 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1881 = _1879 * 0.15915493667125701904296875;
        float _1883 = _1873 * 6.283185482025146484375;
        float _1885 = sin(_1883);
        float _1887 = 1.0 / _1877;
        float _1889 = _1881 * 6.283185482025146484375;
        float _1891 = cos(_1889);
        float _1893 = _1885 * _1887;
        float _1895 = 1.0 / _1871;
        float _1897 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1899 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1897;
        float _1901 = _1891 * _1893;
        float _1903 = _1881 * 6.283185482025146484375;
        float _1905 = sin(_1903);
        float _1907 = 1.0 / _1901;
        float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1911 = _1895 * _1909;
        float _1913 = 1.0 / _1899;
        float _1915 = _1905 * _1907;
        float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1919 = fma(_1915, _1911, _1917);
        float _1921 = _1919 * _1913;
        float _1923 = precise::clamp(_1921, 0.0, 1.0);
        _1865 = _1923;
    }
    float _1925 = _1865;
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1929 = _1849 + _1927;
    float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1933 = _1851 + _1931;
    float _1935 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1937 = _1853 + _1935;
    float _1939 = _1929 * _1929;
    float _1941 = fma(_1933, _1933, _1939);
    float _1943 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1945 = fma(_1937, _1937, _1941);
    float _1947 = rsqrt(_1945);
    float _1949 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1951 = _1933 * _1949;
    float _1953 = _1937 * _1949;
    float _1955 = _1951 * _1951;
    float _1957 = _1953 * _1953;
    float _1959 = _1955 + _1957;
    float _1961 = sqrt(_1959);
    bool _1963 = _1961 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1965 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1967 = _1961 + _1965;
    float _1969 = _1937;
    float _1971 = _1959;
    float _1973 = _1967;
    float _1975 = _1929;
    float _1977 = _1949;
    float _1979 = _1951;
    if (_1963)
    {
        float _1981 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1969 = _1981;
    }
    float _1983 = _1969;
    if (_1963)
    {
        float _1985 = rsqrt(_1959);
        _1971 = _1985;
    }
    float _1987 = _1971;
    if (_1963)
    {
        float _1989 = _1967 * _1983;
        _1973 = _1989;
    }
    float _1991 = _1973;
    if (_1963)
    {
        float _1993 = _1991 * 0.15915493667125701904296875;
        _1477 = _1993;
    }
    float _1995 = _1477;
    float _1997 = _1939;
    if (_1963)
    {
        float _1999 = _1995 * 6.283185482025146484375;
        float _2001 = sin(_1999);
        _1997 = _2001;
    }
    float _2003 = _1997;
    float _2005 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2007 = precise::max(0.0, _2005);
    float _2009 = _1947;
    float _2011 = _2005;
    if (_1963)
    {
        float _2013 = _1995 * 6.283185482025146484375;
        float _2015 = cos(_2013);
        _2009 = _2015;
    }
    float _2017 = _2009;
    float _2019 = -_1949;
    float _2021 = -_2007;
    float _2023 = fma(_1929, _2019, _2021);
    float _2025 = _2023;
    if (_1963)
    {
        float _2027 = _2023 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2011 = _2027;
    }
    float _2029 = _2011;
    float _2031 = _2029;
    float _2033 = _2003;
    if (_1963)
    {
        float _2035 = fma(_2003, _2029, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1975 = _2035;
    }
    float _2037 = _1975;
    float _2039 = _2037;
    float _2041 = _2017;
    if (_1963)
    {
        float _2043 = _2017 + (-1.0);
        _2031 = _2043;
    }
    float _2045 = _2031;
    float _2047 = _2045;
    if (_1963)
    {
        float _2049 = _1987 * _2037;
        _1977 = _2049;
    }
    float _2051 = _1977;
    if (!_1963)
    {
        _2039 = _1953;
    }
    float _2053 = _2039;
    float _2055 = sqrt(_1945);
    float _2057 = _2053;
    if (_1963)
    {
        float _2059 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2033 = _2059;
    }
    float _2061 = _2033;
    if (_1963)
    {
        float _2063 = _1951 * _2051;
        _1979 = _2063;
    }
    float _2065 = _1979;
    if (!_1963)
    {
        _2047 = _1955;
    }
    float _2067 = _2047;
    float _2069 = _2067;
    if (_1963)
    {
        float _2071 = _1953 * _2051;
        _2057 = _2071;
    }
    float _2073 = _2057;
    if (_1963)
    {
        float _2075 = fma(_2023, _2017, _2061);
        _2025 = _2075;
    }
    float _2077 = _2025;
    if (_1963)
    {
        float _2079 = _2065 * _2065;
        _2069 = _2079;
    }
    float _2081 = _2069;
    if (!_1963)
    {
        _2041 = _1957;
    }
    float _2083 = _2041;
    float _2085 = _2083;
    if (_1963)
    {
        float _2087 = _2073 * _2073;
        _2085 = _2087;
    }
    float _2089 = _2085;
    float _2091 = fma(_2077, _2077, _2081);
    float _2093 = _2091 + _2089;
    float _2095 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2099 = fma(_2055, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2097);
    float _2101 = precise::clamp(_2099, 0.0, 1.0);
    float _2103 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2105 = rsqrt(_2093);
    float _2107 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2095);
    float _2109 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2111 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2103);
    float _2113 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2115 = -_2101;
    float _2117 = _2115 + 1.0;
    float _2119 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2109);
    float _2121 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2111);
    float _2123 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2113);
    float _2125 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2107);
    float _2127 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2119);
    float _2129 = _2121 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2131 = abs(_2117);
    float _2133 = log2(_2131);
    float _2135 = _2125 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2137 = _2127 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2139 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2141 = _2105 * _2065;
    float _2143 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2123);
    float _2145 = _2105 * _2073;
    float _2147 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2139);
    float _2149 = _2105 * _2077;
    float _2151 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2153 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2155 = _2143 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2157 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2147);
    float _2159 = -_2151;
    float _2161 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2159);
    float _2163 = -_2153;
    float _2165 = fma(_2163, _1943, 1.0);
    float _2167 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2169 = -_2145;
    float _2171 = fma(_2169, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2161);
    float _2173 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2157);
    float _2175 = log2(_2165);
    float _2177 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2179 = fma(_2171, -0.5, 0.5);
    float _2181 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2183 = fma(_2171, 0.5, 0.5);
    float _2185 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2177);
    float _2187 = _2149 + 1.0;
    float _2189 = exp2(_2167);
    float _2191 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2181);
    float _2193 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2185);
    float _2195 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2191);
    float _2197 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2193);
    float _2199 = 1.0 / _2173;
    float _2201 = fma(_2183, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2203 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2195);
    float _2205 = _2175 * 0.693147182464599609375;
    float _2207 = fma(_2183, _2201, -0.212114393711090087890625);
    float _2209 = _2205 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2211 = sqrt(_2179);
    float _2213 = -_2149;
    float _2215 = fma(_2189, _2187, _2213);
    float _2217 = fma(_2183, _2207, 1.570728778839111328125);
    float _2219 = _2197 * _2199;
    float _2221 = _2203 * _2199;
    float _2223 = fma(_2219, 0.5, 0.5);
    float _2225 = fma(_2221, -0.5, 0.5);
    float _2227 = fma(_2215, 0.5, 0.5);
    float _2229 = _2211 * 0.636619746685028076171875;
    float3 _5704 = float3(_2223, _2225, _2209);
    float _2231 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5704, float3(0.0), isnan(_5704)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5704, float3(0.0), isnan(_5704)), level(0.0)).x;
    float3 _5715 = float3(_2223, _2225, _2209);
    float4 _2234 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5715, float3(0.0), isnan(_5715)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5715, float3(0.0), isnan(_5715)), level(0.0)).xyzw;
    float _2236 = _2234.x;
    float _2238 = _2234.y;
    float _2240 = _2234.z;
    float _2242 = _2234.w;
    float _2244 = -_2217;
    float _2246 = fma(_2229, _2244, 1.0);
    float2 _5737 = float2(_2246, _2227);
    float3 _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5737, float2(0.0), isnan(_5737)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5737, float2(0.0), isnan(_5737)), level(0.0)).xyz;
    float _2252 = _2250.x;
    float _2254 = _2250.y;
    float _2256 = _2250.z;
    float _2258 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2260 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2262 = _1925 > 0.0;
    bool _2264 = isnan(_1925);
    bool _2266 = _2262 || _2264;
    bool _2268 = isnan(0.0);
    bool _2270 = _2266 || _2268;
    float _2272 = _2197 + _2173;
    float _2274 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2260);
    float _2276 = exp2(_2258);
    float _2278 = _2272 * 0.5;
    float _2280 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2274);
    float _2282 = _1925 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2284 = _2173 * 0.5;
    float _2286 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2280);
    float _2288 = _2286 + _2173;
    float _2290 = fma(_2203, -0.5, _2284);
    float _2292 = _2282 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2197;
    out.gl_Position.y = _2203;
    out.gl_Position.z = _2286;
    out.gl_Position.w = _2173;
    float _2294 = _2288 * 0.5;
    float _2296 = -_2276;
    float _2298 = _2296 + 1.0;
    out.m_47.x = _2292;
    float _2300 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_72.x = _2278;
    out.m_72.y = _2290;
    out.m_72.z = _2294;
    out.m_72.w = _2173;
    float _2302 = -_2300;
    float _2304 = _2302 + 1.0;
    float _2306 = _2300 * _2231;
    float _2308 = _2242 * _2306;
    float _2310 = _2256 * _2306;
    float _2312 = fma(_2252, _2308, _2236);
    float _2314 = fma(_2254, _2308, _2238);
    float _2316 = _2242 * _2304;
    float _2318 = fma(_2242, _2310, _2240);
    out.m_74.x = _2312;
    out.m_74.y = _2314;
    out.m_74.z = _2318;
    out.m_74.w = _2316;
    if (_2270)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2320 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2320;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1669 = false;
    bool _667 = false;
    bool _505 = false;
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
        float _2377 = as_type<float>(_109);
        out.gl_Position.z = _2377;
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
    float _145 = _143;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    if (_139)
    {
        float _147 = _143 * 5.0;
        _111 = as_type<int>(_147);
    }
    int _149 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2448 = as_type<float>(_149);
        out.gl_Position.z = _2448;
    }
    if (_139)
    {
        return out;
    }
    float _151 = in.m_49.x;
    float _153 = in.m_49.y;
    float _155 = in.m_49.z;
    float _157 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = 0.0;
    float _171 = _157;
    if (!_167)
    {
        float _173 = _157 * _157;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = 0.0;
    float _181 = _177;
    if (!_167)
    {
        float _183 = _127 * _127;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    if (!_167)
    {
        float _189 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _189;
    }
    float _191 = _181;
    bool _193 = !_167;
    float _195 = _191;
    float _197 = 0.0;
    if (!_193)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _157 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _157);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _145 = _213;
        _195 = _227;
        _197 = _215;
    }
    float _229 = _145;
    float _231 = _195;
    float _233 = _197;
    bool _235 = !_167;
    float _237 = _229;
    float _239 = _233;
    if (!_235)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _157 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _237 = _253;
        _239 = _247;
        _171 = _259;
    }
    float _261 = _237;
    float _263 = _239;
    float _265 = _171;
    float _267 = _263;
    float _269 = _261;
    if (!_167)
    {
        _267 = _127;
    }
    float _271 = _267;
    float _273 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _275 = _271;
    if (!_167)
    {
        float _277 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _269 = _277;
    }
    float _279 = _269;
    bool _281 = !_167;
    float _283 = _279;
    if (!_281)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = _127 * _287;
        float _297 = 1.0 / _291;
        float _299 = _293 * 0.693147182464599609375;
        float _301 = exp2(_295);
        float _303 = 1.0 / _299;
        float _305 = _301 + (-1.0);
        float _307 = -_305;
        float _309 = fma(_307, _303, _127);
        float _311 = _309 * _297;
        float _313 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _283 = _313;
    }
    float _315 = _283;
    bool _317 = !_167;
    if (!_317)
    {
        float _319 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _321 = log2(_319);
        float _323 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _325 = _323 + 1.0;
        float _327 = 1.0 / _325;
        float _329 = _127 * _321;
        float _331 = exp2(_329);
        float _333 = -_331;
        float _335 = _333 + 1.0;
        float _337 = _335 * _327;
        _275 = _337;
    }
    float _339 = _275;
    float _341 = fma(_265, _151, _273);
    float _343 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _345 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _347 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _349 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = fma(_265, _153, _343);
    float _353 = fma(_339, _153, _345);
    float _355 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _357 = fma(_339, _151, _347);
    float _359 = fma(_339, _155, _349);
    float _361 = -_353;
    float _363 = _351 + _361;
    float _365 = fma(_265, _155, _355);
    float _367 = -_357;
    float _369 = _341 + _367;
    float _371 = in.m_51.y;
    float _373 = _363 * _363;
    float _375 = -_359;
    float _377 = _365 + _375;
    float _379 = in.m_53.y;
    float _381 = fma(_369, _369, _373);
    float _383 = in.m_55.y;
    float _385 = fma(_377, _377, _381);
    float _387 = in.m_51.x;
    float _389 = sqrt(_385);
    float _391 = in.m_53.x;
    float _393 = in.m_51.z;
    float _395 = in.m_55.x;
    float _397 = _363 * _371;
    float _399 = in.m_53.z;
    float _401 = _363 * _379;
    bool _403 = _389 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_389);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = in.m_55.z;
    float _415 = _363 * _383;
    float _417 = _383 * _383;
    float _419 = in.m_57.w;
    float _421 = fma(_369, _387, _397);
    float _423 = in.m_44.x;
    float _425 = in.m_44.y;
    float _427 = in.m_44.z;
    float _429 = fma(_369, _391, _401);
    float _431 = fma(_377, _393, _421);
    float _433 = fma(_371, _371, _417);
    float _435 = fma(_369, _395, _415);
    float _437 = fma(_379, _379, _433);
    float _439 = fma(_377, _399, _429);
    float _441 = _429;
    float _443 = _433;
    if (_411)
    {
        _441 = _431;
    }
    float _445 = _441;
    float _447 = fma(_377, _413, _435);
    float _449 = _445;
    float _451 = _447;
    float _453 = _447;
    float _455 = _445;
    if (_411)
    {
        _443 = _439;
    }
    float _457 = _443;
    float _459 = fma(_341, _419, _423);
    float _461 = fma(_351, _419, _425);
    float _463 = fma(_365, _419, _427);
    float _465 = _457;
    if (!_411)
    {
        bool _467 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _469 = !_467;
        if (!_469)
        {
            float _471 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _473 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _475 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _477 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[16].x, _471);
            float _479 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[16].x, _473);
            float _481 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[16].x, _475);
            float _483 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[16].z, _477);
            float _485 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[16].z, _479);
            float _487 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[16].z, _481);
            float _489 = _483 * _483;
            float _491 = fma(_485, _485, _489);
            float _493 = fma(_487, _487, _491);
            float _495 = rsqrt(_493);
            float _497 = _495 * 9.9999999747524270787835121154785e-07;
            float _499 = _485 * _497;
            float _501 = _483 * _497;
            float _503 = _487 * _497;
            _453 = _501;
            _455 = _499;
            _465 = _503;
            _505 = true;
        }
        else
        {
            float _507 = _153 * _153;
            float _509 = fma(_151, _151, _507);
            float _511 = fma(_155, _155, _509);
            float _513 = sqrt(_511);
            bool _515 = _513 >= 9.9999999747524270787835121154785e-07;
            bool _517 = isnan(_513);
            bool _519 = _515 || _517;
            bool _521 = isnan(9.9999999747524270787835121154785e-07);
            bool _523 = _519 || _521;
            float _525 = _513;
            if (!_523)
            {
                float _527 = _425 * _425;
                float _529 = fma(_423, _423, _527);
                float _531 = fma(_427, _427, _529);
                float _533 = sqrt(_531);
                bool _535 = _533 >= 9.9999999747524270787835121154785e-07;
                bool _537 = isnan(_533);
                bool _539 = _535 || _537;
                bool _541 = isnan(9.9999999747524270787835121154785e-07);
                bool _543 = _539 || _541;
                float _545 = _437;
                if (!_543)
                {
                    float _547 = rsqrt(_437);
                    _545 = _547;
                }
                float _549 = _545;
                if (!_543)
                {
                    float _551 = _549 * 9.9999999747524270787835121154785e-07;
                    _525 = _551;
                }
                float _553 = _525;
                float _555 = _553;
                if (!_543)
                {
                    float _557 = _371 * _553;
                    _449 = _557;
                }
                float _559 = _449;
                _455 = _559;
                if (!_543)
                {
                    float _561 = _383 * _553;
                    _451 = _561;
                }
                float _563 = _451;
                _453 = _563;
                if (!_543)
                {
                    float _565 = _379 * _553;
                    _555 = _565;
                }
                float _567 = _555;
                bool _569 = !_543;
                _465 = _567;
                _505 = _569;
                if (!_505)
                {
                    float _571 = _383 * _425;
                    float _573 = _371 * _425;
                    float _575 = _379 * _425;
                    float _577 = fma(_423, _395, _571);
                    float _579 = fma(_423, _387, _573);
                    float _581 = fma(_423, _391, _575);
                    float _583 = fma(_427, _413, _577);
                    float _585 = fma(_427, _393, _579);
                    float _587 = fma(_427, _399, _581);
                    float _589 = _583 * _583;
                    float _591 = fma(_585, _585, _589);
                    float _593 = fma(_587, _587, _591);
                    float _595 = rsqrt(_593);
                    float _597 = _595 * 9.9999999747524270787835121154785e-07;
                    float _599 = _585 * _597;
                    float _601 = _583 * _597;
                    float _603 = _587 * _597;
                    _453 = _601;
                    _455 = _599;
                    _465 = _603;
                    _505 = true;
                }
            }
            else
            {
                float _605 = _383 * _153;
                float _607 = _371 * _153;
                float _609 = _379 * _153;
                float _611 = fma(_151, _395, _605);
                float _613 = fma(_151, _387, _607);
                float _615 = fma(_151, _391, _609);
                float _617 = fma(_155, _413, _611);
                float _619 = fma(_155, _393, _613);
                float _621 = fma(_155, _399, _615);
                float _623 = _617 * _617;
                float _625 = fma(_619, _619, _623);
                float _627 = fma(_621, _621, _625);
                float _629 = rsqrt(_627);
                float _631 = _629 * 9.9999999747524270787835121154785e-07;
                float _633 = _619 * _631;
                float _635 = _617 * _631;
                float _637 = _621 * _631;
                _453 = _635;
                _455 = _633;
                _465 = _637;
            }
        }
    }
    _505 = false;
    float _639 = _453;
    float _641 = _455;
    float _643 = _465;
    bool _645 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _647 = !_645;
    float _665;
    if (!_647)
    {
        float _649 = in.m_59.x;
        float _651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _653 = _649 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _655 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _657 = _655 * _651;
        float _659 = floor(_657);
        float _661 = -_659;
        float _663 = _657 + _661;
        _665 = _663;
        _667 = true;
    }
    else
    {
        float _669 = float(_93);
        float _671 = 1.0 / _669;
        float _673 = _127 * _671;
        _665 = _673;
    }
    _667 = false;
    float _675 = _665;
    float _677 = in.m_59.z;
    float _679 = _461 * _371;
    float _681 = in.m_59.x;
    float _683 = in.m_59.y;
    float _685 = _461 * _379;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _695;
    float _699 = fma(_459, _387, _679);
    float _701 = 1.0 / _689;
    float _703 = fma(_459, _391, _685);
    float _705 = _461 * _383;
    float _707 = fma(_463, _393, _699);
    float _709 = fma(_463, _399, _703);
    float _711 = 1.0 / _693;
    float _713 = fma(_459, _395, _705);
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _717 = _715 != 0;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _721 = _719 != 0;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _725 = _723 != 0;
    float _727 = fma(_463, _413, _713);
    float _729 = _677 * 2.0;
    float _731 = 1.0 / _697;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _735 = _675 + _733;
    float _737 = _681 * 2.0;
    float _739 = _683 * 2.0;
    float _741 = _735 * _701;
    float _743 = _683 + _681;
    float _745 = floor(_729);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _749 = _675 + _747;
    float _751 = _743 + (-1.0);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _753;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _761 = _749 * _711;
    float _763 = _683 + _677;
    float _765 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _767 = floor(_737);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _771 = _675 + _769;
    float _773 = _763 + (-1.0);
    float _775 = fma(_759, _761, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _777 = fma(_755, _741, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _779 = _771 * _731;
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _783 = _639 * _639;
    float _785 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _787 = log2(_785);
    bool _789 = _745 > 0.0;
    float _791 = _727 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _793 = _745 >= 0.0;
    bool _795 = isnan(_745);
    bool _797 = _793 || _795;
    bool _799 = isnan(0.0);
    bool _801 = _797 || _799;
    float _803 = fma(_641, _641, _783);
    float _805 = _677 + _681;
    float _807 = _683 + (-0.5);
    int _809 = _801 ? 0 : 1;
    float _811 = floor(_739);
    bool _813 = _767 > 0.0;
    float _815 = _805 + (-1.0);
    bool _817 = _767 >= 0.0;
    bool _819 = isnan(_767);
    bool _821 = _817 || _819;
    bool _823 = isnan(0.0);
    bool _825 = _821 || _823;
    float _827 = fma(_643, _643, _803);
    bool _829 = !_717;
    int _831 = _829 ? 0 : 1;
    float _833 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _835 = ~_809;
    int _837 = _835 + 1;
    int _839 = _837 + 1;
    float _841 = _787 * _127;
    int _843 = _839;
    float _845 = _683;
    float _847 = _681;
    if (!_789)
    {
        int _849 = ~_809;
        int _851 = _849 + 1;
        _843 = _851;
    }
    int _853 = _843;
    float _855 = rsqrt(_827);
    int _857 = abs(_831);
    float _859 = in.m_61.x;
    float _861 = in.m_61.y;
    float _863 = in.m_61.z;
    bool _865 = _811 > 0.0;
    bool _867 = _811 >= 0.0;
    bool _869 = isnan(_811);
    bool _871 = _867 || _869;
    bool _873 = isnan(0.0);
    bool _875 = _871 || _873;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _885 = exp2(_841);
    bool _887 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _889 = isnan(1.0);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _895 = _891 || _893;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _899 = 1.0 + _897;
    float _901 = fma(_883, _761, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _903 = !_721;
    int _905 = _903 ? 0 : 1;
    float _907 = fma(_879, _741, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _909 = float(_857);
    float _911 = float(_853);
    float _913 = 1.0 / _899;
    int _915 = _825 ? 0 : 1;
    int _917 = abs(_905);
    float _919 = _909 * _911;
    int _921 = ~_915;
    int _923 = _921 + 1;
    int _925 = _923 + 1;
    int _927 = _925;
    if (!_813)
    {
        int _929 = ~_915;
        int _931 = _929 + 1;
        _927 = _931;
    }
    int _933 = _927;
    float _935 = -_885;
    float _937 = _935 + 1.0;
    float _939 = _855 * _641;
    float _941 = float(_933);
    float _943 = float(_917);
    float _945 = _855 * _643;
    bool _947 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _949 = isnan(0.0);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _955 = _951 || _953;
    float _957 = _919 * (-2.0);
    int _959 = _875 ? 0 : 1;
    float _961 = _943 * _941;
    float _963 = _955 ? _937 : 0.0;
    float _965 = _681 + (-0.5);
    float _967 = fma(_957, _859, _859);
    float _969 = fma(_765, _957, _765);
    float _971 = _855 * _639;
    float _973 = _971;
    if (_895)
    {
        float _975 = _963 * _913;
        _129 = _975;
    }
    float _977 = _129;
    float _979 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[196].x, _967);
    float _981 = _961 * (-2.0);
    float _983 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _985 = _791 + _983;
    bool _987 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _989 = isnan(_675);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = fma(_969, _977, _979);
    float _1001 = _707 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1003 = fma(_781, _981, _781);
    float _1005 = fma(_981, _861, _861);
    float _1007 = _709 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1011 = _945 * _1009;
    float _1013 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1015 = _1001 + _1013;
    float _1017 = _985 * _985;
    int _1019 = ~_959;
    int _1021 = _1019 + 1;
    int _1023 = _1021 + 1;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1027 = -_1011;
    float _1029 = fma(_939, _1025, _1027);
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1033 = _1007 + _1031;
    float _1035 = fma(_1015, _1015, _1017);
    int _1037 = _1023;
    if (!_865)
    {
        int _1039 = ~_959;
        int _1041 = _1039 + 1;
        _1037 = _1041;
    }
    int _1043 = _1037;
    float _1045 = -_997;
    float _1047 = _1045 + 1.0;
    bool _1049 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1051 = isnan(_675);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1057 = _1053 || _1055;
    float _1059 = float(_1057);
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1063 = _971 * _1061;
    bool _1065 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1067 = isnan(_675);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1073 = _1069 || _1071;
    float _1075 = float(_1073);
    float _1077 = fma(_1033, _1033, _1035);
    bool _1079 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1081 = isnan(_675);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1087 = _1083 || _1085;
    float _1089 = float(_1087);
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1093 = -_1063;
    float _1095 = fma(_945, _1091, _1093);
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1099 = _939 * _1097;
    float _1101 = _1029 * _1029;
    float _1103 = _999 * 0.15915493667125701904296875;
    float _1105 = _1089 * _1047;
    float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1109 = -_1099;
    float _1111 = fma(_971, _1107, _1109);
    float _1113 = rsqrt(_1077);
    float _1115 = fma(_1095, _1095, _1101);
    bool _1117 = !_725;
    int _1119 = _1117 ? 0 : 1;
    float _1121 = -_1075;
    float _1123 = _1121 + 1.0;
    float _1125 = -_1089;
    float _1127 = _1125 + 1.0;
    float _1129 = fma(_1111, _1111, _1115);
    int _1131 = abs(_1119);
    float _1133 = _1059 * _1123;
    float _1135 = _1075 * _1127;
    float _1137 = float(_1043);
    float _1139 = -_1059;
    float _1141 = _1139 + 1.0;
    float _1143 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1005);
    float _1145 = _777 * _1133;
    float _1147 = _907 * _1133;
    float _1149 = float(_1131);
    float _1151 = _985 * _1113;
    float _1153 = _1015 * _1113;
    float _1155 = fma(_1003, _977, _1143);
    float _1157 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1147);
    float _1159 = -_1151;
    float _1161 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[18].w, _985);
    float _1163 = -_1153;
    float _1165 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1015);
    float _1167 = _1149 * _1137;
    float _1169 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1145);
    float _1171 = _1161 * _1161;
    float _1173 = _677 + (-0.5);
    float _1175 = _1167 * (-2.0);
    float _1177 = _1103 * 6.283185482025146484375;
    float _1179 = sin(_1177);
    float _1181 = fma(_1165, _1165, _1171);
    float _1183 = in.m_57.x;
    float _1185 = in.m_57.y;
    float _1187 = fma(_1175, _863, _863);
    float _1189 = _1033 * _1113;
    float _1191 = fma(_833, _1175, _833);
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1193;
    float _1197 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1187);
    float _1199 = _1103 * 6.283185482025146484375;
    float _1201 = cos(_1199);
    float _1203 = as_type<float>(int(gl_VertexIndex));
    float _1205 = -_1189;
    float _1207 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1033);
    float _1209 = fma(_1191, _977, _1197);
    float _1211 = fma(_1195, _779, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1213 = fma(_775, _1135, _1169);
    float _1215 = fma(_1207, _1207, _1181);
    float _1217 = _1209 * 0.15915493667125701904296875;
    float _1219 = rsqrt(_1129);
    float _1221 = fma(_1211, _1105, _1213);
    float _1223 = fma(_901, _1135, _1157);
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1225;
    float _1229 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1221);
    float _1231 = sqrt(_1215);
    float _1233 = _1155 * 0.15915493667125701904296875;
    float _1235 = fma(_1227, _779, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1237 = fma(_1235, _1105, _1223);
    float _1239 = _1229 * _1183;
    float _1241 = _1233 * 6.283185482025146484375;
    float _1243 = sin(_1241);
    int _1245 = as_type<int>(_1203) & 1;
    bool _1247 = _1245 != 0;
    int _1249 = as_type<int>(_1203) & 2;
    bool _1251 = _1249 != 0;
    float _1253 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1237);
    float _1255 = _1029 * _1219;
    float _1257 = _1095 * _1219;
    float _1259 = _1253 * _1185;
    float _1261 = _1111 * _1219;
    float _1263 = _1233 * 6.283185482025146484375;
    float _1265 = cos(_1263);
    bool _1267 = !_1247;
    float _1269 = _1267 ? (-0.5) : 0.5;
    float _1271 = _1259 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1273 = _939 * _1255;
    bool _1275 = _681 > 0.5;
    float _1277 = _1217 * 6.283185482025146484375;
    float _1279 = cos(_1277);
    float _1281 = _1179 * _1243;
    float _1283 = _1201 * _1243;
    float _1285 = _1217 * 6.283185482025146484375;
    float _1287 = sin(_1285);
    float _1289 = _1179 * _1265;
    float _1291 = _1201 * _1265;
    float _1293 = _1179 * _1279;
    float _1295 = _1265 * _1279;
    float _1297 = _1201 * _1279;
    float _1299 = _1243 * _1279;
    float _1301 = _1113 * _1231;
    float _1303 = _1239 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1305 = !_1251;
    float _1307 = _1305 ? (-0.5) : 0.5;
    float _1309 = _1297 * _945;
    float _1311 = fma(_1287, _1291, _1281);
    float _1313 = fma(_1287, _1281, _1291);
    float _1315 = _1303 * _1301;
    float _1317 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1269);
    float _1319 = -_1283;
    float _1321 = fma(_1287, _1289, _1319);
    float _1323 = -_1289;
    float _1325 = fma(_1287, _1283, _1323);
    float _1327 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1307);
    float _1329 = _1271 * _1301;
    float _1331 = _1315 * _1317;
    float _1333 = _971 * _1261;
    float _1335 = _1325 * _939;
    float _1337 = _1329 * _1327;
    float _1339 = _1297 * _939;
    float _1341 = -_1287;
    float _1343 = fma(_1341, _1261, _1309);
    float _1345 = -_1273;
    float _1347 = fma(_971, _1257, _1345);
    float _1349 = -_1333;
    float _1351 = fma(_945, _1255, _1349);
    float _1353 = -_1287;
    float _1355 = fma(_1353, _1257, _1339);
    float _1357 = _1311 * _939;
    float _1359 = fma(_1299, _1257, _1335);
    float _1361 = _1311 * _945;
    float _1363 = fma(_1293, _1351, _1355);
    float _1365 = fma(_1295, _1257, _1357);
    float _1367 = _1325 * _945;
    float _1369 = fma(_1313, _1351, _1359);
    float _1371 = fma(_1293, _1347, _1343);
    float _1373 = fma(_1321, _1351, _1365);
    float _1375 = fma(_1295, _1261, _1361);
    float _1377 = fma(_1299, _1261, _1367);
    float _1379 = _1337 * _1363;
    float _1381 = _1337 * _1371;
    float _1383 = fma(_1321, _1347, _1375);
    float _1385 = fma(_1313, _1347, _1377);
    float _1387 = fma(_1331, _1373, _1379);
    float _1389 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1391 = _1389 * 0.5;
    float _1393 = fma(_1331, _1383, _1381);
    float _1395 = fma(_1391, _1369, _1387);
    float _1397 = fma(_1391, _1385, _1393);
    float _1399 = _945 * _1257;
    float _1401 = _1297 * _971;
    float _1403 = _1001 + _1395;
    float _1405 = _1007 + _1397;
    float _1407 = -_1399;
    float _1409 = fma(_939, _1261, _1407);
    float _1411 = _1311 * _971;
    float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1415 = _1403 + _1413;
    float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1419 = _1405 + _1417;
    float _1421 = -_1287;
    float _1423 = fma(_1421, _1255, _1401);
    float _1425 = _1325 * _971;
    float _1427 = _1415 * _1415;
    float _1429 = _1419 * _1419;
    float _1431 = fma(_1295, _1255, _1411);
    float _1433 = fma(_1293, _1409, _1423);
    float _1435 = fma(_1299, _1255, _1425);
    float _1437 = _1427 + _1429;
    float _1439 = fma(_1321, _1409, _1431);
    float _1441 = _1337 * _1433;
    float _1443 = fma(_1313, _1409, _1435);
    float _1445 = sqrt(_1437);
    float _1447 = fma(_1331, _1439, _1441);
    float _1449 = -_1269;
    float _1451 = _1275 ? _1449 : _1269;
    int _1453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1455 = _1453 != 0;
    float _1457 = fma(_1391, _1443, _1447);
    bool _1459 = _683 > 0.5;
    float _1461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1463 = !_1455;
    float _1465 = _1463 ? _1269 : _1451;
    float _1467 = _791 + _1457;
    bool _1469 = _1445 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1471 = _1425;
    float _1473 = _1451;
    float _1475 = _1189;
    float _1477 = _1301;
    if (!_1469)
    {
        _1471 = _1429;
    }
    float _1479 = _1471;
    float _1481 = _1479;
    if (!_1469)
    {
        _973 = _1427;
    }
    float _1483 = _973;
    float _1485 = _1483;
    if (!_1469)
    {
        _845 = _1403;
    }
    float _1487 = _845;
    float _1489 = _1487;
    if (!_1469)
    {
        _847 = _1405;
    }
    float _1491 = _847;
    float _1493 = _1491;
    if (!_1469)
    {
        _1473 = _1467;
    }
    float _1495 = _1473;
    bool _1497 = !_1469;
    float _1499 = _1495;
    if (!_1497)
    {
        float _1501 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1503 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1505 = _1445 + _1503;
        float _1507 = rsqrt(_1437);
        float _1509 = _1505 * _1501;
        float _1511 = _1467 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1513 = _1509 * 0.15915493667125701904296875;
        float _1515 = _1513 * 6.283185482025146484375;
        float _1517 = sin(_1515);
        float _1519 = _1513 * 6.283185482025146484375;
        float _1521 = cos(_1519);
        float _1523 = fma(_1517, _1511, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1525 = _1507 * _1523;
        float _1527 = _1521 + (-1.0);
        float _1529 = fma(_1415, _1525, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1531 = fma(_1419, _1525, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1533 = _1527 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1535 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1537 = _1529 + _1535;
        float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1541 = _1531 + _1539;
        float _1543 = fma(_1467, _1521, _1533);
        float _1545 = _1537 * _1537;
        float _1547 = _1541 * _1541;
        _1499 = _1543;
        _1485 = _1545;
        _1481 = _1547;
        _1489 = _1529;
        _1493 = _1531;
    }
    float _1549 = _1499;
    float _1551 = _1485;
    float _1553 = _1481;
    float _1555 = _1489;
    float _1557 = _1493;
    float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1561 = _1549 + _1559;
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1565 = _1563 != 0;
    float _1567 = _1465 + 0.5;
    float _1569 = -_1307;
    int _1571 = _1459 ? as_type<int>(_1569) : as_type<int>(_1307);
    float _1573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1575 = fma(_1561, _1561, _1551);
    float _1577 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1579 = !_1565;
    float _1581 = _1579 ? _1307 : as_type<float>(_1571);
    float _1583 = _1575 + _1553;
    float _1585 = _1577 * _1461;
    float _1587 = -_1581;
    float _1589 = _1587 + 0.5;
    float _1591 = sqrt(_1583);
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1605 = _1589 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1609 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1611 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1613 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1615 = _1599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1617 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1619 = _1603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1621 = _1605 * _1573;
    out.m_66.x = _1609;
    out.m_66.y = _1611;
    out.m_66.z = _1613;
    out.m_66.w = _1607;
    bool _1623 = _1591 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1625 = isnan(_1591);
    bool _1627 = _1623 || _1625;
    bool _1629 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1631 = _1627 || _1629;
    out.m_68.x = _1615;
    out.m_68.y = _1617;
    out.m_68.z = _1619;
    out.m_70.x = _1585;
    out.m_70.y = _1621;
    float _1633 = _1583;
    if (!_1631)
    {
        _1633 = 1.0;
    }
    float _1635 = _1633;
    bool _1637 = !_1631;
    float _1639 = _1635;
    if (!_1637)
    {
        bool _1641 = _1591 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1643 = isnan(_1591);
        bool _1645 = _1641 || _1643;
        bool _1647 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1649 = _1645 || _1647;
        if (!_1649)
        {
            float _1651 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1653 = _1591 + _1651;
            float _1655 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1657 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1655;
            float _1659 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1661 = _1659 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1663 = 1.0 / _1657;
            float _1665 = _1653 * _1663;
            float _1667 = fma(_1665, _1661, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1639 = _1667;
            _1669 = true;
        }
        else
        {
            bool _1671 = _1591 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1673 = isnan(_1591);
            bool _1675 = _1671 || _1673;
            bool _1677 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1679 = _1675 || _1677;
            if (!_1679)
            {
                float _1681 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1683 = _1591 + _1681;
                float _1685 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1687 = _1685 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1689 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1691 = _1689 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1693 = 1.0 / _1687;
                float _1695 = _1683 * _1693;
                float _1697 = fma(_1695, _1691, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1639 = _1697;
                _1669 = true;
            }
            else
            {
                _1639 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1669 = false;
    float _1699 = _1639;
    float _1701 = -_1151;
    float _1703 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _791);
    float _1705 = -_1153;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1001);
    float _1709 = -_1189;
    float _1711 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1007);
    float _1713 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1715 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1717 = _1555 + _1715;
    float _1719 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1721 = _1549 + _1719;
    bool _1723 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan(0.5);
    bool _1731 = _1727 || _1729;
    float _1733 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1713);
    float _1735 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1737 = _1557 + _1735;
    float _1739 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1741 = fma(_1717, _1699, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1743 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1733);
    float _1745 = fma(_1737, _1699, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1747 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1739);
    float _1749 = -_1153;
    float _1751 = fma(_1749, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1741);
    float _1753 = _1743 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1755 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1747);
    float _1757 = fma(_1721, _1699, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1759 = 1.0 / _1753;
    float _1761 = -_1189;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1745);
    float _1765 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1767 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan(0.5);
    bool _1775 = _1771 || _1773;
    float _1777 = -_1151;
    float _1779 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1757);
    float _1781 = _1779;
    float _1783 = _1763;
    float _1785 = _1765;
    if (_1731)
    {
        _1475 = _1751;
    }
    float _1787 = _1475;
    float _1789 = _1765 + _1753;
    float _1791 = _1787;
    if (!_1731)
    {
        float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1795 = _1703 + _1793;
        float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1799 = _1707 + _1797;
        float _1801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1803 = -_1007;
        float _1805 = _1803 + _1745;
        float _1807 = _1795 * _1795;
        float _1809 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1811 = _1711 + _1809;
        float _1813 = -_1001;
        float _1815 = _1813 + _1741;
        float _1817 = -_791;
        float _1819 = _1817 + _1757;
        float _1821 = fma(_1799, _1799, _1807);
        float _1823 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1825 = fma(_1811, _1811, _1821);
        float _1827 = sqrt(_1825);
        float _1829 = 1.0 / _1301;
        float _1831 = precise::min(_1827, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1833 = _1831 * _1801;
        float _1835 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1837 = _1833 * _1829;
        float _1839 = _1835 * _1837;
        float _1841 = _1805 * _1837;
        float _1843 = fma(_1815, _1839, _1707);
        float _1845 = fma(_1819, _1839, _1703);
        float _1847 = fma(_1835, _1841, _1711);
        _1781 = _1845;
        _1791 = _1843;
        _1783 = _1847;
        _1785 = _1841;
    }
    float _1849 = _1781;
    float _1851 = _1791;
    float _1853 = _1783;
    float _1855 = _1785;
    float _1857 = _1855;
    if (_1775)
    {
        _1857 = 1.0;
    }
    float _1859 = _1857;
    float _1861 = _1789 * _1759;
    float _1863 = _1861 * 0.5;
    float _1865 = _1859;
    if (!_1775)
    {
        float _1867 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1869 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1871 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1869);
        float _1873 = _1867 * 0.15915493667125701904296875;
        float _1875 = _1873 * 6.283185482025146484375;
        float _1877 = cos(_1875);
        float _1879 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1881 = _1879 * 0.15915493667125701904296875;
        float _1883 = _1873 * 6.283185482025146484375;
        float _1885 = sin(_1883);
        float _1887 = 1.0 / _1877;
        float _1889 = _1881 * 6.283185482025146484375;
        float _1891 = cos(_1889);
        float _1893 = _1885 * _1887;
        float _1895 = 1.0 / _1871;
        float _1897 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1899 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1897;
        float _1901 = _1891 * _1893;
        float _1903 = _1881 * 6.283185482025146484375;
        float _1905 = sin(_1903);
        float _1907 = 1.0 / _1901;
        float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1911 = _1895 * _1909;
        float _1913 = 1.0 / _1899;
        float _1915 = _1905 * _1907;
        float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1919 = fma(_1915, _1911, _1917);
        float _1921 = _1919 * _1913;
        float _1923 = precise::clamp(_1921, 0.0, 1.0);
        _1865 = _1923;
    }
    float _1925 = _1865;
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1929 = _1849 + _1927;
    float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1933 = _1851 + _1931;
    float _1935 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1937 = _1853 + _1935;
    float _1939 = _1929 * _1929;
    float _1941 = fma(_1933, _1933, _1939);
    float _1943 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1945 = fma(_1937, _1937, _1941);
    float _1947 = rsqrt(_1945);
    float _1949 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1951 = _1933 * _1949;
    float _1953 = _1937 * _1949;
    float _1955 = _1951 * _1951;
    float _1957 = _1953 * _1953;
    float _1959 = _1955 + _1957;
    float _1961 = sqrt(_1959);
    bool _1963 = _1961 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1965 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1967 = _1961 + _1965;
    float _1969 = _1937;
    float _1971 = _1959;
    float _1973 = _1967;
    float _1975 = _1929;
    float _1977 = _1949;
    float _1979 = _1951;
    if (_1963)
    {
        float _1981 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1969 = _1981;
    }
    float _1983 = _1969;
    if (_1963)
    {
        float _1985 = rsqrt(_1959);
        _1971 = _1985;
    }
    float _1987 = _1971;
    if (_1963)
    {
        float _1989 = _1967 * _1983;
        _1973 = _1989;
    }
    float _1991 = _1973;
    if (_1963)
    {
        float _1993 = _1991 * 0.15915493667125701904296875;
        _1477 = _1993;
    }
    float _1995 = _1477;
    float _1997 = _1939;
    if (_1963)
    {
        float _1999 = _1995 * 6.283185482025146484375;
        float _2001 = sin(_1999);
        _1997 = _2001;
    }
    float _2003 = _1997;
    float _2005 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2007 = precise::max(0.0, _2005);
    float _2009 = _1947;
    float _2011 = _2005;
    if (_1963)
    {
        float _2013 = _1995 * 6.283185482025146484375;
        float _2015 = cos(_2013);
        _2009 = _2015;
    }
    float _2017 = _2009;
    float _2019 = -_1949;
    float _2021 = -_2007;
    float _2023 = fma(_1929, _2019, _2021);
    float _2025 = _2023;
    if (_1963)
    {
        float _2027 = _2023 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2011 = _2027;
    }
    float _2029 = _2011;
    float _2031 = _2029;
    float _2033 = _2003;
    if (_1963)
    {
        float _2035 = fma(_2003, _2029, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1975 = _2035;
    }
    float _2037 = _1975;
    float _2039 = _2037;
    float _2041 = _2017;
    if (_1963)
    {
        float _2043 = _2017 + (-1.0);
        _2031 = _2043;
    }
    float _2045 = _2031;
    float _2047 = _2045;
    if (_1963)
    {
        float _2049 = _1987 * _2037;
        _1977 = _2049;
    }
    float _2051 = _1977;
    if (!_1963)
    {
        _2039 = _1953;
    }
    float _2053 = _2039;
    float _2055 = sqrt(_1945);
    float _2057 = _2053;
    if (_1963)
    {
        float _2059 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2033 = _2059;
    }
    float _2061 = _2033;
    if (_1963)
    {
        float _2063 = _1951 * _2051;
        _1979 = _2063;
    }
    float _2065 = _1979;
    if (!_1963)
    {
        _2047 = _1955;
    }
    float _2067 = _2047;
    float _2069 = _2067;
    if (_1963)
    {
        float _2071 = _1953 * _2051;
        _2057 = _2071;
    }
    float _2073 = _2057;
    if (_1963)
    {
        float _2075 = fma(_2023, _2017, _2061);
        _2025 = _2075;
    }
    float _2077 = _2025;
    if (_1963)
    {
        float _2079 = _2065 * _2065;
        _2069 = _2079;
    }
    float _2081 = _2069;
    if (!_1963)
    {
        _2041 = _1957;
    }
    float _2083 = _2041;
    float _2085 = _2083;
    if (_1963)
    {
        float _2087 = _2073 * _2073;
        _2085 = _2087;
    }
    float _2089 = _2085;
    float _2091 = fma(_2077, _2077, _2081);
    float _2093 = _2091 + _2089;
    float _2095 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2099 = fma(_2055, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2097);
    float _2101 = precise::clamp(_2099, 0.0, 1.0);
    float _2103 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2105 = rsqrt(_2093);
    float _2107 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2095);
    float _2109 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2111 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2103);
    float _2113 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2115 = -_2101;
    float _2117 = _2115 + 1.0;
    float _2119 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2109);
    float _2121 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2111);
    float _2123 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2113);
    float _2125 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2107);
    float _2127 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2119);
    float _2129 = _2121 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2131 = abs(_2117);
    float _2133 = log2(_2131);
    float _2135 = _2125 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2137 = _2127 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2139 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2141 = _2105 * _2065;
    float _2143 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2123);
    float _2145 = _2105 * _2073;
    float _2147 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2139);
    float _2149 = _2105 * _2077;
    float _2151 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2153 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2155 = _2143 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2157 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2147);
    float _2159 = -_2151;
    float _2161 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2159);
    float _2163 = -_2153;
    float _2165 = fma(_2163, _1943, 1.0);
    float _2167 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2169 = -_2145;
    float _2171 = fma(_2169, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2161);
    float _2173 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2157);
    float _2175 = log2(_2165);
    float _2177 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2179 = fma(_2171, -0.5, 0.5);
    float _2181 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2183 = fma(_2171, 0.5, 0.5);
    float _2185 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2177);
    float _2187 = _2149 + 1.0;
    float _2189 = exp2(_2167);
    float _2191 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2181);
    float _2193 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2185);
    float _2195 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2191);
    float _2197 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2193);
    float _2199 = 1.0 / _2173;
    float _2201 = fma(_2183, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2203 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2195);
    float _2205 = _2175 * 0.693147182464599609375;
    float _2207 = fma(_2183, _2201, -0.212114393711090087890625);
    float _2209 = _2205 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2211 = sqrt(_2179);
    float _2213 = -_2149;
    float _2215 = fma(_2189, _2187, _2213);
    float _2217 = fma(_2183, _2207, 1.570728778839111328125);
    float _2219 = _2197 * _2199;
    float _2221 = _2203 * _2199;
    float _2223 = fma(_2219, 0.5, 0.5);
    float _2225 = fma(_2221, -0.5, 0.5);
    float _2227 = fma(_2215, 0.5, 0.5);
    float _2229 = _2211 * 0.636619746685028076171875;
    float3 _5704 = float3(_2223, _2225, _2209);
    float _2231 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5704, float3(0.0), isnan(_5704)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5704, float3(0.0), isnan(_5704)), level(0.0)).x;
    float3 _5715 = float3(_2223, _2225, _2209);
    float4 _2234 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5715, float3(0.0), isnan(_5715)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5715, float3(0.0), isnan(_5715)), level(0.0)).xyzw;
    float _2236 = _2234.x;
    float _2238 = _2234.y;
    float _2240 = _2234.z;
    float _2242 = _2234.w;
    float _2244 = -_2217;
    float _2246 = fma(_2229, _2244, 1.0);
    float2 _5737 = float2(_2246, _2227);
    float3 _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5737, float2(0.0), isnan(_5737)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5737, float2(0.0), isnan(_5737)), level(0.0)).xyz;
    float _2252 = _2250.x;
    float _2254 = _2250.y;
    float _2256 = _2250.z;
    float _2258 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2260 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2262 = _1925 > 0.0;
    bool _2264 = isnan(_1925);
    bool _2266 = _2262 || _2264;
    bool _2268 = isnan(0.0);
    bool _2270 = _2266 || _2268;
    float _2272 = _2197 + _2173;
    float _2274 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2260);
    float _2276 = exp2(_2258);
    float _2278 = _2272 * 0.5;
    float _2280 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2274);
    float _2282 = _1925 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2284 = _2173 * 0.5;
    float _2286 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2280);
    float _2288 = _2286 + _2173;
    float _2290 = fma(_2203, -0.5, _2284);
    float _2292 = _2282 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2197;
    out.gl_Position.y = _2203;
    out.gl_Position.z = _2286;
    out.gl_Position.w = _2173;
    float _2294 = _2288 * 0.5;
    float _2296 = -_2276;
    float _2298 = _2296 + 1.0;
    out.m_47.x = _2292;
    float _2300 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_72.x = _2278;
    out.m_72.y = _2290;
    out.m_72.z = _2294;
    out.m_72.w = _2173;
    float _2302 = -_2300;
    float _2304 = _2302 + 1.0;
    float _2306 = _2300 * _2231;
    float _2308 = _2242 * _2306;
    float _2310 = _2256 * _2306;
    float _2312 = fma(_2252, _2308, _2236);
    float _2314 = fma(_2254, _2308, _2238);
    float _2316 = _2242 * _2304;
    float _2318 = fma(_2242, _2310, _2240);
    out.m_74.x = _2312;
    out.m_74.y = _2314;
    out.m_74.z = _2318;
    out.m_74.w = _2316;
    if (_2270)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2320 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2320;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1669 = false;
    bool _667 = false;
    bool _505 = false;
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
        float _2377 = as_type<float>(_109);
        out.gl_Position.z = _2377;
    }
    if (!_97)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _145 = _143;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    if (_139)
    {
        float _147 = _143 * 5.0;
        _111 = as_type<int>(_147);
    }
    int _149 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2448 = as_type<float>(_149);
        out.gl_Position.z = _2448;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = in.m_49.x;
    float _153 = in.m_49.y;
    float _155 = in.m_49.z;
    float _157 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = 0.0;
    float _171 = _157;
    if (!_167)
    {
        float _173 = _157 * _157;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = 0.0;
    float _181 = _177;
    if (!_167)
    {
        float _183 = _127 * _127;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    if (!_167)
    {
        float _189 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _189;
    }
    float _191 = _181;
    bool _193 = !_167;
    float _195 = _191;
    float _197 = 0.0;
    if (!_193)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _157 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _157);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _145 = _213;
        _195 = _227;
        _197 = _215;
    }
    float _229 = _145;
    float _231 = _195;
    float _233 = _197;
    bool _235 = !_167;
    float _237 = _229;
    float _239 = _233;
    if (!_235)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _157 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _237 = _253;
        _239 = _247;
        _171 = _259;
    }
    float _261 = _237;
    float _263 = _239;
    float _265 = _171;
    float _267 = _263;
    float _269 = _261;
    if (!_167)
    {
        _267 = _127;
    }
    float _271 = _267;
    float _273 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _275 = _271;
    if (!_167)
    {
        float _277 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _269 = _277;
    }
    float _279 = _269;
    bool _281 = !_167;
    float _283 = _279;
    if (!_281)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = _127 * _287;
        float _297 = 1.0 / _291;
        float _299 = _293 * 0.693147182464599609375;
        float _301 = exp2(_295);
        float _303 = 1.0 / _299;
        float _305 = _301 + (-1.0);
        float _307 = -_305;
        float _309 = fma(_307, _303, _127);
        float _311 = _309 * _297;
        float _313 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _283 = _313;
    }
    float _315 = _283;
    bool _317 = !_167;
    if (!_317)
    {
        float _319 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _321 = log2(_319);
        float _323 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _325 = _323 + 1.0;
        float _327 = 1.0 / _325;
        float _329 = _127 * _321;
        float _331 = exp2(_329);
        float _333 = -_331;
        float _335 = _333 + 1.0;
        float _337 = _335 * _327;
        _275 = _337;
    }
    float _339 = _275;
    float _341 = fma(_265, _151, _273);
    float _343 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _345 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _347 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _349 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = fma(_265, _153, _343);
    float _353 = fma(_339, _153, _345);
    float _355 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _357 = fma(_339, _151, _347);
    float _359 = fma(_339, _155, _349);
    float _361 = -_353;
    float _363 = _351 + _361;
    float _365 = fma(_265, _155, _355);
    float _367 = -_357;
    float _369 = _341 + _367;
    float _371 = in.m_51.y;
    float _373 = _363 * _363;
    float _375 = -_359;
    float _377 = _365 + _375;
    float _379 = in.m_53.y;
    float _381 = fma(_369, _369, _373);
    float _383 = in.m_55.y;
    float _385 = fma(_377, _377, _381);
    float _387 = in.m_51.x;
    float _389 = sqrt(_385);
    float _391 = in.m_53.x;
    float _393 = in.m_51.z;
    float _395 = in.m_55.x;
    float _397 = _363 * _371;
    float _399 = in.m_53.z;
    float _401 = _363 * _379;
    bool _403 = _389 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_389);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = in.m_55.z;
    float _415 = _363 * _383;
    float _417 = _383 * _383;
    float _419 = in.m_57.w;
    float _421 = fma(_369, _387, _397);
    float _423 = in.m_44.x;
    float _425 = in.m_44.y;
    float _427 = in.m_44.z;
    float _429 = fma(_369, _391, _401);
    float _431 = fma(_377, _393, _421);
    float _433 = fma(_371, _371, _417);
    float _435 = fma(_369, _395, _415);
    float _437 = fma(_379, _379, _433);
    float _439 = fma(_377, _399, _429);
    float _441 = _429;
    float _443 = _433;
    if (_411)
    {
        _441 = _431;
    }
    float _445 = _441;
    float _447 = fma(_377, _413, _435);
    float _449 = _445;
    float _451 = _447;
    float _453 = _447;
    float _455 = _445;
    if (_411)
    {
        _443 = _439;
    }
    float _457 = _443;
    float _459 = fma(_341, _419, _423);
    float _461 = fma(_351, _419, _425);
    float _463 = fma(_365, _419, _427);
    float _465 = _457;
    if (!_411)
    {
        bool _467 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _469 = !_467;
        if (!_469)
        {
            float _471 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _473 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _475 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _477 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[16].x, _471);
            float _479 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[16].x, _473);
            float _481 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[16].x, _475);
            float _483 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[16].z, _477);
            float _485 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[16].z, _479);
            float _487 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[16].z, _481);
            float _489 = _483 * _483;
            float _491 = fma(_485, _485, _489);
            float _493 = fma(_487, _487, _491);
            float _495 = rsqrt(_493);
            float _497 = _495 * 9.9999999747524270787835121154785e-07;
            float _499 = _485 * _497;
            float _501 = _483 * _497;
            float _503 = _487 * _497;
            _453 = _501;
            _455 = _499;
            _465 = _503;
            _505 = true;
        }
        else
        {
            float _507 = _153 * _153;
            float _509 = fma(_151, _151, _507);
            float _511 = fma(_155, _155, _509);
            float _513 = sqrt(_511);
            bool _515 = _513 >= 9.9999999747524270787835121154785e-07;
            bool _517 = isnan(_513);
            bool _519 = _515 || _517;
            bool _521 = isnan(9.9999999747524270787835121154785e-07);
            bool _523 = _519 || _521;
            float _525 = _513;
            if (!_523)
            {
                float _527 = _425 * _425;
                float _529 = fma(_423, _423, _527);
                float _531 = fma(_427, _427, _529);
                float _533 = sqrt(_531);
                bool _535 = _533 >= 9.9999999747524270787835121154785e-07;
                bool _537 = isnan(_533);
                bool _539 = _535 || _537;
                bool _541 = isnan(9.9999999747524270787835121154785e-07);
                bool _543 = _539 || _541;
                float _545 = _437;
                if (!_543)
                {
                    float _547 = rsqrt(_437);
                    _545 = _547;
                }
                float _549 = _545;
                if (!_543)
                {
                    float _551 = _549 * 9.9999999747524270787835121154785e-07;
                    _525 = _551;
                }
                float _553 = _525;
                float _555 = _553;
                if (!_543)
                {
                    float _557 = _371 * _553;
                    _449 = _557;
                }
                float _559 = _449;
                _455 = _559;
                if (!_543)
                {
                    float _561 = _383 * _553;
                    _451 = _561;
                }
                float _563 = _451;
                _453 = _563;
                if (!_543)
                {
                    float _565 = _379 * _553;
                    _555 = _565;
                }
                float _567 = _555;
                bool _569 = !_543;
                _465 = _567;
                _505 = _569;
                if (!_505)
                {
                    float _571 = _383 * _425;
                    float _573 = _371 * _425;
                    float _575 = _379 * _425;
                    float _577 = fma(_423, _395, _571);
                    float _579 = fma(_423, _387, _573);
                    float _581 = fma(_423, _391, _575);
                    float _583 = fma(_427, _413, _577);
                    float _585 = fma(_427, _393, _579);
                    float _587 = fma(_427, _399, _581);
                    float _589 = _583 * _583;
                    float _591 = fma(_585, _585, _589);
                    float _593 = fma(_587, _587, _591);
                    float _595 = rsqrt(_593);
                    float _597 = _595 * 9.9999999747524270787835121154785e-07;
                    float _599 = _585 * _597;
                    float _601 = _583 * _597;
                    float _603 = _587 * _597;
                    _453 = _601;
                    _455 = _599;
                    _465 = _603;
                    _505 = true;
                }
            }
            else
            {
                float _605 = _383 * _153;
                float _607 = _371 * _153;
                float _609 = _379 * _153;
                float _611 = fma(_151, _395, _605);
                float _613 = fma(_151, _387, _607);
                float _615 = fma(_151, _391, _609);
                float _617 = fma(_155, _413, _611);
                float _619 = fma(_155, _393, _613);
                float _621 = fma(_155, _399, _615);
                float _623 = _617 * _617;
                float _625 = fma(_619, _619, _623);
                float _627 = fma(_621, _621, _625);
                float _629 = rsqrt(_627);
                float _631 = _629 * 9.9999999747524270787835121154785e-07;
                float _633 = _619 * _631;
                float _635 = _617 * _631;
                float _637 = _621 * _631;
                _453 = _635;
                _455 = _633;
                _465 = _637;
            }
        }
    }
    _505 = false;
    float _639 = _453;
    float _641 = _455;
    float _643 = _465;
    bool _645 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _647 = !_645;
    float _665;
    if (!_647)
    {
        float _649 = in.m_59.x;
        float _651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _653 = _649 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _655 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _657 = _655 * _651;
        float _659 = floor(_657);
        float _661 = -_659;
        float _663 = _657 + _661;
        _665 = _663;
        _667 = true;
    }
    else
    {
        float _669 = float(_93);
        float _671 = 1.0 / _669;
        float _673 = _127 * _671;
        _665 = _673;
    }
    _667 = false;
    float _675 = _665;
    float _677 = in.m_59.z;
    float _679 = _461 * _371;
    float _681 = in.m_59.x;
    float _683 = in.m_59.y;
    float _685 = _461 * _379;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _695;
    float _699 = fma(_459, _387, _679);
    float _701 = 1.0 / _689;
    float _703 = fma(_459, _391, _685);
    float _705 = _461 * _383;
    float _707 = fma(_463, _393, _699);
    float _709 = fma(_463, _399, _703);
    float _711 = 1.0 / _693;
    float _713 = fma(_459, _395, _705);
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _717 = _715 != 0;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _721 = _719 != 0;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _725 = _723 != 0;
    float _727 = fma(_463, _413, _713);
    float _729 = _677 * 2.0;
    float _731 = 1.0 / _697;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _735 = _675 + _733;
    float _737 = _681 * 2.0;
    float _739 = _683 * 2.0;
    float _741 = _735 * _701;
    float _743 = _683 + _681;
    float _745 = floor(_729);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _749 = _675 + _747;
    float _751 = _743 + (-1.0);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _753;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _761 = _749 * _711;
    float _763 = _683 + _677;
    float _765 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _767 = floor(_737);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _771 = _675 + _769;
    float _773 = _763 + (-1.0);
    float _775 = fma(_759, _761, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _777 = fma(_755, _741, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _779 = _771 * _731;
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _783 = _639 * _639;
    float _785 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _787 = log2(_785);
    bool _789 = _745 > 0.0;
    float _791 = _727 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _793 = _745 >= 0.0;
    bool _795 = isnan(_745);
    bool _797 = _793 || _795;
    bool _799 = isnan(0.0);
    bool _801 = _797 || _799;
    float _803 = fma(_641, _641, _783);
    float _805 = _677 + _681;
    float _807 = _683 + (-0.5);
    int _809 = _801 ? 0 : 1;
    float _811 = floor(_739);
    bool _813 = _767 > 0.0;
    float _815 = _805 + (-1.0);
    bool _817 = _767 >= 0.0;
    bool _819 = isnan(_767);
    bool _821 = _817 || _819;
    bool _823 = isnan(0.0);
    bool _825 = _821 || _823;
    float _827 = fma(_643, _643, _803);
    bool _829 = !_717;
    int _831 = _829 ? 0 : 1;
    float _833 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _835 = ~_809;
    int _837 = _835 + 1;
    int _839 = _837 + 1;
    float _841 = _787 * _127;
    int _843 = _839;
    float _845 = _683;
    float _847 = _681;
    if (!_789)
    {
        int _849 = ~_809;
        int _851 = _849 + 1;
        _843 = _851;
    }
    int _853 = _843;
    float _855 = rsqrt(_827);
    int _857 = abs(_831);
    float _859 = in.m_61.x;
    float _861 = in.m_61.y;
    float _863 = in.m_61.z;
    bool _865 = _811 > 0.0;
    bool _867 = _811 >= 0.0;
    bool _869 = isnan(_811);
    bool _871 = _867 || _869;
    bool _873 = isnan(0.0);
    bool _875 = _871 || _873;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _885 = exp2(_841);
    bool _887 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _889 = isnan(1.0);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _895 = _891 || _893;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _899 = 1.0 + _897;
    float _901 = fma(_883, _761, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _903 = !_721;
    int _905 = _903 ? 0 : 1;
    float _907 = fma(_879, _741, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _909 = float(_857);
    float _911 = float(_853);
    float _913 = 1.0 / _899;
    int _915 = _825 ? 0 : 1;
    int _917 = abs(_905);
    float _919 = _909 * _911;
    int _921 = ~_915;
    int _923 = _921 + 1;
    int _925 = _923 + 1;
    int _927 = _925;
    if (!_813)
    {
        int _929 = ~_915;
        int _931 = _929 + 1;
        _927 = _931;
    }
    int _933 = _927;
    float _935 = -_885;
    float _937 = _935 + 1.0;
    float _939 = _855 * _641;
    float _941 = float(_933);
    float _943 = float(_917);
    float _945 = _855 * _643;
    bool _947 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _949 = isnan(0.0);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _955 = _951 || _953;
    float _957 = _919 * (-2.0);
    int _959 = _875 ? 0 : 1;
    float _961 = _943 * _941;
    float _963 = _955 ? _937 : 0.0;
    float _965 = _681 + (-0.5);
    float _967 = fma(_957, _859, _859);
    float _969 = fma(_765, _957, _765);
    float _971 = _855 * _639;
    float _973 = _971;
    if (_895)
    {
        float _975 = _963 * _913;
        _129 = _975;
    }
    float _977 = _129;
    float _979 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[196].x, _967);
    float _981 = _961 * (-2.0);
    float _983 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _985 = _791 + _983;
    bool _987 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _989 = isnan(_675);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = fma(_969, _977, _979);
    float _1001 = _707 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1003 = fma(_781, _981, _781);
    float _1005 = fma(_981, _861, _861);
    float _1007 = _709 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1011 = _945 * _1009;
    float _1013 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1015 = _1001 + _1013;
    float _1017 = _985 * _985;
    int _1019 = ~_959;
    int _1021 = _1019 + 1;
    int _1023 = _1021 + 1;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1027 = -_1011;
    float _1029 = fma(_939, _1025, _1027);
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1033 = _1007 + _1031;
    float _1035 = fma(_1015, _1015, _1017);
    int _1037 = _1023;
    if (!_865)
    {
        int _1039 = ~_959;
        int _1041 = _1039 + 1;
        _1037 = _1041;
    }
    int _1043 = _1037;
    float _1045 = -_997;
    float _1047 = _1045 + 1.0;
    bool _1049 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1051 = isnan(_675);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1057 = _1053 || _1055;
    float _1059 = float(_1057);
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1063 = _971 * _1061;
    bool _1065 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1067 = isnan(_675);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1073 = _1069 || _1071;
    float _1075 = float(_1073);
    float _1077 = fma(_1033, _1033, _1035);
    bool _1079 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1081 = isnan(_675);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1087 = _1083 || _1085;
    float _1089 = float(_1087);
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1093 = -_1063;
    float _1095 = fma(_945, _1091, _1093);
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1099 = _939 * _1097;
    float _1101 = _1029 * _1029;
    float _1103 = _999 * 0.15915493667125701904296875;
    float _1105 = _1089 * _1047;
    float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1109 = -_1099;
    float _1111 = fma(_971, _1107, _1109);
    float _1113 = rsqrt(_1077);
    float _1115 = fma(_1095, _1095, _1101);
    bool _1117 = !_725;
    int _1119 = _1117 ? 0 : 1;
    float _1121 = -_1075;
    float _1123 = _1121 + 1.0;
    float _1125 = -_1089;
    float _1127 = _1125 + 1.0;
    float _1129 = fma(_1111, _1111, _1115);
    int _1131 = abs(_1119);
    float _1133 = _1059 * _1123;
    float _1135 = _1075 * _1127;
    float _1137 = float(_1043);
    float _1139 = -_1059;
    float _1141 = _1139 + 1.0;
    float _1143 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1005);
    float _1145 = _777 * _1133;
    float _1147 = _907 * _1133;
    float _1149 = float(_1131);
    float _1151 = _985 * _1113;
    float _1153 = _1015 * _1113;
    float _1155 = fma(_1003, _977, _1143);
    float _1157 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1147);
    float _1159 = -_1151;
    float _1161 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[18].w, _985);
    float _1163 = -_1153;
    float _1165 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1015);
    float _1167 = _1149 * _1137;
    float _1169 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1145);
    float _1171 = _1161 * _1161;
    float _1173 = _677 + (-0.5);
    float _1175 = _1167 * (-2.0);
    float _1177 = _1103 * 6.283185482025146484375;
    float _1179 = sin(_1177);
    float _1181 = fma(_1165, _1165, _1171);
    float _1183 = in.m_57.x;
    float _1185 = in.m_57.y;
    float _1187 = fma(_1175, _863, _863);
    float _1189 = _1033 * _1113;
    float _1191 = fma(_833, _1175, _833);
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1193;
    float _1197 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1187);
    float _1199 = _1103 * 6.283185482025146484375;
    float _1201 = cos(_1199);
    float _1203 = as_type<float>(int(gl_VertexIndex));
    float _1205 = -_1189;
    float _1207 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1033);
    float _1209 = fma(_1191, _977, _1197);
    float _1211 = fma(_1195, _779, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1213 = fma(_775, _1135, _1169);
    float _1215 = fma(_1207, _1207, _1181);
    float _1217 = _1209 * 0.15915493667125701904296875;
    float _1219 = rsqrt(_1129);
    float _1221 = fma(_1211, _1105, _1213);
    float _1223 = fma(_901, _1135, _1157);
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1225;
    float _1229 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1221);
    float _1231 = sqrt(_1215);
    float _1233 = _1155 * 0.15915493667125701904296875;
    float _1235 = fma(_1227, _779, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1237 = fma(_1235, _1105, _1223);
    float _1239 = _1229 * _1183;
    float _1241 = _1233 * 6.283185482025146484375;
    float _1243 = sin(_1241);
    int _1245 = as_type<int>(_1203) & 1;
    bool _1247 = _1245 != 0;
    int _1249 = as_type<int>(_1203) & 2;
    bool _1251 = _1249 != 0;
    float _1253 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1237);
    float _1255 = _1029 * _1219;
    float _1257 = _1095 * _1219;
    float _1259 = _1253 * _1185;
    float _1261 = _1111 * _1219;
    float _1263 = _1233 * 6.283185482025146484375;
    float _1265 = cos(_1263);
    bool _1267 = !_1247;
    float _1269 = _1267 ? (-0.5) : 0.5;
    float _1271 = _1259 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1273 = _939 * _1255;
    bool _1275 = _681 > 0.5;
    float _1277 = _1217 * 6.283185482025146484375;
    float _1279 = cos(_1277);
    float _1281 = _1179 * _1243;
    float _1283 = _1201 * _1243;
    float _1285 = _1217 * 6.283185482025146484375;
    float _1287 = sin(_1285);
    float _1289 = _1179 * _1265;
    float _1291 = _1201 * _1265;
    float _1293 = _1179 * _1279;
    float _1295 = _1265 * _1279;
    float _1297 = _1201 * _1279;
    float _1299 = _1243 * _1279;
    float _1301 = _1113 * _1231;
    float _1303 = _1239 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1305 = !_1251;
    float _1307 = _1305 ? (-0.5) : 0.5;
    float _1309 = _1297 * _945;
    float _1311 = fma(_1287, _1291, _1281);
    float _1313 = fma(_1287, _1281, _1291);
    float _1315 = _1303 * _1301;
    float _1317 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1269);
    float _1319 = -_1283;
    float _1321 = fma(_1287, _1289, _1319);
    float _1323 = -_1289;
    float _1325 = fma(_1287, _1283, _1323);
    float _1327 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1307);
    float _1329 = _1271 * _1301;
    float _1331 = _1315 * _1317;
    float _1333 = _971 * _1261;
    float _1335 = _1325 * _939;
    float _1337 = _1329 * _1327;
    float _1339 = _1297 * _939;
    float _1341 = -_1287;
    float _1343 = fma(_1341, _1261, _1309);
    float _1345 = -_1273;
    float _1347 = fma(_971, _1257, _1345);
    float _1349 = -_1333;
    float _1351 = fma(_945, _1255, _1349);
    float _1353 = -_1287;
    float _1355 = fma(_1353, _1257, _1339);
    float _1357 = _1311 * _939;
    float _1359 = fma(_1299, _1257, _1335);
    float _1361 = _1311 * _945;
    float _1363 = fma(_1293, _1351, _1355);
    float _1365 = fma(_1295, _1257, _1357);
    float _1367 = _1325 * _945;
    float _1369 = fma(_1313, _1351, _1359);
    float _1371 = fma(_1293, _1347, _1343);
    float _1373 = fma(_1321, _1351, _1365);
    float _1375 = fma(_1295, _1261, _1361);
    float _1377 = fma(_1299, _1261, _1367);
    float _1379 = _1337 * _1363;
    float _1381 = _1337 * _1371;
    float _1383 = fma(_1321, _1347, _1375);
    float _1385 = fma(_1313, _1347, _1377);
    float _1387 = fma(_1331, _1373, _1379);
    float _1389 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1391 = _1389 * 0.5;
    float _1393 = fma(_1331, _1383, _1381);
    float _1395 = fma(_1391, _1369, _1387);
    float _1397 = fma(_1391, _1385, _1393);
    float _1399 = _945 * _1257;
    float _1401 = _1297 * _971;
    float _1403 = _1001 + _1395;
    float _1405 = _1007 + _1397;
    float _1407 = -_1399;
    float _1409 = fma(_939, _1261, _1407);
    float _1411 = _1311 * _971;
    float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1415 = _1403 + _1413;
    float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1419 = _1405 + _1417;
    float _1421 = -_1287;
    float _1423 = fma(_1421, _1255, _1401);
    float _1425 = _1325 * _971;
    float _1427 = _1415 * _1415;
    float _1429 = _1419 * _1419;
    float _1431 = fma(_1295, _1255, _1411);
    float _1433 = fma(_1293, _1409, _1423);
    float _1435 = fma(_1299, _1255, _1425);
    float _1437 = _1427 + _1429;
    float _1439 = fma(_1321, _1409, _1431);
    float _1441 = _1337 * _1433;
    float _1443 = fma(_1313, _1409, _1435);
    float _1445 = sqrt(_1437);
    float _1447 = fma(_1331, _1439, _1441);
    float _1449 = -_1269;
    float _1451 = _1275 ? _1449 : _1269;
    int _1453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1455 = _1453 != 0;
    float _1457 = fma(_1391, _1443, _1447);
    bool _1459 = _683 > 0.5;
    float _1461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1463 = !_1455;
    float _1465 = _1463 ? _1269 : _1451;
    float _1467 = _791 + _1457;
    bool _1469 = _1445 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1471 = _1425;
    float _1473 = _1451;
    float _1475 = _1189;
    float _1477 = _1301;
    if (!_1469)
    {
        _1471 = _1429;
    }
    float _1479 = _1471;
    float _1481 = _1479;
    if (!_1469)
    {
        _973 = _1427;
    }
    float _1483 = _973;
    float _1485 = _1483;
    if (!_1469)
    {
        _845 = _1403;
    }
    float _1487 = _845;
    float _1489 = _1487;
    if (!_1469)
    {
        _847 = _1405;
    }
    float _1491 = _847;
    float _1493 = _1491;
    if (!_1469)
    {
        _1473 = _1467;
    }
    float _1495 = _1473;
    bool _1497 = !_1469;
    float _1499 = _1495;
    if (!_1497)
    {
        float _1501 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1503 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1505 = _1445 + _1503;
        float _1507 = rsqrt(_1437);
        float _1509 = _1505 * _1501;
        float _1511 = _1467 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1513 = _1509 * 0.15915493667125701904296875;
        float _1515 = _1513 * 6.283185482025146484375;
        float _1517 = sin(_1515);
        float _1519 = _1513 * 6.283185482025146484375;
        float _1521 = cos(_1519);
        float _1523 = fma(_1517, _1511, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1525 = _1507 * _1523;
        float _1527 = _1521 + (-1.0);
        float _1529 = fma(_1415, _1525, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1531 = fma(_1419, _1525, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1533 = _1527 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1535 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1537 = _1529 + _1535;
        float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1541 = _1531 + _1539;
        float _1543 = fma(_1467, _1521, _1533);
        float _1545 = _1537 * _1537;
        float _1547 = _1541 * _1541;
        _1499 = _1543;
        _1485 = _1545;
        _1481 = _1547;
        _1489 = _1529;
        _1493 = _1531;
    }
    float _1549 = _1499;
    float _1551 = _1485;
    float _1553 = _1481;
    float _1555 = _1489;
    float _1557 = _1493;
    float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1561 = _1549 + _1559;
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1565 = _1563 != 0;
    float _1567 = _1465 + 0.5;
    float _1569 = -_1307;
    int _1571 = _1459 ? as_type<int>(_1569) : as_type<int>(_1307);
    float _1573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1575 = fma(_1561, _1561, _1551);
    float _1577 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1579 = !_1565;
    float _1581 = _1579 ? _1307 : as_type<float>(_1571);
    float _1583 = _1575 + _1553;
    float _1585 = _1577 * _1461;
    float _1587 = -_1581;
    float _1589 = _1587 + 0.5;
    float _1591 = sqrt(_1583);
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1603 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1605 = _1589 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1609 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1611 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1613 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1615 = _1599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1617 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1619 = _1603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1621 = _1605 * _1573;
    out.m_66.x = _1609;
    out.m_66.y = _1611;
    out.m_66.z = _1613;
    out.m_66.w = _1607;
    bool _1623 = _1591 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1625 = isnan(_1591);
    bool _1627 = _1623 || _1625;
    bool _1629 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1631 = _1627 || _1629;
    out.m_68.x = _1615;
    out.m_68.y = _1617;
    out.m_68.z = _1619;
    out.m_70.x = _1585;
    out.m_70.y = _1621;
    float _1633 = _1583;
    if (!_1631)
    {
        _1633 = 1.0;
    }
    float _1635 = _1633;
    bool _1637 = !_1631;
    float _1639 = _1635;
    if (!_1637)
    {
        bool _1641 = _1591 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1643 = isnan(_1591);
        bool _1645 = _1641 || _1643;
        bool _1647 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1649 = _1645 || _1647;
        if (!_1649)
        {
            float _1651 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1653 = _1591 + _1651;
            float _1655 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1657 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1655;
            float _1659 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1661 = _1659 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1663 = 1.0 / _1657;
            float _1665 = _1653 * _1663;
            float _1667 = fma(_1665, _1661, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1639 = _1667;
            _1669 = true;
        }
        else
        {
            bool _1671 = _1591 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1673 = isnan(_1591);
            bool _1675 = _1671 || _1673;
            bool _1677 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1679 = _1675 || _1677;
            if (!_1679)
            {
                float _1681 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1683 = _1591 + _1681;
                float _1685 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1687 = _1685 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1689 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1691 = _1689 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1693 = 1.0 / _1687;
                float _1695 = _1683 * _1693;
                float _1697 = fma(_1695, _1691, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1639 = _1697;
                _1669 = true;
            }
            else
            {
                _1639 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1669 = false;
    float _1699 = _1639;
    float _1701 = -_1151;
    float _1703 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _791);
    float _1705 = -_1153;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1001);
    float _1709 = -_1189;
    float _1711 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1007);
    float _1713 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1715 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1717 = _1555 + _1715;
    float _1719 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1721 = _1549 + _1719;
    bool _1723 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan(0.5);
    bool _1731 = _1727 || _1729;
    float _1733 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1713);
    float _1735 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1737 = _1557 + _1735;
    float _1739 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1741 = fma(_1717, _1699, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1743 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1733);
    float _1745 = fma(_1737, _1699, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1747 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1739);
    float _1749 = -_1153;
    float _1751 = fma(_1749, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1741);
    float _1753 = _1743 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1755 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1747);
    float _1757 = fma(_1721, _1699, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1759 = 1.0 / _1753;
    float _1761 = -_1189;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1745);
    float _1765 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1767 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan(0.5);
    bool _1775 = _1771 || _1773;
    float _1777 = -_1151;
    float _1779 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1757);
    float _1781 = _1779;
    float _1783 = _1763;
    float _1785 = _1765;
    if (_1731)
    {
        _1475 = _1751;
    }
    float _1787 = _1475;
    float _1789 = _1765 + _1753;
    float _1791 = _1787;
    if (!_1731)
    {
        float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1795 = _1703 + _1793;
        float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1799 = _1707 + _1797;
        float _1801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1803 = -_1007;
        float _1805 = _1803 + _1745;
        float _1807 = _1795 * _1795;
        float _1809 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1811 = _1711 + _1809;
        float _1813 = -_1001;
        float _1815 = _1813 + _1741;
        float _1817 = -_791;
        float _1819 = _1817 + _1757;
        float _1821 = fma(_1799, _1799, _1807);
        float _1823 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1825 = fma(_1811, _1811, _1821);
        float _1827 = sqrt(_1825);
        float _1829 = 1.0 / _1301;
        float _1831 = precise::min(_1827, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1833 = _1831 * _1801;
        float _1835 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1837 = _1833 * _1829;
        float _1839 = _1835 * _1837;
        float _1841 = _1805 * _1837;
        float _1843 = fma(_1815, _1839, _1707);
        float _1845 = fma(_1819, _1839, _1703);
        float _1847 = fma(_1835, _1841, _1711);
        _1781 = _1845;
        _1791 = _1843;
        _1783 = _1847;
        _1785 = _1841;
    }
    float _1849 = _1781;
    float _1851 = _1791;
    float _1853 = _1783;
    float _1855 = _1785;
    float _1857 = _1855;
    if (_1775)
    {
        _1857 = 1.0;
    }
    float _1859 = _1857;
    float _1861 = _1789 * _1759;
    float _1863 = _1861 * 0.5;
    float _1865 = _1859;
    if (!_1775)
    {
        float _1867 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1869 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1871 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1869);
        float _1873 = _1867 * 0.15915493667125701904296875;
        float _1875 = _1873 * 6.283185482025146484375;
        float _1877 = cos(_1875);
        float _1879 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1881 = _1879 * 0.15915493667125701904296875;
        float _1883 = _1873 * 6.283185482025146484375;
        float _1885 = sin(_1883);
        float _1887 = 1.0 / _1877;
        float _1889 = _1881 * 6.283185482025146484375;
        float _1891 = cos(_1889);
        float _1893 = _1885 * _1887;
        float _1895 = 1.0 / _1871;
        float _1897 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1899 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1897;
        float _1901 = _1891 * _1893;
        float _1903 = _1881 * 6.283185482025146484375;
        float _1905 = sin(_1903);
        float _1907 = 1.0 / _1901;
        float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1911 = _1895 * _1909;
        float _1913 = 1.0 / _1899;
        float _1915 = _1905 * _1907;
        float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1919 = fma(_1915, _1911, _1917);
        float _1921 = _1919 * _1913;
        float _1923 = precise::clamp(_1921, 0.0, 1.0);
        _1865 = _1923;
    }
    float _1925 = _1865;
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1929 = _1849 + _1927;
    float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1933 = _1851 + _1931;
    float _1935 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1937 = _1853 + _1935;
    float _1939 = _1929 * _1929;
    float _1941 = fma(_1933, _1933, _1939);
    float _1943 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1945 = fma(_1937, _1937, _1941);
    float _1947 = rsqrt(_1945);
    float _1949 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1951 = _1933 * _1949;
    float _1953 = _1937 * _1949;
    float _1955 = _1951 * _1951;
    float _1957 = _1953 * _1953;
    float _1959 = _1955 + _1957;
    float _1961 = sqrt(_1959);
    bool _1963 = _1961 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1965 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1967 = _1961 + _1965;
    float _1969 = _1937;
    float _1971 = _1959;
    float _1973 = _1967;
    float _1975 = _1929;
    float _1977 = _1949;
    float _1979 = _1951;
    if (_1963)
    {
        float _1981 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1969 = _1981;
    }
    float _1983 = _1969;
    if (_1963)
    {
        float _1985 = rsqrt(_1959);
        _1971 = _1985;
    }
    float _1987 = _1971;
    if (_1963)
    {
        float _1989 = _1967 * _1983;
        _1973 = _1989;
    }
    float _1991 = _1973;
    if (_1963)
    {
        float _1993 = _1991 * 0.15915493667125701904296875;
        _1477 = _1993;
    }
    float _1995 = _1477;
    float _1997 = _1939;
    if (_1963)
    {
        float _1999 = _1995 * 6.283185482025146484375;
        float _2001 = sin(_1999);
        _1997 = _2001;
    }
    float _2003 = _1997;
    float _2005 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2007 = precise::max(0.0, _2005);
    float _2009 = _1947;
    float _2011 = _2005;
    if (_1963)
    {
        float _2013 = _1995 * 6.283185482025146484375;
        float _2015 = cos(_2013);
        _2009 = _2015;
    }
    float _2017 = _2009;
    float _2019 = -_1949;
    float _2021 = -_2007;
    float _2023 = fma(_1929, _2019, _2021);
    float _2025 = _2023;
    if (_1963)
    {
        float _2027 = _2023 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2011 = _2027;
    }
    float _2029 = _2011;
    float _2031 = _2029;
    float _2033 = _2003;
    if (_1963)
    {
        float _2035 = fma(_2003, _2029, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1975 = _2035;
    }
    float _2037 = _1975;
    float _2039 = _2037;
    float _2041 = _2017;
    if (_1963)
    {
        float _2043 = _2017 + (-1.0);
        _2031 = _2043;
    }
    float _2045 = _2031;
    float _2047 = _2045;
    if (_1963)
    {
        float _2049 = _1987 * _2037;
        _1977 = _2049;
    }
    float _2051 = _1977;
    if (!_1963)
    {
        _2039 = _1953;
    }
    float _2053 = _2039;
    float _2055 = sqrt(_1945);
    float _2057 = _2053;
    if (_1963)
    {
        float _2059 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2033 = _2059;
    }
    float _2061 = _2033;
    if (_1963)
    {
        float _2063 = _1951 * _2051;
        _1979 = _2063;
    }
    float _2065 = _1979;
    if (!_1963)
    {
        _2047 = _1955;
    }
    float _2067 = _2047;
    float _2069 = _2067;
    if (_1963)
    {
        float _2071 = _1953 * _2051;
        _2057 = _2071;
    }
    float _2073 = _2057;
    if (_1963)
    {
        float _2075 = fma(_2023, _2017, _2061);
        _2025 = _2075;
    }
    float _2077 = _2025;
    if (_1963)
    {
        float _2079 = _2065 * _2065;
        _2069 = _2079;
    }
    float _2081 = _2069;
    if (!_1963)
    {
        _2041 = _1957;
    }
    float _2083 = _2041;
    float _2085 = _2083;
    if (_1963)
    {
        float _2087 = _2073 * _2073;
        _2085 = _2087;
    }
    float _2089 = _2085;
    float _2091 = fma(_2077, _2077, _2081);
    float _2093 = _2091 + _2089;
    float _2095 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2099 = fma(_2055, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2097);
    float _2101 = precise::clamp(_2099, 0.0, 1.0);
    float _2103 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2105 = rsqrt(_2093);
    float _2107 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2095);
    float _2109 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2111 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2103);
    float _2113 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2115 = -_2101;
    float _2117 = _2115 + 1.0;
    float _2119 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2109);
    float _2121 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2111);
    float _2123 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2113);
    float _2125 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2107);
    float _2127 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2119);
    float _2129 = _2121 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2131 = abs(_2117);
    float _2133 = log2(_2131);
    float _2135 = _2125 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2137 = _2127 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2139 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2141 = _2105 * _2065;
    float _2143 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2123);
    float _2145 = _2105 * _2073;
    float _2147 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2139);
    float _2149 = _2105 * _2077;
    float _2151 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2153 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2155 = _2143 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2157 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2147);
    float _2159 = -_2151;
    float _2161 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2159);
    float _2163 = -_2153;
    float _2165 = fma(_2163, _1943, 1.0);
    float _2167 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2169 = -_2145;
    float _2171 = fma(_2169, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2161);
    float _2173 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2157);
    float _2175 = log2(_2165);
    float _2177 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2179 = fma(_2171, -0.5, 0.5);
    float _2181 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2183 = fma(_2171, 0.5, 0.5);
    float _2185 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2177);
    float _2187 = _2149 + 1.0;
    float _2189 = exp2(_2167);
    float _2191 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2181);
    float _2193 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2185);
    float _2195 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2191);
    float _2197 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2193);
    float _2199 = 1.0 / _2173;
    float _2201 = fma(_2183, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2203 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2195);
    float _2205 = _2175 * 0.693147182464599609375;
    float _2207 = fma(_2183, _2201, -0.212114393711090087890625);
    float _2209 = _2205 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2211 = sqrt(_2179);
    float _2213 = -_2149;
    float _2215 = fma(_2189, _2187, _2213);
    float _2217 = fma(_2183, _2207, 1.570728778839111328125);
    float _2219 = _2197 * _2199;
    float _2221 = _2203 * _2199;
    float _2223 = fma(_2219, 0.5, 0.5);
    float _2225 = fma(_2221, -0.5, 0.5);
    float _2227 = fma(_2215, 0.5, 0.5);
    float _2229 = _2211 * 0.636619746685028076171875;
    float3 _5704 = float3(_2223, _2225, _2209);
    float _2231 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5704, float3(0.0), isnan(_5704)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5704, float3(0.0), isnan(_5704)), level(0.0)).x;
    float3 _5715 = float3(_2223, _2225, _2209);
    float4 _2234 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5715, float3(0.0), isnan(_5715)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5715, float3(0.0), isnan(_5715)), level(0.0)).xyzw;
    float _2236 = _2234.x;
    float _2238 = _2234.y;
    float _2240 = _2234.z;
    float _2242 = _2234.w;
    float _2244 = -_2217;
    float _2246 = fma(_2229, _2244, 1.0);
    float2 _5737 = float2(_2246, _2227);
    float3 _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5737, float2(0.0), isnan(_5737)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5737, float2(0.0), isnan(_5737)), level(0.0)).xyz;
    float _2252 = _2250.x;
    float _2254 = _2250.y;
    float _2256 = _2250.z;
    float _2258 = _2133 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2260 = _2129 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2262 = _1925 > 0.0;
    bool _2264 = isnan(_1925);
    bool _2266 = _2262 || _2264;
    bool _2268 = isnan(0.0);
    bool _2270 = _2266 || _2268;
    float _2272 = _2197 + _2173;
    float _2274 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2260);
    float _2276 = exp2(_2258);
    float _2278 = _2272 * 0.5;
    float _2280 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2274);
    float _2282 = _1925 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2284 = _2173 * 0.5;
    float _2286 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2280);
    float _2288 = _2286 + _2173;
    float _2290 = fma(_2203, -0.5, _2284);
    float _2292 = _2282 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2197;
    out.gl_Position.y = _2203;
    out.gl_Position.z = _2286;
    out.gl_Position.w = _2173;
    float _2294 = _2288 * 0.5;
    float _2296 = -_2276;
    float _2298 = _2296 + 1.0;
    out.m_47.x = _2292;
    float _2300 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_72.x = _2278;
    out.m_72.y = _2290;
    out.m_72.z = _2294;
    out.m_72.w = _2173;
    float _2302 = -_2300;
    float _2304 = _2302 + 1.0;
    float _2306 = _2300 * _2231;
    float _2308 = _2242 * _2306;
    float _2310 = _2256 * _2306;
    float _2312 = fma(_2252, _2308, _2236);
    float _2314 = fma(_2254, _2308, _2238);
    float _2316 = _2242 * _2304;
    float _2318 = fma(_2242, _2310, _2240);
    out.m_74.x = _2312;
    out.m_74.y = _2314;
    out.m_74.z = _2318;
    out.m_74.w = _2316;
    if (_2270)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2320 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2320;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

