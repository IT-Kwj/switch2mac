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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
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
    float4 m_64 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_70 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1912 = false;
    bool _391 = false;
    bool _193 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2564 = as_type<float>(_105);
        out.gl_Position.z = _2564;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2633 = as_type<float>(_143);
        out.gl_Position.z = _2633;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    bool _151 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _153 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _155 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _157 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _159 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _153);
    float _161 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _155);
    float _163 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _157);
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _159);
    float _167 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _161);
    float _169 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _163);
    bool _171 = !_151;
    float _173 = _165;
    float _191;
    if (!_171)
    {
        float _175 = in.m_53.x;
        float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _181 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _183 = _181 * _177;
        float _185 = floor(_183);
        float _187 = -_185;
        float _189 = _183 + _187;
        _191 = _189;
        _193 = true;
    }
    else
    {
        float _195 = float(_89);
        float _197 = 1.0 / _195;
        float _199 = _123 * _197;
        _191 = _199;
    }
    _193 = false;
    float _201 = _191;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = _201 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _213 = _201 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _219 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _223;
    float _227 = 1.0 / _217;
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _231 = 1.0 / _225;
    bool _233 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _235 = isnan(_201);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = 1.0 / _221;
    float _247 = _205 * _227;
    bool _249 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _251 = isnan(_201);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = _209 * _231;
    bool _263 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _265 = isnan(_201);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = -_243;
    float _277 = _275 + 1.0;
    float _279 = _273 * _277;
    float _281 = -_273;
    float _283 = _281 + 1.0;
    float _285 = _213 * _245;
    float _287 = -_259;
    float _289 = _287 + 1.0;
    bool _291 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _293 = isnan(_201);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _311 = _243 * _289;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _321 = fma(_305, _247, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = _301 * _283;
    float _325 = fma(_315, _247, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _327 = fma(_309, _285, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _329 = fma(_319, _285, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _331 = -_301;
    float _333 = _331 + 1.0;
    float _335 = _321 * _323;
    float _337 = _325 * _323;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _339;
    float _343 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _335);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _345;
    float _349 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _337);
    float _351 = fma(_341, _261, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _353 = fma(_327, _279, _343);
    float _355 = fma(_347, _261, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _357 = fma(_329, _279, _349);
    float _359 = fma(_351, _311, _353);
    float _361 = fma(_355, _311, _357);
    float _363 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[146].x, _359);
    float _365 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[146].y, _361);
    bool _367 = !_229;
    float _387;
    float _389;
    if (!_367)
    {
        float _369 = in.m_53.x;
        float _371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _373 = _369 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _377 = _375 * _371;
        float _379 = float(_89);
        float _381 = floor(_377);
        float _383 = -_381;
        float _385 = _377 + _383;
        _387 = _379;
        _389 = _385;
        _391 = true;
    }
    else
    {
        float _393 = float(_89);
        float _395 = 1.0 / _393;
        float _397 = _123 * _395;
        _387 = _393;
        _389 = _397;
    }
    _391 = false;
    float _399 = _387;
    float _401 = _389;
    float _403 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _405 = int(_403);
    float _407 = in.m_53.x;
    float _409 = in.m_53.y;
    float _411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _413 = int(_411);
    float _415 = in.m_53.z;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _419 = as_type<float>(int(gl_VertexIndex));
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _425 = float(_405);
    float _427 = 1.0 / _399;
    float _429 = float(uint(_413));
    float _431 = 1.0 / _425;
    int _433 = ~_413;
    int _435 = _433 + 1;
    int _437 = ~_413;
    int _439 = _437 + 1;
    float _441 = _409 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _443 = _413 == 0;
    int _445 = ~_413;
    int _447 = _445 + 1;
    float _449 = 1.0 / _429;
    float _451 = _431 * _123;
    float _453 = 1.0 / _423;
    int _455 = as_type<int>(_449) + (-2);
    float _457 = trunc(_451);
    int _459 = int(_457);
    float _461 = _407 + _415;
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _465 = _463 != 0;
    float _467 = _461 + (-1.0);
    float _469 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _471 = float(uint(_459));
    float _473 = as_type<float>(_455) * _471;
    float _475 = trunc(_473);
    float _477 = precise::max(_475, 0.0);
    uint _480 = uint(_477);
    int _482 = _435 * int(_480);
    int _484 = _482 + _459;
    float _486 = float(_413);
    float _488 = float(uint(_484));
    float _490 = as_type<float>(_455) * _488;
    float _492 = trunc(_490);
    float _494 = precise::max(_492, 0.0);
    uint _496 = uint(_494);
    int _498 = int(_480) + int(_496);
    bool _500 = !_465;
    float _502 = _500 ? 7.345489978790283203125 : 1.0;
    float _504 = float(_459);
    int _506 = _439 * _498;
    int _508 = _506 + _459;
    bool _510 = _504 >= _486;
    bool _512 = isnan(_504);
    bool _514 = _510 || _512;
    bool _516 = isnan(_486);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    bool _522 = uint(_508) >= uint(_413);
    float _524 = _502 * _407;
    float _526 = trunc(_520);
    int _528 = int(_526);
    bool _530 = !_522;
    int _532 = _530 ? 0 : (-1);
    int _534 = ~_498;
    int _536 = _534 + _532;
    int _538 = _536 + 1;
    float _540 = floor(_524);
    int _542 = _413 * _538;
    int _544 = _542 + _459;
    int _546 = ~_528;
    int _548 = _546 + 1;
    int _550 = _548 + 1;
    bool _552 = !_443;
    int _554 = _552 ? _544 : (-1);
    int _556 = _554 * _550;
    float _558 = -_540;
    float _560 = _524 + _558;
    int _562 = _413 + (-1);
    float _564 = _560 * _486;
    float _566 = _486 * _123;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _570 = _568 != 0;
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _574 = _572 != 0;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _578 = _576 != 0;
    float _580 = trunc(_564);
    int _582 = int(_580);
    float _584 = _566 * _427;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _588 = _586 != 0;
    int _590 = _528 * _562;
    int _592 = _590 + _556;
    bool _594 = !_574;
    int _596 = _594 ? 0 : 1;
    bool _598 = !_570;
    int _600 = _598 ? 0 : 1;
    float _602 = trunc(_584);
    int _604 = int(_602);
    bool _606 = !_588;
    int _608 = _606 ? 0 : 1;
    int _610 = abs(_596);
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _614 = _612 != 0;
    bool _616 = !_578;
    int _618 = _616 ? 0 : 1;
    int _620 = _592 * _610;
    int _622 = abs(_600);
    int _624 = abs(_608);
    bool _626 = !_614;
    int _628 = _626 ? 0 : 1;
    int _630 = abs(_618);
    int _632 = _582 * _624;
    int _634 = _632 + _459;
    int _636 = abs(_628);
    int _638 = _604 * _622;
    int _640 = _638 + _620;
    int _642 = ~_413;
    int _644 = _642 + 1;
    int _646 = _634 * _630;
    int _648 = _646 + _640;
    int _650 = _582 * _636;
    int _652 = _650 + _648;
    int _654 = ~_413;
    int _656 = _654 + 1;
    float _658 = float(uint(_652));
    float _660 = as_type<float>(_455) * _658;
    float _662 = trunc(_660);
    float _664 = precise::max(_662, 0.0);
    uint _666 = uint(_664);
    int _668 = _656 * int(_666);
    int _670 = _668 + _652;
    float _672 = float(uint(_670));
    float _674 = as_type<float>(_455) * _672;
    float _676 = trunc(_674);
    float _678 = precise::max(_676, 0.0);
    uint _680 = uint(_678);
    float _682 = _415 * 2.0;
    float _684 = floor(_682);
    int _686 = int(_666) + int(_680);
    float _688 = _407 * 2.0;
    int _690 = _644 * _686;
    int _692 = _690 + _652;
    float _694 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _696 = log2(_694);
    bool _698 = uint(_692) >= uint(_413);
    bool _700 = !_698;
    int _702 = _700 ? 0 : (-1);
    float _704 = floor(_688);
    int _706 = ~_686;
    int _708 = _706 + _702;
    int _710 = _708 + 1;
    float _712 = _696 * _123;
    int _714 = _413 * _710;
    int _716 = _714 + _652;
    float _718 = _409 * 2.0;
    float _720 = exp2(_712);
    bool _722 = !_443;
    int _724 = _722 ? _716 : (-1);
    bool _726 = _704 > 0.0;
    int _728 = _724 & 3;
    bool _730 = _728 != 0;
    float _732 = floor(_718);
    int _734 = _724 & 3;
    bool _736 = _734 != 0;
    float _738 = in.m_58.x;
    float _740 = in.m_58.y;
    bool _742 = uint(_728) > 1u;
    bool _744 = _728 != 3;
    bool _746 = _704 >= 0.0;
    bool _748 = isnan(_704);
    bool _750 = _746 || _748;
    bool _752 = isnan(0.0);
    bool _754 = _750 || _752;
    float _756 = -_720;
    float _758 = _756 + 1.0;
    int _760 = _736 ? 0 : 1;
    bool _762 = uint(_728) >= 2u;
    int _764 = _754 ? 0 : 1;
    int _766 = _762 ? 0 : 1;
    bool _768 = _732 > 0.0;
    bool _770 = _732 >= 0.0;
    bool _772 = isnan(_732);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.0);
    bool _778 = _774 || _776;
    int _780 = ~_760;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    int _786 = ~_766;
    int _788 = _786 + 1;
    int _790 = _788 + 1;
    int _792 = _784;
    int _794 = _790;
    if (!_742)
    {
        int _796 = ~_760;
        int _798 = _796 + 1;
        _792 = _798;
    }
    int _800 = _792;
    float _802 = _363 * _738;
    int _804 = ~_764;
    int _806 = _804 + 1;
    int _808 = _806 + 1;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _812 = _808;
    if (_744)
    {
        int _814 = ~_766;
        int _816 = _814 + 1;
        _794 = _816;
    }
    int _818 = _794;
    float _820 = _365 * _740;
    int _822 = _778 ? 0 : 1;
    float _824 = _802 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (!_726)
    {
        int _826 = ~_764;
        int _828 = _826 + 1;
        _812 = _828;
    }
    int _830 = _812;
    float _832 = _820 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _834 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _836 = isnan(0.0);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _842 = _838 || _840;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _846 = _844 != 0;
    bool _848 = _684 >= 0.0;
    bool _850 = isnan(_684);
    bool _852 = _848 || _850;
    bool _854 = isnan(0.0);
    bool _856 = _852 || _854;
    bool _858 = _684 > 0.0;
    int _860 = ~_822;
    int _862 = _860 + 1;
    int _864 = _862 + 1;
    bool _866 = !_846;
    int _868 = _866 ? 0 : 1;
    float _870 = _842 ? _758 : 0.0;
    int _872 = _856 ? 0 : 1;
    int _874 = _864;
    if (!_768)
    {
        int _876 = ~_822;
        int _878 = _876 + 1;
        _874 = _878;
    }
    int _880 = _874;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _884 = _882 != 0;
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _888 = _886 != 0;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _892 = _890 != 0;
    float _894 = in.m_44.x;
    float _896 = in.m_44.y;
    float _898 = in.m_44.z;
    int _900 = ~_872;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    bool _906 = !_888;
    int _908 = _906 ? 0 : 1;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _912 = _910 != 0;
    int _914 = _904;
    if (!_858)
    {
        int _916 = ~_872;
        int _918 = _916 + 1;
        _914 = _918;
    }
    int _920 = _914;
    int _922 = as_type<int>(_419) & 1;
    bool _924 = _922 != 0;
    int _926 = as_type<int>(_419) & 2;
    bool _928 = _926 != 0;
    float _930 = _407 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _936 = -_810;
    float _938 = fma(_930, 2.0, _936);
    float _940 = 1.0 / _934;
    bool _942 = !_884;
    int _944 = _942 ? 0 : 1;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _946;
    float _950 = float(_830);
    int _952 = abs(_944);
    float _954 = _896 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _956 = _896 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _958 = fma(_441, -2.0, _417);
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _964 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[4].x, _954);
    float _966 = float(uint(_634));
    float _968 = _896 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _970 = _409 + _415;
    float _972 = _962 * _453;
    float _974 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[5].x, _956);
    float _976 = as_type<float>(_455) * _966;
    float _978 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[6].x, _968);
    float _980 = _948 * _940;
    float _982 = _970 + (-1.0);
    float _984 = _407 + _409;
    float _986 = trunc(_976);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    float _992 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _994 = _984 + (-1.0);
    int _996 = abs(_908);
    float _998 = fma(_898, (*spvDescriptorSet0.vp_c10)._m0[5].z, _974);
    float _1000 = fma(_898, (*spvDescriptorSet0.vp_c10)._m0[4].z, _964);
    float _1002 = float(_952);
    float _1004 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1006 = float(_920);
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1010 = _401 + _1008;
    float _1012 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _958);
    float _1014 = _415 + (-0.5);
    float _1016 = _1002 * _1006;
    float _1018 = float(_996);
    int _1020 = _447 * int(_990);
    int _1022 = _1020 + _634;
    float _1024 = fma(_980, _1010, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1026 = _1000 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1028 = _724 >> 31;
    float _1030 = _1018 * _950;
    float _1032 = float(uint(_1022));
    float _1034 = fma(_898, (*spvDescriptorSet0.vp_c10)._m0[6].z, _978);
    bool _1036 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1038 = isnan(1.0);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1044 = _1040 || _1042;
    float _1046 = in.m_60.x;
    float _1048 = in.m_60.y;
    float _1050 = in.m_60.z;
    float _1052 = as_type<float>(_455) * _1032;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1056 = 1.0 + _1054;
    int _1058 = _1028 & 3;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1062 = !_892;
    int _1064 = _1062 ? 0 : 1;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1068 = 1.0 / _1056;
    int _1070 = _724 + _1058;
    float _1072 = -_123;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[76].x, _938);
    float _1076 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1066);
    float _1078 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1060);
    int _1080 = _1070 >> 2;
    float _1082 = _1034 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1084 = abs(_1064);
    float _1086 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1076);
    int _1088 = _1080 << 4;
    int _1090 = _1088 + 368;
    float _1092 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1078);
    float _1094 = float(_880);
    float _1096 = _1016 * (-2.0);
    float _1098 = float(_1084);
    float _1100 = _1030 * (-2.0);
    uint _1102 = uint(int(uint(_1090) >> uint(2)));
    uint _1104 = uint(int(uint(int(_1102)) >> uint(2)));
    int _1106 = int(_1102) & 3;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[int(_1104)][_1106];
    int _1110 = int(_1102) + 1;
    uint _1112 = uint(int(uint(_1110) >> uint(2)));
    int _1114 = _1110 & 3;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[int(_1112)][_1114];
    if (_1044)
    {
        float _1118 = _870 * _1068;
        _127 = _1118;
    }
    float _1120 = _127;
    float _1122 = fma(_1096, _1046, _1046);
    float _1124 = _1098 * _1094;
    float _1126 = fma(_1004, _1096, _1004);
    float _1128 = fma(_1100, _1048, _1048);
    float _1130 = trunc(_1052);
    float _1132 = precise::max(_1130, 0.0);
    uint _1134 = uint(_1132);
    float _1136 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1138 = _1090 + 8;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    uint _1142 = uint(int(uint(int(_1140)) >> uint(2)));
    int _1144 = int(_1140) & 3;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[int(_1142)][_1144];
    int _1148 = int(_1140) + 1;
    uint _1150 = uint(int(uint(_1148) >> uint(2)));
    int _1152 = _1148 & 3;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[int(_1150)][_1152];
    bool _1156 = !_730;
    int _1158 = _1156 ? 0 : 1;
    float _1160 = fma(_992, _1100, _992);
    bool _1162 = _728 != 3;
    float _1164 = _1136 * _407;
    float _1166 = _407 + (-0.5);
    float _1168 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1170 = int(_1168);
    bool _1172 = !_1162;
    int _1174 = _1172 ? 0 : (-1);
    bool _1176 = _407 > 0.5;
    float _1178 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1122);
    int _1180 = abs(_1174);
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1184 = _1182 != 0;
    float _1186 = fma(_1126, _1120, _1178);
    int _1188 = int(_990) + int(_1134);
    int _1190 = ~_413;
    int _1192 = _1190 + 1;
    float _1194 = _1186 * 0.15915493667125701904296875;
    int _1196 = abs(_1170);
    int _1198 = _1192 * _1188;
    int _1200 = _1198 + _634;
    float _1202 = float(uint(_1170));
    float _1204 = _1124 * (-2.0);
    bool _1206 = uint(_1200) >= uint(_413);
    float _1208 = float(uint(_1196));
    float _1210 = fma(_1204, _1050, _1050);
    int _1212 = abs(_800);
    float _1214 = fma(_469, _1204, _469);
    bool _1216 = !_1206;
    int _1218 = _1216 ? 0 : (-1);
    float _1220 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1210);
    int _1222 = ~_1212;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    float _1228 = 1.0 / _1202;
    int _1230 = abs(_1158);
    float _1232 = fma(_1214, _1120, _1220);
    bool _1234 = _409 > 0.5;
    float _1236 = _409 + (-0.5);
    int _1238 = ~_1188;
    int _1240 = _1238 + _1218;
    int _1242 = _1240 + 1;
    int _1244 = _1226 * as_type<int>(_1116);
    int _1246 = abs(_818);
    float _1248 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1128);
    int _1250 = ~_1230;
    int _1252 = _1250 + 1;
    int _1254 = _1252 + 1;
    float _1256 = 1.0 / _1208;
    int _1258 = abs(_868);
    float _1260 = fma(_1160, _1120, _1248);
    int _1262 = _1254 * as_type<int>(_1108);
    int _1264 = _1262 + _1244;
    int _1266 = ~_1246;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    float _1272 = _1260 * 0.15915493667125701904296875;
    int _1274 = ~_1180;
    int _1276 = _1274 + 1;
    int _1278 = _1276 + 1;
    float _1280 = _1232 * 0.15915493667125701904296875;
    int _1282 = ~_1258;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    int _1288 = _1270 * as_type<int>(_1146);
    int _1290 = _1288 + _1264;
    float _1292 = _1194 * 6.283185482025146484375;
    float _1294 = sin(_1292);
    int _1296 = as_type<int>(_1228) + (-2);
    int _1298 = _1278 * as_type<int>(_1154);
    int _1300 = _1298 + _1290;
    bool _1302 = !_928;
    float _1304 = _1302 ? (-0.5) : 0.5;
    int _1306 = _413 * _1242;
    int _1308 = _1306 + _634;
    bool _1310 = !_924;
    float _1312 = _1310 ? (-0.5) : 0.5;
    int _1314 = _1300 * _1286;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1318 = _401 + _1316;
    float _1320 = _1194 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    bool _1324 = !_443;
    int _1326 = _1324 ? _1308 : (-1);
    float _1328 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1312);
    float _1330 = fma(_972, _1318, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1332 = as_type<int>(_1256) + (-2);
    int _1334 = _1326 * _1258;
    int _1336 = _1334 + _1314;
    float _1338 = _824 * _1328;
    float _1340 = _1272 * 6.283185482025146484375;
    float _1342 = sin(_1340);
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1304);
    int _1346 = ~_1196;
    int _1348 = _1346 + 1;
    int _1350 = abs(_1336);
    float _1352 = _832 * _1344;
    float _1354 = float(uint(_1336));
    float _1356 = _1280 * 6.283185482025146484375;
    float _1358 = cos(_1356);
    float _1360 = as_type<float>(_1296) * _1354;
    bool _1362 = _1170 == 0;
    float _1364 = float(uint(_1350));
    float _1366 = _1272 * 6.283185482025146484375;
    float _1368 = cos(_1366);
    float _1370 = _1322 * _1342;
    float _1372 = _1294 * _1342;
    float _1374 = _1280 * 6.283185482025146484375;
    float _1376 = sin(_1374);
    float _1378 = _1342 * _1358;
    float _1380 = _1294 * _1368;
    float _1382 = as_type<float>(_1332) * _1364;
    float _1384 = _1322 * _1368;
    float _1386 = _1368 * _1358;
    float _1388 = _1358 * _1352;
    float _1390 = trunc(_1360);
    float _1392 = precise::max(_1390, 0.0);
    uint _1394 = uint(_1392);
    float _1396 = -_1352;
    float _1398 = _1376 * _1396;
    float _1400 = -_1370;
    float _1402 = fma(_1376, _1380, _1400);
    float _1404 = -_1380;
    float _1406 = fma(_1376, _1370, _1404);
    float _1408 = fma(_1376, _1384, _1372);
    float _1410 = fma(_1376, _1372, _1384);
    float _1412 = trunc(_1382);
    float _1414 = precise::max(_1412, 0.0);
    uint _1416 = uint(_1414);
    int _1418 = ~_1170;
    int _1420 = _1418 + 1;
    float _1422 = fma(_1386, _1338, _1398);
    int _1424 = ~_1196;
    int _1426 = _1424 + 1;
    float _1428 = _1322 * _1388;
    float _1430 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1432 = _1294 * _1388;
    float _1434 = fma(_1408, _1338, _1428);
    float _1436 = fma(_1378, _1430, _1422);
    float _1438 = fma(_1402, _1338, _1432);
    bool _1440 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1442 = isnan(_401);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    int _1452 = _1420 * int(_1394);
    int _1454 = _1452 + _1336;
    float _1456 = fma(_1406, _1430, _1434);
    float _1458 = fma(_1410, _1430, _1438);
    bool _1460 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1462 = isnan(_401);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1468 = _1464 || _1466;
    float _1470 = float(_1468);
    int _1472 = _1426 * int(_1416);
    int _1474 = _1472 + _1350;
    float _1476 = float(uint(_1454));
    float _1478 = -_1450;
    float _1480 = _1478 + 1.0;
    float _1482 = trunc(_1164);
    int _1484 = int(_1482);
    float _1486 = float(uint(_1474));
    float _1488 = as_type<float>(_1296) * _1476;
    float _1490 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1492 = -_1312;
    int _1494 = _1176 ? as_type<int>(_1492) : as_type<int>(_1312);
    float _1496 = as_type<float>(_1332) * _1486;
    bool _1498 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1500 = isnan(_401);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1506 = _1502 || _1504;
    float _1508 = float(_1506);
    float _1510 = _1470 * _1480;
    float _1512 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1514 = trunc(_1488);
    float _1516 = precise::max(_1514, 0.0);
    uint _1518 = uint(_1516);
    float _1520 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1490);
    float _1522 = -_1470;
    float _1524 = _1522 + 1.0;
    float _1526 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1512);
    bool _1528 = !_1184;
    float _1530 = _1528 ? _1312 : as_type<float>(_1494);
    float _1532 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1520);
    float _1534 = _1508 * _1524;
    float _1536 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1526);
    float _1538 = trunc(_1496);
    float _1540 = precise::max(_1538, 0.0);
    uint _1542 = uint(_1540);
    float _1544 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1546 = _1024 * _1534;
    float _1548 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1550 = _1484 << 4;
    int _1552 = _1550 + 1968;
    float _1554 = _1082 + _1544;
    float _1556 = _1026 + _1548;
    int _1558 = int(_1394) + int(_1518);
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1562 = _1554 + _1560;
    int _1564 = _1552 + 8;
    uint _1566 = uint(int(uint(_1564) >> uint(2)));
    uint _1568 = uint(int(uint(int(_1566)) >> uint(2)));
    int _1570 = int(_1566) & 3;
    float _1572 = (*spvDescriptorSet0.vp_c9)._m0[int(_1568)][_1570];
    float _1574 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1576 = _1556 + _1574;
    float _1578 = _1562 * _1562;
    float _1580 = _1576 * _1576;
    int _1582 = int(_1416) + int(_1542);
    float _1584 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1586 = ~_1170;
    int _1588 = _1586 + 1;
    float _1590 = _1580 + _1578;
    uint _1592 = uint(int(uint(_1552) >> uint(2)));
    uint _1594 = uint(int(uint(int(_1592)) >> uint(2)));
    int _1596 = int(_1592) & 3;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[int(_1594)][_1596];
    int _1600 = int(_1592) + 1;
    uint _1602 = uint(int(uint(_1600) >> uint(2)));
    int _1604 = _1600 & 3;
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[int(_1602)][_1604];
    float _1608 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1584);
    float _1610 = -_1304;
    int _1612 = _1234 ? as_type<int>(_1610) : as_type<int>(_1304);
    float _1614 = sqrt(_1590);
    int _1616 = _1588 * _1558;
    int _1618 = _1616 + _1336;
    float _1620 = -_1508;
    float _1622 = _1620 + 1.0;
    int _1624 = _1348 * _1582;
    int _1626 = _1624 + _1350;
    bool _1628 = !_912;
    float _1630 = _1628 ? _1304 : as_type<float>(_1612);
    float _1632 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1608);
    bool _1634 = uint(_1618) >= uint(_1170);
    float _1636 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1546);
    int _1638 = _1336 ^ _1170;
    float _1640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1642 = uint(_1626) >= uint(_1196);
    bool _1644 = !_1634;
    int _1646 = _1644 ? 0 : (-1);
    uint _1648 = uint(int(uint(_1638) >> uint(31)));
    bool _1650 = _1614 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1654 = !_1642;
    int _1656 = _1654 ? 0 : (-1);
    int _1658 = ~int(_1648);
    int _1660 = _1658 + 1;
    float _1662 = _998 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1664 = _1632 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1666 = ~_1656;
    int _1668 = _1582 + _1666;
    int _1670 = _1668 + 1;
    int _1672 = ~_1558;
    int _1674 = _1672 + _1646;
    int _1676 = _1674 + 1;
    float _1678 = _1662 + _1664;
    int _1680 = _1670 ^ _1660;
    bool _1682 = _1170 == 0;
    int _1684 = _1170 * _1676;
    int _1686 = _1684 + _1336;
    int _1688 = ~_1660;
    int _1690 = _1688 + _1680;
    int _1692 = _1690 + 1;
    float _1694 = as_type<float>(_1336);
    float _1696 = as_type<float>(_1170);
    float _1698 = as_type<float>(_1676);
    float _1700 = _1580;
    float _1702 = _1578;
    if (!_1650)
    {
        _1694 = _1556;
    }
    float _1704 = _1694;
    float _1706 = _1704;
    if (!_1650)
    {
        _1696 = _1554;
    }
    float _1708 = _1696;
    float _1710 = _1708;
    if (!_1650)
    {
        _1698 = _1678;
    }
    float _1712 = _1698;
    bool _1714 = !_1650;
    float _1716 = _1712;
    if (!_1714)
    {
        float _1718 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1720 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1722 = _1614 + _1720;
        float _1724 = rsqrt(_1590);
        float _1726 = _1722 * _1718;
        float _1728 = _1678 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1730 = _1726 * 0.15915493667125701904296875;
        float _1732 = _1730 * 6.283185482025146484375;
        float _1734 = sin(_1732);
        float _1736 = _1730 * 6.283185482025146484375;
        float _1738 = cos(_1736);
        float _1740 = fma(_1734, _1728, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1742 = _1724 * _1740;
        float _1744 = _1738 + (-1.0);
        float _1746 = fma(_1576, _1742, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1748 = fma(_1562, _1742, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1750 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1754 = _1746 + _1752;
        float _1756 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1758 = _1748 + _1756;
        float _1760 = fma(_1678, _1738, _1750);
        float _1762 = _1754 * _1754;
        float _1764 = _1758 * _1758;
        _1716 = _1760;
        _1700 = _1762;
        _1702 = _1764;
        _1706 = _1746;
        _1710 = _1748;
    }
    float _1766 = _1716;
    float _1768 = _1700;
    float _1770 = _1702;
    float _1772 = _1706;
    float _1774 = _1710;
    bool _1776 = !_1682;
    int _1778 = _1776 ? _1686 : (-1);
    float _1780 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1782 = !_1362;
    int _1784 = _1782 ? _1692 : (-1);
    float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1788 = _1766 + _1786;
    float _1790 = float(_1778);
    float _1792 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1794 = float(_1784);
    float _1796 = fma(_1788, _1788, _1768);
    float _1798 = fma(_1330, _1510, _1636);
    float _1800 = fma(_1780, _1790, _1074);
    float _1802 = _1530 + 0.5;
    float _1804 = -_1012;
    float _1806 = fma(_1792, _1794, _1804);
    float _1808 = _1630 + (-0.5);
    float _1810 = _1796 + _1770;
    float _1812 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1798);
    float _1814 = fma(_1780, _1802, _1800);
    float _1816 = -_1792;
    float _1818 = fma(_1816, _1808, _1806);
    float _1820 = _1598 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1822 = -_1086;
    float _1824 = _1822 + 1.0;
    float _1826 = sqrt(_1810);
    float _1828 = _1606 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1830 = -_1824;
    float _1832 = fma(_1530, _1830, _1814);
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1840 = _1572 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1842 = -_1092;
    float _1844 = _1842 + 1.0;
    float _1846 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1850 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1852 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1854 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1856 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1858 = _1840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1860 = _1812 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1862 = fma(_1630, _1844, _1818);
    bool _1864 = _1826 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1866 = isnan(_1826);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1872 = _1868 || _1870;
    out.m_62.x = _1856;
    out.m_62.y = _1846;
    out.m_62.z = _1858;
    out.m_62.w = _1848;
    out.m_64.x = _1850;
    out.m_64.y = _1852;
    out.m_64.z = _1854;
    out.m_64.w = _1860;
    out.m_66.x = _1832;
    out.m_66.y = _1862;
    float _1874 = _1820;
    float _1876 = _1862;
    if (!_1872)
    {
        _1874 = 1.0;
    }
    float _1878 = _1874;
    bool _1880 = !_1872;
    float _1882 = _1878;
    if (!_1880)
    {
        bool _1884 = _1826 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1886 = isnan(_1826);
        bool _1888 = _1884 || _1886;
        bool _1890 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1892 = _1888 || _1890;
        if (!_1892)
        {
            float _1894 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1896 = _1826 + _1894;
            float _1898 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1900 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1898;
            float _1902 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1904 = _1902 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1906 = 1.0 / _1900;
            float _1908 = _1896 * _1906;
            float _1910 = fma(_1908, _1904, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1882 = _1910;
            _1912 = true;
        }
        else
        {
            bool _1914 = _1826 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1916 = isnan(_1826);
            bool _1918 = _1914 || _1916;
            bool _1920 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1922 = _1918 || _1920;
            if (!_1922)
            {
                float _1924 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1926 = _1826 + _1924;
                float _1928 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1930 = _1928 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1932 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1934 = _1932 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1936 = 1.0 / _1930;
                float _1938 = _1926 * _1936;
                float _1940 = fma(_1938, _1934, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1882 = _1940;
                _1912 = true;
            }
            else
            {
                _1882 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1912 = false;
    float _1942 = _1882;
    float _1944 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1946 = _1766 + _1944;
    float _1948 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1950 = _1772 + _1948;
    float _1952 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1954 = _1774 + _1952;
    float _1956 = fma(_1946, _1942, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1958 = fma(_1950, _1942, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1960 = fma(_1954, _1942, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1962 = -_1662;
    float _1964 = _1962 + _1956;
    float _1966 = -_1026;
    float _1968 = _1966 + _1958;
    float _1970 = -_1082;
    float _1972 = _1970 + _1960;
    float _1974 = _1964 * _1964;
    float _1976 = fma(_1968, _1968, _1974);
    float _1978 = fma(_1972, _1972, _1976);
    float _1980 = sqrt(_1978);
    bool _1982 = _1980 > 0.0;
    bool _1984 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1986 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan(0.5);
    bool _1992 = _1988 || _1990;
    float _1994 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1996 = _1958;
    float _1998 = _1964;
    float _2000 = _1956;
    if (!_1982)
    {
        _1876 = _1956;
    }
    float _2002 = _1876;
    float _2004 = _2002;
    if (!_1982)
    {
        _1994 = _1960;
    }
    float _2006 = _1994;
    bool _2008 = !_1982;
    float _2010 = _2006;
    if (!_2008)
    {
        float _2012 = _167 * _167;
        float _2014 = rsqrt(_1978);
        float _2016 = fma(_165, _165, _2012);
        float _2018 = fma(_169, _169, _2016);
        float _2020 = sqrt(_2018);
        float _2022 = _1968 * _2014;
        float _2024 = _1964 * _2014;
        float _2026 = _1972 * _2014;
        bool _2028 = _2020 > 0.0;
        float _2030 = _2020;
        float _2032 = _2014;
        if (!_2028)
        {
            _2030 = _1956;
        }
        float _2034 = _2030;
        _2004 = _2034;
        if (!_2028)
        {
            _2032 = _1960;
        }
        float _2036 = _2032;
        bool _2038 = !_2028;
        _2010 = _2036;
        if (!_2038)
        {
            float _2040 = rsqrt(_2018);
            float _2042 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2044 = _167 * _2040;
            float _2046 = _165 * _2040;
            float _2048 = _2024 * _2044;
            float _2050 = _169 * _2040;
            float _2052 = fma(_2022, _2046, _2048);
            float _2054 = _2042 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2056 = fma(_2026, _2050, _2052);
            float _2058 = _2056 * _2054;
            float _2060 = fma(_165, _2058, _1958);
            float _2062 = fma(_167, _2058, _1956);
            float _2064 = fma(_169, _2058, _1960);
            _1996 = _2060;
            _2010 = _2064;
            _2004 = _2062;
            _1998 = _2058;
        }
    }
    float _2066 = _1996;
    float _2068 = _2010;
    float _2070 = _2004;
    float _2072 = _1998;
    float _2074 = _2070;
    float _2076 = _2068;
    float _2078 = _2066;
    if (_1992)
    {
        _173 = _2066;
    }
    float _2080 = _173;
    float _2082 = _2080;
    if (!_1992)
    {
        float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2086 = _1662 + _2084;
        float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2090 = _1026 + _2088;
        float _2092 = -_1082;
        float _2094 = _2092 + _2068;
        float _2096 = _2086 * _2086;
        float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2100 = _1082 + _2098;
        float _2102 = fma(_2090, _2090, _2096);
        float _2104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2106 = fma(_2100, _2100, _2102);
        float _2108 = -_1026;
        float _2110 = _2108 + _2066;
        float _2112 = sqrt(_2106);
        float _2114 = precise::min(_2112, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2116 = _2114 * _2104;
        float _2118 = -_1662;
        float _2120 = _2118 + _2070;
        float _2122 = fma(_2110, _2116, _1026);
        float _2124 = fma(_2120, _2116, _1662);
        float _2126 = fma(_2094, _2116, _1082);
        _2074 = _2124;
        _2082 = _2122;
        _2076 = _2126;
    }
    float _2128 = _2074;
    float _2130 = _2082;
    float _2132 = _2076;
    float _2134 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2136 = _2128 + _2134;
    float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2140 = _2130 + _2138;
    float _2142 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2144 = _2132 + _2142;
    float _2146 = _2136 * _2136;
    float _2148 = fma(_2140, _2140, _2146);
    float _2150 = fma(_2144, _2144, _2148);
    float _2152 = rsqrt(_2150);
    float _2154 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2156 = _2140 * _2154;
    float _2158 = _2144 * _2154;
    float _2160 = _2156 * _2156;
    float _2162 = _2158 * _2158;
    float _2164 = _2160 + _2162;
    float _2166 = sqrt(_2164);
    bool _2168 = _2166 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2172 = _2166 + _2170;
    float _2174 = _2152;
    float _2176 = _2172;
    float _2178 = _2154;
    float _2180 = _2156;
    if (_2168)
    {
        float _2182 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2174 = _2182;
    }
    float _2184 = _2174;
    if (_2168)
    {
        float _2186 = rsqrt(_2164);
        _2078 = _2186;
    }
    float _2188 = _2078;
    float _2190 = _2188;
    if (_2168)
    {
        float _2192 = _2172 * _2184;
        _2176 = _2192;
    }
    float _2194 = _2176;
    if (_2168)
    {
        float _2196 = _2194 * 0.15915493667125701904296875;
        _2000 = _2196;
    }
    float _2198 = _2000;
    float _2200 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2202 = _2072;
    if (_2168)
    {
        float _2204 = _2198 * 6.283185482025146484375;
        float _2206 = sin(_2204);
        _2202 = _2206;
    }
    float _2208 = _2202;
    float _2210 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2212 = precise::max(0.0, _2210);
    float _2214 = _2144;
    float _2216 = _2212;
    float _2218 = _2210;
    if (_2168)
    {
        float _2220 = _2198 * 6.283185482025146484375;
        float _2222 = cos(_2220);
        _2214 = _2222;
    }
    float _2224 = _2214;
    float _2226 = -_2154;
    float _2228 = -_2212;
    float _2230 = fma(_2136, _2226, _2228);
    float _2232 = _2230;
    if (_2168)
    {
        float _2234 = _2230 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2216 = _2234;
    }
    float _2236 = _2216;
    float _2238 = sqrt(_2150);
    float _2240 = _2208;
    float _2242 = _2236;
    if (_2168)
    {
        float _2244 = fma(_2208, _2236, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2240 = _2244;
    }
    float _2246 = _2240;
    float _2248 = _2246;
    if (_2168)
    {
        float _2250 = _2224 + (-1.0);
        _2218 = _2250;
    }
    float _2252 = _2218;
    float _2254 = _2252;
    if (_2168)
    {
        float _2256 = _2188 * _2246;
        _2178 = _2256;
    }
    float _2258 = _2178;
    if (!_2168)
    {
        _2190 = _2230;
    }
    float _2260 = _2190;
    float _2262 = _2260;
    if (_2168)
    {
        float _2264 = _2252 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2242 = _2264;
    }
    float _2266 = _2242;
    if (_2168)
    {
        float _2268 = _2156 * _2258;
        _2180 = _2268;
    }
    float _2270 = _2180;
    if (!_2168)
    {
        _2248 = _2158;
    }
    float _2272 = _2248;
    float _2274 = _2272;
    if (_2168)
    {
        float _2276 = _2158 * _2258;
        _2274 = _2276;
    }
    float _2278 = _2274;
    if (!_2168)
    {
        _2254 = _2160;
    }
    float _2280 = _2254;
    float _2282 = _2280;
    if (_2168)
    {
        float _2284 = fma(_2230, _2224, _2266);
        _2262 = _2284;
    }
    float _2286 = _2262;
    if (_2168)
    {
        float _2288 = _2270 * _2270;
        _2282 = _2288;
    }
    float _2290 = _2282;
    if (!_2168)
    {
        _2232 = _2162;
    }
    float _2292 = _2232;
    float _2294 = _2292;
    if (_2168)
    {
        float _2296 = _2278 * _2278;
        _2294 = _2296;
    }
    float _2298 = _2294;
    float _2300 = fma(_2286, _2286, _2290);
    float _2302 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2304 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2306 = _2300 + _2298;
    float _2308 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2302);
    float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2312 = fma(_2238, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2310);
    float _2314 = precise::clamp(_2312, 0.0, 1.0);
    float _2316 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2318 = rsqrt(_2306);
    float _2320 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2308);
    float _2322 = -_2314;
    float _2324 = _2322 + 1.0;
    float _2326 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2328 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2316);
    float _2330 = _2320 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2332 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2304);
    float _2334 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2326);
    float _2336 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2328);
    float _2338 = abs(_2324);
    float _2340 = log2(_2338);
    float _2342 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2344 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2334);
    float _2346 = _2336 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2348 = -_2342;
    float _2350 = fma(_2348, _2200, 1.0);
    float _2352 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2332);
    float _2354 = _2344 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2356 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2358 = _2318 * _2270;
    float _2360 = _2318 * _2286;
    float _2362 = _2318 * _2278;
    float _2364 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2356);
    float _2366 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2368 = _2352 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2370 = log2(_2350);
    float _2372 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2364);
    float _2374 = -_2366;
    float _2376 = fma(_2360, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2374);
    float _2378 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2380 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2382 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2372);
    float _2384 = -_2362;
    float _2386 = fma(_2384, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2376);
    float _2388 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2390 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2380);
    float _2392 = exp2(_2378);
    float _2394 = fma(_2386, -0.5, 0.5);
    float _2396 = fma(_2386, 0.5, 0.5);
    float _2398 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2388);
    float _2400 = _2360 + 1.0;
    float _2402 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2390);
    float _2404 = fma(_2396, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2406 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2398);
    float _2408 = 1.0 / _2382;
    float _2410 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2402);
    float _2412 = fma(_2396, _2404, -0.212114393711090087890625);
    float _2414 = _2370 * 0.693147182464599609375;
    float _2416 = fma(_2396, _2412, 1.570728778839111328125);
    float _2418 = sqrt(_2394);
    float _2420 = -_2360;
    float _2422 = fma(_2392, _2400, _2420);
    float _2424 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2406);
    float _2426 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2428 = fma(_2422, 0.5, 0.5);
    float _2430 = _2424 * _2408;
    float _2432 = _2410 * _2408;
    float _2434 = fma(_2430, 0.5, 0.5);
    float _2436 = fma(_2432, -0.5, 0.5);
    float _2438 = _2418 * 0.636619746685028076171875;
    float _2440 = -_2416;
    float _2442 = fma(_2438, _2440, 1.0);
    float3 _6130 = float3(_2434, _2436, _2426);
    float _2444 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6130, float3(0.0), isnan(_6130)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6130, float3(0.0), isnan(_6130)), level(0.0)).x;
    float3 _6141 = float3(_2434, _2436, _2426);
    float4 _2447 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6141, float3(0.0), isnan(_6141)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6141, float3(0.0), isnan(_6141)), level(0.0)).xyzw;
    float _2449 = _2447.x;
    float _2451 = _2447.y;
    float _2453 = _2447.z;
    float _2455 = _2447.w;
    float2 _6158 = float2(_2442, _2428);
    float3 _2459 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6158, float2(0.0), isnan(_6158)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6158, float2(0.0), isnan(_6158)), level(0.0)).xyz;
    float _2461 = _2459.x;
    float _2463 = _2459.y;
    float _2465 = _2459.z;
    float _2467 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2469 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2471 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2469);
    float _2473 = exp2(_2467);
    float _2475 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2471);
    float _2477 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2475);
    float _2479 = _2477 + _2382;
    out.gl_Position.x = _2424;
    out.gl_Position.y = _2410;
    out.gl_Position.z = _2477;
    out.gl_Position.w = _2382;
    float _2481 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2483 = _2479 * 0.5;
    float _2485 = -_2473;
    float _2487 = _2485 + 1.0;
    out.m_47.x = _2481;
    float _2489 = _2487 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _2483;
    out.m_68.w = _2382;
    float _2491 = _2489 * _2444;
    float _2493 = -_2489;
    float _2495 = _2493 + 1.0;
    float _2497 = _2455 * _2491;
    float _2499 = _2465 * _2491;
    float _2501 = _2455 * _2495;
    float _2503 = fma(_2461, _2497, _2449);
    float _2505 = fma(_2463, _2497, _2451);
    float _2507 = fma(_2455, _2499, _2453);
    out.m_70.x = _2503;
    out.m_70.y = _2505;
    out.m_70.z = _2507;
    out.m_70.w = _2501;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1912 = false;
    bool _391 = false;
    bool _193 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2564 = as_type<float>(_105);
        out.gl_Position.z = _2564;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2633 = as_type<float>(_143);
        out.gl_Position.z = _2633;
    }
    if (_137)
    {
        return out;
    }
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    bool _151 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _153 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _155 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _157 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _159 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _153);
    float _161 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _155);
    float _163 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _157);
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _159);
    float _167 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _161);
    float _169 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _163);
    bool _171 = !_151;
    float _173 = _165;
    float _191;
    if (!_171)
    {
        float _175 = in.m_53.x;
        float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _181 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _183 = _181 * _177;
        float _185 = floor(_183);
        float _187 = -_185;
        float _189 = _183 + _187;
        _191 = _189;
        _193 = true;
    }
    else
    {
        float _195 = float(_89);
        float _197 = 1.0 / _195;
        float _199 = _123 * _197;
        _191 = _199;
    }
    _193 = false;
    float _201 = _191;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = _201 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _213 = _201 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _219 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _223;
    float _227 = 1.0 / _217;
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _231 = 1.0 / _225;
    bool _233 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _235 = isnan(_201);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = 1.0 / _221;
    float _247 = _205 * _227;
    bool _249 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _251 = isnan(_201);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = _209 * _231;
    bool _263 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _265 = isnan(_201);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = -_243;
    float _277 = _275 + 1.0;
    float _279 = _273 * _277;
    float _281 = -_273;
    float _283 = _281 + 1.0;
    float _285 = _213 * _245;
    float _287 = -_259;
    float _289 = _287 + 1.0;
    bool _291 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _293 = isnan(_201);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _311 = _243 * _289;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _321 = fma(_305, _247, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = _301 * _283;
    float _325 = fma(_315, _247, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _327 = fma(_309, _285, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _329 = fma(_319, _285, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _331 = -_301;
    float _333 = _331 + 1.0;
    float _335 = _321 * _323;
    float _337 = _325 * _323;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _339;
    float _343 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _335);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _345;
    float _349 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _337);
    float _351 = fma(_341, _261, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _353 = fma(_327, _279, _343);
    float _355 = fma(_347, _261, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _357 = fma(_329, _279, _349);
    float _359 = fma(_351, _311, _353);
    float _361 = fma(_355, _311, _357);
    float _363 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[146].x, _359);
    float _365 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[146].y, _361);
    bool _367 = !_229;
    float _387;
    float _389;
    if (!_367)
    {
        float _369 = in.m_53.x;
        float _371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _373 = _369 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _377 = _375 * _371;
        float _379 = float(_89);
        float _381 = floor(_377);
        float _383 = -_381;
        float _385 = _377 + _383;
        _387 = _379;
        _389 = _385;
        _391 = true;
    }
    else
    {
        float _393 = float(_89);
        float _395 = 1.0 / _393;
        float _397 = _123 * _395;
        _387 = _393;
        _389 = _397;
    }
    _391 = false;
    float _399 = _387;
    float _401 = _389;
    float _403 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _405 = int(_403);
    float _407 = in.m_53.x;
    float _409 = in.m_53.y;
    float _411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _413 = int(_411);
    float _415 = in.m_53.z;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _419 = as_type<float>(int(gl_VertexIndex));
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _425 = float(_405);
    float _427 = 1.0 / _399;
    float _429 = float(uint(_413));
    float _431 = 1.0 / _425;
    int _433 = ~_413;
    int _435 = _433 + 1;
    int _437 = ~_413;
    int _439 = _437 + 1;
    float _441 = _409 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _443 = _413 == 0;
    int _445 = ~_413;
    int _447 = _445 + 1;
    float _449 = 1.0 / _429;
    float _451 = _431 * _123;
    float _453 = 1.0 / _423;
    int _455 = as_type<int>(_449) + (-2);
    float _457 = trunc(_451);
    int _459 = int(_457);
    float _461 = _407 + _415;
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _465 = _463 != 0;
    float _467 = _461 + (-1.0);
    float _469 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _471 = float(uint(_459));
    float _473 = as_type<float>(_455) * _471;
    float _475 = trunc(_473);
    float _477 = precise::max(_475, 0.0);
    uint _480 = uint(_477);
    int _482 = _435 * int(_480);
    int _484 = _482 + _459;
    float _486 = float(_413);
    float _488 = float(uint(_484));
    float _490 = as_type<float>(_455) * _488;
    float _492 = trunc(_490);
    float _494 = precise::max(_492, 0.0);
    uint _496 = uint(_494);
    int _498 = int(_480) + int(_496);
    bool _500 = !_465;
    float _502 = _500 ? 7.345489978790283203125 : 1.0;
    float _504 = float(_459);
    int _506 = _439 * _498;
    int _508 = _506 + _459;
    bool _510 = _504 >= _486;
    bool _512 = isnan(_504);
    bool _514 = _510 || _512;
    bool _516 = isnan(_486);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    bool _522 = uint(_508) >= uint(_413);
    float _524 = _502 * _407;
    float _526 = trunc(_520);
    int _528 = int(_526);
    bool _530 = !_522;
    int _532 = _530 ? 0 : (-1);
    int _534 = ~_498;
    int _536 = _534 + _532;
    int _538 = _536 + 1;
    float _540 = floor(_524);
    int _542 = _413 * _538;
    int _544 = _542 + _459;
    int _546 = ~_528;
    int _548 = _546 + 1;
    int _550 = _548 + 1;
    bool _552 = !_443;
    int _554 = _552 ? _544 : (-1);
    int _556 = _554 * _550;
    float _558 = -_540;
    float _560 = _524 + _558;
    int _562 = _413 + (-1);
    float _564 = _560 * _486;
    float _566 = _486 * _123;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _570 = _568 != 0;
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _574 = _572 != 0;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _578 = _576 != 0;
    float _580 = trunc(_564);
    int _582 = int(_580);
    float _584 = _566 * _427;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _588 = _586 != 0;
    int _590 = _528 * _562;
    int _592 = _590 + _556;
    bool _594 = !_574;
    int _596 = _594 ? 0 : 1;
    bool _598 = !_570;
    int _600 = _598 ? 0 : 1;
    float _602 = trunc(_584);
    int _604 = int(_602);
    bool _606 = !_588;
    int _608 = _606 ? 0 : 1;
    int _610 = abs(_596);
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _614 = _612 != 0;
    bool _616 = !_578;
    int _618 = _616 ? 0 : 1;
    int _620 = _592 * _610;
    int _622 = abs(_600);
    int _624 = abs(_608);
    bool _626 = !_614;
    int _628 = _626 ? 0 : 1;
    int _630 = abs(_618);
    int _632 = _582 * _624;
    int _634 = _632 + _459;
    int _636 = abs(_628);
    int _638 = _604 * _622;
    int _640 = _638 + _620;
    int _642 = ~_413;
    int _644 = _642 + 1;
    int _646 = _634 * _630;
    int _648 = _646 + _640;
    int _650 = _582 * _636;
    int _652 = _650 + _648;
    int _654 = ~_413;
    int _656 = _654 + 1;
    float _658 = float(uint(_652));
    float _660 = as_type<float>(_455) * _658;
    float _662 = trunc(_660);
    float _664 = precise::max(_662, 0.0);
    uint _666 = uint(_664);
    int _668 = _656 * int(_666);
    int _670 = _668 + _652;
    float _672 = float(uint(_670));
    float _674 = as_type<float>(_455) * _672;
    float _676 = trunc(_674);
    float _678 = precise::max(_676, 0.0);
    uint _680 = uint(_678);
    float _682 = _415 * 2.0;
    float _684 = floor(_682);
    int _686 = int(_666) + int(_680);
    float _688 = _407 * 2.0;
    int _690 = _644 * _686;
    int _692 = _690 + _652;
    float _694 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _696 = log2(_694);
    bool _698 = uint(_692) >= uint(_413);
    bool _700 = !_698;
    int _702 = _700 ? 0 : (-1);
    float _704 = floor(_688);
    int _706 = ~_686;
    int _708 = _706 + _702;
    int _710 = _708 + 1;
    float _712 = _696 * _123;
    int _714 = _413 * _710;
    int _716 = _714 + _652;
    float _718 = _409 * 2.0;
    float _720 = exp2(_712);
    bool _722 = !_443;
    int _724 = _722 ? _716 : (-1);
    bool _726 = _704 > 0.0;
    int _728 = _724 & 3;
    bool _730 = _728 != 0;
    float _732 = floor(_718);
    int _734 = _724 & 3;
    bool _736 = _734 != 0;
    float _738 = in.m_58.x;
    float _740 = in.m_58.y;
    bool _742 = uint(_728) > 1u;
    bool _744 = _728 != 3;
    bool _746 = _704 >= 0.0;
    bool _748 = isnan(_704);
    bool _750 = _746 || _748;
    bool _752 = isnan(0.0);
    bool _754 = _750 || _752;
    float _756 = -_720;
    float _758 = _756 + 1.0;
    int _760 = _736 ? 0 : 1;
    bool _762 = uint(_728) >= 2u;
    int _764 = _754 ? 0 : 1;
    int _766 = _762 ? 0 : 1;
    bool _768 = _732 > 0.0;
    bool _770 = _732 >= 0.0;
    bool _772 = isnan(_732);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.0);
    bool _778 = _774 || _776;
    int _780 = ~_760;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    int _786 = ~_766;
    int _788 = _786 + 1;
    int _790 = _788 + 1;
    int _792 = _784;
    int _794 = _790;
    if (!_742)
    {
        int _796 = ~_760;
        int _798 = _796 + 1;
        _792 = _798;
    }
    int _800 = _792;
    float _802 = _363 * _738;
    int _804 = ~_764;
    int _806 = _804 + 1;
    int _808 = _806 + 1;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _812 = _808;
    if (_744)
    {
        int _814 = ~_766;
        int _816 = _814 + 1;
        _794 = _816;
    }
    int _818 = _794;
    float _820 = _365 * _740;
    int _822 = _778 ? 0 : 1;
    float _824 = _802 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (!_726)
    {
        int _826 = ~_764;
        int _828 = _826 + 1;
        _812 = _828;
    }
    int _830 = _812;
    float _832 = _820 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _834 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _836 = isnan(0.0);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _842 = _838 || _840;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _846 = _844 != 0;
    bool _848 = _684 >= 0.0;
    bool _850 = isnan(_684);
    bool _852 = _848 || _850;
    bool _854 = isnan(0.0);
    bool _856 = _852 || _854;
    bool _858 = _684 > 0.0;
    int _860 = ~_822;
    int _862 = _860 + 1;
    int _864 = _862 + 1;
    bool _866 = !_846;
    int _868 = _866 ? 0 : 1;
    float _870 = _842 ? _758 : 0.0;
    int _872 = _856 ? 0 : 1;
    int _874 = _864;
    if (!_768)
    {
        int _876 = ~_822;
        int _878 = _876 + 1;
        _874 = _878;
    }
    int _880 = _874;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _884 = _882 != 0;
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _888 = _886 != 0;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _892 = _890 != 0;
    float _894 = in.m_44.x;
    float _896 = in.m_44.y;
    float _898 = in.m_44.z;
    int _900 = ~_872;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    bool _906 = !_888;
    int _908 = _906 ? 0 : 1;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _912 = _910 != 0;
    int _914 = _904;
    if (!_858)
    {
        int _916 = ~_872;
        int _918 = _916 + 1;
        _914 = _918;
    }
    int _920 = _914;
    int _922 = as_type<int>(_419) & 1;
    bool _924 = _922 != 0;
    int _926 = as_type<int>(_419) & 2;
    bool _928 = _926 != 0;
    float _930 = _407 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _936 = -_810;
    float _938 = fma(_930, 2.0, _936);
    float _940 = 1.0 / _934;
    bool _942 = !_884;
    int _944 = _942 ? 0 : 1;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _946;
    float _950 = float(_830);
    int _952 = abs(_944);
    float _954 = _896 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _956 = _896 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _958 = fma(_441, -2.0, _417);
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _964 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[4].x, _954);
    float _966 = float(uint(_634));
    float _968 = _896 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _970 = _409 + _415;
    float _972 = _962 * _453;
    float _974 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[5].x, _956);
    float _976 = as_type<float>(_455) * _966;
    float _978 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[6].x, _968);
    float _980 = _948 * _940;
    float _982 = _970 + (-1.0);
    float _984 = _407 + _409;
    float _986 = trunc(_976);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    float _992 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _994 = _984 + (-1.0);
    int _996 = abs(_908);
    float _998 = fma(_898, (*spvDescriptorSet0.vp_c10)._m0[5].z, _974);
    float _1000 = fma(_898, (*spvDescriptorSet0.vp_c10)._m0[4].z, _964);
    float _1002 = float(_952);
    float _1004 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1006 = float(_920);
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1010 = _401 + _1008;
    float _1012 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _958);
    float _1014 = _415 + (-0.5);
    float _1016 = _1002 * _1006;
    float _1018 = float(_996);
    int _1020 = _447 * int(_990);
    int _1022 = _1020 + _634;
    float _1024 = fma(_980, _1010, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1026 = _1000 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1028 = _724 >> 31;
    float _1030 = _1018 * _950;
    float _1032 = float(uint(_1022));
    float _1034 = fma(_898, (*spvDescriptorSet0.vp_c10)._m0[6].z, _978);
    bool _1036 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1038 = isnan(1.0);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1044 = _1040 || _1042;
    float _1046 = in.m_60.x;
    float _1048 = in.m_60.y;
    float _1050 = in.m_60.z;
    float _1052 = as_type<float>(_455) * _1032;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1056 = 1.0 + _1054;
    int _1058 = _1028 & 3;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1062 = !_892;
    int _1064 = _1062 ? 0 : 1;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1068 = 1.0 / _1056;
    int _1070 = _724 + _1058;
    float _1072 = -_123;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[76].x, _938);
    float _1076 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1066);
    float _1078 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1060);
    int _1080 = _1070 >> 2;
    float _1082 = _1034 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1084 = abs(_1064);
    float _1086 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1076);
    int _1088 = _1080 << 4;
    int _1090 = _1088 + 368;
    float _1092 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1078);
    float _1094 = float(_880);
    float _1096 = _1016 * (-2.0);
    float _1098 = float(_1084);
    float _1100 = _1030 * (-2.0);
    uint _1102 = uint(int(uint(_1090) >> uint(2)));
    uint _1104 = uint(int(uint(int(_1102)) >> uint(2)));
    int _1106 = int(_1102) & 3;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[int(_1104)][_1106];
    int _1110 = int(_1102) + 1;
    uint _1112 = uint(int(uint(_1110) >> uint(2)));
    int _1114 = _1110 & 3;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[int(_1112)][_1114];
    if (_1044)
    {
        float _1118 = _870 * _1068;
        _127 = _1118;
    }
    float _1120 = _127;
    float _1122 = fma(_1096, _1046, _1046);
    float _1124 = _1098 * _1094;
    float _1126 = fma(_1004, _1096, _1004);
    float _1128 = fma(_1100, _1048, _1048);
    float _1130 = trunc(_1052);
    float _1132 = precise::max(_1130, 0.0);
    uint _1134 = uint(_1132);
    float _1136 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1138 = _1090 + 8;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    uint _1142 = uint(int(uint(int(_1140)) >> uint(2)));
    int _1144 = int(_1140) & 3;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[int(_1142)][_1144];
    int _1148 = int(_1140) + 1;
    uint _1150 = uint(int(uint(_1148) >> uint(2)));
    int _1152 = _1148 & 3;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[int(_1150)][_1152];
    bool _1156 = !_730;
    int _1158 = _1156 ? 0 : 1;
    float _1160 = fma(_992, _1100, _992);
    bool _1162 = _728 != 3;
    float _1164 = _1136 * _407;
    float _1166 = _407 + (-0.5);
    float _1168 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1170 = int(_1168);
    bool _1172 = !_1162;
    int _1174 = _1172 ? 0 : (-1);
    bool _1176 = _407 > 0.5;
    float _1178 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1122);
    int _1180 = abs(_1174);
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1184 = _1182 != 0;
    float _1186 = fma(_1126, _1120, _1178);
    int _1188 = int(_990) + int(_1134);
    int _1190 = ~_413;
    int _1192 = _1190 + 1;
    float _1194 = _1186 * 0.15915493667125701904296875;
    int _1196 = abs(_1170);
    int _1198 = _1192 * _1188;
    int _1200 = _1198 + _634;
    float _1202 = float(uint(_1170));
    float _1204 = _1124 * (-2.0);
    bool _1206 = uint(_1200) >= uint(_413);
    float _1208 = float(uint(_1196));
    float _1210 = fma(_1204, _1050, _1050);
    int _1212 = abs(_800);
    float _1214 = fma(_469, _1204, _469);
    bool _1216 = !_1206;
    int _1218 = _1216 ? 0 : (-1);
    float _1220 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1210);
    int _1222 = ~_1212;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    float _1228 = 1.0 / _1202;
    int _1230 = abs(_1158);
    float _1232 = fma(_1214, _1120, _1220);
    bool _1234 = _409 > 0.5;
    float _1236 = _409 + (-0.5);
    int _1238 = ~_1188;
    int _1240 = _1238 + _1218;
    int _1242 = _1240 + 1;
    int _1244 = _1226 * as_type<int>(_1116);
    int _1246 = abs(_818);
    float _1248 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1128);
    int _1250 = ~_1230;
    int _1252 = _1250 + 1;
    int _1254 = _1252 + 1;
    float _1256 = 1.0 / _1208;
    int _1258 = abs(_868);
    float _1260 = fma(_1160, _1120, _1248);
    int _1262 = _1254 * as_type<int>(_1108);
    int _1264 = _1262 + _1244;
    int _1266 = ~_1246;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    float _1272 = _1260 * 0.15915493667125701904296875;
    int _1274 = ~_1180;
    int _1276 = _1274 + 1;
    int _1278 = _1276 + 1;
    float _1280 = _1232 * 0.15915493667125701904296875;
    int _1282 = ~_1258;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    int _1288 = _1270 * as_type<int>(_1146);
    int _1290 = _1288 + _1264;
    float _1292 = _1194 * 6.283185482025146484375;
    float _1294 = sin(_1292);
    int _1296 = as_type<int>(_1228) + (-2);
    int _1298 = _1278 * as_type<int>(_1154);
    int _1300 = _1298 + _1290;
    bool _1302 = !_928;
    float _1304 = _1302 ? (-0.5) : 0.5;
    int _1306 = _413 * _1242;
    int _1308 = _1306 + _634;
    bool _1310 = !_924;
    float _1312 = _1310 ? (-0.5) : 0.5;
    int _1314 = _1300 * _1286;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1318 = _401 + _1316;
    float _1320 = _1194 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    bool _1324 = !_443;
    int _1326 = _1324 ? _1308 : (-1);
    float _1328 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1312);
    float _1330 = fma(_972, _1318, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1332 = as_type<int>(_1256) + (-2);
    int _1334 = _1326 * _1258;
    int _1336 = _1334 + _1314;
    float _1338 = _824 * _1328;
    float _1340 = _1272 * 6.283185482025146484375;
    float _1342 = sin(_1340);
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1304);
    int _1346 = ~_1196;
    int _1348 = _1346 + 1;
    int _1350 = abs(_1336);
    float _1352 = _832 * _1344;
    float _1354 = float(uint(_1336));
    float _1356 = _1280 * 6.283185482025146484375;
    float _1358 = cos(_1356);
    float _1360 = as_type<float>(_1296) * _1354;
    bool _1362 = _1170 == 0;
    float _1364 = float(uint(_1350));
    float _1366 = _1272 * 6.283185482025146484375;
    float _1368 = cos(_1366);
    float _1370 = _1322 * _1342;
    float _1372 = _1294 * _1342;
    float _1374 = _1280 * 6.283185482025146484375;
    float _1376 = sin(_1374);
    float _1378 = _1342 * _1358;
    float _1380 = _1294 * _1368;
    float _1382 = as_type<float>(_1332) * _1364;
    float _1384 = _1322 * _1368;
    float _1386 = _1368 * _1358;
    float _1388 = _1358 * _1352;
    float _1390 = trunc(_1360);
    float _1392 = precise::max(_1390, 0.0);
    uint _1394 = uint(_1392);
    float _1396 = -_1352;
    float _1398 = _1376 * _1396;
    float _1400 = -_1370;
    float _1402 = fma(_1376, _1380, _1400);
    float _1404 = -_1380;
    float _1406 = fma(_1376, _1370, _1404);
    float _1408 = fma(_1376, _1384, _1372);
    float _1410 = fma(_1376, _1372, _1384);
    float _1412 = trunc(_1382);
    float _1414 = precise::max(_1412, 0.0);
    uint _1416 = uint(_1414);
    int _1418 = ~_1170;
    int _1420 = _1418 + 1;
    float _1422 = fma(_1386, _1338, _1398);
    int _1424 = ~_1196;
    int _1426 = _1424 + 1;
    float _1428 = _1322 * _1388;
    float _1430 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1432 = _1294 * _1388;
    float _1434 = fma(_1408, _1338, _1428);
    float _1436 = fma(_1378, _1430, _1422);
    float _1438 = fma(_1402, _1338, _1432);
    bool _1440 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1442 = isnan(_401);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    int _1452 = _1420 * int(_1394);
    int _1454 = _1452 + _1336;
    float _1456 = fma(_1406, _1430, _1434);
    float _1458 = fma(_1410, _1430, _1438);
    bool _1460 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1462 = isnan(_401);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1468 = _1464 || _1466;
    float _1470 = float(_1468);
    int _1472 = _1426 * int(_1416);
    int _1474 = _1472 + _1350;
    float _1476 = float(uint(_1454));
    float _1478 = -_1450;
    float _1480 = _1478 + 1.0;
    float _1482 = trunc(_1164);
    int _1484 = int(_1482);
    float _1486 = float(uint(_1474));
    float _1488 = as_type<float>(_1296) * _1476;
    float _1490 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1492 = -_1312;
    int _1494 = _1176 ? as_type<int>(_1492) : as_type<int>(_1312);
    float _1496 = as_type<float>(_1332) * _1486;
    bool _1498 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1500 = isnan(_401);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1506 = _1502 || _1504;
    float _1508 = float(_1506);
    float _1510 = _1470 * _1480;
    float _1512 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1514 = trunc(_1488);
    float _1516 = precise::max(_1514, 0.0);
    uint _1518 = uint(_1516);
    float _1520 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1490);
    float _1522 = -_1470;
    float _1524 = _1522 + 1.0;
    float _1526 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1512);
    bool _1528 = !_1184;
    float _1530 = _1528 ? _1312 : as_type<float>(_1494);
    float _1532 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1520);
    float _1534 = _1508 * _1524;
    float _1536 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1526);
    float _1538 = trunc(_1496);
    float _1540 = precise::max(_1538, 0.0);
    uint _1542 = uint(_1540);
    float _1544 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1546 = _1024 * _1534;
    float _1548 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1550 = _1484 << 4;
    int _1552 = _1550 + 1968;
    float _1554 = _1082 + _1544;
    float _1556 = _1026 + _1548;
    int _1558 = int(_1394) + int(_1518);
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1562 = _1554 + _1560;
    int _1564 = _1552 + 8;
    uint _1566 = uint(int(uint(_1564) >> uint(2)));
    uint _1568 = uint(int(uint(int(_1566)) >> uint(2)));
    int _1570 = int(_1566) & 3;
    float _1572 = (*spvDescriptorSet0.vp_c9)._m0[int(_1568)][_1570];
    float _1574 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1576 = _1556 + _1574;
    float _1578 = _1562 * _1562;
    float _1580 = _1576 * _1576;
    int _1582 = int(_1416) + int(_1542);
    float _1584 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1586 = ~_1170;
    int _1588 = _1586 + 1;
    float _1590 = _1580 + _1578;
    uint _1592 = uint(int(uint(_1552) >> uint(2)));
    uint _1594 = uint(int(uint(int(_1592)) >> uint(2)));
    int _1596 = int(_1592) & 3;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[int(_1594)][_1596];
    int _1600 = int(_1592) + 1;
    uint _1602 = uint(int(uint(_1600) >> uint(2)));
    int _1604 = _1600 & 3;
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[int(_1602)][_1604];
    float _1608 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1584);
    float _1610 = -_1304;
    int _1612 = _1234 ? as_type<int>(_1610) : as_type<int>(_1304);
    float _1614 = sqrt(_1590);
    int _1616 = _1588 * _1558;
    int _1618 = _1616 + _1336;
    float _1620 = -_1508;
    float _1622 = _1620 + 1.0;
    int _1624 = _1348 * _1582;
    int _1626 = _1624 + _1350;
    bool _1628 = !_912;
    float _1630 = _1628 ? _1304 : as_type<float>(_1612);
    float _1632 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1608);
    bool _1634 = uint(_1618) >= uint(_1170);
    float _1636 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1546);
    int _1638 = _1336 ^ _1170;
    float _1640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1642 = uint(_1626) >= uint(_1196);
    bool _1644 = !_1634;
    int _1646 = _1644 ? 0 : (-1);
    uint _1648 = uint(int(uint(_1638) >> uint(31)));
    bool _1650 = _1614 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1654 = !_1642;
    int _1656 = _1654 ? 0 : (-1);
    int _1658 = ~int(_1648);
    int _1660 = _1658 + 1;
    float _1662 = _998 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1664 = _1632 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1666 = ~_1656;
    int _1668 = _1582 + _1666;
    int _1670 = _1668 + 1;
    int _1672 = ~_1558;
    int _1674 = _1672 + _1646;
    int _1676 = _1674 + 1;
    float _1678 = _1662 + _1664;
    int _1680 = _1670 ^ _1660;
    bool _1682 = _1170 == 0;
    int _1684 = _1170 * _1676;
    int _1686 = _1684 + _1336;
    int _1688 = ~_1660;
    int _1690 = _1688 + _1680;
    int _1692 = _1690 + 1;
    float _1694 = as_type<float>(_1336);
    float _1696 = as_type<float>(_1170);
    float _1698 = as_type<float>(_1676);
    float _1700 = _1580;
    float _1702 = _1578;
    if (!_1650)
    {
        _1694 = _1556;
    }
    float _1704 = _1694;
    float _1706 = _1704;
    if (!_1650)
    {
        _1696 = _1554;
    }
    float _1708 = _1696;
    float _1710 = _1708;
    if (!_1650)
    {
        _1698 = _1678;
    }
    float _1712 = _1698;
    bool _1714 = !_1650;
    float _1716 = _1712;
    if (!_1714)
    {
        float _1718 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1720 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1722 = _1614 + _1720;
        float _1724 = rsqrt(_1590);
        float _1726 = _1722 * _1718;
        float _1728 = _1678 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1730 = _1726 * 0.15915493667125701904296875;
        float _1732 = _1730 * 6.283185482025146484375;
        float _1734 = sin(_1732);
        float _1736 = _1730 * 6.283185482025146484375;
        float _1738 = cos(_1736);
        float _1740 = fma(_1734, _1728, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1742 = _1724 * _1740;
        float _1744 = _1738 + (-1.0);
        float _1746 = fma(_1576, _1742, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1748 = fma(_1562, _1742, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1750 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1754 = _1746 + _1752;
        float _1756 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1758 = _1748 + _1756;
        float _1760 = fma(_1678, _1738, _1750);
        float _1762 = _1754 * _1754;
        float _1764 = _1758 * _1758;
        _1716 = _1760;
        _1700 = _1762;
        _1702 = _1764;
        _1706 = _1746;
        _1710 = _1748;
    }
    float _1766 = _1716;
    float _1768 = _1700;
    float _1770 = _1702;
    float _1772 = _1706;
    float _1774 = _1710;
    bool _1776 = !_1682;
    int _1778 = _1776 ? _1686 : (-1);
    float _1780 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1782 = !_1362;
    int _1784 = _1782 ? _1692 : (-1);
    float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1788 = _1766 + _1786;
    float _1790 = float(_1778);
    float _1792 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1794 = float(_1784);
    float _1796 = fma(_1788, _1788, _1768);
    float _1798 = fma(_1330, _1510, _1636);
    float _1800 = fma(_1780, _1790, _1074);
    float _1802 = _1530 + 0.5;
    float _1804 = -_1012;
    float _1806 = fma(_1792, _1794, _1804);
    float _1808 = _1630 + (-0.5);
    float _1810 = _1796 + _1770;
    float _1812 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1798);
    float _1814 = fma(_1780, _1802, _1800);
    float _1816 = -_1792;
    float _1818 = fma(_1816, _1808, _1806);
    float _1820 = _1598 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1822 = -_1086;
    float _1824 = _1822 + 1.0;
    float _1826 = sqrt(_1810);
    float _1828 = _1606 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1830 = -_1824;
    float _1832 = fma(_1530, _1830, _1814);
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1840 = _1572 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1842 = -_1092;
    float _1844 = _1842 + 1.0;
    float _1846 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1850 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1852 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1854 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1856 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1858 = _1840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1860 = _1812 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1862 = fma(_1630, _1844, _1818);
    bool _1864 = _1826 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1866 = isnan(_1826);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1872 = _1868 || _1870;
    out.m_62.x = _1856;
    out.m_62.y = _1846;
    out.m_62.z = _1858;
    out.m_62.w = _1848;
    out.m_64.x = _1850;
    out.m_64.y = _1852;
    out.m_64.z = _1854;
    out.m_64.w = _1860;
    out.m_66.x = _1832;
    out.m_66.y = _1862;
    float _1874 = _1820;
    float _1876 = _1862;
    if (!_1872)
    {
        _1874 = 1.0;
    }
    float _1878 = _1874;
    bool _1880 = !_1872;
    float _1882 = _1878;
    if (!_1880)
    {
        bool _1884 = _1826 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1886 = isnan(_1826);
        bool _1888 = _1884 || _1886;
        bool _1890 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1892 = _1888 || _1890;
        if (!_1892)
        {
            float _1894 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1896 = _1826 + _1894;
            float _1898 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1900 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1898;
            float _1902 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1904 = _1902 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1906 = 1.0 / _1900;
            float _1908 = _1896 * _1906;
            float _1910 = fma(_1908, _1904, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1882 = _1910;
            _1912 = true;
        }
        else
        {
            bool _1914 = _1826 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1916 = isnan(_1826);
            bool _1918 = _1914 || _1916;
            bool _1920 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1922 = _1918 || _1920;
            if (!_1922)
            {
                float _1924 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1926 = _1826 + _1924;
                float _1928 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1930 = _1928 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1932 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1934 = _1932 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1936 = 1.0 / _1930;
                float _1938 = _1926 * _1936;
                float _1940 = fma(_1938, _1934, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1882 = _1940;
                _1912 = true;
            }
            else
            {
                _1882 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1912 = false;
    float _1942 = _1882;
    float _1944 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1946 = _1766 + _1944;
    float _1948 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1950 = _1772 + _1948;
    float _1952 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1954 = _1774 + _1952;
    float _1956 = fma(_1946, _1942, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1958 = fma(_1950, _1942, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1960 = fma(_1954, _1942, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1962 = -_1662;
    float _1964 = _1962 + _1956;
    float _1966 = -_1026;
    float _1968 = _1966 + _1958;
    float _1970 = -_1082;
    float _1972 = _1970 + _1960;
    float _1974 = _1964 * _1964;
    float _1976 = fma(_1968, _1968, _1974);
    float _1978 = fma(_1972, _1972, _1976);
    float _1980 = sqrt(_1978);
    bool _1982 = _1980 > 0.0;
    bool _1984 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1986 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan(0.5);
    bool _1992 = _1988 || _1990;
    float _1994 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1996 = _1958;
    float _1998 = _1964;
    float _2000 = _1956;
    if (!_1982)
    {
        _1876 = _1956;
    }
    float _2002 = _1876;
    float _2004 = _2002;
    if (!_1982)
    {
        _1994 = _1960;
    }
    float _2006 = _1994;
    bool _2008 = !_1982;
    float _2010 = _2006;
    if (!_2008)
    {
        float _2012 = _167 * _167;
        float _2014 = rsqrt(_1978);
        float _2016 = fma(_165, _165, _2012);
        float _2018 = fma(_169, _169, _2016);
        float _2020 = sqrt(_2018);
        float _2022 = _1968 * _2014;
        float _2024 = _1964 * _2014;
        float _2026 = _1972 * _2014;
        bool _2028 = _2020 > 0.0;
        float _2030 = _2020;
        float _2032 = _2014;
        if (!_2028)
        {
            _2030 = _1956;
        }
        float _2034 = _2030;
        _2004 = _2034;
        if (!_2028)
        {
            _2032 = _1960;
        }
        float _2036 = _2032;
        bool _2038 = !_2028;
        _2010 = _2036;
        if (!_2038)
        {
            float _2040 = rsqrt(_2018);
            float _2042 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2044 = _167 * _2040;
            float _2046 = _165 * _2040;
            float _2048 = _2024 * _2044;
            float _2050 = _169 * _2040;
            float _2052 = fma(_2022, _2046, _2048);
            float _2054 = _2042 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2056 = fma(_2026, _2050, _2052);
            float _2058 = _2056 * _2054;
            float _2060 = fma(_165, _2058, _1958);
            float _2062 = fma(_167, _2058, _1956);
            float _2064 = fma(_169, _2058, _1960);
            _1996 = _2060;
            _2010 = _2064;
            _2004 = _2062;
            _1998 = _2058;
        }
    }
    float _2066 = _1996;
    float _2068 = _2010;
    float _2070 = _2004;
    float _2072 = _1998;
    float _2074 = _2070;
    float _2076 = _2068;
    float _2078 = _2066;
    if (_1992)
    {
        _173 = _2066;
    }
    float _2080 = _173;
    float _2082 = _2080;
    if (!_1992)
    {
        float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2086 = _1662 + _2084;
        float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2090 = _1026 + _2088;
        float _2092 = -_1082;
        float _2094 = _2092 + _2068;
        float _2096 = _2086 * _2086;
        float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2100 = _1082 + _2098;
        float _2102 = fma(_2090, _2090, _2096);
        float _2104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2106 = fma(_2100, _2100, _2102);
        float _2108 = -_1026;
        float _2110 = _2108 + _2066;
        float _2112 = sqrt(_2106);
        float _2114 = precise::min(_2112, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2116 = _2114 * _2104;
        float _2118 = -_1662;
        float _2120 = _2118 + _2070;
        float _2122 = fma(_2110, _2116, _1026);
        float _2124 = fma(_2120, _2116, _1662);
        float _2126 = fma(_2094, _2116, _1082);
        _2074 = _2124;
        _2082 = _2122;
        _2076 = _2126;
    }
    float _2128 = _2074;
    float _2130 = _2082;
    float _2132 = _2076;
    float _2134 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2136 = _2128 + _2134;
    float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2140 = _2130 + _2138;
    float _2142 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2144 = _2132 + _2142;
    float _2146 = _2136 * _2136;
    float _2148 = fma(_2140, _2140, _2146);
    float _2150 = fma(_2144, _2144, _2148);
    float _2152 = rsqrt(_2150);
    float _2154 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2156 = _2140 * _2154;
    float _2158 = _2144 * _2154;
    float _2160 = _2156 * _2156;
    float _2162 = _2158 * _2158;
    float _2164 = _2160 + _2162;
    float _2166 = sqrt(_2164);
    bool _2168 = _2166 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2172 = _2166 + _2170;
    float _2174 = _2152;
    float _2176 = _2172;
    float _2178 = _2154;
    float _2180 = _2156;
    if (_2168)
    {
        float _2182 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2174 = _2182;
    }
    float _2184 = _2174;
    if (_2168)
    {
        float _2186 = rsqrt(_2164);
        _2078 = _2186;
    }
    float _2188 = _2078;
    float _2190 = _2188;
    if (_2168)
    {
        float _2192 = _2172 * _2184;
        _2176 = _2192;
    }
    float _2194 = _2176;
    if (_2168)
    {
        float _2196 = _2194 * 0.15915493667125701904296875;
        _2000 = _2196;
    }
    float _2198 = _2000;
    float _2200 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2202 = _2072;
    if (_2168)
    {
        float _2204 = _2198 * 6.283185482025146484375;
        float _2206 = sin(_2204);
        _2202 = _2206;
    }
    float _2208 = _2202;
    float _2210 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2212 = precise::max(0.0, _2210);
    float _2214 = _2144;
    float _2216 = _2212;
    float _2218 = _2210;
    if (_2168)
    {
        float _2220 = _2198 * 6.283185482025146484375;
        float _2222 = cos(_2220);
        _2214 = _2222;
    }
    float _2224 = _2214;
    float _2226 = -_2154;
    float _2228 = -_2212;
    float _2230 = fma(_2136, _2226, _2228);
    float _2232 = _2230;
    if (_2168)
    {
        float _2234 = _2230 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2216 = _2234;
    }
    float _2236 = _2216;
    float _2238 = sqrt(_2150);
    float _2240 = _2208;
    float _2242 = _2236;
    if (_2168)
    {
        float _2244 = fma(_2208, _2236, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2240 = _2244;
    }
    float _2246 = _2240;
    float _2248 = _2246;
    if (_2168)
    {
        float _2250 = _2224 + (-1.0);
        _2218 = _2250;
    }
    float _2252 = _2218;
    float _2254 = _2252;
    if (_2168)
    {
        float _2256 = _2188 * _2246;
        _2178 = _2256;
    }
    float _2258 = _2178;
    if (!_2168)
    {
        _2190 = _2230;
    }
    float _2260 = _2190;
    float _2262 = _2260;
    if (_2168)
    {
        float _2264 = _2252 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2242 = _2264;
    }
    float _2266 = _2242;
    if (_2168)
    {
        float _2268 = _2156 * _2258;
        _2180 = _2268;
    }
    float _2270 = _2180;
    if (!_2168)
    {
        _2248 = _2158;
    }
    float _2272 = _2248;
    float _2274 = _2272;
    if (_2168)
    {
        float _2276 = _2158 * _2258;
        _2274 = _2276;
    }
    float _2278 = _2274;
    if (!_2168)
    {
        _2254 = _2160;
    }
    float _2280 = _2254;
    float _2282 = _2280;
    if (_2168)
    {
        float _2284 = fma(_2230, _2224, _2266);
        _2262 = _2284;
    }
    float _2286 = _2262;
    if (_2168)
    {
        float _2288 = _2270 * _2270;
        _2282 = _2288;
    }
    float _2290 = _2282;
    if (!_2168)
    {
        _2232 = _2162;
    }
    float _2292 = _2232;
    float _2294 = _2292;
    if (_2168)
    {
        float _2296 = _2278 * _2278;
        _2294 = _2296;
    }
    float _2298 = _2294;
    float _2300 = fma(_2286, _2286, _2290);
    float _2302 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2304 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2306 = _2300 + _2298;
    float _2308 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2302);
    float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2312 = fma(_2238, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2310);
    float _2314 = precise::clamp(_2312, 0.0, 1.0);
    float _2316 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2318 = rsqrt(_2306);
    float _2320 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2308);
    float _2322 = -_2314;
    float _2324 = _2322 + 1.0;
    float _2326 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2328 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2316);
    float _2330 = _2320 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2332 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2304);
    float _2334 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2326);
    float _2336 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2328);
    float _2338 = abs(_2324);
    float _2340 = log2(_2338);
    float _2342 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2344 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2334);
    float _2346 = _2336 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2348 = -_2342;
    float _2350 = fma(_2348, _2200, 1.0);
    float _2352 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2332);
    float _2354 = _2344 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2356 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2358 = _2318 * _2270;
    float _2360 = _2318 * _2286;
    float _2362 = _2318 * _2278;
    float _2364 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2356);
    float _2366 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2368 = _2352 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2370 = log2(_2350);
    float _2372 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2364);
    float _2374 = -_2366;
    float _2376 = fma(_2360, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2374);
    float _2378 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2380 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2382 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2372);
    float _2384 = -_2362;
    float _2386 = fma(_2384, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2376);
    float _2388 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2390 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2380);
    float _2392 = exp2(_2378);
    float _2394 = fma(_2386, -0.5, 0.5);
    float _2396 = fma(_2386, 0.5, 0.5);
    float _2398 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2388);
    float _2400 = _2360 + 1.0;
    float _2402 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2390);
    float _2404 = fma(_2396, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2406 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2398);
    float _2408 = 1.0 / _2382;
    float _2410 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2402);
    float _2412 = fma(_2396, _2404, -0.212114393711090087890625);
    float _2414 = _2370 * 0.693147182464599609375;
    float _2416 = fma(_2396, _2412, 1.570728778839111328125);
    float _2418 = sqrt(_2394);
    float _2420 = -_2360;
    float _2422 = fma(_2392, _2400, _2420);
    float _2424 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2406);
    float _2426 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2428 = fma(_2422, 0.5, 0.5);
    float _2430 = _2424 * _2408;
    float _2432 = _2410 * _2408;
    float _2434 = fma(_2430, 0.5, 0.5);
    float _2436 = fma(_2432, -0.5, 0.5);
    float _2438 = _2418 * 0.636619746685028076171875;
    float _2440 = -_2416;
    float _2442 = fma(_2438, _2440, 1.0);
    float3 _6130 = float3(_2434, _2436, _2426);
    float _2444 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6130, float3(0.0), isnan(_6130)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6130, float3(0.0), isnan(_6130)), level(0.0)).x;
    float3 _6141 = float3(_2434, _2436, _2426);
    float4 _2447 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6141, float3(0.0), isnan(_6141)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6141, float3(0.0), isnan(_6141)), level(0.0)).xyzw;
    float _2449 = _2447.x;
    float _2451 = _2447.y;
    float _2453 = _2447.z;
    float _2455 = _2447.w;
    float2 _6158 = float2(_2442, _2428);
    float3 _2459 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6158, float2(0.0), isnan(_6158)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6158, float2(0.0), isnan(_6158)), level(0.0)).xyz;
    float _2461 = _2459.x;
    float _2463 = _2459.y;
    float _2465 = _2459.z;
    float _2467 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2469 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2471 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2469);
    float _2473 = exp2(_2467);
    float _2475 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2471);
    float _2477 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2475);
    float _2479 = _2477 + _2382;
    out.gl_Position.x = _2424;
    out.gl_Position.y = _2410;
    out.gl_Position.z = _2477;
    out.gl_Position.w = _2382;
    float _2481 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2483 = _2479 * 0.5;
    float _2485 = -_2473;
    float _2487 = _2485 + 1.0;
    out.m_47.x = _2481;
    float _2489 = _2487 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _2483;
    out.m_68.w = _2382;
    float _2491 = _2489 * _2444;
    float _2493 = -_2489;
    float _2495 = _2493 + 1.0;
    float _2497 = _2455 * _2491;
    float _2499 = _2465 * _2491;
    float _2501 = _2455 * _2495;
    float _2503 = fma(_2461, _2497, _2449);
    float _2505 = fma(_2463, _2497, _2451);
    float _2507 = fma(_2455, _2499, _2453);
    out.m_70.x = _2503;
    out.m_70.y = _2505;
    out.m_70.z = _2507;
    out.m_70.w = _2501;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1912 = false;
    bool _391 = false;
    bool _193 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2564 = as_type<float>(_105);
        out.gl_Position.z = _2564;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2633 = as_type<float>(_143);
        out.gl_Position.z = _2633;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    bool _151 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _153 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _155 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _157 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _159 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _153);
    float _161 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _155);
    float _163 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _157);
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _159);
    float _167 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _161);
    float _169 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _163);
    bool _171 = !_151;
    float _173 = _165;
    float _191;
    if (!_171)
    {
        float _175 = in.m_53.x;
        float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _181 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _183 = _181 * _177;
        float _185 = floor(_183);
        float _187 = -_185;
        float _189 = _183 + _187;
        _191 = _189;
        _193 = true;
    }
    else
    {
        float _195 = float(_89);
        float _197 = 1.0 / _195;
        float _199 = _123 * _197;
        _191 = _199;
    }
    _193 = false;
    float _201 = _191;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = _201 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _213 = _201 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _219 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _223;
    float _227 = 1.0 / _217;
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _231 = 1.0 / _225;
    bool _233 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _235 = isnan(_201);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _241 = _237 || _239;
    float _243 = float(_241);
    float _245 = 1.0 / _221;
    float _247 = _205 * _227;
    bool _249 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _251 = isnan(_201);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = _209 * _231;
    bool _263 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _265 = isnan(_201);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = -_243;
    float _277 = _275 + 1.0;
    float _279 = _273 * _277;
    float _281 = -_273;
    float _283 = _281 + 1.0;
    float _285 = _213 * _245;
    float _287 = -_259;
    float _289 = _287 + 1.0;
    bool _291 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _293 = isnan(_201);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _311 = _243 * _289;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _321 = fma(_305, _247, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = _301 * _283;
    float _325 = fma(_315, _247, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _327 = fma(_309, _285, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _329 = fma(_319, _285, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _331 = -_301;
    float _333 = _331 + 1.0;
    float _335 = _321 * _323;
    float _337 = _325 * _323;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _339;
    float _343 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _335);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _345;
    float _349 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _337);
    float _351 = fma(_341, _261, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _353 = fma(_327, _279, _343);
    float _355 = fma(_347, _261, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _357 = fma(_329, _279, _349);
    float _359 = fma(_351, _311, _353);
    float _361 = fma(_355, _311, _357);
    float _363 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[146].x, _359);
    float _365 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[146].y, _361);
    bool _367 = !_229;
    float _387;
    float _389;
    if (!_367)
    {
        float _369 = in.m_53.x;
        float _371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _373 = _369 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _377 = _375 * _371;
        float _379 = float(_89);
        float _381 = floor(_377);
        float _383 = -_381;
        float _385 = _377 + _383;
        _387 = _379;
        _389 = _385;
        _391 = true;
    }
    else
    {
        float _393 = float(_89);
        float _395 = 1.0 / _393;
        float _397 = _123 * _395;
        _387 = _393;
        _389 = _397;
    }
    _391 = false;
    float _399 = _387;
    float _401 = _389;
    float _403 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _405 = int(_403);
    float _407 = in.m_53.x;
    float _409 = in.m_53.y;
    float _411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _413 = int(_411);
    float _415 = in.m_53.z;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _419 = as_type<float>(int(gl_VertexIndex));
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _425 = float(_405);
    float _427 = 1.0 / _399;
    float _429 = float(uint(_413));
    float _431 = 1.0 / _425;
    int _433 = ~_413;
    int _435 = _433 + 1;
    int _437 = ~_413;
    int _439 = _437 + 1;
    float _441 = _409 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _443 = _413 == 0;
    int _445 = ~_413;
    int _447 = _445 + 1;
    float _449 = 1.0 / _429;
    float _451 = _431 * _123;
    float _453 = 1.0 / _423;
    int _455 = as_type<int>(_449) + (-2);
    float _457 = trunc(_451);
    int _459 = int(_457);
    float _461 = _407 + _415;
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _465 = _463 != 0;
    float _467 = _461 + (-1.0);
    float _469 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _471 = float(uint(_459));
    float _473 = as_type<float>(_455) * _471;
    float _475 = trunc(_473);
    float _477 = precise::max(_475, 0.0);
    uint _480 = uint(_477);
    int _482 = _435 * int(_480);
    int _484 = _482 + _459;
    float _486 = float(_413);
    float _488 = float(uint(_484));
    float _490 = as_type<float>(_455) * _488;
    float _492 = trunc(_490);
    float _494 = precise::max(_492, 0.0);
    uint _496 = uint(_494);
    int _498 = int(_480) + int(_496);
    bool _500 = !_465;
    float _502 = _500 ? 7.345489978790283203125 : 1.0;
    float _504 = float(_459);
    int _506 = _439 * _498;
    int _508 = _506 + _459;
    bool _510 = _504 >= _486;
    bool _512 = isnan(_504);
    bool _514 = _510 || _512;
    bool _516 = isnan(_486);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    bool _522 = uint(_508) >= uint(_413);
    float _524 = _502 * _407;
    float _526 = trunc(_520);
    int _528 = int(_526);
    bool _530 = !_522;
    int _532 = _530 ? 0 : (-1);
    int _534 = ~_498;
    int _536 = _534 + _532;
    int _538 = _536 + 1;
    float _540 = floor(_524);
    int _542 = _413 * _538;
    int _544 = _542 + _459;
    int _546 = ~_528;
    int _548 = _546 + 1;
    int _550 = _548 + 1;
    bool _552 = !_443;
    int _554 = _552 ? _544 : (-1);
    int _556 = _554 * _550;
    float _558 = -_540;
    float _560 = _524 + _558;
    int _562 = _413 + (-1);
    float _564 = _560 * _486;
    float _566 = _486 * _123;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _570 = _568 != 0;
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _574 = _572 != 0;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _578 = _576 != 0;
    float _580 = trunc(_564);
    int _582 = int(_580);
    float _584 = _566 * _427;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _588 = _586 != 0;
    int _590 = _528 * _562;
    int _592 = _590 + _556;
    bool _594 = !_574;
    int _596 = _594 ? 0 : 1;
    bool _598 = !_570;
    int _600 = _598 ? 0 : 1;
    float _602 = trunc(_584);
    int _604 = int(_602);
    bool _606 = !_588;
    int _608 = _606 ? 0 : 1;
    int _610 = abs(_596);
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _614 = _612 != 0;
    bool _616 = !_578;
    int _618 = _616 ? 0 : 1;
    int _620 = _592 * _610;
    int _622 = abs(_600);
    int _624 = abs(_608);
    bool _626 = !_614;
    int _628 = _626 ? 0 : 1;
    int _630 = abs(_618);
    int _632 = _582 * _624;
    int _634 = _632 + _459;
    int _636 = abs(_628);
    int _638 = _604 * _622;
    int _640 = _638 + _620;
    int _642 = ~_413;
    int _644 = _642 + 1;
    int _646 = _634 * _630;
    int _648 = _646 + _640;
    int _650 = _582 * _636;
    int _652 = _650 + _648;
    int _654 = ~_413;
    int _656 = _654 + 1;
    float _658 = float(uint(_652));
    float _660 = as_type<float>(_455) * _658;
    float _662 = trunc(_660);
    float _664 = precise::max(_662, 0.0);
    uint _666 = uint(_664);
    int _668 = _656 * int(_666);
    int _670 = _668 + _652;
    float _672 = float(uint(_670));
    float _674 = as_type<float>(_455) * _672;
    float _676 = trunc(_674);
    float _678 = precise::max(_676, 0.0);
    uint _680 = uint(_678);
    float _682 = _415 * 2.0;
    float _684 = floor(_682);
    int _686 = int(_666) + int(_680);
    float _688 = _407 * 2.0;
    int _690 = _644 * _686;
    int _692 = _690 + _652;
    float _694 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _696 = log2(_694);
    bool _698 = uint(_692) >= uint(_413);
    bool _700 = !_698;
    int _702 = _700 ? 0 : (-1);
    float _704 = floor(_688);
    int _706 = ~_686;
    int _708 = _706 + _702;
    int _710 = _708 + 1;
    float _712 = _696 * _123;
    int _714 = _413 * _710;
    int _716 = _714 + _652;
    float _718 = _409 * 2.0;
    float _720 = exp2(_712);
    bool _722 = !_443;
    int _724 = _722 ? _716 : (-1);
    bool _726 = _704 > 0.0;
    int _728 = _724 & 3;
    bool _730 = _728 != 0;
    float _732 = floor(_718);
    int _734 = _724 & 3;
    bool _736 = _734 != 0;
    float _738 = in.m_58.x;
    float _740 = in.m_58.y;
    bool _742 = uint(_728) > 1u;
    bool _744 = _728 != 3;
    bool _746 = _704 >= 0.0;
    bool _748 = isnan(_704);
    bool _750 = _746 || _748;
    bool _752 = isnan(0.0);
    bool _754 = _750 || _752;
    float _756 = -_720;
    float _758 = _756 + 1.0;
    int _760 = _736 ? 0 : 1;
    bool _762 = uint(_728) >= 2u;
    int _764 = _754 ? 0 : 1;
    int _766 = _762 ? 0 : 1;
    bool _768 = _732 > 0.0;
    bool _770 = _732 >= 0.0;
    bool _772 = isnan(_732);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.0);
    bool _778 = _774 || _776;
    int _780 = ~_760;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    int _786 = ~_766;
    int _788 = _786 + 1;
    int _790 = _788 + 1;
    int _792 = _784;
    int _794 = _790;
    if (!_742)
    {
        int _796 = ~_760;
        int _798 = _796 + 1;
        _792 = _798;
    }
    int _800 = _792;
    float _802 = _363 * _738;
    int _804 = ~_764;
    int _806 = _804 + 1;
    int _808 = _806 + 1;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _812 = _808;
    if (_744)
    {
        int _814 = ~_766;
        int _816 = _814 + 1;
        _794 = _816;
    }
    int _818 = _794;
    float _820 = _365 * _740;
    int _822 = _778 ? 0 : 1;
    float _824 = _802 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (!_726)
    {
        int _826 = ~_764;
        int _828 = _826 + 1;
        _812 = _828;
    }
    int _830 = _812;
    float _832 = _820 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _834 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _836 = isnan(0.0);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _842 = _838 || _840;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _846 = _844 != 0;
    bool _848 = _684 >= 0.0;
    bool _850 = isnan(_684);
    bool _852 = _848 || _850;
    bool _854 = isnan(0.0);
    bool _856 = _852 || _854;
    bool _858 = _684 > 0.0;
    int _860 = ~_822;
    int _862 = _860 + 1;
    int _864 = _862 + 1;
    bool _866 = !_846;
    int _868 = _866 ? 0 : 1;
    float _870 = _842 ? _758 : 0.0;
    int _872 = _856 ? 0 : 1;
    int _874 = _864;
    if (!_768)
    {
        int _876 = ~_822;
        int _878 = _876 + 1;
        _874 = _878;
    }
    int _880 = _874;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _884 = _882 != 0;
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _888 = _886 != 0;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _892 = _890 != 0;
    float _894 = in.m_44.x;
    float _896 = in.m_44.y;
    float _898 = in.m_44.z;
    int _900 = ~_872;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    bool _906 = !_888;
    int _908 = _906 ? 0 : 1;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _912 = _910 != 0;
    int _914 = _904;
    if (!_858)
    {
        int _916 = ~_872;
        int _918 = _916 + 1;
        _914 = _918;
    }
    int _920 = _914;
    int _922 = as_type<int>(_419) & 1;
    bool _924 = _922 != 0;
    int _926 = as_type<int>(_419) & 2;
    bool _928 = _926 != 0;
    float _930 = _407 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _936 = -_810;
    float _938 = fma(_930, 2.0, _936);
    float _940 = 1.0 / _934;
    bool _942 = !_884;
    int _944 = _942 ? 0 : 1;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _946;
    float _950 = float(_830);
    int _952 = abs(_944);
    float _954 = _896 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _956 = _896 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _958 = fma(_441, -2.0, _417);
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _964 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[4].x, _954);
    float _966 = float(uint(_634));
    float _968 = _896 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _970 = _409 + _415;
    float _972 = _962 * _453;
    float _974 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[5].x, _956);
    float _976 = as_type<float>(_455) * _966;
    float _978 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[6].x, _968);
    float _980 = _948 * _940;
    float _982 = _970 + (-1.0);
    float _984 = _407 + _409;
    float _986 = trunc(_976);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    float _992 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _994 = _984 + (-1.0);
    int _996 = abs(_908);
    float _998 = fma(_898, (*spvDescriptorSet0.vp_c10)._m0[5].z, _974);
    float _1000 = fma(_898, (*spvDescriptorSet0.vp_c10)._m0[4].z, _964);
    float _1002 = float(_952);
    float _1004 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1006 = float(_920);
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1010 = _401 + _1008;
    float _1012 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _958);
    float _1014 = _415 + (-0.5);
    float _1016 = _1002 * _1006;
    float _1018 = float(_996);
    int _1020 = _447 * int(_990);
    int _1022 = _1020 + _634;
    float _1024 = fma(_980, _1010, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1026 = _1000 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1028 = _724 >> 31;
    float _1030 = _1018 * _950;
    float _1032 = float(uint(_1022));
    float _1034 = fma(_898, (*spvDescriptorSet0.vp_c10)._m0[6].z, _978);
    bool _1036 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1038 = isnan(1.0);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1044 = _1040 || _1042;
    float _1046 = in.m_60.x;
    float _1048 = in.m_60.y;
    float _1050 = in.m_60.z;
    float _1052 = as_type<float>(_455) * _1032;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1056 = 1.0 + _1054;
    int _1058 = _1028 & 3;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1062 = !_892;
    int _1064 = _1062 ? 0 : 1;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1068 = 1.0 / _1056;
    int _1070 = _724 + _1058;
    float _1072 = -_123;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[76].x, _938);
    float _1076 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1066);
    float _1078 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1060);
    int _1080 = _1070 >> 2;
    float _1082 = _1034 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1084 = abs(_1064);
    float _1086 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1076);
    int _1088 = _1080 << 4;
    int _1090 = _1088 + 368;
    float _1092 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1078);
    float _1094 = float(_880);
    float _1096 = _1016 * (-2.0);
    float _1098 = float(_1084);
    float _1100 = _1030 * (-2.0);
    uint _1102 = uint(int(uint(_1090) >> uint(2)));
    uint _1104 = uint(int(uint(int(_1102)) >> uint(2)));
    int _1106 = int(_1102) & 3;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[int(_1104)][_1106];
    int _1110 = int(_1102) + 1;
    uint _1112 = uint(int(uint(_1110) >> uint(2)));
    int _1114 = _1110 & 3;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[int(_1112)][_1114];
    if (_1044)
    {
        float _1118 = _870 * _1068;
        _127 = _1118;
    }
    float _1120 = _127;
    float _1122 = fma(_1096, _1046, _1046);
    float _1124 = _1098 * _1094;
    float _1126 = fma(_1004, _1096, _1004);
    float _1128 = fma(_1100, _1048, _1048);
    float _1130 = trunc(_1052);
    float _1132 = precise::max(_1130, 0.0);
    uint _1134 = uint(_1132);
    float _1136 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1138 = _1090 + 8;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    uint _1142 = uint(int(uint(int(_1140)) >> uint(2)));
    int _1144 = int(_1140) & 3;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[int(_1142)][_1144];
    int _1148 = int(_1140) + 1;
    uint _1150 = uint(int(uint(_1148) >> uint(2)));
    int _1152 = _1148 & 3;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[int(_1150)][_1152];
    bool _1156 = !_730;
    int _1158 = _1156 ? 0 : 1;
    float _1160 = fma(_992, _1100, _992);
    bool _1162 = _728 != 3;
    float _1164 = _1136 * _407;
    float _1166 = _407 + (-0.5);
    float _1168 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1170 = int(_1168);
    bool _1172 = !_1162;
    int _1174 = _1172 ? 0 : (-1);
    bool _1176 = _407 > 0.5;
    float _1178 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1122);
    int _1180 = abs(_1174);
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1184 = _1182 != 0;
    float _1186 = fma(_1126, _1120, _1178);
    int _1188 = int(_990) + int(_1134);
    int _1190 = ~_413;
    int _1192 = _1190 + 1;
    float _1194 = _1186 * 0.15915493667125701904296875;
    int _1196 = abs(_1170);
    int _1198 = _1192 * _1188;
    int _1200 = _1198 + _634;
    float _1202 = float(uint(_1170));
    float _1204 = _1124 * (-2.0);
    bool _1206 = uint(_1200) >= uint(_413);
    float _1208 = float(uint(_1196));
    float _1210 = fma(_1204, _1050, _1050);
    int _1212 = abs(_800);
    float _1214 = fma(_469, _1204, _469);
    bool _1216 = !_1206;
    int _1218 = _1216 ? 0 : (-1);
    float _1220 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1210);
    int _1222 = ~_1212;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    float _1228 = 1.0 / _1202;
    int _1230 = abs(_1158);
    float _1232 = fma(_1214, _1120, _1220);
    bool _1234 = _409 > 0.5;
    float _1236 = _409 + (-0.5);
    int _1238 = ~_1188;
    int _1240 = _1238 + _1218;
    int _1242 = _1240 + 1;
    int _1244 = _1226 * as_type<int>(_1116);
    int _1246 = abs(_818);
    float _1248 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1128);
    int _1250 = ~_1230;
    int _1252 = _1250 + 1;
    int _1254 = _1252 + 1;
    float _1256 = 1.0 / _1208;
    int _1258 = abs(_868);
    float _1260 = fma(_1160, _1120, _1248);
    int _1262 = _1254 * as_type<int>(_1108);
    int _1264 = _1262 + _1244;
    int _1266 = ~_1246;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    float _1272 = _1260 * 0.15915493667125701904296875;
    int _1274 = ~_1180;
    int _1276 = _1274 + 1;
    int _1278 = _1276 + 1;
    float _1280 = _1232 * 0.15915493667125701904296875;
    int _1282 = ~_1258;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    int _1288 = _1270 * as_type<int>(_1146);
    int _1290 = _1288 + _1264;
    float _1292 = _1194 * 6.283185482025146484375;
    float _1294 = sin(_1292);
    int _1296 = as_type<int>(_1228) + (-2);
    int _1298 = _1278 * as_type<int>(_1154);
    int _1300 = _1298 + _1290;
    bool _1302 = !_928;
    float _1304 = _1302 ? (-0.5) : 0.5;
    int _1306 = _413 * _1242;
    int _1308 = _1306 + _634;
    bool _1310 = !_924;
    float _1312 = _1310 ? (-0.5) : 0.5;
    int _1314 = _1300 * _1286;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1318 = _401 + _1316;
    float _1320 = _1194 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    bool _1324 = !_443;
    int _1326 = _1324 ? _1308 : (-1);
    float _1328 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1312);
    float _1330 = fma(_972, _1318, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1332 = as_type<int>(_1256) + (-2);
    int _1334 = _1326 * _1258;
    int _1336 = _1334 + _1314;
    float _1338 = _824 * _1328;
    float _1340 = _1272 * 6.283185482025146484375;
    float _1342 = sin(_1340);
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1304);
    int _1346 = ~_1196;
    int _1348 = _1346 + 1;
    int _1350 = abs(_1336);
    float _1352 = _832 * _1344;
    float _1354 = float(uint(_1336));
    float _1356 = _1280 * 6.283185482025146484375;
    float _1358 = cos(_1356);
    float _1360 = as_type<float>(_1296) * _1354;
    bool _1362 = _1170 == 0;
    float _1364 = float(uint(_1350));
    float _1366 = _1272 * 6.283185482025146484375;
    float _1368 = cos(_1366);
    float _1370 = _1322 * _1342;
    float _1372 = _1294 * _1342;
    float _1374 = _1280 * 6.283185482025146484375;
    float _1376 = sin(_1374);
    float _1378 = _1342 * _1358;
    float _1380 = _1294 * _1368;
    float _1382 = as_type<float>(_1332) * _1364;
    float _1384 = _1322 * _1368;
    float _1386 = _1368 * _1358;
    float _1388 = _1358 * _1352;
    float _1390 = trunc(_1360);
    float _1392 = precise::max(_1390, 0.0);
    uint _1394 = uint(_1392);
    float _1396 = -_1352;
    float _1398 = _1376 * _1396;
    float _1400 = -_1370;
    float _1402 = fma(_1376, _1380, _1400);
    float _1404 = -_1380;
    float _1406 = fma(_1376, _1370, _1404);
    float _1408 = fma(_1376, _1384, _1372);
    float _1410 = fma(_1376, _1372, _1384);
    float _1412 = trunc(_1382);
    float _1414 = precise::max(_1412, 0.0);
    uint _1416 = uint(_1414);
    int _1418 = ~_1170;
    int _1420 = _1418 + 1;
    float _1422 = fma(_1386, _1338, _1398);
    int _1424 = ~_1196;
    int _1426 = _1424 + 1;
    float _1428 = _1322 * _1388;
    float _1430 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1432 = _1294 * _1388;
    float _1434 = fma(_1408, _1338, _1428);
    float _1436 = fma(_1378, _1430, _1422);
    float _1438 = fma(_1402, _1338, _1432);
    bool _1440 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1442 = isnan(_401);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    int _1452 = _1420 * int(_1394);
    int _1454 = _1452 + _1336;
    float _1456 = fma(_1406, _1430, _1434);
    float _1458 = fma(_1410, _1430, _1438);
    bool _1460 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1462 = isnan(_401);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1468 = _1464 || _1466;
    float _1470 = float(_1468);
    int _1472 = _1426 * int(_1416);
    int _1474 = _1472 + _1350;
    float _1476 = float(uint(_1454));
    float _1478 = -_1450;
    float _1480 = _1478 + 1.0;
    float _1482 = trunc(_1164);
    int _1484 = int(_1482);
    float _1486 = float(uint(_1474));
    float _1488 = as_type<float>(_1296) * _1476;
    float _1490 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1492 = -_1312;
    int _1494 = _1176 ? as_type<int>(_1492) : as_type<int>(_1312);
    float _1496 = as_type<float>(_1332) * _1486;
    bool _1498 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1500 = isnan(_401);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1506 = _1502 || _1504;
    float _1508 = float(_1506);
    float _1510 = _1470 * _1480;
    float _1512 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1514 = trunc(_1488);
    float _1516 = precise::max(_1514, 0.0);
    uint _1518 = uint(_1516);
    float _1520 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1490);
    float _1522 = -_1470;
    float _1524 = _1522 + 1.0;
    float _1526 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1512);
    bool _1528 = !_1184;
    float _1530 = _1528 ? _1312 : as_type<float>(_1494);
    float _1532 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1520);
    float _1534 = _1508 * _1524;
    float _1536 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1526);
    float _1538 = trunc(_1496);
    float _1540 = precise::max(_1538, 0.0);
    uint _1542 = uint(_1540);
    float _1544 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1546 = _1024 * _1534;
    float _1548 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1550 = _1484 << 4;
    int _1552 = _1550 + 1968;
    float _1554 = _1082 + _1544;
    float _1556 = _1026 + _1548;
    int _1558 = int(_1394) + int(_1518);
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1562 = _1554 + _1560;
    int _1564 = _1552 + 8;
    uint _1566 = uint(int(uint(_1564) >> uint(2)));
    uint _1568 = uint(int(uint(int(_1566)) >> uint(2)));
    int _1570 = int(_1566) & 3;
    float _1572 = (*spvDescriptorSet0.vp_c9)._m0[int(_1568)][_1570];
    float _1574 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1576 = _1556 + _1574;
    float _1578 = _1562 * _1562;
    float _1580 = _1576 * _1576;
    int _1582 = int(_1416) + int(_1542);
    float _1584 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1586 = ~_1170;
    int _1588 = _1586 + 1;
    float _1590 = _1580 + _1578;
    uint _1592 = uint(int(uint(_1552) >> uint(2)));
    uint _1594 = uint(int(uint(int(_1592)) >> uint(2)));
    int _1596 = int(_1592) & 3;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[int(_1594)][_1596];
    int _1600 = int(_1592) + 1;
    uint _1602 = uint(int(uint(_1600) >> uint(2)));
    int _1604 = _1600 & 3;
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[int(_1602)][_1604];
    float _1608 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1584);
    float _1610 = -_1304;
    int _1612 = _1234 ? as_type<int>(_1610) : as_type<int>(_1304);
    float _1614 = sqrt(_1590);
    int _1616 = _1588 * _1558;
    int _1618 = _1616 + _1336;
    float _1620 = -_1508;
    float _1622 = _1620 + 1.0;
    int _1624 = _1348 * _1582;
    int _1626 = _1624 + _1350;
    bool _1628 = !_912;
    float _1630 = _1628 ? _1304 : as_type<float>(_1612);
    float _1632 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1608);
    bool _1634 = uint(_1618) >= uint(_1170);
    float _1636 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1546);
    int _1638 = _1336 ^ _1170;
    float _1640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1642 = uint(_1626) >= uint(_1196);
    bool _1644 = !_1634;
    int _1646 = _1644 ? 0 : (-1);
    uint _1648 = uint(int(uint(_1638) >> uint(31)));
    bool _1650 = _1614 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1654 = !_1642;
    int _1656 = _1654 ? 0 : (-1);
    int _1658 = ~int(_1648);
    int _1660 = _1658 + 1;
    float _1662 = _998 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1664 = _1632 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1666 = ~_1656;
    int _1668 = _1582 + _1666;
    int _1670 = _1668 + 1;
    int _1672 = ~_1558;
    int _1674 = _1672 + _1646;
    int _1676 = _1674 + 1;
    float _1678 = _1662 + _1664;
    int _1680 = _1670 ^ _1660;
    bool _1682 = _1170 == 0;
    int _1684 = _1170 * _1676;
    int _1686 = _1684 + _1336;
    int _1688 = ~_1660;
    int _1690 = _1688 + _1680;
    int _1692 = _1690 + 1;
    float _1694 = as_type<float>(_1336);
    float _1696 = as_type<float>(_1170);
    float _1698 = as_type<float>(_1676);
    float _1700 = _1580;
    float _1702 = _1578;
    if (!_1650)
    {
        _1694 = _1556;
    }
    float _1704 = _1694;
    float _1706 = _1704;
    if (!_1650)
    {
        _1696 = _1554;
    }
    float _1708 = _1696;
    float _1710 = _1708;
    if (!_1650)
    {
        _1698 = _1678;
    }
    float _1712 = _1698;
    bool _1714 = !_1650;
    float _1716 = _1712;
    if (!_1714)
    {
        float _1718 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1720 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1722 = _1614 + _1720;
        float _1724 = rsqrt(_1590);
        float _1726 = _1722 * _1718;
        float _1728 = _1678 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1730 = _1726 * 0.15915493667125701904296875;
        float _1732 = _1730 * 6.283185482025146484375;
        float _1734 = sin(_1732);
        float _1736 = _1730 * 6.283185482025146484375;
        float _1738 = cos(_1736);
        float _1740 = fma(_1734, _1728, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1742 = _1724 * _1740;
        float _1744 = _1738 + (-1.0);
        float _1746 = fma(_1576, _1742, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1748 = fma(_1562, _1742, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1750 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1754 = _1746 + _1752;
        float _1756 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1758 = _1748 + _1756;
        float _1760 = fma(_1678, _1738, _1750);
        float _1762 = _1754 * _1754;
        float _1764 = _1758 * _1758;
        _1716 = _1760;
        _1700 = _1762;
        _1702 = _1764;
        _1706 = _1746;
        _1710 = _1748;
    }
    float _1766 = _1716;
    float _1768 = _1700;
    float _1770 = _1702;
    float _1772 = _1706;
    float _1774 = _1710;
    bool _1776 = !_1682;
    int _1778 = _1776 ? _1686 : (-1);
    float _1780 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1782 = !_1362;
    int _1784 = _1782 ? _1692 : (-1);
    float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1788 = _1766 + _1786;
    float _1790 = float(_1778);
    float _1792 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1794 = float(_1784);
    float _1796 = fma(_1788, _1788, _1768);
    float _1798 = fma(_1330, _1510, _1636);
    float _1800 = fma(_1780, _1790, _1074);
    float _1802 = _1530 + 0.5;
    float _1804 = -_1012;
    float _1806 = fma(_1792, _1794, _1804);
    float _1808 = _1630 + (-0.5);
    float _1810 = _1796 + _1770;
    float _1812 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1798);
    float _1814 = fma(_1780, _1802, _1800);
    float _1816 = -_1792;
    float _1818 = fma(_1816, _1808, _1806);
    float _1820 = _1598 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1822 = -_1086;
    float _1824 = _1822 + 1.0;
    float _1826 = sqrt(_1810);
    float _1828 = _1606 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1830 = -_1824;
    float _1832 = fma(_1530, _1830, _1814);
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1840 = _1572 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1842 = -_1092;
    float _1844 = _1842 + 1.0;
    float _1846 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1850 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1852 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1854 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1856 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1858 = _1840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1860 = _1812 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1862 = fma(_1630, _1844, _1818);
    bool _1864 = _1826 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1866 = isnan(_1826);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1872 = _1868 || _1870;
    out.m_62.x = _1856;
    out.m_62.y = _1846;
    out.m_62.z = _1858;
    out.m_62.w = _1848;
    out.m_64.x = _1850;
    out.m_64.y = _1852;
    out.m_64.z = _1854;
    out.m_64.w = _1860;
    out.m_66.x = _1832;
    out.m_66.y = _1862;
    float _1874 = _1820;
    float _1876 = _1862;
    if (!_1872)
    {
        _1874 = 1.0;
    }
    float _1878 = _1874;
    bool _1880 = !_1872;
    float _1882 = _1878;
    if (!_1880)
    {
        bool _1884 = _1826 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1886 = isnan(_1826);
        bool _1888 = _1884 || _1886;
        bool _1890 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1892 = _1888 || _1890;
        if (!_1892)
        {
            float _1894 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1896 = _1826 + _1894;
            float _1898 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1900 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1898;
            float _1902 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1904 = _1902 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1906 = 1.0 / _1900;
            float _1908 = _1896 * _1906;
            float _1910 = fma(_1908, _1904, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1882 = _1910;
            _1912 = true;
        }
        else
        {
            bool _1914 = _1826 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1916 = isnan(_1826);
            bool _1918 = _1914 || _1916;
            bool _1920 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1922 = _1918 || _1920;
            if (!_1922)
            {
                float _1924 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1926 = _1826 + _1924;
                float _1928 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1930 = _1928 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1932 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1934 = _1932 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1936 = 1.0 / _1930;
                float _1938 = _1926 * _1936;
                float _1940 = fma(_1938, _1934, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1882 = _1940;
                _1912 = true;
            }
            else
            {
                _1882 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1912 = false;
    float _1942 = _1882;
    float _1944 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1946 = _1766 + _1944;
    float _1948 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1950 = _1772 + _1948;
    float _1952 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1954 = _1774 + _1952;
    float _1956 = fma(_1946, _1942, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1958 = fma(_1950, _1942, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1960 = fma(_1954, _1942, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1962 = -_1662;
    float _1964 = _1962 + _1956;
    float _1966 = -_1026;
    float _1968 = _1966 + _1958;
    float _1970 = -_1082;
    float _1972 = _1970 + _1960;
    float _1974 = _1964 * _1964;
    float _1976 = fma(_1968, _1968, _1974);
    float _1978 = fma(_1972, _1972, _1976);
    float _1980 = sqrt(_1978);
    bool _1982 = _1980 > 0.0;
    bool _1984 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1986 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan(0.5);
    bool _1992 = _1988 || _1990;
    float _1994 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1996 = _1958;
    float _1998 = _1964;
    float _2000 = _1956;
    if (!_1982)
    {
        _1876 = _1956;
    }
    float _2002 = _1876;
    float _2004 = _2002;
    if (!_1982)
    {
        _1994 = _1960;
    }
    float _2006 = _1994;
    bool _2008 = !_1982;
    float _2010 = _2006;
    if (!_2008)
    {
        float _2012 = _167 * _167;
        float _2014 = rsqrt(_1978);
        float _2016 = fma(_165, _165, _2012);
        float _2018 = fma(_169, _169, _2016);
        float _2020 = sqrt(_2018);
        float _2022 = _1968 * _2014;
        float _2024 = _1964 * _2014;
        float _2026 = _1972 * _2014;
        bool _2028 = _2020 > 0.0;
        float _2030 = _2020;
        float _2032 = _2014;
        if (!_2028)
        {
            _2030 = _1956;
        }
        float _2034 = _2030;
        _2004 = _2034;
        if (!_2028)
        {
            _2032 = _1960;
        }
        float _2036 = _2032;
        bool _2038 = !_2028;
        _2010 = _2036;
        if (!_2038)
        {
            float _2040 = rsqrt(_2018);
            float _2042 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2044 = _167 * _2040;
            float _2046 = _165 * _2040;
            float _2048 = _2024 * _2044;
            float _2050 = _169 * _2040;
            float _2052 = fma(_2022, _2046, _2048);
            float _2054 = _2042 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2056 = fma(_2026, _2050, _2052);
            float _2058 = _2056 * _2054;
            float _2060 = fma(_165, _2058, _1958);
            float _2062 = fma(_167, _2058, _1956);
            float _2064 = fma(_169, _2058, _1960);
            _1996 = _2060;
            _2010 = _2064;
            _2004 = _2062;
            _1998 = _2058;
        }
    }
    float _2066 = _1996;
    float _2068 = _2010;
    float _2070 = _2004;
    float _2072 = _1998;
    float _2074 = _2070;
    float _2076 = _2068;
    float _2078 = _2066;
    if (_1992)
    {
        _173 = _2066;
    }
    float _2080 = _173;
    float _2082 = _2080;
    if (!_1992)
    {
        float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2086 = _1662 + _2084;
        float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2090 = _1026 + _2088;
        float _2092 = -_1082;
        float _2094 = _2092 + _2068;
        float _2096 = _2086 * _2086;
        float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2100 = _1082 + _2098;
        float _2102 = fma(_2090, _2090, _2096);
        float _2104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2106 = fma(_2100, _2100, _2102);
        float _2108 = -_1026;
        float _2110 = _2108 + _2066;
        float _2112 = sqrt(_2106);
        float _2114 = precise::min(_2112, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2116 = _2114 * _2104;
        float _2118 = -_1662;
        float _2120 = _2118 + _2070;
        float _2122 = fma(_2110, _2116, _1026);
        float _2124 = fma(_2120, _2116, _1662);
        float _2126 = fma(_2094, _2116, _1082);
        _2074 = _2124;
        _2082 = _2122;
        _2076 = _2126;
    }
    float _2128 = _2074;
    float _2130 = _2082;
    float _2132 = _2076;
    float _2134 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2136 = _2128 + _2134;
    float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2140 = _2130 + _2138;
    float _2142 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2144 = _2132 + _2142;
    float _2146 = _2136 * _2136;
    float _2148 = fma(_2140, _2140, _2146);
    float _2150 = fma(_2144, _2144, _2148);
    float _2152 = rsqrt(_2150);
    float _2154 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2156 = _2140 * _2154;
    float _2158 = _2144 * _2154;
    float _2160 = _2156 * _2156;
    float _2162 = _2158 * _2158;
    float _2164 = _2160 + _2162;
    float _2166 = sqrt(_2164);
    bool _2168 = _2166 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2172 = _2166 + _2170;
    float _2174 = _2152;
    float _2176 = _2172;
    float _2178 = _2154;
    float _2180 = _2156;
    if (_2168)
    {
        float _2182 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2174 = _2182;
    }
    float _2184 = _2174;
    if (_2168)
    {
        float _2186 = rsqrt(_2164);
        _2078 = _2186;
    }
    float _2188 = _2078;
    float _2190 = _2188;
    if (_2168)
    {
        float _2192 = _2172 * _2184;
        _2176 = _2192;
    }
    float _2194 = _2176;
    if (_2168)
    {
        float _2196 = _2194 * 0.15915493667125701904296875;
        _2000 = _2196;
    }
    float _2198 = _2000;
    float _2200 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2202 = _2072;
    if (_2168)
    {
        float _2204 = _2198 * 6.283185482025146484375;
        float _2206 = sin(_2204);
        _2202 = _2206;
    }
    float _2208 = _2202;
    float _2210 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2212 = precise::max(0.0, _2210);
    float _2214 = _2144;
    float _2216 = _2212;
    float _2218 = _2210;
    if (_2168)
    {
        float _2220 = _2198 * 6.283185482025146484375;
        float _2222 = cos(_2220);
        _2214 = _2222;
    }
    float _2224 = _2214;
    float _2226 = -_2154;
    float _2228 = -_2212;
    float _2230 = fma(_2136, _2226, _2228);
    float _2232 = _2230;
    if (_2168)
    {
        float _2234 = _2230 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2216 = _2234;
    }
    float _2236 = _2216;
    float _2238 = sqrt(_2150);
    float _2240 = _2208;
    float _2242 = _2236;
    if (_2168)
    {
        float _2244 = fma(_2208, _2236, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2240 = _2244;
    }
    float _2246 = _2240;
    float _2248 = _2246;
    if (_2168)
    {
        float _2250 = _2224 + (-1.0);
        _2218 = _2250;
    }
    float _2252 = _2218;
    float _2254 = _2252;
    if (_2168)
    {
        float _2256 = _2188 * _2246;
        _2178 = _2256;
    }
    float _2258 = _2178;
    if (!_2168)
    {
        _2190 = _2230;
    }
    float _2260 = _2190;
    float _2262 = _2260;
    if (_2168)
    {
        float _2264 = _2252 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2242 = _2264;
    }
    float _2266 = _2242;
    if (_2168)
    {
        float _2268 = _2156 * _2258;
        _2180 = _2268;
    }
    float _2270 = _2180;
    if (!_2168)
    {
        _2248 = _2158;
    }
    float _2272 = _2248;
    float _2274 = _2272;
    if (_2168)
    {
        float _2276 = _2158 * _2258;
        _2274 = _2276;
    }
    float _2278 = _2274;
    if (!_2168)
    {
        _2254 = _2160;
    }
    float _2280 = _2254;
    float _2282 = _2280;
    if (_2168)
    {
        float _2284 = fma(_2230, _2224, _2266);
        _2262 = _2284;
    }
    float _2286 = _2262;
    if (_2168)
    {
        float _2288 = _2270 * _2270;
        _2282 = _2288;
    }
    float _2290 = _2282;
    if (!_2168)
    {
        _2232 = _2162;
    }
    float _2292 = _2232;
    float _2294 = _2292;
    if (_2168)
    {
        float _2296 = _2278 * _2278;
        _2294 = _2296;
    }
    float _2298 = _2294;
    float _2300 = fma(_2286, _2286, _2290);
    float _2302 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2304 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2306 = _2300 + _2298;
    float _2308 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2302);
    float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2312 = fma(_2238, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2310);
    float _2314 = precise::clamp(_2312, 0.0, 1.0);
    float _2316 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2318 = rsqrt(_2306);
    float _2320 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2308);
    float _2322 = -_2314;
    float _2324 = _2322 + 1.0;
    float _2326 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2328 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2316);
    float _2330 = _2320 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2332 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2304);
    float _2334 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2326);
    float _2336 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2328);
    float _2338 = abs(_2324);
    float _2340 = log2(_2338);
    float _2342 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2344 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2334);
    float _2346 = _2336 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2348 = -_2342;
    float _2350 = fma(_2348, _2200, 1.0);
    float _2352 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2332);
    float _2354 = _2344 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2356 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2358 = _2318 * _2270;
    float _2360 = _2318 * _2286;
    float _2362 = _2318 * _2278;
    float _2364 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2356);
    float _2366 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2368 = _2352 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2370 = log2(_2350);
    float _2372 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2364);
    float _2374 = -_2366;
    float _2376 = fma(_2360, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2374);
    float _2378 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2380 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2382 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2372);
    float _2384 = -_2362;
    float _2386 = fma(_2384, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2376);
    float _2388 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2390 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2380);
    float _2392 = exp2(_2378);
    float _2394 = fma(_2386, -0.5, 0.5);
    float _2396 = fma(_2386, 0.5, 0.5);
    float _2398 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2388);
    float _2400 = _2360 + 1.0;
    float _2402 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2390);
    float _2404 = fma(_2396, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2406 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2398);
    float _2408 = 1.0 / _2382;
    float _2410 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2402);
    float _2412 = fma(_2396, _2404, -0.212114393711090087890625);
    float _2414 = _2370 * 0.693147182464599609375;
    float _2416 = fma(_2396, _2412, 1.570728778839111328125);
    float _2418 = sqrt(_2394);
    float _2420 = -_2360;
    float _2422 = fma(_2392, _2400, _2420);
    float _2424 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2406);
    float _2426 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2428 = fma(_2422, 0.5, 0.5);
    float _2430 = _2424 * _2408;
    float _2432 = _2410 * _2408;
    float _2434 = fma(_2430, 0.5, 0.5);
    float _2436 = fma(_2432, -0.5, 0.5);
    float _2438 = _2418 * 0.636619746685028076171875;
    float _2440 = -_2416;
    float _2442 = fma(_2438, _2440, 1.0);
    float3 _6130 = float3(_2434, _2436, _2426);
    float _2444 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6130, float3(0.0), isnan(_6130)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6130, float3(0.0), isnan(_6130)), level(0.0)).x;
    float3 _6141 = float3(_2434, _2436, _2426);
    float4 _2447 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6141, float3(0.0), isnan(_6141)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6141, float3(0.0), isnan(_6141)), level(0.0)).xyzw;
    float _2449 = _2447.x;
    float _2451 = _2447.y;
    float _2453 = _2447.z;
    float _2455 = _2447.w;
    float2 _6158 = float2(_2442, _2428);
    float3 _2459 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6158, float2(0.0), isnan(_6158)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6158, float2(0.0), isnan(_6158)), level(0.0)).xyz;
    float _2461 = _2459.x;
    float _2463 = _2459.y;
    float _2465 = _2459.z;
    float _2467 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2469 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2471 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2469);
    float _2473 = exp2(_2467);
    float _2475 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2471);
    float _2477 = fma(_2368, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2475);
    float _2479 = _2477 + _2382;
    out.gl_Position.x = _2424;
    out.gl_Position.y = _2410;
    out.gl_Position.z = _2477;
    out.gl_Position.w = _2382;
    float _2481 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2483 = _2479 * 0.5;
    float _2485 = -_2473;
    float _2487 = _2485 + 1.0;
    out.m_47.x = _2481;
    float _2489 = _2487 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _2483;
    out.m_68.w = _2382;
    float _2491 = _2489 * _2444;
    float _2493 = -_2489;
    float _2495 = _2493 + 1.0;
    float _2497 = _2455 * _2491;
    float _2499 = _2465 * _2491;
    float _2501 = _2455 * _2495;
    float _2503 = fma(_2461, _2497, _2449);
    float _2505 = fma(_2463, _2497, _2451);
    float _2507 = fma(_2455, _2499, _2453);
    out.m_70.x = _2503;
    out.m_70.y = _2505;
    out.m_70.z = _2507;
    out.m_70.w = _2501;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

