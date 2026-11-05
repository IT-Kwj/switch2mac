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
    float4 m_64 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_70 [[user(locn3)]];
    float4 m_76 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_68 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_72 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2245 = false;
    bool _1616 = false;
    bool _399 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_46.w;
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
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2529 = as_type<float>(_111);
        out.gl_Position.z = _2529;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _113 = in.m_51.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    if (_123)
    {
        float _131 = float(_95);
        _129 = _131;
    }
    float _133 = _129;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    if (_139)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _105;
    if (_139)
    {
        out.m_49.x = 0.0;
    }
    int _143 = 0;
    if (_139)
    {
        float _145 = _141 * 5.0;
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2597 = as_type<float>(_147);
        out.gl_Position.z = _2597;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _149 = in.m_53.x;
    float _151 = in.m_53.y;
    float _153 = in.m_53.z;
    bool _155 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _157 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _159 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _161 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _157);
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _159);
    float _167 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    float _169 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _163);
    float _171 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _165);
    float _173 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _167);
    bool _175 = !_155;
    float _177 = _169;
    float _179 = _173;
    float _181 = _171;
    float _199;
    if (!_175)
    {
        float _183 = in.m_55.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        float _203 = float(_95);
        float _205 = 1.0 / _203;
        float _207 = _127 * _205;
        _199 = _207;
    }
    _201 = false;
    float _209 = _199;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _213 = _209 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _209 + _215;
    bool _219 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _221 = isnan(_209);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _209 + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _247 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _249 = 1.0 / _233;
    float _251 = 1.0 / _241;
    float _253 = 1.0 / _245;
    float _255 = _213 * _249;
    bool _257 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _259 = isnan(_209);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = -_229;
    float _271 = _269 + 1.0;
    bool _273 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _275 = isnan(_209);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = _267 * _271;
    float _287 = _217 * _251;
    float _289 = -_267;
    float _291 = _289 + 1.0;
    float _293 = _283 * _291;
    float _295 = -_283;
    float _297 = _295 + 1.0;
    float _299 = _237 * _253;
    bool _301 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _303 = isnan(_209);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _329 = fma(_315, _287, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = _311 * _297;
    float _333 = fma(_323, _287, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _335 = fma(_319, _299, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _337 = fma(_327, _299, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = -_311;
    float _341 = _339 + 1.0;
    float _343 = _329 * _331;
    float _345 = _333 * _331;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _351;
    float _355 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].x, _343);
    float _357 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].y, _345);
    float _359 = fma(_349, _255, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _361 = fma(_353, _255, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _363 = fma(_335, _293, _355);
    float _365 = fma(_337, _293, _357);
    float _367 = fma(_359, _285, _363);
    float _369 = fma(_361, _285, _365);
    float _371 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].x, _367);
    float _373 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].y, _369);
    bool _375 = !_247;
    float _395;
    float _397;
    if (!_375)
    {
        float _377 = in.m_55.x;
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _381 = _377 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _385 = _383 * _379;
        float _387 = float(_95);
        float _389 = floor(_385);
        float _391 = -_389;
        float _393 = _385 + _391;
        _395 = _387;
        _397 = _393;
        _399 = true;
    }
    else
    {
        float _401 = float(_95);
        float _403 = 1.0 / _401;
        float _405 = _127 * _403;
        _395 = _401;
        _397 = _405;
    }
    _399 = false;
    float _407 = _395;
    float _409 = _397;
    float _411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _413 = int(_411);
    float _415 = in.m_55.y;
    float _417 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _419 = int(_417);
    float _421 = float(_413);
    float _423 = 1.0 / _421;
    float _425 = float(uint(_419));
    int _427 = ~_419;
    int _429 = _427 + 1;
    int _431 = ~_419;
    int _433 = _431 + 1;
    float _435 = 1.0 / _425;
    bool _437 = _419 == 0;
    int _439 = ~_419;
    int _441 = _439 + 1;
    float _443 = _127 * _423;
    float _445 = in.m_55.x;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _449 = _447 != 0;
    float _451 = trunc(_443);
    int _453 = int(_451);
    int _455 = as_type<int>(_435) + (-2);
    float _457 = float(uint(_453));
    float _459 = float(_453);
    float _461 = as_type<float>(_455) * _457;
    float _463 = trunc(_461);
    float _465 = precise::max(_463, 0.0);
    uint _468 = uint(_465);
    bool _470 = !_449;
    float _472 = _470 ? 7.345489978790283203125 : 1.0;
    float _474 = _472 * _445;
    int _476 = _429 * int(_468);
    int _478 = _476 + _453;
    float _480 = floor(_474);
    float _482 = float(uint(_478));
    float _484 = as_type<float>(_455) * _482;
    float _486 = float(_419);
    float _488 = trunc(_484);
    float _490 = precise::max(_488, 0.0);
    uint _492 = uint(_490);
    bool _494 = _459 >= _486;
    bool _496 = isnan(_459);
    bool _498 = _494 || _496;
    bool _500 = isnan(_486);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -_480;
    float _508 = _474 + _506;
    float _510 = trunc(_504);
    int _512 = int(_510);
    int _514 = int(_468) + int(_492);
    float _516 = _508 * _486;
    float _518 = _127 * _486;
    int _520 = _433 * _514;
    int _522 = _520 + _453;
    float _524 = trunc(_516);
    int _526 = int(_524);
    bool _528 = uint(_522) >= uint(_419);
    bool _530 = !_528;
    int _532 = _530 ? 0 : (-1);
    float _534 = 1.0 / _407;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _546 = _544 != 0;
    int _548 = ~_514;
    int _550 = _548 + _532;
    int _552 = _550 + 1;
    int _554 = ~_512;
    int _556 = _554 + 1;
    int _558 = _556 + 1;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _562 = _560 != 0;
    int _564 = _419 * _552;
    int _566 = _564 + _453;
    int _568 = _419 + (-1);
    float _570 = as_type<float>(int(gl_VertexIndex));
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _574 = _572 != 0;
    bool _576 = !_437;
    int _578 = _576 ? _566 : (-1);
    bool _580 = !_562;
    int _582 = _580 ? 0 : 1;
    float _584 = _518 * _534;
    int _586 = _578 * _558;
    bool _588 = !_542;
    int _590 = _588 ? 0 : 1;
    int _592 = abs(_582);
    float _594 = trunc(_584);
    int _596 = int(_594);
    int _598 = _512 * _568;
    int _600 = _598 + _586;
    bool _602 = !_538;
    int _604 = _602 ? 0 : 1;
    int _606 = abs(_590);
    int _608 = _526 * _592;
    int _610 = _608 + _453;
    bool _612 = !_546;
    int _614 = _612 ? 0 : 1;
    int _616 = abs(_604);
    bool _618 = !_574;
    int _620 = _618 ? 0 : 1;
    int _622 = abs(_614);
    int _624 = _600 * _606;
    int _626 = abs(_620);
    int _628 = _596 * _616;
    int _630 = _628 + _624;
    int _632 = ~_419;
    int _634 = _632 + 1;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _638 = _636 != 0;
    int _640 = _610 * _622;
    int _642 = _640 + _630;
    int _644 = ~_419;
    int _646 = _644 + 1;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _650 = _648 != 0;
    int _652 = _526 * _626;
    int _654 = _652 + _642;
    float _656 = float(uint(_654));
    float _658 = as_type<float>(_455) * _656;
    float _660 = trunc(_658);
    float _662 = precise::max(_660, 0.0);
    uint _664 = uint(_662);
    int _666 = _646 * int(_664);
    int _668 = _666 + _654;
    float _670 = float(uint(_668));
    float _672 = as_type<float>(_455) * _670;
    float _674 = trunc(_672);
    float _676 = precise::max(_674, 0.0);
    uint _678 = uint(_676);
    int _680 = int(_664) + int(_678);
    float _682 = float(uint(_610));
    int _684 = _634 * _680;
    int _686 = _684 + _654;
    bool _688 = uint(_686) >= uint(_419);
    bool _690 = !_688;
    int _692 = _690 ? 0 : (-1);
    int _694 = ~_680;
    int _696 = _694 + _692;
    int _698 = _696 + 1;
    float _700 = as_type<float>(_455) * _682;
    int _702 = _419 * _698;
    int _704 = _702 + _654;
    float _706 = trunc(_700);
    float _708 = precise::max(_706, 0.0);
    uint _710 = uint(_708);
    int _712 = ~_419;
    int _714 = _712 + 1;
    bool _716 = !_437;
    int _718 = _716 ? _704 : (-1);
    int _720 = _718 >> 31;
    int _722 = _718 & 3;
    bool _724 = _722 != 0;
    int _726 = _720 & 3;
    int _728 = _724 ? 0 : 1;
    int _730 = _718 + _726;
    int _732 = _714 * int(_710);
    int _734 = _732 + _610;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _738 = _736 != 0;
    int _740 = _730 >> 2;
    float _742 = float(uint(_734));
    int _744 = _740 << 4;
    int _746 = _744 + 368;
    float _748 = as_type<float>(_455) * _742;
    uint _750 = uint(int(uint(_746) >> uint(2)));
    uint _752 = uint(int(uint(int(_750)) >> uint(2)));
    int _754 = int(_750) & 3;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[int(_752)][_754];
    int _758 = int(_750) + 1;
    uint _760 = uint(int(uint(_758) >> uint(2)));
    int _762 = _758 & 3;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[int(_760)][_762];
    int _766 = _718 & 3;
    bool _768 = _766 != 0;
    int _770 = ~_728;
    int _772 = _770 + 1;
    int _774 = _772 + 1;
    float _776 = trunc(_748);
    float _778 = precise::max(_776, 0.0);
    uint _780 = uint(_778);
    bool _782 = uint(_766) > 1u;
    int _784 = _746 + 8;
    uint _786 = uint(int(uint(_784) >> uint(2)));
    uint _788 = uint(int(uint(int(_786)) >> uint(2)));
    int _790 = int(_786) & 3;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[int(_788)][_790];
    int _794 = int(_786) + 1;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    int _798 = _794 & 3;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[int(_796)][_798];
    bool _802 = uint(_766) >= 2u;
    bool _804 = !_768;
    int _806 = _804 ? 0 : 1;
    bool _808 = _766 != 3;
    bool _810 = !_808;
    int _812 = _810 ? 0 : (-1);
    int _814 = _774;
    if (!_782)
    {
        int _816 = ~_728;
        int _818 = _816 + 1;
        _814 = _818;
    }
    int _820 = _814;
    int _822 = int(_710) + int(_780);
    float _824 = in.m_60.x;
    float _826 = in.m_60.y;
    bool _828 = _766 != 3;
    int _830 = _441 * _822;
    int _832 = _830 + _610;
    int _834 = abs(_820);
    int _836 = _802 ? 0 : 1;
    bool _838 = uint(_832) >= uint(_419);
    int _840 = abs(_806);
    int _842 = ~_834;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    int _848 = ~_836;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    int _854 = _852;
    if (_828)
    {
        int _856 = ~_836;
        int _858 = _856 + 1;
        _854 = _858;
    }
    int _860 = _854;
    int _862 = ~_840;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    int _868 = abs(_860);
    int _870 = _846 * as_type<int>(_764);
    float _872 = _371 * _824;
    bool _874 = !_738;
    int _876 = _874 ? 0 : 1;
    float _878 = _445 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _880 = _866 * as_type<int>(_756);
    int _882 = _880 + _870;
    float _884 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _886 = int(_884);
    int _888 = abs(_876);
    float _890 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _892 = abs(_812);
    int _894 = ~_868;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    int _900 = as_type<int>(_570) & 1;
    bool _902 = _900 != 0;
    int _904 = as_type<int>(_570) & 2;
    bool _906 = _904 != 0;
    bool _908 = !_838;
    int _910 = _908 ? 0 : (-1);
    int _912 = _898 * as_type<int>(_792);
    int _914 = _912 + _882;
    float _916 = _373 * _826;
    int _918 = ~_892;
    int _920 = _918 + 1;
    int _922 = _920 + 1;
    int _924 = ~_822;
    int _926 = _924 + _910;
    int _928 = _926 + 1;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _932 = ~_888;
    int _934 = _932 + 1;
    int _936 = _934 + 1;
    int _938 = _922 * as_type<int>(_800);
    int _940 = _938 + _914;
    float _942 = float(uint(_886));
    int _944 = _419 * _928;
    int _946 = _944 + _610;
    float _948 = -_930;
    float _950 = fma(_878, 2.0, _948);
    int _952 = abs(_886);
    int _954 = _940 * _936;
    float _956 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _958 = in.m_46.x;
    float _960 = in.m_46.y;
    float _962 = in.m_46.z;
    float _964 = float(uint(_952));
    float _966 = 1.0 / _942;
    float _968 = _956 * _445;
    float _970 = _415 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _972 = !_437;
    int _974 = _972 ? _946 : (-1);
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _978 = 1.0 / _964;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _982 = fma(_970, -2.0, _976);
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _986 = _974 * _888;
    int _988 = _986 + _954;
    bool _990 = _415 > 0.5;
    float _992 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[78].z, _980);
    bool _994 = _445 > 0.5;
    float _996 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[78].w, _984);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1006 = as_type<int>(_966) + (-2);
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1010 = _409 + _1008;
    float _1012 = float(uint(_988));
    float _1014 = 1.0 / _1000;
    int _1016 = abs(_988);
    float _1018 = _960 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1020 = _960 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1022 = as_type<int>(_978) + (-2);
    float _1024 = as_type<float>(_1006) * _1012;
    float _1026 = float(uint(_1016));
    float _1028 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1018);
    float _1030 = 1.0 / _1004;
    float _1032 = _960 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1034 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1020);
    float _1036 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1038 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1032);
    float _1040 = as_type<float>(_1022) * _1026;
    int _1042 = ~_886;
    int _1044 = _1042 + 1;
    float _1046 = trunc(_1024);
    float _1048 = precise::max(_1046, 0.0);
    uint _1050 = uint(_1048);
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1056;
    float _1060 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1038);
    int _1062 = ~_952;
    int _1064 = _1062 + 1;
    float _1066 = _1058 * _1014;
    float _1068 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1034);
    float _1070 = trunc(_1040);
    float _1072 = precise::max(_1070, 0.0);
    uint _1074 = uint(_1072);
    float _1076 = _1054 * _1030;
    float _1078 = -_127;
    float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[76].x, _950);
    float _1082 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _992);
    int _1084 = ~_952;
    int _1086 = _1084 + 1;
    float _1088 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1028);
    float _1090 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _982);
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1094 = _409 + _1092;
    int _1096 = _1044 * int(_1050);
    int _1098 = _1096 + _988;
    float _1100 = fma(_1076, _1010, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1102 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _996);
    float _1104 = trunc(_968);
    int _1106 = int(_1104);
    int _1108 = ~_886;
    int _1110 = _1108 + 1;
    float _1112 = float(uint(_1098));
    float _1114 = fma(_1066, _1094, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1116 = _1086 * int(_1074);
    int _1118 = _1116 + _1016;
    bool _1120 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1122 = isnan(_409);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = as_type<float>(_1006) * _1112;
    float _1134 = float(uint(_1118));
    float _1136 = -_1130;
    float _1138 = _1136 + 1.0;
    bool _1140 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1142 = isnan(_409);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1148 = _1144 || _1146;
    float _1150 = float(_1148);
    float _1152 = trunc(_1132);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    bool _1158 = !_906;
    float _1160 = _1158 ? (-0.5) : 0.5;
    float _1162 = as_type<float>(_1022) * _1134;
    bool _1164 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1166 = isnan(_409);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = _1150 * _1138;
    bool _1178 = !_902;
    float _1180 = _1178 ? (-0.5) : 0.5;
    float _1182 = -_1150;
    float _1184 = _1182 + 1.0;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1160);
    float _1188 = trunc(_1162);
    float _1190 = precise::max(_1188, 0.0);
    uint _1192 = uint(_1190);
    float _1194 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1180);
    float _1198 = _1174 * _1184;
    float _1200 = _1036 * _1186;
    float _1202 = -_1174;
    float _1204 = _1202 + 1.0;
    float _1206 = _890 * _1196;
    float _1208 = _1114 * _1198;
    float _1210 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1212 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1214 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1216 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1208);
    float _1218 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1210);
    float _1220 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1212);
    float _1222 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1214);
    int _1224 = int(_1050) + int(_1156);
    float _1226 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1218);
    int _1228 = int(_1074) + int(_1192);
    float _1230 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1222);
    float _1232 = fma(_1100, _1176, _1216);
    float _1234 = _1088 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1236 = _1060 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1238 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1240 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1242 = _1064 * _1228;
    int _1244 = _1242 + _1016;
    float _1246 = -_1160;
    int _1248 = _990 ? as_type<int>(_1246) : as_type<int>(_1160);
    float _1250 = _1234 + _1238;
    float _1252 = _1236 + _1240;
    int _1254 = _1110 * _1224;
    int _1256 = _1254 + _988;
    bool _1258 = uint(_1244) >= uint(_952);
    float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1262 = _1250 + _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1266 = _1252 + _1264;
    int _1268 = _988 ^ _886;
    float _1270 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1220);
    float _1272 = _1262 * _1262;
    float _1274 = _1266 * _1266;
    int _1276 = _1106 << 4;
    int _1278 = _1276 + 1968;
    float _1280 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1282 = -_1180;
    int _1284 = _994 ? as_type<int>(_1282) : as_type<int>(_1180);
    float _1286 = _1272 + _1274;
    bool _1288 = uint(_1256) >= uint(_886);
    int _1290 = _1278 + 8;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    uint _1294 = uint(int(uint(int(_1292)) >> uint(2)));
    int _1296 = int(_1292) & 3;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[int(_1294)][_1296];
    bool _1300 = !_650;
    float _1302 = _1300 ? _1160 : as_type<float>(_1248);
    float _1304 = sqrt(_1286);
    float _1306 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _1308 = uint(int(uint(_1268) >> uint(31)));
    float _1310 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1232);
    bool _1312 = !_638;
    float _1314 = _1312 ? _1180 : as_type<float>(_1284);
    float _1316 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _1318 = uint(int(uint(_1278) >> uint(2)));
    uint _1320 = uint(int(uint(int(_1318)) >> uint(2)));
    int _1322 = int(_1318) & 3;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[int(_1320)][_1322];
    int _1326 = int(_1318) + 1;
    uint _1328 = uint(int(uint(_1326) >> uint(2)));
    int _1330 = _1326 & 3;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[int(_1328)][_1330];
    bool _1334 = !_1258;
    int _1336 = _1334 ? 0 : (-1);
    float _1338 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1340 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1342 = ~int(_1308);
    int _1344 = _1342 + 1;
    float _1346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1348 = ~_1336;
    int _1350 = _1228 + _1348;
    int _1352 = _1350 + 1;
    float _1354 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1356 = !_1288;
    int _1358 = _1356 ? 0 : (-1);
    float _1360 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1362 = _1304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1364 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1316);
    int _1366 = ~_1224;
    int _1368 = _1366 + _1358;
    int _1370 = _1368 + 1;
    float _1372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1374 = _886 == 0;
    float _1376 = _1354 + _1360;
    int _1378 = _1352 ^ _1344;
    float _1380 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1338);
    bool _1382 = _886 == 0;
    int _1384 = _886 * _1370;
    int _1386 = _1384 + _988;
    int _1388 = ~_1344;
    int _1390 = _1388 + _1378;
    int _1392 = _1390 + 1;
    float _1394 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1340);
    float _1396 = as_type<float>(_1344);
    float _1398 = _1250;
    float _1400 = as_type<float>(_1224);
    float _1402 = _1272;
    float _1404 = _1274;
    float _1406 = _1394;
    if (!_1362)
    {
        _1396 = _1250;
    }
    float _1408 = _1396;
    float _1410 = _1408;
    if (!_1362)
    {
        _1398 = _1252;
    }
    float _1412 = _1398;
    bool _1414 = !_1374;
    int _1416 = _1414 ? _1386 : (-1);
    float _1418 = _1412;
    if (!_1362)
    {
        _1400 = _1376;
    }
    float _1420 = _1400;
    bool _1422 = !_1362;
    float _1424 = _1420;
    if (!_1422)
    {
        float _1426 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1430 = _1304 + _1428;
        float _1432 = rsqrt(_1286);
        float _1434 = _1430 * _1426;
        float _1436 = _1376 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1438 = _1434 * 0.15915493667125701904296875;
        float _1440 = _1438 * 6.283185482025146484375;
        float _1442 = sin(_1440);
        float _1444 = _1438 * 6.283185482025146484375;
        float _1446 = cos(_1444);
        float _1448 = fma(_1442, _1436, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1450 = _1432 * _1448;
        float _1452 = fma(_1262, _1450, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1454 = _1446 + (-1.0);
        float _1456 = fma(_1266, _1450, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1458 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1460 = _1452 + _1458;
        float _1462 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1466 = _1456 + _1464;
        float _1468 = _1460 * _1460;
        float _1470 = fma(_1376, _1446, _1462);
        float _1472 = _1466 * _1466;
        _1424 = _1470;
        _1402 = _1468;
        _1404 = _1472;
        _1410 = _1452;
        _1418 = _1456;
    }
    float _1474 = _1424;
    float _1476 = _1402;
    float _1478 = _1404;
    float _1480 = _1410;
    float _1482 = _1418;
    bool _1484 = !_1382;
    int _1486 = _1484 ? _1392 : (-1);
    float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1490 = _1474 + _1488;
    float _1492 = float(_1416);
    float _1494 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1496 = float(_1486);
    float _1498 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1500 = fma(_1490, _1490, _1476);
    float _1502 = fma(_1494, _1492, _1080);
    float _1504 = _1314 + 0.5;
    float _1506 = -_1090;
    float _1508 = fma(_1498, _1496, _1506);
    float _1510 = _1302 + (-0.5);
    float _1512 = _1500 + _1478;
    float _1514 = fma(_1494, _1504, _1502);
    float _1516 = -_1082;
    float _1518 = _1516 + 1.0;
    float _1520 = -_1498;
    float _1522 = fma(_1520, _1510, _1508);
    float _1524 = -_1102;
    float _1526 = _1524 + 1.0;
    float _1528 = -_1518;
    float _1530 = fma(_1314, _1528, _1514);
    float _1532 = fma(_1302, _1526, _1522);
    float _1534 = sqrt(_1512);
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1538 = _1324 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1540 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1546 = _1298 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1550 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1552 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1554 = _1544 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1556 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1558 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1560 = _1546 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1562 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1564 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1566 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1568 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_62.x = _1556;
    out.m_62.y = _1558;
    out.m_62.z = _1560;
    out.m_62.w = _1548;
    bool _1570 = _1534 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1572 = isnan(_1534);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1578 = _1574 || _1576;
    out.m_64.x = _1550;
    out.m_64.y = _1552;
    out.m_64.z = _1554;
    out.m_64.w = _1564;
    out.m_66.x = _1530;
    out.m_66.y = _1532;
    out.m_68.x = _1562;
    out.m_68.y = _1566;
    out.m_68.z = _1568;
    float _1580 = _1550;
    if (!_1578)
    {
        _1406 = 1.0;
    }
    float _1582 = _1406;
    bool _1584 = !_1578;
    float _1586 = _1582;
    if (!_1584)
    {
        bool _1588 = _1534 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1590 = isnan(_1534);
        bool _1592 = _1588 || _1590;
        bool _1594 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1596 = _1592 || _1594;
        if (!_1596)
        {
            float _1598 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1600 = _1534 + _1598;
            float _1602 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1604 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1602;
            float _1606 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1608 = _1606 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1610 = 1.0 / _1604;
            float _1612 = _1600 * _1610;
            float _1614 = fma(_1612, _1608, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1586 = _1614;
            _1616 = true;
        }
        else
        {
            bool _1618 = _1534 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1620 = isnan(_1534);
            bool _1622 = _1618 || _1620;
            bool _1624 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1626 = _1622 || _1624;
            if (!_1626)
            {
                float _1628 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1630 = _1534 + _1628;
                float _1632 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1634 = _1632 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1636 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1638 = _1636 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1640 = 1.0 / _1634;
                float _1642 = _1630 * _1640;
                float _1644 = fma(_1642, _1638, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1586 = _1644;
                _1616 = true;
            }
            else
            {
                _1586 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1616 = false;
    float _1646 = _1586;
    float _1648 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1650 = _1474 + _1648;
    float _1652 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1654 = _1480 + _1652;
    float _1656 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1658 = _1482 + _1656;
    float _1660 = fma(_1650, _1646, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1662 = fma(_1654, _1646, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1664 = fma(_1658, _1646, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1666 = -_1354;
    float _1668 = _1666 + _1660;
    float _1670 = -_1234;
    float _1672 = _1670 + _1662;
    float _1674 = -_1236;
    float _1676 = _1674 + _1664;
    float _1678 = _1668 * _1668;
    float _1680 = fma(_1672, _1672, _1678);
    float _1682 = fma(_1676, _1676, _1680);
    float _1684 = sqrt(_1682);
    bool _1686 = _1684 > 0.0;
    float _1688 = _1660;
    float _1690 = _1664;
    if (!_1686)
    {
        _1580 = _1662;
    }
    float _1692 = _1580;
    bool _1694 = !_1686;
    float _1696 = _1692;
    if (!_1694)
    {
        float _1698 = _171 * _171;
        float _1700 = fma(_169, _169, _1698);
        float _1702 = fma(_173, _173, _1700);
        float _1704 = rsqrt(_1682);
        float _1706 = sqrt(_1702);
        float _1708 = _1672 * _1704;
        float _1710 = _1668 * _1704;
        float _1712 = _1676 * _1704;
        bool _1714 = _1706 > 0.0;
        float _1716 = _1706;
        if (!_1714)
        {
            _1716 = _1662;
        }
        float _1718 = _1716;
        bool _1720 = !_1714;
        _1696 = _1718;
        if (!_1720)
        {
            float _1722 = rsqrt(_1702);
            float _1724 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1726 = _171 * _1722;
            float _1728 = _169 * _1722;
            float _1730 = _173 * _1722;
            float _1732 = _1710 * _1726;
            float _1734 = fma(_1708, _1728, _1732);
            float _1736 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1738 = fma(_1712, _1730, _1734);
            float _1740 = _1738 * _1736;
            float _1742 = fma(_169, _1740, _1662);
            float _1744 = fma(_171, _1740, _1660);
            float _1746 = fma(_173, _1740, _1664);
            _1688 = _1744;
            _1696 = _1742;
            _1690 = _1746;
        }
    }
    float _1748 = _1688;
    float _1750 = _1696;
    float _1752 = _1690;
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1756 = _1748 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1760 = _1750 + _1758;
    float _1762 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1764 = _1752 + _1762;
    float _1766 = _1756 * _1756;
    float _1768 = fma(_1760, _1760, _1766);
    float _1770 = fma(_1764, _1764, _1768);
    float _1772 = rsqrt(_1770);
    float _1774 = sqrt(_1770);
    float _1776 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1778 = _1760 * _1776;
    float _1780 = _1764 * _1776;
    float _1782 = _1778 * _1778;
    float _1784 = _1780 * _1780;
    float _1786 = _1782 + _1784;
    float _1788 = sqrt(_1786);
    bool _1790 = _1788 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1792 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1794 = _1788 + _1792;
    float _1796 = _1772;
    float _1798 = _1794;
    float _1800 = _1756;
    float _1802 = _1778;
    if (_1790)
    {
        float _1804 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1796 = _1804;
    }
    float _1806 = _1796;
    if (_1790)
    {
        float _1808 = rsqrt(_1786);
        _177 = _1808;
    }
    float _1810 = _177;
    float _1812 = _1810;
    if (_1790)
    {
        float _1814 = _1794 * _1806;
        _1798 = _1814;
    }
    float _1816 = _1798;
    if (_1790)
    {
        float _1818 = _1816 * 0.15915493667125701904296875;
        _179 = _1818;
    }
    float _1820 = _179;
    float _1822 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1824 = _1806;
    if (_1790)
    {
        float _1826 = _1820 * 6.283185482025146484375;
        float _1828 = sin(_1826);
        _1824 = _1828;
    }
    float _1830 = _1824;
    float _1832 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1834 = precise::max(0.0, _1832);
    float _1836 = _1764;
    float _1838 = _1834;
    if (_1790)
    {
        float _1840 = _1820 * 6.283185482025146484375;
        float _1842 = cos(_1840);
        _1836 = _1842;
    }
    float _1844 = _1836;
    float _1846 = -_1776;
    float _1848 = -_1834;
    float _1850 = fma(_1756, _1846, _1848);
    if (!_1790)
    {
        _1800 = _1780;
    }
    float _1852 = _1800;
    float _1854 = _1852;
    if (_1790)
    {
        float _1856 = _1850 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1838 = _1856;
    }
    float _1858 = _1838;
    float _1860 = _1830;
    float _1862 = _1858;
    if (_1790)
    {
        float _1864 = fma(_1830, _1858, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _181 = _1864;
    }
    float _1866 = _181;
    float _1868 = _1866;
    if (!_1790)
    {
        _1860 = _1850;
    }
    float _1870 = _1860;
    float _1872 = _1870;
    float _1874 = _1844;
    if (_1790)
    {
        float _1876 = _1844 + (-1.0);
        _1862 = _1876;
    }
    float _1878 = _1862;
    float _1880 = _1878;
    if (_1790)
    {
        float _1882 = _1810 * _1866;
        _1868 = _1882;
    }
    float _1884 = _1868;
    if (_1790)
    {
        float _1886 = _1878 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1812 = _1886;
    }
    float _1888 = _1812;
    if (_1790)
    {
        float _1890 = _1778 * _1884;
        _1802 = _1890;
    }
    float _1892 = _1802;
    if (!_1790)
    {
        _1880 = _1782;
    }
    float _1894 = _1880;
    float _1896 = _1894;
    if (_1790)
    {
        float _1898 = _1780 * _1884;
        _1854 = _1898;
    }
    float _1900 = _1854;
    if (_1790)
    {
        float _1902 = fma(_1850, _1844, _1888);
        _1872 = _1902;
    }
    float _1904 = _1872;
    if (_1790)
    {
        float _1906 = _1892 * _1892;
        _1896 = _1906;
    }
    float _1908 = _1896;
    if (!_1790)
    {
        _1874 = _1784;
    }
    float _1910 = _1874;
    float _1912 = _1910;
    if (_1790)
    {
        float _1914 = _1900 * _1900;
        _1912 = _1914;
    }
    float _1916 = _1912;
    float _1918 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1920 = fma(_1904, _1904, _1908);
    float _1922 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1924 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1918);
    float _1926 = _1920 + _1916;
    float _1928 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1932 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1930);
    float _1934 = precise::clamp(_1932, 0.0, 1.0);
    float _1936 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1924);
    float _1938 = rsqrt(_1926);
    float _1940 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1942 = -_1934;
    float _1944 = _1942 + 1.0;
    float _1946 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1928);
    float _1948 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1950 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1940);
    float _1952 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1922);
    float _1954 = abs(_1944);
    float _1956 = log2(_1954);
    float _1958 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1946);
    float _1960 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1950);
    float _1962 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1964 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1966 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1952);
    float _1968 = -_1962;
    float _1970 = fma(_1968, _1822, 1.0);
    float _1972 = _1938 * _1892;
    float _1974 = _1960 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1976 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1978 = _1938 * _1904;
    float _1980 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1982 = _1938 * _1900;
    float _1984 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1976);
    float _1986 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1988 = -_1980;
    float _1990 = fma(_1978, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1988);
    float _1992 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1994 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1984);
    float _1996 = log2(_1970);
    float _1998 = -_1982;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1990);
    float _2002 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2004 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1994);
    float _2006 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2008 = fma(_2000, -0.5, 0.5);
    float _2010 = fma(_2000, 0.5, 0.5);
    float _2012 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2002);
    float _2014 = exp2(_1992);
    float _2016 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2006);
    float _2018 = _1978 + 1.0;
    float _2020 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2012);
    float _2022 = fma(_2010, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2024 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2016);
    float _2026 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2020);
    float _2028 = 1.0 / _2004;
    float _2030 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2024);
    float _2032 = fma(_2010, _2022, -0.212114393711090087890625);
    float _2034 = fma(_2010, _2032, 1.570728778839111328125);
    float _2036 = sqrt(_2008);
    float _2038 = -_1978;
    float _2040 = fma(_2014, _2018, _2038);
    float _2042 = _1996 * 0.693147182464599609375;
    float _2044 = fma(_2040, 0.5, 0.5);
    float _2046 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2048 = _2026 * _2028;
    float _2050 = _2030 * _2028;
    float _2052 = fma(_2048, 0.5, 0.5);
    float _2054 = fma(_2050, -0.5, 0.5);
    float _2056 = _2036 * 0.636619746685028076171875;
    float3 _5582 = float3(_2052, _2054, _2046);
    float _2058 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5582, float3(0.0), isnan(_5582)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5582, float3(0.0), isnan(_5582)), level(0.0)).x;
    float3 _5593 = float3(_2052, _2054, _2046);
    float4 _2061 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5593, float3(0.0), isnan(_5593)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5593, float3(0.0), isnan(_5593)), level(0.0)).xyzw;
    float _2063 = _2061.x;
    float _2065 = _2061.y;
    float _2067 = _2061.z;
    float _2069 = _2061.w;
    float _2071 = -_2034;
    float _2073 = fma(_2056, _2071, 1.0);
    float2 _5615 = float2(_2073, _2044);
    float3 _2077 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5615, float2(0.0), isnan(_5615)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5615, float2(0.0), isnan(_5615)), level(0.0)).xyz;
    float _2079 = _2077.x;
    float _2081 = _2077.y;
    float _2083 = _2077.z;
    float _2085 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2087 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2089 = _1774 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2091 = isnan(_1774);
    bool _2093 = _2089 || _2091;
    bool _2095 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2097 = _2093 || _2095;
    float _2099 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2087);
    float _2101 = exp2(_2085);
    float _2103 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2099);
    float _2105 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2103);
    float _2107 = _2105 + _2004;
    out.gl_Position.x = _2026;
    out.gl_Position.y = _2030;
    out.gl_Position.z = _2105;
    out.gl_Position.w = _2004;
    float _2109 = _2107 * 0.5;
    float _2111 = -_2101;
    float _2113 = _2111 + 1.0;
    float _2115 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _2109;
    out.m_70.w = _2004;
    float _2117 = _2004;
    float _2119 = _2105;
    float _2121 = _2030;
    float _2123 = _2109;
    float _2125 = _2026;
    if (!_2097)
    {
        _2117 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2127 = _2117;
    float _2129 = _2127;
    float _2131 = _2127;
    if (!_2097)
    {
        _2119 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2133 = _2119;
    float _2135 = _2133;
    float _2137 = _2133;
    if (!_2097)
    {
        _2121 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2139 = _2121;
    float _2141 = _2139;
    float _2143 = _2139;
    if (!_2097)
    {
        _2123 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2145 = _2123;
    float _2147 = _2145;
    float _2149 = _2145;
    if (!_2097)
    {
        _2125 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2151 = _2125;
    float _2153 = _2115 * _2058;
    float _2155 = -_2115;
    float _2157 = _2155 + 1.0;
    float _2159 = _2069 * _2153;
    float _2161 = _2069 * _2157;
    float _2163 = _2083 * _2153;
    float _2165 = fma(_2079, _2159, _2063);
    float _2167 = fma(_2081, _2159, _2065);
    float _2169 = _2159;
    float _2171 = _2151;
    float _2173 = _2151;
    if (!_2097)
    {
        _2169 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2175 = _2169;
    float _2177 = fma(_2069, _2163, _2067);
    out.m_72.x = _2165;
    out.m_72.y = _2167;
    out.m_72.z = _2177;
    out.m_72.w = _2161;
    bool _2179 = !_2097;
    float _2181 = _2175;
    float _2183 = _2175;
    if (!_2179)
    {
        bool _2185 = _1774 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2187 = isnan(_1774);
        bool _2189 = _2185 || _2187;
        bool _2191 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2193 = _2189 || _2191;
        if (!_2193)
        {
            float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2197 = _1774 + _2195;
            float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2201 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2199;
            float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2207 = 1.0 / _2201;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2225 = _2197 * _2207;
            float _2227 = precise::clamp(_2225, 0.0, 1.0);
            float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2231 = _2229 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2233 = fma(_2227, _2205, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2235 = fma(_2227, _2231, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2237 = fma(_2227, _2211, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2239 = fma(_2227, _2215, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2241 = fma(_2227, _2219, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2243 = fma(_2227, _2223, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2149 = _2237;
            _2143 = _2241;
            _2183 = _2233;
            _2137 = _2239;
            _2131 = _2235;
            _2173 = _2243;
            _2245 = true;
        }
        else
        {
            bool _2247 = _1774 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2249 = isnan(_1774);
            bool _2251 = _2247 || _2249;
            bool _2253 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2255 = _2251 || _2253;
            if (!_2255)
            {
                _2181 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2257 = _2181;
            _2183 = _2257;
            if (!_2255)
            {
                _2147 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2259 = _2147;
            _2149 = _2259;
            if (!_2255)
            {
                _2129 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2261 = _2129;
            _2131 = _2261;
            if (!_2255)
            {
                _2135 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2263 = _2135;
            _2137 = _2263;
            if (!_2255)
            {
                _2141 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2265 = _2141;
            _2143 = _2265;
            if (!_2255)
            {
                _2171 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2267 = _2171;
            bool _2269 = !_2255;
            _2173 = _2267;
            if (!_2269)
            {
                bool _2271 = _1774 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2273 = isnan(_1774);
                bool _2275 = _2271 || _2273;
                bool _2277 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2279 = _2275 || _2277;
                if (!_2279)
                {
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2283 = _1774 + _2281;
                    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2287 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2285;
                    float _2289 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2293 = 1.0 / _2287;
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2307 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2309 = _2307 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2311 = _2283 * _2293;
                    float _2313 = precise::clamp(_2311, 0.0, 1.0);
                    float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2317 = _2315 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2319 = fma(_2313, _2291, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2321 = fma(_2313, _2317, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2323 = fma(_2313, _2297, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2325 = fma(_2313, _2301, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2327 = fma(_2313, _2305, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2329 = fma(_2313, _2309, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2149 = _2323;
                    _2143 = _2327;
                    _2183 = _2319;
                    _2137 = _2325;
                    _2131 = _2321;
                    _2173 = _2329;
                    _2245 = true;
                }
                else
                {
                    _2149 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2143 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2183 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2137 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2131 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2173 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2245 = false;
    float _2331 = _2149;
    float _2333 = _2143;
    float _2335 = _2183;
    float _2337 = _2137;
    float _2339 = _2131;
    float _2341 = _2173;
    float _2343 = fma(_1566, -0.5, 0.5);
    float _2345 = precise::clamp(_2343, 0.0, 1.0);
    float _2347 = -_2331;
    float _2349 = _2347 + _2333;
    float _2351 = -_2335;
    float _2353 = _2351 + _2337;
    float _2355 = -_2339;
    float _2357 = _2355 + _2341;
    bool _2359 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2361 = fma(_2345, _2349, _2331);
    float _2363 = fma(_2345, _2353, _2335);
    float _2365 = fma(_2345, _2357, _2339);
    float _2367 = _2361 * 0.586610972881317138671875;
    out.m_74.x = 0.0;
    float _2369 = fma(_2363, 0.298911988735198974609375, _2367);
    float _2371 = fma(_2365, 0.114477999508380889892578125, _2369);
    float _2373 = -_2371;
    float _2375 = _2363 + _2373;
    float _2377 = -_2371;
    float _2379 = _2361 + _2377;
    float _2381 = -_2371;
    float _2383 = _2365 + _2381;
    float _2385 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2387 = fma(_2375, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2371);
    float _2389 = fma(_2379, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2371);
    float _2391 = fma(_2383, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2371);
    out.m_49.x = _2385;
    out.m_76.x = _2387;
    out.m_76.y = _2389;
    out.m_76.z = _2391;
    if (!_2359)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2393 = -_1748;
    float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2397 = -_1750;
    float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2401 = -_1752;
    float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2405 = _2395 * _2395;
    float _2407 = fma(_2399, _2399, _2405);
    float _2409 = fma(_2403, _2403, _2407);
    float _2411 = sqrt(_2409);
    float _2413 = rsqrt(_2409);
    float _2415 = -_2411;
    float _2417 = _2415 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2419 = _2417 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2421 = precise::clamp(_2419, 0.0, 1.0);
    float _2423 = _2399 * _2413;
    float _2425 = _2395 * _2413;
    float _2427 = abs(_2421);
    float _2429 = log2(_2427);
    float _2431 = _2403 * _2413;
    float _2433 = _2423 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2435 = _1566 * _2425;
    float _2437 = -_2425;
    float _2439 = -_2433;
    float _2441 = fma(_2437, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2439);
    float _2443 = fma(_1562, _2423, _2435);
    float _2445 = -_2431;
    float _2447 = fma(_2445, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2441);
    float _2449 = fma(_1568, _2431, _2443);
    float _2451 = precise::clamp(_2449, 0.0, 1.0);
    float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2455 = _2447 + _2453;
    float _2457 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2459 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2461 = precise::clamp(_2459, 0.0, 1.0);
    float _2463 = exp2(_2457);
    float _2465 = _2463 * _2461;
    float _2467 = _2451 * _2465;
    float _2469 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2471 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2473 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_74.x = _2469;
    out.m_74.y = _2471;
    out.m_74.z = _2473;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2245 = false;
    bool _1616 = false;
    bool _399 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_46.w;
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
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2529 = as_type<float>(_111);
        out.gl_Position.z = _2529;
    }
    if (!_99)
    {
        return out;
    }
    float _113 = in.m_51.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    if (_123)
    {
        float _131 = float(_95);
        _129 = _131;
    }
    float _133 = _129;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    if (_139)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _105;
    if (_139)
    {
        out.m_49.x = 0.0;
    }
    int _143 = 0;
    if (_139)
    {
        float _145 = _141 * 5.0;
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2597 = as_type<float>(_147);
        out.gl_Position.z = _2597;
    }
    if (_139)
    {
        return out;
    }
    float _149 = in.m_53.x;
    float _151 = in.m_53.y;
    float _153 = in.m_53.z;
    bool _155 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _157 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _159 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _161 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _157);
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _159);
    float _167 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    float _169 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _163);
    float _171 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _165);
    float _173 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _167);
    bool _175 = !_155;
    float _177 = _169;
    float _179 = _173;
    float _181 = _171;
    float _199;
    if (!_175)
    {
        float _183 = in.m_55.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        float _203 = float(_95);
        float _205 = 1.0 / _203;
        float _207 = _127 * _205;
        _199 = _207;
    }
    _201 = false;
    float _209 = _199;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _213 = _209 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _209 + _215;
    bool _219 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _221 = isnan(_209);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _209 + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _247 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _249 = 1.0 / _233;
    float _251 = 1.0 / _241;
    float _253 = 1.0 / _245;
    float _255 = _213 * _249;
    bool _257 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _259 = isnan(_209);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = -_229;
    float _271 = _269 + 1.0;
    bool _273 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _275 = isnan(_209);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = _267 * _271;
    float _287 = _217 * _251;
    float _289 = -_267;
    float _291 = _289 + 1.0;
    float _293 = _283 * _291;
    float _295 = -_283;
    float _297 = _295 + 1.0;
    float _299 = _237 * _253;
    bool _301 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _303 = isnan(_209);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _329 = fma(_315, _287, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = _311 * _297;
    float _333 = fma(_323, _287, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _335 = fma(_319, _299, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _337 = fma(_327, _299, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = -_311;
    float _341 = _339 + 1.0;
    float _343 = _329 * _331;
    float _345 = _333 * _331;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _351;
    float _355 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].x, _343);
    float _357 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].y, _345);
    float _359 = fma(_349, _255, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _361 = fma(_353, _255, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _363 = fma(_335, _293, _355);
    float _365 = fma(_337, _293, _357);
    float _367 = fma(_359, _285, _363);
    float _369 = fma(_361, _285, _365);
    float _371 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].x, _367);
    float _373 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].y, _369);
    bool _375 = !_247;
    float _395;
    float _397;
    if (!_375)
    {
        float _377 = in.m_55.x;
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _381 = _377 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _385 = _383 * _379;
        float _387 = float(_95);
        float _389 = floor(_385);
        float _391 = -_389;
        float _393 = _385 + _391;
        _395 = _387;
        _397 = _393;
        _399 = true;
    }
    else
    {
        float _401 = float(_95);
        float _403 = 1.0 / _401;
        float _405 = _127 * _403;
        _395 = _401;
        _397 = _405;
    }
    _399 = false;
    float _407 = _395;
    float _409 = _397;
    float _411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _413 = int(_411);
    float _415 = in.m_55.y;
    float _417 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _419 = int(_417);
    float _421 = float(_413);
    float _423 = 1.0 / _421;
    float _425 = float(uint(_419));
    int _427 = ~_419;
    int _429 = _427 + 1;
    int _431 = ~_419;
    int _433 = _431 + 1;
    float _435 = 1.0 / _425;
    bool _437 = _419 == 0;
    int _439 = ~_419;
    int _441 = _439 + 1;
    float _443 = _127 * _423;
    float _445 = in.m_55.x;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _449 = _447 != 0;
    float _451 = trunc(_443);
    int _453 = int(_451);
    int _455 = as_type<int>(_435) + (-2);
    float _457 = float(uint(_453));
    float _459 = float(_453);
    float _461 = as_type<float>(_455) * _457;
    float _463 = trunc(_461);
    float _465 = precise::max(_463, 0.0);
    uint _468 = uint(_465);
    bool _470 = !_449;
    float _472 = _470 ? 7.345489978790283203125 : 1.0;
    float _474 = _472 * _445;
    int _476 = _429 * int(_468);
    int _478 = _476 + _453;
    float _480 = floor(_474);
    float _482 = float(uint(_478));
    float _484 = as_type<float>(_455) * _482;
    float _486 = float(_419);
    float _488 = trunc(_484);
    float _490 = precise::max(_488, 0.0);
    uint _492 = uint(_490);
    bool _494 = _459 >= _486;
    bool _496 = isnan(_459);
    bool _498 = _494 || _496;
    bool _500 = isnan(_486);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -_480;
    float _508 = _474 + _506;
    float _510 = trunc(_504);
    int _512 = int(_510);
    int _514 = int(_468) + int(_492);
    float _516 = _508 * _486;
    float _518 = _127 * _486;
    int _520 = _433 * _514;
    int _522 = _520 + _453;
    float _524 = trunc(_516);
    int _526 = int(_524);
    bool _528 = uint(_522) >= uint(_419);
    bool _530 = !_528;
    int _532 = _530 ? 0 : (-1);
    float _534 = 1.0 / _407;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _546 = _544 != 0;
    int _548 = ~_514;
    int _550 = _548 + _532;
    int _552 = _550 + 1;
    int _554 = ~_512;
    int _556 = _554 + 1;
    int _558 = _556 + 1;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _562 = _560 != 0;
    int _564 = _419 * _552;
    int _566 = _564 + _453;
    int _568 = _419 + (-1);
    float _570 = as_type<float>(int(gl_VertexIndex));
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _574 = _572 != 0;
    bool _576 = !_437;
    int _578 = _576 ? _566 : (-1);
    bool _580 = !_562;
    int _582 = _580 ? 0 : 1;
    float _584 = _518 * _534;
    int _586 = _578 * _558;
    bool _588 = !_542;
    int _590 = _588 ? 0 : 1;
    int _592 = abs(_582);
    float _594 = trunc(_584);
    int _596 = int(_594);
    int _598 = _512 * _568;
    int _600 = _598 + _586;
    bool _602 = !_538;
    int _604 = _602 ? 0 : 1;
    int _606 = abs(_590);
    int _608 = _526 * _592;
    int _610 = _608 + _453;
    bool _612 = !_546;
    int _614 = _612 ? 0 : 1;
    int _616 = abs(_604);
    bool _618 = !_574;
    int _620 = _618 ? 0 : 1;
    int _622 = abs(_614);
    int _624 = _600 * _606;
    int _626 = abs(_620);
    int _628 = _596 * _616;
    int _630 = _628 + _624;
    int _632 = ~_419;
    int _634 = _632 + 1;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _638 = _636 != 0;
    int _640 = _610 * _622;
    int _642 = _640 + _630;
    int _644 = ~_419;
    int _646 = _644 + 1;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _650 = _648 != 0;
    int _652 = _526 * _626;
    int _654 = _652 + _642;
    float _656 = float(uint(_654));
    float _658 = as_type<float>(_455) * _656;
    float _660 = trunc(_658);
    float _662 = precise::max(_660, 0.0);
    uint _664 = uint(_662);
    int _666 = _646 * int(_664);
    int _668 = _666 + _654;
    float _670 = float(uint(_668));
    float _672 = as_type<float>(_455) * _670;
    float _674 = trunc(_672);
    float _676 = precise::max(_674, 0.0);
    uint _678 = uint(_676);
    int _680 = int(_664) + int(_678);
    float _682 = float(uint(_610));
    int _684 = _634 * _680;
    int _686 = _684 + _654;
    bool _688 = uint(_686) >= uint(_419);
    bool _690 = !_688;
    int _692 = _690 ? 0 : (-1);
    int _694 = ~_680;
    int _696 = _694 + _692;
    int _698 = _696 + 1;
    float _700 = as_type<float>(_455) * _682;
    int _702 = _419 * _698;
    int _704 = _702 + _654;
    float _706 = trunc(_700);
    float _708 = precise::max(_706, 0.0);
    uint _710 = uint(_708);
    int _712 = ~_419;
    int _714 = _712 + 1;
    bool _716 = !_437;
    int _718 = _716 ? _704 : (-1);
    int _720 = _718 >> 31;
    int _722 = _718 & 3;
    bool _724 = _722 != 0;
    int _726 = _720 & 3;
    int _728 = _724 ? 0 : 1;
    int _730 = _718 + _726;
    int _732 = _714 * int(_710);
    int _734 = _732 + _610;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _738 = _736 != 0;
    int _740 = _730 >> 2;
    float _742 = float(uint(_734));
    int _744 = _740 << 4;
    int _746 = _744 + 368;
    float _748 = as_type<float>(_455) * _742;
    uint _750 = uint(int(uint(_746) >> uint(2)));
    uint _752 = uint(int(uint(int(_750)) >> uint(2)));
    int _754 = int(_750) & 3;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[int(_752)][_754];
    int _758 = int(_750) + 1;
    uint _760 = uint(int(uint(_758) >> uint(2)));
    int _762 = _758 & 3;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[int(_760)][_762];
    int _766 = _718 & 3;
    bool _768 = _766 != 0;
    int _770 = ~_728;
    int _772 = _770 + 1;
    int _774 = _772 + 1;
    float _776 = trunc(_748);
    float _778 = precise::max(_776, 0.0);
    uint _780 = uint(_778);
    bool _782 = uint(_766) > 1u;
    int _784 = _746 + 8;
    uint _786 = uint(int(uint(_784) >> uint(2)));
    uint _788 = uint(int(uint(int(_786)) >> uint(2)));
    int _790 = int(_786) & 3;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[int(_788)][_790];
    int _794 = int(_786) + 1;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    int _798 = _794 & 3;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[int(_796)][_798];
    bool _802 = uint(_766) >= 2u;
    bool _804 = !_768;
    int _806 = _804 ? 0 : 1;
    bool _808 = _766 != 3;
    bool _810 = !_808;
    int _812 = _810 ? 0 : (-1);
    int _814 = _774;
    if (!_782)
    {
        int _816 = ~_728;
        int _818 = _816 + 1;
        _814 = _818;
    }
    int _820 = _814;
    int _822 = int(_710) + int(_780);
    float _824 = in.m_60.x;
    float _826 = in.m_60.y;
    bool _828 = _766 != 3;
    int _830 = _441 * _822;
    int _832 = _830 + _610;
    int _834 = abs(_820);
    int _836 = _802 ? 0 : 1;
    bool _838 = uint(_832) >= uint(_419);
    int _840 = abs(_806);
    int _842 = ~_834;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    int _848 = ~_836;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    int _854 = _852;
    if (_828)
    {
        int _856 = ~_836;
        int _858 = _856 + 1;
        _854 = _858;
    }
    int _860 = _854;
    int _862 = ~_840;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    int _868 = abs(_860);
    int _870 = _846 * as_type<int>(_764);
    float _872 = _371 * _824;
    bool _874 = !_738;
    int _876 = _874 ? 0 : 1;
    float _878 = _445 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _880 = _866 * as_type<int>(_756);
    int _882 = _880 + _870;
    float _884 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _886 = int(_884);
    int _888 = abs(_876);
    float _890 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _892 = abs(_812);
    int _894 = ~_868;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    int _900 = as_type<int>(_570) & 1;
    bool _902 = _900 != 0;
    int _904 = as_type<int>(_570) & 2;
    bool _906 = _904 != 0;
    bool _908 = !_838;
    int _910 = _908 ? 0 : (-1);
    int _912 = _898 * as_type<int>(_792);
    int _914 = _912 + _882;
    float _916 = _373 * _826;
    int _918 = ~_892;
    int _920 = _918 + 1;
    int _922 = _920 + 1;
    int _924 = ~_822;
    int _926 = _924 + _910;
    int _928 = _926 + 1;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _932 = ~_888;
    int _934 = _932 + 1;
    int _936 = _934 + 1;
    int _938 = _922 * as_type<int>(_800);
    int _940 = _938 + _914;
    float _942 = float(uint(_886));
    int _944 = _419 * _928;
    int _946 = _944 + _610;
    float _948 = -_930;
    float _950 = fma(_878, 2.0, _948);
    int _952 = abs(_886);
    int _954 = _940 * _936;
    float _956 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _958 = in.m_46.x;
    float _960 = in.m_46.y;
    float _962 = in.m_46.z;
    float _964 = float(uint(_952));
    float _966 = 1.0 / _942;
    float _968 = _956 * _445;
    float _970 = _415 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _972 = !_437;
    int _974 = _972 ? _946 : (-1);
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _978 = 1.0 / _964;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _982 = fma(_970, -2.0, _976);
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _986 = _974 * _888;
    int _988 = _986 + _954;
    bool _990 = _415 > 0.5;
    float _992 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[78].z, _980);
    bool _994 = _445 > 0.5;
    float _996 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[78].w, _984);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1006 = as_type<int>(_966) + (-2);
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1010 = _409 + _1008;
    float _1012 = float(uint(_988));
    float _1014 = 1.0 / _1000;
    int _1016 = abs(_988);
    float _1018 = _960 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1020 = _960 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1022 = as_type<int>(_978) + (-2);
    float _1024 = as_type<float>(_1006) * _1012;
    float _1026 = float(uint(_1016));
    float _1028 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1018);
    float _1030 = 1.0 / _1004;
    float _1032 = _960 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1034 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1020);
    float _1036 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1038 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1032);
    float _1040 = as_type<float>(_1022) * _1026;
    int _1042 = ~_886;
    int _1044 = _1042 + 1;
    float _1046 = trunc(_1024);
    float _1048 = precise::max(_1046, 0.0);
    uint _1050 = uint(_1048);
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1056;
    float _1060 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1038);
    int _1062 = ~_952;
    int _1064 = _1062 + 1;
    float _1066 = _1058 * _1014;
    float _1068 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1034);
    float _1070 = trunc(_1040);
    float _1072 = precise::max(_1070, 0.0);
    uint _1074 = uint(_1072);
    float _1076 = _1054 * _1030;
    float _1078 = -_127;
    float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[76].x, _950);
    float _1082 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _992);
    int _1084 = ~_952;
    int _1086 = _1084 + 1;
    float _1088 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1028);
    float _1090 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _982);
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1094 = _409 + _1092;
    int _1096 = _1044 * int(_1050);
    int _1098 = _1096 + _988;
    float _1100 = fma(_1076, _1010, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1102 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _996);
    float _1104 = trunc(_968);
    int _1106 = int(_1104);
    int _1108 = ~_886;
    int _1110 = _1108 + 1;
    float _1112 = float(uint(_1098));
    float _1114 = fma(_1066, _1094, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1116 = _1086 * int(_1074);
    int _1118 = _1116 + _1016;
    bool _1120 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1122 = isnan(_409);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = as_type<float>(_1006) * _1112;
    float _1134 = float(uint(_1118));
    float _1136 = -_1130;
    float _1138 = _1136 + 1.0;
    bool _1140 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1142 = isnan(_409);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1148 = _1144 || _1146;
    float _1150 = float(_1148);
    float _1152 = trunc(_1132);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    bool _1158 = !_906;
    float _1160 = _1158 ? (-0.5) : 0.5;
    float _1162 = as_type<float>(_1022) * _1134;
    bool _1164 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1166 = isnan(_409);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = _1150 * _1138;
    bool _1178 = !_902;
    float _1180 = _1178 ? (-0.5) : 0.5;
    float _1182 = -_1150;
    float _1184 = _1182 + 1.0;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1160);
    float _1188 = trunc(_1162);
    float _1190 = precise::max(_1188, 0.0);
    uint _1192 = uint(_1190);
    float _1194 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1180);
    float _1198 = _1174 * _1184;
    float _1200 = _1036 * _1186;
    float _1202 = -_1174;
    float _1204 = _1202 + 1.0;
    float _1206 = _890 * _1196;
    float _1208 = _1114 * _1198;
    float _1210 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1212 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1214 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1216 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1208);
    float _1218 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1210);
    float _1220 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1212);
    float _1222 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1214);
    int _1224 = int(_1050) + int(_1156);
    float _1226 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1218);
    int _1228 = int(_1074) + int(_1192);
    float _1230 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1222);
    float _1232 = fma(_1100, _1176, _1216);
    float _1234 = _1088 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1236 = _1060 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1238 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1240 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1242 = _1064 * _1228;
    int _1244 = _1242 + _1016;
    float _1246 = -_1160;
    int _1248 = _990 ? as_type<int>(_1246) : as_type<int>(_1160);
    float _1250 = _1234 + _1238;
    float _1252 = _1236 + _1240;
    int _1254 = _1110 * _1224;
    int _1256 = _1254 + _988;
    bool _1258 = uint(_1244) >= uint(_952);
    float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1262 = _1250 + _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1266 = _1252 + _1264;
    int _1268 = _988 ^ _886;
    float _1270 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1220);
    float _1272 = _1262 * _1262;
    float _1274 = _1266 * _1266;
    int _1276 = _1106 << 4;
    int _1278 = _1276 + 1968;
    float _1280 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1282 = -_1180;
    int _1284 = _994 ? as_type<int>(_1282) : as_type<int>(_1180);
    float _1286 = _1272 + _1274;
    bool _1288 = uint(_1256) >= uint(_886);
    int _1290 = _1278 + 8;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    uint _1294 = uint(int(uint(int(_1292)) >> uint(2)));
    int _1296 = int(_1292) & 3;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[int(_1294)][_1296];
    bool _1300 = !_650;
    float _1302 = _1300 ? _1160 : as_type<float>(_1248);
    float _1304 = sqrt(_1286);
    float _1306 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _1308 = uint(int(uint(_1268) >> uint(31)));
    float _1310 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1232);
    bool _1312 = !_638;
    float _1314 = _1312 ? _1180 : as_type<float>(_1284);
    float _1316 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _1318 = uint(int(uint(_1278) >> uint(2)));
    uint _1320 = uint(int(uint(int(_1318)) >> uint(2)));
    int _1322 = int(_1318) & 3;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[int(_1320)][_1322];
    int _1326 = int(_1318) + 1;
    uint _1328 = uint(int(uint(_1326) >> uint(2)));
    int _1330 = _1326 & 3;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[int(_1328)][_1330];
    bool _1334 = !_1258;
    int _1336 = _1334 ? 0 : (-1);
    float _1338 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1340 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1342 = ~int(_1308);
    int _1344 = _1342 + 1;
    float _1346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1348 = ~_1336;
    int _1350 = _1228 + _1348;
    int _1352 = _1350 + 1;
    float _1354 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1356 = !_1288;
    int _1358 = _1356 ? 0 : (-1);
    float _1360 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1362 = _1304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1364 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1316);
    int _1366 = ~_1224;
    int _1368 = _1366 + _1358;
    int _1370 = _1368 + 1;
    float _1372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1374 = _886 == 0;
    float _1376 = _1354 + _1360;
    int _1378 = _1352 ^ _1344;
    float _1380 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1338);
    bool _1382 = _886 == 0;
    int _1384 = _886 * _1370;
    int _1386 = _1384 + _988;
    int _1388 = ~_1344;
    int _1390 = _1388 + _1378;
    int _1392 = _1390 + 1;
    float _1394 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1340);
    float _1396 = as_type<float>(_1344);
    float _1398 = _1250;
    float _1400 = as_type<float>(_1224);
    float _1402 = _1272;
    float _1404 = _1274;
    float _1406 = _1394;
    if (!_1362)
    {
        _1396 = _1250;
    }
    float _1408 = _1396;
    float _1410 = _1408;
    if (!_1362)
    {
        _1398 = _1252;
    }
    float _1412 = _1398;
    bool _1414 = !_1374;
    int _1416 = _1414 ? _1386 : (-1);
    float _1418 = _1412;
    if (!_1362)
    {
        _1400 = _1376;
    }
    float _1420 = _1400;
    bool _1422 = !_1362;
    float _1424 = _1420;
    if (!_1422)
    {
        float _1426 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1430 = _1304 + _1428;
        float _1432 = rsqrt(_1286);
        float _1434 = _1430 * _1426;
        float _1436 = _1376 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1438 = _1434 * 0.15915493667125701904296875;
        float _1440 = _1438 * 6.283185482025146484375;
        float _1442 = sin(_1440);
        float _1444 = _1438 * 6.283185482025146484375;
        float _1446 = cos(_1444);
        float _1448 = fma(_1442, _1436, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1450 = _1432 * _1448;
        float _1452 = fma(_1262, _1450, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1454 = _1446 + (-1.0);
        float _1456 = fma(_1266, _1450, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1458 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1460 = _1452 + _1458;
        float _1462 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1466 = _1456 + _1464;
        float _1468 = _1460 * _1460;
        float _1470 = fma(_1376, _1446, _1462);
        float _1472 = _1466 * _1466;
        _1424 = _1470;
        _1402 = _1468;
        _1404 = _1472;
        _1410 = _1452;
        _1418 = _1456;
    }
    float _1474 = _1424;
    float _1476 = _1402;
    float _1478 = _1404;
    float _1480 = _1410;
    float _1482 = _1418;
    bool _1484 = !_1382;
    int _1486 = _1484 ? _1392 : (-1);
    float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1490 = _1474 + _1488;
    float _1492 = float(_1416);
    float _1494 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1496 = float(_1486);
    float _1498 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1500 = fma(_1490, _1490, _1476);
    float _1502 = fma(_1494, _1492, _1080);
    float _1504 = _1314 + 0.5;
    float _1506 = -_1090;
    float _1508 = fma(_1498, _1496, _1506);
    float _1510 = _1302 + (-0.5);
    float _1512 = _1500 + _1478;
    float _1514 = fma(_1494, _1504, _1502);
    float _1516 = -_1082;
    float _1518 = _1516 + 1.0;
    float _1520 = -_1498;
    float _1522 = fma(_1520, _1510, _1508);
    float _1524 = -_1102;
    float _1526 = _1524 + 1.0;
    float _1528 = -_1518;
    float _1530 = fma(_1314, _1528, _1514);
    float _1532 = fma(_1302, _1526, _1522);
    float _1534 = sqrt(_1512);
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1538 = _1324 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1540 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1546 = _1298 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1550 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1552 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1554 = _1544 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1556 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1558 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1560 = _1546 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1562 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1564 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1566 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1568 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_62.x = _1556;
    out.m_62.y = _1558;
    out.m_62.z = _1560;
    out.m_62.w = _1548;
    bool _1570 = _1534 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1572 = isnan(_1534);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1578 = _1574 || _1576;
    out.m_64.x = _1550;
    out.m_64.y = _1552;
    out.m_64.z = _1554;
    out.m_64.w = _1564;
    out.m_66.x = _1530;
    out.m_66.y = _1532;
    out.m_68.x = _1562;
    out.m_68.y = _1566;
    out.m_68.z = _1568;
    float _1580 = _1550;
    if (!_1578)
    {
        _1406 = 1.0;
    }
    float _1582 = _1406;
    bool _1584 = !_1578;
    float _1586 = _1582;
    if (!_1584)
    {
        bool _1588 = _1534 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1590 = isnan(_1534);
        bool _1592 = _1588 || _1590;
        bool _1594 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1596 = _1592 || _1594;
        if (!_1596)
        {
            float _1598 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1600 = _1534 + _1598;
            float _1602 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1604 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1602;
            float _1606 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1608 = _1606 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1610 = 1.0 / _1604;
            float _1612 = _1600 * _1610;
            float _1614 = fma(_1612, _1608, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1586 = _1614;
            _1616 = true;
        }
        else
        {
            bool _1618 = _1534 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1620 = isnan(_1534);
            bool _1622 = _1618 || _1620;
            bool _1624 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1626 = _1622 || _1624;
            if (!_1626)
            {
                float _1628 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1630 = _1534 + _1628;
                float _1632 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1634 = _1632 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1636 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1638 = _1636 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1640 = 1.0 / _1634;
                float _1642 = _1630 * _1640;
                float _1644 = fma(_1642, _1638, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1586 = _1644;
                _1616 = true;
            }
            else
            {
                _1586 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1616 = false;
    float _1646 = _1586;
    float _1648 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1650 = _1474 + _1648;
    float _1652 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1654 = _1480 + _1652;
    float _1656 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1658 = _1482 + _1656;
    float _1660 = fma(_1650, _1646, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1662 = fma(_1654, _1646, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1664 = fma(_1658, _1646, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1666 = -_1354;
    float _1668 = _1666 + _1660;
    float _1670 = -_1234;
    float _1672 = _1670 + _1662;
    float _1674 = -_1236;
    float _1676 = _1674 + _1664;
    float _1678 = _1668 * _1668;
    float _1680 = fma(_1672, _1672, _1678);
    float _1682 = fma(_1676, _1676, _1680);
    float _1684 = sqrt(_1682);
    bool _1686 = _1684 > 0.0;
    float _1688 = _1660;
    float _1690 = _1664;
    if (!_1686)
    {
        _1580 = _1662;
    }
    float _1692 = _1580;
    bool _1694 = !_1686;
    float _1696 = _1692;
    if (!_1694)
    {
        float _1698 = _171 * _171;
        float _1700 = fma(_169, _169, _1698);
        float _1702 = fma(_173, _173, _1700);
        float _1704 = rsqrt(_1682);
        float _1706 = sqrt(_1702);
        float _1708 = _1672 * _1704;
        float _1710 = _1668 * _1704;
        float _1712 = _1676 * _1704;
        bool _1714 = _1706 > 0.0;
        float _1716 = _1706;
        if (!_1714)
        {
            _1716 = _1662;
        }
        float _1718 = _1716;
        bool _1720 = !_1714;
        _1696 = _1718;
        if (!_1720)
        {
            float _1722 = rsqrt(_1702);
            float _1724 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1726 = _171 * _1722;
            float _1728 = _169 * _1722;
            float _1730 = _173 * _1722;
            float _1732 = _1710 * _1726;
            float _1734 = fma(_1708, _1728, _1732);
            float _1736 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1738 = fma(_1712, _1730, _1734);
            float _1740 = _1738 * _1736;
            float _1742 = fma(_169, _1740, _1662);
            float _1744 = fma(_171, _1740, _1660);
            float _1746 = fma(_173, _1740, _1664);
            _1688 = _1744;
            _1696 = _1742;
            _1690 = _1746;
        }
    }
    float _1748 = _1688;
    float _1750 = _1696;
    float _1752 = _1690;
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1756 = _1748 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1760 = _1750 + _1758;
    float _1762 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1764 = _1752 + _1762;
    float _1766 = _1756 * _1756;
    float _1768 = fma(_1760, _1760, _1766);
    float _1770 = fma(_1764, _1764, _1768);
    float _1772 = rsqrt(_1770);
    float _1774 = sqrt(_1770);
    float _1776 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1778 = _1760 * _1776;
    float _1780 = _1764 * _1776;
    float _1782 = _1778 * _1778;
    float _1784 = _1780 * _1780;
    float _1786 = _1782 + _1784;
    float _1788 = sqrt(_1786);
    bool _1790 = _1788 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1792 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1794 = _1788 + _1792;
    float _1796 = _1772;
    float _1798 = _1794;
    float _1800 = _1756;
    float _1802 = _1778;
    if (_1790)
    {
        float _1804 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1796 = _1804;
    }
    float _1806 = _1796;
    if (_1790)
    {
        float _1808 = rsqrt(_1786);
        _177 = _1808;
    }
    float _1810 = _177;
    float _1812 = _1810;
    if (_1790)
    {
        float _1814 = _1794 * _1806;
        _1798 = _1814;
    }
    float _1816 = _1798;
    if (_1790)
    {
        float _1818 = _1816 * 0.15915493667125701904296875;
        _179 = _1818;
    }
    float _1820 = _179;
    float _1822 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1824 = _1806;
    if (_1790)
    {
        float _1826 = _1820 * 6.283185482025146484375;
        float _1828 = sin(_1826);
        _1824 = _1828;
    }
    float _1830 = _1824;
    float _1832 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1834 = precise::max(0.0, _1832);
    float _1836 = _1764;
    float _1838 = _1834;
    if (_1790)
    {
        float _1840 = _1820 * 6.283185482025146484375;
        float _1842 = cos(_1840);
        _1836 = _1842;
    }
    float _1844 = _1836;
    float _1846 = -_1776;
    float _1848 = -_1834;
    float _1850 = fma(_1756, _1846, _1848);
    if (!_1790)
    {
        _1800 = _1780;
    }
    float _1852 = _1800;
    float _1854 = _1852;
    if (_1790)
    {
        float _1856 = _1850 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1838 = _1856;
    }
    float _1858 = _1838;
    float _1860 = _1830;
    float _1862 = _1858;
    if (_1790)
    {
        float _1864 = fma(_1830, _1858, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _181 = _1864;
    }
    float _1866 = _181;
    float _1868 = _1866;
    if (!_1790)
    {
        _1860 = _1850;
    }
    float _1870 = _1860;
    float _1872 = _1870;
    float _1874 = _1844;
    if (_1790)
    {
        float _1876 = _1844 + (-1.0);
        _1862 = _1876;
    }
    float _1878 = _1862;
    float _1880 = _1878;
    if (_1790)
    {
        float _1882 = _1810 * _1866;
        _1868 = _1882;
    }
    float _1884 = _1868;
    if (_1790)
    {
        float _1886 = _1878 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1812 = _1886;
    }
    float _1888 = _1812;
    if (_1790)
    {
        float _1890 = _1778 * _1884;
        _1802 = _1890;
    }
    float _1892 = _1802;
    if (!_1790)
    {
        _1880 = _1782;
    }
    float _1894 = _1880;
    float _1896 = _1894;
    if (_1790)
    {
        float _1898 = _1780 * _1884;
        _1854 = _1898;
    }
    float _1900 = _1854;
    if (_1790)
    {
        float _1902 = fma(_1850, _1844, _1888);
        _1872 = _1902;
    }
    float _1904 = _1872;
    if (_1790)
    {
        float _1906 = _1892 * _1892;
        _1896 = _1906;
    }
    float _1908 = _1896;
    if (!_1790)
    {
        _1874 = _1784;
    }
    float _1910 = _1874;
    float _1912 = _1910;
    if (_1790)
    {
        float _1914 = _1900 * _1900;
        _1912 = _1914;
    }
    float _1916 = _1912;
    float _1918 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1920 = fma(_1904, _1904, _1908);
    float _1922 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1924 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1918);
    float _1926 = _1920 + _1916;
    float _1928 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1932 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1930);
    float _1934 = precise::clamp(_1932, 0.0, 1.0);
    float _1936 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1924);
    float _1938 = rsqrt(_1926);
    float _1940 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1942 = -_1934;
    float _1944 = _1942 + 1.0;
    float _1946 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1928);
    float _1948 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1950 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1940);
    float _1952 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1922);
    float _1954 = abs(_1944);
    float _1956 = log2(_1954);
    float _1958 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1946);
    float _1960 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1950);
    float _1962 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1964 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1966 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1952);
    float _1968 = -_1962;
    float _1970 = fma(_1968, _1822, 1.0);
    float _1972 = _1938 * _1892;
    float _1974 = _1960 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1976 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1978 = _1938 * _1904;
    float _1980 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1982 = _1938 * _1900;
    float _1984 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1976);
    float _1986 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1988 = -_1980;
    float _1990 = fma(_1978, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1988);
    float _1992 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1994 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1984);
    float _1996 = log2(_1970);
    float _1998 = -_1982;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1990);
    float _2002 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2004 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1994);
    float _2006 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2008 = fma(_2000, -0.5, 0.5);
    float _2010 = fma(_2000, 0.5, 0.5);
    float _2012 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2002);
    float _2014 = exp2(_1992);
    float _2016 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2006);
    float _2018 = _1978 + 1.0;
    float _2020 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2012);
    float _2022 = fma(_2010, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2024 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2016);
    float _2026 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2020);
    float _2028 = 1.0 / _2004;
    float _2030 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2024);
    float _2032 = fma(_2010, _2022, -0.212114393711090087890625);
    float _2034 = fma(_2010, _2032, 1.570728778839111328125);
    float _2036 = sqrt(_2008);
    float _2038 = -_1978;
    float _2040 = fma(_2014, _2018, _2038);
    float _2042 = _1996 * 0.693147182464599609375;
    float _2044 = fma(_2040, 0.5, 0.5);
    float _2046 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2048 = _2026 * _2028;
    float _2050 = _2030 * _2028;
    float _2052 = fma(_2048, 0.5, 0.5);
    float _2054 = fma(_2050, -0.5, 0.5);
    float _2056 = _2036 * 0.636619746685028076171875;
    float3 _5582 = float3(_2052, _2054, _2046);
    float _2058 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5582, float3(0.0), isnan(_5582)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5582, float3(0.0), isnan(_5582)), level(0.0)).x;
    float3 _5593 = float3(_2052, _2054, _2046);
    float4 _2061 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5593, float3(0.0), isnan(_5593)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5593, float3(0.0), isnan(_5593)), level(0.0)).xyzw;
    float _2063 = _2061.x;
    float _2065 = _2061.y;
    float _2067 = _2061.z;
    float _2069 = _2061.w;
    float _2071 = -_2034;
    float _2073 = fma(_2056, _2071, 1.0);
    float2 _5615 = float2(_2073, _2044);
    float3 _2077 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5615, float2(0.0), isnan(_5615)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5615, float2(0.0), isnan(_5615)), level(0.0)).xyz;
    float _2079 = _2077.x;
    float _2081 = _2077.y;
    float _2083 = _2077.z;
    float _2085 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2087 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2089 = _1774 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2091 = isnan(_1774);
    bool _2093 = _2089 || _2091;
    bool _2095 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2097 = _2093 || _2095;
    float _2099 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2087);
    float _2101 = exp2(_2085);
    float _2103 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2099);
    float _2105 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2103);
    float _2107 = _2105 + _2004;
    out.gl_Position.x = _2026;
    out.gl_Position.y = _2030;
    out.gl_Position.z = _2105;
    out.gl_Position.w = _2004;
    float _2109 = _2107 * 0.5;
    float _2111 = -_2101;
    float _2113 = _2111 + 1.0;
    float _2115 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _2109;
    out.m_70.w = _2004;
    float _2117 = _2004;
    float _2119 = _2105;
    float _2121 = _2030;
    float _2123 = _2109;
    float _2125 = _2026;
    if (!_2097)
    {
        _2117 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2127 = _2117;
    float _2129 = _2127;
    float _2131 = _2127;
    if (!_2097)
    {
        _2119 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2133 = _2119;
    float _2135 = _2133;
    float _2137 = _2133;
    if (!_2097)
    {
        _2121 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2139 = _2121;
    float _2141 = _2139;
    float _2143 = _2139;
    if (!_2097)
    {
        _2123 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2145 = _2123;
    float _2147 = _2145;
    float _2149 = _2145;
    if (!_2097)
    {
        _2125 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2151 = _2125;
    float _2153 = _2115 * _2058;
    float _2155 = -_2115;
    float _2157 = _2155 + 1.0;
    float _2159 = _2069 * _2153;
    float _2161 = _2069 * _2157;
    float _2163 = _2083 * _2153;
    float _2165 = fma(_2079, _2159, _2063);
    float _2167 = fma(_2081, _2159, _2065);
    float _2169 = _2159;
    float _2171 = _2151;
    float _2173 = _2151;
    if (!_2097)
    {
        _2169 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2175 = _2169;
    float _2177 = fma(_2069, _2163, _2067);
    out.m_72.x = _2165;
    out.m_72.y = _2167;
    out.m_72.z = _2177;
    out.m_72.w = _2161;
    bool _2179 = !_2097;
    float _2181 = _2175;
    float _2183 = _2175;
    if (!_2179)
    {
        bool _2185 = _1774 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2187 = isnan(_1774);
        bool _2189 = _2185 || _2187;
        bool _2191 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2193 = _2189 || _2191;
        if (!_2193)
        {
            float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2197 = _1774 + _2195;
            float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2201 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2199;
            float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2207 = 1.0 / _2201;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2225 = _2197 * _2207;
            float _2227 = precise::clamp(_2225, 0.0, 1.0);
            float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2231 = _2229 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2233 = fma(_2227, _2205, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2235 = fma(_2227, _2231, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2237 = fma(_2227, _2211, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2239 = fma(_2227, _2215, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2241 = fma(_2227, _2219, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2243 = fma(_2227, _2223, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2149 = _2237;
            _2143 = _2241;
            _2183 = _2233;
            _2137 = _2239;
            _2131 = _2235;
            _2173 = _2243;
            _2245 = true;
        }
        else
        {
            bool _2247 = _1774 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2249 = isnan(_1774);
            bool _2251 = _2247 || _2249;
            bool _2253 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2255 = _2251 || _2253;
            if (!_2255)
            {
                _2181 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2257 = _2181;
            _2183 = _2257;
            if (!_2255)
            {
                _2147 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2259 = _2147;
            _2149 = _2259;
            if (!_2255)
            {
                _2129 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2261 = _2129;
            _2131 = _2261;
            if (!_2255)
            {
                _2135 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2263 = _2135;
            _2137 = _2263;
            if (!_2255)
            {
                _2141 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2265 = _2141;
            _2143 = _2265;
            if (!_2255)
            {
                _2171 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2267 = _2171;
            bool _2269 = !_2255;
            _2173 = _2267;
            if (!_2269)
            {
                bool _2271 = _1774 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2273 = isnan(_1774);
                bool _2275 = _2271 || _2273;
                bool _2277 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2279 = _2275 || _2277;
                if (!_2279)
                {
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2283 = _1774 + _2281;
                    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2287 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2285;
                    float _2289 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2293 = 1.0 / _2287;
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2307 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2309 = _2307 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2311 = _2283 * _2293;
                    float _2313 = precise::clamp(_2311, 0.0, 1.0);
                    float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2317 = _2315 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2319 = fma(_2313, _2291, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2321 = fma(_2313, _2317, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2323 = fma(_2313, _2297, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2325 = fma(_2313, _2301, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2327 = fma(_2313, _2305, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2329 = fma(_2313, _2309, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2149 = _2323;
                    _2143 = _2327;
                    _2183 = _2319;
                    _2137 = _2325;
                    _2131 = _2321;
                    _2173 = _2329;
                    _2245 = true;
                }
                else
                {
                    _2149 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2143 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2183 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2137 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2131 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2173 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2245 = false;
    float _2331 = _2149;
    float _2333 = _2143;
    float _2335 = _2183;
    float _2337 = _2137;
    float _2339 = _2131;
    float _2341 = _2173;
    float _2343 = fma(_1566, -0.5, 0.5);
    float _2345 = precise::clamp(_2343, 0.0, 1.0);
    float _2347 = -_2331;
    float _2349 = _2347 + _2333;
    float _2351 = -_2335;
    float _2353 = _2351 + _2337;
    float _2355 = -_2339;
    float _2357 = _2355 + _2341;
    bool _2359 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2361 = fma(_2345, _2349, _2331);
    float _2363 = fma(_2345, _2353, _2335);
    float _2365 = fma(_2345, _2357, _2339);
    float _2367 = _2361 * 0.586610972881317138671875;
    out.m_74.x = 0.0;
    float _2369 = fma(_2363, 0.298911988735198974609375, _2367);
    float _2371 = fma(_2365, 0.114477999508380889892578125, _2369);
    float _2373 = -_2371;
    float _2375 = _2363 + _2373;
    float _2377 = -_2371;
    float _2379 = _2361 + _2377;
    float _2381 = -_2371;
    float _2383 = _2365 + _2381;
    float _2385 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2387 = fma(_2375, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2371);
    float _2389 = fma(_2379, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2371);
    float _2391 = fma(_2383, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2371);
    out.m_49.x = _2385;
    out.m_76.x = _2387;
    out.m_76.y = _2389;
    out.m_76.z = _2391;
    if (!_2359)
    {
        return out;
    }
    float _2393 = -_1748;
    float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2397 = -_1750;
    float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2401 = -_1752;
    float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2405 = _2395 * _2395;
    float _2407 = fma(_2399, _2399, _2405);
    float _2409 = fma(_2403, _2403, _2407);
    float _2411 = sqrt(_2409);
    float _2413 = rsqrt(_2409);
    float _2415 = -_2411;
    float _2417 = _2415 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2419 = _2417 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2421 = precise::clamp(_2419, 0.0, 1.0);
    float _2423 = _2399 * _2413;
    float _2425 = _2395 * _2413;
    float _2427 = abs(_2421);
    float _2429 = log2(_2427);
    float _2431 = _2403 * _2413;
    float _2433 = _2423 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2435 = _1566 * _2425;
    float _2437 = -_2425;
    float _2439 = -_2433;
    float _2441 = fma(_2437, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2439);
    float _2443 = fma(_1562, _2423, _2435);
    float _2445 = -_2431;
    float _2447 = fma(_2445, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2441);
    float _2449 = fma(_1568, _2431, _2443);
    float _2451 = precise::clamp(_2449, 0.0, 1.0);
    float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2455 = _2447 + _2453;
    float _2457 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2459 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2461 = precise::clamp(_2459, 0.0, 1.0);
    float _2463 = exp2(_2457);
    float _2465 = _2463 * _2461;
    float _2467 = _2451 * _2465;
    float _2469 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2471 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2473 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_74.x = _2469;
    out.m_74.y = _2471;
    out.m_74.z = _2473;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2245 = false;
    bool _1616 = false;
    bool _399 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_46.w;
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
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2529 = as_type<float>(_111);
        out.gl_Position.z = _2529;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _113 = in.m_51.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    if (_123)
    {
        float _131 = float(_95);
        _129 = _131;
    }
    float _133 = _129;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    if (_139)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _105;
    if (_139)
    {
        out.m_49.x = 0.0;
    }
    int _143 = 0;
    if (_139)
    {
        float _145 = _141 * 5.0;
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2597 = as_type<float>(_147);
        out.gl_Position.z = _2597;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _149 = in.m_53.x;
    float _151 = in.m_53.y;
    float _153 = in.m_53.z;
    bool _155 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _157 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _159 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _161 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _157);
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _159);
    float _167 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    float _169 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _163);
    float _171 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _165);
    float _173 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _167);
    bool _175 = !_155;
    float _177 = _169;
    float _179 = _173;
    float _181 = _171;
    float _199;
    if (!_175)
    {
        float _183 = in.m_55.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        float _203 = float(_95);
        float _205 = 1.0 / _203;
        float _207 = _127 * _205;
        _199 = _207;
    }
    _201 = false;
    float _209 = _199;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _213 = _209 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _209 + _215;
    bool _219 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _221 = isnan(_209);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _209 + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _247 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _249 = 1.0 / _233;
    float _251 = 1.0 / _241;
    float _253 = 1.0 / _245;
    float _255 = _213 * _249;
    bool _257 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _259 = isnan(_209);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = -_229;
    float _271 = _269 + 1.0;
    bool _273 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _275 = isnan(_209);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = _267 * _271;
    float _287 = _217 * _251;
    float _289 = -_267;
    float _291 = _289 + 1.0;
    float _293 = _283 * _291;
    float _295 = -_283;
    float _297 = _295 + 1.0;
    float _299 = _237 * _253;
    bool _301 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _303 = isnan(_209);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _329 = fma(_315, _287, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = _311 * _297;
    float _333 = fma(_323, _287, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _335 = fma(_319, _299, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _337 = fma(_327, _299, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = -_311;
    float _341 = _339 + 1.0;
    float _343 = _329 * _331;
    float _345 = _333 * _331;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _351;
    float _355 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].x, _343);
    float _357 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].y, _345);
    float _359 = fma(_349, _255, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _361 = fma(_353, _255, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _363 = fma(_335, _293, _355);
    float _365 = fma(_337, _293, _357);
    float _367 = fma(_359, _285, _363);
    float _369 = fma(_361, _285, _365);
    float _371 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].x, _367);
    float _373 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].y, _369);
    bool _375 = !_247;
    float _395;
    float _397;
    if (!_375)
    {
        float _377 = in.m_55.x;
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _381 = _377 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _385 = _383 * _379;
        float _387 = float(_95);
        float _389 = floor(_385);
        float _391 = -_389;
        float _393 = _385 + _391;
        _395 = _387;
        _397 = _393;
        _399 = true;
    }
    else
    {
        float _401 = float(_95);
        float _403 = 1.0 / _401;
        float _405 = _127 * _403;
        _395 = _401;
        _397 = _405;
    }
    _399 = false;
    float _407 = _395;
    float _409 = _397;
    float _411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _413 = int(_411);
    float _415 = in.m_55.y;
    float _417 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _419 = int(_417);
    float _421 = float(_413);
    float _423 = 1.0 / _421;
    float _425 = float(uint(_419));
    int _427 = ~_419;
    int _429 = _427 + 1;
    int _431 = ~_419;
    int _433 = _431 + 1;
    float _435 = 1.0 / _425;
    bool _437 = _419 == 0;
    int _439 = ~_419;
    int _441 = _439 + 1;
    float _443 = _127 * _423;
    float _445 = in.m_55.x;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _449 = _447 != 0;
    float _451 = trunc(_443);
    int _453 = int(_451);
    int _455 = as_type<int>(_435) + (-2);
    float _457 = float(uint(_453));
    float _459 = float(_453);
    float _461 = as_type<float>(_455) * _457;
    float _463 = trunc(_461);
    float _465 = precise::max(_463, 0.0);
    uint _468 = uint(_465);
    bool _470 = !_449;
    float _472 = _470 ? 7.345489978790283203125 : 1.0;
    float _474 = _472 * _445;
    int _476 = _429 * int(_468);
    int _478 = _476 + _453;
    float _480 = floor(_474);
    float _482 = float(uint(_478));
    float _484 = as_type<float>(_455) * _482;
    float _486 = float(_419);
    float _488 = trunc(_484);
    float _490 = precise::max(_488, 0.0);
    uint _492 = uint(_490);
    bool _494 = _459 >= _486;
    bool _496 = isnan(_459);
    bool _498 = _494 || _496;
    bool _500 = isnan(_486);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -_480;
    float _508 = _474 + _506;
    float _510 = trunc(_504);
    int _512 = int(_510);
    int _514 = int(_468) + int(_492);
    float _516 = _508 * _486;
    float _518 = _127 * _486;
    int _520 = _433 * _514;
    int _522 = _520 + _453;
    float _524 = trunc(_516);
    int _526 = int(_524);
    bool _528 = uint(_522) >= uint(_419);
    bool _530 = !_528;
    int _532 = _530 ? 0 : (-1);
    float _534 = 1.0 / _407;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _546 = _544 != 0;
    int _548 = ~_514;
    int _550 = _548 + _532;
    int _552 = _550 + 1;
    int _554 = ~_512;
    int _556 = _554 + 1;
    int _558 = _556 + 1;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _562 = _560 != 0;
    int _564 = _419 * _552;
    int _566 = _564 + _453;
    int _568 = _419 + (-1);
    float _570 = as_type<float>(int(gl_VertexIndex));
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _574 = _572 != 0;
    bool _576 = !_437;
    int _578 = _576 ? _566 : (-1);
    bool _580 = !_562;
    int _582 = _580 ? 0 : 1;
    float _584 = _518 * _534;
    int _586 = _578 * _558;
    bool _588 = !_542;
    int _590 = _588 ? 0 : 1;
    int _592 = abs(_582);
    float _594 = trunc(_584);
    int _596 = int(_594);
    int _598 = _512 * _568;
    int _600 = _598 + _586;
    bool _602 = !_538;
    int _604 = _602 ? 0 : 1;
    int _606 = abs(_590);
    int _608 = _526 * _592;
    int _610 = _608 + _453;
    bool _612 = !_546;
    int _614 = _612 ? 0 : 1;
    int _616 = abs(_604);
    bool _618 = !_574;
    int _620 = _618 ? 0 : 1;
    int _622 = abs(_614);
    int _624 = _600 * _606;
    int _626 = abs(_620);
    int _628 = _596 * _616;
    int _630 = _628 + _624;
    int _632 = ~_419;
    int _634 = _632 + 1;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _638 = _636 != 0;
    int _640 = _610 * _622;
    int _642 = _640 + _630;
    int _644 = ~_419;
    int _646 = _644 + 1;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _650 = _648 != 0;
    int _652 = _526 * _626;
    int _654 = _652 + _642;
    float _656 = float(uint(_654));
    float _658 = as_type<float>(_455) * _656;
    float _660 = trunc(_658);
    float _662 = precise::max(_660, 0.0);
    uint _664 = uint(_662);
    int _666 = _646 * int(_664);
    int _668 = _666 + _654;
    float _670 = float(uint(_668));
    float _672 = as_type<float>(_455) * _670;
    float _674 = trunc(_672);
    float _676 = precise::max(_674, 0.0);
    uint _678 = uint(_676);
    int _680 = int(_664) + int(_678);
    float _682 = float(uint(_610));
    int _684 = _634 * _680;
    int _686 = _684 + _654;
    bool _688 = uint(_686) >= uint(_419);
    bool _690 = !_688;
    int _692 = _690 ? 0 : (-1);
    int _694 = ~_680;
    int _696 = _694 + _692;
    int _698 = _696 + 1;
    float _700 = as_type<float>(_455) * _682;
    int _702 = _419 * _698;
    int _704 = _702 + _654;
    float _706 = trunc(_700);
    float _708 = precise::max(_706, 0.0);
    uint _710 = uint(_708);
    int _712 = ~_419;
    int _714 = _712 + 1;
    bool _716 = !_437;
    int _718 = _716 ? _704 : (-1);
    int _720 = _718 >> 31;
    int _722 = _718 & 3;
    bool _724 = _722 != 0;
    int _726 = _720 & 3;
    int _728 = _724 ? 0 : 1;
    int _730 = _718 + _726;
    int _732 = _714 * int(_710);
    int _734 = _732 + _610;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _738 = _736 != 0;
    int _740 = _730 >> 2;
    float _742 = float(uint(_734));
    int _744 = _740 << 4;
    int _746 = _744 + 368;
    float _748 = as_type<float>(_455) * _742;
    uint _750 = uint(int(uint(_746) >> uint(2)));
    uint _752 = uint(int(uint(int(_750)) >> uint(2)));
    int _754 = int(_750) & 3;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[int(_752)][_754];
    int _758 = int(_750) + 1;
    uint _760 = uint(int(uint(_758) >> uint(2)));
    int _762 = _758 & 3;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[int(_760)][_762];
    int _766 = _718 & 3;
    bool _768 = _766 != 0;
    int _770 = ~_728;
    int _772 = _770 + 1;
    int _774 = _772 + 1;
    float _776 = trunc(_748);
    float _778 = precise::max(_776, 0.0);
    uint _780 = uint(_778);
    bool _782 = uint(_766) > 1u;
    int _784 = _746 + 8;
    uint _786 = uint(int(uint(_784) >> uint(2)));
    uint _788 = uint(int(uint(int(_786)) >> uint(2)));
    int _790 = int(_786) & 3;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[int(_788)][_790];
    int _794 = int(_786) + 1;
    uint _796 = uint(int(uint(_794) >> uint(2)));
    int _798 = _794 & 3;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[int(_796)][_798];
    bool _802 = uint(_766) >= 2u;
    bool _804 = !_768;
    int _806 = _804 ? 0 : 1;
    bool _808 = _766 != 3;
    bool _810 = !_808;
    int _812 = _810 ? 0 : (-1);
    int _814 = _774;
    if (!_782)
    {
        int _816 = ~_728;
        int _818 = _816 + 1;
        _814 = _818;
    }
    int _820 = _814;
    int _822 = int(_710) + int(_780);
    float _824 = in.m_60.x;
    float _826 = in.m_60.y;
    bool _828 = _766 != 3;
    int _830 = _441 * _822;
    int _832 = _830 + _610;
    int _834 = abs(_820);
    int _836 = _802 ? 0 : 1;
    bool _838 = uint(_832) >= uint(_419);
    int _840 = abs(_806);
    int _842 = ~_834;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    int _848 = ~_836;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    int _854 = _852;
    if (_828)
    {
        int _856 = ~_836;
        int _858 = _856 + 1;
        _854 = _858;
    }
    int _860 = _854;
    int _862 = ~_840;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    int _868 = abs(_860);
    int _870 = _846 * as_type<int>(_764);
    float _872 = _371 * _824;
    bool _874 = !_738;
    int _876 = _874 ? 0 : 1;
    float _878 = _445 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _880 = _866 * as_type<int>(_756);
    int _882 = _880 + _870;
    float _884 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _886 = int(_884);
    int _888 = abs(_876);
    float _890 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _892 = abs(_812);
    int _894 = ~_868;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    int _900 = as_type<int>(_570) & 1;
    bool _902 = _900 != 0;
    int _904 = as_type<int>(_570) & 2;
    bool _906 = _904 != 0;
    bool _908 = !_838;
    int _910 = _908 ? 0 : (-1);
    int _912 = _898 * as_type<int>(_792);
    int _914 = _912 + _882;
    float _916 = _373 * _826;
    int _918 = ~_892;
    int _920 = _918 + 1;
    int _922 = _920 + 1;
    int _924 = ~_822;
    int _926 = _924 + _910;
    int _928 = _926 + 1;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _932 = ~_888;
    int _934 = _932 + 1;
    int _936 = _934 + 1;
    int _938 = _922 * as_type<int>(_800);
    int _940 = _938 + _914;
    float _942 = float(uint(_886));
    int _944 = _419 * _928;
    int _946 = _944 + _610;
    float _948 = -_930;
    float _950 = fma(_878, 2.0, _948);
    int _952 = abs(_886);
    int _954 = _940 * _936;
    float _956 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _958 = in.m_46.x;
    float _960 = in.m_46.y;
    float _962 = in.m_46.z;
    float _964 = float(uint(_952));
    float _966 = 1.0 / _942;
    float _968 = _956 * _445;
    float _970 = _415 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _972 = !_437;
    int _974 = _972 ? _946 : (-1);
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _978 = 1.0 / _964;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _982 = fma(_970, -2.0, _976);
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _986 = _974 * _888;
    int _988 = _986 + _954;
    bool _990 = _415 > 0.5;
    float _992 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[78].z, _980);
    bool _994 = _445 > 0.5;
    float _996 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[78].w, _984);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1006 = as_type<int>(_966) + (-2);
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1010 = _409 + _1008;
    float _1012 = float(uint(_988));
    float _1014 = 1.0 / _1000;
    int _1016 = abs(_988);
    float _1018 = _960 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1020 = _960 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1022 = as_type<int>(_978) + (-2);
    float _1024 = as_type<float>(_1006) * _1012;
    float _1026 = float(uint(_1016));
    float _1028 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1018);
    float _1030 = 1.0 / _1004;
    float _1032 = _960 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1034 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1020);
    float _1036 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1038 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1032);
    float _1040 = as_type<float>(_1022) * _1026;
    int _1042 = ~_886;
    int _1044 = _1042 + 1;
    float _1046 = trunc(_1024);
    float _1048 = precise::max(_1046, 0.0);
    uint _1050 = uint(_1048);
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1056;
    float _1060 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1038);
    int _1062 = ~_952;
    int _1064 = _1062 + 1;
    float _1066 = _1058 * _1014;
    float _1068 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1034);
    float _1070 = trunc(_1040);
    float _1072 = precise::max(_1070, 0.0);
    uint _1074 = uint(_1072);
    float _1076 = _1054 * _1030;
    float _1078 = -_127;
    float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[76].x, _950);
    float _1082 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _992);
    int _1084 = ~_952;
    int _1086 = _1084 + 1;
    float _1088 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1028);
    float _1090 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _982);
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1094 = _409 + _1092;
    int _1096 = _1044 * int(_1050);
    int _1098 = _1096 + _988;
    float _1100 = fma(_1076, _1010, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1102 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _996);
    float _1104 = trunc(_968);
    int _1106 = int(_1104);
    int _1108 = ~_886;
    int _1110 = _1108 + 1;
    float _1112 = float(uint(_1098));
    float _1114 = fma(_1066, _1094, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1116 = _1086 * int(_1074);
    int _1118 = _1116 + _1016;
    bool _1120 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1122 = isnan(_409);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = as_type<float>(_1006) * _1112;
    float _1134 = float(uint(_1118));
    float _1136 = -_1130;
    float _1138 = _1136 + 1.0;
    bool _1140 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1142 = isnan(_409);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1148 = _1144 || _1146;
    float _1150 = float(_1148);
    float _1152 = trunc(_1132);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    bool _1158 = !_906;
    float _1160 = _1158 ? (-0.5) : 0.5;
    float _1162 = as_type<float>(_1022) * _1134;
    bool _1164 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1166 = isnan(_409);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = _1150 * _1138;
    bool _1178 = !_902;
    float _1180 = _1178 ? (-0.5) : 0.5;
    float _1182 = -_1150;
    float _1184 = _1182 + 1.0;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1160);
    float _1188 = trunc(_1162);
    float _1190 = precise::max(_1188, 0.0);
    uint _1192 = uint(_1190);
    float _1194 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1180);
    float _1198 = _1174 * _1184;
    float _1200 = _1036 * _1186;
    float _1202 = -_1174;
    float _1204 = _1202 + 1.0;
    float _1206 = _890 * _1196;
    float _1208 = _1114 * _1198;
    float _1210 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1212 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1214 = _1200 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1216 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1208);
    float _1218 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1210);
    float _1220 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1212);
    float _1222 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1214);
    int _1224 = int(_1050) + int(_1156);
    float _1226 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1218);
    int _1228 = int(_1074) + int(_1192);
    float _1230 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1222);
    float _1232 = fma(_1100, _1176, _1216);
    float _1234 = _1088 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1236 = _1060 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1238 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1240 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1242 = _1064 * _1228;
    int _1244 = _1242 + _1016;
    float _1246 = -_1160;
    int _1248 = _990 ? as_type<int>(_1246) : as_type<int>(_1160);
    float _1250 = _1234 + _1238;
    float _1252 = _1236 + _1240;
    int _1254 = _1110 * _1224;
    int _1256 = _1254 + _988;
    bool _1258 = uint(_1244) >= uint(_952);
    float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1262 = _1250 + _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1266 = _1252 + _1264;
    int _1268 = _988 ^ _886;
    float _1270 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1220);
    float _1272 = _1262 * _1262;
    float _1274 = _1266 * _1266;
    int _1276 = _1106 << 4;
    int _1278 = _1276 + 1968;
    float _1280 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1282 = -_1180;
    int _1284 = _994 ? as_type<int>(_1282) : as_type<int>(_1180);
    float _1286 = _1272 + _1274;
    bool _1288 = uint(_1256) >= uint(_886);
    int _1290 = _1278 + 8;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    uint _1294 = uint(int(uint(int(_1292)) >> uint(2)));
    int _1296 = int(_1292) & 3;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[int(_1294)][_1296];
    bool _1300 = !_650;
    float _1302 = _1300 ? _1160 : as_type<float>(_1248);
    float _1304 = sqrt(_1286);
    float _1306 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _1308 = uint(int(uint(_1268) >> uint(31)));
    float _1310 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1232);
    bool _1312 = !_638;
    float _1314 = _1312 ? _1180 : as_type<float>(_1284);
    float _1316 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _1318 = uint(int(uint(_1278) >> uint(2)));
    uint _1320 = uint(int(uint(int(_1318)) >> uint(2)));
    int _1322 = int(_1318) & 3;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[int(_1320)][_1322];
    int _1326 = int(_1318) + 1;
    uint _1328 = uint(int(uint(_1326) >> uint(2)));
    int _1330 = _1326 & 3;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[int(_1328)][_1330];
    bool _1334 = !_1258;
    int _1336 = _1334 ? 0 : (-1);
    float _1338 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1340 = _1306 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1342 = ~int(_1308);
    int _1344 = _1342 + 1;
    float _1346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1348 = ~_1336;
    int _1350 = _1228 + _1348;
    int _1352 = _1350 + 1;
    float _1354 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1356 = !_1288;
    int _1358 = _1356 ? 0 : (-1);
    float _1360 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1362 = _1304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1364 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1316);
    int _1366 = ~_1224;
    int _1368 = _1366 + _1358;
    int _1370 = _1368 + 1;
    float _1372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1374 = _886 == 0;
    float _1376 = _1354 + _1360;
    int _1378 = _1352 ^ _1344;
    float _1380 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1338);
    bool _1382 = _886 == 0;
    int _1384 = _886 * _1370;
    int _1386 = _1384 + _988;
    int _1388 = ~_1344;
    int _1390 = _1388 + _1378;
    int _1392 = _1390 + 1;
    float _1394 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1340);
    float _1396 = as_type<float>(_1344);
    float _1398 = _1250;
    float _1400 = as_type<float>(_1224);
    float _1402 = _1272;
    float _1404 = _1274;
    float _1406 = _1394;
    if (!_1362)
    {
        _1396 = _1250;
    }
    float _1408 = _1396;
    float _1410 = _1408;
    if (!_1362)
    {
        _1398 = _1252;
    }
    float _1412 = _1398;
    bool _1414 = !_1374;
    int _1416 = _1414 ? _1386 : (-1);
    float _1418 = _1412;
    if (!_1362)
    {
        _1400 = _1376;
    }
    float _1420 = _1400;
    bool _1422 = !_1362;
    float _1424 = _1420;
    if (!_1422)
    {
        float _1426 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1430 = _1304 + _1428;
        float _1432 = rsqrt(_1286);
        float _1434 = _1430 * _1426;
        float _1436 = _1376 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1438 = _1434 * 0.15915493667125701904296875;
        float _1440 = _1438 * 6.283185482025146484375;
        float _1442 = sin(_1440);
        float _1444 = _1438 * 6.283185482025146484375;
        float _1446 = cos(_1444);
        float _1448 = fma(_1442, _1436, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1450 = _1432 * _1448;
        float _1452 = fma(_1262, _1450, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1454 = _1446 + (-1.0);
        float _1456 = fma(_1266, _1450, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1458 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1460 = _1452 + _1458;
        float _1462 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1466 = _1456 + _1464;
        float _1468 = _1460 * _1460;
        float _1470 = fma(_1376, _1446, _1462);
        float _1472 = _1466 * _1466;
        _1424 = _1470;
        _1402 = _1468;
        _1404 = _1472;
        _1410 = _1452;
        _1418 = _1456;
    }
    float _1474 = _1424;
    float _1476 = _1402;
    float _1478 = _1404;
    float _1480 = _1410;
    float _1482 = _1418;
    bool _1484 = !_1382;
    int _1486 = _1484 ? _1392 : (-1);
    float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1490 = _1474 + _1488;
    float _1492 = float(_1416);
    float _1494 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1496 = float(_1486);
    float _1498 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1500 = fma(_1490, _1490, _1476);
    float _1502 = fma(_1494, _1492, _1080);
    float _1504 = _1314 + 0.5;
    float _1506 = -_1090;
    float _1508 = fma(_1498, _1496, _1506);
    float _1510 = _1302 + (-0.5);
    float _1512 = _1500 + _1478;
    float _1514 = fma(_1494, _1504, _1502);
    float _1516 = -_1082;
    float _1518 = _1516 + 1.0;
    float _1520 = -_1498;
    float _1522 = fma(_1520, _1510, _1508);
    float _1524 = -_1102;
    float _1526 = _1524 + 1.0;
    float _1528 = -_1518;
    float _1530 = fma(_1314, _1528, _1514);
    float _1532 = fma(_1302, _1526, _1522);
    float _1534 = sqrt(_1512);
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1538 = _1324 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1540 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1546 = _1298 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1550 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1552 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1554 = _1544 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1556 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1558 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1560 = _1546 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1562 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1564 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1566 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1568 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_62.x = _1556;
    out.m_62.y = _1558;
    out.m_62.z = _1560;
    out.m_62.w = _1548;
    bool _1570 = _1534 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1572 = isnan(_1534);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1578 = _1574 || _1576;
    out.m_64.x = _1550;
    out.m_64.y = _1552;
    out.m_64.z = _1554;
    out.m_64.w = _1564;
    out.m_66.x = _1530;
    out.m_66.y = _1532;
    out.m_68.x = _1562;
    out.m_68.y = _1566;
    out.m_68.z = _1568;
    float _1580 = _1550;
    if (!_1578)
    {
        _1406 = 1.0;
    }
    float _1582 = _1406;
    bool _1584 = !_1578;
    float _1586 = _1582;
    if (!_1584)
    {
        bool _1588 = _1534 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1590 = isnan(_1534);
        bool _1592 = _1588 || _1590;
        bool _1594 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1596 = _1592 || _1594;
        if (!_1596)
        {
            float _1598 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1600 = _1534 + _1598;
            float _1602 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1604 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1602;
            float _1606 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1608 = _1606 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1610 = 1.0 / _1604;
            float _1612 = _1600 * _1610;
            float _1614 = fma(_1612, _1608, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1586 = _1614;
            _1616 = true;
        }
        else
        {
            bool _1618 = _1534 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1620 = isnan(_1534);
            bool _1622 = _1618 || _1620;
            bool _1624 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1626 = _1622 || _1624;
            if (!_1626)
            {
                float _1628 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1630 = _1534 + _1628;
                float _1632 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1634 = _1632 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1636 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1638 = _1636 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1640 = 1.0 / _1634;
                float _1642 = _1630 * _1640;
                float _1644 = fma(_1642, _1638, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1586 = _1644;
                _1616 = true;
            }
            else
            {
                _1586 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1616 = false;
    float _1646 = _1586;
    float _1648 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1650 = _1474 + _1648;
    float _1652 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1654 = _1480 + _1652;
    float _1656 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1658 = _1482 + _1656;
    float _1660 = fma(_1650, _1646, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1662 = fma(_1654, _1646, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1664 = fma(_1658, _1646, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1666 = -_1354;
    float _1668 = _1666 + _1660;
    float _1670 = -_1234;
    float _1672 = _1670 + _1662;
    float _1674 = -_1236;
    float _1676 = _1674 + _1664;
    float _1678 = _1668 * _1668;
    float _1680 = fma(_1672, _1672, _1678);
    float _1682 = fma(_1676, _1676, _1680);
    float _1684 = sqrt(_1682);
    bool _1686 = _1684 > 0.0;
    float _1688 = _1660;
    float _1690 = _1664;
    if (!_1686)
    {
        _1580 = _1662;
    }
    float _1692 = _1580;
    bool _1694 = !_1686;
    float _1696 = _1692;
    if (!_1694)
    {
        float _1698 = _171 * _171;
        float _1700 = fma(_169, _169, _1698);
        float _1702 = fma(_173, _173, _1700);
        float _1704 = rsqrt(_1682);
        float _1706 = sqrt(_1702);
        float _1708 = _1672 * _1704;
        float _1710 = _1668 * _1704;
        float _1712 = _1676 * _1704;
        bool _1714 = _1706 > 0.0;
        float _1716 = _1706;
        if (!_1714)
        {
            _1716 = _1662;
        }
        float _1718 = _1716;
        bool _1720 = !_1714;
        _1696 = _1718;
        if (!_1720)
        {
            float _1722 = rsqrt(_1702);
            float _1724 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1726 = _171 * _1722;
            float _1728 = _169 * _1722;
            float _1730 = _173 * _1722;
            float _1732 = _1710 * _1726;
            float _1734 = fma(_1708, _1728, _1732);
            float _1736 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1738 = fma(_1712, _1730, _1734);
            float _1740 = _1738 * _1736;
            float _1742 = fma(_169, _1740, _1662);
            float _1744 = fma(_171, _1740, _1660);
            float _1746 = fma(_173, _1740, _1664);
            _1688 = _1744;
            _1696 = _1742;
            _1690 = _1746;
        }
    }
    float _1748 = _1688;
    float _1750 = _1696;
    float _1752 = _1690;
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1756 = _1748 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1760 = _1750 + _1758;
    float _1762 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1764 = _1752 + _1762;
    float _1766 = _1756 * _1756;
    float _1768 = fma(_1760, _1760, _1766);
    float _1770 = fma(_1764, _1764, _1768);
    float _1772 = rsqrt(_1770);
    float _1774 = sqrt(_1770);
    float _1776 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1778 = _1760 * _1776;
    float _1780 = _1764 * _1776;
    float _1782 = _1778 * _1778;
    float _1784 = _1780 * _1780;
    float _1786 = _1782 + _1784;
    float _1788 = sqrt(_1786);
    bool _1790 = _1788 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1792 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1794 = _1788 + _1792;
    float _1796 = _1772;
    float _1798 = _1794;
    float _1800 = _1756;
    float _1802 = _1778;
    if (_1790)
    {
        float _1804 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1796 = _1804;
    }
    float _1806 = _1796;
    if (_1790)
    {
        float _1808 = rsqrt(_1786);
        _177 = _1808;
    }
    float _1810 = _177;
    float _1812 = _1810;
    if (_1790)
    {
        float _1814 = _1794 * _1806;
        _1798 = _1814;
    }
    float _1816 = _1798;
    if (_1790)
    {
        float _1818 = _1816 * 0.15915493667125701904296875;
        _179 = _1818;
    }
    float _1820 = _179;
    float _1822 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1824 = _1806;
    if (_1790)
    {
        float _1826 = _1820 * 6.283185482025146484375;
        float _1828 = sin(_1826);
        _1824 = _1828;
    }
    float _1830 = _1824;
    float _1832 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1834 = precise::max(0.0, _1832);
    float _1836 = _1764;
    float _1838 = _1834;
    if (_1790)
    {
        float _1840 = _1820 * 6.283185482025146484375;
        float _1842 = cos(_1840);
        _1836 = _1842;
    }
    float _1844 = _1836;
    float _1846 = -_1776;
    float _1848 = -_1834;
    float _1850 = fma(_1756, _1846, _1848);
    if (!_1790)
    {
        _1800 = _1780;
    }
    float _1852 = _1800;
    float _1854 = _1852;
    if (_1790)
    {
        float _1856 = _1850 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1838 = _1856;
    }
    float _1858 = _1838;
    float _1860 = _1830;
    float _1862 = _1858;
    if (_1790)
    {
        float _1864 = fma(_1830, _1858, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _181 = _1864;
    }
    float _1866 = _181;
    float _1868 = _1866;
    if (!_1790)
    {
        _1860 = _1850;
    }
    float _1870 = _1860;
    float _1872 = _1870;
    float _1874 = _1844;
    if (_1790)
    {
        float _1876 = _1844 + (-1.0);
        _1862 = _1876;
    }
    float _1878 = _1862;
    float _1880 = _1878;
    if (_1790)
    {
        float _1882 = _1810 * _1866;
        _1868 = _1882;
    }
    float _1884 = _1868;
    if (_1790)
    {
        float _1886 = _1878 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1812 = _1886;
    }
    float _1888 = _1812;
    if (_1790)
    {
        float _1890 = _1778 * _1884;
        _1802 = _1890;
    }
    float _1892 = _1802;
    if (!_1790)
    {
        _1880 = _1782;
    }
    float _1894 = _1880;
    float _1896 = _1894;
    if (_1790)
    {
        float _1898 = _1780 * _1884;
        _1854 = _1898;
    }
    float _1900 = _1854;
    if (_1790)
    {
        float _1902 = fma(_1850, _1844, _1888);
        _1872 = _1902;
    }
    float _1904 = _1872;
    if (_1790)
    {
        float _1906 = _1892 * _1892;
        _1896 = _1906;
    }
    float _1908 = _1896;
    if (!_1790)
    {
        _1874 = _1784;
    }
    float _1910 = _1874;
    float _1912 = _1910;
    if (_1790)
    {
        float _1914 = _1900 * _1900;
        _1912 = _1914;
    }
    float _1916 = _1912;
    float _1918 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1920 = fma(_1904, _1904, _1908);
    float _1922 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1924 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1918);
    float _1926 = _1920 + _1916;
    float _1928 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1932 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1930);
    float _1934 = precise::clamp(_1932, 0.0, 1.0);
    float _1936 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1924);
    float _1938 = rsqrt(_1926);
    float _1940 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1942 = -_1934;
    float _1944 = _1942 + 1.0;
    float _1946 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1928);
    float _1948 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1950 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1940);
    float _1952 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1922);
    float _1954 = abs(_1944);
    float _1956 = log2(_1954);
    float _1958 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1946);
    float _1960 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1950);
    float _1962 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1964 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1966 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1952);
    float _1968 = -_1962;
    float _1970 = fma(_1968, _1822, 1.0);
    float _1972 = _1938 * _1892;
    float _1974 = _1960 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1976 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1978 = _1938 * _1904;
    float _1980 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1982 = _1938 * _1900;
    float _1984 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1976);
    float _1986 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1988 = -_1980;
    float _1990 = fma(_1978, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1988);
    float _1992 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1994 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1984);
    float _1996 = log2(_1970);
    float _1998 = -_1982;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1990);
    float _2002 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2004 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1994);
    float _2006 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2008 = fma(_2000, -0.5, 0.5);
    float _2010 = fma(_2000, 0.5, 0.5);
    float _2012 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2002);
    float _2014 = exp2(_1992);
    float _2016 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2006);
    float _2018 = _1978 + 1.0;
    float _2020 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2012);
    float _2022 = fma(_2010, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2024 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2016);
    float _2026 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2020);
    float _2028 = 1.0 / _2004;
    float _2030 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2024);
    float _2032 = fma(_2010, _2022, -0.212114393711090087890625);
    float _2034 = fma(_2010, _2032, 1.570728778839111328125);
    float _2036 = sqrt(_2008);
    float _2038 = -_1978;
    float _2040 = fma(_2014, _2018, _2038);
    float _2042 = _1996 * 0.693147182464599609375;
    float _2044 = fma(_2040, 0.5, 0.5);
    float _2046 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2048 = _2026 * _2028;
    float _2050 = _2030 * _2028;
    float _2052 = fma(_2048, 0.5, 0.5);
    float _2054 = fma(_2050, -0.5, 0.5);
    float _2056 = _2036 * 0.636619746685028076171875;
    float3 _5582 = float3(_2052, _2054, _2046);
    float _2058 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5582, float3(0.0), isnan(_5582)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5582, float3(0.0), isnan(_5582)), level(0.0)).x;
    float3 _5593 = float3(_2052, _2054, _2046);
    float4 _2061 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5593, float3(0.0), isnan(_5593)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5593, float3(0.0), isnan(_5593)), level(0.0)).xyzw;
    float _2063 = _2061.x;
    float _2065 = _2061.y;
    float _2067 = _2061.z;
    float _2069 = _2061.w;
    float _2071 = -_2034;
    float _2073 = fma(_2056, _2071, 1.0);
    float2 _5615 = float2(_2073, _2044);
    float3 _2077 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5615, float2(0.0), isnan(_5615)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5615, float2(0.0), isnan(_5615)), level(0.0)).xyz;
    float _2079 = _2077.x;
    float _2081 = _2077.y;
    float _2083 = _2077.z;
    float _2085 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2087 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2089 = _1774 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2091 = isnan(_1774);
    bool _2093 = _2089 || _2091;
    bool _2095 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2097 = _2093 || _2095;
    float _2099 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2087);
    float _2101 = exp2(_2085);
    float _2103 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2099);
    float _2105 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2103);
    float _2107 = _2105 + _2004;
    out.gl_Position.x = _2026;
    out.gl_Position.y = _2030;
    out.gl_Position.z = _2105;
    out.gl_Position.w = _2004;
    float _2109 = _2107 * 0.5;
    float _2111 = -_2101;
    float _2113 = _2111 + 1.0;
    float _2115 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _2109;
    out.m_70.w = _2004;
    float _2117 = _2004;
    float _2119 = _2105;
    float _2121 = _2030;
    float _2123 = _2109;
    float _2125 = _2026;
    if (!_2097)
    {
        _2117 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2127 = _2117;
    float _2129 = _2127;
    float _2131 = _2127;
    if (!_2097)
    {
        _2119 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2133 = _2119;
    float _2135 = _2133;
    float _2137 = _2133;
    if (!_2097)
    {
        _2121 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2139 = _2121;
    float _2141 = _2139;
    float _2143 = _2139;
    if (!_2097)
    {
        _2123 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2145 = _2123;
    float _2147 = _2145;
    float _2149 = _2145;
    if (!_2097)
    {
        _2125 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2151 = _2125;
    float _2153 = _2115 * _2058;
    float _2155 = -_2115;
    float _2157 = _2155 + 1.0;
    float _2159 = _2069 * _2153;
    float _2161 = _2069 * _2157;
    float _2163 = _2083 * _2153;
    float _2165 = fma(_2079, _2159, _2063);
    float _2167 = fma(_2081, _2159, _2065);
    float _2169 = _2159;
    float _2171 = _2151;
    float _2173 = _2151;
    if (!_2097)
    {
        _2169 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2175 = _2169;
    float _2177 = fma(_2069, _2163, _2067);
    out.m_72.x = _2165;
    out.m_72.y = _2167;
    out.m_72.z = _2177;
    out.m_72.w = _2161;
    bool _2179 = !_2097;
    float _2181 = _2175;
    float _2183 = _2175;
    if (!_2179)
    {
        bool _2185 = _1774 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2187 = isnan(_1774);
        bool _2189 = _2185 || _2187;
        bool _2191 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2193 = _2189 || _2191;
        if (!_2193)
        {
            float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2197 = _1774 + _2195;
            float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2201 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2199;
            float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2207 = 1.0 / _2201;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2225 = _2197 * _2207;
            float _2227 = precise::clamp(_2225, 0.0, 1.0);
            float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2231 = _2229 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2233 = fma(_2227, _2205, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2235 = fma(_2227, _2231, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2237 = fma(_2227, _2211, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2239 = fma(_2227, _2215, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2241 = fma(_2227, _2219, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2243 = fma(_2227, _2223, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2149 = _2237;
            _2143 = _2241;
            _2183 = _2233;
            _2137 = _2239;
            _2131 = _2235;
            _2173 = _2243;
            _2245 = true;
        }
        else
        {
            bool _2247 = _1774 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2249 = isnan(_1774);
            bool _2251 = _2247 || _2249;
            bool _2253 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2255 = _2251 || _2253;
            if (!_2255)
            {
                _2181 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2257 = _2181;
            _2183 = _2257;
            if (!_2255)
            {
                _2147 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2259 = _2147;
            _2149 = _2259;
            if (!_2255)
            {
                _2129 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2261 = _2129;
            _2131 = _2261;
            if (!_2255)
            {
                _2135 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2263 = _2135;
            _2137 = _2263;
            if (!_2255)
            {
                _2141 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2265 = _2141;
            _2143 = _2265;
            if (!_2255)
            {
                _2171 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2267 = _2171;
            bool _2269 = !_2255;
            _2173 = _2267;
            if (!_2269)
            {
                bool _2271 = _1774 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2273 = isnan(_1774);
                bool _2275 = _2271 || _2273;
                bool _2277 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2279 = _2275 || _2277;
                if (!_2279)
                {
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2283 = _1774 + _2281;
                    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2287 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2285;
                    float _2289 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2293 = 1.0 / _2287;
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2307 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2309 = _2307 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2311 = _2283 * _2293;
                    float _2313 = precise::clamp(_2311, 0.0, 1.0);
                    float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2317 = _2315 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2319 = fma(_2313, _2291, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2321 = fma(_2313, _2317, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2323 = fma(_2313, _2297, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2325 = fma(_2313, _2301, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2327 = fma(_2313, _2305, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2329 = fma(_2313, _2309, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2149 = _2323;
                    _2143 = _2327;
                    _2183 = _2319;
                    _2137 = _2325;
                    _2131 = _2321;
                    _2173 = _2329;
                    _2245 = true;
                }
                else
                {
                    _2149 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2143 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2183 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2137 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2131 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2173 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2245 = false;
    float _2331 = _2149;
    float _2333 = _2143;
    float _2335 = _2183;
    float _2337 = _2137;
    float _2339 = _2131;
    float _2341 = _2173;
    float _2343 = fma(_1566, -0.5, 0.5);
    float _2345 = precise::clamp(_2343, 0.0, 1.0);
    float _2347 = -_2331;
    float _2349 = _2347 + _2333;
    float _2351 = -_2335;
    float _2353 = _2351 + _2337;
    float _2355 = -_2339;
    float _2357 = _2355 + _2341;
    bool _2359 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2361 = fma(_2345, _2349, _2331);
    float _2363 = fma(_2345, _2353, _2335);
    float _2365 = fma(_2345, _2357, _2339);
    float _2367 = _2361 * 0.586610972881317138671875;
    out.m_74.x = 0.0;
    float _2369 = fma(_2363, 0.298911988735198974609375, _2367);
    float _2371 = fma(_2365, 0.114477999508380889892578125, _2369);
    float _2373 = -_2371;
    float _2375 = _2363 + _2373;
    float _2377 = -_2371;
    float _2379 = _2361 + _2377;
    float _2381 = -_2371;
    float _2383 = _2365 + _2381;
    float _2385 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2387 = fma(_2375, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2371);
    float _2389 = fma(_2379, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2371);
    float _2391 = fma(_2383, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2371);
    out.m_49.x = _2385;
    out.m_76.x = _2387;
    out.m_76.y = _2389;
    out.m_76.z = _2391;
    if (!_2359)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2393 = -_1748;
    float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2397 = -_1750;
    float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2401 = -_1752;
    float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2405 = _2395 * _2395;
    float _2407 = fma(_2399, _2399, _2405);
    float _2409 = fma(_2403, _2403, _2407);
    float _2411 = sqrt(_2409);
    float _2413 = rsqrt(_2409);
    float _2415 = -_2411;
    float _2417 = _2415 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2419 = _2417 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2421 = precise::clamp(_2419, 0.0, 1.0);
    float _2423 = _2399 * _2413;
    float _2425 = _2395 * _2413;
    float _2427 = abs(_2421);
    float _2429 = log2(_2427);
    float _2431 = _2403 * _2413;
    float _2433 = _2423 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2435 = _1566 * _2425;
    float _2437 = -_2425;
    float _2439 = -_2433;
    float _2441 = fma(_2437, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2439);
    float _2443 = fma(_1562, _2423, _2435);
    float _2445 = -_2431;
    float _2447 = fma(_2445, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2441);
    float _2449 = fma(_1568, _2431, _2443);
    float _2451 = precise::clamp(_2449, 0.0, 1.0);
    float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2455 = _2447 + _2453;
    float _2457 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2459 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2461 = precise::clamp(_2459, 0.0, 1.0);
    float _2463 = exp2(_2457);
    float _2465 = _2463 * _2461;
    float _2467 = _2451 * _2465;
    float _2469 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2471 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2473 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_74.x = _2469;
    out.m_74.y = _2471;
    out.m_74.z = _2473;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

