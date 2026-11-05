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
    constant _16* vp_c13 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    sampler vp_t_tcb_1CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_70 [[user(locn0)]];
    float4 m_64 [[user(locn2)]];
    float4 m_76 [[user(locn3)]];
    float4 m_82 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_68 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_56 [[attribute(7)]];
    float4 m_72 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2623 = false;
    bool _1872 = false;
    bool _395 = false;
    bool _197 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_46.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_49.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2876 = as_type<float>(_117);
        out.gl_Position.z = _2876;
    }
    if (!_105)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _121 = in.m_51.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = 0.0;
    float _139 = _135;
    if (_131)
    {
        float _141 = float(_101);
        _137 = _141;
    }
    float _143 = _137;
    bool _145 = _135 >= _143;
    bool _147 = !_131;
    bool _149 = _145 || _147;
    if (_149)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _111;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _119 = as_type<int>(_153);
    }
    int _155 = _119;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2945 = as_type<float>(_155);
        out.gl_Position.z = _2945;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _161 = as_type<int>(_157) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_157) & 2;
    bool _167 = _165 != 0;
    bool _169 = !_163;
    float _171 = _169 ? (-0.5) : 0.5;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_159;
    float _195;
    if (!_177)
    {
        float _179 = in.m_56.x;
        float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _185 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _187 = _185 * _181;
        float _189 = floor(_187);
        float _191 = -_189;
        float _193 = _187 + _191;
        _195 = _193;
        _197 = true;
    }
    else
    {
        float _199 = float(_101);
        float _201 = 1.0 / _199;
        float _203 = _135 * _201;
        _195 = _203;
    }
    _197 = false;
    float _205 = _195;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = _205 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _213 = _205 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _205 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _225 = _223 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _227;
    bool _231 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _233 = isnan(_205);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = 1.0 / _221;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _247 = 1.0 / _229;
    float _249 = 1.0 / _225;
    float _251 = _209 * _243;
    bool _253 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _255 = isnan(_205);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -_241;
    float _267 = _265 + 1.0;
    float _269 = _263 * _267;
    float _271 = _213 * _247;
    bool _273 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _275 = isnan(_205);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -_263;
    float _287 = _285 + 1.0;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _293 = _283 * _287;
    float _295 = -_283;
    float _297 = _295 + 1.0;
    float _299 = _217 * _249;
    bool _301 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _303 = isnan(_205);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    float _317 = fma(_291, _299, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _327 = fma(_315, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _329 = _311 * _297;
    float _331 = fma(_321, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _333 = fma(_325, _299, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _335 = -_311;
    float _337 = _335 + 1.0;
    float _339 = _327 * _329;
    float _341 = _331 * _329;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _343;
    float _347 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].x, _339);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _349;
    float _353 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].y, _341);
    float _355 = fma(_345, _271, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _357 = fma(_317, _293, _347);
    float _359 = fma(_351, _271, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _361 = fma(_333, _293, _353);
    float _363 = fma(_355, _269, _357);
    float _365 = fma(_359, _269, _361);
    float _367 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[146].x, _363);
    float _369 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[146].y, _365);
    bool _371 = !_245;
    float _391;
    float _393;
    if (!_371)
    {
        float _373 = in.m_56.x;
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _377 = float(_101);
        float _379 = _373 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _383 = _381 * _375;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _377;
        _393 = _389;
        _395 = true;
    }
    else
    {
        float _397 = float(_101);
        float _399 = 1.0 / _397;
        float _401 = _135 * _399;
        _391 = _397;
        _393 = _401;
    }
    _395 = false;
    float _403 = _391;
    float _405 = _393;
    float _407 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _409 = int(_407);
    float _411 = in.m_56.x;
    float _413 = in.m_56.y;
    float _415 = in.m_46.x;
    float _417 = in.m_46.y;
    float _419 = in.m_46.z;
    float _421 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _423 = int(_421);
    float _425 = float(_409);
    float _427 = 1.0 / _403;
    float _429 = float(uint(_423));
    float _431 = 1.0 / _425;
    int _433 = ~_423;
    int _435 = _433 + 1;
    int _437 = ~_423;
    int _439 = _437 + 1;
    float _441 = 1.0 / _429;
    float _443 = _431 * _135;
    float _445 = trunc(_443);
    int _447 = int(_445);
    int _449 = as_type<int>(_441) + (-2);
    float _451 = float(_423);
    float _453 = float(uint(_447));
    float _455 = as_type<float>(_449) * _453;
    float _457 = trunc(_455);
    float _459 = precise::max(_457, 0.0);
    uint _462 = uint(_459);
    int _464 = ~_423;
    int _466 = _464 + 1;
    int _468 = _435 * int(_462);
    int _470 = _468 + _447;
    float _472 = float(uint(_470));
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _476 = _474 != 0;
    float _478 = as_type<float>(_449) * _472;
    float _480 = trunc(_478);
    float _482 = precise::max(_480, 0.0);
    uint _484 = uint(_482);
    int _486 = int(_462) + int(_484);
    float _488 = float(_447);
    bool _490 = !_476;
    float _492 = _490 ? 7.345489978790283203125 : 1.0;
    int _494 = _466 * _486;
    int _496 = _494 + _447;
    bool _498 = _488 >= _451;
    bool _500 = isnan(_488);
    bool _502 = _498 || _500;
    bool _504 = isnan(_451);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = _492 * _411;
    bool _512 = uint(_496) >= uint(_423);
    float _514 = trunc(_508);
    int _516 = int(_514);
    bool _518 = !_512;
    int _520 = _518 ? 0 : (-1);
    bool _522 = _423 == 0;
    int _524 = ~_486;
    int _526 = _524 + _520;
    int _528 = _526 + 1;
    float _530 = floor(_510);
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _534 = _532 != 0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _542 = _540 != 0;
    int _544 = _423 * _528;
    int _546 = _544 + _447;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _550 = _548 != 0;
    int _552 = ~_516;
    int _554 = _552 + 1;
    int _556 = _554 + 1;
    bool _558 = !_522;
    int _560 = _558 ? _546 : (-1);
    int _562 = _560 * _556;
    float _564 = -_530;
    float _566 = _510 + _564;
    int _568 = _423 + (-1);
    float _570 = _566 * _451;
    float _572 = _451 * _135;
    int _574 = _516 * _568;
    int _576 = _574 + _562;
    bool _578 = !_538;
    int _580 = _578 ? 0 : 1;
    float _582 = _572 * _427;
    float _584 = trunc(_570);
    int _586 = int(_584);
    bool _588 = !_550;
    int _590 = _588 ? 0 : 1;
    bool _592 = !_534;
    int _594 = _592 ? 0 : 1;
    int _596 = abs(_580);
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _600 = _598 != 0;
    float _602 = trunc(_582);
    int _604 = int(_602);
    int _606 = abs(_590);
    bool _608 = !_542;
    int _610 = _608 ? 0 : 1;
    int _612 = abs(_594);
    int _614 = _586 * _606;
    int _616 = _614 + _447;
    bool _618 = !_600;
    int _620 = _618 ? 0 : 1;
    int _622 = abs(_610);
    int _624 = _576 * _596;
    int _626 = abs(_620);
    float _628 = in.m_58.x;
    float _630 = in.m_58.y;
    float _632 = in.m_58.z;
    float _634 = in.m_58.w;
    int _636 = _604 * _612;
    int _638 = _636 + _624;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _642 = _640 != 0;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _646 = _644 != 0;
    int _648 = _616 * _622;
    int _650 = _648 + _638;
    int _652 = ~_423;
    int _654 = _652 + 1;
    float _656 = float(uint(_616));
    int _658 = _586 * _626;
    int _660 = _658 + _650;
    float _662 = in.m_60.x;
    float _664 = in.m_60.y;
    float _666 = in.m_60.z;
    float _668 = in.m_60.w;
    float _670 = float(uint(_660));
    float _672 = as_type<float>(_449) * _670;
    float _674 = trunc(_672);
    float _676 = precise::max(_674, 0.0);
    uint _678 = uint(_676);
    float _680 = _417 * _630;
    float _682 = fma(_415, _628, _680);
    int _684 = _654 * int(_678);
    int _686 = _684 + _660;
    float _688 = float(uint(_686));
    float _690 = as_type<float>(_449) * _688;
    float _692 = trunc(_690);
    float _694 = precise::max(_692, 0.0);
    uint _696 = uint(_694);
    float _698 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _700 = log2(_698);
    int _702 = int(_678) + int(_696);
    float _704 = in.m_62.x;
    float _706 = in.m_62.y;
    float _708 = in.m_62.z;
    float _710 = in.m_62.w;
    int _712 = _439 * _702;
    int _714 = _712 + _660;
    float _716 = _700 * _135;
    bool _718 = uint(_714) >= uint(_423);
    bool _720 = !_718;
    int _722 = _720 ? 0 : (-1);
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _726 = _724 != 0;
    int _728 = ~_702;
    int _730 = _728 + _722;
    int _732 = _730 + 1;
    float _734 = _417 * _664;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _738 = _423 * _732;
    int _740 = _738 + _660;
    float _742 = fma(_415, _662, _734);
    float _744 = fma(_419, _632, _682);
    float _746 = _417 * _706;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _752 = _413 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _754 = _744 + _634;
    float _756 = fma(_415, _704, _746);
    bool _758 = !_522;
    int _760 = _758 ? _740 : (-1);
    float _762 = 1.0 / _750;
    float _764 = fma(_752, -2.0, _736);
    float _766 = fma(_419, _666, _742);
    int _768 = _760 & 3;
    bool _770 = _768 != 0;
    float _772 = fma(_419, _708, _756);
    int _774 = _760 & 3;
    bool _776 = _774 != 0;
    float _778 = _411 * 2.0;
    bool _780 = uint(_768) > 1u;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _782;
    float _786 = exp2(_716);
    int _788 = _776 ? 0 : 1;
    float _790 = in.m_56.z;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _794 = ~_788;
    int _796 = _794 + 1;
    int _798 = _796 + 1;
    float _800 = _784 * _762;
    float _802 = _413 * 2.0;
    float _804 = -_792;
    float _806 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[77].x, _804);
    bool _808 = _411 > 0.5;
    float _810 = floor(_778);
    int _812 = _798;
    if (!_780)
    {
        int _814 = ~_788;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    float _820 = _413 + _411;
    bool _822 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _824 = isnan(1.0);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _830 = _826 || _828;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _834 = 1.0 + _832;
    float _836 = -_786;
    float _838 = _836 + 1.0;
    float _840 = 1.0 / _834;
    float _842 = -_171;
    int _844 = _808 ? as_type<int>(_842) : as_type<int>(_171);
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _848 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _850 = isnan(0.0);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _856 = _852 || _854;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _860 = !_642;
    float _862 = _860 ? _171 : as_type<float>(_844);
    float _864 = _820 + (-1.0);
    bool _866 = _413 > 0.5;
    float _868 = floor(_802);
    float _870 = _856 ? _838 : 0.0;
    float _872 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[78].z, _846);
    float _874 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[78].w, _858);
    float _876 = -_175;
    int _878 = _866 ? as_type<int>(_876) : as_type<int>(_175);
    float _880 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _882 = _810 > 0.0;
    float _884 = -_135;
    float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[76].x, _806);
    bool _888 = _810 >= 0.0;
    bool _890 = isnan(_810);
    bool _892 = _888 || _890;
    bool _894 = isnan(0.0);
    bool _896 = _892 || _894;
    float _898 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _872);
    float _900 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _764);
    float _902 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _874);
    if (_830)
    {
        float _904 = _870 * _840;
        _139 = _904;
    }
    float _906 = _139;
    float _908 = _413 + _790;
    float _910 = _790 * 2.0;
    float _912 = _766 + _668;
    bool _914 = _868 > 0.0;
    float _916 = _908 + (-1.0);
    int _918 = _896 ? 0 : 1;
    float _920 = floor(_910);
    bool _922 = _868 >= 0.0;
    bool _924 = isnan(_868);
    bool _926 = _922 || _924;
    bool _928 = isnan(0.0);
    bool _930 = _926 || _928;
    float _932 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _934 = _760 >> 31;
    float _936 = as_type<float>(_449) * _656;
    int _938 = _930 ? 0 : 1;
    float _940 = _862 + 0.5;
    int _942 = ~_918;
    int _944 = _942 + 1;
    int _946 = _944 + 1;
    float _948 = -_898;
    float _950 = _948 + 1.0;
    int _952 = _934 & 3;
    float _954 = trunc(_936);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    int _960 = _946;
    float _962 = _912;
    if (!_882)
    {
        int _964 = ~_918;
        int _966 = _964 + 1;
        _960 = _966;
    }
    int _968 = _960;
    float _970 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[80].x, _886);
    bool _972 = !_646;
    float _974 = _972 ? _175 : as_type<float>(_878);
    float _976 = _772 + _710;
    int _978 = ~_938;
    int _980 = _978 + 1;
    int _982 = _980 + 1;
    float _984 = -_950;
    float _986 = fma(_862, _984, _970);
    bool _988 = uint(_768) >= 2u;
    float _990 = _974 + (-0.5);
    int _992 = _982;
    float _994 = _976;
    if (!_914)
    {
        int _996 = ~_938;
        int _998 = _996 + 1;
        _992 = _998;
    }
    int _1000 = _992;
    float _1002 = -_902;
    float _1004 = _1002 + 1.0;
    int _1006 = _760 + _952;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1010 = _405 + _1008;
    int _1012 = _988 ? 0 : 1;
    float _1014 = -_990;
    float _1016 = -_900;
    float _1018 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1016);
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1022 = _1020 != 0;
    int _1024 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1026 = _1024 != 0;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1030 = _1028 != 0;
    int _1032 = _1006 >> 2;
    float _1034 = fma(_974, _1004, _1018);
    bool _1036 = _920 >= 0.0;
    bool _1038 = isnan(_920);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan(0.0);
    bool _1044 = _1040 || _1042;
    int _1046 = _1032 << 4;
    int _1048 = _1046 + 368;
    int _1050 = _1044 ? 0 : 1;
    out.m_64.x = _986;
    out.m_64.y = _1034;
    bool _1052 = _920 > 0.0;
    float _1054 = fma(_800, _1010, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1056 = ~_423;
    int _1058 = _1056 + 1;
    uint _1060 = uint(int(uint(_1048) >> uint(2)));
    uint _1062 = uint(int(uint(int(_1060)) >> uint(2)));
    int _1064 = int(_1060) & 3;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[int(_1062)][_1064];
    int _1068 = int(_1060) + 1;
    uint _1070 = uint(int(uint(_1068) >> uint(2)));
    int _1072 = _1068 & 3;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[int(_1070)][_1072];
    bool _1076 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1078 = isnan(_405);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1084 = _1080 || _1082;
    float _1086 = float(_1084);
    bool _1088 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1090 = isnan(_405);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    int _1100 = _1058 * int(_958);
    int _1102 = _1100 + _616;
    bool _1104 = !_1022;
    int _1106 = _1104 ? 0 : 1;
    float _1108 = -_1086;
    float _1110 = _1108 + 1.0;
    bool _1112 = _768 != 3;
    float _1114 = float(uint(_1102));
    float _1116 = _1098 * _1110;
    int _1118 = _1048 + 8;
    uint _1120 = uint(int(uint(_1118) >> uint(2)));
    uint _1122 = uint(int(uint(int(_1120)) >> uint(2)));
    int _1124 = int(_1120) & 3;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[int(_1122)][_1124];
    int _1128 = int(_1120) + 1;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    int _1132 = _1128 & 3;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[int(_1130)][_1132];
    float _1136 = -_1098;
    float _1138 = _1136 + 1.0;
    int _1140 = ~_423;
    int _1142 = _1140 + 1;
    float _1144 = as_type<float>(_449) * _1114;
    float _1146 = _1054 * _1116;
    int _1148 = abs(_818);
    int _1150 = ~_1012;
    int _1152 = _1150 + 1;
    int _1154 = _1152 + 1;
    float _1156 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1146);
    float _1158 = trunc(_1144);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    int _1164 = abs(_1106);
    bool _1166 = !_770;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1156);
    int _1172 = ~_1148;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    int _1178 = abs(_1168);
    float _1180 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1182 = float(_1164);
    int _1184 = _1154;
    if (_1112)
    {
        int _1186 = ~_1012;
        int _1188 = _1186 + 1;
        _1184 = _1188;
    }
    int _1190 = _1184;
    int _1192 = ~_1050;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    int _1198 = abs(_1190);
    int _1200 = int(_958) + int(_1162);
    int _1202 = _1196;
    if (!_1052)
    {
        int _1204 = ~_1050;
        int _1206 = _1204 + 1;
        _1202 = _1206;
    }
    int _1208 = _1202;
    float _1210 = float(_968);
    int _1212 = _1142 * _1200;
    int _1214 = _1212 + _616;
    float _1216 = float(_1208);
    bool _1218 = uint(_1214) >= uint(_423);
    int _1220 = _1176 * as_type<int>(_1074);
    int _1222 = ~_1178;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    float _1228 = _1182 * _1216;
    int _1230 = ~_1198;
    int _1232 = _1230 + 1;
    int _1234 = _1232 + 1;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1238 = _912 + _1236;
    bool _1240 = !_1218;
    int _1242 = _1240 ? 0 : (-1);
    int _1244 = _1226 * as_type<int>(_1066);
    int _1246 = _1244 + _1220;
    bool _1248 = !_726;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = _1228 * (-2.0);
    bool _1254 = _768 != 3;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1258 = _976 + _1256;
    int _1260 = _1234 * as_type<int>(_1126);
    int _1262 = _1260 + _1246;
    int _1264 = abs(_1250);
    float _1266 = in.m_66.x;
    float _1268 = in.m_66.y;
    float _1270 = in.m_66.z;
    bool _1272 = !_1254;
    int _1274 = _1272 ? 0 : (-1);
    int _1276 = ~_1200;
    int _1278 = _1276 + _1242;
    int _1280 = _1278 + 1;
    float _1282 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1284 = _754 + _1282;
    int _1286 = abs(_1274);
    bool _1288 = !_1026;
    int _1290 = _1288 ? 0 : 1;
    int _1292 = _423 * _1280;
    int _1294 = _1292 + _616;
    int _1296 = ~_1286;
    int _1298 = _1296 + 1;
    int _1300 = _1298 + 1;
    int _1302 = abs(_1290);
    float _1304 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1306 = _1300 * as_type<int>(_1134);
    int _1308 = _1306 + _1262;
    int _1310 = ~_1264;
    int _1312 = _1310 + 1;
    int _1314 = _1312 + 1;
    float _1316 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1304);
    bool _1318 = !_522;
    int _1320 = _1318 ? _1294 : (-1);
    float _1322 = float(_1302);
    int _1324 = _1308 * _1314;
    float _1326 = fma(_880, _1252, _880);
    float _1328 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1316);
    float _1330 = fma(_1252, _1266, _1266);
    int _1332 = _1320 * _1264;
    int _1334 = _1332 + _1324;
    float _1336 = _1238 * _1238;
    bool _1338 = _1328 >= 0.0;
    float _1340 = _1322 * _1210;
    float _1342 = fma(_1284, _1284, _1336);
    float _1344 = float(_1334);
    float _1346 = fma(_1258, _1258, _1342);
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1354 = _411 + (-0.5);
    float _1356 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1358 = rsqrt(_1346);
    float _1360 = _1342;
    if (_1338)
    {
        _1360 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1362 = _1360;
    float _1364 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1366 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1330);
    bool _1370 = !_1030;
    int _1372 = _1370 ? 0 : 1;
    int _1374 = as_type<int>(_1362);
    if (_1338)
    {
        float _1376 = _1362 * 5.0;
        _1374 = as_type<int>(_1376);
    }
    int _1378 = _1374;
    out.m_68.x = _1344;
    float _1380 = fma(_1326, _906, _1368);
    int _1382 = abs(_1372);
    float _1384 = _413 + (-0.5);
    out.m_70.x = _1356;
    out.m_70.y = _1364;
    out.m_70.z = _1366;
    out.m_70.w = _1180;
    if (_1338)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4722 = as_type<float>(_1378);
        out.gl_Position.z = _4722;
    }
    float _1386 = _1238 * _1358;
    float _1388 = _1284 * _1358;
    if (_1338)
    {
        out.m_49.x = 0.0;
    }
    if (_1338)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1390 = -_1386;
    float _1392 = fma(_1390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _912);
    float _1394 = _1258 * _1358;
    float _1396 = -_1388;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[18].w, _754);
    float _1400 = float(_1000);
    float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1404 = _1392 + _1402;
    float _1406 = _1340 * (-2.0);
    float _1408 = -_1394;
    float _1410 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[18].w, _976);
    float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1414 = _1398 + _1412;
    float _1416 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1418 = fma(_1406, _1268, _1268);
    float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1422 = _1410 + _1420;
    float _1424 = -_1386;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1238);
    float _1428 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1416);
    float _1430 = float(_1382);
    float _1432 = fma(_932, _1406, _932);
    float _1434 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1418);
    float _1436 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1428);
    float _1438 = -_1388;
    float _1440 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1284);
    float _1442 = _1426 * _1426;
    float _1444 = fma(_1432, _906, _1434);
    float _1446 = _1430 * _1400;
    bool _1448 = _1436 >= 0.0;
    float _1450 = fma(_1440, _1440, _1442);
    float _1452 = in.m_72.x;
    float _1454 = in.m_72.y;
    float _1456 = _1444 * 0.15915493667125701904296875;
    float _1458 = _1446 * (-2.0);
    float _1460 = _790 + _411;
    float _1462 = -_1394;
    float _1464 = fma(_1462, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1258);
    float _1466 = _1380 * 0.15915493667125701904296875;
    float _1468 = _1460 + (-1.0);
    float _1470 = fma(_1464, _1464, _1450);
    float _1472 = fma(_1458, _1270, _1270);
    float _1474 = _1466 * 6.283185482025146484375;
    float _1476 = sin(_1474);
    float _1478 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1480 = _790 + (-0.5);
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    int _1484 = as_type<int>(_1472);
    float _1486 = _1394;
    float _1488 = _1422;
    if (_1448)
    {
        _1482 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1490 = _1482;
    if (_1448)
    {
        out.m_49.x = 0.0;
    }
    float _1492 = fma(_1478, _1458, _1478);
    float _1494 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1472);
    float _1496 = _1466 * 6.283185482025146484375;
    float _1498 = cos(_1496);
    if (_1448)
    {
        float _1500 = _1490 * 5.0;
        _1484 = as_type<int>(_1500);
    }
    int _1502 = _1484;
    float _1504 = fma(_1492, _906, _1494);
    if (_1448)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4934 = as_type<float>(_1502);
        out.gl_Position.z = _4934;
    }
    float _1506 = _369 * _1454;
    float _1508 = _1456 * 6.283185482025146484375;
    float _1510 = sin(_1508);
    float _1512 = _1504 * 0.15915493667125701904296875;
    float _1514 = sqrt(_1470);
    float _1516 = _1456 * 6.283185482025146484375;
    float _1518 = cos(_1516);
    if (_1448)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1520 = _1512 * 6.283185482025146484375;
    float _1522 = cos(_1520);
    float _1524 = _1358 * _1514;
    float _1526 = _1506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1528 = _367 * _1452;
    float _1530 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _1532 = _1476 * _1510;
    float _1534 = _1526 * _1524;
    float _1536 = _1528 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1538 = _1512 * 6.283185482025146484375;
    float _1540 = sin(_1538);
    float _1542 = _1498 * _1518;
    float _1544 = _1530 * _1534;
    float _1546 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _171);
    float _1548 = _1536 * _1524;
    float _1550 = _1498 * _1510;
    float _1552 = _1476 * _1518;
    float _1554 = _1498 * _1522;
    float _1556 = _1546 * _1548;
    float _1558 = _1518 * _1522;
    float _1560 = _1476 * _1522;
    float _1562 = _1554 * _1544;
    float _1564 = _1510 * _1522;
    float _1566 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1568 = _1566 * 0.5;
    float _1570 = _1560 * _1544;
    float _1572 = fma(_1540, _1542, _1532);
    float _1574 = -_1544;
    float _1576 = _1540 * _1574;
    float _1578 = -_1552;
    float _1580 = fma(_1540, _1550, _1578);
    float _1582 = -_1550;
    float _1584 = fma(_1540, _1552, _1582);
    float _1586 = fma(_1572, _1556, _1562);
    float _1588 = fma(_1558, _1556, _1576);
    float _1590 = fma(_1540, _1532, _1542);
    float _1592 = fma(_1584, _1556, _1570);
    float _1594 = fma(_1580, _1568, _1586);
    float _1596 = fma(_1564, _1568, _1588);
    float _1598 = _1572 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1600 = fma(_1590, _1568, _1592);
    float _1602 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1604 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1606 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1608 = _1572 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1610 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1602);
    float _1612 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1604);
    float _1614 = _1572 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1616 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1606);
    float _1618 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1610);
    float _1620 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1612);
    float _1622 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1608);
    float _1624 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1598);
    float _1626 = _1618 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1628 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1630 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1614);
    float _1632 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1634 = _754 + _1626;
    float _1636 = _976 + _1628;
    float _1638 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1640 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1642 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1644 = _1634 + _1642;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1648 = _1636 + _1646;
    float _1650 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1616);
    float _1652 = -_1540;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1632);
    float _1656 = _1644 * _1644;
    float _1658 = _1648 * _1648;
    float _1660 = -_1540;
    float _1662 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1638);
    float _1664 = -_1540;
    float _1666 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1640);
    float _1668 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1622);
    float _1670 = _1656 + _1658;
    float _1672 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1624);
    float _1674 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1676 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1630);
    float _1678 = sqrt(_1670);
    float _1680 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1682 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1684 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1686 = _912 + _1674;
    float _1688 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1680);
    float _1690 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1682);
    float _1692 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1684);
    bool _1694 = _1678 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1696 = _1684;
    float _1698 = _1682;
    float _1700 = _1680;
    float _1702 = _1634;
    float _1704 = _1656;
    float _1706 = _1672;
    if (!_1694)
    {
        _1696 = _1634;
    }
    float _1708 = _1696;
    float _1710 = _1708;
    if (!_1694)
    {
        _1698 = _1658;
    }
    float _1712 = _1698;
    float _1714 = _1712;
    if (!_1694)
    {
        _1700 = _1636;
    }
    float _1716 = _1700;
    float _1718 = _1716;
    if (!_1694)
    {
        _1702 = _1686;
    }
    float _1720 = _1702;
    bool _1722 = !_1694;
    float _1724 = _1720;
    if (!_1722)
    {
        float _1726 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1730 = _1678 + _1728;
        float _1732 = rsqrt(_1670);
        float _1734 = _1730 * _1726;
        float _1736 = _1686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1738 = _1734 * 0.15915493667125701904296875;
        float _1740 = _1738 * 6.283185482025146484375;
        float _1742 = sin(_1740);
        float _1744 = _1738 * 6.283185482025146484375;
        float _1746 = cos(_1744);
        float _1748 = fma(_1742, _1736, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1750 = _1732 * _1748;
        float _1752 = fma(_1644, _1750, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1754 = _1746 + (-1.0);
        float _1756 = fma(_1648, _1750, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1760 = _1752 + _1758;
        float _1762 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1764 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1766 = _1756 + _1764;
        float _1768 = _1760 * _1760;
        float _1770 = fma(_1686, _1746, _1762);
        float _1772 = _1766 * _1766;
        _1724 = _1770;
        _1704 = _1768;
        _1714 = _1772;
        _1718 = _1756;
        _1710 = _1752;
    }
    float _1774 = _1724;
    float _1776 = _1704;
    float _1778 = _1714;
    float _1780 = _1718;
    float _1782 = _1710;
    float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1786 = _1774 + _1784;
    float _1788 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1654);
    float _1790 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1662);
    float _1792 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1794 = fma(_1786, _1786, _1776);
    float _1796 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1666);
    float _1798 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1688);
    float _1800 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1690);
    float _1802 = _1794 + _1778;
    float _1804 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1692);
    float _1806 = _171 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1808 = _1792 * _1788;
    float _1810 = _1792 * _1790;
    float _1812 = _1792 * _1796;
    float _1814 = sqrt(_1802);
    float _1816 = fma(_1806, _1668, _1808);
    float _1818 = fma(_1806, _1672, _1810);
    float _1820 = fma(_1806, _1676, _1812);
    float _1822 = _1798 + _1816;
    float _1824 = _1800 + _1818;
    float _1826 = _1804 + _1820;
    out.m_74.x = _1822;
    out.m_74.y = _1824;
    out.m_74.z = _1826;
    bool _1828 = _1814 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1830 = isnan(_1814);
    bool _1832 = _1828 || _1830;
    bool _1834 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1836 = _1832 || _1834;
    if (!_1836)
    {
        _1706 = 1.0;
    }
    float _1838 = _1706;
    bool _1840 = !_1836;
    float _1842 = _1838;
    if (!_1840)
    {
        bool _1844 = _1814 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1846 = isnan(_1814);
        bool _1848 = _1844 || _1846;
        bool _1850 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1852 = _1848 || _1850;
        if (!_1852)
        {
            float _1854 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1856 = _1814 + _1854;
            float _1858 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1860 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1858;
            float _1862 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1864 = _1862 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1866 = 1.0 / _1860;
            float _1868 = _1856 * _1866;
            float _1870 = fma(_1868, _1864, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1842 = _1870;
            _1872 = true;
        }
        else
        {
            bool _1874 = _1814 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1876 = isnan(_1814);
            bool _1878 = _1874 || _1876;
            bool _1880 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1882 = _1878 || _1880;
            if (!_1882)
            {
                float _1884 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1886 = _1814 + _1884;
                float _1888 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1890 = _1888 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1892 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1894 = _1892 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1896 = 1.0 / _1890;
                float _1898 = _1886 * _1896;
                float _1900 = fma(_1898, _1894, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1842 = _1900;
                _1872 = true;
            }
            else
            {
                _1842 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1872 = false;
    float _1902 = _1842;
    float _1904 = _1392 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1906 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1908 = _1780 + _1906;
    float _1910 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1904);
    float _1912 = _1392 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1914 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1916 = _1782 + _1914;
    float _1918 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1910);
    bool _1920 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1922 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1924 = _1920 || _1922;
    bool _1926 = isnan(0.5);
    bool _1928 = _1924 || _1926;
    float _1930 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1932 = _1774 + _1930;
    bool _1934 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1936 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1938 = _1934 || _1936;
    bool _1940 = isnan(0.5);
    bool _1942 = _1938 || _1940;
    float _1944 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1946 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1912);
    float _1948 = fma(_1908, _1902, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1950 = fma(_1916, _1902, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1952 = 1.0 / _1944;
    float _1954 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1946);
    float _1956 = fma(_1932, _1902, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1958 = -_1394;
    float _1960 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1948);
    float _1962 = -_1388;
    float _1964 = fma(_1962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1950);
    float _1966 = _1954 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1968 = -_1386;
    float _1970 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1956);
    float _1972 = _1970;
    float _1974 = _1964;
    float _1976 = _1960;
    float _1978 = _1944;
    if (_1942)
    {
        _1486 = 1.0;
    }
    float _1980 = _1486;
    float _1982 = _1966 + _1944;
    float _1984 = _1982 * _1952;
    float _1986 = _1984 * 0.5;
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1990 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1988);
    float _1992 = 1.0 / _1990;
    float _1994 = _1980;
    if (!_1928)
    {
        float _1996 = _1404 * _1404;
        float _1998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2000 = -_912;
        float _2002 = _2000 + _1956;
        float _2004 = -_976;
        float _2006 = _2004 + _1948;
        float _2008 = fma(_1414, _1414, _1996);
        float _2010 = fma(_1422, _1422, _2008);
        float _2012 = 1.0 / _1524;
        float _2014 = sqrt(_2010);
        float _2016 = precise::min(_2014, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2018 = _2016 * _1998;
        float _2020 = -_754;
        float _2022 = _2020 + _1950;
        float _2024 = _2018 * _2012;
        float _2026 = fma(_2022, _2024, _1398);
        float _2028 = fma(_2002, _2024, _1392);
        float _2030 = fma(_2006, _2024, _1410);
        _1972 = _2028;
        _1974 = _2026;
        _1976 = _2030;
        _994 = _2006;
    }
    float _2032 = _1972;
    float _2034 = _1974;
    float _2036 = _1976;
    float _2038 = _994;
    float _2040 = _2038;
    if (_1942)
    {
        _2040 = 1.0;
    }
    float _2042 = _2040;
    float _2044 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2046 = _1992 * _2044;
    float _2048 = _2042;
    if (!_1942)
    {
        float _2050 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2052 = _2050 * 0.15915493667125701904296875;
        float _2054 = _2052 * 6.283185482025146484375;
        float _2056 = cos(_2054);
        float _2058 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2060 = _2058 * 0.15915493667125701904296875;
        float _2062 = _2052 * 6.283185482025146484375;
        float _2064 = sin(_2062);
        float _2066 = 1.0 / _2056;
        float _2068 = _2060 * 6.283185482025146484375;
        float _2070 = cos(_2068);
        float _2072 = _2064 * _2066;
        float _2074 = _2060 * 6.283185482025146484375;
        float _2076 = sin(_2074);
        float _2078 = _2070 * _2072;
        float _2080 = 1.0 / _2078;
        float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2084 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2082;
        float _2086 = 1.0 / _2084;
        float _2088 = _2076 * _2080;
        float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2092 = fma(_2046, _2088, _2090);
        float _2094 = _2092 * _2086;
        float _2096 = precise::clamp(_2094, 0.0, 1.0);
        _1488 = _2060;
        _1994 = _2096;
    }
    float _2098 = _1488;
    float _2100 = _1994;
    float _2102 = _2098;
    if (!_1942)
    {
        float _2104 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2106 = _2104 * 0.15915493667125701904296875;
        float _2108 = _2106 * 6.283185482025146484375;
        float _2110 = cos(_2108);
        float _2112 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2114 = _2112 * 0.15915493667125701904296875;
        float _2116 = _2106 * 6.283185482025146484375;
        float _2118 = sin(_2116);
        float _2120 = 1.0 / _2110;
        float _2122 = _2114 * 6.283185482025146484375;
        float _2124 = cos(_2122);
        float _2126 = _2118 * _2120;
        float _2128 = _2114 * 6.283185482025146484375;
        float _2130 = sin(_2128);
        float _2132 = _2124 * _2126;
        float _2134 = 1.0 / _2132;
        float _2136 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2138 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2136;
        float _2140 = 1.0 / _2138;
        float _2142 = _2130 * _2134;
        float _2144 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2146 = fma(_2046, _2142, _2144);
        float _2148 = _2146 * _2140;
        float _2150 = precise::clamp(_2148, 0.0, 1.0);
        float _2152 = -_2150;
        float _2154 = _2152 + 1.0;
        _2102 = _2120;
        _2048 = _2154;
    }
    float _2156 = _2102;
    float _2158 = _2048;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2162 = _2032 + _2160;
    float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2166 = _2034 + _2164;
    float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2170 = _2036 + _2168;
    float _2172 = _2162 * _2162;
    float _2174 = fma(_2166, _2166, _2172);
    float _2176 = fma(_2170, _2170, _2174);
    float _2178 = rsqrt(_2176);
    float _2180 = sqrt(_2176);
    float _2182 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2184 = _2166 * _2182;
    float _2186 = _2170 * _2182;
    float _2188 = _2184 * _2184;
    float _2190 = _2186 * _2186;
    float _2192 = _2188 + _2190;
    float _2194 = sqrt(_2192);
    bool _2196 = _2194 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2200 = _2194 + _2198;
    float _2202 = _2156;
    float _2204 = _2192;
    float _2206 = _2200;
    float _2208 = _2162;
    float _2210 = _2184;
    if (_2196)
    {
        float _2212 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2202 = _2212;
    }
    float _2214 = _2202;
    if (_2196)
    {
        float _2216 = rsqrt(_2192);
        _2204 = _2216;
    }
    float _2218 = _2204;
    if (_2196)
    {
        float _2220 = _2200 * _2214;
        _2206 = _2220;
    }
    float _2222 = _2206;
    if (_2196)
    {
        float _2224 = _2222 * 0.15915493667125701904296875;
        _962 = _2224;
    }
    float _2226 = _962;
    float _2228 = _2170;
    float _2230 = _2226;
    if (_2196)
    {
        float _2232 = _2226 * 6.283185482025146484375;
        float _2234 = sin(_2232);
        _2228 = _2234;
    }
    float _2236 = _2228;
    float _2238 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2240 = precise::max(0.0, _2238);
    float _2242 = _2214;
    float _2244 = _2240;
    if (_2196)
    {
        float _2246 = _2226 * 6.283185482025146484375;
        float _2248 = cos(_2246);
        _2242 = _2248;
    }
    float _2250 = _2242;
    float _2252 = -_2182;
    float _2254 = -_2240;
    float _2256 = fma(_2162, _2252, _2254);
    if (_2196)
    {
        float _2258 = _2256 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2208 = _2258;
    }
    float _2260 = _2208;
    float _2262 = _2236;
    float _2264 = _2260;
    if (_2196)
    {
        float _2266 = fma(_2236, _2260, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2262 = _2266;
    }
    float _2268 = _2262;
    float _2270 = _2268;
    if (!_2196)
    {
        _2264 = _2256;
    }
    float _2272 = _2264;
    float _2274 = _2272;
    float _2276 = _2250;
    if (_2196)
    {
        float _2278 = _2250 + (-1.0);
        _2244 = _2278;
    }
    float _2280 = _2244;
    float _2282 = _2280;
    if (_2196)
    {
        float _2284 = _2218 * _2268;
        _1978 = _2284;
    }
    float _2286 = _1978;
    if (!_2196)
    {
        _2270 = _2188;
    }
    float _2288 = _2270;
    float _2290 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2292 = _2288;
    if (_2196)
    {
        float _2294 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2230 = _2294;
    }
    float _2296 = _2230;
    if (_2196)
    {
        float _2298 = _2184 * _2286;
        _2210 = _2298;
    }
    float _2300 = _2210;
    if (!_2196)
    {
        _2282 = _2186;
    }
    float _2302 = _2282;
    float _2304 = _2302;
    if (_2196)
    {
        float _2306 = _2186 * _2286;
        _2304 = _2306;
    }
    float _2308 = _2304;
    if (_2196)
    {
        float _2310 = fma(_2256, _2250, _2296);
        _2274 = _2310;
    }
    float _2312 = _2274;
    if (_2196)
    {
        float _2314 = _2300 * _2300;
        _2292 = _2314;
    }
    float _2316 = _2292;
    if (!_2196)
    {
        _2276 = _2190;
    }
    float _2318 = _2276;
    float _2320 = _2318;
    if (_2196)
    {
        float _2322 = _2308 * _2308;
        _2320 = _2322;
    }
    float _2324 = _2320;
    float _2326 = fma(_2312, _2312, _2316);
    float _2328 = _2326 + _2324;
    float _2330 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2290);
    float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2334 = fma(_2180, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2332);
    float _2336 = precise::clamp(_2334, 0.0, 1.0);
    float _2338 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2340 = rsqrt(_2328);
    float _2342 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2330);
    float _2344 = -_2336;
    float _2346 = _2344 + 1.0;
    float _2348 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2350 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2338);
    float _2352 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2354 = _2342 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2356 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2348);
    float _2358 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2350);
    float _2360 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2352);
    float _2362 = abs(_2346);
    float _2364 = log2(_2362);
    float _2366 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2368 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2370 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2356);
    float _2372 = _2358 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2374 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2360);
    float _2376 = -_2368;
    float _2378 = fma(_2376, _2366, 1.0);
    float _2380 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2382 = _2372 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2384 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2386 = _2340 * _2300;
    float _2388 = _2340 * _2308;
    float _2390 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2382);
    float _2392 = _2340 * _2312;
    float _2394 = _2386 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2396 = log2(_2378);
    float _2398 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2400 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2390);
    float _2402 = -_2394;
    float _2404 = fma(_2392, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2402);
    float _2406 = _2372 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2408 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2400);
    float _2410 = exp2(_2398);
    float _2412 = -_2388;
    float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2404);
    float _2416 = _2372 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2418 = fma(_2414, -0.5, 0.5);
    float _2420 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2416);
    float _2422 = fma(_2414, 0.5, 0.5);
    float _2424 = 1.0 / _2408;
    float _2426 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2406);
    float _2428 = _2392 + 1.0;
    float _2430 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2420);
    float _2432 = fma(_2422, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2434 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2426);
    float _2436 = _2396 * 0.693147182464599609375;
    float _2438 = sqrt(_2418);
    float _2440 = -_2392;
    float _2442 = fma(_2410, _2428, _2440);
    float _2444 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2430);
    float _2446 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2434);
    float _2448 = fma(_2422, _2432, -0.212114393711090087890625);
    float _2450 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2452 = _2444 * _2424;
    float _2454 = _2446 * _2424;
    float _2456 = fma(_2422, _2448, 1.570728778839111328125);
    float _2458 = fma(_2452, 0.5, 0.5);
    float _2460 = fma(_2454, -0.5, 0.5);
    float _2462 = _2438 * 0.636619746685028076171875;
    float _2464 = fma(_2442, 0.5, 0.5);
    float3 _6506 = float3(_2458, _2460, _2450);
    float _2466 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6506, float3(0.0), isnan(_6506)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6506, float3(0.0), isnan(_6506)), level(0.0)).x;
    float3 _6517 = float3(_2458, _2460, _2450);
    float4 _2469 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6517, float3(0.0), isnan(_6517)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6517, float3(0.0), isnan(_6517)), level(0.0)).xyzw;
    float _2471 = _2469.x;
    float _2473 = _2469.y;
    float _2475 = _2469.z;
    float _2477 = _2469.w;
    float _2479 = -_2456;
    float _2481 = fma(_2462, _2479, 1.0);
    float2 _6539 = float2(_2481, _2464);
    float3 _2485 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6539, float2(0.0), isnan(_6539)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6539, float2(0.0), isnan(_6539)), level(0.0)).xyz;
    float _2487 = _2485.x;
    float _2489 = _2485.y;
    float _2491 = _2485.z;
    float _2493 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2495 = _2372 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2497 = _2180 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2499 = isnan(_2180);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2505 = _2501 || _2503;
    float _2507 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2495);
    float _2509 = exp2(_2493);
    float _2511 = _2408 * 0.5;
    float _2513 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2507);
    float _2515 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2513);
    float _2517 = fma(_2446, -0.5, _2511);
    float _2519 = _2444 + _2408;
    float _2521 = _2515 + _2408;
    out.gl_Position.x = _2444;
    out.gl_Position.y = _2446;
    out.gl_Position.z = _2515;
    out.gl_Position.w = _2408;
    float _2523 = _2519 * 0.5;
    float _2525 = _2521 * 0.5;
    float _2527 = -_2509;
    float _2529 = _2527 + 1.0;
    float _2531 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_76.x = _2523;
    out.m_76.y = _2517;
    out.m_76.z = _2525;
    out.m_76.w = _2408;
    float _2533 = -_2531;
    float _2535 = _2533 + 1.0;
    float _2537 = _2100 * _2158;
    float _2539 = _2515;
    float _2541 = _2446;
    float _2543 = _2537;
    if (!_2505)
    {
        _2539 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2545 = _2539;
    float _2547 = _2545;
    float _2549 = _2545;
    if (!_2505)
    {
        _2541 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2551 = _2541;
    float _2553 = _2531 * _2466;
    float _2555 = _2477 * _2535;
    float _2557 = _2537 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2559 = _2551;
    float _2561 = _2551;
    if (!_2505)
    {
        _2543 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2563 = _2543;
    float _2565 = _2477 * _2553;
    float _2567 = _2491 * _2553;
    float _2569 = fma(_2487, _2565, _2471);
    float _2571 = fma(_2489, _2565, _2473);
    float _2573 = fma(_2477, _2567, _2475);
    out.m_78.x = _2569;
    out.m_78.y = _2571;
    out.m_78.z = _2573;
    out.m_78.w = _2555;
    bool _2575 = !_2505;
    float _2577 = _2563;
    float _2579 = _2563;
    if (!_2575)
    {
        bool _2581 = _2180 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2583 = isnan(_2180);
        bool _2585 = _2581 || _2583;
        bool _2587 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2589 = _2585 || _2587;
        if (!_2589)
        {
            float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2593 = _2180 + _2591;
            float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2597 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2595;
            float _2599 = 1.0 / _2597;
            float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2603 = _2601 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2609 = _2593 * _2599;
            float _2611 = precise::clamp(_2609, 0.0, 1.0);
            float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2617 = fma(_2611, _2607, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2619 = fma(_2611, _2615, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2621 = fma(_2611, _2603, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2561 = _2621;
            _2549 = _2619;
            _2579 = _2617;
            _2623 = true;
        }
        else
        {
            bool _2625 = _2180 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2627 = isnan(_2180);
            bool _2629 = _2625 || _2627;
            bool _2631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2633 = _2629 || _2631;
            if (!_2633)
            {
                _2547 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2635 = _2547;
            _2549 = _2635;
            if (!_2633)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2637 = _2559;
            _2561 = _2637;
            if (!_2633)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2639 = _2577;
            bool _2641 = !_2633;
            _2579 = _2639;
            if (!_2641)
            {
                bool _2643 = _2180 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2645 = isnan(_2180);
                bool _2647 = _2643 || _2645;
                bool _2649 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2651 = _2647 || _2649;
                if (!_2651)
                {
                    float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2655 = _2180 + _2653;
                    float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2659 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2657;
                    float _2661 = 1.0 / _2659;
                    float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2669 = _2667 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2671 = _2655 * _2661;
                    float _2673 = precise::clamp(_2671, 0.0, 1.0);
                    float _2675 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2677 = _2675 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2679 = fma(_2673, _2669, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2681 = fma(_2673, _2677, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2683 = fma(_2673, _2665, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2561 = _2683;
                    _2549 = _2681;
                    _2579 = _2679;
                    _2623 = true;
                }
                else
                {
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2549 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2623 = false;
    float _2685 = _2561;
    float _2687 = _2549;
    float _2689 = _2579;
    float _2691 = _2557 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_80.x = 0.0;
    float _2693 = _2685 * 0.586610972881317138671875;
    bool _2695 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _2691;
    float _2697 = fma(_2687, 0.298911988735198974609375, _2693);
    bool _2699 = _2100 > 0.0;
    bool _2701 = isnan(_2100);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan(0.0);
    bool _2707 = _2703 || _2705;
    float _2709 = fma(_2689, 0.114477999508380889892578125, _2697);
    bool _2711 = _2158 <= 0.0;
    bool _2713 = !_2707;
    bool _2715 = _2711 || _2713;
    float _2717 = -_2709;
    float _2719 = _2717 + _2687;
    float _2721 = -_2709;
    float _2723 = _2721 + _2685;
    float _2725 = -_2709;
    float _2727 = _2725 + _2689;
    float _2729 = fma(_2719, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2709);
    float _2731 = fma(_2723, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2709);
    float _2733 = fma(_2727, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2709);
    bool _2735 = !_2695;
    if (!_2735)
    {
        float _2737 = -_2032;
        float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2741 = -_2034;
        float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2745 = -_2036;
        float _2747 = _2745 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2749 = _2739 * _2739;
        float _2751 = fma(_2743, _2743, _2749);
        float _2753 = fma(_2747, _2747, _2751);
        float _2755 = sqrt(_2753);
        float _2757 = rsqrt(_2753);
        float _2759 = -_2755;
        float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2763 = _2761 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2765 = precise::clamp(_2763, 0.0, 1.0);
        float _2767 = _2743 * _2757;
        float _2769 = _2739 * _2757;
        float _2771 = abs(_2765);
        float _2773 = log2(_2771);
        float _2775 = _2747 * _2757;
        float _2777 = _2767 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2779 = _1824 * _2769;
        float _2781 = -_2769;
        float _2783 = -_2777;
        float _2785 = fma(_2781, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2783);
        float _2787 = fma(_1822, _2767, _2779);
        float _2789 = -_2775;
        float _2791 = fma(_2789, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2785);
        float _2793 = fma(_1826, _2775, _2787);
        float _2795 = precise::clamp(_2793, 0.0, 1.0);
        float _2797 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2799 = _2791 + _2797;
        float _2801 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2803 = _2799 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2805 = precise::clamp(_2803, 0.0, 1.0);
        float _2807 = exp2(_2801);
        float _2809 = _2807 * _2805;
        float _2811 = _2795 * _2809;
        float _2813 = _2811 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2815 = _2811 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2817 = _2811 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_80.x = _2813;
        out.m_80.y = _2815;
        out.m_80.z = _2817;
    }
    out.m_82.x = _2729;
    out.m_82.y = _2731;
    out.m_82.z = _2733;
    if (!_2715)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2819 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2819;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2623 = false;
    bool _1872 = false;
    bool _395 = false;
    bool _197 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_46.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_49.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2876 = as_type<float>(_117);
        out.gl_Position.z = _2876;
    }
    if (!_105)
    {
        return out;
    }
    float _121 = in.m_51.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = 0.0;
    float _139 = _135;
    if (_131)
    {
        float _141 = float(_101);
        _137 = _141;
    }
    float _143 = _137;
    bool _145 = _135 >= _143;
    bool _147 = !_131;
    bool _149 = _145 || _147;
    if (_149)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _111;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _119 = as_type<int>(_153);
    }
    int _155 = _119;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2945 = as_type<float>(_155);
        out.gl_Position.z = _2945;
    }
    if (_149)
    {
        return out;
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _161 = as_type<int>(_157) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_157) & 2;
    bool _167 = _165 != 0;
    bool _169 = !_163;
    float _171 = _169 ? (-0.5) : 0.5;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_159;
    float _195;
    if (!_177)
    {
        float _179 = in.m_56.x;
        float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _185 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _187 = _185 * _181;
        float _189 = floor(_187);
        float _191 = -_189;
        float _193 = _187 + _191;
        _195 = _193;
        _197 = true;
    }
    else
    {
        float _199 = float(_101);
        float _201 = 1.0 / _199;
        float _203 = _135 * _201;
        _195 = _203;
    }
    _197 = false;
    float _205 = _195;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = _205 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _213 = _205 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _205 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _225 = _223 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _227;
    bool _231 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _233 = isnan(_205);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = 1.0 / _221;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _247 = 1.0 / _229;
    float _249 = 1.0 / _225;
    float _251 = _209 * _243;
    bool _253 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _255 = isnan(_205);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -_241;
    float _267 = _265 + 1.0;
    float _269 = _263 * _267;
    float _271 = _213 * _247;
    bool _273 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _275 = isnan(_205);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -_263;
    float _287 = _285 + 1.0;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _293 = _283 * _287;
    float _295 = -_283;
    float _297 = _295 + 1.0;
    float _299 = _217 * _249;
    bool _301 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _303 = isnan(_205);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    float _317 = fma(_291, _299, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _327 = fma(_315, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _329 = _311 * _297;
    float _331 = fma(_321, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _333 = fma(_325, _299, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _335 = -_311;
    float _337 = _335 + 1.0;
    float _339 = _327 * _329;
    float _341 = _331 * _329;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _343;
    float _347 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].x, _339);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _349;
    float _353 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].y, _341);
    float _355 = fma(_345, _271, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _357 = fma(_317, _293, _347);
    float _359 = fma(_351, _271, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _361 = fma(_333, _293, _353);
    float _363 = fma(_355, _269, _357);
    float _365 = fma(_359, _269, _361);
    float _367 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[146].x, _363);
    float _369 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[146].y, _365);
    bool _371 = !_245;
    float _391;
    float _393;
    if (!_371)
    {
        float _373 = in.m_56.x;
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _377 = float(_101);
        float _379 = _373 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _383 = _381 * _375;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _377;
        _393 = _389;
        _395 = true;
    }
    else
    {
        float _397 = float(_101);
        float _399 = 1.0 / _397;
        float _401 = _135 * _399;
        _391 = _397;
        _393 = _401;
    }
    _395 = false;
    float _403 = _391;
    float _405 = _393;
    float _407 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _409 = int(_407);
    float _411 = in.m_56.x;
    float _413 = in.m_56.y;
    float _415 = in.m_46.x;
    float _417 = in.m_46.y;
    float _419 = in.m_46.z;
    float _421 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _423 = int(_421);
    float _425 = float(_409);
    float _427 = 1.0 / _403;
    float _429 = float(uint(_423));
    float _431 = 1.0 / _425;
    int _433 = ~_423;
    int _435 = _433 + 1;
    int _437 = ~_423;
    int _439 = _437 + 1;
    float _441 = 1.0 / _429;
    float _443 = _431 * _135;
    float _445 = trunc(_443);
    int _447 = int(_445);
    int _449 = as_type<int>(_441) + (-2);
    float _451 = float(_423);
    float _453 = float(uint(_447));
    float _455 = as_type<float>(_449) * _453;
    float _457 = trunc(_455);
    float _459 = precise::max(_457, 0.0);
    uint _462 = uint(_459);
    int _464 = ~_423;
    int _466 = _464 + 1;
    int _468 = _435 * int(_462);
    int _470 = _468 + _447;
    float _472 = float(uint(_470));
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _476 = _474 != 0;
    float _478 = as_type<float>(_449) * _472;
    float _480 = trunc(_478);
    float _482 = precise::max(_480, 0.0);
    uint _484 = uint(_482);
    int _486 = int(_462) + int(_484);
    float _488 = float(_447);
    bool _490 = !_476;
    float _492 = _490 ? 7.345489978790283203125 : 1.0;
    int _494 = _466 * _486;
    int _496 = _494 + _447;
    bool _498 = _488 >= _451;
    bool _500 = isnan(_488);
    bool _502 = _498 || _500;
    bool _504 = isnan(_451);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = _492 * _411;
    bool _512 = uint(_496) >= uint(_423);
    float _514 = trunc(_508);
    int _516 = int(_514);
    bool _518 = !_512;
    int _520 = _518 ? 0 : (-1);
    bool _522 = _423 == 0;
    int _524 = ~_486;
    int _526 = _524 + _520;
    int _528 = _526 + 1;
    float _530 = floor(_510);
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _534 = _532 != 0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _542 = _540 != 0;
    int _544 = _423 * _528;
    int _546 = _544 + _447;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _550 = _548 != 0;
    int _552 = ~_516;
    int _554 = _552 + 1;
    int _556 = _554 + 1;
    bool _558 = !_522;
    int _560 = _558 ? _546 : (-1);
    int _562 = _560 * _556;
    float _564 = -_530;
    float _566 = _510 + _564;
    int _568 = _423 + (-1);
    float _570 = _566 * _451;
    float _572 = _451 * _135;
    int _574 = _516 * _568;
    int _576 = _574 + _562;
    bool _578 = !_538;
    int _580 = _578 ? 0 : 1;
    float _582 = _572 * _427;
    float _584 = trunc(_570);
    int _586 = int(_584);
    bool _588 = !_550;
    int _590 = _588 ? 0 : 1;
    bool _592 = !_534;
    int _594 = _592 ? 0 : 1;
    int _596 = abs(_580);
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _600 = _598 != 0;
    float _602 = trunc(_582);
    int _604 = int(_602);
    int _606 = abs(_590);
    bool _608 = !_542;
    int _610 = _608 ? 0 : 1;
    int _612 = abs(_594);
    int _614 = _586 * _606;
    int _616 = _614 + _447;
    bool _618 = !_600;
    int _620 = _618 ? 0 : 1;
    int _622 = abs(_610);
    int _624 = _576 * _596;
    int _626 = abs(_620);
    float _628 = in.m_58.x;
    float _630 = in.m_58.y;
    float _632 = in.m_58.z;
    float _634 = in.m_58.w;
    int _636 = _604 * _612;
    int _638 = _636 + _624;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _642 = _640 != 0;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _646 = _644 != 0;
    int _648 = _616 * _622;
    int _650 = _648 + _638;
    int _652 = ~_423;
    int _654 = _652 + 1;
    float _656 = float(uint(_616));
    int _658 = _586 * _626;
    int _660 = _658 + _650;
    float _662 = in.m_60.x;
    float _664 = in.m_60.y;
    float _666 = in.m_60.z;
    float _668 = in.m_60.w;
    float _670 = float(uint(_660));
    float _672 = as_type<float>(_449) * _670;
    float _674 = trunc(_672);
    float _676 = precise::max(_674, 0.0);
    uint _678 = uint(_676);
    float _680 = _417 * _630;
    float _682 = fma(_415, _628, _680);
    int _684 = _654 * int(_678);
    int _686 = _684 + _660;
    float _688 = float(uint(_686));
    float _690 = as_type<float>(_449) * _688;
    float _692 = trunc(_690);
    float _694 = precise::max(_692, 0.0);
    uint _696 = uint(_694);
    float _698 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _700 = log2(_698);
    int _702 = int(_678) + int(_696);
    float _704 = in.m_62.x;
    float _706 = in.m_62.y;
    float _708 = in.m_62.z;
    float _710 = in.m_62.w;
    int _712 = _439 * _702;
    int _714 = _712 + _660;
    float _716 = _700 * _135;
    bool _718 = uint(_714) >= uint(_423);
    bool _720 = !_718;
    int _722 = _720 ? 0 : (-1);
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _726 = _724 != 0;
    int _728 = ~_702;
    int _730 = _728 + _722;
    int _732 = _730 + 1;
    float _734 = _417 * _664;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _738 = _423 * _732;
    int _740 = _738 + _660;
    float _742 = fma(_415, _662, _734);
    float _744 = fma(_419, _632, _682);
    float _746 = _417 * _706;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _752 = _413 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _754 = _744 + _634;
    float _756 = fma(_415, _704, _746);
    bool _758 = !_522;
    int _760 = _758 ? _740 : (-1);
    float _762 = 1.0 / _750;
    float _764 = fma(_752, -2.0, _736);
    float _766 = fma(_419, _666, _742);
    int _768 = _760 & 3;
    bool _770 = _768 != 0;
    float _772 = fma(_419, _708, _756);
    int _774 = _760 & 3;
    bool _776 = _774 != 0;
    float _778 = _411 * 2.0;
    bool _780 = uint(_768) > 1u;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _782;
    float _786 = exp2(_716);
    int _788 = _776 ? 0 : 1;
    float _790 = in.m_56.z;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _794 = ~_788;
    int _796 = _794 + 1;
    int _798 = _796 + 1;
    float _800 = _784 * _762;
    float _802 = _413 * 2.0;
    float _804 = -_792;
    float _806 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[77].x, _804);
    bool _808 = _411 > 0.5;
    float _810 = floor(_778);
    int _812 = _798;
    if (!_780)
    {
        int _814 = ~_788;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    float _820 = _413 + _411;
    bool _822 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _824 = isnan(1.0);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _830 = _826 || _828;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _834 = 1.0 + _832;
    float _836 = -_786;
    float _838 = _836 + 1.0;
    float _840 = 1.0 / _834;
    float _842 = -_171;
    int _844 = _808 ? as_type<int>(_842) : as_type<int>(_171);
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _848 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _850 = isnan(0.0);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _856 = _852 || _854;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _860 = !_642;
    float _862 = _860 ? _171 : as_type<float>(_844);
    float _864 = _820 + (-1.0);
    bool _866 = _413 > 0.5;
    float _868 = floor(_802);
    float _870 = _856 ? _838 : 0.0;
    float _872 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[78].z, _846);
    float _874 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[78].w, _858);
    float _876 = -_175;
    int _878 = _866 ? as_type<int>(_876) : as_type<int>(_175);
    float _880 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _882 = _810 > 0.0;
    float _884 = -_135;
    float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[76].x, _806);
    bool _888 = _810 >= 0.0;
    bool _890 = isnan(_810);
    bool _892 = _888 || _890;
    bool _894 = isnan(0.0);
    bool _896 = _892 || _894;
    float _898 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _872);
    float _900 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _764);
    float _902 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _874);
    if (_830)
    {
        float _904 = _870 * _840;
        _139 = _904;
    }
    float _906 = _139;
    float _908 = _413 + _790;
    float _910 = _790 * 2.0;
    float _912 = _766 + _668;
    bool _914 = _868 > 0.0;
    float _916 = _908 + (-1.0);
    int _918 = _896 ? 0 : 1;
    float _920 = floor(_910);
    bool _922 = _868 >= 0.0;
    bool _924 = isnan(_868);
    bool _926 = _922 || _924;
    bool _928 = isnan(0.0);
    bool _930 = _926 || _928;
    float _932 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _934 = _760 >> 31;
    float _936 = as_type<float>(_449) * _656;
    int _938 = _930 ? 0 : 1;
    float _940 = _862 + 0.5;
    int _942 = ~_918;
    int _944 = _942 + 1;
    int _946 = _944 + 1;
    float _948 = -_898;
    float _950 = _948 + 1.0;
    int _952 = _934 & 3;
    float _954 = trunc(_936);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    int _960 = _946;
    float _962 = _912;
    if (!_882)
    {
        int _964 = ~_918;
        int _966 = _964 + 1;
        _960 = _966;
    }
    int _968 = _960;
    float _970 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[80].x, _886);
    bool _972 = !_646;
    float _974 = _972 ? _175 : as_type<float>(_878);
    float _976 = _772 + _710;
    int _978 = ~_938;
    int _980 = _978 + 1;
    int _982 = _980 + 1;
    float _984 = -_950;
    float _986 = fma(_862, _984, _970);
    bool _988 = uint(_768) >= 2u;
    float _990 = _974 + (-0.5);
    int _992 = _982;
    float _994 = _976;
    if (!_914)
    {
        int _996 = ~_938;
        int _998 = _996 + 1;
        _992 = _998;
    }
    int _1000 = _992;
    float _1002 = -_902;
    float _1004 = _1002 + 1.0;
    int _1006 = _760 + _952;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1010 = _405 + _1008;
    int _1012 = _988 ? 0 : 1;
    float _1014 = -_990;
    float _1016 = -_900;
    float _1018 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1016);
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1022 = _1020 != 0;
    int _1024 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1026 = _1024 != 0;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1030 = _1028 != 0;
    int _1032 = _1006 >> 2;
    float _1034 = fma(_974, _1004, _1018);
    bool _1036 = _920 >= 0.0;
    bool _1038 = isnan(_920);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan(0.0);
    bool _1044 = _1040 || _1042;
    int _1046 = _1032 << 4;
    int _1048 = _1046 + 368;
    int _1050 = _1044 ? 0 : 1;
    out.m_64.x = _986;
    out.m_64.y = _1034;
    bool _1052 = _920 > 0.0;
    float _1054 = fma(_800, _1010, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1056 = ~_423;
    int _1058 = _1056 + 1;
    uint _1060 = uint(int(uint(_1048) >> uint(2)));
    uint _1062 = uint(int(uint(int(_1060)) >> uint(2)));
    int _1064 = int(_1060) & 3;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[int(_1062)][_1064];
    int _1068 = int(_1060) + 1;
    uint _1070 = uint(int(uint(_1068) >> uint(2)));
    int _1072 = _1068 & 3;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[int(_1070)][_1072];
    bool _1076 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1078 = isnan(_405);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1084 = _1080 || _1082;
    float _1086 = float(_1084);
    bool _1088 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1090 = isnan(_405);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    int _1100 = _1058 * int(_958);
    int _1102 = _1100 + _616;
    bool _1104 = !_1022;
    int _1106 = _1104 ? 0 : 1;
    float _1108 = -_1086;
    float _1110 = _1108 + 1.0;
    bool _1112 = _768 != 3;
    float _1114 = float(uint(_1102));
    float _1116 = _1098 * _1110;
    int _1118 = _1048 + 8;
    uint _1120 = uint(int(uint(_1118) >> uint(2)));
    uint _1122 = uint(int(uint(int(_1120)) >> uint(2)));
    int _1124 = int(_1120) & 3;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[int(_1122)][_1124];
    int _1128 = int(_1120) + 1;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    int _1132 = _1128 & 3;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[int(_1130)][_1132];
    float _1136 = -_1098;
    float _1138 = _1136 + 1.0;
    int _1140 = ~_423;
    int _1142 = _1140 + 1;
    float _1144 = as_type<float>(_449) * _1114;
    float _1146 = _1054 * _1116;
    int _1148 = abs(_818);
    int _1150 = ~_1012;
    int _1152 = _1150 + 1;
    int _1154 = _1152 + 1;
    float _1156 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1146);
    float _1158 = trunc(_1144);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    int _1164 = abs(_1106);
    bool _1166 = !_770;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1156);
    int _1172 = ~_1148;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    int _1178 = abs(_1168);
    float _1180 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1182 = float(_1164);
    int _1184 = _1154;
    if (_1112)
    {
        int _1186 = ~_1012;
        int _1188 = _1186 + 1;
        _1184 = _1188;
    }
    int _1190 = _1184;
    int _1192 = ~_1050;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    int _1198 = abs(_1190);
    int _1200 = int(_958) + int(_1162);
    int _1202 = _1196;
    if (!_1052)
    {
        int _1204 = ~_1050;
        int _1206 = _1204 + 1;
        _1202 = _1206;
    }
    int _1208 = _1202;
    float _1210 = float(_968);
    int _1212 = _1142 * _1200;
    int _1214 = _1212 + _616;
    float _1216 = float(_1208);
    bool _1218 = uint(_1214) >= uint(_423);
    int _1220 = _1176 * as_type<int>(_1074);
    int _1222 = ~_1178;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    float _1228 = _1182 * _1216;
    int _1230 = ~_1198;
    int _1232 = _1230 + 1;
    int _1234 = _1232 + 1;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1238 = _912 + _1236;
    bool _1240 = !_1218;
    int _1242 = _1240 ? 0 : (-1);
    int _1244 = _1226 * as_type<int>(_1066);
    int _1246 = _1244 + _1220;
    bool _1248 = !_726;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = _1228 * (-2.0);
    bool _1254 = _768 != 3;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1258 = _976 + _1256;
    int _1260 = _1234 * as_type<int>(_1126);
    int _1262 = _1260 + _1246;
    int _1264 = abs(_1250);
    float _1266 = in.m_66.x;
    float _1268 = in.m_66.y;
    float _1270 = in.m_66.z;
    bool _1272 = !_1254;
    int _1274 = _1272 ? 0 : (-1);
    int _1276 = ~_1200;
    int _1278 = _1276 + _1242;
    int _1280 = _1278 + 1;
    float _1282 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1284 = _754 + _1282;
    int _1286 = abs(_1274);
    bool _1288 = !_1026;
    int _1290 = _1288 ? 0 : 1;
    int _1292 = _423 * _1280;
    int _1294 = _1292 + _616;
    int _1296 = ~_1286;
    int _1298 = _1296 + 1;
    int _1300 = _1298 + 1;
    int _1302 = abs(_1290);
    float _1304 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1306 = _1300 * as_type<int>(_1134);
    int _1308 = _1306 + _1262;
    int _1310 = ~_1264;
    int _1312 = _1310 + 1;
    int _1314 = _1312 + 1;
    float _1316 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1304);
    bool _1318 = !_522;
    int _1320 = _1318 ? _1294 : (-1);
    float _1322 = float(_1302);
    int _1324 = _1308 * _1314;
    float _1326 = fma(_880, _1252, _880);
    float _1328 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1316);
    float _1330 = fma(_1252, _1266, _1266);
    int _1332 = _1320 * _1264;
    int _1334 = _1332 + _1324;
    float _1336 = _1238 * _1238;
    bool _1338 = _1328 >= 0.0;
    float _1340 = _1322 * _1210;
    float _1342 = fma(_1284, _1284, _1336);
    float _1344 = float(_1334);
    float _1346 = fma(_1258, _1258, _1342);
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1354 = _411 + (-0.5);
    float _1356 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1358 = rsqrt(_1346);
    float _1360 = _1342;
    if (_1338)
    {
        _1360 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1362 = _1360;
    float _1364 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1366 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1330);
    bool _1370 = !_1030;
    int _1372 = _1370 ? 0 : 1;
    int _1374 = as_type<int>(_1362);
    if (_1338)
    {
        float _1376 = _1362 * 5.0;
        _1374 = as_type<int>(_1376);
    }
    int _1378 = _1374;
    out.m_68.x = _1344;
    float _1380 = fma(_1326, _906, _1368);
    int _1382 = abs(_1372);
    float _1384 = _413 + (-0.5);
    out.m_70.x = _1356;
    out.m_70.y = _1364;
    out.m_70.z = _1366;
    out.m_70.w = _1180;
    if (_1338)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4722 = as_type<float>(_1378);
        out.gl_Position.z = _4722;
    }
    float _1386 = _1238 * _1358;
    float _1388 = _1284 * _1358;
    if (_1338)
    {
        out.m_49.x = 0.0;
    }
    if (_1338)
    {
        return out;
    }
    float _1390 = -_1386;
    float _1392 = fma(_1390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _912);
    float _1394 = _1258 * _1358;
    float _1396 = -_1388;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[18].w, _754);
    float _1400 = float(_1000);
    float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1404 = _1392 + _1402;
    float _1406 = _1340 * (-2.0);
    float _1408 = -_1394;
    float _1410 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[18].w, _976);
    float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1414 = _1398 + _1412;
    float _1416 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1418 = fma(_1406, _1268, _1268);
    float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1422 = _1410 + _1420;
    float _1424 = -_1386;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1238);
    float _1428 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1416);
    float _1430 = float(_1382);
    float _1432 = fma(_932, _1406, _932);
    float _1434 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1418);
    float _1436 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1428);
    float _1438 = -_1388;
    float _1440 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1284);
    float _1442 = _1426 * _1426;
    float _1444 = fma(_1432, _906, _1434);
    float _1446 = _1430 * _1400;
    bool _1448 = _1436 >= 0.0;
    float _1450 = fma(_1440, _1440, _1442);
    float _1452 = in.m_72.x;
    float _1454 = in.m_72.y;
    float _1456 = _1444 * 0.15915493667125701904296875;
    float _1458 = _1446 * (-2.0);
    float _1460 = _790 + _411;
    float _1462 = -_1394;
    float _1464 = fma(_1462, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1258);
    float _1466 = _1380 * 0.15915493667125701904296875;
    float _1468 = _1460 + (-1.0);
    float _1470 = fma(_1464, _1464, _1450);
    float _1472 = fma(_1458, _1270, _1270);
    float _1474 = _1466 * 6.283185482025146484375;
    float _1476 = sin(_1474);
    float _1478 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1480 = _790 + (-0.5);
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    int _1484 = as_type<int>(_1472);
    float _1486 = _1394;
    float _1488 = _1422;
    if (_1448)
    {
        _1482 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1490 = _1482;
    if (_1448)
    {
        out.m_49.x = 0.0;
    }
    float _1492 = fma(_1478, _1458, _1478);
    float _1494 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1472);
    float _1496 = _1466 * 6.283185482025146484375;
    float _1498 = cos(_1496);
    if (_1448)
    {
        float _1500 = _1490 * 5.0;
        _1484 = as_type<int>(_1500);
    }
    int _1502 = _1484;
    float _1504 = fma(_1492, _906, _1494);
    if (_1448)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4934 = as_type<float>(_1502);
        out.gl_Position.z = _4934;
    }
    float _1506 = _369 * _1454;
    float _1508 = _1456 * 6.283185482025146484375;
    float _1510 = sin(_1508);
    float _1512 = _1504 * 0.15915493667125701904296875;
    float _1514 = sqrt(_1470);
    float _1516 = _1456 * 6.283185482025146484375;
    float _1518 = cos(_1516);
    if (_1448)
    {
        return out;
    }
    float _1520 = _1512 * 6.283185482025146484375;
    float _1522 = cos(_1520);
    float _1524 = _1358 * _1514;
    float _1526 = _1506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1528 = _367 * _1452;
    float _1530 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _1532 = _1476 * _1510;
    float _1534 = _1526 * _1524;
    float _1536 = _1528 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1538 = _1512 * 6.283185482025146484375;
    float _1540 = sin(_1538);
    float _1542 = _1498 * _1518;
    float _1544 = _1530 * _1534;
    float _1546 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _171);
    float _1548 = _1536 * _1524;
    float _1550 = _1498 * _1510;
    float _1552 = _1476 * _1518;
    float _1554 = _1498 * _1522;
    float _1556 = _1546 * _1548;
    float _1558 = _1518 * _1522;
    float _1560 = _1476 * _1522;
    float _1562 = _1554 * _1544;
    float _1564 = _1510 * _1522;
    float _1566 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1568 = _1566 * 0.5;
    float _1570 = _1560 * _1544;
    float _1572 = fma(_1540, _1542, _1532);
    float _1574 = -_1544;
    float _1576 = _1540 * _1574;
    float _1578 = -_1552;
    float _1580 = fma(_1540, _1550, _1578);
    float _1582 = -_1550;
    float _1584 = fma(_1540, _1552, _1582);
    float _1586 = fma(_1572, _1556, _1562);
    float _1588 = fma(_1558, _1556, _1576);
    float _1590 = fma(_1540, _1532, _1542);
    float _1592 = fma(_1584, _1556, _1570);
    float _1594 = fma(_1580, _1568, _1586);
    float _1596 = fma(_1564, _1568, _1588);
    float _1598 = _1572 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1600 = fma(_1590, _1568, _1592);
    float _1602 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1604 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1606 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1608 = _1572 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1610 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1602);
    float _1612 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1604);
    float _1614 = _1572 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1616 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1606);
    float _1618 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1610);
    float _1620 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1612);
    float _1622 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1608);
    float _1624 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1598);
    float _1626 = _1618 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1628 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1630 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1614);
    float _1632 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1634 = _754 + _1626;
    float _1636 = _976 + _1628;
    float _1638 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1640 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1642 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1644 = _1634 + _1642;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1648 = _1636 + _1646;
    float _1650 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1616);
    float _1652 = -_1540;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1632);
    float _1656 = _1644 * _1644;
    float _1658 = _1648 * _1648;
    float _1660 = -_1540;
    float _1662 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1638);
    float _1664 = -_1540;
    float _1666 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1640);
    float _1668 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1622);
    float _1670 = _1656 + _1658;
    float _1672 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1624);
    float _1674 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1676 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1630);
    float _1678 = sqrt(_1670);
    float _1680 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1682 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1684 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1686 = _912 + _1674;
    float _1688 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1680);
    float _1690 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1682);
    float _1692 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1684);
    bool _1694 = _1678 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1696 = _1684;
    float _1698 = _1682;
    float _1700 = _1680;
    float _1702 = _1634;
    float _1704 = _1656;
    float _1706 = _1672;
    if (!_1694)
    {
        _1696 = _1634;
    }
    float _1708 = _1696;
    float _1710 = _1708;
    if (!_1694)
    {
        _1698 = _1658;
    }
    float _1712 = _1698;
    float _1714 = _1712;
    if (!_1694)
    {
        _1700 = _1636;
    }
    float _1716 = _1700;
    float _1718 = _1716;
    if (!_1694)
    {
        _1702 = _1686;
    }
    float _1720 = _1702;
    bool _1722 = !_1694;
    float _1724 = _1720;
    if (!_1722)
    {
        float _1726 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1730 = _1678 + _1728;
        float _1732 = rsqrt(_1670);
        float _1734 = _1730 * _1726;
        float _1736 = _1686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1738 = _1734 * 0.15915493667125701904296875;
        float _1740 = _1738 * 6.283185482025146484375;
        float _1742 = sin(_1740);
        float _1744 = _1738 * 6.283185482025146484375;
        float _1746 = cos(_1744);
        float _1748 = fma(_1742, _1736, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1750 = _1732 * _1748;
        float _1752 = fma(_1644, _1750, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1754 = _1746 + (-1.0);
        float _1756 = fma(_1648, _1750, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1760 = _1752 + _1758;
        float _1762 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1764 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1766 = _1756 + _1764;
        float _1768 = _1760 * _1760;
        float _1770 = fma(_1686, _1746, _1762);
        float _1772 = _1766 * _1766;
        _1724 = _1770;
        _1704 = _1768;
        _1714 = _1772;
        _1718 = _1756;
        _1710 = _1752;
    }
    float _1774 = _1724;
    float _1776 = _1704;
    float _1778 = _1714;
    float _1780 = _1718;
    float _1782 = _1710;
    float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1786 = _1774 + _1784;
    float _1788 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1654);
    float _1790 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1662);
    float _1792 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1794 = fma(_1786, _1786, _1776);
    float _1796 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1666);
    float _1798 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1688);
    float _1800 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1690);
    float _1802 = _1794 + _1778;
    float _1804 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1692);
    float _1806 = _171 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1808 = _1792 * _1788;
    float _1810 = _1792 * _1790;
    float _1812 = _1792 * _1796;
    float _1814 = sqrt(_1802);
    float _1816 = fma(_1806, _1668, _1808);
    float _1818 = fma(_1806, _1672, _1810);
    float _1820 = fma(_1806, _1676, _1812);
    float _1822 = _1798 + _1816;
    float _1824 = _1800 + _1818;
    float _1826 = _1804 + _1820;
    out.m_74.x = _1822;
    out.m_74.y = _1824;
    out.m_74.z = _1826;
    bool _1828 = _1814 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1830 = isnan(_1814);
    bool _1832 = _1828 || _1830;
    bool _1834 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1836 = _1832 || _1834;
    if (!_1836)
    {
        _1706 = 1.0;
    }
    float _1838 = _1706;
    bool _1840 = !_1836;
    float _1842 = _1838;
    if (!_1840)
    {
        bool _1844 = _1814 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1846 = isnan(_1814);
        bool _1848 = _1844 || _1846;
        bool _1850 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1852 = _1848 || _1850;
        if (!_1852)
        {
            float _1854 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1856 = _1814 + _1854;
            float _1858 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1860 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1858;
            float _1862 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1864 = _1862 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1866 = 1.0 / _1860;
            float _1868 = _1856 * _1866;
            float _1870 = fma(_1868, _1864, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1842 = _1870;
            _1872 = true;
        }
        else
        {
            bool _1874 = _1814 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1876 = isnan(_1814);
            bool _1878 = _1874 || _1876;
            bool _1880 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1882 = _1878 || _1880;
            if (!_1882)
            {
                float _1884 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1886 = _1814 + _1884;
                float _1888 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1890 = _1888 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1892 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1894 = _1892 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1896 = 1.0 / _1890;
                float _1898 = _1886 * _1896;
                float _1900 = fma(_1898, _1894, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1842 = _1900;
                _1872 = true;
            }
            else
            {
                _1842 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1872 = false;
    float _1902 = _1842;
    float _1904 = _1392 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1906 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1908 = _1780 + _1906;
    float _1910 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1904);
    float _1912 = _1392 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1914 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1916 = _1782 + _1914;
    float _1918 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1910);
    bool _1920 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1922 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1924 = _1920 || _1922;
    bool _1926 = isnan(0.5);
    bool _1928 = _1924 || _1926;
    float _1930 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1932 = _1774 + _1930;
    bool _1934 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1936 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1938 = _1934 || _1936;
    bool _1940 = isnan(0.5);
    bool _1942 = _1938 || _1940;
    float _1944 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1946 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1912);
    float _1948 = fma(_1908, _1902, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1950 = fma(_1916, _1902, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1952 = 1.0 / _1944;
    float _1954 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1946);
    float _1956 = fma(_1932, _1902, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1958 = -_1394;
    float _1960 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1948);
    float _1962 = -_1388;
    float _1964 = fma(_1962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1950);
    float _1966 = _1954 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1968 = -_1386;
    float _1970 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1956);
    float _1972 = _1970;
    float _1974 = _1964;
    float _1976 = _1960;
    float _1978 = _1944;
    if (_1942)
    {
        _1486 = 1.0;
    }
    float _1980 = _1486;
    float _1982 = _1966 + _1944;
    float _1984 = _1982 * _1952;
    float _1986 = _1984 * 0.5;
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1990 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1988);
    float _1992 = 1.0 / _1990;
    float _1994 = _1980;
    if (!_1928)
    {
        float _1996 = _1404 * _1404;
        float _1998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2000 = -_912;
        float _2002 = _2000 + _1956;
        float _2004 = -_976;
        float _2006 = _2004 + _1948;
        float _2008 = fma(_1414, _1414, _1996);
        float _2010 = fma(_1422, _1422, _2008);
        float _2012 = 1.0 / _1524;
        float _2014 = sqrt(_2010);
        float _2016 = precise::min(_2014, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2018 = _2016 * _1998;
        float _2020 = -_754;
        float _2022 = _2020 + _1950;
        float _2024 = _2018 * _2012;
        float _2026 = fma(_2022, _2024, _1398);
        float _2028 = fma(_2002, _2024, _1392);
        float _2030 = fma(_2006, _2024, _1410);
        _1972 = _2028;
        _1974 = _2026;
        _1976 = _2030;
        _994 = _2006;
    }
    float _2032 = _1972;
    float _2034 = _1974;
    float _2036 = _1976;
    float _2038 = _994;
    float _2040 = _2038;
    if (_1942)
    {
        _2040 = 1.0;
    }
    float _2042 = _2040;
    float _2044 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2046 = _1992 * _2044;
    float _2048 = _2042;
    if (!_1942)
    {
        float _2050 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2052 = _2050 * 0.15915493667125701904296875;
        float _2054 = _2052 * 6.283185482025146484375;
        float _2056 = cos(_2054);
        float _2058 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2060 = _2058 * 0.15915493667125701904296875;
        float _2062 = _2052 * 6.283185482025146484375;
        float _2064 = sin(_2062);
        float _2066 = 1.0 / _2056;
        float _2068 = _2060 * 6.283185482025146484375;
        float _2070 = cos(_2068);
        float _2072 = _2064 * _2066;
        float _2074 = _2060 * 6.283185482025146484375;
        float _2076 = sin(_2074);
        float _2078 = _2070 * _2072;
        float _2080 = 1.0 / _2078;
        float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2084 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2082;
        float _2086 = 1.0 / _2084;
        float _2088 = _2076 * _2080;
        float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2092 = fma(_2046, _2088, _2090);
        float _2094 = _2092 * _2086;
        float _2096 = precise::clamp(_2094, 0.0, 1.0);
        _1488 = _2060;
        _1994 = _2096;
    }
    float _2098 = _1488;
    float _2100 = _1994;
    float _2102 = _2098;
    if (!_1942)
    {
        float _2104 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2106 = _2104 * 0.15915493667125701904296875;
        float _2108 = _2106 * 6.283185482025146484375;
        float _2110 = cos(_2108);
        float _2112 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2114 = _2112 * 0.15915493667125701904296875;
        float _2116 = _2106 * 6.283185482025146484375;
        float _2118 = sin(_2116);
        float _2120 = 1.0 / _2110;
        float _2122 = _2114 * 6.283185482025146484375;
        float _2124 = cos(_2122);
        float _2126 = _2118 * _2120;
        float _2128 = _2114 * 6.283185482025146484375;
        float _2130 = sin(_2128);
        float _2132 = _2124 * _2126;
        float _2134 = 1.0 / _2132;
        float _2136 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2138 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2136;
        float _2140 = 1.0 / _2138;
        float _2142 = _2130 * _2134;
        float _2144 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2146 = fma(_2046, _2142, _2144);
        float _2148 = _2146 * _2140;
        float _2150 = precise::clamp(_2148, 0.0, 1.0);
        float _2152 = -_2150;
        float _2154 = _2152 + 1.0;
        _2102 = _2120;
        _2048 = _2154;
    }
    float _2156 = _2102;
    float _2158 = _2048;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2162 = _2032 + _2160;
    float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2166 = _2034 + _2164;
    float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2170 = _2036 + _2168;
    float _2172 = _2162 * _2162;
    float _2174 = fma(_2166, _2166, _2172);
    float _2176 = fma(_2170, _2170, _2174);
    float _2178 = rsqrt(_2176);
    float _2180 = sqrt(_2176);
    float _2182 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2184 = _2166 * _2182;
    float _2186 = _2170 * _2182;
    float _2188 = _2184 * _2184;
    float _2190 = _2186 * _2186;
    float _2192 = _2188 + _2190;
    float _2194 = sqrt(_2192);
    bool _2196 = _2194 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2200 = _2194 + _2198;
    float _2202 = _2156;
    float _2204 = _2192;
    float _2206 = _2200;
    float _2208 = _2162;
    float _2210 = _2184;
    if (_2196)
    {
        float _2212 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2202 = _2212;
    }
    float _2214 = _2202;
    if (_2196)
    {
        float _2216 = rsqrt(_2192);
        _2204 = _2216;
    }
    float _2218 = _2204;
    if (_2196)
    {
        float _2220 = _2200 * _2214;
        _2206 = _2220;
    }
    float _2222 = _2206;
    if (_2196)
    {
        float _2224 = _2222 * 0.15915493667125701904296875;
        _962 = _2224;
    }
    float _2226 = _962;
    float _2228 = _2170;
    float _2230 = _2226;
    if (_2196)
    {
        float _2232 = _2226 * 6.283185482025146484375;
        float _2234 = sin(_2232);
        _2228 = _2234;
    }
    float _2236 = _2228;
    float _2238 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2240 = precise::max(0.0, _2238);
    float _2242 = _2214;
    float _2244 = _2240;
    if (_2196)
    {
        float _2246 = _2226 * 6.283185482025146484375;
        float _2248 = cos(_2246);
        _2242 = _2248;
    }
    float _2250 = _2242;
    float _2252 = -_2182;
    float _2254 = -_2240;
    float _2256 = fma(_2162, _2252, _2254);
    if (_2196)
    {
        float _2258 = _2256 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2208 = _2258;
    }
    float _2260 = _2208;
    float _2262 = _2236;
    float _2264 = _2260;
    if (_2196)
    {
        float _2266 = fma(_2236, _2260, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2262 = _2266;
    }
    float _2268 = _2262;
    float _2270 = _2268;
    if (!_2196)
    {
        _2264 = _2256;
    }
    float _2272 = _2264;
    float _2274 = _2272;
    float _2276 = _2250;
    if (_2196)
    {
        float _2278 = _2250 + (-1.0);
        _2244 = _2278;
    }
    float _2280 = _2244;
    float _2282 = _2280;
    if (_2196)
    {
        float _2284 = _2218 * _2268;
        _1978 = _2284;
    }
    float _2286 = _1978;
    if (!_2196)
    {
        _2270 = _2188;
    }
    float _2288 = _2270;
    float _2290 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2292 = _2288;
    if (_2196)
    {
        float _2294 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2230 = _2294;
    }
    float _2296 = _2230;
    if (_2196)
    {
        float _2298 = _2184 * _2286;
        _2210 = _2298;
    }
    float _2300 = _2210;
    if (!_2196)
    {
        _2282 = _2186;
    }
    float _2302 = _2282;
    float _2304 = _2302;
    if (_2196)
    {
        float _2306 = _2186 * _2286;
        _2304 = _2306;
    }
    float _2308 = _2304;
    if (_2196)
    {
        float _2310 = fma(_2256, _2250, _2296);
        _2274 = _2310;
    }
    float _2312 = _2274;
    if (_2196)
    {
        float _2314 = _2300 * _2300;
        _2292 = _2314;
    }
    float _2316 = _2292;
    if (!_2196)
    {
        _2276 = _2190;
    }
    float _2318 = _2276;
    float _2320 = _2318;
    if (_2196)
    {
        float _2322 = _2308 * _2308;
        _2320 = _2322;
    }
    float _2324 = _2320;
    float _2326 = fma(_2312, _2312, _2316);
    float _2328 = _2326 + _2324;
    float _2330 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2290);
    float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2334 = fma(_2180, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2332);
    float _2336 = precise::clamp(_2334, 0.0, 1.0);
    float _2338 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2340 = rsqrt(_2328);
    float _2342 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2330);
    float _2344 = -_2336;
    float _2346 = _2344 + 1.0;
    float _2348 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2350 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2338);
    float _2352 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2354 = _2342 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2356 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2348);
    float _2358 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2350);
    float _2360 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2352);
    float _2362 = abs(_2346);
    float _2364 = log2(_2362);
    float _2366 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2368 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2370 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2356);
    float _2372 = _2358 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2374 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2360);
    float _2376 = -_2368;
    float _2378 = fma(_2376, _2366, 1.0);
    float _2380 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2382 = _2372 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2384 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2386 = _2340 * _2300;
    float _2388 = _2340 * _2308;
    float _2390 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2382);
    float _2392 = _2340 * _2312;
    float _2394 = _2386 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2396 = log2(_2378);
    float _2398 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2400 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2390);
    float _2402 = -_2394;
    float _2404 = fma(_2392, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2402);
    float _2406 = _2372 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2408 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2400);
    float _2410 = exp2(_2398);
    float _2412 = -_2388;
    float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2404);
    float _2416 = _2372 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2418 = fma(_2414, -0.5, 0.5);
    float _2420 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2416);
    float _2422 = fma(_2414, 0.5, 0.5);
    float _2424 = 1.0 / _2408;
    float _2426 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2406);
    float _2428 = _2392 + 1.0;
    float _2430 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2420);
    float _2432 = fma(_2422, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2434 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2426);
    float _2436 = _2396 * 0.693147182464599609375;
    float _2438 = sqrt(_2418);
    float _2440 = -_2392;
    float _2442 = fma(_2410, _2428, _2440);
    float _2444 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2430);
    float _2446 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2434);
    float _2448 = fma(_2422, _2432, -0.212114393711090087890625);
    float _2450 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2452 = _2444 * _2424;
    float _2454 = _2446 * _2424;
    float _2456 = fma(_2422, _2448, 1.570728778839111328125);
    float _2458 = fma(_2452, 0.5, 0.5);
    float _2460 = fma(_2454, -0.5, 0.5);
    float _2462 = _2438 * 0.636619746685028076171875;
    float _2464 = fma(_2442, 0.5, 0.5);
    float3 _6506 = float3(_2458, _2460, _2450);
    float _2466 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6506, float3(0.0), isnan(_6506)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6506, float3(0.0), isnan(_6506)), level(0.0)).x;
    float3 _6517 = float3(_2458, _2460, _2450);
    float4 _2469 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6517, float3(0.0), isnan(_6517)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6517, float3(0.0), isnan(_6517)), level(0.0)).xyzw;
    float _2471 = _2469.x;
    float _2473 = _2469.y;
    float _2475 = _2469.z;
    float _2477 = _2469.w;
    float _2479 = -_2456;
    float _2481 = fma(_2462, _2479, 1.0);
    float2 _6539 = float2(_2481, _2464);
    float3 _2485 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6539, float2(0.0), isnan(_6539)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6539, float2(0.0), isnan(_6539)), level(0.0)).xyz;
    float _2487 = _2485.x;
    float _2489 = _2485.y;
    float _2491 = _2485.z;
    float _2493 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2495 = _2372 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2497 = _2180 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2499 = isnan(_2180);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2505 = _2501 || _2503;
    float _2507 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2495);
    float _2509 = exp2(_2493);
    float _2511 = _2408 * 0.5;
    float _2513 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2507);
    float _2515 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2513);
    float _2517 = fma(_2446, -0.5, _2511);
    float _2519 = _2444 + _2408;
    float _2521 = _2515 + _2408;
    out.gl_Position.x = _2444;
    out.gl_Position.y = _2446;
    out.gl_Position.z = _2515;
    out.gl_Position.w = _2408;
    float _2523 = _2519 * 0.5;
    float _2525 = _2521 * 0.5;
    float _2527 = -_2509;
    float _2529 = _2527 + 1.0;
    float _2531 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_76.x = _2523;
    out.m_76.y = _2517;
    out.m_76.z = _2525;
    out.m_76.w = _2408;
    float _2533 = -_2531;
    float _2535 = _2533 + 1.0;
    float _2537 = _2100 * _2158;
    float _2539 = _2515;
    float _2541 = _2446;
    float _2543 = _2537;
    if (!_2505)
    {
        _2539 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2545 = _2539;
    float _2547 = _2545;
    float _2549 = _2545;
    if (!_2505)
    {
        _2541 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2551 = _2541;
    float _2553 = _2531 * _2466;
    float _2555 = _2477 * _2535;
    float _2557 = _2537 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2559 = _2551;
    float _2561 = _2551;
    if (!_2505)
    {
        _2543 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2563 = _2543;
    float _2565 = _2477 * _2553;
    float _2567 = _2491 * _2553;
    float _2569 = fma(_2487, _2565, _2471);
    float _2571 = fma(_2489, _2565, _2473);
    float _2573 = fma(_2477, _2567, _2475);
    out.m_78.x = _2569;
    out.m_78.y = _2571;
    out.m_78.z = _2573;
    out.m_78.w = _2555;
    bool _2575 = !_2505;
    float _2577 = _2563;
    float _2579 = _2563;
    if (!_2575)
    {
        bool _2581 = _2180 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2583 = isnan(_2180);
        bool _2585 = _2581 || _2583;
        bool _2587 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2589 = _2585 || _2587;
        if (!_2589)
        {
            float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2593 = _2180 + _2591;
            float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2597 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2595;
            float _2599 = 1.0 / _2597;
            float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2603 = _2601 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2609 = _2593 * _2599;
            float _2611 = precise::clamp(_2609, 0.0, 1.0);
            float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2617 = fma(_2611, _2607, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2619 = fma(_2611, _2615, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2621 = fma(_2611, _2603, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2561 = _2621;
            _2549 = _2619;
            _2579 = _2617;
            _2623 = true;
        }
        else
        {
            bool _2625 = _2180 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2627 = isnan(_2180);
            bool _2629 = _2625 || _2627;
            bool _2631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2633 = _2629 || _2631;
            if (!_2633)
            {
                _2547 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2635 = _2547;
            _2549 = _2635;
            if (!_2633)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2637 = _2559;
            _2561 = _2637;
            if (!_2633)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2639 = _2577;
            bool _2641 = !_2633;
            _2579 = _2639;
            if (!_2641)
            {
                bool _2643 = _2180 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2645 = isnan(_2180);
                bool _2647 = _2643 || _2645;
                bool _2649 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2651 = _2647 || _2649;
                if (!_2651)
                {
                    float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2655 = _2180 + _2653;
                    float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2659 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2657;
                    float _2661 = 1.0 / _2659;
                    float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2669 = _2667 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2671 = _2655 * _2661;
                    float _2673 = precise::clamp(_2671, 0.0, 1.0);
                    float _2675 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2677 = _2675 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2679 = fma(_2673, _2669, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2681 = fma(_2673, _2677, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2683 = fma(_2673, _2665, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2561 = _2683;
                    _2549 = _2681;
                    _2579 = _2679;
                    _2623 = true;
                }
                else
                {
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2549 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2623 = false;
    float _2685 = _2561;
    float _2687 = _2549;
    float _2689 = _2579;
    float _2691 = _2557 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_80.x = 0.0;
    float _2693 = _2685 * 0.586610972881317138671875;
    bool _2695 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _2691;
    float _2697 = fma(_2687, 0.298911988735198974609375, _2693);
    bool _2699 = _2100 > 0.0;
    bool _2701 = isnan(_2100);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan(0.0);
    bool _2707 = _2703 || _2705;
    float _2709 = fma(_2689, 0.114477999508380889892578125, _2697);
    bool _2711 = _2158 <= 0.0;
    bool _2713 = !_2707;
    bool _2715 = _2711 || _2713;
    float _2717 = -_2709;
    float _2719 = _2717 + _2687;
    float _2721 = -_2709;
    float _2723 = _2721 + _2685;
    float _2725 = -_2709;
    float _2727 = _2725 + _2689;
    float _2729 = fma(_2719, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2709);
    float _2731 = fma(_2723, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2709);
    float _2733 = fma(_2727, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2709);
    bool _2735 = !_2695;
    if (!_2735)
    {
        float _2737 = -_2032;
        float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2741 = -_2034;
        float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2745 = -_2036;
        float _2747 = _2745 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2749 = _2739 * _2739;
        float _2751 = fma(_2743, _2743, _2749);
        float _2753 = fma(_2747, _2747, _2751);
        float _2755 = sqrt(_2753);
        float _2757 = rsqrt(_2753);
        float _2759 = -_2755;
        float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2763 = _2761 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2765 = precise::clamp(_2763, 0.0, 1.0);
        float _2767 = _2743 * _2757;
        float _2769 = _2739 * _2757;
        float _2771 = abs(_2765);
        float _2773 = log2(_2771);
        float _2775 = _2747 * _2757;
        float _2777 = _2767 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2779 = _1824 * _2769;
        float _2781 = -_2769;
        float _2783 = -_2777;
        float _2785 = fma(_2781, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2783);
        float _2787 = fma(_1822, _2767, _2779);
        float _2789 = -_2775;
        float _2791 = fma(_2789, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2785);
        float _2793 = fma(_1826, _2775, _2787);
        float _2795 = precise::clamp(_2793, 0.0, 1.0);
        float _2797 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2799 = _2791 + _2797;
        float _2801 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2803 = _2799 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2805 = precise::clamp(_2803, 0.0, 1.0);
        float _2807 = exp2(_2801);
        float _2809 = _2807 * _2805;
        float _2811 = _2795 * _2809;
        float _2813 = _2811 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2815 = _2811 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2817 = _2811 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_80.x = _2813;
        out.m_80.y = _2815;
        out.m_80.z = _2817;
    }
    out.m_82.x = _2729;
    out.m_82.y = _2731;
    out.m_82.z = _2733;
    if (!_2715)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2819 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2819;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2623 = false;
    bool _1872 = false;
    bool _395 = false;
    bool _197 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_46.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_49.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2876 = as_type<float>(_117);
        out.gl_Position.z = _2876;
    }
    if (!_105)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _121 = in.m_51.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = 0.0;
    float _139 = _135;
    if (_131)
    {
        float _141 = float(_101);
        _137 = _141;
    }
    float _143 = _137;
    bool _145 = _135 >= _143;
    bool _147 = !_131;
    bool _149 = _145 || _147;
    if (_149)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _111;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _119 = as_type<int>(_153);
    }
    int _155 = _119;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2945 = as_type<float>(_155);
        out.gl_Position.z = _2945;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _161 = as_type<int>(_157) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_157) & 2;
    bool _167 = _165 != 0;
    bool _169 = !_163;
    float _171 = _169 ? (-0.5) : 0.5;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_159;
    float _195;
    if (!_177)
    {
        float _179 = in.m_56.x;
        float _181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _185 = fma(_183, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _187 = _185 * _181;
        float _189 = floor(_187);
        float _191 = -_189;
        float _193 = _187 + _191;
        _195 = _193;
        _197 = true;
    }
    else
    {
        float _199 = float(_101);
        float _201 = 1.0 / _199;
        float _203 = _135 * _201;
        _195 = _203;
    }
    _197 = false;
    float _205 = _195;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = _205 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _213 = _205 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _205 + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _225 = _223 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _227;
    bool _231 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _233 = isnan(_205);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = 1.0 / _221;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _247 = 1.0 / _229;
    float _249 = 1.0 / _225;
    float _251 = _209 * _243;
    bool _253 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _255 = isnan(_205);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -_241;
    float _267 = _265 + 1.0;
    float _269 = _263 * _267;
    float _271 = _213 * _247;
    bool _273 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _275 = isnan(_205);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -_263;
    float _287 = _285 + 1.0;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _293 = _283 * _287;
    float _295 = -_283;
    float _297 = _295 + 1.0;
    float _299 = _217 * _249;
    bool _301 = _205 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _303 = isnan(_205);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    float _317 = fma(_291, _299, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _327 = fma(_315, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _329 = _311 * _297;
    float _331 = fma(_321, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _333 = fma(_325, _299, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _335 = -_311;
    float _337 = _335 + 1.0;
    float _339 = _327 * _329;
    float _341 = _331 * _329;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _343;
    float _347 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].x, _339);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _349;
    float _353 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[143].y, _341);
    float _355 = fma(_345, _271, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _357 = fma(_317, _293, _347);
    float _359 = fma(_351, _271, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _361 = fma(_333, _293, _353);
    float _363 = fma(_355, _269, _357);
    float _365 = fma(_359, _269, _361);
    float _367 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[146].x, _363);
    float _369 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[146].y, _365);
    bool _371 = !_245;
    float _391;
    float _393;
    if (!_371)
    {
        float _373 = in.m_56.x;
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _377 = float(_101);
        float _379 = _373 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _383 = _381 * _375;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _377;
        _393 = _389;
        _395 = true;
    }
    else
    {
        float _397 = float(_101);
        float _399 = 1.0 / _397;
        float _401 = _135 * _399;
        _391 = _397;
        _393 = _401;
    }
    _395 = false;
    float _403 = _391;
    float _405 = _393;
    float _407 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _409 = int(_407);
    float _411 = in.m_56.x;
    float _413 = in.m_56.y;
    float _415 = in.m_46.x;
    float _417 = in.m_46.y;
    float _419 = in.m_46.z;
    float _421 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _423 = int(_421);
    float _425 = float(_409);
    float _427 = 1.0 / _403;
    float _429 = float(uint(_423));
    float _431 = 1.0 / _425;
    int _433 = ~_423;
    int _435 = _433 + 1;
    int _437 = ~_423;
    int _439 = _437 + 1;
    float _441 = 1.0 / _429;
    float _443 = _431 * _135;
    float _445 = trunc(_443);
    int _447 = int(_445);
    int _449 = as_type<int>(_441) + (-2);
    float _451 = float(_423);
    float _453 = float(uint(_447));
    float _455 = as_type<float>(_449) * _453;
    float _457 = trunc(_455);
    float _459 = precise::max(_457, 0.0);
    uint _462 = uint(_459);
    int _464 = ~_423;
    int _466 = _464 + 1;
    int _468 = _435 * int(_462);
    int _470 = _468 + _447;
    float _472 = float(uint(_470));
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _476 = _474 != 0;
    float _478 = as_type<float>(_449) * _472;
    float _480 = trunc(_478);
    float _482 = precise::max(_480, 0.0);
    uint _484 = uint(_482);
    int _486 = int(_462) + int(_484);
    float _488 = float(_447);
    bool _490 = !_476;
    float _492 = _490 ? 7.345489978790283203125 : 1.0;
    int _494 = _466 * _486;
    int _496 = _494 + _447;
    bool _498 = _488 >= _451;
    bool _500 = isnan(_488);
    bool _502 = _498 || _500;
    bool _504 = isnan(_451);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = _492 * _411;
    bool _512 = uint(_496) >= uint(_423);
    float _514 = trunc(_508);
    int _516 = int(_514);
    bool _518 = !_512;
    int _520 = _518 ? 0 : (-1);
    bool _522 = _423 == 0;
    int _524 = ~_486;
    int _526 = _524 + _520;
    int _528 = _526 + 1;
    float _530 = floor(_510);
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _534 = _532 != 0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _542 = _540 != 0;
    int _544 = _423 * _528;
    int _546 = _544 + _447;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _550 = _548 != 0;
    int _552 = ~_516;
    int _554 = _552 + 1;
    int _556 = _554 + 1;
    bool _558 = !_522;
    int _560 = _558 ? _546 : (-1);
    int _562 = _560 * _556;
    float _564 = -_530;
    float _566 = _510 + _564;
    int _568 = _423 + (-1);
    float _570 = _566 * _451;
    float _572 = _451 * _135;
    int _574 = _516 * _568;
    int _576 = _574 + _562;
    bool _578 = !_538;
    int _580 = _578 ? 0 : 1;
    float _582 = _572 * _427;
    float _584 = trunc(_570);
    int _586 = int(_584);
    bool _588 = !_550;
    int _590 = _588 ? 0 : 1;
    bool _592 = !_534;
    int _594 = _592 ? 0 : 1;
    int _596 = abs(_580);
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _600 = _598 != 0;
    float _602 = trunc(_582);
    int _604 = int(_602);
    int _606 = abs(_590);
    bool _608 = !_542;
    int _610 = _608 ? 0 : 1;
    int _612 = abs(_594);
    int _614 = _586 * _606;
    int _616 = _614 + _447;
    bool _618 = !_600;
    int _620 = _618 ? 0 : 1;
    int _622 = abs(_610);
    int _624 = _576 * _596;
    int _626 = abs(_620);
    float _628 = in.m_58.x;
    float _630 = in.m_58.y;
    float _632 = in.m_58.z;
    float _634 = in.m_58.w;
    int _636 = _604 * _612;
    int _638 = _636 + _624;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _642 = _640 != 0;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _646 = _644 != 0;
    int _648 = _616 * _622;
    int _650 = _648 + _638;
    int _652 = ~_423;
    int _654 = _652 + 1;
    float _656 = float(uint(_616));
    int _658 = _586 * _626;
    int _660 = _658 + _650;
    float _662 = in.m_60.x;
    float _664 = in.m_60.y;
    float _666 = in.m_60.z;
    float _668 = in.m_60.w;
    float _670 = float(uint(_660));
    float _672 = as_type<float>(_449) * _670;
    float _674 = trunc(_672);
    float _676 = precise::max(_674, 0.0);
    uint _678 = uint(_676);
    float _680 = _417 * _630;
    float _682 = fma(_415, _628, _680);
    int _684 = _654 * int(_678);
    int _686 = _684 + _660;
    float _688 = float(uint(_686));
    float _690 = as_type<float>(_449) * _688;
    float _692 = trunc(_690);
    float _694 = precise::max(_692, 0.0);
    uint _696 = uint(_694);
    float _698 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _700 = log2(_698);
    int _702 = int(_678) + int(_696);
    float _704 = in.m_62.x;
    float _706 = in.m_62.y;
    float _708 = in.m_62.z;
    float _710 = in.m_62.w;
    int _712 = _439 * _702;
    int _714 = _712 + _660;
    float _716 = _700 * _135;
    bool _718 = uint(_714) >= uint(_423);
    bool _720 = !_718;
    int _722 = _720 ? 0 : (-1);
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _726 = _724 != 0;
    int _728 = ~_702;
    int _730 = _728 + _722;
    int _732 = _730 + 1;
    float _734 = _417 * _664;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _738 = _423 * _732;
    int _740 = _738 + _660;
    float _742 = fma(_415, _662, _734);
    float _744 = fma(_419, _632, _682);
    float _746 = _417 * _706;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _752 = _413 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _754 = _744 + _634;
    float _756 = fma(_415, _704, _746);
    bool _758 = !_522;
    int _760 = _758 ? _740 : (-1);
    float _762 = 1.0 / _750;
    float _764 = fma(_752, -2.0, _736);
    float _766 = fma(_419, _666, _742);
    int _768 = _760 & 3;
    bool _770 = _768 != 0;
    float _772 = fma(_419, _708, _756);
    int _774 = _760 & 3;
    bool _776 = _774 != 0;
    float _778 = _411 * 2.0;
    bool _780 = uint(_768) > 1u;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _782;
    float _786 = exp2(_716);
    int _788 = _776 ? 0 : 1;
    float _790 = in.m_56.z;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _794 = ~_788;
    int _796 = _794 + 1;
    int _798 = _796 + 1;
    float _800 = _784 * _762;
    float _802 = _413 * 2.0;
    float _804 = -_792;
    float _806 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[77].x, _804);
    bool _808 = _411 > 0.5;
    float _810 = floor(_778);
    int _812 = _798;
    if (!_780)
    {
        int _814 = ~_788;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    float _820 = _413 + _411;
    bool _822 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _824 = isnan(1.0);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _830 = _826 || _828;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _834 = 1.0 + _832;
    float _836 = -_786;
    float _838 = _836 + 1.0;
    float _840 = 1.0 / _834;
    float _842 = -_171;
    int _844 = _808 ? as_type<int>(_842) : as_type<int>(_171);
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _848 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _850 = isnan(0.0);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _856 = _852 || _854;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _860 = !_642;
    float _862 = _860 ? _171 : as_type<float>(_844);
    float _864 = _820 + (-1.0);
    bool _866 = _413 > 0.5;
    float _868 = floor(_802);
    float _870 = _856 ? _838 : 0.0;
    float _872 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[78].z, _846);
    float _874 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[78].w, _858);
    float _876 = -_175;
    int _878 = _866 ? as_type<int>(_876) : as_type<int>(_175);
    float _880 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _882 = _810 > 0.0;
    float _884 = -_135;
    float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[76].x, _806);
    bool _888 = _810 >= 0.0;
    bool _890 = isnan(_810);
    bool _892 = _888 || _890;
    bool _894 = isnan(0.0);
    bool _896 = _892 || _894;
    float _898 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _872);
    float _900 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _764);
    float _902 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _874);
    if (_830)
    {
        float _904 = _870 * _840;
        _139 = _904;
    }
    float _906 = _139;
    float _908 = _413 + _790;
    float _910 = _790 * 2.0;
    float _912 = _766 + _668;
    bool _914 = _868 > 0.0;
    float _916 = _908 + (-1.0);
    int _918 = _896 ? 0 : 1;
    float _920 = floor(_910);
    bool _922 = _868 >= 0.0;
    bool _924 = isnan(_868);
    bool _926 = _922 || _924;
    bool _928 = isnan(0.0);
    bool _930 = _926 || _928;
    float _932 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _934 = _760 >> 31;
    float _936 = as_type<float>(_449) * _656;
    int _938 = _930 ? 0 : 1;
    float _940 = _862 + 0.5;
    int _942 = ~_918;
    int _944 = _942 + 1;
    int _946 = _944 + 1;
    float _948 = -_898;
    float _950 = _948 + 1.0;
    int _952 = _934 & 3;
    float _954 = trunc(_936);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    int _960 = _946;
    float _962 = _912;
    if (!_882)
    {
        int _964 = ~_918;
        int _966 = _964 + 1;
        _960 = _966;
    }
    int _968 = _960;
    float _970 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[80].x, _886);
    bool _972 = !_646;
    float _974 = _972 ? _175 : as_type<float>(_878);
    float _976 = _772 + _710;
    int _978 = ~_938;
    int _980 = _978 + 1;
    int _982 = _980 + 1;
    float _984 = -_950;
    float _986 = fma(_862, _984, _970);
    bool _988 = uint(_768) >= 2u;
    float _990 = _974 + (-0.5);
    int _992 = _982;
    float _994 = _976;
    if (!_914)
    {
        int _996 = ~_938;
        int _998 = _996 + 1;
        _992 = _998;
    }
    int _1000 = _992;
    float _1002 = -_902;
    float _1004 = _1002 + 1.0;
    int _1006 = _760 + _952;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1010 = _405 + _1008;
    int _1012 = _988 ? 0 : 1;
    float _1014 = -_990;
    float _1016 = -_900;
    float _1018 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1016);
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1022 = _1020 != 0;
    int _1024 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1026 = _1024 != 0;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1030 = _1028 != 0;
    int _1032 = _1006 >> 2;
    float _1034 = fma(_974, _1004, _1018);
    bool _1036 = _920 >= 0.0;
    bool _1038 = isnan(_920);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan(0.0);
    bool _1044 = _1040 || _1042;
    int _1046 = _1032 << 4;
    int _1048 = _1046 + 368;
    int _1050 = _1044 ? 0 : 1;
    out.m_64.x = _986;
    out.m_64.y = _1034;
    bool _1052 = _920 > 0.0;
    float _1054 = fma(_800, _1010, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1056 = ~_423;
    int _1058 = _1056 + 1;
    uint _1060 = uint(int(uint(_1048) >> uint(2)));
    uint _1062 = uint(int(uint(int(_1060)) >> uint(2)));
    int _1064 = int(_1060) & 3;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[int(_1062)][_1064];
    int _1068 = int(_1060) + 1;
    uint _1070 = uint(int(uint(_1068) >> uint(2)));
    int _1072 = _1068 & 3;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[int(_1070)][_1072];
    bool _1076 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1078 = isnan(_405);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1084 = _1080 || _1082;
    float _1086 = float(_1084);
    bool _1088 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1090 = isnan(_405);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    int _1100 = _1058 * int(_958);
    int _1102 = _1100 + _616;
    bool _1104 = !_1022;
    int _1106 = _1104 ? 0 : 1;
    float _1108 = -_1086;
    float _1110 = _1108 + 1.0;
    bool _1112 = _768 != 3;
    float _1114 = float(uint(_1102));
    float _1116 = _1098 * _1110;
    int _1118 = _1048 + 8;
    uint _1120 = uint(int(uint(_1118) >> uint(2)));
    uint _1122 = uint(int(uint(int(_1120)) >> uint(2)));
    int _1124 = int(_1120) & 3;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[int(_1122)][_1124];
    int _1128 = int(_1120) + 1;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    int _1132 = _1128 & 3;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[int(_1130)][_1132];
    float _1136 = -_1098;
    float _1138 = _1136 + 1.0;
    int _1140 = ~_423;
    int _1142 = _1140 + 1;
    float _1144 = as_type<float>(_449) * _1114;
    float _1146 = _1054 * _1116;
    int _1148 = abs(_818);
    int _1150 = ~_1012;
    int _1152 = _1150 + 1;
    int _1154 = _1152 + 1;
    float _1156 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1146);
    float _1158 = trunc(_1144);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    int _1164 = abs(_1106);
    bool _1166 = !_770;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1156);
    int _1172 = ~_1148;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    int _1178 = abs(_1168);
    float _1180 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1182 = float(_1164);
    int _1184 = _1154;
    if (_1112)
    {
        int _1186 = ~_1012;
        int _1188 = _1186 + 1;
        _1184 = _1188;
    }
    int _1190 = _1184;
    int _1192 = ~_1050;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    int _1198 = abs(_1190);
    int _1200 = int(_958) + int(_1162);
    int _1202 = _1196;
    if (!_1052)
    {
        int _1204 = ~_1050;
        int _1206 = _1204 + 1;
        _1202 = _1206;
    }
    int _1208 = _1202;
    float _1210 = float(_968);
    int _1212 = _1142 * _1200;
    int _1214 = _1212 + _616;
    float _1216 = float(_1208);
    bool _1218 = uint(_1214) >= uint(_423);
    int _1220 = _1176 * as_type<int>(_1074);
    int _1222 = ~_1178;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    float _1228 = _1182 * _1216;
    int _1230 = ~_1198;
    int _1232 = _1230 + 1;
    int _1234 = _1232 + 1;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1238 = _912 + _1236;
    bool _1240 = !_1218;
    int _1242 = _1240 ? 0 : (-1);
    int _1244 = _1226 * as_type<int>(_1066);
    int _1246 = _1244 + _1220;
    bool _1248 = !_726;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = _1228 * (-2.0);
    bool _1254 = _768 != 3;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1258 = _976 + _1256;
    int _1260 = _1234 * as_type<int>(_1126);
    int _1262 = _1260 + _1246;
    int _1264 = abs(_1250);
    float _1266 = in.m_66.x;
    float _1268 = in.m_66.y;
    float _1270 = in.m_66.z;
    bool _1272 = !_1254;
    int _1274 = _1272 ? 0 : (-1);
    int _1276 = ~_1200;
    int _1278 = _1276 + _1242;
    int _1280 = _1278 + 1;
    float _1282 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1284 = _754 + _1282;
    int _1286 = abs(_1274);
    bool _1288 = !_1026;
    int _1290 = _1288 ? 0 : 1;
    int _1292 = _423 * _1280;
    int _1294 = _1292 + _616;
    int _1296 = ~_1286;
    int _1298 = _1296 + 1;
    int _1300 = _1298 + 1;
    int _1302 = abs(_1290);
    float _1304 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1306 = _1300 * as_type<int>(_1134);
    int _1308 = _1306 + _1262;
    int _1310 = ~_1264;
    int _1312 = _1310 + 1;
    int _1314 = _1312 + 1;
    float _1316 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1304);
    bool _1318 = !_522;
    int _1320 = _1318 ? _1294 : (-1);
    float _1322 = float(_1302);
    int _1324 = _1308 * _1314;
    float _1326 = fma(_880, _1252, _880);
    float _1328 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1316);
    float _1330 = fma(_1252, _1266, _1266);
    int _1332 = _1320 * _1264;
    int _1334 = _1332 + _1324;
    float _1336 = _1238 * _1238;
    bool _1338 = _1328 >= 0.0;
    float _1340 = _1322 * _1210;
    float _1342 = fma(_1284, _1284, _1336);
    float _1344 = float(_1334);
    float _1346 = fma(_1258, _1258, _1342);
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1354 = _411 + (-0.5);
    float _1356 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1358 = rsqrt(_1346);
    float _1360 = _1342;
    if (_1338)
    {
        _1360 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1362 = _1360;
    float _1364 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1366 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1330);
    bool _1370 = !_1030;
    int _1372 = _1370 ? 0 : 1;
    int _1374 = as_type<int>(_1362);
    if (_1338)
    {
        float _1376 = _1362 * 5.0;
        _1374 = as_type<int>(_1376);
    }
    int _1378 = _1374;
    out.m_68.x = _1344;
    float _1380 = fma(_1326, _906, _1368);
    int _1382 = abs(_1372);
    float _1384 = _413 + (-0.5);
    out.m_70.x = _1356;
    out.m_70.y = _1364;
    out.m_70.z = _1366;
    out.m_70.w = _1180;
    if (_1338)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4722 = as_type<float>(_1378);
        out.gl_Position.z = _4722;
    }
    float _1386 = _1238 * _1358;
    float _1388 = _1284 * _1358;
    if (_1338)
    {
        out.m_49.x = 0.0;
    }
    if (_1338)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1390 = -_1386;
    float _1392 = fma(_1390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _912);
    float _1394 = _1258 * _1358;
    float _1396 = -_1388;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[18].w, _754);
    float _1400 = float(_1000);
    float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1404 = _1392 + _1402;
    float _1406 = _1340 * (-2.0);
    float _1408 = -_1394;
    float _1410 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[18].w, _976);
    float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1414 = _1398 + _1412;
    float _1416 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1418 = fma(_1406, _1268, _1268);
    float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1422 = _1410 + _1420;
    float _1424 = -_1386;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1238);
    float _1428 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1416);
    float _1430 = float(_1382);
    float _1432 = fma(_932, _1406, _932);
    float _1434 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1418);
    float _1436 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1428);
    float _1438 = -_1388;
    float _1440 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1284);
    float _1442 = _1426 * _1426;
    float _1444 = fma(_1432, _906, _1434);
    float _1446 = _1430 * _1400;
    bool _1448 = _1436 >= 0.0;
    float _1450 = fma(_1440, _1440, _1442);
    float _1452 = in.m_72.x;
    float _1454 = in.m_72.y;
    float _1456 = _1444 * 0.15915493667125701904296875;
    float _1458 = _1446 * (-2.0);
    float _1460 = _790 + _411;
    float _1462 = -_1394;
    float _1464 = fma(_1462, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1258);
    float _1466 = _1380 * 0.15915493667125701904296875;
    float _1468 = _1460 + (-1.0);
    float _1470 = fma(_1464, _1464, _1450);
    float _1472 = fma(_1458, _1270, _1270);
    float _1474 = _1466 * 6.283185482025146484375;
    float _1476 = sin(_1474);
    float _1478 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1480 = _790 + (-0.5);
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    int _1484 = as_type<int>(_1472);
    float _1486 = _1394;
    float _1488 = _1422;
    if (_1448)
    {
        _1482 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1490 = _1482;
    if (_1448)
    {
        out.m_49.x = 0.0;
    }
    float _1492 = fma(_1478, _1458, _1478);
    float _1494 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1472);
    float _1496 = _1466 * 6.283185482025146484375;
    float _1498 = cos(_1496);
    if (_1448)
    {
        float _1500 = _1490 * 5.0;
        _1484 = as_type<int>(_1500);
    }
    int _1502 = _1484;
    float _1504 = fma(_1492, _906, _1494);
    if (_1448)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4934 = as_type<float>(_1502);
        out.gl_Position.z = _4934;
    }
    float _1506 = _369 * _1454;
    float _1508 = _1456 * 6.283185482025146484375;
    float _1510 = sin(_1508);
    float _1512 = _1504 * 0.15915493667125701904296875;
    float _1514 = sqrt(_1470);
    float _1516 = _1456 * 6.283185482025146484375;
    float _1518 = cos(_1516);
    if (_1448)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1520 = _1512 * 6.283185482025146484375;
    float _1522 = cos(_1520);
    float _1524 = _1358 * _1514;
    float _1526 = _1506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1528 = _367 * _1452;
    float _1530 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _1532 = _1476 * _1510;
    float _1534 = _1526 * _1524;
    float _1536 = _1528 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1538 = _1512 * 6.283185482025146484375;
    float _1540 = sin(_1538);
    float _1542 = _1498 * _1518;
    float _1544 = _1530 * _1534;
    float _1546 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _171);
    float _1548 = _1536 * _1524;
    float _1550 = _1498 * _1510;
    float _1552 = _1476 * _1518;
    float _1554 = _1498 * _1522;
    float _1556 = _1546 * _1548;
    float _1558 = _1518 * _1522;
    float _1560 = _1476 * _1522;
    float _1562 = _1554 * _1544;
    float _1564 = _1510 * _1522;
    float _1566 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1568 = _1566 * 0.5;
    float _1570 = _1560 * _1544;
    float _1572 = fma(_1540, _1542, _1532);
    float _1574 = -_1544;
    float _1576 = _1540 * _1574;
    float _1578 = -_1552;
    float _1580 = fma(_1540, _1550, _1578);
    float _1582 = -_1550;
    float _1584 = fma(_1540, _1552, _1582);
    float _1586 = fma(_1572, _1556, _1562);
    float _1588 = fma(_1558, _1556, _1576);
    float _1590 = fma(_1540, _1532, _1542);
    float _1592 = fma(_1584, _1556, _1570);
    float _1594 = fma(_1580, _1568, _1586);
    float _1596 = fma(_1564, _1568, _1588);
    float _1598 = _1572 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1600 = fma(_1590, _1568, _1592);
    float _1602 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1604 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1606 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1608 = _1572 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1610 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1602);
    float _1612 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1604);
    float _1614 = _1572 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1616 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1606);
    float _1618 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1610);
    float _1620 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1612);
    float _1622 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1608);
    float _1624 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1598);
    float _1626 = _1618 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1628 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1630 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1614);
    float _1632 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1634 = _754 + _1626;
    float _1636 = _976 + _1628;
    float _1638 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1640 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1642 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1644 = _1634 + _1642;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1648 = _1636 + _1646;
    float _1650 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1616);
    float _1652 = -_1540;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1632);
    float _1656 = _1644 * _1644;
    float _1658 = _1648 * _1648;
    float _1660 = -_1540;
    float _1662 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1638);
    float _1664 = -_1540;
    float _1666 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1640);
    float _1668 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1622);
    float _1670 = _1656 + _1658;
    float _1672 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1624);
    float _1674 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1676 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1630);
    float _1678 = sqrt(_1670);
    float _1680 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1682 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1684 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1686 = _912 + _1674;
    float _1688 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1680);
    float _1690 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1682);
    float _1692 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1684);
    bool _1694 = _1678 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1696 = _1684;
    float _1698 = _1682;
    float _1700 = _1680;
    float _1702 = _1634;
    float _1704 = _1656;
    float _1706 = _1672;
    if (!_1694)
    {
        _1696 = _1634;
    }
    float _1708 = _1696;
    float _1710 = _1708;
    if (!_1694)
    {
        _1698 = _1658;
    }
    float _1712 = _1698;
    float _1714 = _1712;
    if (!_1694)
    {
        _1700 = _1636;
    }
    float _1716 = _1700;
    float _1718 = _1716;
    if (!_1694)
    {
        _1702 = _1686;
    }
    float _1720 = _1702;
    bool _1722 = !_1694;
    float _1724 = _1720;
    if (!_1722)
    {
        float _1726 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1730 = _1678 + _1728;
        float _1732 = rsqrt(_1670);
        float _1734 = _1730 * _1726;
        float _1736 = _1686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1738 = _1734 * 0.15915493667125701904296875;
        float _1740 = _1738 * 6.283185482025146484375;
        float _1742 = sin(_1740);
        float _1744 = _1738 * 6.283185482025146484375;
        float _1746 = cos(_1744);
        float _1748 = fma(_1742, _1736, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1750 = _1732 * _1748;
        float _1752 = fma(_1644, _1750, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1754 = _1746 + (-1.0);
        float _1756 = fma(_1648, _1750, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1760 = _1752 + _1758;
        float _1762 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1764 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1766 = _1756 + _1764;
        float _1768 = _1760 * _1760;
        float _1770 = fma(_1686, _1746, _1762);
        float _1772 = _1766 * _1766;
        _1724 = _1770;
        _1704 = _1768;
        _1714 = _1772;
        _1718 = _1756;
        _1710 = _1752;
    }
    float _1774 = _1724;
    float _1776 = _1704;
    float _1778 = _1714;
    float _1780 = _1718;
    float _1782 = _1710;
    float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1786 = _1774 + _1784;
    float _1788 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1654);
    float _1790 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1662);
    float _1792 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1794 = fma(_1786, _1786, _1776);
    float _1796 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1666);
    float _1798 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1688);
    float _1800 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1690);
    float _1802 = _1794 + _1778;
    float _1804 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1692);
    float _1806 = _171 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1808 = _1792 * _1788;
    float _1810 = _1792 * _1790;
    float _1812 = _1792 * _1796;
    float _1814 = sqrt(_1802);
    float _1816 = fma(_1806, _1668, _1808);
    float _1818 = fma(_1806, _1672, _1810);
    float _1820 = fma(_1806, _1676, _1812);
    float _1822 = _1798 + _1816;
    float _1824 = _1800 + _1818;
    float _1826 = _1804 + _1820;
    out.m_74.x = _1822;
    out.m_74.y = _1824;
    out.m_74.z = _1826;
    bool _1828 = _1814 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1830 = isnan(_1814);
    bool _1832 = _1828 || _1830;
    bool _1834 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1836 = _1832 || _1834;
    if (!_1836)
    {
        _1706 = 1.0;
    }
    float _1838 = _1706;
    bool _1840 = !_1836;
    float _1842 = _1838;
    if (!_1840)
    {
        bool _1844 = _1814 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1846 = isnan(_1814);
        bool _1848 = _1844 || _1846;
        bool _1850 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1852 = _1848 || _1850;
        if (!_1852)
        {
            float _1854 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1856 = _1814 + _1854;
            float _1858 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1860 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1858;
            float _1862 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1864 = _1862 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1866 = 1.0 / _1860;
            float _1868 = _1856 * _1866;
            float _1870 = fma(_1868, _1864, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1842 = _1870;
            _1872 = true;
        }
        else
        {
            bool _1874 = _1814 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1876 = isnan(_1814);
            bool _1878 = _1874 || _1876;
            bool _1880 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1882 = _1878 || _1880;
            if (!_1882)
            {
                float _1884 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1886 = _1814 + _1884;
                float _1888 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1890 = _1888 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1892 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1894 = _1892 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1896 = 1.0 / _1890;
                float _1898 = _1886 * _1896;
                float _1900 = fma(_1898, _1894, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1842 = _1900;
                _1872 = true;
            }
            else
            {
                _1842 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1872 = false;
    float _1902 = _1842;
    float _1904 = _1392 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1906 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1908 = _1780 + _1906;
    float _1910 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1904);
    float _1912 = _1392 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1914 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1916 = _1782 + _1914;
    float _1918 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1910);
    bool _1920 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1922 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1924 = _1920 || _1922;
    bool _1926 = isnan(0.5);
    bool _1928 = _1924 || _1926;
    float _1930 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1932 = _1774 + _1930;
    bool _1934 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1936 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1938 = _1934 || _1936;
    bool _1940 = isnan(0.5);
    bool _1942 = _1938 || _1940;
    float _1944 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1946 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1912);
    float _1948 = fma(_1908, _1902, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1950 = fma(_1916, _1902, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1952 = 1.0 / _1944;
    float _1954 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1946);
    float _1956 = fma(_1932, _1902, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1958 = -_1394;
    float _1960 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1948);
    float _1962 = -_1388;
    float _1964 = fma(_1962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1950);
    float _1966 = _1954 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1968 = -_1386;
    float _1970 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1956);
    float _1972 = _1970;
    float _1974 = _1964;
    float _1976 = _1960;
    float _1978 = _1944;
    if (_1942)
    {
        _1486 = 1.0;
    }
    float _1980 = _1486;
    float _1982 = _1966 + _1944;
    float _1984 = _1982 * _1952;
    float _1986 = _1984 * 0.5;
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1990 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1988);
    float _1992 = 1.0 / _1990;
    float _1994 = _1980;
    if (!_1928)
    {
        float _1996 = _1404 * _1404;
        float _1998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2000 = -_912;
        float _2002 = _2000 + _1956;
        float _2004 = -_976;
        float _2006 = _2004 + _1948;
        float _2008 = fma(_1414, _1414, _1996);
        float _2010 = fma(_1422, _1422, _2008);
        float _2012 = 1.0 / _1524;
        float _2014 = sqrt(_2010);
        float _2016 = precise::min(_2014, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2018 = _2016 * _1998;
        float _2020 = -_754;
        float _2022 = _2020 + _1950;
        float _2024 = _2018 * _2012;
        float _2026 = fma(_2022, _2024, _1398);
        float _2028 = fma(_2002, _2024, _1392);
        float _2030 = fma(_2006, _2024, _1410);
        _1972 = _2028;
        _1974 = _2026;
        _1976 = _2030;
        _994 = _2006;
    }
    float _2032 = _1972;
    float _2034 = _1974;
    float _2036 = _1976;
    float _2038 = _994;
    float _2040 = _2038;
    if (_1942)
    {
        _2040 = 1.0;
    }
    float _2042 = _2040;
    float _2044 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2046 = _1992 * _2044;
    float _2048 = _2042;
    if (!_1942)
    {
        float _2050 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2052 = _2050 * 0.15915493667125701904296875;
        float _2054 = _2052 * 6.283185482025146484375;
        float _2056 = cos(_2054);
        float _2058 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2060 = _2058 * 0.15915493667125701904296875;
        float _2062 = _2052 * 6.283185482025146484375;
        float _2064 = sin(_2062);
        float _2066 = 1.0 / _2056;
        float _2068 = _2060 * 6.283185482025146484375;
        float _2070 = cos(_2068);
        float _2072 = _2064 * _2066;
        float _2074 = _2060 * 6.283185482025146484375;
        float _2076 = sin(_2074);
        float _2078 = _2070 * _2072;
        float _2080 = 1.0 / _2078;
        float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2084 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2082;
        float _2086 = 1.0 / _2084;
        float _2088 = _2076 * _2080;
        float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2092 = fma(_2046, _2088, _2090);
        float _2094 = _2092 * _2086;
        float _2096 = precise::clamp(_2094, 0.0, 1.0);
        _1488 = _2060;
        _1994 = _2096;
    }
    float _2098 = _1488;
    float _2100 = _1994;
    float _2102 = _2098;
    if (!_1942)
    {
        float _2104 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2106 = _2104 * 0.15915493667125701904296875;
        float _2108 = _2106 * 6.283185482025146484375;
        float _2110 = cos(_2108);
        float _2112 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2114 = _2112 * 0.15915493667125701904296875;
        float _2116 = _2106 * 6.283185482025146484375;
        float _2118 = sin(_2116);
        float _2120 = 1.0 / _2110;
        float _2122 = _2114 * 6.283185482025146484375;
        float _2124 = cos(_2122);
        float _2126 = _2118 * _2120;
        float _2128 = _2114 * 6.283185482025146484375;
        float _2130 = sin(_2128);
        float _2132 = _2124 * _2126;
        float _2134 = 1.0 / _2132;
        float _2136 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2138 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2136;
        float _2140 = 1.0 / _2138;
        float _2142 = _2130 * _2134;
        float _2144 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2146 = fma(_2046, _2142, _2144);
        float _2148 = _2146 * _2140;
        float _2150 = precise::clamp(_2148, 0.0, 1.0);
        float _2152 = -_2150;
        float _2154 = _2152 + 1.0;
        _2102 = _2120;
        _2048 = _2154;
    }
    float _2156 = _2102;
    float _2158 = _2048;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2162 = _2032 + _2160;
    float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2166 = _2034 + _2164;
    float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2170 = _2036 + _2168;
    float _2172 = _2162 * _2162;
    float _2174 = fma(_2166, _2166, _2172);
    float _2176 = fma(_2170, _2170, _2174);
    float _2178 = rsqrt(_2176);
    float _2180 = sqrt(_2176);
    float _2182 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2184 = _2166 * _2182;
    float _2186 = _2170 * _2182;
    float _2188 = _2184 * _2184;
    float _2190 = _2186 * _2186;
    float _2192 = _2188 + _2190;
    float _2194 = sqrt(_2192);
    bool _2196 = _2194 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2200 = _2194 + _2198;
    float _2202 = _2156;
    float _2204 = _2192;
    float _2206 = _2200;
    float _2208 = _2162;
    float _2210 = _2184;
    if (_2196)
    {
        float _2212 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2202 = _2212;
    }
    float _2214 = _2202;
    if (_2196)
    {
        float _2216 = rsqrt(_2192);
        _2204 = _2216;
    }
    float _2218 = _2204;
    if (_2196)
    {
        float _2220 = _2200 * _2214;
        _2206 = _2220;
    }
    float _2222 = _2206;
    if (_2196)
    {
        float _2224 = _2222 * 0.15915493667125701904296875;
        _962 = _2224;
    }
    float _2226 = _962;
    float _2228 = _2170;
    float _2230 = _2226;
    if (_2196)
    {
        float _2232 = _2226 * 6.283185482025146484375;
        float _2234 = sin(_2232);
        _2228 = _2234;
    }
    float _2236 = _2228;
    float _2238 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2240 = precise::max(0.0, _2238);
    float _2242 = _2214;
    float _2244 = _2240;
    if (_2196)
    {
        float _2246 = _2226 * 6.283185482025146484375;
        float _2248 = cos(_2246);
        _2242 = _2248;
    }
    float _2250 = _2242;
    float _2252 = -_2182;
    float _2254 = -_2240;
    float _2256 = fma(_2162, _2252, _2254);
    if (_2196)
    {
        float _2258 = _2256 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2208 = _2258;
    }
    float _2260 = _2208;
    float _2262 = _2236;
    float _2264 = _2260;
    if (_2196)
    {
        float _2266 = fma(_2236, _2260, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2262 = _2266;
    }
    float _2268 = _2262;
    float _2270 = _2268;
    if (!_2196)
    {
        _2264 = _2256;
    }
    float _2272 = _2264;
    float _2274 = _2272;
    float _2276 = _2250;
    if (_2196)
    {
        float _2278 = _2250 + (-1.0);
        _2244 = _2278;
    }
    float _2280 = _2244;
    float _2282 = _2280;
    if (_2196)
    {
        float _2284 = _2218 * _2268;
        _1978 = _2284;
    }
    float _2286 = _1978;
    if (!_2196)
    {
        _2270 = _2188;
    }
    float _2288 = _2270;
    float _2290 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2292 = _2288;
    if (_2196)
    {
        float _2294 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2230 = _2294;
    }
    float _2296 = _2230;
    if (_2196)
    {
        float _2298 = _2184 * _2286;
        _2210 = _2298;
    }
    float _2300 = _2210;
    if (!_2196)
    {
        _2282 = _2186;
    }
    float _2302 = _2282;
    float _2304 = _2302;
    if (_2196)
    {
        float _2306 = _2186 * _2286;
        _2304 = _2306;
    }
    float _2308 = _2304;
    if (_2196)
    {
        float _2310 = fma(_2256, _2250, _2296);
        _2274 = _2310;
    }
    float _2312 = _2274;
    if (_2196)
    {
        float _2314 = _2300 * _2300;
        _2292 = _2314;
    }
    float _2316 = _2292;
    if (!_2196)
    {
        _2276 = _2190;
    }
    float _2318 = _2276;
    float _2320 = _2318;
    if (_2196)
    {
        float _2322 = _2308 * _2308;
        _2320 = _2322;
    }
    float _2324 = _2320;
    float _2326 = fma(_2312, _2312, _2316);
    float _2328 = _2326 + _2324;
    float _2330 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2290);
    float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2334 = fma(_2180, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2332);
    float _2336 = precise::clamp(_2334, 0.0, 1.0);
    float _2338 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2340 = rsqrt(_2328);
    float _2342 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2330);
    float _2344 = -_2336;
    float _2346 = _2344 + 1.0;
    float _2348 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2350 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2338);
    float _2352 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2354 = _2342 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2356 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2348);
    float _2358 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2350);
    float _2360 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2352);
    float _2362 = abs(_2346);
    float _2364 = log2(_2362);
    float _2366 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2368 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2370 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2356);
    float _2372 = _2358 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2374 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2360);
    float _2376 = -_2368;
    float _2378 = fma(_2376, _2366, 1.0);
    float _2380 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2382 = _2372 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2384 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2386 = _2340 * _2300;
    float _2388 = _2340 * _2308;
    float _2390 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2382);
    float _2392 = _2340 * _2312;
    float _2394 = _2386 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2396 = log2(_2378);
    float _2398 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2400 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2390);
    float _2402 = -_2394;
    float _2404 = fma(_2392, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2402);
    float _2406 = _2372 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2408 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2400);
    float _2410 = exp2(_2398);
    float _2412 = -_2388;
    float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2404);
    float _2416 = _2372 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2418 = fma(_2414, -0.5, 0.5);
    float _2420 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2416);
    float _2422 = fma(_2414, 0.5, 0.5);
    float _2424 = 1.0 / _2408;
    float _2426 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2406);
    float _2428 = _2392 + 1.0;
    float _2430 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2420);
    float _2432 = fma(_2422, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2434 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2426);
    float _2436 = _2396 * 0.693147182464599609375;
    float _2438 = sqrt(_2418);
    float _2440 = -_2392;
    float _2442 = fma(_2410, _2428, _2440);
    float _2444 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2430);
    float _2446 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2434);
    float _2448 = fma(_2422, _2432, -0.212114393711090087890625);
    float _2450 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2452 = _2444 * _2424;
    float _2454 = _2446 * _2424;
    float _2456 = fma(_2422, _2448, 1.570728778839111328125);
    float _2458 = fma(_2452, 0.5, 0.5);
    float _2460 = fma(_2454, -0.5, 0.5);
    float _2462 = _2438 * 0.636619746685028076171875;
    float _2464 = fma(_2442, 0.5, 0.5);
    float3 _6506 = float3(_2458, _2460, _2450);
    float _2466 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6506, float3(0.0), isnan(_6506)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6506, float3(0.0), isnan(_6506)), level(0.0)).x;
    float3 _6517 = float3(_2458, _2460, _2450);
    float4 _2469 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6517, float3(0.0), isnan(_6517)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6517, float3(0.0), isnan(_6517)), level(0.0)).xyzw;
    float _2471 = _2469.x;
    float _2473 = _2469.y;
    float _2475 = _2469.z;
    float _2477 = _2469.w;
    float _2479 = -_2456;
    float _2481 = fma(_2462, _2479, 1.0);
    float2 _6539 = float2(_2481, _2464);
    float3 _2485 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6539, float2(0.0), isnan(_6539)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6539, float2(0.0), isnan(_6539)), level(0.0)).xyz;
    float _2487 = _2485.x;
    float _2489 = _2485.y;
    float _2491 = _2485.z;
    float _2493 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2495 = _2372 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2497 = _2180 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2499 = isnan(_2180);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2505 = _2501 || _2503;
    float _2507 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2495);
    float _2509 = exp2(_2493);
    float _2511 = _2408 * 0.5;
    float _2513 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2507);
    float _2515 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2513);
    float _2517 = fma(_2446, -0.5, _2511);
    float _2519 = _2444 + _2408;
    float _2521 = _2515 + _2408;
    out.gl_Position.x = _2444;
    out.gl_Position.y = _2446;
    out.gl_Position.z = _2515;
    out.gl_Position.w = _2408;
    float _2523 = _2519 * 0.5;
    float _2525 = _2521 * 0.5;
    float _2527 = -_2509;
    float _2529 = _2527 + 1.0;
    float _2531 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_76.x = _2523;
    out.m_76.y = _2517;
    out.m_76.z = _2525;
    out.m_76.w = _2408;
    float _2533 = -_2531;
    float _2535 = _2533 + 1.0;
    float _2537 = _2100 * _2158;
    float _2539 = _2515;
    float _2541 = _2446;
    float _2543 = _2537;
    if (!_2505)
    {
        _2539 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2545 = _2539;
    float _2547 = _2545;
    float _2549 = _2545;
    if (!_2505)
    {
        _2541 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2551 = _2541;
    float _2553 = _2531 * _2466;
    float _2555 = _2477 * _2535;
    float _2557 = _2537 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2559 = _2551;
    float _2561 = _2551;
    if (!_2505)
    {
        _2543 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2563 = _2543;
    float _2565 = _2477 * _2553;
    float _2567 = _2491 * _2553;
    float _2569 = fma(_2487, _2565, _2471);
    float _2571 = fma(_2489, _2565, _2473);
    float _2573 = fma(_2477, _2567, _2475);
    out.m_78.x = _2569;
    out.m_78.y = _2571;
    out.m_78.z = _2573;
    out.m_78.w = _2555;
    bool _2575 = !_2505;
    float _2577 = _2563;
    float _2579 = _2563;
    if (!_2575)
    {
        bool _2581 = _2180 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2583 = isnan(_2180);
        bool _2585 = _2581 || _2583;
        bool _2587 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2589 = _2585 || _2587;
        if (!_2589)
        {
            float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2593 = _2180 + _2591;
            float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2597 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2595;
            float _2599 = 1.0 / _2597;
            float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2603 = _2601 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2607 = _2605 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2609 = _2593 * _2599;
            float _2611 = precise::clamp(_2609, 0.0, 1.0);
            float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2617 = fma(_2611, _2607, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2619 = fma(_2611, _2615, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2621 = fma(_2611, _2603, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2561 = _2621;
            _2549 = _2619;
            _2579 = _2617;
            _2623 = true;
        }
        else
        {
            bool _2625 = _2180 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2627 = isnan(_2180);
            bool _2629 = _2625 || _2627;
            bool _2631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2633 = _2629 || _2631;
            if (!_2633)
            {
                _2547 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2635 = _2547;
            _2549 = _2635;
            if (!_2633)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2637 = _2559;
            _2561 = _2637;
            if (!_2633)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2639 = _2577;
            bool _2641 = !_2633;
            _2579 = _2639;
            if (!_2641)
            {
                bool _2643 = _2180 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2645 = isnan(_2180);
                bool _2647 = _2643 || _2645;
                bool _2649 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2651 = _2647 || _2649;
                if (!_2651)
                {
                    float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2655 = _2180 + _2653;
                    float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2659 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2657;
                    float _2661 = 1.0 / _2659;
                    float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2669 = _2667 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2671 = _2655 * _2661;
                    float _2673 = precise::clamp(_2671, 0.0, 1.0);
                    float _2675 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2677 = _2675 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2679 = fma(_2673, _2669, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2681 = fma(_2673, _2677, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2683 = fma(_2673, _2665, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2561 = _2683;
                    _2549 = _2681;
                    _2579 = _2679;
                    _2623 = true;
                }
                else
                {
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2549 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2623 = false;
    float _2685 = _2561;
    float _2687 = _2549;
    float _2689 = _2579;
    float _2691 = _2557 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_80.x = 0.0;
    float _2693 = _2685 * 0.586610972881317138671875;
    bool _2695 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _2691;
    float _2697 = fma(_2687, 0.298911988735198974609375, _2693);
    bool _2699 = _2100 > 0.0;
    bool _2701 = isnan(_2100);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan(0.0);
    bool _2707 = _2703 || _2705;
    float _2709 = fma(_2689, 0.114477999508380889892578125, _2697);
    bool _2711 = _2158 <= 0.0;
    bool _2713 = !_2707;
    bool _2715 = _2711 || _2713;
    float _2717 = -_2709;
    float _2719 = _2717 + _2687;
    float _2721 = -_2709;
    float _2723 = _2721 + _2685;
    float _2725 = -_2709;
    float _2727 = _2725 + _2689;
    float _2729 = fma(_2719, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2709);
    float _2731 = fma(_2723, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2709);
    float _2733 = fma(_2727, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2709);
    bool _2735 = !_2695;
    if (!_2735)
    {
        float _2737 = -_2032;
        float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2741 = -_2034;
        float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2745 = -_2036;
        float _2747 = _2745 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2749 = _2739 * _2739;
        float _2751 = fma(_2743, _2743, _2749);
        float _2753 = fma(_2747, _2747, _2751);
        float _2755 = sqrt(_2753);
        float _2757 = rsqrt(_2753);
        float _2759 = -_2755;
        float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2763 = _2761 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2765 = precise::clamp(_2763, 0.0, 1.0);
        float _2767 = _2743 * _2757;
        float _2769 = _2739 * _2757;
        float _2771 = abs(_2765);
        float _2773 = log2(_2771);
        float _2775 = _2747 * _2757;
        float _2777 = _2767 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2779 = _1824 * _2769;
        float _2781 = -_2769;
        float _2783 = -_2777;
        float _2785 = fma(_2781, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2783);
        float _2787 = fma(_1822, _2767, _2779);
        float _2789 = -_2775;
        float _2791 = fma(_2789, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2785);
        float _2793 = fma(_1826, _2775, _2787);
        float _2795 = precise::clamp(_2793, 0.0, 1.0);
        float _2797 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2799 = _2791 + _2797;
        float _2801 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2803 = _2799 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2805 = precise::clamp(_2803, 0.0, 1.0);
        float _2807 = exp2(_2801);
        float _2809 = _2807 * _2805;
        float _2811 = _2795 * _2809;
        float _2813 = _2811 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2815 = _2811 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2817 = _2811 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_80.x = _2813;
        out.m_80.y = _2815;
        out.m_80.z = _2817;
    }
    out.m_82.x = _2729;
    out.m_82.y = _2731;
    out.m_82.z = _2733;
    if (!_2715)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2819 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2819;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

