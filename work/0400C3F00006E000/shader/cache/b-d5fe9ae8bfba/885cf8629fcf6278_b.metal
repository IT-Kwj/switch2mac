#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c15 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_66 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_62 [[user(locn6)]];
    float4 m_72 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
};

static inline __attribute__((always_inline))
int _85(thread const int& _3781, thread const int& _3782, constant _10& support_buffer)
{
    float _3785 = as_type<float>(support_buffer._m4);
    int _3787 = _3782 + as_type<int>(_3785);
    int _3789 = 1 + _3787;
    float _3791 = support_buffer._m5[_3789].x;
    float _3793 = abs(_3791);
    bool _3795 = _3793 == 1.0;
    if (_3795)
    {
        return _3781;
    }
    float _3797 = float(_3781);
    float _3799 = _3797 / _3793;
    int _3801 = int(_3799);
    return _3801;
}

static inline __attribute__((always_inline))
int _86(thread const int& _3831, thread const int& _3832, constant _10& support_buffer)
{
    float _3835 = as_type<float>(support_buffer._m4);
    int _3837 = _3832 + as_type<int>(_3835);
    int _3839 = 1 + _3837;
    float _3841 = support_buffer._m5[_3839].x;
    bool _3843 = _3841 == 1.0;
    if (_3843)
    {
        return _3831;
    }
    float _3845 = float(_3831);
    float _3847 = _3845 * _3841;
    int _3849 = int(_3847);
    return _3849;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_46.w;
    float _92 = trunc(_90);
    int _94 = int(_92);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_49.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1553 = as_type<float>(_110);
        out.gl_Position.z = _1553;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _114 = in.m_51.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_124)
    {
        float _130 = float(_94);
        _104 = _130;
    }
    float _132 = _104;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_49.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1622 = as_type<float>(_146);
        out.gl_Position.z = _1622;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_53.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_51.x;
    float _164 = in.m_51.y;
    float _166 = in.m_51.z;
    float _168 = in.m_46.x;
    float _170 = in.m_46.y;
    float _172 = in.m_46.z;
    float _174 = 0.0;
    float _176 = _150;
    if (!_160)
    {
        float _178 = _150 * _150;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = _182;
    if (!_160)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_160;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _150 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _150);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_160;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _150 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _176 = _246;
    }
    float _248 = _176;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _162, _252);
    float _260 = fma(_248, _164, _254);
    float _262 = fma(_248, _166, _256);
    float _264 = fma(_258, _148, _168);
    float _266 = fma(_260, _148, _170);
    float _268 = fma(_262, _148, _172);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_55.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_94);
        float _294 = 1.0 / _292;
        float _296 = _128 * _294;
        _288 = _296;
    }
    _290 = false;
    float _298 = _288;
    int _300 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _302 = _300;
    int _304 = 0;
    int _306 = _85(_302, _304, (*spvDescriptorSet0.support_buffer));
    int _308 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).y;
    int _310 = _308;
    int _312 = 0;
    int _314 = _85(_310, _312, (*spvDescriptorSet0.support_buffer));
    float _316 = in.m_57.w;
    float _318 = _128 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _320 = trunc(_316);
    int _322 = int(_320);
    int _324 = abs(_322);
    uint _327 = uint(int(uint(_322) >> uint(31)));
    float _329 = float(uint(_324));
    int _331 = ~int(_327);
    int _333 = _331 + 1;
    float _335 = float(_314);
    float _337 = float(_306);
    float _339 = trunc(_335);
    int _341 = int(_339);
    float _343 = _337 + 9.9999997473787516355514526367188e-06;
    int _345 = abs(_341);
    bool _347 = _341 == 0;
    float _349 = float(uint(_345));
    int _351 = ~_345;
    int _353 = _351 + 1;
    int _355 = ~_345;
    int _357 = _355 + 1;
    float _359 = 1.0 / _349;
    int _361 = as_type<int>(_359) + (-2);
    float _363 = 1.0 / _343;
    float _365 = as_type<float>(_361) * _329;
    float _367 = trunc(_365);
    float _369 = precise::max(_367, 0.0);
    uint _371 = uint(_369);
    float _373 = fma(_318, _363, 9.9999997473787516355514526367188e-06);
    float _375 = floor(_373);
    int _377 = _353 * int(_371);
    int _379 = _377 + _324;
    float _381 = float(uint(_379));
    float _383 = as_type<float>(_361) * _381;
    float _385 = trunc(_383);
    float _387 = precise::max(_385, 0.0);
    uint _389 = uint(_387);
    int _391 = int(_371) + int(_389);
    float _393 = _337 + (-1.0);
    int _395 = _357 * _391;
    int _397 = _395 + _324;
    float _399 = -_375;
    float _401 = _373 + _399;
    float _403 = trunc(_393);
    int _405 = int(_403);
    bool _407 = uint(_397) >= uint(_345);
    float _409 = _337 * _401;
    bool _411 = !_407;
    int _413 = _411 ? 0 : (-1);
    float _415 = trunc(_409);
    int _417 = int(_415);
    int _419 = ~_391;
    int _421 = _419 + _413;
    int _423 = _421 + 1;
    int _425 = _345 * _423;
    int _427 = _425 + _324;
    int _429 = _427 ^ _333;
    bool _431 = _417 >= _405;
    int _433 = ~_333;
    int _435 = _433 + _429;
    int _437 = _435 + 1;
    int _439 = _417 + 1;
    bool _441 = !_347;
    int _443 = _441 ? _437 : (-1);
    bool _445 = !_431;
    int _447 = _445 ? _439 : 0;
    int _449 = _417;
    int _451 = 0;
    int _453 = _86(_449, _451, (*spvDescriptorSet0.support_buffer));
    int _455 = _443;
    int _457 = 0;
    int _459 = _86(_455, _457, (*spvDescriptorSet0.support_buffer));
    float4 _462 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_453, _459)), 0).xyzw;
    float _464 = _462.x;
    float _466 = _462.y;
    float _468 = _462.z;
    float _470 = _462.w;
    int _472 = _447;
    int _474 = 0;
    int _476 = _86(_472, _474, (*spvDescriptorSet0.support_buffer));
    int _478 = _443;
    int _480 = 0;
    int _482 = _86(_478, _480, (*spvDescriptorSet0.support_buffer));
    float4 _484 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_476, _482)), 0).xyzw;
    float _486 = _484.x;
    float _488 = _484.y;
    float _490 = _484.z;
    float _492 = _484.w;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _496 = _298 + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _500 = _298 + _498;
    bool _502 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _504 = isnan(_298);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _522;
    float _526 = as_type<float>(int(gl_VertexIndex));
    float _528 = 1.0 / _516;
    float _530 = 1.0 / _520;
    float _532 = 1.0 / _524;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _536 = _298 + _534;
    float _538 = _500 * _528;
    float _540 = -_512;
    float _542 = _540 + 1.0;
    int _544 = as_type<int>(_526) & 1;
    bool _546 = _544 != 0;
    int _548 = as_type<int>(_526) & 2;
    bool _550 = _548 != 0;
    float _552 = _496 * _530;
    bool _554 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _556 = isnan(_298);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    bool _566 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _568 = isnan(_298);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    bool _578 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _580 = isnan(_298);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = _536 * _532;
    float _592 = -_576;
    float _594 = _592 + 1.0;
    float _596 = -_588;
    float _598 = _596 + 1.0;
    float _600 = _588 * _542;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _606;
    float _610 = _576 * _598;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _620 = fma(_604, _538, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _622 = _564 * _594;
    float _624 = fma(_608, _538, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _626 = fma(_614, _552, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _628 = fma(_618, _552, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _630 = _620 * _622;
    float _632 = -_564;
    float _634 = _632 + 1.0;
    float _636 = _624 * _622;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _638;
    float _642 = in.m_53.x;
    float _644 = in.m_53.y;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _646;
    float _650 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].x, _630);
    float _652 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].y, _636);
    float _654 = fma(_640, _590, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _656 = fma(_648, _590, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _658 = fma(_626, _610, _650);
    float _660 = fma(_628, _610, _652);
    float _662 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _664 = fma(_656, _600, _658);
    float _666 = fma(_654, _600, _660);
    float _668 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _670 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[146].x, _664);
    float _672 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[146].y, _666);
    float _674 = floor(_409);
    float _676 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _678 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _662);
    float _680 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _668);
    bool _682 = !_550;
    float _684 = _682 ? (-0.5) : 0.5;
    float _686 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _676);
    float _688 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _678);
    float _690 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _680);
    float _692 = _670 * _642;
    bool _694 = !_546;
    float _696 = _694 ? (-0.5) : 0.5;
    float _698 = _672 * _644;
    float _700 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _686);
    float _702 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _684);
    float _706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _696);
    float _708 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _710 = -_674;
    float _712 = _409 + _710;
    bool _714 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _716 = isnan(0.5);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _722 = _718 || _720;
    float _724 = _702 * _706;
    float _726 = _708 * _704;
    float _728 = _726 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _730 = _726 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _732 = _726 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _734 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[24].x, _728);
    float _736 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[25].x, _730);
    float _738 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[26].x, _732);
    float _740 = -_466;
    float _742 = _740 + _488;
    float _744 = fma(_712, _742, _466);
    float _746 = -_464;
    float _748 = _746 + _486;
    float _750 = -_468;
    float _752 = _750 + _490;
    float _754 = _744 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _756 = fma(_712, _748, _464);
    float _758 = fma(_712, _752, _468);
    float _760 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _762 = _744 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _764 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[6].x, _754);
    float _766 = _690 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _768 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[24].z, _734);
    float _770 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[25].z, _736);
    float _772 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[4].x, _762);
    float _774 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[6].z, _764);
    float _776 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[26].z, _738);
    float _778 = _688 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _780 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[4].z, _772);
    float _782 = _766 + _774;
    float _784 = _776 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _786 = _700 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _788 = _778 + _780;
    float _790 = _768 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _792 = _782 + _784;
    float _794 = _770 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _796 = _788 + _790;
    float _798 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _800 = _792 + _798;
    float _802 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _804 = _796 + _802;
    float _806 = _800 * _800;
    float _808 = fma(_804, _804, _806);
    float _810 = _744 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _812 = sqrt(_808);
    float _814 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[5].x, _810);
    float _816 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[5].z, _814);
    float _818 = _786 + _816;
    float _820 = _818 + _794;
    bool _822 = _812 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _824 = _756;
    float _826 = _814;
    float _828 = _816;
    float _830 = _792;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _834 = _808;
    float _836 = _782;
    float _838 = 0.5;
    if (!_822)
    {
        _824 = _796;
    }
    float _840 = _824;
    float _842 = _840;
    if (!_822)
    {
        _826 = _792;
    }
    float _844 = _826;
    float _846 = _844;
    if (!_822)
    {
        _828 = _820;
    }
    float _848 = _828;
    bool _850 = !_822;
    float _852 = _848;
    if (!_850)
    {
        float _854 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _858 = _812 + _856;
        float _860 = rsqrt(_808);
        float _862 = _858 * _854;
        float _864 = _820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _866 = _862 * 0.15915493667125701904296875;
        float _868 = _866 * 6.283185482025146484375;
        float _870 = sin(_868);
        float _872 = _866 * 6.283185482025146484375;
        float _874 = cos(_872);
        float _876 = fma(_870, _864, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _878 = _860 * _876;
        float _880 = _874 + (-1.0);
        float _882 = fma(_804, _878, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _884 = fma(_800, _878, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _886 = _880 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = fma(_820, _874, _886);
        _842 = _882;
        _852 = _888;
        _846 = _884;
    }
    float _890 = _842;
    float _892 = _852;
    float _894 = _846;
    float _896 = _892;
    float _898 = _890;
    float _900 = _894;
    if (!_722)
    {
        float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _904 = _818 + _902;
        float _906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _908 = _788 + _906;
        float _910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _912 = -_788;
        float _914 = _912 + _890;
        float _916 = _904 * _904;
        float _918 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _920 = _782 + _918;
        float _922 = -_818;
        float _924 = _922 + _892;
        float _926 = fma(_908, _908, _916);
        float _928 = fma(_920, _920, _926);
        float _930 = sqrt(_928);
        float _932 = precise::min(_930, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _934 = _932 * _910;
        float _936 = -_782;
        float _938 = _936 + _894;
        float _940 = fma(_914, _934, _788);
        float _942 = fma(_924, _934, _818);
        float _944 = fma(_938, _934, _782);
        _896 = _942;
        _898 = _940;
        _900 = _944;
    }
    float _946 = _896;
    float _948 = _898;
    float _950 = _900;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _954 = _946 + _952;
    float _956 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _958 = _948 + _956;
    float _960 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _962 = _950 + _960;
    float _964 = _954 * _954;
    float _966 = fma(_958, _958, _964);
    float _968 = fma(_962, _962, _966);
    float _970 = rsqrt(_968);
    float _972 = _970 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _974 = _958 * _972;
    float _976 = _962 * _972;
    float _978 = _974 * _974;
    float _980 = _976 * _976;
    float _982 = _978 + _980;
    float _984 = sqrt(_982);
    bool _986 = _984 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _988 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _990 = _984 + _988;
    float _992 = _970;
    float _994 = _982;
    float _996 = _990;
    float _998 = _954;
    if (_986)
    {
        float _1000 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _992 = _1000;
    }
    float _1002 = _992;
    if (_986)
    {
        float _1004 = rsqrt(_982);
        _994 = _1004;
    }
    float _1006 = _994;
    float _1008 = _1006;
    if (_986)
    {
        float _1010 = _990 * _1002;
        _996 = _1010;
    }
    float _1012 = _996;
    if (_986)
    {
        float _1014 = _1012 * 0.15915493667125701904296875;
        _830 = _1014;
    }
    float _1016 = _830;
    float _1018 = _962;
    if (_986)
    {
        float _1020 = _1016 * 6.283185482025146484375;
        float _1022 = sin(_1020);
        _1018 = _1022;
    }
    float _1024 = _1018;
    float _1026 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1028 = precise::max(0.0, _1026);
    float _1030 = _1002;
    float _1032 = _1028;
    if (_986)
    {
        float _1034 = _1016 * 6.283185482025146484375;
        float _1036 = cos(_1034);
        _1030 = _1036;
    }
    float _1038 = _1030;
    float _1040 = -_972;
    float _1042 = -_1028;
    float _1044 = fma(_954, _1040, _1042);
    if (_986)
    {
        float _1046 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _998 = _1046;
    }
    float _1048 = _998;
    float _1050 = sqrt(_968);
    float _1052 = _1048;
    float _1054 = _1024;
    if (_986)
    {
        float _1056 = fma(_1024, _1048, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1052 = _1056;
    }
    float _1058 = _1052;
    float _1060 = _1058;
    if (!_986)
    {
        _1054 = _974;
    }
    float _1062 = _1054;
    float _1064 = _1062;
    float _1066 = _1038;
    if (_986)
    {
        float _1068 = _1038 + (-1.0);
        _1032 = _1068;
    }
    float _1070 = _1032;
    float _1072 = _1070;
    if (_986)
    {
        float _1074 = _1006 * _1058;
        _832 = _1074;
    }
    float _1076 = _832;
    if (!_986)
    {
        _1060 = _1044;
    }
    float _1078 = _1060;
    float _1080 = _1078;
    if (_986)
    {
        float _1082 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _834 = _1082;
    }
    float _1084 = _834;
    if (_986)
    {
        float _1086 = _974 * _1076;
        _1064 = _1086;
    }
    float _1088 = _1064;
    if (!_986)
    {
        _1072 = _976;
    }
    float _1090 = _1072;
    float _1092 = _1090;
    if (_986)
    {
        float _1094 = _976 * _1076;
        _1092 = _1094;
    }
    float _1096 = _1092;
    if (!_986)
    {
        _1008 = _978;
    }
    float _1098 = _1008;
    float _1100 = _1098;
    if (_986)
    {
        float _1102 = fma(_1044, _1038, _1084);
        _1080 = _1102;
    }
    float _1104 = _1080;
    if (_986)
    {
        float _1106 = _1088 * _1088;
        _1100 = _1106;
    }
    float _1108 = _1100;
    if (!_986)
    {
        _1066 = _980;
    }
    float _1110 = _1066;
    float _1112 = _1110;
    if (_986)
    {
        float _1114 = _1096 * _1096;
        _1112 = _1114;
    }
    float _1116 = _1112;
    float _1118 = fma(_1104, _1104, _1108);
    float _1120 = _946 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1122 = _1118 + _1116;
    float _1124 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1126 = fma(_1050, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1124);
    float _1128 = precise::clamp(_1126, 0.0, 1.0);
    float _1130 = _946 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1132 = _946 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1134 = rsqrt(_1122);
    float _1136 = -_1128;
    float _1138 = _1136 + 1.0;
    float _1140 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1130);
    float _1142 = _946 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1144 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1146 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1140);
    float _1148 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1132);
    float _1150 = abs(_1138);
    float _1152 = log2(_1150);
    float _1154 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1142);
    float _1156 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1120);
    float _1158 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1148);
    float _1160 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1162 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1154);
    float _1164 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1156);
    float _1166 = _1158 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1168 = _1134 * _1088;
    float _1170 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1172 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1176 = _1134 * _1104;
    float _1178 = _1168 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1180 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1182 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1174);
    float _1184 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1186 = _1134 * _1096;
    float _1188 = -_1178;
    float _1190 = fma(_1176, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1188);
    float _1192 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1182);
    float _1194 = -_1180;
    float _1196 = fma(_1194, _1144, 1.0);
    float _1198 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1200 = exp2(_1184);
    float _1202 = -_1186;
    float _1204 = fma(_1202, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1190);
    float _1206 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1192);
    float _1208 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1210 = fma(_1204, -0.5, 0.5);
    float _1212 = fma(_1204, 0.5, 0.5);
    float _1214 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1208);
    float _1216 = log2(_1196);
    float _1218 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1198);
    float _1220 = _1176 + 1.0;
    float _1222 = fma(_1212, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1224 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1214);
    float _1226 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1218);
    float _1228 = fma(_1212, _1222, -0.212114393711090087890625);
    float _1230 = 1.0 / _1206;
    float _1232 = -_1176;
    float _1234 = fma(_1200, _1220, _1232);
    float _1236 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1224);
    float _1238 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1226);
    float _1240 = fma(_1212, _1228, 1.570728778839111328125);
    float _1242 = fma(_1234, 0.5, 0.5);
    float _1244 = sqrt(_1210);
    float _1246 = _1216 * 0.693147182464599609375;
    float _1248 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1250 = _1236 * _1230;
    float _1252 = _1238 * _1230;
    float _1254 = fma(_1250, 0.5, 0.5);
    float _1256 = fma(_1252, -0.5, 0.5);
    float _1258 = _1244 * 0.636619746685028076171875;
    float3 _3340 = float3(_1254, _1256, _1248);
    float _1260 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3340, float3(0.0), isnan(_3340)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3340, float3(0.0), isnan(_3340)), level(0.0)).x;
    float _1262 = -_1240;
    float _1264 = fma(_1258, _1262, 1.0);
    float3 _3356 = float3(_1254, _1256, _1248);
    float4 _1266 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3356, float3(0.0), isnan(_3356)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3356, float3(0.0), isnan(_3356)), level(0.0)).xyzw;
    float _1268 = _1266.x;
    float _1270 = _1266.y;
    float _1272 = _1266.z;
    float _1274 = _1266.w;
    float2 _3373 = float2(_1264, _1242);
    float3 _1278 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3373, float2(0.0), isnan(_3373)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3373, float2(0.0), isnan(_3373)), level(0.0)).xyz;
    float _1280 = _1278.x;
    float _1282 = _1278.y;
    float _1284 = _1278.z;
    float _1286 = in.m_55.x;
    float _1288 = in.m_55.y;
    float _1290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1292 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1294 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1298 = _1296 != 0;
    float _1300 = -_470;
    float _1302 = _1300 + _492;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1306 = _1304 != 0;
    float _1308 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1294);
    float _1310 = exp2(_1292);
    float _1312 = fma(_712, _1302, _470);
    float _1314 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1308);
    float _1316 = _1236 + _1206;
    float _1318 = _1206 * 0.5;
    out.m_62.w = _1312;
    bool _1320 = _1288 > 0.5;
    bool _1322 = _1286 > 0.5;
    float _1324 = -_1310;
    float _1326 = _1324 + 1.0;
    float _1328 = -_684;
    int _1330 = _1320 ? as_type<int>(_1328) : as_type<int>(_684);
    float _1332 = -_696;
    int _1334 = _1322 ? as_type<int>(_1332) : as_type<int>(_696);
    float _1336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1338 = !_1298;
    float _1340 = _1338 ? _684 : as_type<float>(_1330);
    float _1342 = _818 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1344 = !_1306;
    float _1346 = _1344 ? _696 : as_type<float>(_1334);
    float _1348 = _1326 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1350 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1352 = isnan(0.5);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1358 = _1354 || _1356;
    float _1360 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1342);
    float _1362 = -_1340;
    float _1364 = _1362 + 0.5;
    float _1366 = _1346 + 0.5;
    float _1368 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1360);
    float _1370 = _818 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1372 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1374 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1376 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1378 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1370);
    float _1380 = _1372 * _1290;
    float _1382 = _1374 * _1336;
    float _1384 = 1.0 / _1376;
    float _1386 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1378);
    float _1388 = _1290;
    float _1390 = _1368;
    float _1392 = _1376;
    if (!_1358)
    {
        _836 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1394 = _836;
    float _1396 = _1394;
    if (!_1358)
    {
        _1388 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1398 = _1388;
    float _1400 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1358)
    {
        _838 = 1.0;
    }
    float _1402 = _838;
    out.m_64.x = _1380;
    out.m_64.y = _1382;
    float _1404 = _1400 + _1376;
    float _1406 = _1404 * _1384;
    float _1408 = _1406 * 0.5;
    float _1410 = _1408;
    float _1412 = _1402;
    if (!_1358)
    {
        float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1416 = fma(_1408, _1394, _1414);
        _1396 = _1416;
    }
    float _1418 = _1396;
    if (!_1358)
    {
        float _1420 = -_1398;
        float _1422 = _1420 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1410 = _1422;
    }
    float _1424 = _1410;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (!_1358)
    {
        float _1428 = 1.0 / _1424;
        _1390 = _1428;
    }
    float _1430 = _1390;
    out.m_66.w = _1426;
    float _1432 = _1418;
    if (!_1358)
    {
        float _1434 = 1.0 / _1418;
        _1432 = _1434;
    }
    float _1436 = _1432;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1440 = _1316 * 0.5;
    float _1442 = fma(_1238, -0.5, _1318);
    out.m_68.w = _1438;
    if (!_1358)
    {
        float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1446 = -_1398;
        float _1448 = fma(_1436, _1444, _1446);
        _1392 = _1448;
    }
    float _1450 = _1392;
    float _1452 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1314);
    if (!_1358)
    {
        float _1454 = _1450 * _1430;
        float _1456 = precise::clamp(_1454, 0.0, 1.0);
        _1412 = _1456;
    }
    float _1458 = _1412;
    float _1460 = _1452 + _1206;
    out.gl_Position.x = _1236;
    out.gl_Position.y = _1238;
    out.gl_Position.z = _1452;
    out.gl_Position.w = _1206;
    float _1462 = _1458 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1464 = _1458 > 0.0;
    bool _1466 = isnan(_1458);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan(0.0);
    bool _1472 = _1468 || _1470;
    float _1474 = -_1348;
    float _1476 = _1474 + 1.0;
    float _1478 = _1460 * 0.5;
    float _1480 = _1462 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.x = _1440;
    out.m_70.y = _1442;
    out.m_70.z = _1478;
    out.m_70.w = _1206;
    out.m_49.x = _1480;
    float _1482 = _1348 * _1260;
    float _1484 = _1274 * _1482;
    float _1486 = _1284 * _1482;
    float _1488 = fma(_1280, _1484, _1268);
    float _1490 = fma(_1282, _1484, _1270);
    float _1492 = _1274 * _1476;
    float _1494 = fma(_1274, _1486, _1272);
    out.m_72.x = _1488;
    out.m_72.y = _1490;
    out.m_72.z = _1494;
    out.m_72.w = _1492;
    if (_1472)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _1496 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1496;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_46.w;
    float _92 = trunc(_90);
    int _94 = int(_92);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_49.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1553 = as_type<float>(_110);
        out.gl_Position.z = _1553;
    }
    if (!_98)
    {
        return out;
    }
    float _114 = in.m_51.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_124)
    {
        float _130 = float(_94);
        _104 = _130;
    }
    float _132 = _104;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_49.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1622 = as_type<float>(_146);
        out.gl_Position.z = _1622;
    }
    if (_138)
    {
        return out;
    }
    float _148 = in.m_53.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_51.x;
    float _164 = in.m_51.y;
    float _166 = in.m_51.z;
    float _168 = in.m_46.x;
    float _170 = in.m_46.y;
    float _172 = in.m_46.z;
    float _174 = 0.0;
    float _176 = _150;
    if (!_160)
    {
        float _178 = _150 * _150;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = _182;
    if (!_160)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_160;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _150 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _150);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_160;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _150 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _176 = _246;
    }
    float _248 = _176;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _162, _252);
    float _260 = fma(_248, _164, _254);
    float _262 = fma(_248, _166, _256);
    float _264 = fma(_258, _148, _168);
    float _266 = fma(_260, _148, _170);
    float _268 = fma(_262, _148, _172);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_55.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_94);
        float _294 = 1.0 / _292;
        float _296 = _128 * _294;
        _288 = _296;
    }
    _290 = false;
    float _298 = _288;
    int _300 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _302 = _300;
    int _304 = 0;
    int _306 = _85(_302, _304, (*spvDescriptorSet0.support_buffer));
    int _308 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).y;
    int _310 = _308;
    int _312 = 0;
    int _314 = _85(_310, _312, (*spvDescriptorSet0.support_buffer));
    float _316 = in.m_57.w;
    float _318 = _128 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _320 = trunc(_316);
    int _322 = int(_320);
    int _324 = abs(_322);
    uint _327 = uint(int(uint(_322) >> uint(31)));
    float _329 = float(uint(_324));
    int _331 = ~int(_327);
    int _333 = _331 + 1;
    float _335 = float(_314);
    float _337 = float(_306);
    float _339 = trunc(_335);
    int _341 = int(_339);
    float _343 = _337 + 9.9999997473787516355514526367188e-06;
    int _345 = abs(_341);
    bool _347 = _341 == 0;
    float _349 = float(uint(_345));
    int _351 = ~_345;
    int _353 = _351 + 1;
    int _355 = ~_345;
    int _357 = _355 + 1;
    float _359 = 1.0 / _349;
    int _361 = as_type<int>(_359) + (-2);
    float _363 = 1.0 / _343;
    float _365 = as_type<float>(_361) * _329;
    float _367 = trunc(_365);
    float _369 = precise::max(_367, 0.0);
    uint _371 = uint(_369);
    float _373 = fma(_318, _363, 9.9999997473787516355514526367188e-06);
    float _375 = floor(_373);
    int _377 = _353 * int(_371);
    int _379 = _377 + _324;
    float _381 = float(uint(_379));
    float _383 = as_type<float>(_361) * _381;
    float _385 = trunc(_383);
    float _387 = precise::max(_385, 0.0);
    uint _389 = uint(_387);
    int _391 = int(_371) + int(_389);
    float _393 = _337 + (-1.0);
    int _395 = _357 * _391;
    int _397 = _395 + _324;
    float _399 = -_375;
    float _401 = _373 + _399;
    float _403 = trunc(_393);
    int _405 = int(_403);
    bool _407 = uint(_397) >= uint(_345);
    float _409 = _337 * _401;
    bool _411 = !_407;
    int _413 = _411 ? 0 : (-1);
    float _415 = trunc(_409);
    int _417 = int(_415);
    int _419 = ~_391;
    int _421 = _419 + _413;
    int _423 = _421 + 1;
    int _425 = _345 * _423;
    int _427 = _425 + _324;
    int _429 = _427 ^ _333;
    bool _431 = _417 >= _405;
    int _433 = ~_333;
    int _435 = _433 + _429;
    int _437 = _435 + 1;
    int _439 = _417 + 1;
    bool _441 = !_347;
    int _443 = _441 ? _437 : (-1);
    bool _445 = !_431;
    int _447 = _445 ? _439 : 0;
    int _449 = _417;
    int _451 = 0;
    int _453 = _86(_449, _451, (*spvDescriptorSet0.support_buffer));
    int _455 = _443;
    int _457 = 0;
    int _459 = _86(_455, _457, (*spvDescriptorSet0.support_buffer));
    float4 _462 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_453, _459)), 0).xyzw;
    float _464 = _462.x;
    float _466 = _462.y;
    float _468 = _462.z;
    float _470 = _462.w;
    int _472 = _447;
    int _474 = 0;
    int _476 = _86(_472, _474, (*spvDescriptorSet0.support_buffer));
    int _478 = _443;
    int _480 = 0;
    int _482 = _86(_478, _480, (*spvDescriptorSet0.support_buffer));
    float4 _484 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_476, _482)), 0).xyzw;
    float _486 = _484.x;
    float _488 = _484.y;
    float _490 = _484.z;
    float _492 = _484.w;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _496 = _298 + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _500 = _298 + _498;
    bool _502 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _504 = isnan(_298);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _522;
    float _526 = as_type<float>(int(gl_VertexIndex));
    float _528 = 1.0 / _516;
    float _530 = 1.0 / _520;
    float _532 = 1.0 / _524;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _536 = _298 + _534;
    float _538 = _500 * _528;
    float _540 = -_512;
    float _542 = _540 + 1.0;
    int _544 = as_type<int>(_526) & 1;
    bool _546 = _544 != 0;
    int _548 = as_type<int>(_526) & 2;
    bool _550 = _548 != 0;
    float _552 = _496 * _530;
    bool _554 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _556 = isnan(_298);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    bool _566 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _568 = isnan(_298);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    bool _578 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _580 = isnan(_298);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = _536 * _532;
    float _592 = -_576;
    float _594 = _592 + 1.0;
    float _596 = -_588;
    float _598 = _596 + 1.0;
    float _600 = _588 * _542;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _606;
    float _610 = _576 * _598;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _620 = fma(_604, _538, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _622 = _564 * _594;
    float _624 = fma(_608, _538, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _626 = fma(_614, _552, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _628 = fma(_618, _552, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _630 = _620 * _622;
    float _632 = -_564;
    float _634 = _632 + 1.0;
    float _636 = _624 * _622;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _638;
    float _642 = in.m_53.x;
    float _644 = in.m_53.y;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _646;
    float _650 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].x, _630);
    float _652 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].y, _636);
    float _654 = fma(_640, _590, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _656 = fma(_648, _590, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _658 = fma(_626, _610, _650);
    float _660 = fma(_628, _610, _652);
    float _662 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _664 = fma(_656, _600, _658);
    float _666 = fma(_654, _600, _660);
    float _668 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _670 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[146].x, _664);
    float _672 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[146].y, _666);
    float _674 = floor(_409);
    float _676 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _678 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _662);
    float _680 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _668);
    bool _682 = !_550;
    float _684 = _682 ? (-0.5) : 0.5;
    float _686 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _676);
    float _688 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _678);
    float _690 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _680);
    float _692 = _670 * _642;
    bool _694 = !_546;
    float _696 = _694 ? (-0.5) : 0.5;
    float _698 = _672 * _644;
    float _700 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _686);
    float _702 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _684);
    float _706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _696);
    float _708 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _710 = -_674;
    float _712 = _409 + _710;
    bool _714 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _716 = isnan(0.5);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _722 = _718 || _720;
    float _724 = _702 * _706;
    float _726 = _708 * _704;
    float _728 = _726 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _730 = _726 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _732 = _726 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _734 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[24].x, _728);
    float _736 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[25].x, _730);
    float _738 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[26].x, _732);
    float _740 = -_466;
    float _742 = _740 + _488;
    float _744 = fma(_712, _742, _466);
    float _746 = -_464;
    float _748 = _746 + _486;
    float _750 = -_468;
    float _752 = _750 + _490;
    float _754 = _744 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _756 = fma(_712, _748, _464);
    float _758 = fma(_712, _752, _468);
    float _760 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _762 = _744 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _764 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[6].x, _754);
    float _766 = _690 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _768 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[24].z, _734);
    float _770 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[25].z, _736);
    float _772 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[4].x, _762);
    float _774 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[6].z, _764);
    float _776 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[26].z, _738);
    float _778 = _688 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _780 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[4].z, _772);
    float _782 = _766 + _774;
    float _784 = _776 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _786 = _700 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _788 = _778 + _780;
    float _790 = _768 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _792 = _782 + _784;
    float _794 = _770 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _796 = _788 + _790;
    float _798 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _800 = _792 + _798;
    float _802 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _804 = _796 + _802;
    float _806 = _800 * _800;
    float _808 = fma(_804, _804, _806);
    float _810 = _744 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _812 = sqrt(_808);
    float _814 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[5].x, _810);
    float _816 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[5].z, _814);
    float _818 = _786 + _816;
    float _820 = _818 + _794;
    bool _822 = _812 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _824 = _756;
    float _826 = _814;
    float _828 = _816;
    float _830 = _792;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _834 = _808;
    float _836 = _782;
    float _838 = 0.5;
    if (!_822)
    {
        _824 = _796;
    }
    float _840 = _824;
    float _842 = _840;
    if (!_822)
    {
        _826 = _792;
    }
    float _844 = _826;
    float _846 = _844;
    if (!_822)
    {
        _828 = _820;
    }
    float _848 = _828;
    bool _850 = !_822;
    float _852 = _848;
    if (!_850)
    {
        float _854 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _858 = _812 + _856;
        float _860 = rsqrt(_808);
        float _862 = _858 * _854;
        float _864 = _820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _866 = _862 * 0.15915493667125701904296875;
        float _868 = _866 * 6.283185482025146484375;
        float _870 = sin(_868);
        float _872 = _866 * 6.283185482025146484375;
        float _874 = cos(_872);
        float _876 = fma(_870, _864, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _878 = _860 * _876;
        float _880 = _874 + (-1.0);
        float _882 = fma(_804, _878, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _884 = fma(_800, _878, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _886 = _880 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = fma(_820, _874, _886);
        _842 = _882;
        _852 = _888;
        _846 = _884;
    }
    float _890 = _842;
    float _892 = _852;
    float _894 = _846;
    float _896 = _892;
    float _898 = _890;
    float _900 = _894;
    if (!_722)
    {
        float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _904 = _818 + _902;
        float _906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _908 = _788 + _906;
        float _910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _912 = -_788;
        float _914 = _912 + _890;
        float _916 = _904 * _904;
        float _918 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _920 = _782 + _918;
        float _922 = -_818;
        float _924 = _922 + _892;
        float _926 = fma(_908, _908, _916);
        float _928 = fma(_920, _920, _926);
        float _930 = sqrt(_928);
        float _932 = precise::min(_930, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _934 = _932 * _910;
        float _936 = -_782;
        float _938 = _936 + _894;
        float _940 = fma(_914, _934, _788);
        float _942 = fma(_924, _934, _818);
        float _944 = fma(_938, _934, _782);
        _896 = _942;
        _898 = _940;
        _900 = _944;
    }
    float _946 = _896;
    float _948 = _898;
    float _950 = _900;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _954 = _946 + _952;
    float _956 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _958 = _948 + _956;
    float _960 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _962 = _950 + _960;
    float _964 = _954 * _954;
    float _966 = fma(_958, _958, _964);
    float _968 = fma(_962, _962, _966);
    float _970 = rsqrt(_968);
    float _972 = _970 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _974 = _958 * _972;
    float _976 = _962 * _972;
    float _978 = _974 * _974;
    float _980 = _976 * _976;
    float _982 = _978 + _980;
    float _984 = sqrt(_982);
    bool _986 = _984 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _988 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _990 = _984 + _988;
    float _992 = _970;
    float _994 = _982;
    float _996 = _990;
    float _998 = _954;
    if (_986)
    {
        float _1000 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _992 = _1000;
    }
    float _1002 = _992;
    if (_986)
    {
        float _1004 = rsqrt(_982);
        _994 = _1004;
    }
    float _1006 = _994;
    float _1008 = _1006;
    if (_986)
    {
        float _1010 = _990 * _1002;
        _996 = _1010;
    }
    float _1012 = _996;
    if (_986)
    {
        float _1014 = _1012 * 0.15915493667125701904296875;
        _830 = _1014;
    }
    float _1016 = _830;
    float _1018 = _962;
    if (_986)
    {
        float _1020 = _1016 * 6.283185482025146484375;
        float _1022 = sin(_1020);
        _1018 = _1022;
    }
    float _1024 = _1018;
    float _1026 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1028 = precise::max(0.0, _1026);
    float _1030 = _1002;
    float _1032 = _1028;
    if (_986)
    {
        float _1034 = _1016 * 6.283185482025146484375;
        float _1036 = cos(_1034);
        _1030 = _1036;
    }
    float _1038 = _1030;
    float _1040 = -_972;
    float _1042 = -_1028;
    float _1044 = fma(_954, _1040, _1042);
    if (_986)
    {
        float _1046 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _998 = _1046;
    }
    float _1048 = _998;
    float _1050 = sqrt(_968);
    float _1052 = _1048;
    float _1054 = _1024;
    if (_986)
    {
        float _1056 = fma(_1024, _1048, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1052 = _1056;
    }
    float _1058 = _1052;
    float _1060 = _1058;
    if (!_986)
    {
        _1054 = _974;
    }
    float _1062 = _1054;
    float _1064 = _1062;
    float _1066 = _1038;
    if (_986)
    {
        float _1068 = _1038 + (-1.0);
        _1032 = _1068;
    }
    float _1070 = _1032;
    float _1072 = _1070;
    if (_986)
    {
        float _1074 = _1006 * _1058;
        _832 = _1074;
    }
    float _1076 = _832;
    if (!_986)
    {
        _1060 = _1044;
    }
    float _1078 = _1060;
    float _1080 = _1078;
    if (_986)
    {
        float _1082 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _834 = _1082;
    }
    float _1084 = _834;
    if (_986)
    {
        float _1086 = _974 * _1076;
        _1064 = _1086;
    }
    float _1088 = _1064;
    if (!_986)
    {
        _1072 = _976;
    }
    float _1090 = _1072;
    float _1092 = _1090;
    if (_986)
    {
        float _1094 = _976 * _1076;
        _1092 = _1094;
    }
    float _1096 = _1092;
    if (!_986)
    {
        _1008 = _978;
    }
    float _1098 = _1008;
    float _1100 = _1098;
    if (_986)
    {
        float _1102 = fma(_1044, _1038, _1084);
        _1080 = _1102;
    }
    float _1104 = _1080;
    if (_986)
    {
        float _1106 = _1088 * _1088;
        _1100 = _1106;
    }
    float _1108 = _1100;
    if (!_986)
    {
        _1066 = _980;
    }
    float _1110 = _1066;
    float _1112 = _1110;
    if (_986)
    {
        float _1114 = _1096 * _1096;
        _1112 = _1114;
    }
    float _1116 = _1112;
    float _1118 = fma(_1104, _1104, _1108);
    float _1120 = _946 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1122 = _1118 + _1116;
    float _1124 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1126 = fma(_1050, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1124);
    float _1128 = precise::clamp(_1126, 0.0, 1.0);
    float _1130 = _946 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1132 = _946 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1134 = rsqrt(_1122);
    float _1136 = -_1128;
    float _1138 = _1136 + 1.0;
    float _1140 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1130);
    float _1142 = _946 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1144 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1146 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1140);
    float _1148 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1132);
    float _1150 = abs(_1138);
    float _1152 = log2(_1150);
    float _1154 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1142);
    float _1156 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1120);
    float _1158 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1148);
    float _1160 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1162 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1154);
    float _1164 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1156);
    float _1166 = _1158 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1168 = _1134 * _1088;
    float _1170 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1172 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1176 = _1134 * _1104;
    float _1178 = _1168 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1180 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1182 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1174);
    float _1184 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1186 = _1134 * _1096;
    float _1188 = -_1178;
    float _1190 = fma(_1176, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1188);
    float _1192 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1182);
    float _1194 = -_1180;
    float _1196 = fma(_1194, _1144, 1.0);
    float _1198 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1200 = exp2(_1184);
    float _1202 = -_1186;
    float _1204 = fma(_1202, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1190);
    float _1206 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1192);
    float _1208 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1210 = fma(_1204, -0.5, 0.5);
    float _1212 = fma(_1204, 0.5, 0.5);
    float _1214 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1208);
    float _1216 = log2(_1196);
    float _1218 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1198);
    float _1220 = _1176 + 1.0;
    float _1222 = fma(_1212, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1224 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1214);
    float _1226 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1218);
    float _1228 = fma(_1212, _1222, -0.212114393711090087890625);
    float _1230 = 1.0 / _1206;
    float _1232 = -_1176;
    float _1234 = fma(_1200, _1220, _1232);
    float _1236 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1224);
    float _1238 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1226);
    float _1240 = fma(_1212, _1228, 1.570728778839111328125);
    float _1242 = fma(_1234, 0.5, 0.5);
    float _1244 = sqrt(_1210);
    float _1246 = _1216 * 0.693147182464599609375;
    float _1248 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1250 = _1236 * _1230;
    float _1252 = _1238 * _1230;
    float _1254 = fma(_1250, 0.5, 0.5);
    float _1256 = fma(_1252, -0.5, 0.5);
    float _1258 = _1244 * 0.636619746685028076171875;
    float3 _3340 = float3(_1254, _1256, _1248);
    float _1260 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3340, float3(0.0), isnan(_3340)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3340, float3(0.0), isnan(_3340)), level(0.0)).x;
    float _1262 = -_1240;
    float _1264 = fma(_1258, _1262, 1.0);
    float3 _3356 = float3(_1254, _1256, _1248);
    float4 _1266 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3356, float3(0.0), isnan(_3356)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3356, float3(0.0), isnan(_3356)), level(0.0)).xyzw;
    float _1268 = _1266.x;
    float _1270 = _1266.y;
    float _1272 = _1266.z;
    float _1274 = _1266.w;
    float2 _3373 = float2(_1264, _1242);
    float3 _1278 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3373, float2(0.0), isnan(_3373)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3373, float2(0.0), isnan(_3373)), level(0.0)).xyz;
    float _1280 = _1278.x;
    float _1282 = _1278.y;
    float _1284 = _1278.z;
    float _1286 = in.m_55.x;
    float _1288 = in.m_55.y;
    float _1290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1292 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1294 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1298 = _1296 != 0;
    float _1300 = -_470;
    float _1302 = _1300 + _492;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1306 = _1304 != 0;
    float _1308 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1294);
    float _1310 = exp2(_1292);
    float _1312 = fma(_712, _1302, _470);
    float _1314 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1308);
    float _1316 = _1236 + _1206;
    float _1318 = _1206 * 0.5;
    out.m_62.w = _1312;
    bool _1320 = _1288 > 0.5;
    bool _1322 = _1286 > 0.5;
    float _1324 = -_1310;
    float _1326 = _1324 + 1.0;
    float _1328 = -_684;
    int _1330 = _1320 ? as_type<int>(_1328) : as_type<int>(_684);
    float _1332 = -_696;
    int _1334 = _1322 ? as_type<int>(_1332) : as_type<int>(_696);
    float _1336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1338 = !_1298;
    float _1340 = _1338 ? _684 : as_type<float>(_1330);
    float _1342 = _818 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1344 = !_1306;
    float _1346 = _1344 ? _696 : as_type<float>(_1334);
    float _1348 = _1326 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1350 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1352 = isnan(0.5);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1358 = _1354 || _1356;
    float _1360 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1342);
    float _1362 = -_1340;
    float _1364 = _1362 + 0.5;
    float _1366 = _1346 + 0.5;
    float _1368 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1360);
    float _1370 = _818 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1372 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1374 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1376 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1378 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1370);
    float _1380 = _1372 * _1290;
    float _1382 = _1374 * _1336;
    float _1384 = 1.0 / _1376;
    float _1386 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1378);
    float _1388 = _1290;
    float _1390 = _1368;
    float _1392 = _1376;
    if (!_1358)
    {
        _836 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1394 = _836;
    float _1396 = _1394;
    if (!_1358)
    {
        _1388 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1398 = _1388;
    float _1400 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1358)
    {
        _838 = 1.0;
    }
    float _1402 = _838;
    out.m_64.x = _1380;
    out.m_64.y = _1382;
    float _1404 = _1400 + _1376;
    float _1406 = _1404 * _1384;
    float _1408 = _1406 * 0.5;
    float _1410 = _1408;
    float _1412 = _1402;
    if (!_1358)
    {
        float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1416 = fma(_1408, _1394, _1414);
        _1396 = _1416;
    }
    float _1418 = _1396;
    if (!_1358)
    {
        float _1420 = -_1398;
        float _1422 = _1420 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1410 = _1422;
    }
    float _1424 = _1410;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (!_1358)
    {
        float _1428 = 1.0 / _1424;
        _1390 = _1428;
    }
    float _1430 = _1390;
    out.m_66.w = _1426;
    float _1432 = _1418;
    if (!_1358)
    {
        float _1434 = 1.0 / _1418;
        _1432 = _1434;
    }
    float _1436 = _1432;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1440 = _1316 * 0.5;
    float _1442 = fma(_1238, -0.5, _1318);
    out.m_68.w = _1438;
    if (!_1358)
    {
        float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1446 = -_1398;
        float _1448 = fma(_1436, _1444, _1446);
        _1392 = _1448;
    }
    float _1450 = _1392;
    float _1452 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1314);
    if (!_1358)
    {
        float _1454 = _1450 * _1430;
        float _1456 = precise::clamp(_1454, 0.0, 1.0);
        _1412 = _1456;
    }
    float _1458 = _1412;
    float _1460 = _1452 + _1206;
    out.gl_Position.x = _1236;
    out.gl_Position.y = _1238;
    out.gl_Position.z = _1452;
    out.gl_Position.w = _1206;
    float _1462 = _1458 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1464 = _1458 > 0.0;
    bool _1466 = isnan(_1458);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan(0.0);
    bool _1472 = _1468 || _1470;
    float _1474 = -_1348;
    float _1476 = _1474 + 1.0;
    float _1478 = _1460 * 0.5;
    float _1480 = _1462 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.x = _1440;
    out.m_70.y = _1442;
    out.m_70.z = _1478;
    out.m_70.w = _1206;
    out.m_49.x = _1480;
    float _1482 = _1348 * _1260;
    float _1484 = _1274 * _1482;
    float _1486 = _1284 * _1482;
    float _1488 = fma(_1280, _1484, _1268);
    float _1490 = fma(_1282, _1484, _1270);
    float _1492 = _1274 * _1476;
    float _1494 = fma(_1274, _1486, _1272);
    out.m_72.x = _1488;
    out.m_72.y = _1490;
    out.m_72.z = _1494;
    out.m_72.w = _1492;
    if (_1472)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _1496 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1496;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_46.w;
    float _92 = trunc(_90);
    int _94 = int(_92);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_49.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1553 = as_type<float>(_110);
        out.gl_Position.z = _1553;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _114 = in.m_51.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_124)
    {
        float _130 = float(_94);
        _104 = _130;
    }
    float _132 = _104;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_49.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1622 = as_type<float>(_146);
        out.gl_Position.z = _1622;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_53.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_51.x;
    float _164 = in.m_51.y;
    float _166 = in.m_51.z;
    float _168 = in.m_46.x;
    float _170 = in.m_46.y;
    float _172 = in.m_46.z;
    float _174 = 0.0;
    float _176 = _150;
    if (!_160)
    {
        float _178 = _150 * _150;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = _182;
    if (!_160)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_160;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _150 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _150);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_160;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _150 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _176 = _246;
    }
    float _248 = _176;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _162, _252);
    float _260 = fma(_248, _164, _254);
    float _262 = fma(_248, _166, _256);
    float _264 = fma(_258, _148, _168);
    float _266 = fma(_260, _148, _170);
    float _268 = fma(_262, _148, _172);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_55.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_94);
        float _294 = 1.0 / _292;
        float _296 = _128 * _294;
        _288 = _296;
    }
    _290 = false;
    float _298 = _288;
    int _300 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _302 = _300;
    int _304 = 0;
    int _306 = _85(_302, _304, (*spvDescriptorSet0.support_buffer));
    int _308 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).y;
    int _310 = _308;
    int _312 = 0;
    int _314 = _85(_310, _312, (*spvDescriptorSet0.support_buffer));
    float _316 = in.m_57.w;
    float _318 = _128 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _320 = trunc(_316);
    int _322 = int(_320);
    int _324 = abs(_322);
    uint _327 = uint(int(uint(_322) >> uint(31)));
    float _329 = float(uint(_324));
    int _331 = ~int(_327);
    int _333 = _331 + 1;
    float _335 = float(_314);
    float _337 = float(_306);
    float _339 = trunc(_335);
    int _341 = int(_339);
    float _343 = _337 + 9.9999997473787516355514526367188e-06;
    int _345 = abs(_341);
    bool _347 = _341 == 0;
    float _349 = float(uint(_345));
    int _351 = ~_345;
    int _353 = _351 + 1;
    int _355 = ~_345;
    int _357 = _355 + 1;
    float _359 = 1.0 / _349;
    int _361 = as_type<int>(_359) + (-2);
    float _363 = 1.0 / _343;
    float _365 = as_type<float>(_361) * _329;
    float _367 = trunc(_365);
    float _369 = precise::max(_367, 0.0);
    uint _371 = uint(_369);
    float _373 = fma(_318, _363, 9.9999997473787516355514526367188e-06);
    float _375 = floor(_373);
    int _377 = _353 * int(_371);
    int _379 = _377 + _324;
    float _381 = float(uint(_379));
    float _383 = as_type<float>(_361) * _381;
    float _385 = trunc(_383);
    float _387 = precise::max(_385, 0.0);
    uint _389 = uint(_387);
    int _391 = int(_371) + int(_389);
    float _393 = _337 + (-1.0);
    int _395 = _357 * _391;
    int _397 = _395 + _324;
    float _399 = -_375;
    float _401 = _373 + _399;
    float _403 = trunc(_393);
    int _405 = int(_403);
    bool _407 = uint(_397) >= uint(_345);
    float _409 = _337 * _401;
    bool _411 = !_407;
    int _413 = _411 ? 0 : (-1);
    float _415 = trunc(_409);
    int _417 = int(_415);
    int _419 = ~_391;
    int _421 = _419 + _413;
    int _423 = _421 + 1;
    int _425 = _345 * _423;
    int _427 = _425 + _324;
    int _429 = _427 ^ _333;
    bool _431 = _417 >= _405;
    int _433 = ~_333;
    int _435 = _433 + _429;
    int _437 = _435 + 1;
    int _439 = _417 + 1;
    bool _441 = !_347;
    int _443 = _441 ? _437 : (-1);
    bool _445 = !_431;
    int _447 = _445 ? _439 : 0;
    int _449 = _417;
    int _451 = 0;
    int _453 = _86(_449, _451, (*spvDescriptorSet0.support_buffer));
    int _455 = _443;
    int _457 = 0;
    int _459 = _86(_455, _457, (*spvDescriptorSet0.support_buffer));
    float4 _462 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_453, _459)), 0).xyzw;
    float _464 = _462.x;
    float _466 = _462.y;
    float _468 = _462.z;
    float _470 = _462.w;
    int _472 = _447;
    int _474 = 0;
    int _476 = _86(_472, _474, (*spvDescriptorSet0.support_buffer));
    int _478 = _443;
    int _480 = 0;
    int _482 = _86(_478, _480, (*spvDescriptorSet0.support_buffer));
    float4 _484 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_476, _482)), 0).xyzw;
    float _486 = _484.x;
    float _488 = _484.y;
    float _490 = _484.z;
    float _492 = _484.w;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _496 = _298 + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _500 = _298 + _498;
    bool _502 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _504 = isnan(_298);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _522;
    float _526 = as_type<float>(int(gl_VertexIndex));
    float _528 = 1.0 / _516;
    float _530 = 1.0 / _520;
    float _532 = 1.0 / _524;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _536 = _298 + _534;
    float _538 = _500 * _528;
    float _540 = -_512;
    float _542 = _540 + 1.0;
    int _544 = as_type<int>(_526) & 1;
    bool _546 = _544 != 0;
    int _548 = as_type<int>(_526) & 2;
    bool _550 = _548 != 0;
    float _552 = _496 * _530;
    bool _554 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _556 = isnan(_298);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    bool _566 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _568 = isnan(_298);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    bool _578 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _580 = isnan(_298);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = _536 * _532;
    float _592 = -_576;
    float _594 = _592 + 1.0;
    float _596 = -_588;
    float _598 = _596 + 1.0;
    float _600 = _588 * _542;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _606;
    float _610 = _576 * _598;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _620 = fma(_604, _538, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _622 = _564 * _594;
    float _624 = fma(_608, _538, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _626 = fma(_614, _552, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _628 = fma(_618, _552, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _630 = _620 * _622;
    float _632 = -_564;
    float _634 = _632 + 1.0;
    float _636 = _624 * _622;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _638;
    float _642 = in.m_53.x;
    float _644 = in.m_53.y;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _646;
    float _650 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].x, _630);
    float _652 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[143].y, _636);
    float _654 = fma(_640, _590, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _656 = fma(_648, _590, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _658 = fma(_626, _610, _650);
    float _660 = fma(_628, _610, _652);
    float _662 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _664 = fma(_656, _600, _658);
    float _666 = fma(_654, _600, _660);
    float _668 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _670 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[146].x, _664);
    float _672 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[146].y, _666);
    float _674 = floor(_409);
    float _676 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _678 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _662);
    float _680 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _668);
    bool _682 = !_550;
    float _684 = _682 ? (-0.5) : 0.5;
    float _686 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _676);
    float _688 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _678);
    float _690 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _680);
    float _692 = _670 * _642;
    bool _694 = !_546;
    float _696 = _694 ? (-0.5) : 0.5;
    float _698 = _672 * _644;
    float _700 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _686);
    float _702 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _684);
    float _706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _696);
    float _708 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _710 = -_674;
    float _712 = _409 + _710;
    bool _714 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _716 = isnan(0.5);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _722 = _718 || _720;
    float _724 = _702 * _706;
    float _726 = _708 * _704;
    float _728 = _726 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _730 = _726 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _732 = _726 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _734 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[24].x, _728);
    float _736 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[25].x, _730);
    float _738 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[26].x, _732);
    float _740 = -_466;
    float _742 = _740 + _488;
    float _744 = fma(_712, _742, _466);
    float _746 = -_464;
    float _748 = _746 + _486;
    float _750 = -_468;
    float _752 = _750 + _490;
    float _754 = _744 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _756 = fma(_712, _748, _464);
    float _758 = fma(_712, _752, _468);
    float _760 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _762 = _744 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _764 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[6].x, _754);
    float _766 = _690 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _768 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[24].z, _734);
    float _770 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[25].z, _736);
    float _772 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[4].x, _762);
    float _774 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[6].z, _764);
    float _776 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[26].z, _738);
    float _778 = _688 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _780 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[4].z, _772);
    float _782 = _766 + _774;
    float _784 = _776 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _786 = _700 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _788 = _778 + _780;
    float _790 = _768 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _792 = _782 + _784;
    float _794 = _770 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _796 = _788 + _790;
    float _798 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _800 = _792 + _798;
    float _802 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _804 = _796 + _802;
    float _806 = _800 * _800;
    float _808 = fma(_804, _804, _806);
    float _810 = _744 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _812 = sqrt(_808);
    float _814 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[5].x, _810);
    float _816 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[5].z, _814);
    float _818 = _786 + _816;
    float _820 = _818 + _794;
    bool _822 = _812 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _824 = _756;
    float _826 = _814;
    float _828 = _816;
    float _830 = _792;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _834 = _808;
    float _836 = _782;
    float _838 = 0.5;
    if (!_822)
    {
        _824 = _796;
    }
    float _840 = _824;
    float _842 = _840;
    if (!_822)
    {
        _826 = _792;
    }
    float _844 = _826;
    float _846 = _844;
    if (!_822)
    {
        _828 = _820;
    }
    float _848 = _828;
    bool _850 = !_822;
    float _852 = _848;
    if (!_850)
    {
        float _854 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _858 = _812 + _856;
        float _860 = rsqrt(_808);
        float _862 = _858 * _854;
        float _864 = _820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _866 = _862 * 0.15915493667125701904296875;
        float _868 = _866 * 6.283185482025146484375;
        float _870 = sin(_868);
        float _872 = _866 * 6.283185482025146484375;
        float _874 = cos(_872);
        float _876 = fma(_870, _864, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _878 = _860 * _876;
        float _880 = _874 + (-1.0);
        float _882 = fma(_804, _878, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _884 = fma(_800, _878, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _886 = _880 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = fma(_820, _874, _886);
        _842 = _882;
        _852 = _888;
        _846 = _884;
    }
    float _890 = _842;
    float _892 = _852;
    float _894 = _846;
    float _896 = _892;
    float _898 = _890;
    float _900 = _894;
    if (!_722)
    {
        float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _904 = _818 + _902;
        float _906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _908 = _788 + _906;
        float _910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _912 = -_788;
        float _914 = _912 + _890;
        float _916 = _904 * _904;
        float _918 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _920 = _782 + _918;
        float _922 = -_818;
        float _924 = _922 + _892;
        float _926 = fma(_908, _908, _916);
        float _928 = fma(_920, _920, _926);
        float _930 = sqrt(_928);
        float _932 = precise::min(_930, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _934 = _932 * _910;
        float _936 = -_782;
        float _938 = _936 + _894;
        float _940 = fma(_914, _934, _788);
        float _942 = fma(_924, _934, _818);
        float _944 = fma(_938, _934, _782);
        _896 = _942;
        _898 = _940;
        _900 = _944;
    }
    float _946 = _896;
    float _948 = _898;
    float _950 = _900;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _954 = _946 + _952;
    float _956 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _958 = _948 + _956;
    float _960 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _962 = _950 + _960;
    float _964 = _954 * _954;
    float _966 = fma(_958, _958, _964);
    float _968 = fma(_962, _962, _966);
    float _970 = rsqrt(_968);
    float _972 = _970 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _974 = _958 * _972;
    float _976 = _962 * _972;
    float _978 = _974 * _974;
    float _980 = _976 * _976;
    float _982 = _978 + _980;
    float _984 = sqrt(_982);
    bool _986 = _984 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _988 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _990 = _984 + _988;
    float _992 = _970;
    float _994 = _982;
    float _996 = _990;
    float _998 = _954;
    if (_986)
    {
        float _1000 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _992 = _1000;
    }
    float _1002 = _992;
    if (_986)
    {
        float _1004 = rsqrt(_982);
        _994 = _1004;
    }
    float _1006 = _994;
    float _1008 = _1006;
    if (_986)
    {
        float _1010 = _990 * _1002;
        _996 = _1010;
    }
    float _1012 = _996;
    if (_986)
    {
        float _1014 = _1012 * 0.15915493667125701904296875;
        _830 = _1014;
    }
    float _1016 = _830;
    float _1018 = _962;
    if (_986)
    {
        float _1020 = _1016 * 6.283185482025146484375;
        float _1022 = sin(_1020);
        _1018 = _1022;
    }
    float _1024 = _1018;
    float _1026 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1028 = precise::max(0.0, _1026);
    float _1030 = _1002;
    float _1032 = _1028;
    if (_986)
    {
        float _1034 = _1016 * 6.283185482025146484375;
        float _1036 = cos(_1034);
        _1030 = _1036;
    }
    float _1038 = _1030;
    float _1040 = -_972;
    float _1042 = -_1028;
    float _1044 = fma(_954, _1040, _1042);
    if (_986)
    {
        float _1046 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _998 = _1046;
    }
    float _1048 = _998;
    float _1050 = sqrt(_968);
    float _1052 = _1048;
    float _1054 = _1024;
    if (_986)
    {
        float _1056 = fma(_1024, _1048, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1052 = _1056;
    }
    float _1058 = _1052;
    float _1060 = _1058;
    if (!_986)
    {
        _1054 = _974;
    }
    float _1062 = _1054;
    float _1064 = _1062;
    float _1066 = _1038;
    if (_986)
    {
        float _1068 = _1038 + (-1.0);
        _1032 = _1068;
    }
    float _1070 = _1032;
    float _1072 = _1070;
    if (_986)
    {
        float _1074 = _1006 * _1058;
        _832 = _1074;
    }
    float _1076 = _832;
    if (!_986)
    {
        _1060 = _1044;
    }
    float _1078 = _1060;
    float _1080 = _1078;
    if (_986)
    {
        float _1082 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _834 = _1082;
    }
    float _1084 = _834;
    if (_986)
    {
        float _1086 = _974 * _1076;
        _1064 = _1086;
    }
    float _1088 = _1064;
    if (!_986)
    {
        _1072 = _976;
    }
    float _1090 = _1072;
    float _1092 = _1090;
    if (_986)
    {
        float _1094 = _976 * _1076;
        _1092 = _1094;
    }
    float _1096 = _1092;
    if (!_986)
    {
        _1008 = _978;
    }
    float _1098 = _1008;
    float _1100 = _1098;
    if (_986)
    {
        float _1102 = fma(_1044, _1038, _1084);
        _1080 = _1102;
    }
    float _1104 = _1080;
    if (_986)
    {
        float _1106 = _1088 * _1088;
        _1100 = _1106;
    }
    float _1108 = _1100;
    if (!_986)
    {
        _1066 = _980;
    }
    float _1110 = _1066;
    float _1112 = _1110;
    if (_986)
    {
        float _1114 = _1096 * _1096;
        _1112 = _1114;
    }
    float _1116 = _1112;
    float _1118 = fma(_1104, _1104, _1108);
    float _1120 = _946 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1122 = _1118 + _1116;
    float _1124 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1126 = fma(_1050, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1124);
    float _1128 = precise::clamp(_1126, 0.0, 1.0);
    float _1130 = _946 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1132 = _946 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1134 = rsqrt(_1122);
    float _1136 = -_1128;
    float _1138 = _1136 + 1.0;
    float _1140 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1130);
    float _1142 = _946 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1144 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1146 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1140);
    float _1148 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1132);
    float _1150 = abs(_1138);
    float _1152 = log2(_1150);
    float _1154 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1142);
    float _1156 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1120);
    float _1158 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1148);
    float _1160 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1162 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1154);
    float _1164 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1156);
    float _1166 = _1158 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1168 = _1134 * _1088;
    float _1170 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1172 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1176 = _1134 * _1104;
    float _1178 = _1168 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1180 = _1160 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1182 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1174);
    float _1184 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1186 = _1134 * _1096;
    float _1188 = -_1178;
    float _1190 = fma(_1176, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1188);
    float _1192 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1182);
    float _1194 = -_1180;
    float _1196 = fma(_1194, _1144, 1.0);
    float _1198 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1200 = exp2(_1184);
    float _1202 = -_1186;
    float _1204 = fma(_1202, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1190);
    float _1206 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1192);
    float _1208 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1210 = fma(_1204, -0.5, 0.5);
    float _1212 = fma(_1204, 0.5, 0.5);
    float _1214 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1208);
    float _1216 = log2(_1196);
    float _1218 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1198);
    float _1220 = _1176 + 1.0;
    float _1222 = fma(_1212, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1224 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1214);
    float _1226 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1218);
    float _1228 = fma(_1212, _1222, -0.212114393711090087890625);
    float _1230 = 1.0 / _1206;
    float _1232 = -_1176;
    float _1234 = fma(_1200, _1220, _1232);
    float _1236 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1224);
    float _1238 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1226);
    float _1240 = fma(_1212, _1228, 1.570728778839111328125);
    float _1242 = fma(_1234, 0.5, 0.5);
    float _1244 = sqrt(_1210);
    float _1246 = _1216 * 0.693147182464599609375;
    float _1248 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1250 = _1236 * _1230;
    float _1252 = _1238 * _1230;
    float _1254 = fma(_1250, 0.5, 0.5);
    float _1256 = fma(_1252, -0.5, 0.5);
    float _1258 = _1244 * 0.636619746685028076171875;
    float3 _3340 = float3(_1254, _1256, _1248);
    float _1260 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3340, float3(0.0), isnan(_3340)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3340, float3(0.0), isnan(_3340)), level(0.0)).x;
    float _1262 = -_1240;
    float _1264 = fma(_1258, _1262, 1.0);
    float3 _3356 = float3(_1254, _1256, _1248);
    float4 _1266 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3356, float3(0.0), isnan(_3356)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3356, float3(0.0), isnan(_3356)), level(0.0)).xyzw;
    float _1268 = _1266.x;
    float _1270 = _1266.y;
    float _1272 = _1266.z;
    float _1274 = _1266.w;
    float2 _3373 = float2(_1264, _1242);
    float3 _1278 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3373, float2(0.0), isnan(_3373)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3373, float2(0.0), isnan(_3373)), level(0.0)).xyz;
    float _1280 = _1278.x;
    float _1282 = _1278.y;
    float _1284 = _1278.z;
    float _1286 = in.m_55.x;
    float _1288 = in.m_55.y;
    float _1290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1292 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1294 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1298 = _1296 != 0;
    float _1300 = -_470;
    float _1302 = _1300 + _492;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1306 = _1304 != 0;
    float _1308 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1294);
    float _1310 = exp2(_1292);
    float _1312 = fma(_712, _1302, _470);
    float _1314 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1308);
    float _1316 = _1236 + _1206;
    float _1318 = _1206 * 0.5;
    out.m_62.w = _1312;
    bool _1320 = _1288 > 0.5;
    bool _1322 = _1286 > 0.5;
    float _1324 = -_1310;
    float _1326 = _1324 + 1.0;
    float _1328 = -_684;
    int _1330 = _1320 ? as_type<int>(_1328) : as_type<int>(_684);
    float _1332 = -_696;
    int _1334 = _1322 ? as_type<int>(_1332) : as_type<int>(_696);
    float _1336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1338 = !_1298;
    float _1340 = _1338 ? _684 : as_type<float>(_1330);
    float _1342 = _818 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1344 = !_1306;
    float _1346 = _1344 ? _696 : as_type<float>(_1334);
    float _1348 = _1326 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1350 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1352 = isnan(0.5);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1358 = _1354 || _1356;
    float _1360 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1342);
    float _1362 = -_1340;
    float _1364 = _1362 + 0.5;
    float _1366 = _1346 + 0.5;
    float _1368 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1360);
    float _1370 = _818 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1372 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1374 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1376 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1378 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1370);
    float _1380 = _1372 * _1290;
    float _1382 = _1374 * _1336;
    float _1384 = 1.0 / _1376;
    float _1386 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1378);
    float _1388 = _1290;
    float _1390 = _1368;
    float _1392 = _1376;
    if (!_1358)
    {
        _836 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1394 = _836;
    float _1396 = _1394;
    if (!_1358)
    {
        _1388 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1398 = _1388;
    float _1400 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1358)
    {
        _838 = 1.0;
    }
    float _1402 = _838;
    out.m_64.x = _1380;
    out.m_64.y = _1382;
    float _1404 = _1400 + _1376;
    float _1406 = _1404 * _1384;
    float _1408 = _1406 * 0.5;
    float _1410 = _1408;
    float _1412 = _1402;
    if (!_1358)
    {
        float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1416 = fma(_1408, _1394, _1414);
        _1396 = _1416;
    }
    float _1418 = _1396;
    if (!_1358)
    {
        float _1420 = -_1398;
        float _1422 = _1420 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1410 = _1422;
    }
    float _1424 = _1410;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (!_1358)
    {
        float _1428 = 1.0 / _1424;
        _1390 = _1428;
    }
    float _1430 = _1390;
    out.m_66.w = _1426;
    float _1432 = _1418;
    if (!_1358)
    {
        float _1434 = 1.0 / _1418;
        _1432 = _1434;
    }
    float _1436 = _1432;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1440 = _1316 * 0.5;
    float _1442 = fma(_1238, -0.5, _1318);
    out.m_68.w = _1438;
    if (!_1358)
    {
        float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1446 = -_1398;
        float _1448 = fma(_1436, _1444, _1446);
        _1392 = _1448;
    }
    float _1450 = _1392;
    float _1452 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1314);
    if (!_1358)
    {
        float _1454 = _1450 * _1430;
        float _1456 = precise::clamp(_1454, 0.0, 1.0);
        _1412 = _1456;
    }
    float _1458 = _1412;
    float _1460 = _1452 + _1206;
    out.gl_Position.x = _1236;
    out.gl_Position.y = _1238;
    out.gl_Position.z = _1452;
    out.gl_Position.w = _1206;
    float _1462 = _1458 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1464 = _1458 > 0.0;
    bool _1466 = isnan(_1458);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan(0.0);
    bool _1472 = _1468 || _1470;
    float _1474 = -_1348;
    float _1476 = _1474 + 1.0;
    float _1478 = _1460 * 0.5;
    float _1480 = _1462 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.x = _1440;
    out.m_70.y = _1442;
    out.m_70.z = _1478;
    out.m_70.w = _1206;
    out.m_49.x = _1480;
    float _1482 = _1348 * _1260;
    float _1484 = _1274 * _1482;
    float _1486 = _1284 * _1482;
    float _1488 = fma(_1280, _1484, _1268);
    float _1490 = fma(_1282, _1484, _1270);
    float _1492 = _1274 * _1476;
    float _1494 = fma(_1274, _1486, _1272);
    out.m_72.x = _1488;
    out.m_72.y = _1490;
    out.m_72.z = _1494;
    out.m_72.w = _1492;
    if (_1472)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _1496 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1496;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

