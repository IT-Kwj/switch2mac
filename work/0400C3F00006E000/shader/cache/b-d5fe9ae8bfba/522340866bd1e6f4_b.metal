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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
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
    float4 m_70 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_76 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_72 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_56 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1804 = false;
    bool _315 = false;
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
        float _2482 = as_type<float>(_111);
        out.gl_Position.z = _2482;
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
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
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
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2552 = as_type<float>(_149);
        out.gl_Position.z = _2552;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _155 = in.m_54.w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = in.m_49.x;
    float _169 = in.m_49.y;
    float _171 = in.m_49.z;
    float _173 = in.m_44.x;
    float _175 = in.m_44.y;
    float _177 = in.m_44.z;
    float _179 = 0.0;
    float _181 = _153;
    if (!_165)
    {
        float _183 = _153 * _153;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _187;
    if (!_165)
    {
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _191;
    }
    float _193 = _189;
    int _195 = as_type<int>(_151) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_151) & 2;
    bool _201 = _199 != 0;
    bool _203 = !_197;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_201;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_165;
    float _213 = _193;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _153 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _153);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _243;
    }
    float _245 = _213;
    bool _247 = !_165;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _153 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _181 = _267;
    }
    float _269 = _181;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _273 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _275 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _277 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _279 = fma(_269, _167, _273);
    float _281 = fma(_269, _169, _275);
    float _283 = fma(_269, _171, _277);
    float _285 = fma(_279, _155, _173);
    float _287 = fma(_281, _155, _175);
    float _289 = fma(_283, _155, _177);
    bool _291 = !_271;
    float _311;
    float _313;
    if (!_291)
    {
        float _293 = in.m_56.x;
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _297 = _293 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _301 = _299 * _295;
        float _303 = float(_95);
        float _305 = floor(_301);
        float _307 = -_305;
        float _309 = _301 + _307;
        _311 = _309;
        _313 = _303;
        _315 = true;
    }
    else
    {
        float _317 = float(_95);
        float _319 = 1.0 / _317;
        float _321 = _129 * _319;
        _311 = _321;
        _313 = _317;
    }
    _315 = false;
    float _323 = _311;
    float _325 = _313;
    float _327 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _329 = int(_327);
    float _331 = in.m_56.x;
    float _333 = in.m_56.y;
    float _335 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _337 = int(_335);
    bool _339 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _341 = isnan(_323);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = float(_329);
    float _353 = 1.0 / _325;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _363 = float(uint(_337));
    float _365 = 1.0 / _351;
    int _367 = ~_337;
    int _369 = _367 + 1;
    int _371 = ~_337;
    int _373 = _371 + 1;
    bool _375 = _337 == 0;
    int _377 = ~_337;
    int _379 = _377 + 1;
    float _381 = 1.0 / _363;
    int _383 = ~_337;
    int _385 = _383 + 1;
    float _387 = _365 * _129;
    float _389 = trunc(_387);
    int _391 = int(_389);
    int _393 = as_type<int>(_381) + (-2);
    float _395 = float(_337);
    float _397 = float(uint(_391));
    float _399 = as_type<float>(_393) * _397;
    float _401 = trunc(_399);
    float _403 = precise::max(_401, 0.0);
    uint _406 = uint(_403);
    int _408 = _369 * int(_406);
    int _410 = _408 + _391;
    float _412 = float(uint(_410));
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _416 = _414 != 0;
    float _418 = as_type<float>(_393) * _412;
    float _420 = trunc(_418);
    float _422 = precise::max(_420, 0.0);
    uint _424 = uint(_422);
    int _426 = int(_406) + int(_424);
    float _428 = float(_391);
    int _430 = _373 * _426;
    int _432 = _430 + _391;
    bool _434 = _428 >= _395;
    bool _436 = isnan(_428);
    bool _438 = _434 || _436;
    bool _440 = isnan(_395);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    bool _446 = !_416;
    float _448 = _446 ? 7.345489978790283203125 : 1.0;
    bool _450 = uint(_432) >= uint(_337);
    float _452 = trunc(_444);
    int _454 = int(_452);
    float _456 = _448 * _331;
    bool _458 = !_450;
    int _460 = _458 ? 0 : (-1);
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _464 = _462 != 0;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _468 = _466 != 0;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _472 = _470 != 0;
    int _474 = ~_426;
    int _476 = _474 + _460;
    int _478 = _476 + 1;
    float _480 = floor(_456);
    int _482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _484 = _482 != 0;
    int _486 = _337 * _478;
    int _488 = _486 + _391;
    bool _490 = !_464;
    int _492 = _490 ? 0 : 1;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _496 = _494 != 0;
    int _498 = ~_454;
    int _500 = _498 + 1;
    int _502 = _500 + 1;
    bool _504 = !_375;
    int _506 = _504 ? _488 : (-1);
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _510 = _508 != 0;
    int _512 = _506 * _502;
    float _514 = -_480;
    float _516 = _456 + _514;
    bool _518 = !_468;
    int _520 = _518 ? 0 : 1;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _524 = _522 != 0;
    float _526 = _516 * _395;
    float _528 = _395 * _129;
    int _530 = _337 + (-1);
    int _532 = abs(_520);
    float _534 = _528 * _353;
    float _536 = trunc(_526);
    int _538 = int(_536);
    int _540 = _454 * _530;
    int _542 = _540 + _512;
    bool _544 = !_484;
    int _546 = _544 ? 0 : 1;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _550 = _548 != 0;
    bool _552 = !_472;
    int _554 = _552 ? 0 : 1;
    float _556 = trunc(_534);
    int _558 = int(_556);
    int _560 = abs(_492);
    bool _562 = !_550;
    int _564 = _562 ? 0 : 1;
    int _566 = abs(_546);
    int _568 = abs(_554);
    int _570 = _542 * _532;
    int _572 = abs(_564);
    int _574 = _538 * _566;
    int _576 = _574 + _391;
    bool _578 = _337 == 0;
    float _580 = float(uint(_576));
    int _582 = _558 * _560;
    int _584 = _582 + _570;
    int _586 = _576 * _568;
    int _588 = _586 + _584;
    float _590 = as_type<float>(_393) * _580;
    float _592 = in.m_58.x;
    float _594 = in.m_58.y;
    float _596 = in.m_58.z;
    int _598 = _538 * _572;
    int _600 = _598 + _588;
    int _602 = ~_337;
    int _604 = _602 + 1;
    float _606 = trunc(_590);
    float _608 = precise::max(_606, 0.0);
    uint _610 = uint(_608);
    float _612 = in.m_60.x;
    float _614 = in.m_60.y;
    float _616 = in.m_60.z;
    float _618 = float(uint(_600));
    float _620 = as_type<float>(_393) * _618;
    float _622 = trunc(_620);
    float _624 = precise::max(_622, 0.0);
    uint _626 = uint(_624);
    int _628 = _379 * int(_610);
    int _630 = _628 + _576;
    float _632 = _287 * _594;
    int _634 = _604 * int(_626);
    int _636 = _634 + _600;
    float _638 = float(uint(_636));
    float _640 = as_type<float>(_393) * _638;
    float _642 = in.m_62.x;
    float _644 = in.m_62.y;
    float _646 = in.m_62.z;
    float _648 = trunc(_640);
    float _650 = precise::max(_648, 0.0);
    uint _652 = uint(_650);
    int _654 = int(_626) + int(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _656;
    float _660 = float(uint(_630));
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    int _666 = _385 * _654;
    int _668 = _666 + _600;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _672 = _323 + _670;
    float _674 = as_type<float>(_393) * _660;
    float _676 = _287 * _614;
    float _678 = _287 * _644;
    bool _680 = uint(_668) >= uint(_337);
    float _682 = fma(_285, _592, _632);
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _686 = trunc(_674);
    float _688 = precise::max(_686, 0.0);
    uint _690 = uint(_688);
    bool _692 = !_680;
    int _694 = _692 ? 0 : (-1);
    float _696 = _333 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _698 = fma(_285, _612, _676);
    float _700 = fma(_285, _642, _678);
    int _702 = ~_654;
    int _704 = _702 + _694;
    int _706 = _704 + 1;
    float _708 = fma(_696, -2.0, _684);
    float _710 = fma(_289, _596, _682);
    float _712 = in.m_56.z;
    int _714 = _337 * _706;
    int _716 = _714 + _600;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _722;
    int _726 = ~_337;
    int _728 = _726 + 1;
    float _730 = fma(_289, _616, _698);
    bool _732 = !_578;
    int _734 = _732 ? _716 : (-1);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _738 = int(_610) + int(_690);
    float _740 = _331 * 2.0;
    int _742 = _734 & 3;
    bool _744 = _742 != 0;
    float _746 = 1.0 / _720;
    int _748 = _734 & 3;
    bool _750 = _748 != 0;
    float _752 = -_736;
    float _754 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[77].x, _752);
    bool _756 = uint(_742) > 1u;
    float _758 = fma(_289, _646, _700);
    int _760 = _750 ? 0 : 1;
    float _762 = _333 + _331;
    float _764 = floor(_740);
    int _766 = _728 * _738;
    int _768 = _766 + _576;
    bool _770 = !_524;
    int _772 = _770 ? 0 : 1;
    float _774 = _762 + (-1.0);
    int _776 = ~_760;
    int _778 = _776 + 1;
    int _780 = _778 + 1;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _784 = _323 + _782;
    bool _786 = _742 != 3;
    float _788 = -_129;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[76].x, _754);
    float _792 = 1.0 / _724;
    int _794 = _780;
    float _796 = _730;
    if (!_756)
    {
        int _798 = ~_760;
        int _800 = _798 + 1;
        _794 = _800;
    }
    int _802 = _794;
    float _804 = _333 * 2.0;
    bool _806 = uint(_768) >= uint(_337);
    float _808 = _672 * _746;
    bool _810 = uint(_742) >= 2u;
    bool _812 = !_806;
    int _814 = _812 ? 0 : (-1);
    float _816 = floor(_804);
    int _818 = _810 ? 0 : 1;
    bool _820 = _764 > 0.0;
    bool _822 = _764 >= 0.0;
    bool _824 = isnan(_764);
    bool _826 = _822 || _824;
    bool _828 = isnan(0.0);
    bool _830 = _826 || _828;
    float _832 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _834 = _333 + _712;
    float _836 = _784 * _792;
    int _838 = ~_818;
    int _840 = _838 + 1;
    int _842 = _840 + 1;
    int _844 = _842;
    if (_786)
    {
        int _846 = ~_818;
        int _848 = _846 + 1;
        _844 = _848;
    }
    int _850 = _844;
    float _852 = _834 + (-1.0);
    bool _854 = _331 > 0.5;
    float _856 = fma(_658, _836, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _858 = ~_738;
    int _860 = _858 + _814;
    int _862 = _860 + 1;
    float _864 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _866 = -_205;
    int _868 = _854 ? as_type<int>(_866) : as_type<int>(_205);
    float _870 = _712 * 2.0;
    int _872 = _734 >> 31;
    int _874 = _337 * _862;
    int _876 = _874 + _576;
    bool _878 = _333 > 0.5;
    float _880 = fma(_357, _836, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    int _882 = _830 ? 0 : 1;
    float _884 = floor(_870);
    int _886 = _872 & 3;
    float _888 = -_209;
    int _890 = _878 ? as_type<int>(_888) : as_type<int>(_209);
    bool _892 = !_510;
    float _894 = _892 ? _205 : as_type<float>(_868);
    bool _896 = _816 > 0.0;
    bool _898 = _816 >= 0.0;
    bool _900 = isnan(_816);
    bool _902 = _898 || _900;
    bool _904 = isnan(0.0);
    bool _906 = _902 || _904;
    float _908 = _894 + 0.5;
    int _910 = ~_882;
    int _912 = _910 + 1;
    int _914 = _912 + 1;
    float _916 = fma(_664, _808, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    int _918 = _734 + _886;
    float _920 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[80].x, _790);
    bool _922 = !_496;
    float _924 = _922 ? _209 : as_type<float>(_890);
    bool _926 = !_578;
    int _928 = _926 ? _876 : (-1);
    int _930 = _914;
    if (!_820)
    {
        int _932 = ~_882;
        int _934 = _932 + 1;
        _930 = _934;
    }
    int _936 = _930;
    float _938 = _924 + (-0.5);
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _942 = _940 != 0;
    int _944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _946 = _944 != 0;
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _950 = _948 != 0;
    bool _952 = !_744;
    int _954 = _952 ? 0 : 1;
    bool _956 = _742 != 3;
    int _958 = _918 >> 2;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _960;
    bool _964 = !_956;
    int _966 = _964 ? 0 : (-1);
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _970 = _968 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    int _972 = _958 << 4;
    int _974 = _972 + 368;
    float _976 = fma(_962, _836, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _978 = _884 > 0.0;
    float _980 = fma(_970, _808, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    uint _982 = uint(int(uint(_974) >> uint(2)));
    uint _984 = uint(int(uint(int(_982)) >> uint(2)));
    int _986 = int(_982) & 3;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[int(_984)][_986];
    int _990 = int(_982) + 1;
    uint _992 = uint(int(uint(_990) >> uint(2)));
    int _994 = _990 & 3;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[int(_992)][_994];
    bool _998 = _884 >= 0.0;
    bool _1000 = isnan(_884);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan(0.0);
    bool _1006 = _1002 || _1004;
    float _1008 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _708);
    bool _1010 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1012 = isnan(_323);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = fma(_361, _808, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _1024 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1026 = isnan(_323);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1032 = _1028 || _1030;
    float _1034 = float(_1032);
    float _1036 = -_938;
    float _1038 = -_1008;
    float _1040 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1038);
    float _1042 = -_1020;
    float _1044 = _1042 + 1.0;
    int _1046 = abs(_850);
    float _1048 = -_1034;
    float _1050 = _1048 + 1.0;
    float _1052 = _1034 * _1044;
    int _1054 = _974 + 8;
    uint _1056 = uint(int(uint(_1054) >> uint(2)));
    uint _1058 = uint(int(uint(int(_1056)) >> uint(2)));
    int _1060 = int(_1056) & 3;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[int(_1058)][_1060];
    int _1064 = int(_1056) + 1;
    uint _1066 = uint(int(uint(_1064) >> uint(2)));
    int _1068 = _1064 & 3;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[int(_1066)][_1068];
    float _1072 = _349 * _1050;
    float _1074 = -_349;
    float _1076 = _1074 + 1.0;
    float _1078 = _976 * _1072;
    float _1080 = _856 * _1072;
    float _1082 = _880 * _1072;
    float _1084 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1078);
    float _1086 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1080);
    float _1088 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1082);
    int _1090 = abs(_802);
    float _1092 = fma(_980, _1052, _1084);
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1098 = abs(_954);
    float _1100 = fma(_916, _1052, _1086);
    float _1102 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1094);
    float _1104 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1096);
    float _1106 = fma(_1022, _1052, _1088);
    int _1108 = ~_1090;
    int _1110 = _1108 + 1;
    int _1112 = _1110 + 1;
    float _1114 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1102);
    float _1116 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1104);
    int _1118 = ~_1098;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = _730 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1126 = -_1114;
    float _1128 = _1126 + 1.0;
    float _1130 = -_1116;
    float _1132 = _1130 + 1.0;
    float _1134 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1092);
    float _1136 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1100);
    float _1138 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1106);
    int _1140 = _1112 * as_type<int>(_996);
    int _1142 = abs(_772);
    int _1144 = _1122 * as_type<int>(_988);
    int _1146 = _1144 + _1140;
    float _1148 = -_1128;
    float _1150 = fma(_894, _1148, _920);
    float _1152 = fma(_924, _1132, _1040);
    float _1154 = _710 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1156 = _758 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1158 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1160 = _1124 + _1158;
    float _1162 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1164 = _1154 + _1162;
    int _1166 = abs(_966);
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1170 = _1156 + _1168;
    int _1172 = ~_1046;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    float _1178 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1180 = ~_1166;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    out.m_64.x = _1150;
    out.m_64.y = _1152;
    int _1186 = _1176 * as_type<int>(_1062);
    int _1188 = _1186 + _1146;
    float _1190 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1178);
    bool _1192 = !_946;
    int _1194 = _1192 ? 0 : 1;
    int _1196 = _1184 * as_type<int>(_1070);
    int _1198 = _1196 + _1188;
    float _1200 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1190);
    float _1202 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1204 = log2(_1202);
    float _1206 = _1164 * _1164;
    int _1208 = ~_1142;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    bool _1214 = _1200 >= 0.0;
    float _1216 = fma(_1160, _1160, _1206);
    int _1218 = _1198 * _1212;
    float _1220 = fma(_1170, _1170, _1216);
    int _1222 = _928 * _1142;
    int _1224 = _1222 + _1218;
    bool _1226 = !_950;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = rsqrt(_1220);
    float _1232 = _1204 * _129;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1236 = float(_1224);
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1214)
    {
        _796 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1240 = _796;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1246 = exp2(_1232);
    float _1248 = _1134 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1250 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1252 = _1138 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1254 = as_type<int>(_1240);
    if (_1214)
    {
        float _1256 = _1240 * 5.0;
        _1254 = as_type<int>(_1256);
    }
    int _1258 = _1254;
    float _1260 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1262 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1264 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1266 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1268 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1270 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1272 = _1270;
    if (_1214)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4202 = as_type<float>(_1258);
        out.gl_Position.z = _4202;
    }
    bool _1274 = !_942;
    int _1276 = _1274 ? 0 : 1;
    float _1278 = _1164 * _1230;
    float _1280 = _1160 * _1230;
    out.m_66.x = _1236;
    out.m_68.x = _1260;
    out.m_68.y = _1262;
    out.m_68.z = _1264;
    if (_1214)
    {
        out.m_47.x = 0.0;
    }
    out.m_70.x = _1266;
    out.m_70.y = _1268;
    out.m_70.z = _1270;
    out.m_70.w = _1242;
    if (_1214)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1282 = -_1278;
    float _1284 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1154);
    float _1286 = -_1280;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1124);
    int _1290 = _906 ? 0 : 1;
    float _1292 = -_1246;
    float _1294 = _1292 + 1.0;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1298 = _1284 + _1296;
    int _1300 = _1006 ? 0 : 1;
    float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1304 = _1288 + _1302;
    float _1306 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1308 = ~_1290;
    int _1310 = _1308 + 1;
    int _1312 = _1310 + 1;
    float _1314 = -_1278;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1164);
    int _1318 = ~_1300;
    int _1320 = _1318 + 1;
    int _1322 = _1320 + 1;
    float _1324 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1306);
    int _1326 = _1312;
    int _1328 = _1322;
    if (!_896)
    {
        int _1330 = ~_1290;
        int _1332 = _1330 + 1;
        _1326 = _1332;
    }
    int _1334 = _1326;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1338 = 1.0 + _1336;
    if (!_978)
    {
        int _1340 = ~_1300;
        int _1342 = _1340 + 1;
        _1328 = _1342;
    }
    int _1344 = _1328;
    float _1346 = _333 + (-0.5);
    float _1348 = in.m_72.x;
    float _1350 = in.m_72.y;
    float _1352 = in.m_72.z;
    int _1354 = abs(_1194);
    float _1356 = 1.0 / _1338;
    int _1358 = abs(_1276);
    float _1360 = _1170 * _1230;
    bool _1362 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1364 = isnan(1.0);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1370 = _1366 || _1368;
    float _1372 = -_1280;
    float _1374 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1160);
    int _1376 = abs(_1228);
    float _1378 = _1316 * _1316;
    float _1380 = -_1360;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    bool _1384 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1386 = isnan(0.0);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_936);
    float _1396 = float(_1358);
    float _1398 = float(_1344);
    float _1400 = _1392 ? _1294 : 0.0;
    float _1402 = float(_1334);
    float _1404 = _1396 * _1398;
    float _1406 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1408 = _1382 + _1406;
    if (_1370)
    {
        float _1410 = _1400 * _1356;
        _131 = _1410;
    }
    float _1412 = _131;
    float _1414 = float(_1354);
    float _1416 = _1404 * (-2.0);
    float _1418 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1324);
    float _1420 = _331 + (-0.5);
    float _1422 = float(_1376);
    float _1424 = fma(_1416, _1348, _1348);
    float _1426 = _1414 * _1394;
    bool _1428 = _1418 >= 0.0;
    float _1430 = fma(_832, _1416, _832);
    float _1432 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1424);
    float _1434 = _1422 * _1402;
    float _1436 = _1426 * (-2.0);
    float _1438 = _712 + _331;
    float _1440 = fma(_1430, _1412, _1432);
    float _1442 = fma(_1374, _1374, _1378);
    float _1444 = fma(_1436, _1350, _1350);
    float _1446 = _1438 + (-1.0);
    float _1448 = _1440 * 0.15915493667125701904296875;
    float _1450 = fma(_864, _1436, _864);
    float _1452 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1444);
    float _1454 = _1420;
    if (_1428)
    {
        _1454 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1456 = _1454;
    float _1458 = _1448 * 6.283185482025146484375;
    float _1460 = sin(_1458);
    float _1462 = fma(_1450, _1412, _1452);
    int _1464 = as_type<int>(_1456);
    if (_1428)
    {
        out.m_47.x = 0.0;
    }
    if (_1428)
    {
        float _1466 = _1456 * 5.0;
        _1464 = as_type<int>(_1466);
    }
    int _1468 = _1464;
    float _1470 = _1462 * 0.15915493667125701904296875;
    float _1472 = _1448 * 6.283185482025146484375;
    float _1474 = cos(_1472);
    if (_1428)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4525 = as_type<float>(_1468);
        out.gl_Position.z = _4525;
    }
    if (_1428)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1476 = in.m_54.x;
    float _1478 = in.m_54.y;
    float _1480 = _1434 * (-2.0);
    float _1482 = -_1360;
    float _1484 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1170);
    float _1486 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1488 = _712 + (-0.5);
    float _1490 = fma(_1480, _1352, _1352);
    float _1492 = fma(_1484, _1484, _1442);
    float _1494 = fma(_1486, _1480, _1486);
    float _1496 = _1470 * 6.283185482025146484375;
    float _1498 = sin(_1496);
    float _1500 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1490);
    float _1502 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _1504 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _1506 = fma(_1494, _1412, _1500);
    float _1508 = sqrt(_1492);
    float _1510 = _1506 * 0.15915493667125701904296875;
    float _1512 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1514 = _1510 * 6.283185482025146484375;
    float _1516 = cos(_1514);
    float _1518 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1520 = _1512 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1522 = _1518 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1524 = _1230 * _1508;
    float _1526 = _1470 * 6.283185482025146484375;
    float _1528 = cos(_1526);
    float _1530 = _1520 * _1524;
    float _1532 = _1522 * _1524;
    float _1534 = _1474 * _1498;
    float _1536 = _1502 * _1530;
    float _1538 = _1510 * 6.283185482025146484375;
    float _1540 = sin(_1538);
    float _1542 = _1460 * _1498;
    float _1544 = _1498 * _1516;
    float _1546 = _1516 * _1536;
    float _1548 = _1504 * _1532;
    float _1550 = _1474 * _1546;
    float _1552 = _1474 * _1528;
    float _1554 = _1528 * _1516;
    float _1556 = _1460 * _1528;
    float _1558 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1560 = _1558 * 0.5;
    float _1562 = _1460 * _1546;
    float _1564 = fma(_1540, _1552, _1542);
    float _1566 = -_1536;
    float _1568 = _1540 * _1566;
    float _1570 = -_1556;
    float _1572 = fma(_1540, _1534, _1570);
    float _1574 = -_1534;
    float _1576 = fma(_1540, _1556, _1574);
    float _1578 = fma(_1564, _1548, _1550);
    float _1580 = fma(_1554, _1548, _1568);
    float _1582 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1584 = precise::clamp(_1582, 0.0, 1.0);
    float _1586 = fma(_1576, _1548, _1562);
    float _1588 = fma(_1572, _1560, _1578);
    float _1590 = fma(_1540, _1542, _1552);
    float _1592 = fma(_1544, _1560, _1580);
    float _1594 = fma(_1584, -0.64999997615814208984375, 1.0);
    float _1596 = _1588 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1598 = _1588 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1600 = fma(_1590, _1560, _1586);
    float _1602 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1596);
    float _1604 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1598);
    float _1606 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1602);
    float _1608 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1604);
    float _1610 = _1606 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1612 = _1608 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1614 = _1124 + _1610;
    float _1616 = _1156 + _1612;
    float _1618 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1620 = _1614 + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1624 = _1616 + _1622;
    float _1626 = fma(_1620, _1594, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1628 = fma(_1624, _1594, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1630 = _1588 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1634 = _1626 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1638 = _1628 + _1636;
    float _1640 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1630);
    float _1642 = _1634 * _1634;
    float _1644 = _1638 * _1638;
    float _1646 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1640);
    float _1648 = _1642 + _1644;
    float _1650 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1652 = sqrt(_1648);
    float _1654 = _1154 + _1650;
    float _1656 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1658 = _1654 + _1656;
    float _1660 = fma(_1658, _1594, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    bool _1662 = _1652 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = _1646;
    float _1666 = _1658;
    float _1668 = _1628;
    float _1670 = _1644;
    float _1672 = _1626;
    if (!_1662)
    {
        _1664 = _1628;
    }
    float _1674 = _1664;
    float _1676 = _1674;
    if (!_1662)
    {
        _1666 = _1642;
    }
    float _1678 = _1666;
    float _1680 = _1678;
    if (!_1662)
    {
        _1668 = _1660;
    }
    float _1682 = _1668;
    bool _1684 = !_1662;
    float _1686 = _1682;
    if (!_1684)
    {
        float _1688 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1692 = _1652 + _1690;
        float _1694 = _1660 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1696 = rsqrt(_1648);
        float _1698 = _1692 * _1688;
        float _1700 = _1698 * 0.15915493667125701904296875;
        float _1702 = _1700 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = _1700 * 6.283185482025146484375;
        float _1708 = cos(_1706);
        float _1710 = fma(_1704, _1694, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1712 = _1696 * _1710;
        float _1714 = _1708 + (-1.0);
        float _1716 = fma(_1634, _1712, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1718 = fma(_1638, _1712, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1720 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1724 = _1716 + _1722;
        float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1728 = _1718 + _1726;
        float _1730 = fma(_1660, _1708, _1720);
        float _1732 = _1724 * _1724;
        float _1734 = _1728 * _1728;
        _1686 = _1730;
        _1680 = _1732;
        _1670 = _1734;
        _1672 = _1716;
        _1676 = _1718;
    }
    float _1736 = _1686;
    float _1738 = _1680;
    float _1740 = _1670;
    float _1742 = _1672;
    float _1744 = _1676;
    float _1746 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1748 = _1736 + _1746;
    out.m_70.x = _1266;
    out.m_70.y = _1268;
    out.m_70.z = _1270;
    out.m_70.w = _1242;
    float _1750 = fma(_1748, _1748, _1738);
    out.m_68.x = _1260;
    out.m_68.y = _1262;
    out.m_68.z = _1264;
    float _1752 = _1750 + _1740;
    float _1754 = sqrt(_1752);
    bool _1756 = _1754 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1758 = isnan(_1754);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1764 = _1760 || _1762;
    float _1766 = _1738;
    float _1768 = _1754;
    if (!_1764)
    {
        _1766 = 1.0;
    }
    float _1770 = _1766;
    bool _1772 = !_1764;
    float _1774 = _1770;
    if (!_1772)
    {
        bool _1776 = _1754 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1778 = isnan(_1754);
        bool _1780 = _1776 || _1778;
        bool _1782 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1784 = _1780 || _1782;
        if (!_1784)
        {
            float _1786 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1788 = _1754 + _1786;
            float _1790 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1792 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1790;
            float _1794 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1796 = _1794 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1798 = 1.0 / _1792;
            float _1800 = _1788 * _1798;
            float _1802 = fma(_1800, _1796, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1774 = _1802;
            _1804 = true;
        }
        else
        {
            bool _1806 = _1754 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1808 = isnan(_1754);
            bool _1810 = _1806 || _1808;
            bool _1812 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1814 = _1810 || _1812;
            if (!_1814)
            {
                float _1816 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1818 = _1754 + _1816;
                float _1820 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1822 = _1820 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1824 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1826 = _1824 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1828 = 1.0 / _1822;
                float _1830 = _1818 * _1828;
                float _1832 = fma(_1830, _1826, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1774 = _1832;
                _1804 = true;
            }
            else
            {
                _1774 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1804 = false;
    float _1834 = _1774;
    float _1836 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1838 = _1736 + _1836;
    float _1840 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1842 = _1742 + _1840;
    float _1844 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1846 = _1744 + _1844;
    float _1848 = fma(_1838, _1834, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1850 = fma(_1842, _1834, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1852 = fma(_1846, _1834, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1854 = -_1278;
    float _1856 = fma(_1854, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1848);
    float _1858 = -_1280;
    float _1860 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1850);
    float _1862 = -_1360;
    float _1864 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1852);
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1868 = _1856 + _1866;
    float _1870 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1872 = _1860 + _1870;
    float _1874 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1876 = _1864 + _1874;
    float _1878 = _1868 * _1868;
    float _1880 = fma(_1872, _1872, _1878);
    float _1882 = fma(_1876, _1876, _1880);
    float _1884 = rsqrt(_1882);
    float _1886 = sqrt(_1882);
    float _1888 = _1884 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1890 = _1872 * _1888;
    float _1892 = _1876 * _1888;
    float _1894 = _1890 * _1890;
    float _1896 = _1892 * _1892;
    float _1898 = _1894 + _1896;
    float _1900 = sqrt(_1898);
    bool _1902 = _1900 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1904 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1906 = _1900 + _1904;
    float _1908 = _1880;
    float _1910 = _1898;
    float _1912 = _1906;
    float _1914 = _1868;
    if (_1902)
    {
        float _1916 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1908 = _1916;
    }
    float _1918 = _1908;
    if (_1902)
    {
        float _1920 = rsqrt(_1898);
        _1910 = _1920;
    }
    float _1922 = _1910;
    float _1924 = _1922;
    if (_1902)
    {
        float _1926 = _1906 * _1918;
        _1912 = _1926;
    }
    float _1928 = _1912;
    if (_1902)
    {
        float _1930 = _1928 * 0.15915493667125701904296875;
        _1272 = _1930;
    }
    float _1932 = _1272;
    float _1934 = _1876;
    float _1936 = _1932;
    if (_1902)
    {
        float _1938 = _1932 * 6.283185482025146484375;
        float _1940 = sin(_1938);
        _1934 = _1940;
    }
    float _1942 = _1934;
    float _1944 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1946 = precise::max(0.0, _1944);
    float _1948 = _1918;
    float _1950 = _1946;
    if (_1902)
    {
        float _1952 = _1932 * 6.283185482025146484375;
        float _1954 = cos(_1952);
        _1948 = _1954;
    }
    float _1956 = _1948;
    float _1958 = -_1888;
    float _1960 = -_1946;
    float _1962 = fma(_1868, _1958, _1960);
    if (_1902)
    {
        float _1964 = _1962 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1914 = _1964;
    }
    float _1966 = _1914;
    float _1968 = _1966;
    float _1970 = _1942;
    if (_1902)
    {
        float _1972 = fma(_1942, _1966, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1968 = _1972;
    }
    float _1974 = _1968;
    float _1976 = _1974;
    if (!_1902)
    {
        _1970 = _1890;
    }
    float _1978 = _1970;
    float _1980 = _1978;
    float _1982 = _1956;
    if (_1902)
    {
        float _1984 = _1956 + (-1.0);
        _1950 = _1984;
    }
    float _1986 = _1950;
    float _1988 = _1986;
    if (_1902)
    {
        float _1990 = _1922 * _1974;
        _1768 = _1990;
    }
    float _1992 = _1768;
    if (!_1902)
    {
        _1976 = _1962;
    }
    float _1994 = _1976;
    float _1996 = _1994;
    if (_1902)
    {
        float _1998 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1936 = _1998;
    }
    float _2000 = _1936;
    if (_1902)
    {
        float _2002 = _1890 * _1992;
        _1980 = _2002;
    }
    float _2004 = _1980;
    if (!_1902)
    {
        _1988 = _1892;
    }
    float _2006 = _1988;
    float _2008 = _2006;
    if (_1902)
    {
        float _2010 = _1892 * _1992;
        _2008 = _2010;
    }
    float _2012 = _2008;
    if (!_1902)
    {
        _1924 = _1894;
    }
    float _2014 = _1924;
    float _2016 = _2014;
    if (_1902)
    {
        float _2018 = fma(_1962, _1956, _2000);
        _1996 = _2018;
    }
    float _2020 = _1996;
    if (_1902)
    {
        float _2022 = _2004 * _2004;
        _2016 = _2022;
    }
    float _2024 = _2016;
    if (!_1902)
    {
        _1982 = _1896;
    }
    float _2026 = _1982;
    float _2028 = _2026;
    if (_1902)
    {
        float _2030 = _2012 * _2012;
        _2028 = _2030;
    }
    float _2032 = _2028;
    float _2034 = fma(_2020, _2020, _2024);
    float _2036 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2038 = _2034 + _2032;
    float _2040 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2042 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2044 = fma(_1886, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2042);
    float _2046 = precise::clamp(_2044, 0.0, 1.0);
    float _2048 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2050 = rsqrt(_2038);
    float _2052 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2040);
    float _2054 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2056 = -_2046;
    float _2058 = _2056 + 1.0;
    float _2060 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2062 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2052);
    float _2064 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2054);
    float _2066 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2068 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2036);
    float _2070 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2064);
    float _2072 = abs(_2058);
    float _2074 = log2(_2072);
    float _2076 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2078 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2068);
    float _2080 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2082 = _2050 * _2004;
    float _2084 = -_2076;
    float _2086 = fma(_2084, _2048, 1.0);
    float _2088 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2090 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2092 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2060);
    float _2094 = _2050 * _2012;
    float _2096 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2090);
    float _2098 = _2050 * _2020;
    float _2100 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2102 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2092);
    float _2104 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2096);
    float _2106 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2108 = -_2100;
    float _2110 = fma(_2098, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2108);
    float _2112 = _2102 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2114 = log2(_2086);
    float _2116 = -_2094;
    float _2118 = fma(_2116, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2110);
    float _2120 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2104);
    float _2122 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2124 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2126 = fma(_2118, -0.5, 0.5);
    float _2128 = fma(_2118, 0.5, 0.5);
    float _2130 = exp2(_2106);
    float _2132 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2122);
    float _2134 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2124);
    float _2136 = _2098 + 1.0;
    float _2138 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2132);
    float _2140 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2134);
    float _2142 = 1.0 / _2120;
    float _2144 = fma(_2128, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2146 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2138);
    float _2148 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2140);
    float _2150 = _2114 * 0.693147182464599609375;
    float _2152 = fma(_2128, _2144, -0.212114393711090087890625);
    float _2154 = sqrt(_2126);
    float _2156 = -_2098;
    float _2158 = fma(_2130, _2136, _2156);
    float _2160 = fma(_2128, _2152, 1.570728778839111328125);
    float _2162 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2164 = fma(_2158, 0.5, 0.5);
    float _2166 = _2146 * _2142;
    float _2168 = _2148 * _2142;
    float _2170 = fma(_2166, 0.5, 0.5);
    float _2172 = fma(_2168, -0.5, 0.5);
    float _2174 = _2154 * 0.636619746685028076171875;
    float _2176 = -_2160;
    float _2178 = fma(_2174, _2176, 1.0);
    float3 _5707 = float3(_2170, _2172, _2162);
    float _2180 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5707, float3(0.0), isnan(_5707)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5707, float3(0.0), isnan(_5707)), level(0.0)).x;
    float3 _5718 = float3(_2170, _2172, _2162);
    float4 _2183 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5718, float3(0.0), isnan(_5718)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5718, float3(0.0), isnan(_5718)), level(0.0)).xyzw;
    float _2185 = _2183.x;
    float _2187 = _2183.y;
    float _2189 = _2183.z;
    float _2191 = _2183.w;
    float2 _5735 = float2(_2178, _2164);
    float3 _2195 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5735, float2(0.0), isnan(_5735)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5735, float2(0.0), isnan(_5735)), level(0.0)).xyz;
    float _2197 = _2195.x;
    float _2199 = _2195.y;
    float _2201 = _2195.z;
    float _2203 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2205 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2207 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2203);
    float _2209 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2211 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2205);
    float _2213 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2207);
    float _2215 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2209);
    float _2217 = _2213 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2219 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2215);
    float _2221 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2223 = 1.0 / _2217;
    float _2225 = _2219 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2227 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2211);
    float _2229 = _2225 + _2217;
    float _2231 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2227);
    float _2233 = exp2(_2221);
    float _2235 = _2229 * _2223;
    float _2237 = _2235 * 0.5;
    float _2239 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2241 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2239);
    bool _2243 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2245 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan(0.5);
    bool _2251 = _2247 || _2249;
    float _2253 = 1.0 / _2241;
    float _2255 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2257 = _2112;
    if (_2251)
    {
        _2255 = 1.0;
    }
    float _2259 = _2255;
    float _2261 = _2259;
    if (_2251)
    {
        _2257 = 1.0;
    }
    float _2263 = _2257;
    float _2265 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2267 = _2253 * _2265;
    float _2269 = _2263;
    if (!_2251)
    {
        float _2271 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2273 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2275 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2273;
        float _2277 = _2271 * 0.15915493667125701904296875;
        float _2279 = _2277 * 6.283185482025146484375;
        float _2281 = cos(_2279);
        float _2283 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2285 = _2283 * 0.15915493667125701904296875;
        float _2287 = _2277 * 6.283185482025146484375;
        float _2289 = sin(_2287);
        float _2291 = 1.0 / _2281;
        float _2293 = _2285 * 6.283185482025146484375;
        float _2295 = cos(_2293);
        float _2297 = _2289 * _2291;
        float _2299 = _2285 * 6.283185482025146484375;
        float _2301 = sin(_2299);
        float _2303 = _2295 * _2297;
        float _2305 = 1.0 / _2275;
        float _2307 = 1.0 / _2303;
        float _2309 = _2301 * _2307;
        float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2313 = fma(_2267, _2309, _2311);
        float _2315 = _2313 * _2305;
        float _2317 = precise::clamp(_2315, 0.0, 1.0);
        _2261 = _2317;
    }
    float _2319 = _2261;
    if (!_2251)
    {
        float _2321 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2323 = _2321 * 0.15915493667125701904296875;
        float _2325 = _2323 * 6.283185482025146484375;
        float _2327 = cos(_2325);
        float _2329 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2331 = _2329 * 0.15915493667125701904296875;
        float _2333 = _2323 * 6.283185482025146484375;
        float _2335 = sin(_2333);
        float _2337 = 1.0 / _2327;
        float _2339 = _2331 * 6.283185482025146484375;
        float _2341 = cos(_2339);
        float _2343 = _2335 * _2337;
        float _2345 = _2331 * 6.283185482025146484375;
        float _2347 = sin(_2345);
        float _2349 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2351 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2349;
        float _2353 = _2341 * _2343;
        float _2355 = 1.0 / _2353;
        float _2357 = 1.0 / _2351;
        float _2359 = _2347 * _2355;
        float _2361 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2363 = fma(_2267, _2359, _2361);
        float _2365 = _2363 * _2357;
        float _2367 = precise::clamp(_2365, 0.0, 1.0);
        float _2369 = -_2367;
        float _2371 = _2369 + 1.0;
        _2269 = _2371;
    }
    float _2373 = _2269;
    float _2375 = _2231 + _2120;
    float _2377 = -_2233;
    float _2379 = _2377 + 1.0;
    bool _2381 = _2319 > 0.0;
    bool _2383 = isnan(_2319);
    bool _2385 = _2381 || _2383;
    bool _2387 = isnan(0.0);
    bool _2389 = _2385 || _2387;
    float _2391 = _2319 * _2373;
    float _2393 = _2375 * 0.5;
    float _2395 = _2379 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2397 = _2373 <= 0.0;
    bool _2399 = !_2389;
    bool _2401 = _2397 || _2399;
    float _2403 = _2391 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2405 = _2395 * _2180;
    float _2407 = -_2395;
    float _2409 = _2407 + 1.0;
    float _2411 = _2403 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2413 = _2191 * _2405;
    float _2415 = _2201 * _2405;
    float _2417 = _2191 * _2409;
    out.gl_Position.x = _2146;
    out.gl_Position.y = _2148;
    out.gl_Position.z = _2231;
    out.gl_Position.w = _2120;
    float _2419 = fma(_2197, _2413, _2185);
    float _2421 = fma(_2199, _2413, _2187);
    float _2423 = fma(_2191, _2415, _2189);
    out.m_74.z = _2393;
    out.m_74.w = _2120;
    out.m_47.x = _2411;
    out.m_76.x = _2419;
    out.m_76.y = _2421;
    out.m_76.z = _2423;
    out.m_76.w = _2417;
    if (!_2401)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2425 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2425;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1804 = false;
    bool _315 = false;
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
        float _2482 = as_type<float>(_111);
        out.gl_Position.z = _2482;
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
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
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
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2552 = as_type<float>(_149);
        out.gl_Position.z = _2552;
    }
    if (_141)
    {
        return out;
    }
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _155 = in.m_54.w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = in.m_49.x;
    float _169 = in.m_49.y;
    float _171 = in.m_49.z;
    float _173 = in.m_44.x;
    float _175 = in.m_44.y;
    float _177 = in.m_44.z;
    float _179 = 0.0;
    float _181 = _153;
    if (!_165)
    {
        float _183 = _153 * _153;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _187;
    if (!_165)
    {
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _191;
    }
    float _193 = _189;
    int _195 = as_type<int>(_151) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_151) & 2;
    bool _201 = _199 != 0;
    bool _203 = !_197;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_201;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_165;
    float _213 = _193;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _153 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _153);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _243;
    }
    float _245 = _213;
    bool _247 = !_165;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _153 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _181 = _267;
    }
    float _269 = _181;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _273 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _275 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _277 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _279 = fma(_269, _167, _273);
    float _281 = fma(_269, _169, _275);
    float _283 = fma(_269, _171, _277);
    float _285 = fma(_279, _155, _173);
    float _287 = fma(_281, _155, _175);
    float _289 = fma(_283, _155, _177);
    bool _291 = !_271;
    float _311;
    float _313;
    if (!_291)
    {
        float _293 = in.m_56.x;
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _297 = _293 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _301 = _299 * _295;
        float _303 = float(_95);
        float _305 = floor(_301);
        float _307 = -_305;
        float _309 = _301 + _307;
        _311 = _309;
        _313 = _303;
        _315 = true;
    }
    else
    {
        float _317 = float(_95);
        float _319 = 1.0 / _317;
        float _321 = _129 * _319;
        _311 = _321;
        _313 = _317;
    }
    _315 = false;
    float _323 = _311;
    float _325 = _313;
    float _327 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _329 = int(_327);
    float _331 = in.m_56.x;
    float _333 = in.m_56.y;
    float _335 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _337 = int(_335);
    bool _339 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _341 = isnan(_323);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = float(_329);
    float _353 = 1.0 / _325;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _363 = float(uint(_337));
    float _365 = 1.0 / _351;
    int _367 = ~_337;
    int _369 = _367 + 1;
    int _371 = ~_337;
    int _373 = _371 + 1;
    bool _375 = _337 == 0;
    int _377 = ~_337;
    int _379 = _377 + 1;
    float _381 = 1.0 / _363;
    int _383 = ~_337;
    int _385 = _383 + 1;
    float _387 = _365 * _129;
    float _389 = trunc(_387);
    int _391 = int(_389);
    int _393 = as_type<int>(_381) + (-2);
    float _395 = float(_337);
    float _397 = float(uint(_391));
    float _399 = as_type<float>(_393) * _397;
    float _401 = trunc(_399);
    float _403 = precise::max(_401, 0.0);
    uint _406 = uint(_403);
    int _408 = _369 * int(_406);
    int _410 = _408 + _391;
    float _412 = float(uint(_410));
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _416 = _414 != 0;
    float _418 = as_type<float>(_393) * _412;
    float _420 = trunc(_418);
    float _422 = precise::max(_420, 0.0);
    uint _424 = uint(_422);
    int _426 = int(_406) + int(_424);
    float _428 = float(_391);
    int _430 = _373 * _426;
    int _432 = _430 + _391;
    bool _434 = _428 >= _395;
    bool _436 = isnan(_428);
    bool _438 = _434 || _436;
    bool _440 = isnan(_395);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    bool _446 = !_416;
    float _448 = _446 ? 7.345489978790283203125 : 1.0;
    bool _450 = uint(_432) >= uint(_337);
    float _452 = trunc(_444);
    int _454 = int(_452);
    float _456 = _448 * _331;
    bool _458 = !_450;
    int _460 = _458 ? 0 : (-1);
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _464 = _462 != 0;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _468 = _466 != 0;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _472 = _470 != 0;
    int _474 = ~_426;
    int _476 = _474 + _460;
    int _478 = _476 + 1;
    float _480 = floor(_456);
    int _482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _484 = _482 != 0;
    int _486 = _337 * _478;
    int _488 = _486 + _391;
    bool _490 = !_464;
    int _492 = _490 ? 0 : 1;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _496 = _494 != 0;
    int _498 = ~_454;
    int _500 = _498 + 1;
    int _502 = _500 + 1;
    bool _504 = !_375;
    int _506 = _504 ? _488 : (-1);
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _510 = _508 != 0;
    int _512 = _506 * _502;
    float _514 = -_480;
    float _516 = _456 + _514;
    bool _518 = !_468;
    int _520 = _518 ? 0 : 1;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _524 = _522 != 0;
    float _526 = _516 * _395;
    float _528 = _395 * _129;
    int _530 = _337 + (-1);
    int _532 = abs(_520);
    float _534 = _528 * _353;
    float _536 = trunc(_526);
    int _538 = int(_536);
    int _540 = _454 * _530;
    int _542 = _540 + _512;
    bool _544 = !_484;
    int _546 = _544 ? 0 : 1;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _550 = _548 != 0;
    bool _552 = !_472;
    int _554 = _552 ? 0 : 1;
    float _556 = trunc(_534);
    int _558 = int(_556);
    int _560 = abs(_492);
    bool _562 = !_550;
    int _564 = _562 ? 0 : 1;
    int _566 = abs(_546);
    int _568 = abs(_554);
    int _570 = _542 * _532;
    int _572 = abs(_564);
    int _574 = _538 * _566;
    int _576 = _574 + _391;
    bool _578 = _337 == 0;
    float _580 = float(uint(_576));
    int _582 = _558 * _560;
    int _584 = _582 + _570;
    int _586 = _576 * _568;
    int _588 = _586 + _584;
    float _590 = as_type<float>(_393) * _580;
    float _592 = in.m_58.x;
    float _594 = in.m_58.y;
    float _596 = in.m_58.z;
    int _598 = _538 * _572;
    int _600 = _598 + _588;
    int _602 = ~_337;
    int _604 = _602 + 1;
    float _606 = trunc(_590);
    float _608 = precise::max(_606, 0.0);
    uint _610 = uint(_608);
    float _612 = in.m_60.x;
    float _614 = in.m_60.y;
    float _616 = in.m_60.z;
    float _618 = float(uint(_600));
    float _620 = as_type<float>(_393) * _618;
    float _622 = trunc(_620);
    float _624 = precise::max(_622, 0.0);
    uint _626 = uint(_624);
    int _628 = _379 * int(_610);
    int _630 = _628 + _576;
    float _632 = _287 * _594;
    int _634 = _604 * int(_626);
    int _636 = _634 + _600;
    float _638 = float(uint(_636));
    float _640 = as_type<float>(_393) * _638;
    float _642 = in.m_62.x;
    float _644 = in.m_62.y;
    float _646 = in.m_62.z;
    float _648 = trunc(_640);
    float _650 = precise::max(_648, 0.0);
    uint _652 = uint(_650);
    int _654 = int(_626) + int(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _656;
    float _660 = float(uint(_630));
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    int _666 = _385 * _654;
    int _668 = _666 + _600;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _672 = _323 + _670;
    float _674 = as_type<float>(_393) * _660;
    float _676 = _287 * _614;
    float _678 = _287 * _644;
    bool _680 = uint(_668) >= uint(_337);
    float _682 = fma(_285, _592, _632);
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _686 = trunc(_674);
    float _688 = precise::max(_686, 0.0);
    uint _690 = uint(_688);
    bool _692 = !_680;
    int _694 = _692 ? 0 : (-1);
    float _696 = _333 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _698 = fma(_285, _612, _676);
    float _700 = fma(_285, _642, _678);
    int _702 = ~_654;
    int _704 = _702 + _694;
    int _706 = _704 + 1;
    float _708 = fma(_696, -2.0, _684);
    float _710 = fma(_289, _596, _682);
    float _712 = in.m_56.z;
    int _714 = _337 * _706;
    int _716 = _714 + _600;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _722;
    int _726 = ~_337;
    int _728 = _726 + 1;
    float _730 = fma(_289, _616, _698);
    bool _732 = !_578;
    int _734 = _732 ? _716 : (-1);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _738 = int(_610) + int(_690);
    float _740 = _331 * 2.0;
    int _742 = _734 & 3;
    bool _744 = _742 != 0;
    float _746 = 1.0 / _720;
    int _748 = _734 & 3;
    bool _750 = _748 != 0;
    float _752 = -_736;
    float _754 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[77].x, _752);
    bool _756 = uint(_742) > 1u;
    float _758 = fma(_289, _646, _700);
    int _760 = _750 ? 0 : 1;
    float _762 = _333 + _331;
    float _764 = floor(_740);
    int _766 = _728 * _738;
    int _768 = _766 + _576;
    bool _770 = !_524;
    int _772 = _770 ? 0 : 1;
    float _774 = _762 + (-1.0);
    int _776 = ~_760;
    int _778 = _776 + 1;
    int _780 = _778 + 1;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _784 = _323 + _782;
    bool _786 = _742 != 3;
    float _788 = -_129;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[76].x, _754);
    float _792 = 1.0 / _724;
    int _794 = _780;
    float _796 = _730;
    if (!_756)
    {
        int _798 = ~_760;
        int _800 = _798 + 1;
        _794 = _800;
    }
    int _802 = _794;
    float _804 = _333 * 2.0;
    bool _806 = uint(_768) >= uint(_337);
    float _808 = _672 * _746;
    bool _810 = uint(_742) >= 2u;
    bool _812 = !_806;
    int _814 = _812 ? 0 : (-1);
    float _816 = floor(_804);
    int _818 = _810 ? 0 : 1;
    bool _820 = _764 > 0.0;
    bool _822 = _764 >= 0.0;
    bool _824 = isnan(_764);
    bool _826 = _822 || _824;
    bool _828 = isnan(0.0);
    bool _830 = _826 || _828;
    float _832 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _834 = _333 + _712;
    float _836 = _784 * _792;
    int _838 = ~_818;
    int _840 = _838 + 1;
    int _842 = _840 + 1;
    int _844 = _842;
    if (_786)
    {
        int _846 = ~_818;
        int _848 = _846 + 1;
        _844 = _848;
    }
    int _850 = _844;
    float _852 = _834 + (-1.0);
    bool _854 = _331 > 0.5;
    float _856 = fma(_658, _836, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _858 = ~_738;
    int _860 = _858 + _814;
    int _862 = _860 + 1;
    float _864 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _866 = -_205;
    int _868 = _854 ? as_type<int>(_866) : as_type<int>(_205);
    float _870 = _712 * 2.0;
    int _872 = _734 >> 31;
    int _874 = _337 * _862;
    int _876 = _874 + _576;
    bool _878 = _333 > 0.5;
    float _880 = fma(_357, _836, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    int _882 = _830 ? 0 : 1;
    float _884 = floor(_870);
    int _886 = _872 & 3;
    float _888 = -_209;
    int _890 = _878 ? as_type<int>(_888) : as_type<int>(_209);
    bool _892 = !_510;
    float _894 = _892 ? _205 : as_type<float>(_868);
    bool _896 = _816 > 0.0;
    bool _898 = _816 >= 0.0;
    bool _900 = isnan(_816);
    bool _902 = _898 || _900;
    bool _904 = isnan(0.0);
    bool _906 = _902 || _904;
    float _908 = _894 + 0.5;
    int _910 = ~_882;
    int _912 = _910 + 1;
    int _914 = _912 + 1;
    float _916 = fma(_664, _808, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    int _918 = _734 + _886;
    float _920 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[80].x, _790);
    bool _922 = !_496;
    float _924 = _922 ? _209 : as_type<float>(_890);
    bool _926 = !_578;
    int _928 = _926 ? _876 : (-1);
    int _930 = _914;
    if (!_820)
    {
        int _932 = ~_882;
        int _934 = _932 + 1;
        _930 = _934;
    }
    int _936 = _930;
    float _938 = _924 + (-0.5);
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _942 = _940 != 0;
    int _944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _946 = _944 != 0;
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _950 = _948 != 0;
    bool _952 = !_744;
    int _954 = _952 ? 0 : 1;
    bool _956 = _742 != 3;
    int _958 = _918 >> 2;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _960;
    bool _964 = !_956;
    int _966 = _964 ? 0 : (-1);
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _970 = _968 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    int _972 = _958 << 4;
    int _974 = _972 + 368;
    float _976 = fma(_962, _836, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _978 = _884 > 0.0;
    float _980 = fma(_970, _808, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    uint _982 = uint(int(uint(_974) >> uint(2)));
    uint _984 = uint(int(uint(int(_982)) >> uint(2)));
    int _986 = int(_982) & 3;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[int(_984)][_986];
    int _990 = int(_982) + 1;
    uint _992 = uint(int(uint(_990) >> uint(2)));
    int _994 = _990 & 3;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[int(_992)][_994];
    bool _998 = _884 >= 0.0;
    bool _1000 = isnan(_884);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan(0.0);
    bool _1006 = _1002 || _1004;
    float _1008 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _708);
    bool _1010 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1012 = isnan(_323);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = fma(_361, _808, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _1024 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1026 = isnan(_323);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1032 = _1028 || _1030;
    float _1034 = float(_1032);
    float _1036 = -_938;
    float _1038 = -_1008;
    float _1040 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1038);
    float _1042 = -_1020;
    float _1044 = _1042 + 1.0;
    int _1046 = abs(_850);
    float _1048 = -_1034;
    float _1050 = _1048 + 1.0;
    float _1052 = _1034 * _1044;
    int _1054 = _974 + 8;
    uint _1056 = uint(int(uint(_1054) >> uint(2)));
    uint _1058 = uint(int(uint(int(_1056)) >> uint(2)));
    int _1060 = int(_1056) & 3;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[int(_1058)][_1060];
    int _1064 = int(_1056) + 1;
    uint _1066 = uint(int(uint(_1064) >> uint(2)));
    int _1068 = _1064 & 3;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[int(_1066)][_1068];
    float _1072 = _349 * _1050;
    float _1074 = -_349;
    float _1076 = _1074 + 1.0;
    float _1078 = _976 * _1072;
    float _1080 = _856 * _1072;
    float _1082 = _880 * _1072;
    float _1084 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1078);
    float _1086 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1080);
    float _1088 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1082);
    int _1090 = abs(_802);
    float _1092 = fma(_980, _1052, _1084);
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1098 = abs(_954);
    float _1100 = fma(_916, _1052, _1086);
    float _1102 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1094);
    float _1104 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1096);
    float _1106 = fma(_1022, _1052, _1088);
    int _1108 = ~_1090;
    int _1110 = _1108 + 1;
    int _1112 = _1110 + 1;
    float _1114 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1102);
    float _1116 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1104);
    int _1118 = ~_1098;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = _730 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1126 = -_1114;
    float _1128 = _1126 + 1.0;
    float _1130 = -_1116;
    float _1132 = _1130 + 1.0;
    float _1134 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1092);
    float _1136 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1100);
    float _1138 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1106);
    int _1140 = _1112 * as_type<int>(_996);
    int _1142 = abs(_772);
    int _1144 = _1122 * as_type<int>(_988);
    int _1146 = _1144 + _1140;
    float _1148 = -_1128;
    float _1150 = fma(_894, _1148, _920);
    float _1152 = fma(_924, _1132, _1040);
    float _1154 = _710 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1156 = _758 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1158 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1160 = _1124 + _1158;
    float _1162 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1164 = _1154 + _1162;
    int _1166 = abs(_966);
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1170 = _1156 + _1168;
    int _1172 = ~_1046;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    float _1178 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1180 = ~_1166;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    out.m_64.x = _1150;
    out.m_64.y = _1152;
    int _1186 = _1176 * as_type<int>(_1062);
    int _1188 = _1186 + _1146;
    float _1190 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1178);
    bool _1192 = !_946;
    int _1194 = _1192 ? 0 : 1;
    int _1196 = _1184 * as_type<int>(_1070);
    int _1198 = _1196 + _1188;
    float _1200 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1190);
    float _1202 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1204 = log2(_1202);
    float _1206 = _1164 * _1164;
    int _1208 = ~_1142;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    bool _1214 = _1200 >= 0.0;
    float _1216 = fma(_1160, _1160, _1206);
    int _1218 = _1198 * _1212;
    float _1220 = fma(_1170, _1170, _1216);
    int _1222 = _928 * _1142;
    int _1224 = _1222 + _1218;
    bool _1226 = !_950;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = rsqrt(_1220);
    float _1232 = _1204 * _129;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1236 = float(_1224);
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1214)
    {
        _796 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1240 = _796;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1246 = exp2(_1232);
    float _1248 = _1134 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1250 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1252 = _1138 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1254 = as_type<int>(_1240);
    if (_1214)
    {
        float _1256 = _1240 * 5.0;
        _1254 = as_type<int>(_1256);
    }
    int _1258 = _1254;
    float _1260 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1262 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1264 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1266 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1268 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1270 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1272 = _1270;
    if (_1214)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4202 = as_type<float>(_1258);
        out.gl_Position.z = _4202;
    }
    bool _1274 = !_942;
    int _1276 = _1274 ? 0 : 1;
    float _1278 = _1164 * _1230;
    float _1280 = _1160 * _1230;
    out.m_66.x = _1236;
    out.m_68.x = _1260;
    out.m_68.y = _1262;
    out.m_68.z = _1264;
    if (_1214)
    {
        out.m_47.x = 0.0;
    }
    out.m_70.x = _1266;
    out.m_70.y = _1268;
    out.m_70.z = _1270;
    out.m_70.w = _1242;
    if (_1214)
    {
        return out;
    }
    float _1282 = -_1278;
    float _1284 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1154);
    float _1286 = -_1280;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1124);
    int _1290 = _906 ? 0 : 1;
    float _1292 = -_1246;
    float _1294 = _1292 + 1.0;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1298 = _1284 + _1296;
    int _1300 = _1006 ? 0 : 1;
    float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1304 = _1288 + _1302;
    float _1306 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1308 = ~_1290;
    int _1310 = _1308 + 1;
    int _1312 = _1310 + 1;
    float _1314 = -_1278;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1164);
    int _1318 = ~_1300;
    int _1320 = _1318 + 1;
    int _1322 = _1320 + 1;
    float _1324 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1306);
    int _1326 = _1312;
    int _1328 = _1322;
    if (!_896)
    {
        int _1330 = ~_1290;
        int _1332 = _1330 + 1;
        _1326 = _1332;
    }
    int _1334 = _1326;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1338 = 1.0 + _1336;
    if (!_978)
    {
        int _1340 = ~_1300;
        int _1342 = _1340 + 1;
        _1328 = _1342;
    }
    int _1344 = _1328;
    float _1346 = _333 + (-0.5);
    float _1348 = in.m_72.x;
    float _1350 = in.m_72.y;
    float _1352 = in.m_72.z;
    int _1354 = abs(_1194);
    float _1356 = 1.0 / _1338;
    int _1358 = abs(_1276);
    float _1360 = _1170 * _1230;
    bool _1362 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1364 = isnan(1.0);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1370 = _1366 || _1368;
    float _1372 = -_1280;
    float _1374 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1160);
    int _1376 = abs(_1228);
    float _1378 = _1316 * _1316;
    float _1380 = -_1360;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    bool _1384 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1386 = isnan(0.0);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_936);
    float _1396 = float(_1358);
    float _1398 = float(_1344);
    float _1400 = _1392 ? _1294 : 0.0;
    float _1402 = float(_1334);
    float _1404 = _1396 * _1398;
    float _1406 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1408 = _1382 + _1406;
    if (_1370)
    {
        float _1410 = _1400 * _1356;
        _131 = _1410;
    }
    float _1412 = _131;
    float _1414 = float(_1354);
    float _1416 = _1404 * (-2.0);
    float _1418 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1324);
    float _1420 = _331 + (-0.5);
    float _1422 = float(_1376);
    float _1424 = fma(_1416, _1348, _1348);
    float _1426 = _1414 * _1394;
    bool _1428 = _1418 >= 0.0;
    float _1430 = fma(_832, _1416, _832);
    float _1432 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1424);
    float _1434 = _1422 * _1402;
    float _1436 = _1426 * (-2.0);
    float _1438 = _712 + _331;
    float _1440 = fma(_1430, _1412, _1432);
    float _1442 = fma(_1374, _1374, _1378);
    float _1444 = fma(_1436, _1350, _1350);
    float _1446 = _1438 + (-1.0);
    float _1448 = _1440 * 0.15915493667125701904296875;
    float _1450 = fma(_864, _1436, _864);
    float _1452 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1444);
    float _1454 = _1420;
    if (_1428)
    {
        _1454 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1456 = _1454;
    float _1458 = _1448 * 6.283185482025146484375;
    float _1460 = sin(_1458);
    float _1462 = fma(_1450, _1412, _1452);
    int _1464 = as_type<int>(_1456);
    if (_1428)
    {
        out.m_47.x = 0.0;
    }
    if (_1428)
    {
        float _1466 = _1456 * 5.0;
        _1464 = as_type<int>(_1466);
    }
    int _1468 = _1464;
    float _1470 = _1462 * 0.15915493667125701904296875;
    float _1472 = _1448 * 6.283185482025146484375;
    float _1474 = cos(_1472);
    if (_1428)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4525 = as_type<float>(_1468);
        out.gl_Position.z = _4525;
    }
    if (_1428)
    {
        return out;
    }
    float _1476 = in.m_54.x;
    float _1478 = in.m_54.y;
    float _1480 = _1434 * (-2.0);
    float _1482 = -_1360;
    float _1484 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1170);
    float _1486 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1488 = _712 + (-0.5);
    float _1490 = fma(_1480, _1352, _1352);
    float _1492 = fma(_1484, _1484, _1442);
    float _1494 = fma(_1486, _1480, _1486);
    float _1496 = _1470 * 6.283185482025146484375;
    float _1498 = sin(_1496);
    float _1500 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1490);
    float _1502 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _1504 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _1506 = fma(_1494, _1412, _1500);
    float _1508 = sqrt(_1492);
    float _1510 = _1506 * 0.15915493667125701904296875;
    float _1512 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1514 = _1510 * 6.283185482025146484375;
    float _1516 = cos(_1514);
    float _1518 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1520 = _1512 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1522 = _1518 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1524 = _1230 * _1508;
    float _1526 = _1470 * 6.283185482025146484375;
    float _1528 = cos(_1526);
    float _1530 = _1520 * _1524;
    float _1532 = _1522 * _1524;
    float _1534 = _1474 * _1498;
    float _1536 = _1502 * _1530;
    float _1538 = _1510 * 6.283185482025146484375;
    float _1540 = sin(_1538);
    float _1542 = _1460 * _1498;
    float _1544 = _1498 * _1516;
    float _1546 = _1516 * _1536;
    float _1548 = _1504 * _1532;
    float _1550 = _1474 * _1546;
    float _1552 = _1474 * _1528;
    float _1554 = _1528 * _1516;
    float _1556 = _1460 * _1528;
    float _1558 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1560 = _1558 * 0.5;
    float _1562 = _1460 * _1546;
    float _1564 = fma(_1540, _1552, _1542);
    float _1566 = -_1536;
    float _1568 = _1540 * _1566;
    float _1570 = -_1556;
    float _1572 = fma(_1540, _1534, _1570);
    float _1574 = -_1534;
    float _1576 = fma(_1540, _1556, _1574);
    float _1578 = fma(_1564, _1548, _1550);
    float _1580 = fma(_1554, _1548, _1568);
    float _1582 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1584 = precise::clamp(_1582, 0.0, 1.0);
    float _1586 = fma(_1576, _1548, _1562);
    float _1588 = fma(_1572, _1560, _1578);
    float _1590 = fma(_1540, _1542, _1552);
    float _1592 = fma(_1544, _1560, _1580);
    float _1594 = fma(_1584, -0.64999997615814208984375, 1.0);
    float _1596 = _1588 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1598 = _1588 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1600 = fma(_1590, _1560, _1586);
    float _1602 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1596);
    float _1604 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1598);
    float _1606 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1602);
    float _1608 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1604);
    float _1610 = _1606 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1612 = _1608 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1614 = _1124 + _1610;
    float _1616 = _1156 + _1612;
    float _1618 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1620 = _1614 + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1624 = _1616 + _1622;
    float _1626 = fma(_1620, _1594, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1628 = fma(_1624, _1594, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1630 = _1588 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1634 = _1626 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1638 = _1628 + _1636;
    float _1640 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1630);
    float _1642 = _1634 * _1634;
    float _1644 = _1638 * _1638;
    float _1646 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1640);
    float _1648 = _1642 + _1644;
    float _1650 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1652 = sqrt(_1648);
    float _1654 = _1154 + _1650;
    float _1656 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1658 = _1654 + _1656;
    float _1660 = fma(_1658, _1594, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    bool _1662 = _1652 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = _1646;
    float _1666 = _1658;
    float _1668 = _1628;
    float _1670 = _1644;
    float _1672 = _1626;
    if (!_1662)
    {
        _1664 = _1628;
    }
    float _1674 = _1664;
    float _1676 = _1674;
    if (!_1662)
    {
        _1666 = _1642;
    }
    float _1678 = _1666;
    float _1680 = _1678;
    if (!_1662)
    {
        _1668 = _1660;
    }
    float _1682 = _1668;
    bool _1684 = !_1662;
    float _1686 = _1682;
    if (!_1684)
    {
        float _1688 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1692 = _1652 + _1690;
        float _1694 = _1660 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1696 = rsqrt(_1648);
        float _1698 = _1692 * _1688;
        float _1700 = _1698 * 0.15915493667125701904296875;
        float _1702 = _1700 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = _1700 * 6.283185482025146484375;
        float _1708 = cos(_1706);
        float _1710 = fma(_1704, _1694, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1712 = _1696 * _1710;
        float _1714 = _1708 + (-1.0);
        float _1716 = fma(_1634, _1712, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1718 = fma(_1638, _1712, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1720 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1724 = _1716 + _1722;
        float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1728 = _1718 + _1726;
        float _1730 = fma(_1660, _1708, _1720);
        float _1732 = _1724 * _1724;
        float _1734 = _1728 * _1728;
        _1686 = _1730;
        _1680 = _1732;
        _1670 = _1734;
        _1672 = _1716;
        _1676 = _1718;
    }
    float _1736 = _1686;
    float _1738 = _1680;
    float _1740 = _1670;
    float _1742 = _1672;
    float _1744 = _1676;
    float _1746 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1748 = _1736 + _1746;
    out.m_70.x = _1266;
    out.m_70.y = _1268;
    out.m_70.z = _1270;
    out.m_70.w = _1242;
    float _1750 = fma(_1748, _1748, _1738);
    out.m_68.x = _1260;
    out.m_68.y = _1262;
    out.m_68.z = _1264;
    float _1752 = _1750 + _1740;
    float _1754 = sqrt(_1752);
    bool _1756 = _1754 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1758 = isnan(_1754);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1764 = _1760 || _1762;
    float _1766 = _1738;
    float _1768 = _1754;
    if (!_1764)
    {
        _1766 = 1.0;
    }
    float _1770 = _1766;
    bool _1772 = !_1764;
    float _1774 = _1770;
    if (!_1772)
    {
        bool _1776 = _1754 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1778 = isnan(_1754);
        bool _1780 = _1776 || _1778;
        bool _1782 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1784 = _1780 || _1782;
        if (!_1784)
        {
            float _1786 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1788 = _1754 + _1786;
            float _1790 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1792 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1790;
            float _1794 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1796 = _1794 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1798 = 1.0 / _1792;
            float _1800 = _1788 * _1798;
            float _1802 = fma(_1800, _1796, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1774 = _1802;
            _1804 = true;
        }
        else
        {
            bool _1806 = _1754 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1808 = isnan(_1754);
            bool _1810 = _1806 || _1808;
            bool _1812 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1814 = _1810 || _1812;
            if (!_1814)
            {
                float _1816 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1818 = _1754 + _1816;
                float _1820 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1822 = _1820 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1824 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1826 = _1824 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1828 = 1.0 / _1822;
                float _1830 = _1818 * _1828;
                float _1832 = fma(_1830, _1826, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1774 = _1832;
                _1804 = true;
            }
            else
            {
                _1774 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1804 = false;
    float _1834 = _1774;
    float _1836 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1838 = _1736 + _1836;
    float _1840 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1842 = _1742 + _1840;
    float _1844 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1846 = _1744 + _1844;
    float _1848 = fma(_1838, _1834, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1850 = fma(_1842, _1834, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1852 = fma(_1846, _1834, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1854 = -_1278;
    float _1856 = fma(_1854, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1848);
    float _1858 = -_1280;
    float _1860 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1850);
    float _1862 = -_1360;
    float _1864 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1852);
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1868 = _1856 + _1866;
    float _1870 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1872 = _1860 + _1870;
    float _1874 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1876 = _1864 + _1874;
    float _1878 = _1868 * _1868;
    float _1880 = fma(_1872, _1872, _1878);
    float _1882 = fma(_1876, _1876, _1880);
    float _1884 = rsqrt(_1882);
    float _1886 = sqrt(_1882);
    float _1888 = _1884 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1890 = _1872 * _1888;
    float _1892 = _1876 * _1888;
    float _1894 = _1890 * _1890;
    float _1896 = _1892 * _1892;
    float _1898 = _1894 + _1896;
    float _1900 = sqrt(_1898);
    bool _1902 = _1900 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1904 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1906 = _1900 + _1904;
    float _1908 = _1880;
    float _1910 = _1898;
    float _1912 = _1906;
    float _1914 = _1868;
    if (_1902)
    {
        float _1916 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1908 = _1916;
    }
    float _1918 = _1908;
    if (_1902)
    {
        float _1920 = rsqrt(_1898);
        _1910 = _1920;
    }
    float _1922 = _1910;
    float _1924 = _1922;
    if (_1902)
    {
        float _1926 = _1906 * _1918;
        _1912 = _1926;
    }
    float _1928 = _1912;
    if (_1902)
    {
        float _1930 = _1928 * 0.15915493667125701904296875;
        _1272 = _1930;
    }
    float _1932 = _1272;
    float _1934 = _1876;
    float _1936 = _1932;
    if (_1902)
    {
        float _1938 = _1932 * 6.283185482025146484375;
        float _1940 = sin(_1938);
        _1934 = _1940;
    }
    float _1942 = _1934;
    float _1944 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1946 = precise::max(0.0, _1944);
    float _1948 = _1918;
    float _1950 = _1946;
    if (_1902)
    {
        float _1952 = _1932 * 6.283185482025146484375;
        float _1954 = cos(_1952);
        _1948 = _1954;
    }
    float _1956 = _1948;
    float _1958 = -_1888;
    float _1960 = -_1946;
    float _1962 = fma(_1868, _1958, _1960);
    if (_1902)
    {
        float _1964 = _1962 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1914 = _1964;
    }
    float _1966 = _1914;
    float _1968 = _1966;
    float _1970 = _1942;
    if (_1902)
    {
        float _1972 = fma(_1942, _1966, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1968 = _1972;
    }
    float _1974 = _1968;
    float _1976 = _1974;
    if (!_1902)
    {
        _1970 = _1890;
    }
    float _1978 = _1970;
    float _1980 = _1978;
    float _1982 = _1956;
    if (_1902)
    {
        float _1984 = _1956 + (-1.0);
        _1950 = _1984;
    }
    float _1986 = _1950;
    float _1988 = _1986;
    if (_1902)
    {
        float _1990 = _1922 * _1974;
        _1768 = _1990;
    }
    float _1992 = _1768;
    if (!_1902)
    {
        _1976 = _1962;
    }
    float _1994 = _1976;
    float _1996 = _1994;
    if (_1902)
    {
        float _1998 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1936 = _1998;
    }
    float _2000 = _1936;
    if (_1902)
    {
        float _2002 = _1890 * _1992;
        _1980 = _2002;
    }
    float _2004 = _1980;
    if (!_1902)
    {
        _1988 = _1892;
    }
    float _2006 = _1988;
    float _2008 = _2006;
    if (_1902)
    {
        float _2010 = _1892 * _1992;
        _2008 = _2010;
    }
    float _2012 = _2008;
    if (!_1902)
    {
        _1924 = _1894;
    }
    float _2014 = _1924;
    float _2016 = _2014;
    if (_1902)
    {
        float _2018 = fma(_1962, _1956, _2000);
        _1996 = _2018;
    }
    float _2020 = _1996;
    if (_1902)
    {
        float _2022 = _2004 * _2004;
        _2016 = _2022;
    }
    float _2024 = _2016;
    if (!_1902)
    {
        _1982 = _1896;
    }
    float _2026 = _1982;
    float _2028 = _2026;
    if (_1902)
    {
        float _2030 = _2012 * _2012;
        _2028 = _2030;
    }
    float _2032 = _2028;
    float _2034 = fma(_2020, _2020, _2024);
    float _2036 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2038 = _2034 + _2032;
    float _2040 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2042 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2044 = fma(_1886, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2042);
    float _2046 = precise::clamp(_2044, 0.0, 1.0);
    float _2048 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2050 = rsqrt(_2038);
    float _2052 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2040);
    float _2054 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2056 = -_2046;
    float _2058 = _2056 + 1.0;
    float _2060 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2062 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2052);
    float _2064 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2054);
    float _2066 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2068 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2036);
    float _2070 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2064);
    float _2072 = abs(_2058);
    float _2074 = log2(_2072);
    float _2076 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2078 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2068);
    float _2080 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2082 = _2050 * _2004;
    float _2084 = -_2076;
    float _2086 = fma(_2084, _2048, 1.0);
    float _2088 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2090 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2092 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2060);
    float _2094 = _2050 * _2012;
    float _2096 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2090);
    float _2098 = _2050 * _2020;
    float _2100 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2102 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2092);
    float _2104 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2096);
    float _2106 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2108 = -_2100;
    float _2110 = fma(_2098, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2108);
    float _2112 = _2102 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2114 = log2(_2086);
    float _2116 = -_2094;
    float _2118 = fma(_2116, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2110);
    float _2120 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2104);
    float _2122 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2124 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2126 = fma(_2118, -0.5, 0.5);
    float _2128 = fma(_2118, 0.5, 0.5);
    float _2130 = exp2(_2106);
    float _2132 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2122);
    float _2134 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2124);
    float _2136 = _2098 + 1.0;
    float _2138 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2132);
    float _2140 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2134);
    float _2142 = 1.0 / _2120;
    float _2144 = fma(_2128, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2146 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2138);
    float _2148 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2140);
    float _2150 = _2114 * 0.693147182464599609375;
    float _2152 = fma(_2128, _2144, -0.212114393711090087890625);
    float _2154 = sqrt(_2126);
    float _2156 = -_2098;
    float _2158 = fma(_2130, _2136, _2156);
    float _2160 = fma(_2128, _2152, 1.570728778839111328125);
    float _2162 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2164 = fma(_2158, 0.5, 0.5);
    float _2166 = _2146 * _2142;
    float _2168 = _2148 * _2142;
    float _2170 = fma(_2166, 0.5, 0.5);
    float _2172 = fma(_2168, -0.5, 0.5);
    float _2174 = _2154 * 0.636619746685028076171875;
    float _2176 = -_2160;
    float _2178 = fma(_2174, _2176, 1.0);
    float3 _5707 = float3(_2170, _2172, _2162);
    float _2180 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5707, float3(0.0), isnan(_5707)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5707, float3(0.0), isnan(_5707)), level(0.0)).x;
    float3 _5718 = float3(_2170, _2172, _2162);
    float4 _2183 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5718, float3(0.0), isnan(_5718)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5718, float3(0.0), isnan(_5718)), level(0.0)).xyzw;
    float _2185 = _2183.x;
    float _2187 = _2183.y;
    float _2189 = _2183.z;
    float _2191 = _2183.w;
    float2 _5735 = float2(_2178, _2164);
    float3 _2195 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5735, float2(0.0), isnan(_5735)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5735, float2(0.0), isnan(_5735)), level(0.0)).xyz;
    float _2197 = _2195.x;
    float _2199 = _2195.y;
    float _2201 = _2195.z;
    float _2203 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2205 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2207 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2203);
    float _2209 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2211 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2205);
    float _2213 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2207);
    float _2215 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2209);
    float _2217 = _2213 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2219 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2215);
    float _2221 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2223 = 1.0 / _2217;
    float _2225 = _2219 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2227 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2211);
    float _2229 = _2225 + _2217;
    float _2231 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2227);
    float _2233 = exp2(_2221);
    float _2235 = _2229 * _2223;
    float _2237 = _2235 * 0.5;
    float _2239 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2241 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2239);
    bool _2243 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2245 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan(0.5);
    bool _2251 = _2247 || _2249;
    float _2253 = 1.0 / _2241;
    float _2255 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2257 = _2112;
    if (_2251)
    {
        _2255 = 1.0;
    }
    float _2259 = _2255;
    float _2261 = _2259;
    if (_2251)
    {
        _2257 = 1.0;
    }
    float _2263 = _2257;
    float _2265 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2267 = _2253 * _2265;
    float _2269 = _2263;
    if (!_2251)
    {
        float _2271 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2273 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2275 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2273;
        float _2277 = _2271 * 0.15915493667125701904296875;
        float _2279 = _2277 * 6.283185482025146484375;
        float _2281 = cos(_2279);
        float _2283 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2285 = _2283 * 0.15915493667125701904296875;
        float _2287 = _2277 * 6.283185482025146484375;
        float _2289 = sin(_2287);
        float _2291 = 1.0 / _2281;
        float _2293 = _2285 * 6.283185482025146484375;
        float _2295 = cos(_2293);
        float _2297 = _2289 * _2291;
        float _2299 = _2285 * 6.283185482025146484375;
        float _2301 = sin(_2299);
        float _2303 = _2295 * _2297;
        float _2305 = 1.0 / _2275;
        float _2307 = 1.0 / _2303;
        float _2309 = _2301 * _2307;
        float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2313 = fma(_2267, _2309, _2311);
        float _2315 = _2313 * _2305;
        float _2317 = precise::clamp(_2315, 0.0, 1.0);
        _2261 = _2317;
    }
    float _2319 = _2261;
    if (!_2251)
    {
        float _2321 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2323 = _2321 * 0.15915493667125701904296875;
        float _2325 = _2323 * 6.283185482025146484375;
        float _2327 = cos(_2325);
        float _2329 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2331 = _2329 * 0.15915493667125701904296875;
        float _2333 = _2323 * 6.283185482025146484375;
        float _2335 = sin(_2333);
        float _2337 = 1.0 / _2327;
        float _2339 = _2331 * 6.283185482025146484375;
        float _2341 = cos(_2339);
        float _2343 = _2335 * _2337;
        float _2345 = _2331 * 6.283185482025146484375;
        float _2347 = sin(_2345);
        float _2349 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2351 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2349;
        float _2353 = _2341 * _2343;
        float _2355 = 1.0 / _2353;
        float _2357 = 1.0 / _2351;
        float _2359 = _2347 * _2355;
        float _2361 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2363 = fma(_2267, _2359, _2361);
        float _2365 = _2363 * _2357;
        float _2367 = precise::clamp(_2365, 0.0, 1.0);
        float _2369 = -_2367;
        float _2371 = _2369 + 1.0;
        _2269 = _2371;
    }
    float _2373 = _2269;
    float _2375 = _2231 + _2120;
    float _2377 = -_2233;
    float _2379 = _2377 + 1.0;
    bool _2381 = _2319 > 0.0;
    bool _2383 = isnan(_2319);
    bool _2385 = _2381 || _2383;
    bool _2387 = isnan(0.0);
    bool _2389 = _2385 || _2387;
    float _2391 = _2319 * _2373;
    float _2393 = _2375 * 0.5;
    float _2395 = _2379 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2397 = _2373 <= 0.0;
    bool _2399 = !_2389;
    bool _2401 = _2397 || _2399;
    float _2403 = _2391 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2405 = _2395 * _2180;
    float _2407 = -_2395;
    float _2409 = _2407 + 1.0;
    float _2411 = _2403 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2413 = _2191 * _2405;
    float _2415 = _2201 * _2405;
    float _2417 = _2191 * _2409;
    out.gl_Position.x = _2146;
    out.gl_Position.y = _2148;
    out.gl_Position.z = _2231;
    out.gl_Position.w = _2120;
    float _2419 = fma(_2197, _2413, _2185);
    float _2421 = fma(_2199, _2413, _2187);
    float _2423 = fma(_2191, _2415, _2189);
    out.m_74.z = _2393;
    out.m_74.w = _2120;
    out.m_47.x = _2411;
    out.m_76.x = _2419;
    out.m_76.y = _2421;
    out.m_76.z = _2423;
    out.m_76.w = _2417;
    if (!_2401)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2425 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2425;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1804 = false;
    bool _315 = false;
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
        float _2482 = as_type<float>(_111);
        out.gl_Position.z = _2482;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _133 = float(_95);
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
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2552 = as_type<float>(_149);
        out.gl_Position.z = _2552;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _155 = in.m_54.w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = in.m_49.x;
    float _169 = in.m_49.y;
    float _171 = in.m_49.z;
    float _173 = in.m_44.x;
    float _175 = in.m_44.y;
    float _177 = in.m_44.z;
    float _179 = 0.0;
    float _181 = _153;
    if (!_165)
    {
        float _183 = _153 * _153;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _187;
    if (!_165)
    {
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _191;
    }
    float _193 = _189;
    int _195 = as_type<int>(_151) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_151) & 2;
    bool _201 = _199 != 0;
    bool _203 = !_197;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_201;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_165;
    float _213 = _193;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _153 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _153);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _243;
    }
    float _245 = _213;
    bool _247 = !_165;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _153 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _181 = _267;
    }
    float _269 = _181;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _273 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _275 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _277 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _279 = fma(_269, _167, _273);
    float _281 = fma(_269, _169, _275);
    float _283 = fma(_269, _171, _277);
    float _285 = fma(_279, _155, _173);
    float _287 = fma(_281, _155, _175);
    float _289 = fma(_283, _155, _177);
    bool _291 = !_271;
    float _311;
    float _313;
    if (!_291)
    {
        float _293 = in.m_56.x;
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _297 = _293 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _301 = _299 * _295;
        float _303 = float(_95);
        float _305 = floor(_301);
        float _307 = -_305;
        float _309 = _301 + _307;
        _311 = _309;
        _313 = _303;
        _315 = true;
    }
    else
    {
        float _317 = float(_95);
        float _319 = 1.0 / _317;
        float _321 = _129 * _319;
        _311 = _321;
        _313 = _317;
    }
    _315 = false;
    float _323 = _311;
    float _325 = _313;
    float _327 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _329 = int(_327);
    float _331 = in.m_56.x;
    float _333 = in.m_56.y;
    float _335 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _337 = int(_335);
    bool _339 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _341 = isnan(_323);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = float(_329);
    float _353 = 1.0 / _325;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _363 = float(uint(_337));
    float _365 = 1.0 / _351;
    int _367 = ~_337;
    int _369 = _367 + 1;
    int _371 = ~_337;
    int _373 = _371 + 1;
    bool _375 = _337 == 0;
    int _377 = ~_337;
    int _379 = _377 + 1;
    float _381 = 1.0 / _363;
    int _383 = ~_337;
    int _385 = _383 + 1;
    float _387 = _365 * _129;
    float _389 = trunc(_387);
    int _391 = int(_389);
    int _393 = as_type<int>(_381) + (-2);
    float _395 = float(_337);
    float _397 = float(uint(_391));
    float _399 = as_type<float>(_393) * _397;
    float _401 = trunc(_399);
    float _403 = precise::max(_401, 0.0);
    uint _406 = uint(_403);
    int _408 = _369 * int(_406);
    int _410 = _408 + _391;
    float _412 = float(uint(_410));
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _416 = _414 != 0;
    float _418 = as_type<float>(_393) * _412;
    float _420 = trunc(_418);
    float _422 = precise::max(_420, 0.0);
    uint _424 = uint(_422);
    int _426 = int(_406) + int(_424);
    float _428 = float(_391);
    int _430 = _373 * _426;
    int _432 = _430 + _391;
    bool _434 = _428 >= _395;
    bool _436 = isnan(_428);
    bool _438 = _434 || _436;
    bool _440 = isnan(_395);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    bool _446 = !_416;
    float _448 = _446 ? 7.345489978790283203125 : 1.0;
    bool _450 = uint(_432) >= uint(_337);
    float _452 = trunc(_444);
    int _454 = int(_452);
    float _456 = _448 * _331;
    bool _458 = !_450;
    int _460 = _458 ? 0 : (-1);
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _464 = _462 != 0;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _468 = _466 != 0;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _472 = _470 != 0;
    int _474 = ~_426;
    int _476 = _474 + _460;
    int _478 = _476 + 1;
    float _480 = floor(_456);
    int _482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _484 = _482 != 0;
    int _486 = _337 * _478;
    int _488 = _486 + _391;
    bool _490 = !_464;
    int _492 = _490 ? 0 : 1;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _496 = _494 != 0;
    int _498 = ~_454;
    int _500 = _498 + 1;
    int _502 = _500 + 1;
    bool _504 = !_375;
    int _506 = _504 ? _488 : (-1);
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _510 = _508 != 0;
    int _512 = _506 * _502;
    float _514 = -_480;
    float _516 = _456 + _514;
    bool _518 = !_468;
    int _520 = _518 ? 0 : 1;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _524 = _522 != 0;
    float _526 = _516 * _395;
    float _528 = _395 * _129;
    int _530 = _337 + (-1);
    int _532 = abs(_520);
    float _534 = _528 * _353;
    float _536 = trunc(_526);
    int _538 = int(_536);
    int _540 = _454 * _530;
    int _542 = _540 + _512;
    bool _544 = !_484;
    int _546 = _544 ? 0 : 1;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _550 = _548 != 0;
    bool _552 = !_472;
    int _554 = _552 ? 0 : 1;
    float _556 = trunc(_534);
    int _558 = int(_556);
    int _560 = abs(_492);
    bool _562 = !_550;
    int _564 = _562 ? 0 : 1;
    int _566 = abs(_546);
    int _568 = abs(_554);
    int _570 = _542 * _532;
    int _572 = abs(_564);
    int _574 = _538 * _566;
    int _576 = _574 + _391;
    bool _578 = _337 == 0;
    float _580 = float(uint(_576));
    int _582 = _558 * _560;
    int _584 = _582 + _570;
    int _586 = _576 * _568;
    int _588 = _586 + _584;
    float _590 = as_type<float>(_393) * _580;
    float _592 = in.m_58.x;
    float _594 = in.m_58.y;
    float _596 = in.m_58.z;
    int _598 = _538 * _572;
    int _600 = _598 + _588;
    int _602 = ~_337;
    int _604 = _602 + 1;
    float _606 = trunc(_590);
    float _608 = precise::max(_606, 0.0);
    uint _610 = uint(_608);
    float _612 = in.m_60.x;
    float _614 = in.m_60.y;
    float _616 = in.m_60.z;
    float _618 = float(uint(_600));
    float _620 = as_type<float>(_393) * _618;
    float _622 = trunc(_620);
    float _624 = precise::max(_622, 0.0);
    uint _626 = uint(_624);
    int _628 = _379 * int(_610);
    int _630 = _628 + _576;
    float _632 = _287 * _594;
    int _634 = _604 * int(_626);
    int _636 = _634 + _600;
    float _638 = float(uint(_636));
    float _640 = as_type<float>(_393) * _638;
    float _642 = in.m_62.x;
    float _644 = in.m_62.y;
    float _646 = in.m_62.z;
    float _648 = trunc(_640);
    float _650 = precise::max(_648, 0.0);
    uint _652 = uint(_650);
    int _654 = int(_626) + int(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _656;
    float _660 = float(uint(_630));
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    int _666 = _385 * _654;
    int _668 = _666 + _600;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _672 = _323 + _670;
    float _674 = as_type<float>(_393) * _660;
    float _676 = _287 * _614;
    float _678 = _287 * _644;
    bool _680 = uint(_668) >= uint(_337);
    float _682 = fma(_285, _592, _632);
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _686 = trunc(_674);
    float _688 = precise::max(_686, 0.0);
    uint _690 = uint(_688);
    bool _692 = !_680;
    int _694 = _692 ? 0 : (-1);
    float _696 = _333 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _698 = fma(_285, _612, _676);
    float _700 = fma(_285, _642, _678);
    int _702 = ~_654;
    int _704 = _702 + _694;
    int _706 = _704 + 1;
    float _708 = fma(_696, -2.0, _684);
    float _710 = fma(_289, _596, _682);
    float _712 = in.m_56.z;
    int _714 = _337 * _706;
    int _716 = _714 + _600;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _722;
    int _726 = ~_337;
    int _728 = _726 + 1;
    float _730 = fma(_289, _616, _698);
    bool _732 = !_578;
    int _734 = _732 ? _716 : (-1);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _738 = int(_610) + int(_690);
    float _740 = _331 * 2.0;
    int _742 = _734 & 3;
    bool _744 = _742 != 0;
    float _746 = 1.0 / _720;
    int _748 = _734 & 3;
    bool _750 = _748 != 0;
    float _752 = -_736;
    float _754 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[77].x, _752);
    bool _756 = uint(_742) > 1u;
    float _758 = fma(_289, _646, _700);
    int _760 = _750 ? 0 : 1;
    float _762 = _333 + _331;
    float _764 = floor(_740);
    int _766 = _728 * _738;
    int _768 = _766 + _576;
    bool _770 = !_524;
    int _772 = _770 ? 0 : 1;
    float _774 = _762 + (-1.0);
    int _776 = ~_760;
    int _778 = _776 + 1;
    int _780 = _778 + 1;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _784 = _323 + _782;
    bool _786 = _742 != 3;
    float _788 = -_129;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[76].x, _754);
    float _792 = 1.0 / _724;
    int _794 = _780;
    float _796 = _730;
    if (!_756)
    {
        int _798 = ~_760;
        int _800 = _798 + 1;
        _794 = _800;
    }
    int _802 = _794;
    float _804 = _333 * 2.0;
    bool _806 = uint(_768) >= uint(_337);
    float _808 = _672 * _746;
    bool _810 = uint(_742) >= 2u;
    bool _812 = !_806;
    int _814 = _812 ? 0 : (-1);
    float _816 = floor(_804);
    int _818 = _810 ? 0 : 1;
    bool _820 = _764 > 0.0;
    bool _822 = _764 >= 0.0;
    bool _824 = isnan(_764);
    bool _826 = _822 || _824;
    bool _828 = isnan(0.0);
    bool _830 = _826 || _828;
    float _832 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _834 = _333 + _712;
    float _836 = _784 * _792;
    int _838 = ~_818;
    int _840 = _838 + 1;
    int _842 = _840 + 1;
    int _844 = _842;
    if (_786)
    {
        int _846 = ~_818;
        int _848 = _846 + 1;
        _844 = _848;
    }
    int _850 = _844;
    float _852 = _834 + (-1.0);
    bool _854 = _331 > 0.5;
    float _856 = fma(_658, _836, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _858 = ~_738;
    int _860 = _858 + _814;
    int _862 = _860 + 1;
    float _864 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _866 = -_205;
    int _868 = _854 ? as_type<int>(_866) : as_type<int>(_205);
    float _870 = _712 * 2.0;
    int _872 = _734 >> 31;
    int _874 = _337 * _862;
    int _876 = _874 + _576;
    bool _878 = _333 > 0.5;
    float _880 = fma(_357, _836, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    int _882 = _830 ? 0 : 1;
    float _884 = floor(_870);
    int _886 = _872 & 3;
    float _888 = -_209;
    int _890 = _878 ? as_type<int>(_888) : as_type<int>(_209);
    bool _892 = !_510;
    float _894 = _892 ? _205 : as_type<float>(_868);
    bool _896 = _816 > 0.0;
    bool _898 = _816 >= 0.0;
    bool _900 = isnan(_816);
    bool _902 = _898 || _900;
    bool _904 = isnan(0.0);
    bool _906 = _902 || _904;
    float _908 = _894 + 0.5;
    int _910 = ~_882;
    int _912 = _910 + 1;
    int _914 = _912 + 1;
    float _916 = fma(_664, _808, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    int _918 = _734 + _886;
    float _920 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[80].x, _790);
    bool _922 = !_496;
    float _924 = _922 ? _209 : as_type<float>(_890);
    bool _926 = !_578;
    int _928 = _926 ? _876 : (-1);
    int _930 = _914;
    if (!_820)
    {
        int _932 = ~_882;
        int _934 = _932 + 1;
        _930 = _934;
    }
    int _936 = _930;
    float _938 = _924 + (-0.5);
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _942 = _940 != 0;
    int _944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _946 = _944 != 0;
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _950 = _948 != 0;
    bool _952 = !_744;
    int _954 = _952 ? 0 : 1;
    bool _956 = _742 != 3;
    int _958 = _918 >> 2;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _960;
    bool _964 = !_956;
    int _966 = _964 ? 0 : (-1);
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _970 = _968 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    int _972 = _958 << 4;
    int _974 = _972 + 368;
    float _976 = fma(_962, _836, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _978 = _884 > 0.0;
    float _980 = fma(_970, _808, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    uint _982 = uint(int(uint(_974) >> uint(2)));
    uint _984 = uint(int(uint(int(_982)) >> uint(2)));
    int _986 = int(_982) & 3;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[int(_984)][_986];
    int _990 = int(_982) + 1;
    uint _992 = uint(int(uint(_990) >> uint(2)));
    int _994 = _990 & 3;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[int(_992)][_994];
    bool _998 = _884 >= 0.0;
    bool _1000 = isnan(_884);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan(0.0);
    bool _1006 = _1002 || _1004;
    float _1008 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _708);
    bool _1010 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1012 = isnan(_323);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = fma(_361, _808, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _1024 = _323 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1026 = isnan(_323);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1032 = _1028 || _1030;
    float _1034 = float(_1032);
    float _1036 = -_938;
    float _1038 = -_1008;
    float _1040 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1038);
    float _1042 = -_1020;
    float _1044 = _1042 + 1.0;
    int _1046 = abs(_850);
    float _1048 = -_1034;
    float _1050 = _1048 + 1.0;
    float _1052 = _1034 * _1044;
    int _1054 = _974 + 8;
    uint _1056 = uint(int(uint(_1054) >> uint(2)));
    uint _1058 = uint(int(uint(int(_1056)) >> uint(2)));
    int _1060 = int(_1056) & 3;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[int(_1058)][_1060];
    int _1064 = int(_1056) + 1;
    uint _1066 = uint(int(uint(_1064) >> uint(2)));
    int _1068 = _1064 & 3;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[int(_1066)][_1068];
    float _1072 = _349 * _1050;
    float _1074 = -_349;
    float _1076 = _1074 + 1.0;
    float _1078 = _976 * _1072;
    float _1080 = _856 * _1072;
    float _1082 = _880 * _1072;
    float _1084 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1078);
    float _1086 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1080);
    float _1088 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1082);
    int _1090 = abs(_802);
    float _1092 = fma(_980, _1052, _1084);
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1098 = abs(_954);
    float _1100 = fma(_916, _1052, _1086);
    float _1102 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1094);
    float _1104 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1096);
    float _1106 = fma(_1022, _1052, _1088);
    int _1108 = ~_1090;
    int _1110 = _1108 + 1;
    int _1112 = _1110 + 1;
    float _1114 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1102);
    float _1116 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1104);
    int _1118 = ~_1098;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = _730 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1126 = -_1114;
    float _1128 = _1126 + 1.0;
    float _1130 = -_1116;
    float _1132 = _1130 + 1.0;
    float _1134 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1092);
    float _1136 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1100);
    float _1138 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1106);
    int _1140 = _1112 * as_type<int>(_996);
    int _1142 = abs(_772);
    int _1144 = _1122 * as_type<int>(_988);
    int _1146 = _1144 + _1140;
    float _1148 = -_1128;
    float _1150 = fma(_894, _1148, _920);
    float _1152 = fma(_924, _1132, _1040);
    float _1154 = _710 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1156 = _758 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1158 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1160 = _1124 + _1158;
    float _1162 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1164 = _1154 + _1162;
    int _1166 = abs(_966);
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1170 = _1156 + _1168;
    int _1172 = ~_1046;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    float _1178 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1180 = ~_1166;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    out.m_64.x = _1150;
    out.m_64.y = _1152;
    int _1186 = _1176 * as_type<int>(_1062);
    int _1188 = _1186 + _1146;
    float _1190 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1178);
    bool _1192 = !_946;
    int _1194 = _1192 ? 0 : 1;
    int _1196 = _1184 * as_type<int>(_1070);
    int _1198 = _1196 + _1188;
    float _1200 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1190);
    float _1202 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1204 = log2(_1202);
    float _1206 = _1164 * _1164;
    int _1208 = ~_1142;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    bool _1214 = _1200 >= 0.0;
    float _1216 = fma(_1160, _1160, _1206);
    int _1218 = _1198 * _1212;
    float _1220 = fma(_1170, _1170, _1216);
    int _1222 = _928 * _1142;
    int _1224 = _1222 + _1218;
    bool _1226 = !_950;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = rsqrt(_1220);
    float _1232 = _1204 * _129;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1236 = float(_1224);
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1214)
    {
        _796 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1240 = _796;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1246 = exp2(_1232);
    float _1248 = _1134 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1250 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1252 = _1138 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1254 = as_type<int>(_1240);
    if (_1214)
    {
        float _1256 = _1240 * 5.0;
        _1254 = as_type<int>(_1256);
    }
    int _1258 = _1254;
    float _1260 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1262 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1264 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1266 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1268 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1270 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1272 = _1270;
    if (_1214)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4202 = as_type<float>(_1258);
        out.gl_Position.z = _4202;
    }
    bool _1274 = !_942;
    int _1276 = _1274 ? 0 : 1;
    float _1278 = _1164 * _1230;
    float _1280 = _1160 * _1230;
    out.m_66.x = _1236;
    out.m_68.x = _1260;
    out.m_68.y = _1262;
    out.m_68.z = _1264;
    if (_1214)
    {
        out.m_47.x = 0.0;
    }
    out.m_70.x = _1266;
    out.m_70.y = _1268;
    out.m_70.z = _1270;
    out.m_70.w = _1242;
    if (_1214)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1282 = -_1278;
    float _1284 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1154);
    float _1286 = -_1280;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1124);
    int _1290 = _906 ? 0 : 1;
    float _1292 = -_1246;
    float _1294 = _1292 + 1.0;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1298 = _1284 + _1296;
    int _1300 = _1006 ? 0 : 1;
    float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1304 = _1288 + _1302;
    float _1306 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1308 = ~_1290;
    int _1310 = _1308 + 1;
    int _1312 = _1310 + 1;
    float _1314 = -_1278;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1164);
    int _1318 = ~_1300;
    int _1320 = _1318 + 1;
    int _1322 = _1320 + 1;
    float _1324 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1306);
    int _1326 = _1312;
    int _1328 = _1322;
    if (!_896)
    {
        int _1330 = ~_1290;
        int _1332 = _1330 + 1;
        _1326 = _1332;
    }
    int _1334 = _1326;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1338 = 1.0 + _1336;
    if (!_978)
    {
        int _1340 = ~_1300;
        int _1342 = _1340 + 1;
        _1328 = _1342;
    }
    int _1344 = _1328;
    float _1346 = _333 + (-0.5);
    float _1348 = in.m_72.x;
    float _1350 = in.m_72.y;
    float _1352 = in.m_72.z;
    int _1354 = abs(_1194);
    float _1356 = 1.0 / _1338;
    int _1358 = abs(_1276);
    float _1360 = _1170 * _1230;
    bool _1362 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1364 = isnan(1.0);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1370 = _1366 || _1368;
    float _1372 = -_1280;
    float _1374 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1160);
    int _1376 = abs(_1228);
    float _1378 = _1316 * _1316;
    float _1380 = -_1360;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    bool _1384 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1386 = isnan(0.0);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_936);
    float _1396 = float(_1358);
    float _1398 = float(_1344);
    float _1400 = _1392 ? _1294 : 0.0;
    float _1402 = float(_1334);
    float _1404 = _1396 * _1398;
    float _1406 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1408 = _1382 + _1406;
    if (_1370)
    {
        float _1410 = _1400 * _1356;
        _131 = _1410;
    }
    float _1412 = _131;
    float _1414 = float(_1354);
    float _1416 = _1404 * (-2.0);
    float _1418 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1324);
    float _1420 = _331 + (-0.5);
    float _1422 = float(_1376);
    float _1424 = fma(_1416, _1348, _1348);
    float _1426 = _1414 * _1394;
    bool _1428 = _1418 >= 0.0;
    float _1430 = fma(_832, _1416, _832);
    float _1432 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1424);
    float _1434 = _1422 * _1402;
    float _1436 = _1426 * (-2.0);
    float _1438 = _712 + _331;
    float _1440 = fma(_1430, _1412, _1432);
    float _1442 = fma(_1374, _1374, _1378);
    float _1444 = fma(_1436, _1350, _1350);
    float _1446 = _1438 + (-1.0);
    float _1448 = _1440 * 0.15915493667125701904296875;
    float _1450 = fma(_864, _1436, _864);
    float _1452 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1444);
    float _1454 = _1420;
    if (_1428)
    {
        _1454 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1456 = _1454;
    float _1458 = _1448 * 6.283185482025146484375;
    float _1460 = sin(_1458);
    float _1462 = fma(_1450, _1412, _1452);
    int _1464 = as_type<int>(_1456);
    if (_1428)
    {
        out.m_47.x = 0.0;
    }
    if (_1428)
    {
        float _1466 = _1456 * 5.0;
        _1464 = as_type<int>(_1466);
    }
    int _1468 = _1464;
    float _1470 = _1462 * 0.15915493667125701904296875;
    float _1472 = _1448 * 6.283185482025146484375;
    float _1474 = cos(_1472);
    if (_1428)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4525 = as_type<float>(_1468);
        out.gl_Position.z = _4525;
    }
    if (_1428)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1476 = in.m_54.x;
    float _1478 = in.m_54.y;
    float _1480 = _1434 * (-2.0);
    float _1482 = -_1360;
    float _1484 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1170);
    float _1486 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1488 = _712 + (-0.5);
    float _1490 = fma(_1480, _1352, _1352);
    float _1492 = fma(_1484, _1484, _1442);
    float _1494 = fma(_1486, _1480, _1486);
    float _1496 = _1470 * 6.283185482025146484375;
    float _1498 = sin(_1496);
    float _1500 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1490);
    float _1502 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _1504 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _1506 = fma(_1494, _1412, _1500);
    float _1508 = sqrt(_1492);
    float _1510 = _1506 * 0.15915493667125701904296875;
    float _1512 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1514 = _1510 * 6.283185482025146484375;
    float _1516 = cos(_1514);
    float _1518 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1520 = _1512 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1522 = _1518 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1524 = _1230 * _1508;
    float _1526 = _1470 * 6.283185482025146484375;
    float _1528 = cos(_1526);
    float _1530 = _1520 * _1524;
    float _1532 = _1522 * _1524;
    float _1534 = _1474 * _1498;
    float _1536 = _1502 * _1530;
    float _1538 = _1510 * 6.283185482025146484375;
    float _1540 = sin(_1538);
    float _1542 = _1460 * _1498;
    float _1544 = _1498 * _1516;
    float _1546 = _1516 * _1536;
    float _1548 = _1504 * _1532;
    float _1550 = _1474 * _1546;
    float _1552 = _1474 * _1528;
    float _1554 = _1528 * _1516;
    float _1556 = _1460 * _1528;
    float _1558 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1560 = _1558 * 0.5;
    float _1562 = _1460 * _1546;
    float _1564 = fma(_1540, _1552, _1542);
    float _1566 = -_1536;
    float _1568 = _1540 * _1566;
    float _1570 = -_1556;
    float _1572 = fma(_1540, _1534, _1570);
    float _1574 = -_1534;
    float _1576 = fma(_1540, _1556, _1574);
    float _1578 = fma(_1564, _1548, _1550);
    float _1580 = fma(_1554, _1548, _1568);
    float _1582 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1584 = precise::clamp(_1582, 0.0, 1.0);
    float _1586 = fma(_1576, _1548, _1562);
    float _1588 = fma(_1572, _1560, _1578);
    float _1590 = fma(_1540, _1542, _1552);
    float _1592 = fma(_1544, _1560, _1580);
    float _1594 = fma(_1584, -0.64999997615814208984375, 1.0);
    float _1596 = _1588 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1598 = _1588 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1600 = fma(_1590, _1560, _1586);
    float _1602 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1596);
    float _1604 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1598);
    float _1606 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1602);
    float _1608 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1604);
    float _1610 = _1606 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1612 = _1608 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1614 = _1124 + _1610;
    float _1616 = _1156 + _1612;
    float _1618 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1620 = _1614 + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1624 = _1616 + _1622;
    float _1626 = fma(_1620, _1594, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1628 = fma(_1624, _1594, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1630 = _1588 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1634 = _1626 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1638 = _1628 + _1636;
    float _1640 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1630);
    float _1642 = _1634 * _1634;
    float _1644 = _1638 * _1638;
    float _1646 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1640);
    float _1648 = _1642 + _1644;
    float _1650 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1652 = sqrt(_1648);
    float _1654 = _1154 + _1650;
    float _1656 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1658 = _1654 + _1656;
    float _1660 = fma(_1658, _1594, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    bool _1662 = _1652 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = _1646;
    float _1666 = _1658;
    float _1668 = _1628;
    float _1670 = _1644;
    float _1672 = _1626;
    if (!_1662)
    {
        _1664 = _1628;
    }
    float _1674 = _1664;
    float _1676 = _1674;
    if (!_1662)
    {
        _1666 = _1642;
    }
    float _1678 = _1666;
    float _1680 = _1678;
    if (!_1662)
    {
        _1668 = _1660;
    }
    float _1682 = _1668;
    bool _1684 = !_1662;
    float _1686 = _1682;
    if (!_1684)
    {
        float _1688 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1692 = _1652 + _1690;
        float _1694 = _1660 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1696 = rsqrt(_1648);
        float _1698 = _1692 * _1688;
        float _1700 = _1698 * 0.15915493667125701904296875;
        float _1702 = _1700 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = _1700 * 6.283185482025146484375;
        float _1708 = cos(_1706);
        float _1710 = fma(_1704, _1694, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1712 = _1696 * _1710;
        float _1714 = _1708 + (-1.0);
        float _1716 = fma(_1634, _1712, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1718 = fma(_1638, _1712, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1720 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1724 = _1716 + _1722;
        float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1728 = _1718 + _1726;
        float _1730 = fma(_1660, _1708, _1720);
        float _1732 = _1724 * _1724;
        float _1734 = _1728 * _1728;
        _1686 = _1730;
        _1680 = _1732;
        _1670 = _1734;
        _1672 = _1716;
        _1676 = _1718;
    }
    float _1736 = _1686;
    float _1738 = _1680;
    float _1740 = _1670;
    float _1742 = _1672;
    float _1744 = _1676;
    float _1746 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1748 = _1736 + _1746;
    out.m_70.x = _1266;
    out.m_70.y = _1268;
    out.m_70.z = _1270;
    out.m_70.w = _1242;
    float _1750 = fma(_1748, _1748, _1738);
    out.m_68.x = _1260;
    out.m_68.y = _1262;
    out.m_68.z = _1264;
    float _1752 = _1750 + _1740;
    float _1754 = sqrt(_1752);
    bool _1756 = _1754 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1758 = isnan(_1754);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1764 = _1760 || _1762;
    float _1766 = _1738;
    float _1768 = _1754;
    if (!_1764)
    {
        _1766 = 1.0;
    }
    float _1770 = _1766;
    bool _1772 = !_1764;
    float _1774 = _1770;
    if (!_1772)
    {
        bool _1776 = _1754 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1778 = isnan(_1754);
        bool _1780 = _1776 || _1778;
        bool _1782 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1784 = _1780 || _1782;
        if (!_1784)
        {
            float _1786 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1788 = _1754 + _1786;
            float _1790 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1792 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1790;
            float _1794 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1796 = _1794 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1798 = 1.0 / _1792;
            float _1800 = _1788 * _1798;
            float _1802 = fma(_1800, _1796, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1774 = _1802;
            _1804 = true;
        }
        else
        {
            bool _1806 = _1754 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1808 = isnan(_1754);
            bool _1810 = _1806 || _1808;
            bool _1812 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1814 = _1810 || _1812;
            if (!_1814)
            {
                float _1816 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1818 = _1754 + _1816;
                float _1820 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1822 = _1820 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1824 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1826 = _1824 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1828 = 1.0 / _1822;
                float _1830 = _1818 * _1828;
                float _1832 = fma(_1830, _1826, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1774 = _1832;
                _1804 = true;
            }
            else
            {
                _1774 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1804 = false;
    float _1834 = _1774;
    float _1836 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1838 = _1736 + _1836;
    float _1840 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1842 = _1742 + _1840;
    float _1844 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1846 = _1744 + _1844;
    float _1848 = fma(_1838, _1834, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1850 = fma(_1842, _1834, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1852 = fma(_1846, _1834, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1854 = -_1278;
    float _1856 = fma(_1854, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1848);
    float _1858 = -_1280;
    float _1860 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1850);
    float _1862 = -_1360;
    float _1864 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1852);
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1868 = _1856 + _1866;
    float _1870 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1872 = _1860 + _1870;
    float _1874 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1876 = _1864 + _1874;
    float _1878 = _1868 * _1868;
    float _1880 = fma(_1872, _1872, _1878);
    float _1882 = fma(_1876, _1876, _1880);
    float _1884 = rsqrt(_1882);
    float _1886 = sqrt(_1882);
    float _1888 = _1884 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1890 = _1872 * _1888;
    float _1892 = _1876 * _1888;
    float _1894 = _1890 * _1890;
    float _1896 = _1892 * _1892;
    float _1898 = _1894 + _1896;
    float _1900 = sqrt(_1898);
    bool _1902 = _1900 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1904 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1906 = _1900 + _1904;
    float _1908 = _1880;
    float _1910 = _1898;
    float _1912 = _1906;
    float _1914 = _1868;
    if (_1902)
    {
        float _1916 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1908 = _1916;
    }
    float _1918 = _1908;
    if (_1902)
    {
        float _1920 = rsqrt(_1898);
        _1910 = _1920;
    }
    float _1922 = _1910;
    float _1924 = _1922;
    if (_1902)
    {
        float _1926 = _1906 * _1918;
        _1912 = _1926;
    }
    float _1928 = _1912;
    if (_1902)
    {
        float _1930 = _1928 * 0.15915493667125701904296875;
        _1272 = _1930;
    }
    float _1932 = _1272;
    float _1934 = _1876;
    float _1936 = _1932;
    if (_1902)
    {
        float _1938 = _1932 * 6.283185482025146484375;
        float _1940 = sin(_1938);
        _1934 = _1940;
    }
    float _1942 = _1934;
    float _1944 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1946 = precise::max(0.0, _1944);
    float _1948 = _1918;
    float _1950 = _1946;
    if (_1902)
    {
        float _1952 = _1932 * 6.283185482025146484375;
        float _1954 = cos(_1952);
        _1948 = _1954;
    }
    float _1956 = _1948;
    float _1958 = -_1888;
    float _1960 = -_1946;
    float _1962 = fma(_1868, _1958, _1960);
    if (_1902)
    {
        float _1964 = _1962 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1914 = _1964;
    }
    float _1966 = _1914;
    float _1968 = _1966;
    float _1970 = _1942;
    if (_1902)
    {
        float _1972 = fma(_1942, _1966, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1968 = _1972;
    }
    float _1974 = _1968;
    float _1976 = _1974;
    if (!_1902)
    {
        _1970 = _1890;
    }
    float _1978 = _1970;
    float _1980 = _1978;
    float _1982 = _1956;
    if (_1902)
    {
        float _1984 = _1956 + (-1.0);
        _1950 = _1984;
    }
    float _1986 = _1950;
    float _1988 = _1986;
    if (_1902)
    {
        float _1990 = _1922 * _1974;
        _1768 = _1990;
    }
    float _1992 = _1768;
    if (!_1902)
    {
        _1976 = _1962;
    }
    float _1994 = _1976;
    float _1996 = _1994;
    if (_1902)
    {
        float _1998 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1936 = _1998;
    }
    float _2000 = _1936;
    if (_1902)
    {
        float _2002 = _1890 * _1992;
        _1980 = _2002;
    }
    float _2004 = _1980;
    if (!_1902)
    {
        _1988 = _1892;
    }
    float _2006 = _1988;
    float _2008 = _2006;
    if (_1902)
    {
        float _2010 = _1892 * _1992;
        _2008 = _2010;
    }
    float _2012 = _2008;
    if (!_1902)
    {
        _1924 = _1894;
    }
    float _2014 = _1924;
    float _2016 = _2014;
    if (_1902)
    {
        float _2018 = fma(_1962, _1956, _2000);
        _1996 = _2018;
    }
    float _2020 = _1996;
    if (_1902)
    {
        float _2022 = _2004 * _2004;
        _2016 = _2022;
    }
    float _2024 = _2016;
    if (!_1902)
    {
        _1982 = _1896;
    }
    float _2026 = _1982;
    float _2028 = _2026;
    if (_1902)
    {
        float _2030 = _2012 * _2012;
        _2028 = _2030;
    }
    float _2032 = _2028;
    float _2034 = fma(_2020, _2020, _2024);
    float _2036 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2038 = _2034 + _2032;
    float _2040 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2042 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2044 = fma(_1886, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2042);
    float _2046 = precise::clamp(_2044, 0.0, 1.0);
    float _2048 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2050 = rsqrt(_2038);
    float _2052 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2040);
    float _2054 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2056 = -_2046;
    float _2058 = _2056 + 1.0;
    float _2060 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2062 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2052);
    float _2064 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2054);
    float _2066 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2068 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2036);
    float _2070 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2064);
    float _2072 = abs(_2058);
    float _2074 = log2(_2072);
    float _2076 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2078 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2068);
    float _2080 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2082 = _2050 * _2004;
    float _2084 = -_2076;
    float _2086 = fma(_2084, _2048, 1.0);
    float _2088 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2090 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2092 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2060);
    float _2094 = _2050 * _2012;
    float _2096 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2090);
    float _2098 = _2050 * _2020;
    float _2100 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2102 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2092);
    float _2104 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2096);
    float _2106 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2108 = -_2100;
    float _2110 = fma(_2098, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2108);
    float _2112 = _2102 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2114 = log2(_2086);
    float _2116 = -_2094;
    float _2118 = fma(_2116, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2110);
    float _2120 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2104);
    float _2122 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2124 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2126 = fma(_2118, -0.5, 0.5);
    float _2128 = fma(_2118, 0.5, 0.5);
    float _2130 = exp2(_2106);
    float _2132 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2122);
    float _2134 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2124);
    float _2136 = _2098 + 1.0;
    float _2138 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2132);
    float _2140 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2134);
    float _2142 = 1.0 / _2120;
    float _2144 = fma(_2128, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2146 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2138);
    float _2148 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2140);
    float _2150 = _2114 * 0.693147182464599609375;
    float _2152 = fma(_2128, _2144, -0.212114393711090087890625);
    float _2154 = sqrt(_2126);
    float _2156 = -_2098;
    float _2158 = fma(_2130, _2136, _2156);
    float _2160 = fma(_2128, _2152, 1.570728778839111328125);
    float _2162 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2164 = fma(_2158, 0.5, 0.5);
    float _2166 = _2146 * _2142;
    float _2168 = _2148 * _2142;
    float _2170 = fma(_2166, 0.5, 0.5);
    float _2172 = fma(_2168, -0.5, 0.5);
    float _2174 = _2154 * 0.636619746685028076171875;
    float _2176 = -_2160;
    float _2178 = fma(_2174, _2176, 1.0);
    float3 _5707 = float3(_2170, _2172, _2162);
    float _2180 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5707, float3(0.0), isnan(_5707)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5707, float3(0.0), isnan(_5707)), level(0.0)).x;
    float3 _5718 = float3(_2170, _2172, _2162);
    float4 _2183 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5718, float3(0.0), isnan(_5718)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5718, float3(0.0), isnan(_5718)), level(0.0)).xyzw;
    float _2185 = _2183.x;
    float _2187 = _2183.y;
    float _2189 = _2183.z;
    float _2191 = _2183.w;
    float2 _5735 = float2(_2178, _2164);
    float3 _2195 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5735, float2(0.0), isnan(_5735)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5735, float2(0.0), isnan(_5735)), level(0.0)).xyz;
    float _2197 = _2195.x;
    float _2199 = _2195.y;
    float _2201 = _2195.z;
    float _2203 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2205 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2207 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2203);
    float _2209 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2211 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2205);
    float _2213 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2207);
    float _2215 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2209);
    float _2217 = _2213 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2219 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2215);
    float _2221 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2223 = 1.0 / _2217;
    float _2225 = _2219 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2227 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2211);
    float _2229 = _2225 + _2217;
    float _2231 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2227);
    float _2233 = exp2(_2221);
    float _2235 = _2229 * _2223;
    float _2237 = _2235 * 0.5;
    float _2239 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2241 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2239);
    bool _2243 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2245 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan(0.5);
    bool _2251 = _2247 || _2249;
    float _2253 = 1.0 / _2241;
    float _2255 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2257 = _2112;
    if (_2251)
    {
        _2255 = 1.0;
    }
    float _2259 = _2255;
    float _2261 = _2259;
    if (_2251)
    {
        _2257 = 1.0;
    }
    float _2263 = _2257;
    float _2265 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2267 = _2253 * _2265;
    float _2269 = _2263;
    if (!_2251)
    {
        float _2271 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2273 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2275 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2273;
        float _2277 = _2271 * 0.15915493667125701904296875;
        float _2279 = _2277 * 6.283185482025146484375;
        float _2281 = cos(_2279);
        float _2283 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2285 = _2283 * 0.15915493667125701904296875;
        float _2287 = _2277 * 6.283185482025146484375;
        float _2289 = sin(_2287);
        float _2291 = 1.0 / _2281;
        float _2293 = _2285 * 6.283185482025146484375;
        float _2295 = cos(_2293);
        float _2297 = _2289 * _2291;
        float _2299 = _2285 * 6.283185482025146484375;
        float _2301 = sin(_2299);
        float _2303 = _2295 * _2297;
        float _2305 = 1.0 / _2275;
        float _2307 = 1.0 / _2303;
        float _2309 = _2301 * _2307;
        float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2313 = fma(_2267, _2309, _2311);
        float _2315 = _2313 * _2305;
        float _2317 = precise::clamp(_2315, 0.0, 1.0);
        _2261 = _2317;
    }
    float _2319 = _2261;
    if (!_2251)
    {
        float _2321 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2323 = _2321 * 0.15915493667125701904296875;
        float _2325 = _2323 * 6.283185482025146484375;
        float _2327 = cos(_2325);
        float _2329 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2331 = _2329 * 0.15915493667125701904296875;
        float _2333 = _2323 * 6.283185482025146484375;
        float _2335 = sin(_2333);
        float _2337 = 1.0 / _2327;
        float _2339 = _2331 * 6.283185482025146484375;
        float _2341 = cos(_2339);
        float _2343 = _2335 * _2337;
        float _2345 = _2331 * 6.283185482025146484375;
        float _2347 = sin(_2345);
        float _2349 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2351 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2349;
        float _2353 = _2341 * _2343;
        float _2355 = 1.0 / _2353;
        float _2357 = 1.0 / _2351;
        float _2359 = _2347 * _2355;
        float _2361 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2363 = fma(_2267, _2359, _2361);
        float _2365 = _2363 * _2357;
        float _2367 = precise::clamp(_2365, 0.0, 1.0);
        float _2369 = -_2367;
        float _2371 = _2369 + 1.0;
        _2269 = _2371;
    }
    float _2373 = _2269;
    float _2375 = _2231 + _2120;
    float _2377 = -_2233;
    float _2379 = _2377 + 1.0;
    bool _2381 = _2319 > 0.0;
    bool _2383 = isnan(_2319);
    bool _2385 = _2381 || _2383;
    bool _2387 = isnan(0.0);
    bool _2389 = _2385 || _2387;
    float _2391 = _2319 * _2373;
    float _2393 = _2375 * 0.5;
    float _2395 = _2379 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2397 = _2373 <= 0.0;
    bool _2399 = !_2389;
    bool _2401 = _2397 || _2399;
    float _2403 = _2391 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2405 = _2395 * _2180;
    float _2407 = -_2395;
    float _2409 = _2407 + 1.0;
    float _2411 = _2403 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2413 = _2191 * _2405;
    float _2415 = _2201 * _2405;
    float _2417 = _2191 * _2409;
    out.gl_Position.x = _2146;
    out.gl_Position.y = _2148;
    out.gl_Position.z = _2231;
    out.gl_Position.w = _2120;
    float _2419 = fma(_2197, _2413, _2185);
    float _2421 = fma(_2199, _2413, _2187);
    float _2423 = fma(_2191, _2415, _2189);
    out.m_74.z = _2393;
    out.m_74.w = _2120;
    out.m_47.x = _2411;
    out.m_76.x = _2419;
    out.m_76.y = _2421;
    out.m_76.z = _2423;
    out.m_76.w = _2417;
    if (!_2401)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2425 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2425;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

