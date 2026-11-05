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
    float4 m_65 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_74 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_70 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 m_76 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_57 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_51 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1659 = false;
    bool _981 = false;
    bool _857 = false;
    bool _663 = false;
    bool _501 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2345 = as_type<float>(_111);
        out.gl_Position.z = _2345;
    }
    if (!_99)
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
    float _131 = 0.0;
    if (_125)
    {
        float _133 = float(_95);
        _131 = _133;
    }
    float _135 = _131;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    if (_141)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _105;
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _147 = _143 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2414 = as_type<float>(_149);
        out.gl_Position.z = _2414;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = in.m_49.x;
    float _153 = in.m_49.y;
    float _155 = in.m_49.z;
    float _157 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        float _183 = _129 * _129;
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
        _145 = _217;
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
        _267 = _129;
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
        float _295 = _129 * _287;
        float _297 = 1.0 / _291;
        float _299 = _293 * 0.693147182464599609375;
        float _301 = exp2(_295);
        float _303 = 1.0 / _299;
        float _305 = _301 + (-1.0);
        float _307 = -_305;
        float _309 = fma(_307, _303, _129);
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
        float _329 = _129 * _321;
        float _331 = exp2(_329);
        float _333 = -_331;
        float _335 = _333 + 1.0;
        float _337 = _335 * _327;
        _275 = _337;
    }
    float _339 = _275;
    float _341 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _343 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _347 = fma(_265, _151, _273);
    float _349 = fma(_265, _153, _341);
    float _351 = fma(_265, _155, _343);
    float _353 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _355 = fma(_339, _153, _345);
    float _357 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = in.m_51.w;
    float _361 = fma(_339, _151, _353);
    float _363 = -_355;
    float _365 = _349 + _363;
    float _367 = fma(_339, _155, _357);
    float _369 = in.m_44.x;
    float _371 = in.m_44.y;
    float _373 = in.m_44.z;
    float _375 = -_361;
    float _377 = _347 + _375;
    float _379 = _365 * _365;
    float _381 = -_367;
    float _383 = _351 + _381;
    float _385 = in.m_53.y;
    float _387 = fma(_377, _377, _379);
    float _389 = in.m_55.y;
    float _391 = fma(_383, _383, _387);
    float _393 = in.m_57.y;
    float _395 = in.m_53.x;
    float _397 = sqrt(_391);
    float _399 = in.m_55.x;
    float _401 = in.m_57.x;
    float _403 = fma(_347, _359, _369);
    float _405 = fma(_351, _359, _373);
    float _407 = in.m_53.z;
    float _409 = _365 * _385;
    float _411 = in.m_55.z;
    bool _413 = _397 >= 9.9999999747524270787835121154785e-07;
    bool _415 = isnan(_397);
    bool _417 = _413 || _415;
    bool _419 = isnan(9.9999999747524270787835121154785e-07);
    bool _421 = _417 || _419;
    float _423 = _365 * _389;
    float _425 = _385 * _385;
    float _427 = in.m_57.z;
    float _429 = _365 * _393;
    float _431 = fma(_349, _359, _371);
    float _433 = fma(_389, _389, _425);
    out.m_59.x = _403;
    float _435 = fma(_377, _395, _409);
    float _437 = fma(_393, _393, _433);
    out.m_59.z = _405;
    float _439 = fma(_377, _399, _423);
    float _441 = fma(_377, _401, _429);
    float _443 = fma(_383, _407, _435);
    float _445 = fma(_383, _411, _439);
    float _447 = fma(_383, _427, _441);
    float _449 = _383;
    float _451 = _445;
    float _453 = _445;
    float _455 = _447;
    if (_421)
    {
        _449 = _443;
    }
    float _457 = _449;
    float _459 = _457;
    float _461 = _457;
    if (!_421)
    {
        bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _465 = !_463;
        if (!_465)
        {
            float _467 = _385 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _469 = _389 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _471 = _393 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _473 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[16].x, _467);
            float _475 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[16].x, _469);
            float _477 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[16].x, _471);
            float _479 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[16].z, _473);
            float _481 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[16].z, _475);
            float _483 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[16].z, _477);
            float _485 = _479 * _479;
            float _487 = fma(_481, _481, _485);
            float _489 = fma(_483, _483, _487);
            float _491 = rsqrt(_489);
            float _493 = _491 * 9.9999999747524270787835121154785e-07;
            float _495 = _481 * _493;
            float _497 = _479 * _493;
            float _499 = _483 * _493;
            _461 = _497;
            _453 = _495;
            _455 = _499;
            _501 = true;
        }
        else
        {
            float _503 = _153 * _153;
            float _505 = fma(_151, _151, _503);
            float _507 = fma(_155, _155, _505);
            float _509 = sqrt(_507);
            bool _511 = _509 >= 9.9999999747524270787835121154785e-07;
            bool _513 = isnan(_509);
            bool _515 = _511 || _513;
            bool _517 = isnan(9.9999999747524270787835121154785e-07);
            bool _519 = _515 || _517;
            float _521 = _509;
            if (!_519)
            {
                float _523 = _371 * _371;
                float _525 = fma(_369, _369, _523);
                float _527 = fma(_373, _373, _525);
                float _529 = sqrt(_527);
                bool _531 = _529 >= 9.9999999747524270787835121154785e-07;
                bool _533 = isnan(_529);
                bool _535 = _531 || _533;
                bool _537 = isnan(9.9999999747524270787835121154785e-07);
                bool _539 = _535 || _537;
                float _541 = _437;
                if (!_539)
                {
                    float _543 = rsqrt(_437);
                    _541 = _543;
                }
                float _545 = _541;
                if (!_539)
                {
                    float _547 = _545 * 9.9999999747524270787835121154785e-07;
                    _521 = _547;
                }
                float _549 = _521;
                float _551 = _549;
                if (!_539)
                {
                    float _553 = _389 * _549;
                    _451 = _553;
                }
                float _555 = _451;
                _453 = _555;
                if (!_539)
                {
                    float _557 = _385 * _549;
                    _459 = _557;
                }
                float _559 = _459;
                _461 = _559;
                if (!_539)
                {
                    float _561 = _393 * _549;
                    _551 = _561;
                }
                float _563 = _551;
                bool _565 = !_539;
                _455 = _563;
                _501 = _565;
                if (!_501)
                {
                    float _567 = _385 * _371;
                    float _569 = _389 * _371;
                    float _571 = _393 * _371;
                    float _573 = fma(_369, _395, _567);
                    float _575 = fma(_369, _399, _569);
                    float _577 = fma(_369, _401, _571);
                    float _579 = fma(_373, _407, _573);
                    float _581 = fma(_373, _411, _575);
                    float _583 = fma(_373, _427, _577);
                    float _585 = _579 * _579;
                    float _587 = fma(_581, _581, _585);
                    float _589 = fma(_583, _583, _587);
                    float _591 = rsqrt(_589);
                    float _593 = _591 * 9.9999999747524270787835121154785e-07;
                    float _595 = _581 * _593;
                    float _597 = _579 * _593;
                    float _599 = _583 * _593;
                    _461 = _597;
                    _453 = _595;
                    _455 = _599;
                    _501 = true;
                }
            }
            else
            {
                float _601 = _385 * _153;
                float _603 = _389 * _153;
                float _605 = _393 * _153;
                float _607 = fma(_151, _395, _601);
                float _609 = fma(_151, _399, _603);
                float _611 = fma(_151, _401, _605);
                float _613 = fma(_155, _407, _607);
                float _615 = fma(_155, _411, _609);
                float _617 = fma(_155, _427, _611);
                float _619 = _613 * _613;
                float _621 = fma(_615, _615, _619);
                float _623 = fma(_617, _617, _621);
                float _625 = rsqrt(_623);
                float _627 = _625 * 9.9999999747524270787835121154785e-07;
                float _629 = _615 * _627;
                float _631 = _613 * _627;
                float _633 = _617 * _627;
                _461 = _631;
                _453 = _629;
                _455 = _633;
            }
        }
    }
    _501 = false;
    float _635 = _461;
    float _637 = _453;
    float _639 = _455;
    bool _641 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _643 = !_641;
    float _661;
    if (!_643)
    {
        float _645 = in.m_61.x;
        float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _649 = _645 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _651 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _653 = _651 * _647;
        float _655 = floor(_653);
        float _657 = -_655;
        float _659 = _653 + _657;
        _661 = _659;
        _663 = true;
    }
    else
    {
        float _665 = float(_95);
        float _667 = 1.0 / _665;
        float _669 = _129 * _667;
        _661 = _669;
    }
    _663 = false;
    float _671 = _661;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _675 = _671 + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _679 = _671 + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _683 = _671 + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _685;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _693;
    bool _697 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _699 = isnan(_671);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = 1.0 / _687;
    bool _711 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _713 = 1.0 / _695;
    float _715 = 1.0 / _691;
    float _717 = _675 * _709;
    bool _719 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _721 = isnan(_671);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -_707;
    float _733 = _731 + 1.0;
    float _735 = _729 * _733;
    float _737 = _679 * _713;
    bool _739 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _741 = isnan(_671);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    float _751 = -_729;
    float _753 = _751 + 1.0;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _759 = _749 * _753;
    float _761 = -_749;
    float _763 = _761 + 1.0;
    float _765 = _683 * _715;
    bool _767 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _769 = isnan(_671);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _791 = fma(_781, _717, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _793 = _777 * _763;
    float _795 = fma(_785, _717, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _797 = -_777;
    float _799 = _797 + 1.0;
    float _801 = _791 * _793;
    float _803 = _795 * _793;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _805;
    float _809 = fma(_757, _765, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _811 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[143].x, _801);
    float _813 = fma(_789, _765, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _815;
    float _819 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[143].y, _803);
    float _821 = fma(_807, _737, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _823 = fma(_809, _759, _811);
    float _825 = fma(_817, _737, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _827 = fma(_813, _759, _819);
    float _829 = fma(_821, _735, _823);
    float _831 = fma(_825, _735, _827);
    float _833 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[146].x, _829);
    float _835 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[146].y, _831);
    bool _837 = !_711;
    float _855;
    if (!_837)
    {
        float _839 = in.m_61.x;
        float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _843 = _839 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _847 = _845 * _841;
        float _849 = floor(_847);
        float _851 = -_849;
        float _853 = _847 + _851;
        _855 = _853;
        _857 = true;
    }
    else
    {
        float _859 = float(_95);
        float _861 = 1.0 / _859;
        float _863 = _129 * _861;
        _855 = _863;
    }
    _857 = false;
    float _865 = _855;
    float _867 = in.m_51.x;
    float _869 = in.m_51.y;
    bool _871 = _865 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _873 = isnan(_865);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _887 = _865 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _889 = isnan(_865);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _899;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _905 = _865 + _903;
    float _907 = -_881;
    float _909 = _907 + 1.0;
    float _911 = 1.0 / _885;
    float _913 = _897 * _909;
    float _915 = -_897;
    float _917 = _915 + 1.0;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _921 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _923 = _919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _925 = _835 * _869;
    float _927 = _833 * _867;
    float _929 = _901 * _911;
    float _931 = fma(_929, _905, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _933 = _931 * _913;
    float _935 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[115].x, _933);
    float _937 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[116].x, _935);
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _949 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _951 = _941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _953 = _943 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _955 = _945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _957 = _947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _959 = _937 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _953;
    out.m_63.y = _955;
    out.m_63.z = _957;
    out.m_65.x = _949;
    out.m_65.y = _951;
    out.m_65.z = _923;
    out.m_65.w = _959;
    bool _961 = !_921;
    float _979;
    if (!_961)
    {
        float _963 = in.m_61.x;
        float _965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _967 = _963 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[14].x, _129);
        float _971 = _969 * _965;
        float _973 = floor(_971);
        float _975 = -_973;
        float _977 = _971 + _975;
        _979 = _977;
        _981 = true;
    }
    else
    {
        float _983 = float(_95);
        float _985 = 1.0 / _983;
        float _987 = _129 * _985;
        _979 = _987;
    }
    _981 = false;
    float _989 = _979;
    float _991 = _635 * _635;
    float _993 = in.m_61.x;
    float _995 = in.m_61.y;
    float _997 = _431 * _385;
    float _999 = _431 * _393;
    float _1001 = fma(_637, _637, _991);
    float _1003 = as_type<float>(int(gl_VertexIndex));
    float _1005 = _431 * _389;
    float _1007 = fma(_403, _395, _997);
    float _1009 = fma(_639, _639, _1001);
    float _1011 = fma(_403, _399, _1005);
    float _1013 = fma(_403, _401, _999);
    float _1015 = rsqrt(_1009);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1021 = fma(_405, _411, _1011);
    float _1023 = _927 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1027 = _1025 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1029 = _925 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1031 = _1021 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1033 = 1.0 / _1019;
    bool _1035 = _993 > 0.5;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1039 = _1037 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1041 = _995 > 0.5;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1047 = _1015 * _639;
    int _1049 = as_type<int>(_1003) & 1;
    bool _1051 = _1049 != 0;
    int _1053 = as_type<int>(_1003) & 2;
    bool _1055 = _1053 != 0;
    float _1057 = _1015 * _635;
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1061 = _1047 * _1059;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1065 = _1063 != 0;
    float _1067 = 1.0 / _1027;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1071 = _1069 != 0;
    float _1073 = _1015 * _637;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1081 = _1057 * _1079;
    float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1085 = -_1061;
    float _1087 = fma(_1073, _1083, _1085);
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1091 = _1073 * _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1095 = -_1081;
    float _1097 = fma(_1047, _1093, _1095);
    float _1099 = 1.0 / _1077;
    float _1101 = _1087 * _1087;
    float _1103 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1105 = -_1091;
    float _1107 = fma(_1057, _1103, _1105);
    float _1109 = fma(_405, _407, _1007);
    float _1111 = fma(_405, _427, _1013);
    float _1113 = fma(_1097, _1097, _1101);
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1115;
    float _1119 = _1111 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1121;
    float _1125 = fma(_1107, _1107, _1113);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1131 = _1117 * _1067;
    float _1133 = _1123 * _1033;
    float _1135 = rsqrt(_1125);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1139 = _989 + _1137;
    float _1141 = _1129 * _1099;
    bool _1143 = !_1051;
    float _1145 = _1143 ? (-0.5) : 0.5;
    float _1147 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1149 = fma(_1133, _1139, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1151 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1153 = isnan(_989);
    bool _1155 = _1151 || _1153;
    bool _1157 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1159 = _1155 || _1157;
    float _1161 = float(_1159);
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1165 = _1163 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1167 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1145);
    bool _1169 = !_1055;
    float _1171 = _1169 ? (-0.5) : 0.5;
    float _1173 = 1.0 / _1039;
    float _1175 = -_1161;
    float _1177 = _1175 + 1.0;
    float _1179 = _1023 * _1167;
    bool _1181 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1183 = isnan(_989);
    bool _1185 = _1181 || _1183;
    bool _1187 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1189 = _1185 || _1187;
    float _1191 = float(_1189);
    float _1193 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1171);
    bool _1195 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1197 = isnan(_989);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1203 = _1199 || _1201;
    float _1205 = float(_1203);
    float _1207 = _1087 * _1135;
    float _1209 = _1097 * _1135;
    float _1211 = _1107 * _1135;
    bool _1213 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1215 = isnan(_989);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1221 = _1217 || _1219;
    float _1223 = float(_1221);
    float _1225 = -_1191;
    float _1227 = _1225 + 1.0;
    float _1229 = _1191 * _1177;
    bool _1231 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1233 = isnan(_989);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1239 = _1235 || _1237;
    float _1241 = float(_1239);
    float _1243 = _1029 * _1193;
    float _1245 = _1223 * _1227;
    float _1247 = -_1223;
    float _1249 = _1247 + 1.0;
    float _1251 = _1073 * _1207;
    float _1253 = -_1241;
    float _1255 = _1253 + 1.0;
    float _1257 = _1243 * _1047;
    float _1259 = _1241 * _1249;
    float _1261 = _1243 * _1073;
    float _1263 = _1057 * _1211;
    float _1265 = fma(_1179, _1211, _1257);
    bool _1267 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1269 = isnan(_989);
    bool _1271 = _1267 || _1269;
    bool _1273 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1275 = _1271 || _1273;
    float _1277 = float(_1275);
    float _1279 = fma(_1179, _1209, _1261);
    float _1281 = -_1263;
    float _1283 = fma(_1047, _1207, _1281);
    float _1285 = -_1251;
    float _1287 = fma(_1057, _1209, _1285);
    bool _1289 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1291 = isnan(_989);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1297 = _1293 || _1295;
    float _1299 = float(_1297);
    float _1301 = _1205 * _1255;
    float _1303 = fma(_1147, _1283, _1279);
    float _1305 = fma(_1147, _1287, _1265);
    float _1307 = -_1205;
    float _1309 = _1307 + 1.0;
    bool _1311 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1313 = isnan(_989);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1319 = _1315 || _1317;
    float _1321 = float(_1319);
    float _1323 = _1031 + _1303;
    float _1325 = _1119 + _1305;
    float _1327 = -_1277;
    float _1329 = _1327 + 1.0;
    float _1331 = 1.0 / _1045;
    float _1333 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1335 = _1323 + _1333;
    float _1337 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1339 = _1325 + _1337;
    float _1341 = _1299 * _1309;
    float _1343 = -_1299;
    float _1345 = _1343 + 1.0;
    float _1347 = _1335 * _1335;
    float _1349 = _1339 * _1339;
    float _1351 = 1.0 / _1165;
    float _1353 = _1321 * _1329;
    float _1355 = _1277 * _1345;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1361;
    float _1365 = _1149 * _1353;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1371 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1373 = _989 + _1371;
    float _1375 = -_1321;
    float _1377 = _1375 + 1.0;
    float _1379 = _1347 + _1349;
    float _1381 = _1369 * _1173;
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1385 = _989 + _1383;
    float _1387 = sqrt(_1379);
    float _1389 = fma(_1141, _1373, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1391 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1365);
    float _1393 = _1359 * _1331;
    float _1395 = _1243 * _1057;
    float _1397 = _1363 * _1351;
    float _1399 = fma(_1131, _1385, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1403 = _1401 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1405 = fma(_1389, _1355, _1391);
    float _1407 = _1047 * _1209;
    float _1409 = fma(_1179, _1207, _1395);
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1413 = _989 + _1411;
    float _1415 = fma(_1399, _1341, _1405);
    float _1417 = -_1407;
    float _1419 = fma(_1073, _1211, _1417);
    float _1421 = 1.0 / _1403;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1425 = _989 + _1423;
    bool _1427 = _1387 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1429 = fma(_1147, _1419, _1409);
    float _1431 = fma(_1393, _1413, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1433 = _1109 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1435 = fma(_1397, _1425, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1439 = fma(_1431, _1301, _1415);
    float _1441 = _1433 + _1429;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1443;
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1449 = _989 + _1447;
    float _1451 = _1301;
    float _1453 = _1347;
    float _1455 = _1349;
    float _1457 = _1323;
    float _1459 = _1325;
    float _1461 = _1057;
    float _1463 = _1209;
    float _1465 = _1211;
    if (!_1427)
    {
        _1451 = _1441;
    }
    float _1467 = _1451;
    float _1469 = _1445 * _1421;
    float _1471 = fma(_1381, _1449, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1473 = !_1427;
    float _1475 = _1467;
    if (!_1473)
    {
        float _1477 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1481 = _1387 + _1479;
        float _1483 = rsqrt(_1379);
        float _1485 = _1481 * _1477;
        float _1487 = _1441 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1489 = _1485 * 0.15915493667125701904296875;
        float _1491 = _1489 * 6.283185482025146484375;
        float _1493 = sin(_1491);
        float _1495 = _1489 * 6.283185482025146484375;
        float _1497 = cos(_1495);
        float _1499 = fma(_1493, _1487, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1501 = _1483 * _1499;
        float _1503 = fma(_1335, _1501, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1505 = _1497 + (-1.0);
        float _1507 = fma(_1339, _1501, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1511 = _1503 + _1509;
        float _1513 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1517 = _1507 + _1515;
        float _1519 = _1511 * _1511;
        float _1521 = fma(_1441, _1497, _1513);
        float _1523 = _1517 * _1517;
        _1475 = _1521;
        _1453 = _1519;
        _1455 = _1523;
        _1457 = _1503;
        _1459 = _1507;
    }
    float _1525 = _1475;
    float _1527 = _1453;
    float _1529 = _1455;
    float _1531 = _1457;
    float _1533 = _1459;
    float _1535 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1537 = _1525 + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1541 = _989 + _1539;
    float _1543 = -_1145;
    int _1545 = _1035 ? as_type<int>(_1543) : as_type<int>(_1145);
    float _1547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1549 = -_1171;
    int _1551 = _1041 ? as_type<int>(_1549) : as_type<int>(_1171);
    float _1553 = fma(_1537, _1537, _1527);
    bool _1555 = !_1065;
    float _1557 = _1555 ? _1145 : as_type<float>(_1545);
    float _1559 = fma(_1435, _1259, _1439);
    bool _1561 = !_1071;
    float _1563 = _1561 ? _1171 : as_type<float>(_1551);
    float _1565 = _1553 + _1529;
    float _1567 = fma(_1469, _1541, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1569 = _1557 + 0.5;
    float _1571 = fma(_1471, _1245, _1559);
    float _1573 = -_1563;
    float _1575 = _1573 + 0.5;
    float _1577 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1579 = sqrt(_1565);
    float _1581 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1583 = _1575 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1585 = fma(_1567, _1229, _1571);
    float _1587 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1589 = _1581 * _1437;
    float _1591 = _1583 * _1547;
    float _1593 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1585);
    float _1595 = _1073 * _1577;
    float _1597 = _1057 * _1577;
    float _1599 = _1047 * _1577;
    out.m_70.x = _1589;
    out.m_70.y = _1591;
    float _1601 = fma(_1209, _1587, _1595);
    float _1603 = fma(_1207, _1587, _1597);
    float _1605 = fma(_1211, _1587, _1599);
    out.m_72.x = _1593;
    bool _1607 = _1579 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1609 = isnan(_1579);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1615 = _1611 || _1613;
    float _1617 = _1419 + _1603;
    float _1619 = _1283 + _1601;
    float _1621 = _1287 + _1605;
    float _1623 = _1603;
    if (!_1615)
    {
        _1623 = 1.0;
    }
    float _1625 = _1623;
    bool _1627 = !_1615;
    float _1629 = _1625;
    if (!_1627)
    {
        bool _1631 = _1579 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1633 = isnan(_1579);
        bool _1635 = _1631 || _1633;
        bool _1637 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1639 = _1635 || _1637;
        if (!_1639)
        {
            float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1643 = _1579 + _1641;
            float _1645 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1647 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1645;
            float _1649 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1651 = _1649 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1653 = 1.0 / _1647;
            float _1655 = _1643 * _1653;
            float _1657 = fma(_1655, _1651, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1629 = _1657;
            _1461 = _1653;
            _1659 = true;
        }
        else
        {
            bool _1661 = _1579 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1663 = isnan(_1579);
            bool _1665 = _1661 || _1663;
            bool _1667 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1669 = _1665 || _1667;
            if (!_1669)
            {
                float _1671 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1673 = _1579 + _1671;
                float _1675 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1677 = _1675 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1679 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1681 = _1679 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1683 = 1.0 / _1677;
                float _1685 = _1673 * _1683;
                float _1687 = fma(_1685, _1681, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1629 = _1687;
                _1461 = _1683;
                _1659 = true;
            }
            else
            {
                _1629 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1659 = false;
    float _1689 = _1629;
    float _1691 = _1461;
    float _1693 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1695 = _1531 + _1693;
    float _1697 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1699 = _1525 + _1697;
    float _1701 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1703 = _1533 + _1701;
    bool _1705 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1707 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan(0.5);
    bool _1713 = _1709 || _1711;
    float _1715 = fma(_1695, _1689, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1717 = fma(_1699, _1689, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1719 = fma(_1703, _1689, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1721 = _1699;
    float _1723 = _1691;
    float _1725 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1727 = _1695;
    if (_1713)
    {
        _1721 = _1715;
    }
    float _1729 = _1721;
    float _1731 = _1729;
    if (_1713)
    {
        _1723 = _1717;
    }
    float _1733 = _1723;
    float _1735 = _1733;
    if (_1713)
    {
        _1725 = _1719;
    }
    float _1737 = _1725;
    float _1739 = _1737;
    if (!_1713)
    {
        float _1741 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1743 = _1433 + _1741;
        float _1745 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1747 = _1031 + _1745;
        float _1749 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1751 = _1743 * _1743;
        float _1753 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1755 = _1119 + _1753;
        float _1757 = fma(_1747, _1747, _1751);
        float _1759 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1761 = fma(_1755, _1755, _1757);
        float _1763 = sqrt(_1761);
        float _1765 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1767 = -_1433;
        float _1769 = _1767 + _1717;
        float _1771 = precise::min(_1763, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1773 = _1771 * _1759;
        float _1775 = -_1031;
        float _1777 = _1775 + _1715;
        float _1779 = -_1119;
        float _1781 = _1779 + _1719;
        float _1783 = _1765 * _1773;
        float _1785 = fma(_1777, _1783, _1031);
        float _1787 = fma(_1769, _1783, _1433);
        float _1789 = fma(_1781, _1783, _1119);
        _1735 = _1787;
        _1731 = _1785;
        _1739 = _1789;
    }
    float _1791 = _1735;
    float _1793 = _1731;
    float _1795 = _1739;
    float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1799 = _1791 + _1797;
    float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1803 = _1793 + _1801;
    float _1805 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1807 = _1795 + _1805;
    float _1809 = _1799 * _1799;
    float _1811 = fma(_1803, _1803, _1809);
    float _1813 = fma(_1807, _1807, _1811);
    float _1815 = rsqrt(_1813);
    float _1817 = _1803 * _1815;
    float _1819 = _1807 * _1815;
    float _1821 = _1799 * _1815;
    float _1823 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1825 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1827 = _1823 * _1823;
    float _1829 = _1825 * _1825;
    float _1831 = _1827 + _1829;
    float _1833 = sqrt(_1831);
    bool _1835 = _1833 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1837 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1839 = _1833 + _1837;
    float _1841 = _1717;
    float _1843 = _1839;
    float _1845 = _1823;
    if (_1835)
    {
        float _1847 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1841 = _1847;
    }
    float _1849 = _1841;
    if (_1835)
    {
        float _1851 = rsqrt(_1831);
        _1463 = _1851;
    }
    float _1853 = _1463;
    float _1855 = _1853;
    if (_1835)
    {
        float _1857 = _1839 * _1849;
        _1843 = _1857;
    }
    float _1859 = _1843;
    if (_1835)
    {
        float _1861 = _1859 * 0.15915493667125701904296875;
        _1465 = _1861;
    }
    float _1863 = _1465;
    float _1865 = _1715;
    if (_1835)
    {
        float _1867 = _1863 * 6.283185482025146484375;
        float _1869 = sin(_1867);
        _1865 = _1869;
    }
    float _1871 = _1865;
    float _1873 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1875 = precise::max(0.0, _1873);
    float _1877 = _1849;
    float _1879 = _1875;
    float _1881 = _1873;
    if (_1835)
    {
        float _1883 = _1863 * 6.283185482025146484375;
        float _1885 = cos(_1883);
        _1877 = _1885;
    }
    float _1887 = _1877;
    float _1889 = -_1821;
    float _1891 = -_1875;
    float _1893 = fma(_1889, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1891);
    if (_1835)
    {
        float _1895 = _1893 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1879 = _1895;
    }
    float _1897 = _1879;
    float _1899 = sqrt(_1813);
    float _1901 = _1897;
    float _1903 = _1871;
    if (_1835)
    {
        float _1905 = fma(_1871, _1897, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1901 = _1905;
    }
    float _1907 = _1901;
    float _1909 = _1907;
    if (!_1835)
    {
        _1903 = _1825;
    }
    float _1911 = _1903;
    float _1913 = _1911;
    float _1915 = _1887;
    if (_1835)
    {
        float _1917 = _1887 + (-1.0);
        _1881 = _1917;
    }
    float _1919 = _1881;
    float _1921 = _1919;
    if (_1835)
    {
        float _1923 = _1853 * _1907;
        _1727 = _1923;
    }
    float _1925 = _1727;
    if (!_1835)
    {
        _1909 = _1893;
    }
    float _1927 = _1909;
    float _1929 = _1927;
    if (_1835)
    {
        float _1931 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1855 = _1931;
    }
    float _1933 = _1855;
    if (_1835)
    {
        float _1935 = _1823 * _1925;
        _1845 = _1935;
    }
    float _1937 = _1845;
    if (!_1835)
    {
        _1921 = _1827;
    }
    float _1939 = _1921;
    float _1941 = _1939;
    if (_1835)
    {
        float _1943 = _1825 * _1925;
        _1913 = _1943;
    }
    float _1945 = _1913;
    if (_1835)
    {
        float _1947 = fma(_1893, _1887, _1933);
        _1929 = _1947;
    }
    float _1949 = _1929;
    if (_1835)
    {
        float _1951 = _1937 * _1937;
        _1941 = _1951;
    }
    float _1953 = _1941;
    if (!_1835)
    {
        _1915 = _1829;
    }
    float _1955 = _1915;
    float _1957 = _1955;
    if (_1835)
    {
        float _1959 = _1945 * _1945;
        _1957 = _1959;
    }
    float _1961 = _1957;
    float _1963 = fma(_1949, _1949, _1953);
    float _1965 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1967 = _1963 + _1961;
    float _1969 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1973 = fma(_1899, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1971);
    float _1975 = precise::clamp(_1973, 0.0, 1.0);
    float _1977 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1979 = rsqrt(_1967);
    float _1981 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1969);
    float _1983 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1985 = -_1975;
    float _1987 = _1985 + 1.0;
    float _1989 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1991 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1981);
    float _1993 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1983);
    float _1995 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1989);
    float _1997 = _1991 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1999 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1993);
    float _2001 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1965);
    float _2003 = abs(_1987);
    float _2005 = log2(_2003);
    float _2007 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1995);
    float _2009 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2011 = _1999 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2013 = _1979 * _1937;
    float _2015 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2001);
    float _2017 = _1979 * _1949;
    float _2019 = _2007 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2021 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2023 = -_2009;
    float _2025 = fma(_2023, _1977, 1.0);
    float _2027 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2029 = _2015 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2031 = _1979 * _1945;
    float _2033 = -_2021;
    float _2035 = fma(_2017, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2033);
    float _2037 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2027);
    float _2039 = log2(_2025);
    float _2041 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2043 = -_2031;
    float _2045 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2035);
    float _2047 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2037);
    float _2049 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2051 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2053 = fma(_2045, -0.5, 0.5);
    float _2055 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2047);
    float _2057 = exp2(_2041);
    float _2059 = fma(_2045, 0.5, 0.5);
    float _2061 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2049);
    float _2063 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2051);
    float _2065 = _2017 + 1.0;
    float _2067 = fma(_2059, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2069 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2061);
    float _2071 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2063);
    float _2073 = 1.0 / _2055;
    float _2075 = fma(_2059, _2067, -0.212114393711090087890625);
    float _2077 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2069);
    float _2079 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2071);
    float _2081 = _2039 * 0.693147182464599609375;
    float _2083 = fma(_2059, _2075, 1.570728778839111328125);
    float _2085 = sqrt(_2053);
    float _2087 = -_2017;
    float _2089 = fma(_2057, _2065, _2087);
    float _2091 = _2077 * _2073;
    float _2093 = _2079 * _2073;
    float _2095 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2097 = fma(_2089, 0.5, 0.5);
    float _2099 = fma(_2091, 0.5, 0.5);
    float _2101 = fma(_2093, -0.5, 0.5);
    float _2103 = _2085 * 0.636619746685028076171875;
    float _2105 = -_2083;
    float _2107 = fma(_2103, _2105, 1.0);
    float3 _5539 = float3(_2099, _2101, _2095);
    float _2109 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5539, float3(0.0), isnan(_5539)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5539, float3(0.0), isnan(_5539)), level(0.0)).x;
    float3 _5550 = float3(_2099, _2101, _2095);
    float4 _2112 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5550, float3(0.0), isnan(_5550)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5550, float3(0.0), isnan(_5550)), level(0.0)).xyzw;
    float _2114 = _2112.x;
    float _2116 = _2112.y;
    float _2118 = _2112.z;
    float _2120 = _2112.w;
    float2 _5567 = float2(_2107, _2097);
    float3 _2124 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5567, float2(0.0), isnan(_5567)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5567, float2(0.0), isnan(_5567)), level(0.0)).xyz;
    float _2126 = _2124.x;
    float _2128 = _2124.y;
    float _2130 = _2124.z;
    float _2132 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2134 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2136 = _1617 * _1821;
    float _2138 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2132);
    float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2142 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _2140;
    float _2144 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2134);
    float _2146 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2138);
    float _2148 = fma(_1619, _1817, _2136);
    float _2150 = 1.0 / _2142;
    float _2152 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2154 = _2146 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2156 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2158 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2160 = _2156 || _2158;
    bool _2162 = isnan(0.5);
    bool _2164 = _2160 || _2162;
    float _2166 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2144);
    float _2168 = fma(_1621, _1819, _2148);
    float _2170 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2172 = 1.0 / _2154;
    float _2174 = abs(_2168);
    float _2176 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2178 = _2174 + _2176;
    float _2180 = _2166 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2182 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2170);
    float _2184 = _2180 + _2154;
    float _2186 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2182);
    float _2188 = exp2(_2152);
    float _2190 = _2178 * _2150;
    float _2192 = precise::clamp(_2190, 0.0, 1.0);
    float _2194 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2186);
    float _2196 = fma(_2192, -2.0, 3.0);
    float _2198 = _2192 * _2192;
    float _2200 = _2192;
    if (_2164)
    {
        _2200 = 1.0;
    }
    float _2202 = _2200;
    float _2204 = _2184 * _2172;
    float _2206 = _2204 * 0.5;
    float _2208 = _2202;
    if (!_2164)
    {
        float _2210 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2212 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2210);
        float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2216 = _2214 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _2218 = 1.0 / _2212;
        float _2220 = 1.0 / _2216;
        float _2222 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2224 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2226 = fma(_2218, _2222, _2224);
        float _2228 = _2226 * _2220;
        float _2230 = precise::clamp(_2228, 0.0, 1.0);
        _2208 = _2230;
    }
    float _2232 = _2208;
    float _2234 = _2055 * 0.5;
    float _2236 = -_2188;
    float _2238 = _2236 + 1.0;
    float _2240 = _2198 * _2196;
    bool _2242 = _2232 > 0.0;
    bool _2244 = isnan(_2232);
    bool _2246 = _2242 || _2244;
    bool _2248 = isnan(0.0);
    bool _2250 = _2246 || _2248;
    float _2252 = fma(_2079, -0.5, _2234);
    float _2254 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2256 = _2240 * _2232;
    float _2258 = _2194 + _2055;
    float _2260 = _2077 + _2055;
    float _2262 = _2254 * _2109;
    float _2264 = -_2254;
    float _2266 = _2264 + 1.0;
    float _2268 = _2256 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _2077;
    out.gl_Position.y = _2079;
    out.gl_Position.z = _2194;
    out.gl_Position.w = _2055;
    float _2270 = _2120 * _2262;
    float _2272 = _2130 * _2262;
    float _2274 = _2120 * _2266;
    float _2276 = fma(_2126, _2270, _2114);
    float _2278 = _2258 * 0.5;
    float _2280 = _2260 * 0.5;
    float _2282 = _2268 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2284 = fma(_2128, _2270, _2116);
    float _2286 = fma(_2120, _2272, _2118);
    out.m_74.x = _2280;
    out.m_74.y = _2252;
    out.m_74.z = _2278;
    out.m_74.w = _2055;
    out.m_47.x = _2282;
    out.m_76.x = _2276;
    out.m_76.y = _2284;
    out.m_76.z = _2286;
    out.m_76.w = _2274;
    if (_2250)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2288 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2288;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1659 = false;
    bool _981 = false;
    bool _857 = false;
    bool _663 = false;
    bool _501 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2345 = as_type<float>(_111);
        out.gl_Position.z = _2345;
    }
    if (!_99)
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
    float _131 = 0.0;
    if (_125)
    {
        float _133 = float(_95);
        _131 = _133;
    }
    float _135 = _131;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    if (_141)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _105;
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _147 = _143 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2414 = as_type<float>(_149);
        out.gl_Position.z = _2414;
    }
    if (_141)
    {
        return out;
    }
    float _151 = in.m_49.x;
    float _153 = in.m_49.y;
    float _155 = in.m_49.z;
    float _157 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        float _183 = _129 * _129;
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
        _145 = _217;
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
        _267 = _129;
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
        float _295 = _129 * _287;
        float _297 = 1.0 / _291;
        float _299 = _293 * 0.693147182464599609375;
        float _301 = exp2(_295);
        float _303 = 1.0 / _299;
        float _305 = _301 + (-1.0);
        float _307 = -_305;
        float _309 = fma(_307, _303, _129);
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
        float _329 = _129 * _321;
        float _331 = exp2(_329);
        float _333 = -_331;
        float _335 = _333 + 1.0;
        float _337 = _335 * _327;
        _275 = _337;
    }
    float _339 = _275;
    float _341 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _343 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _347 = fma(_265, _151, _273);
    float _349 = fma(_265, _153, _341);
    float _351 = fma(_265, _155, _343);
    float _353 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _355 = fma(_339, _153, _345);
    float _357 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = in.m_51.w;
    float _361 = fma(_339, _151, _353);
    float _363 = -_355;
    float _365 = _349 + _363;
    float _367 = fma(_339, _155, _357);
    float _369 = in.m_44.x;
    float _371 = in.m_44.y;
    float _373 = in.m_44.z;
    float _375 = -_361;
    float _377 = _347 + _375;
    float _379 = _365 * _365;
    float _381 = -_367;
    float _383 = _351 + _381;
    float _385 = in.m_53.y;
    float _387 = fma(_377, _377, _379);
    float _389 = in.m_55.y;
    float _391 = fma(_383, _383, _387);
    float _393 = in.m_57.y;
    float _395 = in.m_53.x;
    float _397 = sqrt(_391);
    float _399 = in.m_55.x;
    float _401 = in.m_57.x;
    float _403 = fma(_347, _359, _369);
    float _405 = fma(_351, _359, _373);
    float _407 = in.m_53.z;
    float _409 = _365 * _385;
    float _411 = in.m_55.z;
    bool _413 = _397 >= 9.9999999747524270787835121154785e-07;
    bool _415 = isnan(_397);
    bool _417 = _413 || _415;
    bool _419 = isnan(9.9999999747524270787835121154785e-07);
    bool _421 = _417 || _419;
    float _423 = _365 * _389;
    float _425 = _385 * _385;
    float _427 = in.m_57.z;
    float _429 = _365 * _393;
    float _431 = fma(_349, _359, _371);
    float _433 = fma(_389, _389, _425);
    out.m_59.x = _403;
    float _435 = fma(_377, _395, _409);
    float _437 = fma(_393, _393, _433);
    out.m_59.z = _405;
    float _439 = fma(_377, _399, _423);
    float _441 = fma(_377, _401, _429);
    float _443 = fma(_383, _407, _435);
    float _445 = fma(_383, _411, _439);
    float _447 = fma(_383, _427, _441);
    float _449 = _383;
    float _451 = _445;
    float _453 = _445;
    float _455 = _447;
    if (_421)
    {
        _449 = _443;
    }
    float _457 = _449;
    float _459 = _457;
    float _461 = _457;
    if (!_421)
    {
        bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _465 = !_463;
        if (!_465)
        {
            float _467 = _385 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _469 = _389 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _471 = _393 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _473 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[16].x, _467);
            float _475 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[16].x, _469);
            float _477 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[16].x, _471);
            float _479 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[16].z, _473);
            float _481 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[16].z, _475);
            float _483 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[16].z, _477);
            float _485 = _479 * _479;
            float _487 = fma(_481, _481, _485);
            float _489 = fma(_483, _483, _487);
            float _491 = rsqrt(_489);
            float _493 = _491 * 9.9999999747524270787835121154785e-07;
            float _495 = _481 * _493;
            float _497 = _479 * _493;
            float _499 = _483 * _493;
            _461 = _497;
            _453 = _495;
            _455 = _499;
            _501 = true;
        }
        else
        {
            float _503 = _153 * _153;
            float _505 = fma(_151, _151, _503);
            float _507 = fma(_155, _155, _505);
            float _509 = sqrt(_507);
            bool _511 = _509 >= 9.9999999747524270787835121154785e-07;
            bool _513 = isnan(_509);
            bool _515 = _511 || _513;
            bool _517 = isnan(9.9999999747524270787835121154785e-07);
            bool _519 = _515 || _517;
            float _521 = _509;
            if (!_519)
            {
                float _523 = _371 * _371;
                float _525 = fma(_369, _369, _523);
                float _527 = fma(_373, _373, _525);
                float _529 = sqrt(_527);
                bool _531 = _529 >= 9.9999999747524270787835121154785e-07;
                bool _533 = isnan(_529);
                bool _535 = _531 || _533;
                bool _537 = isnan(9.9999999747524270787835121154785e-07);
                bool _539 = _535 || _537;
                float _541 = _437;
                if (!_539)
                {
                    float _543 = rsqrt(_437);
                    _541 = _543;
                }
                float _545 = _541;
                if (!_539)
                {
                    float _547 = _545 * 9.9999999747524270787835121154785e-07;
                    _521 = _547;
                }
                float _549 = _521;
                float _551 = _549;
                if (!_539)
                {
                    float _553 = _389 * _549;
                    _451 = _553;
                }
                float _555 = _451;
                _453 = _555;
                if (!_539)
                {
                    float _557 = _385 * _549;
                    _459 = _557;
                }
                float _559 = _459;
                _461 = _559;
                if (!_539)
                {
                    float _561 = _393 * _549;
                    _551 = _561;
                }
                float _563 = _551;
                bool _565 = !_539;
                _455 = _563;
                _501 = _565;
                if (!_501)
                {
                    float _567 = _385 * _371;
                    float _569 = _389 * _371;
                    float _571 = _393 * _371;
                    float _573 = fma(_369, _395, _567);
                    float _575 = fma(_369, _399, _569);
                    float _577 = fma(_369, _401, _571);
                    float _579 = fma(_373, _407, _573);
                    float _581 = fma(_373, _411, _575);
                    float _583 = fma(_373, _427, _577);
                    float _585 = _579 * _579;
                    float _587 = fma(_581, _581, _585);
                    float _589 = fma(_583, _583, _587);
                    float _591 = rsqrt(_589);
                    float _593 = _591 * 9.9999999747524270787835121154785e-07;
                    float _595 = _581 * _593;
                    float _597 = _579 * _593;
                    float _599 = _583 * _593;
                    _461 = _597;
                    _453 = _595;
                    _455 = _599;
                    _501 = true;
                }
            }
            else
            {
                float _601 = _385 * _153;
                float _603 = _389 * _153;
                float _605 = _393 * _153;
                float _607 = fma(_151, _395, _601);
                float _609 = fma(_151, _399, _603);
                float _611 = fma(_151, _401, _605);
                float _613 = fma(_155, _407, _607);
                float _615 = fma(_155, _411, _609);
                float _617 = fma(_155, _427, _611);
                float _619 = _613 * _613;
                float _621 = fma(_615, _615, _619);
                float _623 = fma(_617, _617, _621);
                float _625 = rsqrt(_623);
                float _627 = _625 * 9.9999999747524270787835121154785e-07;
                float _629 = _615 * _627;
                float _631 = _613 * _627;
                float _633 = _617 * _627;
                _461 = _631;
                _453 = _629;
                _455 = _633;
            }
        }
    }
    _501 = false;
    float _635 = _461;
    float _637 = _453;
    float _639 = _455;
    bool _641 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _643 = !_641;
    float _661;
    if (!_643)
    {
        float _645 = in.m_61.x;
        float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _649 = _645 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _651 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _653 = _651 * _647;
        float _655 = floor(_653);
        float _657 = -_655;
        float _659 = _653 + _657;
        _661 = _659;
        _663 = true;
    }
    else
    {
        float _665 = float(_95);
        float _667 = 1.0 / _665;
        float _669 = _129 * _667;
        _661 = _669;
    }
    _663 = false;
    float _671 = _661;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _675 = _671 + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _679 = _671 + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _683 = _671 + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _685;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _693;
    bool _697 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _699 = isnan(_671);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = 1.0 / _687;
    bool _711 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _713 = 1.0 / _695;
    float _715 = 1.0 / _691;
    float _717 = _675 * _709;
    bool _719 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _721 = isnan(_671);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -_707;
    float _733 = _731 + 1.0;
    float _735 = _729 * _733;
    float _737 = _679 * _713;
    bool _739 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _741 = isnan(_671);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    float _751 = -_729;
    float _753 = _751 + 1.0;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _759 = _749 * _753;
    float _761 = -_749;
    float _763 = _761 + 1.0;
    float _765 = _683 * _715;
    bool _767 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _769 = isnan(_671);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _791 = fma(_781, _717, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _793 = _777 * _763;
    float _795 = fma(_785, _717, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _797 = -_777;
    float _799 = _797 + 1.0;
    float _801 = _791 * _793;
    float _803 = _795 * _793;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _805;
    float _809 = fma(_757, _765, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _811 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[143].x, _801);
    float _813 = fma(_789, _765, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _815;
    float _819 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[143].y, _803);
    float _821 = fma(_807, _737, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _823 = fma(_809, _759, _811);
    float _825 = fma(_817, _737, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _827 = fma(_813, _759, _819);
    float _829 = fma(_821, _735, _823);
    float _831 = fma(_825, _735, _827);
    float _833 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[146].x, _829);
    float _835 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[146].y, _831);
    bool _837 = !_711;
    float _855;
    if (!_837)
    {
        float _839 = in.m_61.x;
        float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _843 = _839 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _847 = _845 * _841;
        float _849 = floor(_847);
        float _851 = -_849;
        float _853 = _847 + _851;
        _855 = _853;
        _857 = true;
    }
    else
    {
        float _859 = float(_95);
        float _861 = 1.0 / _859;
        float _863 = _129 * _861;
        _855 = _863;
    }
    _857 = false;
    float _865 = _855;
    float _867 = in.m_51.x;
    float _869 = in.m_51.y;
    bool _871 = _865 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _873 = isnan(_865);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _887 = _865 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _889 = isnan(_865);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _899;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _905 = _865 + _903;
    float _907 = -_881;
    float _909 = _907 + 1.0;
    float _911 = 1.0 / _885;
    float _913 = _897 * _909;
    float _915 = -_897;
    float _917 = _915 + 1.0;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _921 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _923 = _919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _925 = _835 * _869;
    float _927 = _833 * _867;
    float _929 = _901 * _911;
    float _931 = fma(_929, _905, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _933 = _931 * _913;
    float _935 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[115].x, _933);
    float _937 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[116].x, _935);
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _949 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _951 = _941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _953 = _943 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _955 = _945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _957 = _947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _959 = _937 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _953;
    out.m_63.y = _955;
    out.m_63.z = _957;
    out.m_65.x = _949;
    out.m_65.y = _951;
    out.m_65.z = _923;
    out.m_65.w = _959;
    bool _961 = !_921;
    float _979;
    if (!_961)
    {
        float _963 = in.m_61.x;
        float _965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _967 = _963 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[14].x, _129);
        float _971 = _969 * _965;
        float _973 = floor(_971);
        float _975 = -_973;
        float _977 = _971 + _975;
        _979 = _977;
        _981 = true;
    }
    else
    {
        float _983 = float(_95);
        float _985 = 1.0 / _983;
        float _987 = _129 * _985;
        _979 = _987;
    }
    _981 = false;
    float _989 = _979;
    float _991 = _635 * _635;
    float _993 = in.m_61.x;
    float _995 = in.m_61.y;
    float _997 = _431 * _385;
    float _999 = _431 * _393;
    float _1001 = fma(_637, _637, _991);
    float _1003 = as_type<float>(int(gl_VertexIndex));
    float _1005 = _431 * _389;
    float _1007 = fma(_403, _395, _997);
    float _1009 = fma(_639, _639, _1001);
    float _1011 = fma(_403, _399, _1005);
    float _1013 = fma(_403, _401, _999);
    float _1015 = rsqrt(_1009);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1021 = fma(_405, _411, _1011);
    float _1023 = _927 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1027 = _1025 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1029 = _925 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1031 = _1021 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1033 = 1.0 / _1019;
    bool _1035 = _993 > 0.5;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1039 = _1037 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1041 = _995 > 0.5;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1047 = _1015 * _639;
    int _1049 = as_type<int>(_1003) & 1;
    bool _1051 = _1049 != 0;
    int _1053 = as_type<int>(_1003) & 2;
    bool _1055 = _1053 != 0;
    float _1057 = _1015 * _635;
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1061 = _1047 * _1059;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1065 = _1063 != 0;
    float _1067 = 1.0 / _1027;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1071 = _1069 != 0;
    float _1073 = _1015 * _637;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1081 = _1057 * _1079;
    float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1085 = -_1061;
    float _1087 = fma(_1073, _1083, _1085);
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1091 = _1073 * _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1095 = -_1081;
    float _1097 = fma(_1047, _1093, _1095);
    float _1099 = 1.0 / _1077;
    float _1101 = _1087 * _1087;
    float _1103 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1105 = -_1091;
    float _1107 = fma(_1057, _1103, _1105);
    float _1109 = fma(_405, _407, _1007);
    float _1111 = fma(_405, _427, _1013);
    float _1113 = fma(_1097, _1097, _1101);
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1115;
    float _1119 = _1111 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1121;
    float _1125 = fma(_1107, _1107, _1113);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1131 = _1117 * _1067;
    float _1133 = _1123 * _1033;
    float _1135 = rsqrt(_1125);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1139 = _989 + _1137;
    float _1141 = _1129 * _1099;
    bool _1143 = !_1051;
    float _1145 = _1143 ? (-0.5) : 0.5;
    float _1147 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1149 = fma(_1133, _1139, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1151 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1153 = isnan(_989);
    bool _1155 = _1151 || _1153;
    bool _1157 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1159 = _1155 || _1157;
    float _1161 = float(_1159);
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1165 = _1163 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1167 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1145);
    bool _1169 = !_1055;
    float _1171 = _1169 ? (-0.5) : 0.5;
    float _1173 = 1.0 / _1039;
    float _1175 = -_1161;
    float _1177 = _1175 + 1.0;
    float _1179 = _1023 * _1167;
    bool _1181 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1183 = isnan(_989);
    bool _1185 = _1181 || _1183;
    bool _1187 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1189 = _1185 || _1187;
    float _1191 = float(_1189);
    float _1193 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1171);
    bool _1195 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1197 = isnan(_989);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1203 = _1199 || _1201;
    float _1205 = float(_1203);
    float _1207 = _1087 * _1135;
    float _1209 = _1097 * _1135;
    float _1211 = _1107 * _1135;
    bool _1213 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1215 = isnan(_989);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1221 = _1217 || _1219;
    float _1223 = float(_1221);
    float _1225 = -_1191;
    float _1227 = _1225 + 1.0;
    float _1229 = _1191 * _1177;
    bool _1231 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1233 = isnan(_989);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1239 = _1235 || _1237;
    float _1241 = float(_1239);
    float _1243 = _1029 * _1193;
    float _1245 = _1223 * _1227;
    float _1247 = -_1223;
    float _1249 = _1247 + 1.0;
    float _1251 = _1073 * _1207;
    float _1253 = -_1241;
    float _1255 = _1253 + 1.0;
    float _1257 = _1243 * _1047;
    float _1259 = _1241 * _1249;
    float _1261 = _1243 * _1073;
    float _1263 = _1057 * _1211;
    float _1265 = fma(_1179, _1211, _1257);
    bool _1267 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1269 = isnan(_989);
    bool _1271 = _1267 || _1269;
    bool _1273 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1275 = _1271 || _1273;
    float _1277 = float(_1275);
    float _1279 = fma(_1179, _1209, _1261);
    float _1281 = -_1263;
    float _1283 = fma(_1047, _1207, _1281);
    float _1285 = -_1251;
    float _1287 = fma(_1057, _1209, _1285);
    bool _1289 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1291 = isnan(_989);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1297 = _1293 || _1295;
    float _1299 = float(_1297);
    float _1301 = _1205 * _1255;
    float _1303 = fma(_1147, _1283, _1279);
    float _1305 = fma(_1147, _1287, _1265);
    float _1307 = -_1205;
    float _1309 = _1307 + 1.0;
    bool _1311 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1313 = isnan(_989);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1319 = _1315 || _1317;
    float _1321 = float(_1319);
    float _1323 = _1031 + _1303;
    float _1325 = _1119 + _1305;
    float _1327 = -_1277;
    float _1329 = _1327 + 1.0;
    float _1331 = 1.0 / _1045;
    float _1333 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1335 = _1323 + _1333;
    float _1337 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1339 = _1325 + _1337;
    float _1341 = _1299 * _1309;
    float _1343 = -_1299;
    float _1345 = _1343 + 1.0;
    float _1347 = _1335 * _1335;
    float _1349 = _1339 * _1339;
    float _1351 = 1.0 / _1165;
    float _1353 = _1321 * _1329;
    float _1355 = _1277 * _1345;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1361;
    float _1365 = _1149 * _1353;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1371 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1373 = _989 + _1371;
    float _1375 = -_1321;
    float _1377 = _1375 + 1.0;
    float _1379 = _1347 + _1349;
    float _1381 = _1369 * _1173;
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1385 = _989 + _1383;
    float _1387 = sqrt(_1379);
    float _1389 = fma(_1141, _1373, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1391 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1365);
    float _1393 = _1359 * _1331;
    float _1395 = _1243 * _1057;
    float _1397 = _1363 * _1351;
    float _1399 = fma(_1131, _1385, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1403 = _1401 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1405 = fma(_1389, _1355, _1391);
    float _1407 = _1047 * _1209;
    float _1409 = fma(_1179, _1207, _1395);
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1413 = _989 + _1411;
    float _1415 = fma(_1399, _1341, _1405);
    float _1417 = -_1407;
    float _1419 = fma(_1073, _1211, _1417);
    float _1421 = 1.0 / _1403;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1425 = _989 + _1423;
    bool _1427 = _1387 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1429 = fma(_1147, _1419, _1409);
    float _1431 = fma(_1393, _1413, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1433 = _1109 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1435 = fma(_1397, _1425, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1439 = fma(_1431, _1301, _1415);
    float _1441 = _1433 + _1429;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1443;
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1449 = _989 + _1447;
    float _1451 = _1301;
    float _1453 = _1347;
    float _1455 = _1349;
    float _1457 = _1323;
    float _1459 = _1325;
    float _1461 = _1057;
    float _1463 = _1209;
    float _1465 = _1211;
    if (!_1427)
    {
        _1451 = _1441;
    }
    float _1467 = _1451;
    float _1469 = _1445 * _1421;
    float _1471 = fma(_1381, _1449, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1473 = !_1427;
    float _1475 = _1467;
    if (!_1473)
    {
        float _1477 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1481 = _1387 + _1479;
        float _1483 = rsqrt(_1379);
        float _1485 = _1481 * _1477;
        float _1487 = _1441 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1489 = _1485 * 0.15915493667125701904296875;
        float _1491 = _1489 * 6.283185482025146484375;
        float _1493 = sin(_1491);
        float _1495 = _1489 * 6.283185482025146484375;
        float _1497 = cos(_1495);
        float _1499 = fma(_1493, _1487, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1501 = _1483 * _1499;
        float _1503 = fma(_1335, _1501, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1505 = _1497 + (-1.0);
        float _1507 = fma(_1339, _1501, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1511 = _1503 + _1509;
        float _1513 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1517 = _1507 + _1515;
        float _1519 = _1511 * _1511;
        float _1521 = fma(_1441, _1497, _1513);
        float _1523 = _1517 * _1517;
        _1475 = _1521;
        _1453 = _1519;
        _1455 = _1523;
        _1457 = _1503;
        _1459 = _1507;
    }
    float _1525 = _1475;
    float _1527 = _1453;
    float _1529 = _1455;
    float _1531 = _1457;
    float _1533 = _1459;
    float _1535 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1537 = _1525 + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1541 = _989 + _1539;
    float _1543 = -_1145;
    int _1545 = _1035 ? as_type<int>(_1543) : as_type<int>(_1145);
    float _1547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1549 = -_1171;
    int _1551 = _1041 ? as_type<int>(_1549) : as_type<int>(_1171);
    float _1553 = fma(_1537, _1537, _1527);
    bool _1555 = !_1065;
    float _1557 = _1555 ? _1145 : as_type<float>(_1545);
    float _1559 = fma(_1435, _1259, _1439);
    bool _1561 = !_1071;
    float _1563 = _1561 ? _1171 : as_type<float>(_1551);
    float _1565 = _1553 + _1529;
    float _1567 = fma(_1469, _1541, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1569 = _1557 + 0.5;
    float _1571 = fma(_1471, _1245, _1559);
    float _1573 = -_1563;
    float _1575 = _1573 + 0.5;
    float _1577 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1579 = sqrt(_1565);
    float _1581 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1583 = _1575 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1585 = fma(_1567, _1229, _1571);
    float _1587 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1589 = _1581 * _1437;
    float _1591 = _1583 * _1547;
    float _1593 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1585);
    float _1595 = _1073 * _1577;
    float _1597 = _1057 * _1577;
    float _1599 = _1047 * _1577;
    out.m_70.x = _1589;
    out.m_70.y = _1591;
    float _1601 = fma(_1209, _1587, _1595);
    float _1603 = fma(_1207, _1587, _1597);
    float _1605 = fma(_1211, _1587, _1599);
    out.m_72.x = _1593;
    bool _1607 = _1579 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1609 = isnan(_1579);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1615 = _1611 || _1613;
    float _1617 = _1419 + _1603;
    float _1619 = _1283 + _1601;
    float _1621 = _1287 + _1605;
    float _1623 = _1603;
    if (!_1615)
    {
        _1623 = 1.0;
    }
    float _1625 = _1623;
    bool _1627 = !_1615;
    float _1629 = _1625;
    if (!_1627)
    {
        bool _1631 = _1579 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1633 = isnan(_1579);
        bool _1635 = _1631 || _1633;
        bool _1637 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1639 = _1635 || _1637;
        if (!_1639)
        {
            float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1643 = _1579 + _1641;
            float _1645 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1647 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1645;
            float _1649 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1651 = _1649 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1653 = 1.0 / _1647;
            float _1655 = _1643 * _1653;
            float _1657 = fma(_1655, _1651, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1629 = _1657;
            _1461 = _1653;
            _1659 = true;
        }
        else
        {
            bool _1661 = _1579 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1663 = isnan(_1579);
            bool _1665 = _1661 || _1663;
            bool _1667 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1669 = _1665 || _1667;
            if (!_1669)
            {
                float _1671 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1673 = _1579 + _1671;
                float _1675 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1677 = _1675 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1679 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1681 = _1679 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1683 = 1.0 / _1677;
                float _1685 = _1673 * _1683;
                float _1687 = fma(_1685, _1681, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1629 = _1687;
                _1461 = _1683;
                _1659 = true;
            }
            else
            {
                _1629 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1659 = false;
    float _1689 = _1629;
    float _1691 = _1461;
    float _1693 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1695 = _1531 + _1693;
    float _1697 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1699 = _1525 + _1697;
    float _1701 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1703 = _1533 + _1701;
    bool _1705 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1707 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan(0.5);
    bool _1713 = _1709 || _1711;
    float _1715 = fma(_1695, _1689, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1717 = fma(_1699, _1689, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1719 = fma(_1703, _1689, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1721 = _1699;
    float _1723 = _1691;
    float _1725 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1727 = _1695;
    if (_1713)
    {
        _1721 = _1715;
    }
    float _1729 = _1721;
    float _1731 = _1729;
    if (_1713)
    {
        _1723 = _1717;
    }
    float _1733 = _1723;
    float _1735 = _1733;
    if (_1713)
    {
        _1725 = _1719;
    }
    float _1737 = _1725;
    float _1739 = _1737;
    if (!_1713)
    {
        float _1741 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1743 = _1433 + _1741;
        float _1745 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1747 = _1031 + _1745;
        float _1749 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1751 = _1743 * _1743;
        float _1753 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1755 = _1119 + _1753;
        float _1757 = fma(_1747, _1747, _1751);
        float _1759 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1761 = fma(_1755, _1755, _1757);
        float _1763 = sqrt(_1761);
        float _1765 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1767 = -_1433;
        float _1769 = _1767 + _1717;
        float _1771 = precise::min(_1763, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1773 = _1771 * _1759;
        float _1775 = -_1031;
        float _1777 = _1775 + _1715;
        float _1779 = -_1119;
        float _1781 = _1779 + _1719;
        float _1783 = _1765 * _1773;
        float _1785 = fma(_1777, _1783, _1031);
        float _1787 = fma(_1769, _1783, _1433);
        float _1789 = fma(_1781, _1783, _1119);
        _1735 = _1787;
        _1731 = _1785;
        _1739 = _1789;
    }
    float _1791 = _1735;
    float _1793 = _1731;
    float _1795 = _1739;
    float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1799 = _1791 + _1797;
    float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1803 = _1793 + _1801;
    float _1805 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1807 = _1795 + _1805;
    float _1809 = _1799 * _1799;
    float _1811 = fma(_1803, _1803, _1809);
    float _1813 = fma(_1807, _1807, _1811);
    float _1815 = rsqrt(_1813);
    float _1817 = _1803 * _1815;
    float _1819 = _1807 * _1815;
    float _1821 = _1799 * _1815;
    float _1823 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1825 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1827 = _1823 * _1823;
    float _1829 = _1825 * _1825;
    float _1831 = _1827 + _1829;
    float _1833 = sqrt(_1831);
    bool _1835 = _1833 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1837 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1839 = _1833 + _1837;
    float _1841 = _1717;
    float _1843 = _1839;
    float _1845 = _1823;
    if (_1835)
    {
        float _1847 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1841 = _1847;
    }
    float _1849 = _1841;
    if (_1835)
    {
        float _1851 = rsqrt(_1831);
        _1463 = _1851;
    }
    float _1853 = _1463;
    float _1855 = _1853;
    if (_1835)
    {
        float _1857 = _1839 * _1849;
        _1843 = _1857;
    }
    float _1859 = _1843;
    if (_1835)
    {
        float _1861 = _1859 * 0.15915493667125701904296875;
        _1465 = _1861;
    }
    float _1863 = _1465;
    float _1865 = _1715;
    if (_1835)
    {
        float _1867 = _1863 * 6.283185482025146484375;
        float _1869 = sin(_1867);
        _1865 = _1869;
    }
    float _1871 = _1865;
    float _1873 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1875 = precise::max(0.0, _1873);
    float _1877 = _1849;
    float _1879 = _1875;
    float _1881 = _1873;
    if (_1835)
    {
        float _1883 = _1863 * 6.283185482025146484375;
        float _1885 = cos(_1883);
        _1877 = _1885;
    }
    float _1887 = _1877;
    float _1889 = -_1821;
    float _1891 = -_1875;
    float _1893 = fma(_1889, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1891);
    if (_1835)
    {
        float _1895 = _1893 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1879 = _1895;
    }
    float _1897 = _1879;
    float _1899 = sqrt(_1813);
    float _1901 = _1897;
    float _1903 = _1871;
    if (_1835)
    {
        float _1905 = fma(_1871, _1897, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1901 = _1905;
    }
    float _1907 = _1901;
    float _1909 = _1907;
    if (!_1835)
    {
        _1903 = _1825;
    }
    float _1911 = _1903;
    float _1913 = _1911;
    float _1915 = _1887;
    if (_1835)
    {
        float _1917 = _1887 + (-1.0);
        _1881 = _1917;
    }
    float _1919 = _1881;
    float _1921 = _1919;
    if (_1835)
    {
        float _1923 = _1853 * _1907;
        _1727 = _1923;
    }
    float _1925 = _1727;
    if (!_1835)
    {
        _1909 = _1893;
    }
    float _1927 = _1909;
    float _1929 = _1927;
    if (_1835)
    {
        float _1931 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1855 = _1931;
    }
    float _1933 = _1855;
    if (_1835)
    {
        float _1935 = _1823 * _1925;
        _1845 = _1935;
    }
    float _1937 = _1845;
    if (!_1835)
    {
        _1921 = _1827;
    }
    float _1939 = _1921;
    float _1941 = _1939;
    if (_1835)
    {
        float _1943 = _1825 * _1925;
        _1913 = _1943;
    }
    float _1945 = _1913;
    if (_1835)
    {
        float _1947 = fma(_1893, _1887, _1933);
        _1929 = _1947;
    }
    float _1949 = _1929;
    if (_1835)
    {
        float _1951 = _1937 * _1937;
        _1941 = _1951;
    }
    float _1953 = _1941;
    if (!_1835)
    {
        _1915 = _1829;
    }
    float _1955 = _1915;
    float _1957 = _1955;
    if (_1835)
    {
        float _1959 = _1945 * _1945;
        _1957 = _1959;
    }
    float _1961 = _1957;
    float _1963 = fma(_1949, _1949, _1953);
    float _1965 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1967 = _1963 + _1961;
    float _1969 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1973 = fma(_1899, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1971);
    float _1975 = precise::clamp(_1973, 0.0, 1.0);
    float _1977 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1979 = rsqrt(_1967);
    float _1981 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1969);
    float _1983 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1985 = -_1975;
    float _1987 = _1985 + 1.0;
    float _1989 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1991 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1981);
    float _1993 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1983);
    float _1995 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1989);
    float _1997 = _1991 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1999 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1993);
    float _2001 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1965);
    float _2003 = abs(_1987);
    float _2005 = log2(_2003);
    float _2007 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1995);
    float _2009 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2011 = _1999 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2013 = _1979 * _1937;
    float _2015 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2001);
    float _2017 = _1979 * _1949;
    float _2019 = _2007 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2021 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2023 = -_2009;
    float _2025 = fma(_2023, _1977, 1.0);
    float _2027 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2029 = _2015 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2031 = _1979 * _1945;
    float _2033 = -_2021;
    float _2035 = fma(_2017, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2033);
    float _2037 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2027);
    float _2039 = log2(_2025);
    float _2041 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2043 = -_2031;
    float _2045 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2035);
    float _2047 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2037);
    float _2049 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2051 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2053 = fma(_2045, -0.5, 0.5);
    float _2055 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2047);
    float _2057 = exp2(_2041);
    float _2059 = fma(_2045, 0.5, 0.5);
    float _2061 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2049);
    float _2063 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2051);
    float _2065 = _2017 + 1.0;
    float _2067 = fma(_2059, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2069 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2061);
    float _2071 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2063);
    float _2073 = 1.0 / _2055;
    float _2075 = fma(_2059, _2067, -0.212114393711090087890625);
    float _2077 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2069);
    float _2079 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2071);
    float _2081 = _2039 * 0.693147182464599609375;
    float _2083 = fma(_2059, _2075, 1.570728778839111328125);
    float _2085 = sqrt(_2053);
    float _2087 = -_2017;
    float _2089 = fma(_2057, _2065, _2087);
    float _2091 = _2077 * _2073;
    float _2093 = _2079 * _2073;
    float _2095 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2097 = fma(_2089, 0.5, 0.5);
    float _2099 = fma(_2091, 0.5, 0.5);
    float _2101 = fma(_2093, -0.5, 0.5);
    float _2103 = _2085 * 0.636619746685028076171875;
    float _2105 = -_2083;
    float _2107 = fma(_2103, _2105, 1.0);
    float3 _5539 = float3(_2099, _2101, _2095);
    float _2109 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5539, float3(0.0), isnan(_5539)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5539, float3(0.0), isnan(_5539)), level(0.0)).x;
    float3 _5550 = float3(_2099, _2101, _2095);
    float4 _2112 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5550, float3(0.0), isnan(_5550)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5550, float3(0.0), isnan(_5550)), level(0.0)).xyzw;
    float _2114 = _2112.x;
    float _2116 = _2112.y;
    float _2118 = _2112.z;
    float _2120 = _2112.w;
    float2 _5567 = float2(_2107, _2097);
    float3 _2124 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5567, float2(0.0), isnan(_5567)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5567, float2(0.0), isnan(_5567)), level(0.0)).xyz;
    float _2126 = _2124.x;
    float _2128 = _2124.y;
    float _2130 = _2124.z;
    float _2132 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2134 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2136 = _1617 * _1821;
    float _2138 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2132);
    float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2142 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _2140;
    float _2144 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2134);
    float _2146 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2138);
    float _2148 = fma(_1619, _1817, _2136);
    float _2150 = 1.0 / _2142;
    float _2152 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2154 = _2146 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2156 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2158 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2160 = _2156 || _2158;
    bool _2162 = isnan(0.5);
    bool _2164 = _2160 || _2162;
    float _2166 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2144);
    float _2168 = fma(_1621, _1819, _2148);
    float _2170 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2172 = 1.0 / _2154;
    float _2174 = abs(_2168);
    float _2176 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2178 = _2174 + _2176;
    float _2180 = _2166 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2182 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2170);
    float _2184 = _2180 + _2154;
    float _2186 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2182);
    float _2188 = exp2(_2152);
    float _2190 = _2178 * _2150;
    float _2192 = precise::clamp(_2190, 0.0, 1.0);
    float _2194 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2186);
    float _2196 = fma(_2192, -2.0, 3.0);
    float _2198 = _2192 * _2192;
    float _2200 = _2192;
    if (_2164)
    {
        _2200 = 1.0;
    }
    float _2202 = _2200;
    float _2204 = _2184 * _2172;
    float _2206 = _2204 * 0.5;
    float _2208 = _2202;
    if (!_2164)
    {
        float _2210 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2212 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2210);
        float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2216 = _2214 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _2218 = 1.0 / _2212;
        float _2220 = 1.0 / _2216;
        float _2222 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2224 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2226 = fma(_2218, _2222, _2224);
        float _2228 = _2226 * _2220;
        float _2230 = precise::clamp(_2228, 0.0, 1.0);
        _2208 = _2230;
    }
    float _2232 = _2208;
    float _2234 = _2055 * 0.5;
    float _2236 = -_2188;
    float _2238 = _2236 + 1.0;
    float _2240 = _2198 * _2196;
    bool _2242 = _2232 > 0.0;
    bool _2244 = isnan(_2232);
    bool _2246 = _2242 || _2244;
    bool _2248 = isnan(0.0);
    bool _2250 = _2246 || _2248;
    float _2252 = fma(_2079, -0.5, _2234);
    float _2254 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2256 = _2240 * _2232;
    float _2258 = _2194 + _2055;
    float _2260 = _2077 + _2055;
    float _2262 = _2254 * _2109;
    float _2264 = -_2254;
    float _2266 = _2264 + 1.0;
    float _2268 = _2256 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _2077;
    out.gl_Position.y = _2079;
    out.gl_Position.z = _2194;
    out.gl_Position.w = _2055;
    float _2270 = _2120 * _2262;
    float _2272 = _2130 * _2262;
    float _2274 = _2120 * _2266;
    float _2276 = fma(_2126, _2270, _2114);
    float _2278 = _2258 * 0.5;
    float _2280 = _2260 * 0.5;
    float _2282 = _2268 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2284 = fma(_2128, _2270, _2116);
    float _2286 = fma(_2120, _2272, _2118);
    out.m_74.x = _2280;
    out.m_74.y = _2252;
    out.m_74.z = _2278;
    out.m_74.w = _2055;
    out.m_47.x = _2282;
    out.m_76.x = _2276;
    out.m_76.y = _2284;
    out.m_76.z = _2286;
    out.m_76.w = _2274;
    if (_2250)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2288 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2288;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1659 = false;
    bool _981 = false;
    bool _857 = false;
    bool _663 = false;
    bool _501 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2345 = as_type<float>(_111);
        out.gl_Position.z = _2345;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    if (_125)
    {
        float _133 = float(_95);
        _131 = _133;
    }
    float _135 = _131;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    if (_141)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _105;
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _147 = _143 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2414 = as_type<float>(_149);
        out.gl_Position.z = _2414;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = in.m_49.x;
    float _153 = in.m_49.y;
    float _155 = in.m_49.z;
    float _157 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        float _183 = _129 * _129;
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
        _145 = _217;
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
        _267 = _129;
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
        float _295 = _129 * _287;
        float _297 = 1.0 / _291;
        float _299 = _293 * 0.693147182464599609375;
        float _301 = exp2(_295);
        float _303 = 1.0 / _299;
        float _305 = _301 + (-1.0);
        float _307 = -_305;
        float _309 = fma(_307, _303, _129);
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
        float _329 = _129 * _321;
        float _331 = exp2(_329);
        float _333 = -_331;
        float _335 = _333 + 1.0;
        float _337 = _335 * _327;
        _275 = _337;
    }
    float _339 = _275;
    float _341 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _343 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _347 = fma(_265, _151, _273);
    float _349 = fma(_265, _153, _341);
    float _351 = fma(_265, _155, _343);
    float _353 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _355 = fma(_339, _153, _345);
    float _357 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = in.m_51.w;
    float _361 = fma(_339, _151, _353);
    float _363 = -_355;
    float _365 = _349 + _363;
    float _367 = fma(_339, _155, _357);
    float _369 = in.m_44.x;
    float _371 = in.m_44.y;
    float _373 = in.m_44.z;
    float _375 = -_361;
    float _377 = _347 + _375;
    float _379 = _365 * _365;
    float _381 = -_367;
    float _383 = _351 + _381;
    float _385 = in.m_53.y;
    float _387 = fma(_377, _377, _379);
    float _389 = in.m_55.y;
    float _391 = fma(_383, _383, _387);
    float _393 = in.m_57.y;
    float _395 = in.m_53.x;
    float _397 = sqrt(_391);
    float _399 = in.m_55.x;
    float _401 = in.m_57.x;
    float _403 = fma(_347, _359, _369);
    float _405 = fma(_351, _359, _373);
    float _407 = in.m_53.z;
    float _409 = _365 * _385;
    float _411 = in.m_55.z;
    bool _413 = _397 >= 9.9999999747524270787835121154785e-07;
    bool _415 = isnan(_397);
    bool _417 = _413 || _415;
    bool _419 = isnan(9.9999999747524270787835121154785e-07);
    bool _421 = _417 || _419;
    float _423 = _365 * _389;
    float _425 = _385 * _385;
    float _427 = in.m_57.z;
    float _429 = _365 * _393;
    float _431 = fma(_349, _359, _371);
    float _433 = fma(_389, _389, _425);
    out.m_59.x = _403;
    float _435 = fma(_377, _395, _409);
    float _437 = fma(_393, _393, _433);
    out.m_59.z = _405;
    float _439 = fma(_377, _399, _423);
    float _441 = fma(_377, _401, _429);
    float _443 = fma(_383, _407, _435);
    float _445 = fma(_383, _411, _439);
    float _447 = fma(_383, _427, _441);
    float _449 = _383;
    float _451 = _445;
    float _453 = _445;
    float _455 = _447;
    if (_421)
    {
        _449 = _443;
    }
    float _457 = _449;
    float _459 = _457;
    float _461 = _457;
    if (!_421)
    {
        bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _465 = !_463;
        if (!_465)
        {
            float _467 = _385 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _469 = _389 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _471 = _393 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _473 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[16].x, _467);
            float _475 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[16].x, _469);
            float _477 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[16].x, _471);
            float _479 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[16].z, _473);
            float _481 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[16].z, _475);
            float _483 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[16].z, _477);
            float _485 = _479 * _479;
            float _487 = fma(_481, _481, _485);
            float _489 = fma(_483, _483, _487);
            float _491 = rsqrt(_489);
            float _493 = _491 * 9.9999999747524270787835121154785e-07;
            float _495 = _481 * _493;
            float _497 = _479 * _493;
            float _499 = _483 * _493;
            _461 = _497;
            _453 = _495;
            _455 = _499;
            _501 = true;
        }
        else
        {
            float _503 = _153 * _153;
            float _505 = fma(_151, _151, _503);
            float _507 = fma(_155, _155, _505);
            float _509 = sqrt(_507);
            bool _511 = _509 >= 9.9999999747524270787835121154785e-07;
            bool _513 = isnan(_509);
            bool _515 = _511 || _513;
            bool _517 = isnan(9.9999999747524270787835121154785e-07);
            bool _519 = _515 || _517;
            float _521 = _509;
            if (!_519)
            {
                float _523 = _371 * _371;
                float _525 = fma(_369, _369, _523);
                float _527 = fma(_373, _373, _525);
                float _529 = sqrt(_527);
                bool _531 = _529 >= 9.9999999747524270787835121154785e-07;
                bool _533 = isnan(_529);
                bool _535 = _531 || _533;
                bool _537 = isnan(9.9999999747524270787835121154785e-07);
                bool _539 = _535 || _537;
                float _541 = _437;
                if (!_539)
                {
                    float _543 = rsqrt(_437);
                    _541 = _543;
                }
                float _545 = _541;
                if (!_539)
                {
                    float _547 = _545 * 9.9999999747524270787835121154785e-07;
                    _521 = _547;
                }
                float _549 = _521;
                float _551 = _549;
                if (!_539)
                {
                    float _553 = _389 * _549;
                    _451 = _553;
                }
                float _555 = _451;
                _453 = _555;
                if (!_539)
                {
                    float _557 = _385 * _549;
                    _459 = _557;
                }
                float _559 = _459;
                _461 = _559;
                if (!_539)
                {
                    float _561 = _393 * _549;
                    _551 = _561;
                }
                float _563 = _551;
                bool _565 = !_539;
                _455 = _563;
                _501 = _565;
                if (!_501)
                {
                    float _567 = _385 * _371;
                    float _569 = _389 * _371;
                    float _571 = _393 * _371;
                    float _573 = fma(_369, _395, _567);
                    float _575 = fma(_369, _399, _569);
                    float _577 = fma(_369, _401, _571);
                    float _579 = fma(_373, _407, _573);
                    float _581 = fma(_373, _411, _575);
                    float _583 = fma(_373, _427, _577);
                    float _585 = _579 * _579;
                    float _587 = fma(_581, _581, _585);
                    float _589 = fma(_583, _583, _587);
                    float _591 = rsqrt(_589);
                    float _593 = _591 * 9.9999999747524270787835121154785e-07;
                    float _595 = _581 * _593;
                    float _597 = _579 * _593;
                    float _599 = _583 * _593;
                    _461 = _597;
                    _453 = _595;
                    _455 = _599;
                    _501 = true;
                }
            }
            else
            {
                float _601 = _385 * _153;
                float _603 = _389 * _153;
                float _605 = _393 * _153;
                float _607 = fma(_151, _395, _601);
                float _609 = fma(_151, _399, _603);
                float _611 = fma(_151, _401, _605);
                float _613 = fma(_155, _407, _607);
                float _615 = fma(_155, _411, _609);
                float _617 = fma(_155, _427, _611);
                float _619 = _613 * _613;
                float _621 = fma(_615, _615, _619);
                float _623 = fma(_617, _617, _621);
                float _625 = rsqrt(_623);
                float _627 = _625 * 9.9999999747524270787835121154785e-07;
                float _629 = _615 * _627;
                float _631 = _613 * _627;
                float _633 = _617 * _627;
                _461 = _631;
                _453 = _629;
                _455 = _633;
            }
        }
    }
    _501 = false;
    float _635 = _461;
    float _637 = _453;
    float _639 = _455;
    bool _641 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _643 = !_641;
    float _661;
    if (!_643)
    {
        float _645 = in.m_61.x;
        float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _649 = _645 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _651 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _653 = _651 * _647;
        float _655 = floor(_653);
        float _657 = -_655;
        float _659 = _653 + _657;
        _661 = _659;
        _663 = true;
    }
    else
    {
        float _665 = float(_95);
        float _667 = 1.0 / _665;
        float _669 = _129 * _667;
        _661 = _669;
    }
    _663 = false;
    float _671 = _661;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _675 = _671 + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _679 = _671 + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _683 = _671 + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _685;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _693;
    bool _697 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _699 = isnan(_671);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = 1.0 / _687;
    bool _711 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _713 = 1.0 / _695;
    float _715 = 1.0 / _691;
    float _717 = _675 * _709;
    bool _719 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _721 = isnan(_671);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -_707;
    float _733 = _731 + 1.0;
    float _735 = _729 * _733;
    float _737 = _679 * _713;
    bool _739 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _741 = isnan(_671);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    float _751 = -_729;
    float _753 = _751 + 1.0;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _759 = _749 * _753;
    float _761 = -_749;
    float _763 = _761 + 1.0;
    float _765 = _683 * _715;
    bool _767 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _769 = isnan(_671);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _791 = fma(_781, _717, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _793 = _777 * _763;
    float _795 = fma(_785, _717, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _797 = -_777;
    float _799 = _797 + 1.0;
    float _801 = _791 * _793;
    float _803 = _795 * _793;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _805;
    float _809 = fma(_757, _765, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _811 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[143].x, _801);
    float _813 = fma(_789, _765, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _815;
    float _819 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[143].y, _803);
    float _821 = fma(_807, _737, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _823 = fma(_809, _759, _811);
    float _825 = fma(_817, _737, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _827 = fma(_813, _759, _819);
    float _829 = fma(_821, _735, _823);
    float _831 = fma(_825, _735, _827);
    float _833 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[146].x, _829);
    float _835 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[146].y, _831);
    bool _837 = !_711;
    float _855;
    if (!_837)
    {
        float _839 = in.m_61.x;
        float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _843 = _839 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _847 = _845 * _841;
        float _849 = floor(_847);
        float _851 = -_849;
        float _853 = _847 + _851;
        _855 = _853;
        _857 = true;
    }
    else
    {
        float _859 = float(_95);
        float _861 = 1.0 / _859;
        float _863 = _129 * _861;
        _855 = _863;
    }
    _857 = false;
    float _865 = _855;
    float _867 = in.m_51.x;
    float _869 = in.m_51.y;
    bool _871 = _865 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _873 = isnan(_865);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _887 = _865 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _889 = isnan(_865);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _899;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _905 = _865 + _903;
    float _907 = -_881;
    float _909 = _907 + 1.0;
    float _911 = 1.0 / _885;
    float _913 = _897 * _909;
    float _915 = -_897;
    float _917 = _915 + 1.0;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _921 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _923 = _919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _925 = _835 * _869;
    float _927 = _833 * _867;
    float _929 = _901 * _911;
    float _931 = fma(_929, _905, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _933 = _931 * _913;
    float _935 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[115].x, _933);
    float _937 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[116].x, _935);
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _949 = _939 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _951 = _941 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _953 = _943 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _955 = _945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _957 = _947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _959 = _937 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _953;
    out.m_63.y = _955;
    out.m_63.z = _957;
    out.m_65.x = _949;
    out.m_65.y = _951;
    out.m_65.z = _923;
    out.m_65.w = _959;
    bool _961 = !_921;
    float _979;
    if (!_961)
    {
        float _963 = in.m_61.x;
        float _965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _967 = _963 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[14].x, _129);
        float _971 = _969 * _965;
        float _973 = floor(_971);
        float _975 = -_973;
        float _977 = _971 + _975;
        _979 = _977;
        _981 = true;
    }
    else
    {
        float _983 = float(_95);
        float _985 = 1.0 / _983;
        float _987 = _129 * _985;
        _979 = _987;
    }
    _981 = false;
    float _989 = _979;
    float _991 = _635 * _635;
    float _993 = in.m_61.x;
    float _995 = in.m_61.y;
    float _997 = _431 * _385;
    float _999 = _431 * _393;
    float _1001 = fma(_637, _637, _991);
    float _1003 = as_type<float>(int(gl_VertexIndex));
    float _1005 = _431 * _389;
    float _1007 = fma(_403, _395, _997);
    float _1009 = fma(_639, _639, _1001);
    float _1011 = fma(_403, _399, _1005);
    float _1013 = fma(_403, _401, _999);
    float _1015 = rsqrt(_1009);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1021 = fma(_405, _411, _1011);
    float _1023 = _927 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1027 = _1025 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1029 = _925 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1031 = _1021 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1033 = 1.0 / _1019;
    bool _1035 = _993 > 0.5;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1039 = _1037 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1041 = _995 > 0.5;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1047 = _1015 * _639;
    int _1049 = as_type<int>(_1003) & 1;
    bool _1051 = _1049 != 0;
    int _1053 = as_type<int>(_1003) & 2;
    bool _1055 = _1053 != 0;
    float _1057 = _1015 * _635;
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1061 = _1047 * _1059;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1065 = _1063 != 0;
    float _1067 = 1.0 / _1027;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1071 = _1069 != 0;
    float _1073 = _1015 * _637;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1081 = _1057 * _1079;
    float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1085 = -_1061;
    float _1087 = fma(_1073, _1083, _1085);
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1091 = _1073 * _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1095 = -_1081;
    float _1097 = fma(_1047, _1093, _1095);
    float _1099 = 1.0 / _1077;
    float _1101 = _1087 * _1087;
    float _1103 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1105 = -_1091;
    float _1107 = fma(_1057, _1103, _1105);
    float _1109 = fma(_405, _407, _1007);
    float _1111 = fma(_405, _427, _1013);
    float _1113 = fma(_1097, _1097, _1101);
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1115;
    float _1119 = _1111 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1121;
    float _1125 = fma(_1107, _1107, _1113);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1131 = _1117 * _1067;
    float _1133 = _1123 * _1033;
    float _1135 = rsqrt(_1125);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1139 = _989 + _1137;
    float _1141 = _1129 * _1099;
    bool _1143 = !_1051;
    float _1145 = _1143 ? (-0.5) : 0.5;
    float _1147 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1149 = fma(_1133, _1139, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1151 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1153 = isnan(_989);
    bool _1155 = _1151 || _1153;
    bool _1157 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1159 = _1155 || _1157;
    float _1161 = float(_1159);
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1165 = _1163 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1167 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1145);
    bool _1169 = !_1055;
    float _1171 = _1169 ? (-0.5) : 0.5;
    float _1173 = 1.0 / _1039;
    float _1175 = -_1161;
    float _1177 = _1175 + 1.0;
    float _1179 = _1023 * _1167;
    bool _1181 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1183 = isnan(_989);
    bool _1185 = _1181 || _1183;
    bool _1187 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1189 = _1185 || _1187;
    float _1191 = float(_1189);
    float _1193 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1171);
    bool _1195 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1197 = isnan(_989);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1203 = _1199 || _1201;
    float _1205 = float(_1203);
    float _1207 = _1087 * _1135;
    float _1209 = _1097 * _1135;
    float _1211 = _1107 * _1135;
    bool _1213 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1215 = isnan(_989);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1221 = _1217 || _1219;
    float _1223 = float(_1221);
    float _1225 = -_1191;
    float _1227 = _1225 + 1.0;
    float _1229 = _1191 * _1177;
    bool _1231 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1233 = isnan(_989);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1239 = _1235 || _1237;
    float _1241 = float(_1239);
    float _1243 = _1029 * _1193;
    float _1245 = _1223 * _1227;
    float _1247 = -_1223;
    float _1249 = _1247 + 1.0;
    float _1251 = _1073 * _1207;
    float _1253 = -_1241;
    float _1255 = _1253 + 1.0;
    float _1257 = _1243 * _1047;
    float _1259 = _1241 * _1249;
    float _1261 = _1243 * _1073;
    float _1263 = _1057 * _1211;
    float _1265 = fma(_1179, _1211, _1257);
    bool _1267 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1269 = isnan(_989);
    bool _1271 = _1267 || _1269;
    bool _1273 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1275 = _1271 || _1273;
    float _1277 = float(_1275);
    float _1279 = fma(_1179, _1209, _1261);
    float _1281 = -_1263;
    float _1283 = fma(_1047, _1207, _1281);
    float _1285 = -_1251;
    float _1287 = fma(_1057, _1209, _1285);
    bool _1289 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1291 = isnan(_989);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1297 = _1293 || _1295;
    float _1299 = float(_1297);
    float _1301 = _1205 * _1255;
    float _1303 = fma(_1147, _1283, _1279);
    float _1305 = fma(_1147, _1287, _1265);
    float _1307 = -_1205;
    float _1309 = _1307 + 1.0;
    bool _1311 = _989 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1313 = isnan(_989);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1319 = _1315 || _1317;
    float _1321 = float(_1319);
    float _1323 = _1031 + _1303;
    float _1325 = _1119 + _1305;
    float _1327 = -_1277;
    float _1329 = _1327 + 1.0;
    float _1331 = 1.0 / _1045;
    float _1333 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1335 = _1323 + _1333;
    float _1337 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1339 = _1325 + _1337;
    float _1341 = _1299 * _1309;
    float _1343 = -_1299;
    float _1345 = _1343 + 1.0;
    float _1347 = _1335 * _1335;
    float _1349 = _1339 * _1339;
    float _1351 = 1.0 / _1165;
    float _1353 = _1321 * _1329;
    float _1355 = _1277 * _1345;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1361;
    float _1365 = _1149 * _1353;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1371 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1373 = _989 + _1371;
    float _1375 = -_1321;
    float _1377 = _1375 + 1.0;
    float _1379 = _1347 + _1349;
    float _1381 = _1369 * _1173;
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1385 = _989 + _1383;
    float _1387 = sqrt(_1379);
    float _1389 = fma(_1141, _1373, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1391 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1365);
    float _1393 = _1359 * _1331;
    float _1395 = _1243 * _1057;
    float _1397 = _1363 * _1351;
    float _1399 = fma(_1131, _1385, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1403 = _1401 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1405 = fma(_1389, _1355, _1391);
    float _1407 = _1047 * _1209;
    float _1409 = fma(_1179, _1207, _1395);
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1413 = _989 + _1411;
    float _1415 = fma(_1399, _1341, _1405);
    float _1417 = -_1407;
    float _1419 = fma(_1073, _1211, _1417);
    float _1421 = 1.0 / _1403;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1425 = _989 + _1423;
    bool _1427 = _1387 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1429 = fma(_1147, _1419, _1409);
    float _1431 = fma(_1393, _1413, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1433 = _1109 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1435 = fma(_1397, _1425, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1439 = fma(_1431, _1301, _1415);
    float _1441 = _1433 + _1429;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1443;
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1449 = _989 + _1447;
    float _1451 = _1301;
    float _1453 = _1347;
    float _1455 = _1349;
    float _1457 = _1323;
    float _1459 = _1325;
    float _1461 = _1057;
    float _1463 = _1209;
    float _1465 = _1211;
    if (!_1427)
    {
        _1451 = _1441;
    }
    float _1467 = _1451;
    float _1469 = _1445 * _1421;
    float _1471 = fma(_1381, _1449, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1473 = !_1427;
    float _1475 = _1467;
    if (!_1473)
    {
        float _1477 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1481 = _1387 + _1479;
        float _1483 = rsqrt(_1379);
        float _1485 = _1481 * _1477;
        float _1487 = _1441 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1489 = _1485 * 0.15915493667125701904296875;
        float _1491 = _1489 * 6.283185482025146484375;
        float _1493 = sin(_1491);
        float _1495 = _1489 * 6.283185482025146484375;
        float _1497 = cos(_1495);
        float _1499 = fma(_1493, _1487, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1501 = _1483 * _1499;
        float _1503 = fma(_1335, _1501, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1505 = _1497 + (-1.0);
        float _1507 = fma(_1339, _1501, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1511 = _1503 + _1509;
        float _1513 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1517 = _1507 + _1515;
        float _1519 = _1511 * _1511;
        float _1521 = fma(_1441, _1497, _1513);
        float _1523 = _1517 * _1517;
        _1475 = _1521;
        _1453 = _1519;
        _1455 = _1523;
        _1457 = _1503;
        _1459 = _1507;
    }
    float _1525 = _1475;
    float _1527 = _1453;
    float _1529 = _1455;
    float _1531 = _1457;
    float _1533 = _1459;
    float _1535 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1537 = _1525 + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1541 = _989 + _1539;
    float _1543 = -_1145;
    int _1545 = _1035 ? as_type<int>(_1543) : as_type<int>(_1145);
    float _1547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1549 = -_1171;
    int _1551 = _1041 ? as_type<int>(_1549) : as_type<int>(_1171);
    float _1553 = fma(_1537, _1537, _1527);
    bool _1555 = !_1065;
    float _1557 = _1555 ? _1145 : as_type<float>(_1545);
    float _1559 = fma(_1435, _1259, _1439);
    bool _1561 = !_1071;
    float _1563 = _1561 ? _1171 : as_type<float>(_1551);
    float _1565 = _1553 + _1529;
    float _1567 = fma(_1469, _1541, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1569 = _1557 + 0.5;
    float _1571 = fma(_1471, _1245, _1559);
    float _1573 = -_1563;
    float _1575 = _1573 + 0.5;
    float _1577 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1579 = sqrt(_1565);
    float _1581 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1583 = _1575 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1585 = fma(_1567, _1229, _1571);
    float _1587 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1589 = _1581 * _1437;
    float _1591 = _1583 * _1547;
    float _1593 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1585);
    float _1595 = _1073 * _1577;
    float _1597 = _1057 * _1577;
    float _1599 = _1047 * _1577;
    out.m_70.x = _1589;
    out.m_70.y = _1591;
    float _1601 = fma(_1209, _1587, _1595);
    float _1603 = fma(_1207, _1587, _1597);
    float _1605 = fma(_1211, _1587, _1599);
    out.m_72.x = _1593;
    bool _1607 = _1579 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1609 = isnan(_1579);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1615 = _1611 || _1613;
    float _1617 = _1419 + _1603;
    float _1619 = _1283 + _1601;
    float _1621 = _1287 + _1605;
    float _1623 = _1603;
    if (!_1615)
    {
        _1623 = 1.0;
    }
    float _1625 = _1623;
    bool _1627 = !_1615;
    float _1629 = _1625;
    if (!_1627)
    {
        bool _1631 = _1579 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1633 = isnan(_1579);
        bool _1635 = _1631 || _1633;
        bool _1637 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1639 = _1635 || _1637;
        if (!_1639)
        {
            float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1643 = _1579 + _1641;
            float _1645 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1647 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1645;
            float _1649 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1651 = _1649 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1653 = 1.0 / _1647;
            float _1655 = _1643 * _1653;
            float _1657 = fma(_1655, _1651, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1629 = _1657;
            _1461 = _1653;
            _1659 = true;
        }
        else
        {
            bool _1661 = _1579 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1663 = isnan(_1579);
            bool _1665 = _1661 || _1663;
            bool _1667 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1669 = _1665 || _1667;
            if (!_1669)
            {
                float _1671 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1673 = _1579 + _1671;
                float _1675 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1677 = _1675 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1679 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1681 = _1679 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1683 = 1.0 / _1677;
                float _1685 = _1673 * _1683;
                float _1687 = fma(_1685, _1681, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1629 = _1687;
                _1461 = _1683;
                _1659 = true;
            }
            else
            {
                _1629 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1659 = false;
    float _1689 = _1629;
    float _1691 = _1461;
    float _1693 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1695 = _1531 + _1693;
    float _1697 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1699 = _1525 + _1697;
    float _1701 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1703 = _1533 + _1701;
    bool _1705 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1707 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan(0.5);
    bool _1713 = _1709 || _1711;
    float _1715 = fma(_1695, _1689, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1717 = fma(_1699, _1689, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1719 = fma(_1703, _1689, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1721 = _1699;
    float _1723 = _1691;
    float _1725 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1727 = _1695;
    if (_1713)
    {
        _1721 = _1715;
    }
    float _1729 = _1721;
    float _1731 = _1729;
    if (_1713)
    {
        _1723 = _1717;
    }
    float _1733 = _1723;
    float _1735 = _1733;
    if (_1713)
    {
        _1725 = _1719;
    }
    float _1737 = _1725;
    float _1739 = _1737;
    if (!_1713)
    {
        float _1741 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1743 = _1433 + _1741;
        float _1745 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1747 = _1031 + _1745;
        float _1749 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1751 = _1743 * _1743;
        float _1753 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1755 = _1119 + _1753;
        float _1757 = fma(_1747, _1747, _1751);
        float _1759 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1761 = fma(_1755, _1755, _1757);
        float _1763 = sqrt(_1761);
        float _1765 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1767 = -_1433;
        float _1769 = _1767 + _1717;
        float _1771 = precise::min(_1763, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1773 = _1771 * _1759;
        float _1775 = -_1031;
        float _1777 = _1775 + _1715;
        float _1779 = -_1119;
        float _1781 = _1779 + _1719;
        float _1783 = _1765 * _1773;
        float _1785 = fma(_1777, _1783, _1031);
        float _1787 = fma(_1769, _1783, _1433);
        float _1789 = fma(_1781, _1783, _1119);
        _1735 = _1787;
        _1731 = _1785;
        _1739 = _1789;
    }
    float _1791 = _1735;
    float _1793 = _1731;
    float _1795 = _1739;
    float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1799 = _1791 + _1797;
    float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1803 = _1793 + _1801;
    float _1805 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1807 = _1795 + _1805;
    float _1809 = _1799 * _1799;
    float _1811 = fma(_1803, _1803, _1809);
    float _1813 = fma(_1807, _1807, _1811);
    float _1815 = rsqrt(_1813);
    float _1817 = _1803 * _1815;
    float _1819 = _1807 * _1815;
    float _1821 = _1799 * _1815;
    float _1823 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1825 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1827 = _1823 * _1823;
    float _1829 = _1825 * _1825;
    float _1831 = _1827 + _1829;
    float _1833 = sqrt(_1831);
    bool _1835 = _1833 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1837 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1839 = _1833 + _1837;
    float _1841 = _1717;
    float _1843 = _1839;
    float _1845 = _1823;
    if (_1835)
    {
        float _1847 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1841 = _1847;
    }
    float _1849 = _1841;
    if (_1835)
    {
        float _1851 = rsqrt(_1831);
        _1463 = _1851;
    }
    float _1853 = _1463;
    float _1855 = _1853;
    if (_1835)
    {
        float _1857 = _1839 * _1849;
        _1843 = _1857;
    }
    float _1859 = _1843;
    if (_1835)
    {
        float _1861 = _1859 * 0.15915493667125701904296875;
        _1465 = _1861;
    }
    float _1863 = _1465;
    float _1865 = _1715;
    if (_1835)
    {
        float _1867 = _1863 * 6.283185482025146484375;
        float _1869 = sin(_1867);
        _1865 = _1869;
    }
    float _1871 = _1865;
    float _1873 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1875 = precise::max(0.0, _1873);
    float _1877 = _1849;
    float _1879 = _1875;
    float _1881 = _1873;
    if (_1835)
    {
        float _1883 = _1863 * 6.283185482025146484375;
        float _1885 = cos(_1883);
        _1877 = _1885;
    }
    float _1887 = _1877;
    float _1889 = -_1821;
    float _1891 = -_1875;
    float _1893 = fma(_1889, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1891);
    if (_1835)
    {
        float _1895 = _1893 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1879 = _1895;
    }
    float _1897 = _1879;
    float _1899 = sqrt(_1813);
    float _1901 = _1897;
    float _1903 = _1871;
    if (_1835)
    {
        float _1905 = fma(_1871, _1897, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1901 = _1905;
    }
    float _1907 = _1901;
    float _1909 = _1907;
    if (!_1835)
    {
        _1903 = _1825;
    }
    float _1911 = _1903;
    float _1913 = _1911;
    float _1915 = _1887;
    if (_1835)
    {
        float _1917 = _1887 + (-1.0);
        _1881 = _1917;
    }
    float _1919 = _1881;
    float _1921 = _1919;
    if (_1835)
    {
        float _1923 = _1853 * _1907;
        _1727 = _1923;
    }
    float _1925 = _1727;
    if (!_1835)
    {
        _1909 = _1893;
    }
    float _1927 = _1909;
    float _1929 = _1927;
    if (_1835)
    {
        float _1931 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1855 = _1931;
    }
    float _1933 = _1855;
    if (_1835)
    {
        float _1935 = _1823 * _1925;
        _1845 = _1935;
    }
    float _1937 = _1845;
    if (!_1835)
    {
        _1921 = _1827;
    }
    float _1939 = _1921;
    float _1941 = _1939;
    if (_1835)
    {
        float _1943 = _1825 * _1925;
        _1913 = _1943;
    }
    float _1945 = _1913;
    if (_1835)
    {
        float _1947 = fma(_1893, _1887, _1933);
        _1929 = _1947;
    }
    float _1949 = _1929;
    if (_1835)
    {
        float _1951 = _1937 * _1937;
        _1941 = _1951;
    }
    float _1953 = _1941;
    if (!_1835)
    {
        _1915 = _1829;
    }
    float _1955 = _1915;
    float _1957 = _1955;
    if (_1835)
    {
        float _1959 = _1945 * _1945;
        _1957 = _1959;
    }
    float _1961 = _1957;
    float _1963 = fma(_1949, _1949, _1953);
    float _1965 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1967 = _1963 + _1961;
    float _1969 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1973 = fma(_1899, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1971);
    float _1975 = precise::clamp(_1973, 0.0, 1.0);
    float _1977 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1979 = rsqrt(_1967);
    float _1981 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1969);
    float _1983 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1985 = -_1975;
    float _1987 = _1985 + 1.0;
    float _1989 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1991 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1981);
    float _1993 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1983);
    float _1995 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1989);
    float _1997 = _1991 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1999 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1993);
    float _2001 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1965);
    float _2003 = abs(_1987);
    float _2005 = log2(_2003);
    float _2007 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1995);
    float _2009 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2011 = _1999 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2013 = _1979 * _1937;
    float _2015 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2001);
    float _2017 = _1979 * _1949;
    float _2019 = _2007 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2021 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2023 = -_2009;
    float _2025 = fma(_2023, _1977, 1.0);
    float _2027 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2029 = _2015 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2031 = _1979 * _1945;
    float _2033 = -_2021;
    float _2035 = fma(_2017, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2033);
    float _2037 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2027);
    float _2039 = log2(_2025);
    float _2041 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2043 = -_2031;
    float _2045 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2035);
    float _2047 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2037);
    float _2049 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2051 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2053 = fma(_2045, -0.5, 0.5);
    float _2055 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2047);
    float _2057 = exp2(_2041);
    float _2059 = fma(_2045, 0.5, 0.5);
    float _2061 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2049);
    float _2063 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2051);
    float _2065 = _2017 + 1.0;
    float _2067 = fma(_2059, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2069 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2061);
    float _2071 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2063);
    float _2073 = 1.0 / _2055;
    float _2075 = fma(_2059, _2067, -0.212114393711090087890625);
    float _2077 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2069);
    float _2079 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2071);
    float _2081 = _2039 * 0.693147182464599609375;
    float _2083 = fma(_2059, _2075, 1.570728778839111328125);
    float _2085 = sqrt(_2053);
    float _2087 = -_2017;
    float _2089 = fma(_2057, _2065, _2087);
    float _2091 = _2077 * _2073;
    float _2093 = _2079 * _2073;
    float _2095 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2097 = fma(_2089, 0.5, 0.5);
    float _2099 = fma(_2091, 0.5, 0.5);
    float _2101 = fma(_2093, -0.5, 0.5);
    float _2103 = _2085 * 0.636619746685028076171875;
    float _2105 = -_2083;
    float _2107 = fma(_2103, _2105, 1.0);
    float3 _5539 = float3(_2099, _2101, _2095);
    float _2109 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5539, float3(0.0), isnan(_5539)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5539, float3(0.0), isnan(_5539)), level(0.0)).x;
    float3 _5550 = float3(_2099, _2101, _2095);
    float4 _2112 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5550, float3(0.0), isnan(_5550)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5550, float3(0.0), isnan(_5550)), level(0.0)).xyzw;
    float _2114 = _2112.x;
    float _2116 = _2112.y;
    float _2118 = _2112.z;
    float _2120 = _2112.w;
    float2 _5567 = float2(_2107, _2097);
    float3 _2124 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5567, float2(0.0), isnan(_5567)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5567, float2(0.0), isnan(_5567)), level(0.0)).xyz;
    float _2126 = _2124.x;
    float _2128 = _2124.y;
    float _2130 = _2124.z;
    float _2132 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2134 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2136 = _1617 * _1821;
    float _2138 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2132);
    float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2142 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _2140;
    float _2144 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2134);
    float _2146 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2138);
    float _2148 = fma(_1619, _1817, _2136);
    float _2150 = 1.0 / _2142;
    float _2152 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2154 = _2146 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2156 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2158 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2160 = _2156 || _2158;
    bool _2162 = isnan(0.5);
    bool _2164 = _2160 || _2162;
    float _2166 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2144);
    float _2168 = fma(_1621, _1819, _2148);
    float _2170 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2172 = 1.0 / _2154;
    float _2174 = abs(_2168);
    float _2176 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2178 = _2174 + _2176;
    float _2180 = _2166 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2182 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2170);
    float _2184 = _2180 + _2154;
    float _2186 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2182);
    float _2188 = exp2(_2152);
    float _2190 = _2178 * _2150;
    float _2192 = precise::clamp(_2190, 0.0, 1.0);
    float _2194 = fma(_2029, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2186);
    float _2196 = fma(_2192, -2.0, 3.0);
    float _2198 = _2192 * _2192;
    float _2200 = _2192;
    if (_2164)
    {
        _2200 = 1.0;
    }
    float _2202 = _2200;
    float _2204 = _2184 * _2172;
    float _2206 = _2204 * 0.5;
    float _2208 = _2202;
    if (!_2164)
    {
        float _2210 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2212 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2210);
        float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2216 = _2214 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _2218 = 1.0 / _2212;
        float _2220 = 1.0 / _2216;
        float _2222 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2224 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2226 = fma(_2218, _2222, _2224);
        float _2228 = _2226 * _2220;
        float _2230 = precise::clamp(_2228, 0.0, 1.0);
        _2208 = _2230;
    }
    float _2232 = _2208;
    float _2234 = _2055 * 0.5;
    float _2236 = -_2188;
    float _2238 = _2236 + 1.0;
    float _2240 = _2198 * _2196;
    bool _2242 = _2232 > 0.0;
    bool _2244 = isnan(_2232);
    bool _2246 = _2242 || _2244;
    bool _2248 = isnan(0.0);
    bool _2250 = _2246 || _2248;
    float _2252 = fma(_2079, -0.5, _2234);
    float _2254 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2256 = _2240 * _2232;
    float _2258 = _2194 + _2055;
    float _2260 = _2077 + _2055;
    float _2262 = _2254 * _2109;
    float _2264 = -_2254;
    float _2266 = _2264 + 1.0;
    float _2268 = _2256 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _2077;
    out.gl_Position.y = _2079;
    out.gl_Position.z = _2194;
    out.gl_Position.w = _2055;
    float _2270 = _2120 * _2262;
    float _2272 = _2130 * _2262;
    float _2274 = _2120 * _2266;
    float _2276 = fma(_2126, _2270, _2114);
    float _2278 = _2258 * 0.5;
    float _2280 = _2260 * 0.5;
    float _2282 = _2268 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2284 = fma(_2128, _2270, _2116);
    float _2286 = fma(_2120, _2272, _2118);
    out.m_74.x = _2280;
    out.m_74.y = _2252;
    out.m_74.z = _2278;
    out.m_74.w = _2055;
    out.m_47.x = _2282;
    out.m_76.x = _2276;
    out.m_76.y = _2284;
    out.m_76.z = _2286;
    out.m_76.w = _2274;
    if (_2250)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2288 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2288;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

