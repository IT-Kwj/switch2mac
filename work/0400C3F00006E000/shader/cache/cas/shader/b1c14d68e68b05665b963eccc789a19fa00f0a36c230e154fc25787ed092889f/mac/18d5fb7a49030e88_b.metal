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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_14 [[id(8)]];
    sampler vp_t_tcb_14Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_14Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_72 [[user(locn0)]];
    float4 m_84 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_94 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_70 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3949 = false;
    bool _351 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_59.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4254 = as_type<float>(_129);
        out.gl_Position.z = _4254;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_61.w;
    float _135 = in.m_63.x;
    bool _137 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_133);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_133;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_65.x = _135;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_113);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _123;
    if (_163)
    {
        out.m_59.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _131 = as_type<int>(_167);
    }
    int _169 = _131;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4327 = as_type<float>(_169);
        out.gl_Position.z = _4327;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = in.m_70.w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_61.x;
    float _189 = in.m_61.y;
    float _191 = in.m_61.z;
    float _193 = in.m_56.x;
    float _195 = in.m_56.y;
    float _197 = in.m_56.z;
    float _199 = 0.0;
    if (!_185)
    {
        float _201 = _173 * _173;
        float _203 = _201 * 0.5;
        _199 = _203;
    }
    float _205 = _199;
    float _207 = _205;
    if (!_185)
    {
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    int _213 = as_type<int>(_171) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_171) & 2;
    bool _219 = _217 != 0;
    bool _221 = !_215;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_219;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_185;
    float _231 = _211;
    if (!_229)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = _173 * _235;
        float _245 = 1.0 / _239;
        float _247 = _241 * 0.693147182464599609375;
        float _249 = exp2(_243);
        float _251 = 1.0 / _247;
        float _253 = _249 + (-1.0);
        float _255 = -_253;
        float _257 = fma(_255, _251, _173);
        float _259 = _257 * _245;
        float _261 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _261;
    }
    float _263 = _231;
    float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _271 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _273 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _275 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _277 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[8].x, _271);
    float _279 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[8].y, _273);
    float _281 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[8].z, _275);
    float _283 = _273;
    if (!_185)
    {
        _283 = _173;
    }
    float _285 = _283;
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[10].x, _277);
    bool _289 = !_185;
    float _291 = _285;
    if (!_289)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = 1.0 / _299;
        float _303 = _173 * _295;
        float _305 = exp2(_303);
        float _307 = -_305;
        float _309 = _307 + 1.0;
        float _311 = _309 * _301;
        _291 = _311;
    }
    float _313 = _291;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _317 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[10].y, _279);
    float _319 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[10].z, _281);
    float _321 = fma(_313, _187, _287);
    float _323 = fma(_313, _189, _317);
    float _325 = fma(_313, _191, _319);
    float _327 = fma(_321, _175, _193);
    float _329 = fma(_323, _175, _195);
    float _331 = fma(_325, _175, _197);
    bool _333 = !_315;
    float _349;
    if (!_333)
    {
        float _335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _337 = _135 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _341 = _339 * _335;
        float _343 = floor(_341);
        float _345 = -_343;
        float _347 = _341 + _345;
        _349 = _347;
        _351 = true;
    }
    else
    {
        float _353 = float(_113);
        float _355 = 1.0 / _353;
        float _357 = _149 * _355;
        _349 = _357;
    }
    _351 = false;
    float _359 = _349;
    float _361 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _363 = int(_361);
    float _365 = float(_113);
    float _367 = _329 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _369 = _329 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _371 = _329 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _373 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[5].x, _367);
    float _375 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[4].x, _369);
    float _377 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _379 = int(_377);
    float _381 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[6].x, _371);
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _385 = float(_363);
    float _387 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _389 = int(_387);
    float _391 = float(uint(_379));
    float _393 = 1.0 / _385;
    int _395 = ~_379;
    int _397 = _395 + 1;
    float _399 = float(_379);
    bool _401 = _379 == 0;
    float _403 = 1.0 / _391;
    float _405 = float(_389);
    float _407 = _393 * _149;
    int _409 = ~_379;
    int _411 = _409 + 1;
    float _413 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _415 = int(_413);
    int _417 = as_type<int>(_403) + (-2);
    float _419 = trunc(_407);
    int _421 = int(_419);
    float _423 = 1.0 / _405;
    float _425 = float(uint(_415));
    int _427 = ~_415;
    int _429 = _427 + 1;
    int _431 = ~_415;
    int _433 = _431 + 1;
    float _435 = float(uint(_421));
    float _437 = 1.0 / _425;
    float _439 = as_type<float>(_417) * _435;
    float _441 = _423 * _149;
    float _443 = 1.0 / _365;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _447 = _445 != 0;
    float _449 = trunc(_439);
    float _451 = precise::max(_449, 0.0);
    uint _454 = uint(_451);
    float _456 = _405;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_447)
    {
        _456 = 1.0;
    }
    float _460 = _456;
    float _462 = trunc(_441);
    int _464 = int(_462);
    float _466 = _460;
    if (!_447)
    {
        _466 = 7.345489978790283203125;
    }
    float _468 = _466;
    float _470 = _468 * _135;
    int _472 = _411 * int(_454);
    int _474 = _472 + _421;
    float _476 = float(uint(_474));
    int _478 = as_type<int>(_437) + (-2);
    float _480 = float(uint(_464));
    float _482 = as_type<float>(_417) * _476;
    float _484 = floor(_470);
    float _486 = as_type<float>(_478) * _480;
    float _488 = trunc(_482);
    float _490 = precise::max(_488, 0.0);
    uint _492 = uint(_490);
    float _494 = trunc(_486);
    float _496 = precise::max(_494, 0.0);
    uint _498 = uint(_496);
    float _500 = -_484;
    float _502 = _470 + _500;
    int _504 = int(_454) + int(_492);
    float _506 = float(_421);
    int _508 = _397 * _504;
    int _510 = _508 + _421;
    bool _512 = _506 >= _399;
    bool _514 = isnan(_506);
    bool _516 = _512 || _514;
    bool _518 = isnan(_399);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    int _524 = _429 * int(_498);
    int _526 = _524 + _464;
    bool _528 = uint(_510) >= uint(_379);
    float _530 = trunc(_522);
    int _532 = int(_530);
    float _534 = float(uint(_526));
    bool _536 = !_528;
    int _538 = _536 ? 0 : (-1);
    float _540 = as_type<float>(_478) * _534;
    int _542 = ~_504;
    int _544 = _542 + _538;
    int _546 = _544 + 1;
    float _548 = _502 * _399;
    float _550 = in.m_63.y;
    int _552 = _379 * _546;
    int _554 = _552 + _421;
    float _556 = trunc(_540);
    float _558 = precise::max(_556, 0.0);
    uint _560 = uint(_558);
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _568 = _566 != 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _572 = _570 != 0;
    int _574 = ~_532;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    bool _580 = !_401;
    int _582 = _580 ? _554 : (-1);
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _586 = _584 != 0;
    float _588 = trunc(_548);
    int _590 = int(_588);
    int _592 = _379 + (-1);
    int _594 = _582 * _578;
    bool _596 = !_568;
    int _598 = _596 ? 0 : 1;
    float _600 = _443 * _149;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _604 = _602 != 0;
    int _606 = _532 * _592;
    int _608 = _606 + _594;
    bool _610 = !_586;
    int _612 = _610 ? 0 : 1;
    float _614 = _399 * _600;
    int _616 = abs(_598);
    int _618 = abs(_612);
    float _620 = trunc(_614);
    int _622 = int(_620);
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _626 = _624 != 0;
    int _628 = _590 * _618;
    int _630 = _628 + _421;
    int _632 = int(_498) + int(_560);
    int _634 = _608 * _616;
    float _636 = as_type<float>(_546);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_604)
    {
        _636 = _135;
    }
    float _640 = _636;
    float _642 = _640;
    if (_604)
    {
        _458 = 1.0;
    }
    float _644 = _458;
    float _646 = _644;
    if (!_604)
    {
        _642 = _550;
    }
    float _648 = _642;
    if (!_604)
    {
        _646 = 1.2345600128173828125;
    }
    float _650 = _646;
    int _652 = ~_415;
    int _654 = _652 + 1;
    float _656 = float(_415);
    float _658 = _648 * _650;
    bool _660 = !_564;
    int _662 = _660 ? 0 : 1;
    bool _664 = !_572;
    int _666 = _664 ? 0 : 1;
    float _668 = floor(_658);
    int _670 = abs(_662);
    bool _672 = !_626;
    int _674 = _672 ? 0 : 1;
    int _676 = abs(_666);
    int _678 = _622 * _670;
    int _680 = _678 + _634;
    int _682 = abs(_674);
    int _684 = _654 * _632;
    int _686 = _684 + _464;
    float _688 = float(_464);
    int _690 = _630 * _676;
    int _692 = _690 + _680;
    bool _694 = _688 >= _656;
    bool _696 = isnan(_688);
    bool _698 = _694 || _696;
    bool _700 = isnan(_656);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -_668;
    float _708 = _658 + _706;
    bool _710 = uint(_686) >= uint(_415);
    int _712 = _590 * _682;
    int _714 = _712 + _692;
    bool _716 = _415 == 0;
    float _718 = _708 * _656;
    float _720 = trunc(_704);
    int _722 = int(_720);
    bool _724 = !_710;
    int _726 = _724 ? 0 : (-1);
    float _728 = _656 * _600;
    float _730 = float(uint(_714));
    int _732 = ~_632;
    int _734 = _732 + _726;
    int _736 = _734 + 1;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _740 = _738 != 0;
    float _742 = trunc(_718);
    int _744 = int(_742);
    float _746 = as_type<float>(_417) * _730;
    int _748 = _415 * _736;
    int _750 = _748 + _464;
    bool _752 = !_740;
    int _754 = _752 ? 0 : 1;
    int _756 = ~_379;
    int _758 = _756 + 1;
    bool _760 = !_716;
    int _762 = _760 ? _750 : (-1);
    float _764 = trunc(_746);
    float _766 = precise::max(_764, 0.0);
    uint _768 = uint(_766);
    int _770 = ~_722;
    int _772 = _770 + 1;
    int _774 = _772 + 1;
    int _776 = abs(_754);
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _780 = _778 != 0;
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _784 = _782 != 0;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _788 = _786 != 0;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _792 = _790 != 0;
    int _794 = _762 * _774;
    int _796 = _415 + (-1);
    float _798 = trunc(_728);
    int _800 = int(_798);
    int _802 = _744 * _776;
    int _804 = _802 + _464;
    bool _806 = !_784;
    int _808 = _806 ? 0 : 1;
    int _810 = _722 * _796;
    int _812 = _810 + _794;
    bool _814 = !_780;
    int _816 = _814 ? 0 : 1;
    int _818 = abs(_808);
    int _820 = _758 * int(_768);
    int _822 = _820 + _714;
    bool _824 = !_788;
    int _826 = _824 ? 0 : 1;
    int _828 = abs(_816);
    float _830 = float(uint(_822));
    int _832 = abs(_826);
    int _834 = _812 * _818;
    float _836 = as_type<float>(_417) * _830;
    bool _838 = !_792;
    int _840 = _838 ? 0 : 1;
    int _842 = _800 * _828;
    int _844 = _842 + _834;
    float _846 = float(uint(_630));
    float _848 = trunc(_836);
    float _850 = precise::max(_848, 0.0);
    uint _852 = uint(_850);
    int _854 = abs(_840);
    int _856 = _804 * _832;
    int _858 = _856 + _844;
    int _860 = ~_379;
    int _862 = _860 + 1;
    float _864 = as_type<float>(_417) * _846;
    bool _866 = _379 == 0;
    int _868 = _744 * _854;
    int _870 = _868 + _858;
    int _872 = ~_379;
    int _874 = _872 + 1;
    float _876 = trunc(_864);
    float _878 = precise::max(_876, 0.0);
    uint _880 = uint(_878);
    float _882 = float(uint(_804));
    float _884 = float(uint(_870));
    float _886 = as_type<float>(_478) * _882;
    float _888 = as_type<float>(_478) * _884;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _892 = trunc(_886);
    float _894 = precise::max(_892, 0.0);
    uint _896 = uint(_894);
    int _898 = int(_768) + int(_852);
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _902 = ~_415;
    int _904 = _902 + 1;
    int _906 = _862 * int(_880);
    int _908 = _906 + _630;
    float _910 = _550 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _912 = _874 * _898;
    int _914 = _912 + _714;
    float _916 = trunc(_888);
    float _918 = precise::max(_916, 0.0);
    uint _920 = uint(_918);
    float _922 = float(uint(_908));
    bool _924 = uint(_914) >= uint(_379);
    float _926 = as_type<float>(_417) * _922;
    bool _928 = !_924;
    int _930 = _928 ? 0 : (-1);
    int _932 = _433 * int(_896);
    int _934 = _932 + _804;
    int _936 = ~_898;
    int _938 = _936 + _930;
    int _940 = _938 + 1;
    float _942 = trunc(_926);
    float _944 = precise::max(_942, 0.0);
    uint _946 = uint(_944);
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _950 = _904 * int(_920);
    int _952 = _950 + _870;
    int _954 = _379 * _940;
    int _956 = _954 + _714;
    int _958 = ~_379;
    int _960 = _958 + 1;
    float _962 = float(uint(_952));
    bool _964 = !_866;
    int _966 = _964 ? _956 : (-1);
    float _968 = as_type<float>(_478) * _962;
    int _970 = _966 & 3;
    bool _972 = _970 != 0;
    int _974 = _966 & 3;
    bool _976 = _974 != 0;
    float _978 = trunc(_968);
    float _980 = precise::max(_978, 0.0);
    uint _982 = uint(_980);
    bool _984 = uint(_970) > 1u;
    int _986 = int(_880) + int(_946);
    int _988 = _976 ? 0 : 1;
    bool _990 = _970 != 3;
    int _992 = _960 * _986;
    int _994 = _992 + _630;
    int _996 = ~_988;
    int _998 = _996 + 1;
    int _1000 = _998 + 1;
    bool _1002 = uint(_994) >= uint(_379);
    int _1004 = _1000;
    int _1006 = 1;
    if (!_984)
    {
        int _1008 = ~_988;
        int _1010 = _1008 + 1;
        _1004 = _1010;
    }
    int _1012 = _1004;
    int _1014 = int(_920) + int(_982);
    float _1016 = in.m_63.z;
    int _1018 = ~_415;
    int _1020 = _1018 + 1;
    bool _1022 = uint(_970) >= 2u;
    bool _1024 = !_1002;
    int _1026 = _1024 ? 0 : (-1);
    int _1028 = _1020 * _1014;
    int _1030 = _1028 + _870;
    int _1032 = _1022 ? 0 : 1;
    int _1034 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1036 = _1034 != 0;
    bool _1038 = uint(_1030) >= uint(_415);
    float _1040 = in.m_63.w;
    int _1042 = ~_1032;
    int _1044 = _1042 + 1;
    int _1046 = _1044 + 1;
    int _1048 = _1046;
    if (_604)
    {
        _1006 = 0;
    }
    int _1050 = _1006;
    int _1052 = _1050;
    if (_990)
    {
        int _1054 = ~_1032;
        int _1056 = _1054 + 1;
        _1048 = _1056;
    }
    int _1058 = _1048;
    if (!_604)
    {
        _1052 = 1;
    }
    int _1060 = _1052;
    bool _1062 = _135 > 0.5;
    bool _1064 = _1060 != 1;
    float _1066 = -_223;
    int _1068 = _1062 ? as_type<int>(_1066) : as_type<int>(_223);
    bool _1070 = _550 > 0.5;
    bool _1072 = !_1036;
    float _1074 = _1072 ? _223 : as_type<float>(_1068);
    float _1076 = -_227;
    int _1078 = _1070 ? as_type<int>(_1076) : as_type<int>(_227);
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1082 = _1080 != 0;
    float _1084 = _1074 + 0.5;
    bool _1086 = _1016 > 0.5;
    bool _1088 = !_1038;
    int _1090 = _1088 ? 0 : (-1);
    bool _1092 = !_972;
    int _1094 = _1092 ? 0 : 1;
    bool _1096 = !_1082;
    float _1098 = _1096 ? _227 : as_type<float>(_1078);
    float _1100 = -_223;
    int _1102 = _1086 ? as_type<int>(_1100) : as_type<int>(_223);
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1106 = _1104 != 0;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1110 = _1108 != 0;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1114 = _1112 != 0;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1118 = _1116 != 0;
    float _1120 = 0.0;
    if (!_1064)
    {
        _1120 = _550;
    }
    float _1122 = _1120;
    float _1124 = 0.0;
    float _1126 = _1122;
    if (!_1064)
    {
        _1124 = _550;
    }
    float _1128 = _1124;
    float _1130 = _1128;
    if (!_1064)
    {
        _638 = _1016;
    }
    float _1132 = _638;
    float _1134 = 0.0;
    float _1136 = _1132;
    if (!_1064)
    {
        _1134 = _1016;
    }
    float _1138 = _1134;
    float _1140 = _1138;
    if (_1064)
    {
        _1126 = _135;
    }
    float _1142 = _1126;
    if (_1064)
    {
        _1130 = _135;
    }
    float _1144 = _1130;
    if (_1064)
    {
        _1136 = _550;
    }
    float _1146 = _1136;
    if (_1064)
    {
        _1140 = _550;
    }
    float _1148 = _1140;
    bool _1150 = _1040 > 0.5;
    float _1152 = _135 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1154 = ~_1014;
    int _1156 = _1154 + _1090;
    int _1158 = _1156 + 1;
    bool _1160 = !_1114;
    float _1162 = _1160 ? _223 : as_type<float>(_1102);
    float _1164 = -_890;
    float _1166 = fma(_1152, 2.0, _1164);
    float _1168 = float(uint(_934));
    float _1170 = fma(_910, -2.0, _900);
    float _1172 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[4].z, _375);
    float _1174 = -_149;
    float _1176 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1166);
    float _1178 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[5].z, _373);
    float _1180 = as_type<float>(_478) * _1168;
    float _1182 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[6].z, _381);
    float _1184 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1176);
    float _1186 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1170);
    float _1188 = _1098 + (-0.5);
    int _1190 = _415 * _1158;
    int _1192 = _1190 + _870;
    float _1194 = trunc(_1180);
    float _1196 = precise::max(_1194, 0.0);
    uint _1198 = uint(_1196);
    float _1200 = -_1188;
    float _1202 = -_1186;
    float _1204 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1202);
    float _1206 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1208 = !_716;
    int _1210 = _1208 ? _1192 : (-1);
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1214 = _1178 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1218 = _966 >> 31;
    float _1220 = -_383;
    float _1222 = fma(_1206, 2.0, _1220);
    float _1224 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1212);
    float _1226 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1228 = _1218 & 3;
    float _1230 = _1172 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1232 = ~_415;
    int _1234 = _1232 + 1;
    float _1236 = fma(_1226, -2.0, _948);
    int _1238 = int(_896) + int(_1198);
    float _1240 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1216);
    int _1242 = _1210 >> 31;
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1246 = _1230 + _1244;
    int _1248 = _966 + _1228;
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1252 = _1214 + _1250;
    int _1254 = _1242 & 3;
    int _1256 = _1234 * _1238;
    int _1258 = _1256 + _804;
    int _1260 = _1248 >> 2;
    float _1262 = _1182 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1264 = _1210 + _1254;
    float _1266 = _1162 + 0.5;
    int _1268 = _1260 << 4;
    int _1270 = _1268 + 368;
    float _1272 = -_149;
    float _1274 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1222);
    int _1276 = _1264 >> 2;
    float _1278 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1236);
    float _1280 = -_227;
    int _1282 = _1150 ? as_type<int>(_1280) : as_type<int>(_227);
    float _1284 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1224);
    int _1286 = _1276 << 4;
    int _1288 = _1286 + 512;
    float _1290 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1240);
    uint _1292 = uint(int(uint(_1270) >> uint(2)));
    uint _1294 = uint(int(uint(int(_1292)) >> uint(2)));
    int _1296 = int(_1292) & 3;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[int(_1294)][_1296];
    int _1300 = int(_1292) + 1;
    uint _1302 = uint(int(uint(_1300) >> uint(2)));
    int _1304 = _1300 & 3;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[int(_1302)][_1304];
    bool _1308 = _970 != 3;
    float _1310 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1312 = uint(_1258) >= uint(_415);
    float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1316 = _1262 + _1314;
    bool _1318 = !_1308;
    int _1320 = _1318 ? 0 : (-1);
    float _1322 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1310);
    int _1324 = ~_986;
    int _1326 = _1324 + _1026;
    int _1328 = _1326 + 1;
    uint _1330 = uint(int(uint(_1288) >> uint(2)));
    uint _1332 = uint(int(uint(int(_1330)) >> uint(2)));
    int _1334 = int(_1330) & 3;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[int(_1332)][_1334];
    int _1338 = int(_1330) + 1;
    uint _1340 = uint(int(uint(_1338) >> uint(2)));
    int _1342 = _1338 & 3;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[int(_1340)][_1342];
    bool _1346 = !_1118;
    float _1348 = _1346 ? _227 : as_type<float>(_1282);
    float _1350 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1322);
    int _1352 = _1210 & 3;
    bool _1354 = _1352 != 0;
    int _1356 = _379 * _1328;
    int _1358 = _1356 + _630;
    int _1360 = _1210 & 3;
    bool _1362 = _1360 != 0;
    float _1364 = _1348 + (-0.5);
    int _1366 = _1354 ? 0 : 1;
    int _1368 = _1270 + 8;
    uint _1370 = uint(int(uint(_1368) >> uint(2)));
    uint _1372 = uint(int(uint(int(_1370)) >> uint(2)));
    int _1374 = int(_1370) & 3;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[int(_1372)][_1374];
    int _1378 = int(_1370) + 1;
    uint _1380 = uint(int(uint(_1378) >> uint(2)));
    int _1382 = _1378 & 3;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[int(_1380)][_1382];
    bool _1386 = uint(_1360) > 1u;
    float _1388 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1274);
    bool _1390 = !_1312;
    int _1392 = _1390 ? 0 : (-1);
    float _1394 = -_1364;
    float _1396 = -_1278;
    float _1398 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1396);
    bool _1400 = !_1362;
    int _1402 = _1400 ? 0 : 1;
    int _1404 = ~_1238;
    int _1406 = _1404 + _1392;
    int _1408 = _1406 + 1;
    int _1410 = _1288 + 8;
    uint _1412 = uint(int(uint(_1410) >> uint(2)));
    uint _1414 = uint(int(uint(int(_1412)) >> uint(2)));
    int _1416 = int(_1412) & 3;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[int(_1414)][_1416];
    int _1420 = int(_1412) + 1;
    uint _1422 = uint(int(uint(_1420) >> uint(2)));
    int _1424 = _1420 & 3;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[int(_1422)][_1424];
    bool _1428 = uint(_1360) >= 2u;
    int _1430 = ~_1366;
    int _1432 = _1430 + 1;
    int _1434 = _1432 + 1;
    int _1436 = _415 * _1408;
    int _1438 = _1436 + _804;
    int _1440 = _1428 ? 0 : 1;
    int _1442 = _1434;
    if (!_1386)
    {
        int _1444 = ~_1366;
        int _1446 = _1444 + 1;
        _1442 = _1446;
    }
    int _1448 = _1442;
    bool _1450 = _1360 != 3;
    int _1452 = abs(_1012);
    bool _1454 = _1360 != 3;
    int _1456 = abs(_1448);
    int _1458 = abs(_1094);
    int _1460 = abs(_1402);
    int _1462 = ~_1452;
    int _1464 = _1462 + 1;
    int _1466 = _1464 + 1;
    int _1468 = ~_1440;
    int _1470 = _1468 + 1;
    int _1472 = _1470 + 1;
    int _1474 = ~_1456;
    int _1476 = _1474 + 1;
    int _1478 = _1476 + 1;
    int _1480 = _1466 * as_type<int>(_1306);
    int _1482 = _1472;
    if (_1450)
    {
        int _1484 = ~_1440;
        int _1486 = _1484 + 1;
        _1482 = _1486;
    }
    int _1488 = _1482;
    int _1490 = _1478 * as_type<int>(_1344);
    int _1492 = ~_1458;
    int _1494 = _1492 + 1;
    int _1496 = _1494 + 1;
    int _1498 = abs(_1058);
    int _1500 = abs(_1488);
    int _1502 = _1496 * as_type<int>(_1298);
    int _1504 = _1502 + _1480;
    int _1506 = ~_1460;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    int _1512 = abs(_1320);
    int _1514 = _1510 * as_type<int>(_1336);
    int _1516 = _1514 + _1490;
    int _1518 = ~_1498;
    int _1520 = _1518 + 1;
    int _1522 = _1520 + 1;
    int _1524 = ~_1500;
    int _1526 = _1524 + 1;
    int _1528 = _1526 + 1;
    bool _1530 = !_1106;
    int _1532 = _1530 ? 0 : 1;
    int _1534 = _1522 * as_type<int>(_1376);
    int _1536 = _1534 + _1504;
    bool _1538 = !_1454;
    int _1540 = _1538 ? 0 : (-1);
    int _1542 = _1528 * as_type<int>(_1418);
    int _1544 = _1542 + _1516;
    int _1546 = ~_1512;
    int _1548 = _1546 + 1;
    int _1550 = _1548 + 1;
    int _1552 = abs(_1540);
    int _1554 = abs(_1532);
    int _1556 = _1550 * as_type<int>(_1384);
    int _1558 = _1556 + _1536;
    bool _1560 = !_1110;
    int _1562 = _1560 ? 0 : 1;
    int _1564 = abs(_1562);
    int _1566 = ~_1554;
    int _1568 = _1566 + 1;
    int _1570 = _1568 + 1;
    int _1572 = ~_1552;
    int _1574 = _1572 + 1;
    int _1576 = _1574 + 1;
    int _1578 = _1558 * _1570;
    float _1580 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1582 = ~_1564;
    int _1584 = _1582 + 1;
    int _1586 = _1584 + 1;
    int _1588 = _1576 * as_type<int>(_1426);
    int _1590 = _1588 + _1544;
    bool _1592 = !_716;
    float _1594 = _1592 ? as_type<float>(_1438) : as_type<float>(0xffffffffu /* nan */);
    float _1596 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1598 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1580);
    int _1600 = _1590 * _1586;
    bool _1602 = !_866;
    int _1604 = _1602 ? _1358 : (-1);
    float _1606 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1596);
    float _1608 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1598);
    int _1610 = as_type<int>(_1594) * _1564;
    int _1612 = _1610 + _1600;
    float _1614 = _1252 * _1252;
    float _1616 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1606);
    float _1618 = -_1608;
    float _1620 = _1618 + 1.0;
    int _1622 = _1604 * _1554;
    int _1624 = _1622 + _1578;
    bool _1626 = _1350 >= 0.0;
    float _1628 = -_1616;
    float _1630 = _1628 + 1.0;
    float _1632 = fma(_1246, _1246, _1614);
    float _1634 = -_1284;
    float _1636 = _1634 + 1.0;
    float _1638 = -_1290;
    float _1640 = _1638 + 1.0;
    float _1642 = fma(_1098, _1630, _1204);
    float _1644 = fma(_1316, _1316, _1632);
    float _1646 = -_1620;
    float _1648 = fma(_1074, _1646, _1184);
    float _1650 = -_1636;
    float _1652 = fma(_1162, _1650, _1388);
    float _1654 = fma(_1348, _1640, _1398);
    float _1656 = float(_1624);
    float _1658 = rsqrt(_1644);
    float _1660 = _1594;
    if (_1626)
    {
        _1660 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1662 = _1660;
    out.m_72.x = _1648;
    out.m_72.y = _1642;
    out.m_72.z = _1652;
    out.m_72.w = _1654;
    float _1664 = float(_1612);
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1668 = _1666 != 0;
    int _1670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1672 = _1670 != 0;
    int _1674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1676 = _1674 != 0;
    int _1678 = as_type<int>(_1662);
    if (_1626)
    {
        float _1680 = _1662 * 5.0;
        _1678 = as_type<int>(_1680);
    }
    int _1682 = _1678;
    float _1684 = as_type<float>(_1682);
    if (_1626)
    {
        out.m_59.x = 0.0;
    }
    bool _1686 = !_1672;
    int _1688 = _1686 ? 0 : 1;
    if (_1626)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6531 = as_type<float>(_1682);
        out.gl_Position.z = _6531;
    }
    bool _1690 = !_1676;
    int _1692 = _1690 ? 0 : 1;
    bool _1694 = !_1668;
    int _1696 = _1694 ? 0 : 1;
    out.m_74.x = _1656;
    out.m_74.y = _1664;
    float _1698 = _1252 * _1658;
    float _1700 = _1246 * _1658;
    if (_1626)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1702 = -_1698;
    float _1704 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1214);
    float _1706 = _1316 * _1658;
    float _1708 = -_1700;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1230);
    float _1712 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1714 = _1704 + _1712;
    float _1716 = -_1706;
    float _1718 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1262);
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1722 = _1710 + _1720;
    float _1724 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1728 = _1718 + _1726;
    float _1730 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1724);
    float _1732 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1730);
    bool _1734 = _1732 >= 0.0;
    if (_1734)
    {
        _1684 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1736 = _1684;
    int _1738 = as_type<int>(_1736);
    if (_1734)
    {
        out.m_59.x = 0.0;
    }
    if (_1734)
    {
        float _1740 = _1736 * 5.0;
        _1738 = as_type<int>(_1740);
    }
    int _1742 = _1738;
    if (_1734)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6639 = as_type<float>(_1742);
        out.gl_Position.z = _6639;
    }
    if (_1734)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1744 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1746 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1748 = floor(_1744);
    float _1750 = floor(_1746);
    float _1752 = -_1748;
    float _1754 = _1744 + _1752;
    float _1756 = -_1750;
    float _1758 = _1746 + _1756;
    float2 _6675 = float2(_1754, _1758);
    float _1760 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6675, float2(0.0), isnan(_6675)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6675, float2(0.0), isnan(_6675)), level(0.0)).x;
    float _1762 = _135 * 2.0;
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1766 = _359 + _1764;
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1770 = _1768 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1772 = floor(_1762);
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1774;
    float _1778 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1780 = _359 + _1778;
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1782;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1788 = _1786 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1792 = _359 + _1790;
    int _1794 = abs(_1696);
    float _1796 = 1.0 / _1770;
    float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _1798;
    int _1802 = abs(_1688);
    float _1804 = 1.0 / _1800;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _1806;
    float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1812 = _359 + _1810;
    bool _1814 = _1772 > 0.0;
    bool _1816 = _1772 >= 0.0;
    bool _1818 = isnan(_1772);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan(0.0);
    bool _1824 = _1820 || _1822;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1828 = _359 + _1826;
    float _1830 = float(_1794);
    float _1832 = 1.0 / _1808;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1836 = _359 + _1834;
    float _1838 = _1766 * _1796;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1842 = _359 + _1840;
    float _1844 = 1.0 / _1784;
    float _1846 = _1836 * _1804;
    float _1848 = 1.0 / _1776;
    float _1850 = _1842 * _1832;
    float _1852 = _135 + _1016;
    float _1854 = _1852 + (-1.0);
    float _1856 = 1.0 / _1788;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1860 = _1858 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1862 = _1780 * _1844;
    float _1864 = _1016 * 2.0;
    float _1866 = 1.0 / _1860;
    float _1868 = _550 * 2.0;
    float _1870 = _1792 * _1848;
    float _1872 = _1812 * _1856;
    float _1874 = _135 + _550;
    float _1876 = floor(_1868);
    float _1878 = _1874 + (-1.0);
    float _1880 = _1016 + _550;
    float _1882 = _1016 + (-0.5);
    float _1884 = _1828 * _1866;
    float _1886 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1888 = floor(_1864);
    float _1890 = fma(_1854, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1894 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1892;
    float _1896 = _1880 + (-1.0);
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1898;
    float _1902 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1904 = _1902 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1906 = fma(_1896, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1908 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1910 = log2(_1908);
    float _1912 = fma(_1900, _1870, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1914 = fma(_1894, _1870, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1916 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1918 = _1916 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1920 = fma(_1904, _1838, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1922 = _1876 > 0.0;
    float _1924 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1924;
    bool _1928 = _1876 >= 0.0;
    bool _1930 = isnan(_1876);
    bool _1932 = _1928 || _1930;
    bool _1934 = isnan(0.0);
    bool _1936 = _1932 || _1934;
    float _1938 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1940 = _1938 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1942 = fma(_1918, _1838, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1944;
    bool _1948 = _1888 > 0.0;
    float _1950 = fma(_1940, _1872, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _1952 = _1888 >= 0.0;
    bool _1954 = isnan(_1888);
    bool _1956 = _1952 || _1954;
    bool _1958 = isnan(0.0);
    bool _1960 = _1956 || _1958;
    float _1962 = fma(_1926, _1862, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _1964;
    float _1968 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _1970 = _1968 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1972 = fma(_1946, _1862, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1974 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1976 = _1974 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _1980 = _1978 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1982 = _1910 * _149;
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _1984;
    float _1988 = fma(_1970, _1884, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _1990 = fma(_1976, _1872, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1992 = fma(_1980, _1884, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _1994 = fma(_1986, _1846, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _1996 = fma(_1966, _1846, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1998 = exp2(_1982);
    int _2000 = _1824 ? 0 : 1;
    int _2002 = _1960 ? 0 : 1;
    float _2004 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2006 = 1.0 + _2004;
    int _2008 = ~_2000;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    int _2014 = ~_2002;
    int _2016 = _2014 + 1;
    int _2018 = _2016 + 1;
    int _2020 = _2012;
    int _2022 = _2018;
    if (!_1814)
    {
        int _2024 = ~_2000;
        int _2026 = _2024 + 1;
        _2020 = _2026;
    }
    int _2028 = _2020;
    float _2030 = 1.0 / _2006;
    if (!_1948)
    {
        int _2032 = ~_2002;
        int _2034 = _2032 + 1;
        _2022 = _2034;
    }
    int _2036 = _2022;
    float _2038 = in.m_76.x;
    float _2040 = in.m_76.y;
    float _2042 = in.m_76.z;
    bool _2044 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2046 = isnan(1.0);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2052 = _2048 || _2050;
    float _2054 = -_1998;
    float _2056 = _2054 + 1.0;
    bool _2058 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2060 = isnan(0.0);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2066 = _2062 || _2064;
    float _2068 = float(_2036);
    float _2070 = float(_2028);
    float _2072 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _2072;
    float _2076 = float(_1802);
    float _2078 = _1830 * _2068;
    float _2080 = _2066 ? _2056 : 0.0;
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _2082;
    float _2086 = -_1698;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1252);
    float _2090 = _2076 * _2070;
    float _2092 = _2078 * (-2.0);
    if (_2052)
    {
        float _2094 = _2080 * _2030;
        _153 = _2094;
    }
    float _2096 = _153;
    float _2098 = fma(_2084, _1850, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _2100 = _2090 * (-2.0);
    float _2102 = fma(_1886, _2092, _1886);
    bool _2104 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _2106 = isnan(_359);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _2112 = _2108 || _2110;
    float _2114 = float(_2112);
    float _2116 = fma(_2074, _1850, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _2118 = fma(_1906, _2100, _1906);
    float _2120 = fma(_2100, _2040, _2040);
    bool _2122 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _2124 = isnan(_359);
    bool _2126 = _2122 || _2124;
    bool _2128 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _2130 = _2126 || _2128;
    float _2132 = float(_2130);
    float _2134 = _550 + (-0.5);
    float _2136 = -_2114;
    float _2138 = _2136 + 1.0;
    bool _2140 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _2142 = isnan(_359);
    bool _2144 = _2140 || _2142;
    bool _2146 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _2148 = _2144 || _2146;
    float _2150 = float(_2148);
    float _2152 = fma(_2092, _2038, _2038);
    float _2154 = -_2132;
    float _2156 = _2154 + 1.0;
    float _2158 = _135 + (-0.5);
    float _2160 = _2132 * _2138;
    bool _2162 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _2164 = isnan(_359);
    bool _2166 = _2162 || _2164;
    bool _2168 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _2170 = _2166 || _2168;
    float _2172 = float(_2170);
    float _2174 = _2150 * _2156;
    float _2176 = fma(_2134, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2120);
    float _2178 = -_2150;
    float _2180 = _2178 + 1.0;
    float _2182 = -_1700;
    float _2184 = fma(_2182, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1246);
    float _2186 = _2088 * _2088;
    float _2188 = fma(_2158, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2152);
    bool _2190 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2192 = isnan(_359);
    bool _2194 = _2190 || _2192;
    bool _2196 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2198 = _2194 || _2196;
    float _2200 = float(_2198);
    float _2202 = _2172 * _2180;
    float _2204 = -_2172;
    float _2206 = _2204 + 1.0;
    float _2208 = fma(_2184, _2184, _2186);
    bool _2210 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2212 = isnan(_359);
    bool _2214 = _2210 || _2212;
    bool _2216 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2218 = _2214 || _2216;
    float _2220 = float(_2218);
    float _2222 = -_1706;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1316);
    float _2226 = _2200 * _2206;
    float _2228 = -_2200;
    float _2230 = _2228 + 1.0;
    float _2232 = fma(_2102, _2096, _2188);
    bool _2234 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2236 = isnan(_359);
    bool _2238 = _2234 || _2236;
    bool _2240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2242 = _2238 || _2240;
    float _2244 = float(_2242);
    float _2246 = -_2220;
    float _2248 = _2246 + 1.0;
    float _2250 = _2220 * _2230;
    float _2252 = fma(_2224, _2224, _2208);
    bool _2254 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2256 = isnan(_359);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2262 = _2258 || _2260;
    float _2264 = float(_2262);
    float _2266 = _2244 * _2248;
    int _2268 = _1936 ? 0 : 1;
    float _2270 = -_2244;
    float _2272 = _2270 + 1.0;
    int _2274 = abs(_1692);
    float _2276 = _2232 * 0.15915493667125701904296875;
    int _2278 = ~_2268;
    int _2280 = _2278 + 1;
    int _2282 = _2280 + 1;
    float _2284 = _2264 * _2272;
    int _2286 = _2282;
    if (!_1922)
    {
        int _2288 = ~_2268;
        int _2290 = _2288 + 1;
        _2286 = _2290;
    }
    int _2292 = _2286;
    float _2294 = fma(_2118, _2096, _2176);
    float _2296 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2298 = float(_2292);
    float _2300 = _1914 * _2284;
    float _2302 = float(_2274);
    float _2304 = _1912 * _2284;
    float _2306 = -_2264;
    float _2308 = _2306 + 1.0;
    float _2310 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2296);
    float _2312 = _2294 * 0.15915493667125701904296875;
    float _2314 = _2302 * _2298;
    float _2316 = fma(_2308, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2304);
    float _2318 = fma(_2308, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2300);
    float _2320 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2310);
    float _2322 = _2314 * (-2.0);
    float _2324 = fma(_1920, _2266, _2316);
    float _2326 = fma(_1942, _2266, _2318);
    float _2328 = _2320 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2330 = fma(_2322, _2042, _2042);
    float _2332 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2334 = fma(_1890, _2322, _1890);
    float _2336 = 1.0 / _2328;
    float _2338 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2330);
    float _2340 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2332);
    float _2342 = fma(_1972, _2250, _2326);
    float _2344 = fma(_1962, _2250, _2324);
    float _2346 = fma(_2334, _2096, _2338);
    float _2348 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2340);
    float _2350 = fma(_1990, _2226, _2342);
    float _2352 = _2312 * 6.283185482025146484375;
    float _2354 = sin(_2352);
    float _2356 = _2346 * 0.15915493667125701904296875;
    float _2358 = _2348 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2360 = fma(_1950, _2226, _2344);
    float _2362 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2364 = in.m_70.x;
    float _2366 = in.m_70.y;
    float _2368 = _2358 + _2328;
    float _2370 = fma(_1996, _2202, _2350);
    float _2372 = _2312 * 6.283185482025146484375;
    float _2374 = cos(_2372);
    float _2376 = _1704 + _2362;
    float _2378 = _2368 * _2336;
    float _2380 = _2378 * 0.5;
    float _2382 = fma(_1992, _2174, _2370);
    float _2384 = fma(_1994, _2202, _2360);
    float _2386 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2388 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2390 = fma(_2116, _2160, _2382);
    float _2392 = sqrt(_2252);
    float _2394 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2386);
    float _2396 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2388);
    float _2398 = fma(_1988, _2174, _2384);
    float _2400 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[150].y, _2390);
    float _2402 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2404 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2402);
    float _2406 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2394);
    float _2408 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2396);
    float _2410 = _2276 * 6.283185482025146484375;
    float _2412 = sin(_2410);
    float _2414 = fma(_2098, _2160, _2398);
    float _2416 = _2406 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2418 = _2408 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2420 = _2400 * _2366;
    float _2422 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[150].x, _2414);
    float _2424 = _1658 * _2392;
    float _2426 = 1.0 / _2404;
    float _2428 = _2422 * _2364;
    float _2430 = _2420 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2432 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _2434 = _2428 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2436 = _2424 * _2430;
    float _2438 = _2276 * 6.283185482025146484375;
    float _2440 = cos(_2438);
    float _2442 = _2412 * _2374;
    float _2444 = _2424 * _2434;
    float _2446 = _2432 * _2436;
    float _2448 = _2412 * _2354;
    float _2450 = trunc(_2416);
    int _2452 = int(_2450);
    float _2454 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2456 = _2426 * _2454;
    bool _2458 = _2456 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2460 = trunc(_2418);
    int _2462 = int(_2460);
    bool _2464 = _2456 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2466 = _2440 * _2354;
    bool _2468 = !_2458;
    int _2470 = _2468 ? 0 : 1;
    float _2472 = _2440 * _2374;
    float _2474 = _2356 * 6.283185482025146484375;
    float _2476 = sin(_2474);
    int _2478 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2480 = _2452 + _2478;
    int _2482 = _2480 + 1;
    int _2484 = 2;
    int _2486 = _2482;
    float _2488 = _2322;
    float _2490 = _2320;
    float _2492 = _2418;
    float _2494 = _2376;
    if (!_2458)
    {
        _2484 = 1;
    }
    int _2496 = _2484;
    bool _2498 = _2482 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2500 = _2496;
    if (!_2464)
    {
        _2500 = _2470;
    }
    int _2502 = _2500;
    float _2504 = _2356 * 6.283185482025146484375;
    float _2506 = cos(_2504);
    int _2508 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2510 = _2462 + _2508;
    int _2512 = _2510 + 1;
    int _2514 = _2502 << 6;
    int _2516 = _2482 | _2512;
    int _2518 = _2514 + 72;
    uint _2520 = uint(int(uint(_2518) >> uint(2)));
    uint _2522 = uint(int(uint(int(_2520)) >> uint(2)));
    int _2524 = int(_2520) & 3;
    float _2526 = (*spvDescriptorSet0.vp_c15)._m0[int(_2522)][_2524];
    int _2528 = int(_2520) + 1;
    uint _2530 = uint(int(uint(_2528) >> uint(2)));
    int _2532 = _2528 & 3;
    float _2534 = (*spvDescriptorSet0.vp_c15)._m0[int(_2530)][_2532];
    float _2536 = -_2466;
    float _2538 = fma(_2476, _2442, _2536);
    float _2540 = -_2442;
    float _2542 = fma(_2476, _2466, _2540);
    float _2544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _2546 = fma(_2476, _2472, _2448);
    bool _2548 = _2516 < 0;
    bool _2550 = _2548 || _2498;
    float _2552 = -_2446;
    float _2554 = _2476 * _2552;
    float _2556 = _2544 * _2444;
    float _2558 = fma(_2476, _2448, _2472);
    float _2560 = _2440 * _2506;
    float _2562 = _2412 * _2506;
    float _2564 = _2374 * _2506;
    bool _2566 = _2512 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2568 = _2566 || _2550;
    float _2570 = _2560 * _2446;
    float _2572 = _2424 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2574 = _2572 * 0.5;
    float _2576 = _2562 * _2446;
    float _2578 = _2354 * _2506;
    float _2580 = fma(_2546, _2556, _2570);
    float _2582 = fma(_2564, _2556, _2554);
    int _2584 = _2514 + 96;
    uint _2586 = uint(int(uint(_2584) >> uint(2)));
    uint _2588 = uint(int(uint(int(_2586)) >> uint(2)));
    int _2590 = int(_2586) & 3;
    float _2592 = (*spvDescriptorSet0.vp_c15)._m0[int(_2588)][_2590];
    int _2594 = int(_2586) + 1;
    uint _2596 = uint(int(uint(_2594) >> uint(2)));
    int _2598 = _2594 & 3;
    float _2600 = (*spvDescriptorSet0.vp_c15)._m0[int(_2596)][_2598];
    float _2602 = fma(_2538, _2556, _2576);
    float _2604 = fma(_2542, _2574, _2580);
    float _2606 = fma(_2578, _2574, _2582);
    bool _2608 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2610 = isnan(0.5);
    bool _2612 = _2608 || _2610;
    bool _2614 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2616 = _2612 || _2614;
    float _2618 = fma(_2558, _2574, _2602);
    float _2620 = _2604 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2622 = as_type<int>(_2620);
    float _2624 = as_type<float>(_2502);
    if (!_2568)
    {
        int _2626 = _2512 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2628 = _2626 + _2482;
        _2486 = _2628;
    }
    int _2630 = _2486;
    int _2632 = _2514 + 104;
    uint _2634 = uint(int(uint(_2632) >> uint(2)));
    uint _2636 = uint(int(uint(int(_2634)) >> uint(2)));
    int _2638 = int(_2634) & 3;
    float _2640 = (*spvDescriptorSet0.vp_c15)._m0[int(_2636)][_2638];
    int _2642 = int(_2634) + 1;
    uint _2644 = uint(int(uint(_2642) >> uint(2)));
    int _2646 = _2642 & 3;
    float _2648 = (*spvDescriptorSet0.vp_c15)._m0[int(_2644)][_2646];
    float _2650 = _2604 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2652 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2620);
    int _2654 = as_type<int>(_2650);
    if (!_2568)
    {
        float _2656 = floor(_2416);
        _2488 = _2656;
    }
    float _2658 = _2488;
    float _2660 = _2658;
    if (!_2568)
    {
        int _2662 = _2630 << 2;
        _2622 = _2662;
    }
    int _2664 = _2622;
    float _2666 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2650);
    float _2668 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2652);
    int _2670 = as_type<int>(_2668);
    if (!_2568)
    {
        uint _2672 = uint(int(uint(_2630) >> uint(2)));
        _2654 = int(_2672);
    }
    int _2674 = _2654;
    int _2676 = _2514 + 48;
    uint _2678 = uint(int(uint(_2676) >> uint(2)));
    uint _2680 = uint(int(uint(int(_2678)) >> uint(2)));
    int _2682 = int(_2678) & 3;
    float _2684 = (*spvDescriptorSet0.vp_c15)._m0[int(_2680)][_2682];
    int _2686 = int(_2678) + 1;
    uint _2688 = uint(int(uint(_2686) >> uint(2)));
    int _2690 = _2686 & 3;
    float _2692 = (*spvDescriptorSet0.vp_c15)._m0[int(_2688)][_2690];
    float _2694 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2666);
    float _2696 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    if (!_2568)
    {
        int _2698 = 12 & _2664;
        _2670 = _2698;
    }
    int _2700 = _2670;
    float _2702 = _2694 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2704 = _1262 + _2696;
    float _2706 = _2704;
    if (!_2568)
    {
        int _2708 = _2674 << 4;
        int _2710 = _2708 + _2700;
        _2490 = as_type<float>(_2710);
    }
    float _2712 = _2490;
    int _2714 = _2514 + 64;
    uint _2716 = uint(int(uint(_2714) >> uint(2)));
    uint _2718 = uint(int(uint(int(_2716)) >> uint(2)));
    int _2720 = int(_2716) & 3;
    float _2722 = (*spvDescriptorSet0.vp_c15)._m0[int(_2718)][_2720];
    int _2724 = int(_2716) + 1;
    uint _2726 = uint(int(uint(_2724) >> uint(2)));
    int _2728 = _2724 & 3;
    float _2730 = (*spvDescriptorSet0.vp_c15)._m0[int(_2726)][_2728];
    float _2732 = _1230 + _2702;
    float _2734 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2736 = _2704 + _2734;
    float _2738 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2740 = _2732 + _2738;
    float _2742 = _2736 * _2736;
    int _2744 = _2514 + 56;
    uint _2746 = uint(int(uint(_2744) >> uint(2)));
    uint _2748 = uint(int(uint(int(_2746)) >> uint(2)));
    int _2750 = int(_2746) & 3;
    float _2752 = (*spvDescriptorSet0.vp_c15)._m0[int(_2748)][_2750];
    int _2754 = int(_2746) + 1;
    uint _2756 = uint(int(uint(_2754) >> uint(2)));
    int _2758 = _2754 & 3;
    float _2760 = (*spvDescriptorSet0.vp_c15)._m0[int(_2756)][_2758];
    float _2762 = fma(_2740, _2740, _2742);
    float _2764 = sqrt(_2762);
    int _2766 = _2514 + 80;
    uint _2768 = uint(int(uint(_2766) >> uint(2)));
    uint _2770 = uint(int(uint(int(_2768)) >> uint(2)));
    int _2772 = int(_2768) & 3;
    float _2774 = (*spvDescriptorSet0.vp_c15)._m0[int(_2770)][_2772];
    int _2776 = int(_2768) + 1;
    uint _2778 = uint(int(uint(_2776) >> uint(2)));
    int _2780 = _2776 & 3;
    float _2782 = (*spvDescriptorSet0.vp_c15)._m0[int(_2778)][_2780];
    int _2784 = _2514 + 88;
    uint _2786 = uint(int(uint(_2784) >> uint(2)));
    uint _2788 = uint(int(uint(int(_2786)) >> uint(2)));
    int _2790 = int(_2786) & 3;
    float _2792 = (*spvDescriptorSet0.vp_c15)._m0[int(_2788)][_2790];
    int _2794 = int(_2786) + 1;
    uint _2796 = uint(int(uint(_2794) >> uint(2)));
    int _2798 = _2794 & 3;
    float _2800 = (*spvDescriptorSet0.vp_c15)._m0[int(_2796)][_2798];
    float _2802 = _2376 * _2600;
    float _2804 = fma(_1710, _2592, _2802);
    float _2806 = _2604 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2808 = _2764 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2810 = _2712;
    float _2812 = _2648;
    float _2814 = _2732;
    if (!_2568)
    {
        int _2816 = as_type<int>(_2712) + 400;
        uint _2818 = uint(int(uint(_2816) >> uint(2)));
        uint _2820 = uint(int(uint(int(_2818)) >> uint(2)));
        int _2822 = int(_2818) & 3;
        float _2824 = (*spvDescriptorSet0.vp_c15)._m0[int(_2820)][_2822];
        _2810 = _2824;
    }
    float _2826 = _2810;
    float _2828 = fma(_1718, _2640, _2804);
    float _2830 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2806);
    float _2832 = _2604;
    if (!_2568)
    {
        float _2834 = floor(_2418);
        _2832 = _2834;
    }
    float _2836 = _2832;
    float _2838 = _2828 + _2648;
    float _2840 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2830);
    float _2842 = _2376 * _2692;
    float _2844 = 1.0 / _2838;
    float _2846 = fma(_1710, _2684, _2842);
    float _2848 = _2840 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2850 = _2376 * _2730;
    float _2852 = _1214 + _2848;
    float _2854 = fma(_1710, _2722, _2850);
    if (!_2808)
    {
        _2812 = _2852;
    }
    float _2856 = _2812;
    float _2858 = fma(_1718, _2752, _2846);
    float _2860 = fma(_1718, _2526, _2854);
    bool _2862 = !_2808;
    float _2864 = _2856;
    if (!_2862)
    {
        float _2866 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2870 = _2764 + _2868;
        float _2872 = rsqrt(_2762);
        float _2874 = _2870 * _2866;
        float _2876 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2878 = _2874 * 0.15915493667125701904296875;
        float _2880 = _2878 * 6.283185482025146484375;
        float _2882 = cos(_2880);
        float _2884 = _2878 * 6.283185482025146484375;
        float _2886 = sin(_2884);
        float _2888 = _2882 + (-1.0);
        float _2890 = fma(_2886, _2876, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2892 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2894 = _2872 * _2890;
        float _2896 = fma(_2852, _2882, _2892);
        float _2898 = fma(_2740, _2894, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2900 = fma(_2736, _2894, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2814 = _2898;
        _2864 = _2896;
        _2706 = _2900;
    }
    float _2902 = _2814;
    float _2904 = _2864;
    float _2906 = _2706;
    float _2908 = -_1700;
    float _2910 = fma(_2908, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2902);
    float _2912 = -_1698;
    float _2914 = fma(_2912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2904);
    float _2916 = -_1706;
    float _2918 = fma(_2916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2906);
    float _2920 = _2858 + _2760;
    float _2922 = _2860 + _2534;
    float _2924 = _2914;
    float _2926 = _2910;
    float _2928 = _2918;
    if (!_2616)
    {
        float _2930 = _1714 * _1714;
        float _2932 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2934 = -_1262;
        float _2936 = _2934 + _2906;
        float _2938 = -_1214;
        float _2940 = _2938 + _2904;
        float _2942 = fma(_1722, _1722, _2930);
        float _2944 = fma(_1728, _1728, _2942);
        float _2946 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2948 = sqrt(_2944);
        float _2950 = 1.0 / _2424;
        float _2952 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2954 = precise::min(_2948, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2956 = _2954 * _2932;
        float _2958 = _2956 * _2950;
        float _2960 = -_1230;
        float _2962 = _2960 + _2902;
        float _2964 = _2952 * _2958;
        float _2966 = _2936 * _2958;
        float _2968 = fma(_2940, _2964, _1704);
        float _2970 = fma(_2962, _2964, _1710);
        float _2972 = fma(_2952, _2966, _1718);
        _2924 = _2968;
        _2926 = _2970;
        _2928 = _2972;
    }
    float _2974 = _2924;
    float _2976 = _2926;
    float _2978 = _2928;
    float _2980 = _2974 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2982 = _2974 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2984 = _2920 * _2844;
    float _2986 = _2974 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2988 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2980);
    float _2990 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2982);
    float _2992 = _2974 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _2994 = _2984 >= 0.0;
    float _2996 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2988);
    float _2998 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2986);
    float _3000 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2990);
    float _3002 = _2922 * _2844;
    float _3004 = _2996 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3006 = _2984 <= 1.0;
    bool _3008 = _3006 && _2994;
    float _3010 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2998);
    float _3012 = _3000 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3014 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2992);
    float _3016 = _3004 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3018 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _3020 = _3002 >= 0.0;
    bool _3022 = _3020 && _3008;
    float _3024 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3014);
    float _3026 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3016);
    float _3028 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3030 = _3018 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _3032 = _3002 <= 1.0;
    bool _3034 = _3032 && _3022;
    float _3036 = _3024 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3038 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3026);
    float _3040 = -_3030;
    float _3042 = fma(_3040, _3028, 1.0);
    float _3044 = _2376 * _2782;
    float _3046 = _3004 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3048 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3038);
    float _3050 = _3004 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3052 = fma(_1710, _2774, _3044);
    float _3054 = log2(_3042);
    float _3056 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3046);
    float _3058 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3050);
    float _3060 = fma(_1718, _2792, _3052);
    float _3062 = _3014;
    float _3064 = _3048;
    if (_3034)
    {
        float _3066 = float(_2502);
        _2624 = _3066;
    }
    float _3068 = _2624;
    float _3070 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3056);
    float _3072 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3058);
    float _3074 = _3060 + _2800;
    float _3076 = 1.0 / _3048;
    float _3078 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3070);
    float _3080 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3072);
    float _3082 = _3072;
    float _3084 = _3068;
    float _3086 = _3078;
    if (!_2568)
    {
        float _3088 = -_2836;
        float _3090 = _2418 + _3088;
        _3062 = _3090;
    }
    float _3092 = _3062;
    if (!_2568)
    {
        float _3094 = -_2658;
        float _3096 = _2416 + _3094;
        _3082 = _3096;
    }
    float _3098 = _3082;
    float _3100 = _3074 * _2844;
    float _3102 = _2722;
    if (!_2568)
    {
        float _3104 = rint(_2826);
        float _3106 = precise::max(_3104, 0.0);
        uint _3108 = uint(_3106);
        uint _3110 = clamp(_3108, 0u, 65535u);
        _3102 = as_type<float>(_3110);
    }
    float _3112 = _3102;
    float _3114 = _3054 * 0.693147182464599609375;
    float _3116 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3118 = _3052;
    float _3120 = _3116;
    if (_3034)
    {
        float _3122 = rint(_3068);
        float _3124 = precise::max(_3122, 0.0);
        uint _3126 = uint(_3124);
        uint _3128 = clamp(_3126, 0u, 65535u);
        _3118 = as_type<float>(_3128);
    }
    float _3130 = _3118;
    float _3132 = _3078 * _3076;
    float _3134 = _3080 * _3076;
    float _3136 = fma(_3132, 0.5, 0.5);
    float _3138 = fma(_3134, -0.5, 0.5);
    float _3140 = _3092;
    float _3142 = _3136;
    if (!_2568)
    {
        float3 _8886 = float3(_3098, _3092, float(as_type<int>(_3112)));
        float3 _8890 = select(_8886, float3(0.0), isnan(_8886));
        float _3144 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8890.xy, uint(rint(_8890.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8890.xy, uint(rint(_8890.z)), level(0.0)).x;
        _3140 = _3144;
    }
    float _3146 = _3140;
    float _3148 = _3002;
    if (_3034)
    {
        float3 _8905 = float3(_2984, _3002, float(as_type<int>(_3130)));
        float3 _8907 = select(_8905, float3(0.0), isnan(_8905));
        float _3150 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8907.xy, uint(rint(_8907.z)), _3100, level(0.0));
        _3148 = _3150;
    }
    float _3152 = _3148;
    float3 _8917 = float3(_3136, _3138, _3116);
    float _3154 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8917, float3(0.0), isnan(_8917)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8917, float3(0.0), isnan(_8917)), level(0.0)).x;
    float3 _8926 = float3(_3136, _3138, _3116);
    float4 _3157 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8926, float3(0.0), isnan(_8926)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8926, float3(0.0), isnan(_8926)), level(0.0)).xyzw;
    float _3159 = _3157.x;
    float _3161 = _3157.y;
    float _3163 = _3157.z;
    float _3165 = _3157.w;
    bool _3167 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3169 = isnan(0.5);
    bool _3171 = _3167 || _3169;
    bool _3173 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3175 = _3171 || _3173;
    if (_2568)
    {
        _3084 = 1.0;
    }
    float _3177 = _3084;
    float _3179 = _3177;
    if (_3175)
    {
        _2660 = 1.0;
    }
    float _3181 = _2660;
    float _3183 = _3181;
    if (_3175)
    {
        _2492 = 1.0;
    }
    float _3185 = _2492;
    float _3187 = _3185;
    float _3189 = _3159;
    if (!_3175)
    {
        float _3191 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3193 = _3191 * 0.15915493667125701904296875;
        float _3195 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3197 = _3193 * 6.283185482025146484375;
        float _3199 = cos(_3197);
        float _3201 = _3195 * 0.15915493667125701904296875;
        float _3203 = _3193 * 6.283185482025146484375;
        float _3205 = sin(_3203);
        float _3207 = 1.0 / _3199;
        float _3209 = _3201 * 6.283185482025146484375;
        float _3211 = cos(_3209);
        float _3213 = _3205 * _3207;
        float _3215 = _3201 * 6.283185482025146484375;
        float _3217 = sin(_3215);
        float _3219 = _3211 * _3213;
        float _3221 = 1.0 / _3219;
        float _3223 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3225 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3223;
        float _3227 = 1.0 / _3225;
        float _3229 = _3217 * _3221;
        float _3231 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3233 = fma(_2456, _3229, _3231);
        float _3235 = _3233 * _3227;
        float _3237 = precise::clamp(_3235, 0.0, 1.0);
        _3142 = _3201;
        _3187 = _3237;
    }
    float _3239 = _3142;
    float _3241 = _3187;
    float _3243 = _3239;
    if (!_3175)
    {
        float _3245 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3247 = _3245 * 0.15915493667125701904296875;
        float _3249 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3251 = _3247 * 6.283185482025146484375;
        float _3253 = cos(_3251);
        float _3255 = _3249 * 0.15915493667125701904296875;
        float _3257 = _3247 * 6.283185482025146484375;
        float _3259 = sin(_3257);
        float _3261 = 1.0 / _3253;
        float _3263 = _3255 * 6.283185482025146484375;
        float _3265 = cos(_3263);
        float _3267 = _3259 * _3261;
        float _3269 = _3255 * 6.283185482025146484375;
        float _3271 = sin(_3269);
        float _3273 = _3265 * _3267;
        float _3275 = 1.0 / _3273;
        float _3277 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3279 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3277;
        float _3281 = 1.0 / _3279;
        float _3283 = _3271 * _3275;
        float _3285 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3287 = fma(_2456, _3283, _3285);
        float _3289 = _3287 * _3281;
        float _3291 = precise::clamp(_3289, 0.0, 1.0);
        float _3293 = -_3291;
        float _3295 = _3293 + 1.0;
        _3243 = _3273;
        _3183 = _3295;
    }
    float _3297 = _3243;
    float _3299 = _3183;
    if (!_2568)
    {
        int _3301 = _2630 << 4;
        int _3303 = _3301 + 2048;
        uint _3305 = uint(int(uint(_3303) >> uint(2)));
        uint _3307 = uint(int(uint(int(_3305)) >> uint(2)));
        int _3309 = int(_3305) & 3;
        float _3311 = (*spvDescriptorSet0.vp_c15)._m0[int(_3307)][_3309];
        int _3313 = int(_3305) + 1;
        uint _3315 = uint(int(uint(_3313) >> uint(2)));
        int _3317 = _3313 & 3;
        float _3319 = (*spvDescriptorSet0.vp_c15)._m0[int(_3315)][_3317];
        int _3321 = _3303 + 8;
        uint _3323 = uint(int(uint(_3321) >> uint(2)));
        uint _3325 = uint(int(uint(int(_3323)) >> uint(2)));
        int _3327 = int(_3323) & 3;
        float _3329 = (*spvDescriptorSet0.vp_c15)._m0[int(_3325)][_3327];
        int _3331 = int(_3323) + 1;
        uint _3333 = uint(int(uint(_3331) >> uint(2)));
        int _3335 = _3331 & 3;
        float _3337 = (*spvDescriptorSet0.vp_c15)._m0[int(_3333)][_3335];
        float _3339 = _2376 * _3319;
        float _3341 = fma(_1710, _3311, _3339);
        float _3343 = fma(_1718, _3329, _3341);
        float _3345 = _3343 + _3337;
        float _3347 = precise::clamp(_3345, 0.0, 1.0);
        float _3349 = -_3347;
        float _3351 = _3349 + _3146;
        float _3353 = fma(_3351, 500.0, 1.5);
        float _3355 = exp2(_3353);
        float _3357 = 0.0 + _3355;
        float _3359 = precise::clamp(_3357, 0.0, 1.0);
        _2494 = _3339;
        _3179 = _3359;
    }
    float _3361 = _2494;
    float _3363 = _3179;
    float _3365 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3367 = _2974 + _3365;
    float _3369 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3371 = _2976 + _3369;
    float _3373 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3375 = _2978 + _3373;
    float _3377 = _3367 * _3367;
    float _3379 = fma(_3371, _3371, _3377);
    float _3381 = fma(_3375, _3375, _3379);
    float _3383 = rsqrt(_3381);
    float _3385 = sqrt(_3381);
    float _3387 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3389 = _3371 * _3387;
    float _3391 = _3375 * _3387;
    float _3393 = _3389 * _3389;
    float _3395 = _3391 * _3391;
    float _3397 = _3393 + _3395;
    float _3399 = sqrt(_3397);
    bool _3401 = _3399 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3403 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3405 = _3399 + _3403;
    float _3407 = _3361;
    float _3409 = _3397;
    float _3411 = _3405;
    float _3413 = _3367;
    float _3415 = _3389;
    float _3417 = _3391;
    float _3419 = _3393;
    float _3421 = _3395;
    if (_3401)
    {
        float _3423 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3407 = _3423;
    }
    float _3425 = _3407;
    if (_3401)
    {
        float _3427 = rsqrt(_3397);
        _3409 = _3427;
    }
    float _3429 = _3409;
    if (_3401)
    {
        float _3431 = _3405 * _3425;
        _3411 = _3431;
    }
    float _3433 = _3411;
    if (_3401)
    {
        float _3435 = _3433 * 0.15915493667125701904296875;
        _3120 = _3435;
    }
    float _3437 = _3120;
    float _3439 = _3297;
    if (_3401)
    {
        float _3441 = _3437 * 6.283185482025146484375;
        float _3443 = sin(_3441);
        _3439 = _3443;
    }
    float _3445 = _3439;
    float _3447 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3449 = precise::max(0.0, _3447);
    float _3451 = _3146;
    float _3453 = _3445;
    float _3455 = _3447;
    float _3457 = _3449;
    if (_3401)
    {
        float _3459 = _3437 * 6.283185482025146484375;
        float _3461 = cos(_3459);
        _3451 = _3461;
    }
    float _3463 = _3451;
    float _3465 = -_3387;
    float _3467 = -_3449;
    float _3469 = fma(_3367, _3465, _3467);
    if (_3401)
    {
        float _3471 = _3469 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3413 = _3471;
    }
    float _3473 = _3413;
    float _3475 = _3473;
    if (_3401)
    {
        float _3477 = fma(_3445, _3473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3453 = _3477;
    }
    float _3479 = _3453;
    float _3481 = _3479;
    if (!_3401)
    {
        _3475 = _3469;
    }
    float _3483 = _3475;
    float _3485 = _3483;
    if (_3401)
    {
        float _3487 = _3463 + (-1.0);
        _3455 = _3487;
    }
    float _3489 = _3455;
    if (_3401)
    {
        float _3491 = _3429 * _3479;
        _3481 = _3491;
    }
    float _3493 = _3481;
    if (_3401)
    {
        float _3495 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3457 = _3495;
    }
    float _3497 = _3457;
    if (_3401)
    {
        float _3499 = _3389 * _3493;
        _3415 = _3499;
    }
    float _3501 = _3415;
    if (_3401)
    {
        float _3503 = _3391 * _3493;
        _3417 = _3503;
    }
    float _3505 = _3417;
    if (_3401)
    {
        float _3507 = fma(_3469, _3463, _3497);
        _3485 = _3507;
    }
    float _3509 = _3485;
    if (_3401)
    {
        float _3511 = _3501 * _3501;
        _3419 = _3511;
    }
    float _3513 = _3419;
    if (_3401)
    {
        float _3515 = _3505 * _3505;
        _3421 = _3515;
    }
    float _3517 = _3421;
    float _3519 = fma(_3509, _3509, _3513);
    float _3521 = _3519 + _3517;
    float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3525 = fma(_3385, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3523);
    float _3527 = precise::clamp(_3525, 0.0, 1.0);
    float _3529 = -_3527;
    float _3531 = _3529 + 1.0;
    float _3533 = rsqrt(_3521);
    float _3535 = _3533 * _3509;
    float _3537 = _3533 * _3501;
    float _3539 = abs(_3531);
    float _3541 = log2(_3539);
    float _3543 = _3533 * _3505;
    float _3545 = _3537 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3547 = -_3545;
    float _3549 = fma(_3535, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3547);
    float _3551 = -_3543;
    float _3553 = fma(_3551, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3549);
    float _3555 = fma(_3553, -0.5, 0.5);
    float _3557 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3559 = fma(_3553, 0.5, 0.5);
    float _3561 = sqrt(_3555);
    float _3563 = fma(_3559, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3565 = fma(_3559, _3563, -0.212114393711090087890625);
    float _3567 = _3535 + 1.0;
    float _3569 = exp2(_3557);
    float _3571 = fma(_3559, _3565, 1.570728778839111328125);
    float _3573 = _3561 * 0.636619746685028076171875;
    float _3575 = -_3571;
    float _3577 = fma(_3573, _3575, 1.0);
    float _3579 = -_3535;
    float _3581 = fma(_3569, _3567, _3579);
    float _3583 = fma(_3581, 0.5, 0.5);
    float2 _9545 = float2(_3577, _3583);
    float3 _3587 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9545, float2(0.0), isnan(_9545)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9545, float2(0.0), isnan(_9545)), level(0.0)).xyz;
    float _3589 = _3587.x;
    float _3591 = _3587.y;
    float _3593 = _3587.z;
    float _3595 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3597 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3599 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3601 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3603 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3595);
    float _3605 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3597);
    float _3607 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3609 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3611 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3613 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3599);
    float _3615 = -_2476;
    float _3617 = fma(_3615, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3607);
    float _3619 = -_2476;
    float _3621 = fma(_3619, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3609);
    float _3623 = -_2476;
    float _3625 = fma(_3623, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3611);
    float _3627 = fma(_3601, _3601, 1.0);
    float _3629 = abs(_2456);
    float _3631 = log2(_3629);
    float _3633 = _2542 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3635 = _2542 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3637 = _2542 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3639 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3617);
    float _3641 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3633);
    float _3643 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3635);
    float _3645 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3621);
    float _3647 = rsqrt(_3627);
    float _3649 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3605);
    float _3651 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3603);
    float _3653 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3613);
    float _3655 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3657 = _3601 * _3639;
    float _3659 = _3601 * _3645;
    float _3661 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3625);
    float _3663 = _3631 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3665 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3637);
    float _3667 = fma(_3655, _3651, _3657);
    float _3669 = fma(_3655, _3649, _3659);
    float _3671 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3643);
    float _3673 = _3601 * _3661;
    float _3675 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3641);
    float _3677 = exp2(_3663);
    float _3679 = _3601 * _3647;
    float _3681 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3665);
    float _3683 = _3004 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_78.x = _3651;
    out.m_78.y = _3649;
    out.m_78.z = _3653;
    float _3685 = fma(_3655, _3653, _3673);
    float _3687 = -_3681;
    float _3689 = _3679 * _3687;
    float _3691 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3683);
    float _3693 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3695 = -_3671;
    float _3697 = _3679 * _3695;
    float _3699 = _3671 + _3667;
    float _3701 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3691);
    float _3703 = -_1760;
    float _3705 = _3703 + 1.0;
    float _3707 = exp2(_3693);
    float _3709 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3701);
    float _3711 = -_3675;
    float _3713 = _3679 * _3711;
    float _3715 = fma(_3677, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3717 = precise::clamp(_3715, 0.0, 1.0);
    float _3719 = _3675 + _3669;
    float _3721 = _3681 + _3685;
    float _3723 = fma(_3647, _3645, _3713);
    float _3725 = fma(_3647, _3661, _3689);
    float _3727 = _3048 * 0.5;
    bool _3729 = _2456 <= 8000.0;
    bool _3731 = isnan(_2456);
    bool _3733 = _3729 || _3731;
    bool _3735 = isnan(8000.0);
    bool _3737 = _3733 || _3735;
    float _3739 = float(_3737);
    out.gl_Position.x = _3078;
    out.gl_Position.y = _3080;
    out.gl_Position.z = _3709;
    out.gl_Position.w = _3048;
    float _3741 = fma(_3647, _3639, _3697);
    float _3743 = fma(_3080, -0.5, _3727);
    float _3745 = _3709 + _3048;
    float _3747 = _3078 + _3048;
    out.m_80.x = _3741;
    out.m_80.y = _3723;
    out.m_80.z = _3725;
    float _3749 = fma(_3717, -2.0, 3.0);
    float _3751 = _3717 * _3717;
    float _3753 = _3745 * 0.5;
    float _3755 = _3747 * 0.5;
    out.m_82.x = _3699;
    out.m_82.y = _3719;
    out.m_82.z = _3721;
    float _3757 = _3751 * _3749;
    float _3759 = -_3707;
    float _3761 = _3759 + 1.0;
    if (!_3034)
    {
        _3086 = 1.0;
    }
    float _3763 = _3086;
    out.m_84.x = _3755;
    out.m_84.y = _3743;
    out.m_84.z = _3753;
    out.m_84.w = _3048;
    float _3765 = -_3757;
    float _3767 = _3765 + 1.0;
    float _3769 = _3761 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3771 = _3763;
    float _3773 = _3769;
    if (_3034)
    {
        bool _3775 = _3152 >= _3100;
        bool _3777 = isnan(_3152);
        bool _3779 = _3775 || _3777;
        bool _3781 = isnan(_3100);
        bool _3783 = _3779 || _3781;
        float _3785 = float(_3783);
        _3771 = _3785;
    }
    float _3787 = _3771;
    out.m_86.x = _2976;
    out.m_86.y = _2974;
    out.m_86.z = _2978;
    float _3789 = fma(_3767, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3757);
    float _3791 = _3769 * _3154;
    float _3793 = -_3769;
    float _3795 = _3793 + 1.0;
    bool _3797 = _3385 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3799 = isnan(_3385);
    bool _3801 = _3797 || _3799;
    bool _3803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3805 = _3801 || _3803;
    float _3807 = _3739 * _3789;
    float _3809 = _3787 * _3363;
    float _3811 = _3165 * _3795;
    float _3813 = _3807 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3815 = _3705 * _3813;
    float _3817 = precise::clamp(_3815, 0.0, 1.0);
    float _3819 = _3165 * _3791;
    float _3821 = -_3817;
    float _3823 = fma(_3821, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3825 = _3795;
    if (!_3805)
    {
        _3064 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3827 = _3064;
    float _3829 = _3827;
    float _3831 = _3827;
    if (!_3805)
    {
        _3825 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3833 = _3825;
    float _3835 = -_3809;
    float _3837 = fma(_3835, _3823, 1.0);
    float _3839 = precise::clamp(_3837, 0.0, 1.0);
    float _3841 = _3833;
    float _3843 = _3833;
    if (!_3805)
    {
        _3773 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3845 = _3773;
    float _3847 = _3839 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _3847;
    float _3849 = _3847;
    float _3851 = _3845;
    float _3853 = _3845;
    if (!_3805)
    {
        _3849 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3855 = _3849;
    float _3857 = _3593 * _3791;
    float _3859 = fma(_3589, _3819, _3159);
    float _3861 = fma(_3591, _3819, _3161);
    float _3863 = _3241 * _3299;
    float _3865 = fma(_3165, _3857, _3163);
    float _3867 = _3863;
    float _3869 = _3855;
    float _3871 = _3855;
    if (!_3805)
    {
        _3189 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3873 = _3189;
    float _3875 = _3863 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3877 = _3873;
    float _3879 = _3873;
    if (!_3805)
    {
        _3867 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3881 = _3867;
    out.m_90.x = _3859;
    out.m_90.y = _3861;
    out.m_90.z = _3865;
    out.m_90.w = _3811;
    bool _3883 = !_3805;
    float _3885 = _3881;
    float _3887 = _3881;
    if (!_3883)
    {
        bool _3889 = _3385 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3891 = isnan(_3385);
        bool _3893 = _3889 || _3891;
        bool _3895 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3897 = _3893 || _3895;
        if (!_3897)
        {
            float _3899 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3901 = _3385 + _3899;
            float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3905 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3903;
            float _3907 = 1.0 / _3905;
            float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3911 = _3909 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3915 = _3913 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3919 = _3917 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3921 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3923 = _3921 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3929 = _3901 * _3907;
            float _3931 = precise::clamp(_3929, 0.0, 1.0);
            float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3935 = _3933 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3937 = fma(_3931, _3911, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3939 = fma(_3931, _3935, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3941 = fma(_3931, _3915, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3943 = fma(_3931, _3919, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3945 = fma(_3931, _3923, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3947 = fma(_3931, _3927, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3831 = _3939;
            _3871 = _3945;
            _3879 = _3937;
            _3853 = _3943;
            _3843 = _3941;
            _3887 = _3947;
            _3949 = true;
        }
        else
        {
            bool _3951 = _3385 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3953 = isnan(_3385);
            bool _3955 = _3951 || _3953;
            bool _3957 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3959 = _3955 || _3957;
            if (!_3959)
            {
                _3877 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3961 = _3877;
            _3879 = _3961;
            if (!_3959)
            {
                _3829 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3963 = _3829;
            _3831 = _3963;
            if (!_3959)
            {
                _3841 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3965 = _3841;
            _3843 = _3965;
            if (!_3959)
            {
                _3851 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3967 = _3851;
            _3853 = _3967;
            if (!_3959)
            {
                _3869 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3969 = _3869;
            _3871 = _3969;
            if (!_3959)
            {
                _3885 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3971 = _3885;
            bool _3973 = !_3959;
            _3887 = _3971;
            if (!_3973)
            {
                bool _3975 = _3385 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3977 = isnan(_3385);
                bool _3979 = _3975 || _3977;
                bool _3981 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3983 = _3979 || _3981;
                if (!_3983)
                {
                    float _3985 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3987 = _3385 + _3985;
                    float _3989 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3991 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3989;
                    float _3993 = 1.0 / _3991;
                    float _3995 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3997 = _3995 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3999 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4001 = _3999 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4003 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4005 = _4003 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4007 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4009 = _4007 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4013 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4015 = _3987 * _3993;
                    float _4017 = precise::clamp(_4015, 0.0, 1.0);
                    float _4019 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4021 = _4019 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4023 = fma(_4017, _3997, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4025 = fma(_4017, _4021, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4027 = fma(_4017, _4001, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4029 = fma(_4017, _4005, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4031 = fma(_4017, _4009, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4033 = fma(_4017, _4013, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3831 = _4025;
                    _3871 = _4031;
                    _3879 = _4023;
                    _3853 = _4029;
                    _3843 = _4027;
                    _3887 = _4033;
                    _3949 = true;
                }
                else
                {
                    _3831 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3871 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3879 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3853 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3843 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3887 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3949 = false;
    float _4035 = _3831;
    float _4037 = _3871;
    float _4039 = _3879;
    float _4041 = _3853;
    float _4043 = _3843;
    float _4045 = _3887;
    float _4047 = fma(_3719, -0.5, 0.5);
    float _4049 = precise::clamp(_4047, 0.0, 1.0);
    float _4051 = _3875 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4053 = -_4035;
    float _4055 = _4053 + _4037;
    float _4057 = -_4039;
    float _4059 = _4057 + _4041;
    out.m_92.x = 0.0;
    float _4061 = fma(_4049, _4055, _4035);
    float _4063 = -_4043;
    float _4065 = _4063 + _4045;
    float _4067 = fma(_4049, _4059, _4039);
    out.m_59.x = _4051;
    float _4069 = _4061 * 0.586610972881317138671875;
    bool _4071 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4073 = fma(_4049, _4065, _4043);
    float _4075 = fma(_4067, 0.298911988735198974609375, _4069);
    bool _4077 = _3241 > 0.0;
    bool _4079 = isnan(_3241);
    bool _4081 = _4077 || _4079;
    bool _4083 = isnan(0.0);
    bool _4085 = _4081 || _4083;
    float _4087 = fma(_4073, 0.114477999508380889892578125, _4075);
    bool _4089 = _3299 <= 0.0;
    bool _4091 = !_4085;
    bool _4093 = _4089 || _4091;
    float _4095 = -_4087;
    float _4097 = _4067 + _4095;
    float _4099 = -_4087;
    float _4101 = _4061 + _4099;
    float _4103 = -_4087;
    float _4105 = _4073 + _4103;
    float _4107 = fma(_4097, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4087);
    float _4109 = fma(_4101, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4087);
    float _4111 = fma(_4105, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4087);
    bool _4113 = !_4071;
    if (!_4113)
    {
        float _4115 = -_2974;
        float _4117 = _4115 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4119 = -_2976;
        float _4121 = _4119 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4123 = -_2978;
        float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4127 = _4117 * _4117;
        float _4129 = fma(_4121, _4121, _4127);
        float _4131 = fma(_4125, _4125, _4129);
        float _4133 = sqrt(_4131);
        float _4135 = rsqrt(_4131);
        float _4137 = -_4133;
        float _4139 = _4137 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4141 = _4139 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4143 = precise::clamp(_4141, 0.0, 1.0);
        float _4145 = _4121 * _4135;
        float _4147 = _4117 * _4135;
        float _4149 = abs(_4143);
        float _4151 = log2(_4149);
        float _4153 = _4125 * _4135;
        float _4155 = _4145 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4157 = _3719 * _4147;
        float _4159 = -_4147;
        float _4161 = -_4155;
        float _4163 = fma(_4159, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4161);
        float _4165 = fma(_3699, _4145, _4157);
        float _4167 = -_4153;
        float _4169 = fma(_4167, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4163);
        float _4171 = fma(_3721, _4153, _4165);
        float _4173 = precise::clamp(_4171, 0.0, 1.0);
        float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4177 = _4169 + _4175;
        float _4179 = _4151 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4181 = _4177 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4183 = precise::clamp(_4181, 0.0, 1.0);
        float _4185 = exp2(_4179);
        float _4187 = _4185 * _4183;
        float _4189 = _4173 * _4187;
        float _4191 = _4189 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4193 = _4189 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4195 = _4189 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _4191;
        out.m_92.y = _4193;
        out.m_92.z = _4195;
    }
    out.m_94.x = _4107;
    out.m_94.y = _4109;
    out.m_94.z = _4111;
    if (!_4093)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4197 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4197;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3949 = false;
    bool _351 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_59.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4254 = as_type<float>(_129);
        out.gl_Position.z = _4254;
    }
    if (!_117)
    {
        return out;
    }
    float _133 = in.m_61.w;
    float _135 = in.m_63.x;
    bool _137 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_133);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_133;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_65.x = _135;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_113);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _123;
    if (_163)
    {
        out.m_59.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _131 = as_type<int>(_167);
    }
    int _169 = _131;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4327 = as_type<float>(_169);
        out.gl_Position.z = _4327;
    }
    if (_163)
    {
        return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = in.m_70.w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_61.x;
    float _189 = in.m_61.y;
    float _191 = in.m_61.z;
    float _193 = in.m_56.x;
    float _195 = in.m_56.y;
    float _197 = in.m_56.z;
    float _199 = 0.0;
    if (!_185)
    {
        float _201 = _173 * _173;
        float _203 = _201 * 0.5;
        _199 = _203;
    }
    float _205 = _199;
    float _207 = _205;
    if (!_185)
    {
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    int _213 = as_type<int>(_171) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_171) & 2;
    bool _219 = _217 != 0;
    bool _221 = !_215;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_219;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_185;
    float _231 = _211;
    if (!_229)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = _173 * _235;
        float _245 = 1.0 / _239;
        float _247 = _241 * 0.693147182464599609375;
        float _249 = exp2(_243);
        float _251 = 1.0 / _247;
        float _253 = _249 + (-1.0);
        float _255 = -_253;
        float _257 = fma(_255, _251, _173);
        float _259 = _257 * _245;
        float _261 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _261;
    }
    float _263 = _231;
    float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _271 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _273 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _275 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _277 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[8].x, _271);
    float _279 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[8].y, _273);
    float _281 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[8].z, _275);
    float _283 = _273;
    if (!_185)
    {
        _283 = _173;
    }
    float _285 = _283;
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[10].x, _277);
    bool _289 = !_185;
    float _291 = _285;
    if (!_289)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = 1.0 / _299;
        float _303 = _173 * _295;
        float _305 = exp2(_303);
        float _307 = -_305;
        float _309 = _307 + 1.0;
        float _311 = _309 * _301;
        _291 = _311;
    }
    float _313 = _291;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _317 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[10].y, _279);
    float _319 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[10].z, _281);
    float _321 = fma(_313, _187, _287);
    float _323 = fma(_313, _189, _317);
    float _325 = fma(_313, _191, _319);
    float _327 = fma(_321, _175, _193);
    float _329 = fma(_323, _175, _195);
    float _331 = fma(_325, _175, _197);
    bool _333 = !_315;
    float _349;
    if (!_333)
    {
        float _335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _337 = _135 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _341 = _339 * _335;
        float _343 = floor(_341);
        float _345 = -_343;
        float _347 = _341 + _345;
        _349 = _347;
        _351 = true;
    }
    else
    {
        float _353 = float(_113);
        float _355 = 1.0 / _353;
        float _357 = _149 * _355;
        _349 = _357;
    }
    _351 = false;
    float _359 = _349;
    float _361 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _363 = int(_361);
    float _365 = float(_113);
    float _367 = _329 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _369 = _329 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _371 = _329 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _373 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[5].x, _367);
    float _375 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[4].x, _369);
    float _377 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _379 = int(_377);
    float _381 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[6].x, _371);
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _385 = float(_363);
    float _387 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _389 = int(_387);
    float _391 = float(uint(_379));
    float _393 = 1.0 / _385;
    int _395 = ~_379;
    int _397 = _395 + 1;
    float _399 = float(_379);
    bool _401 = _379 == 0;
    float _403 = 1.0 / _391;
    float _405 = float(_389);
    float _407 = _393 * _149;
    int _409 = ~_379;
    int _411 = _409 + 1;
    float _413 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _415 = int(_413);
    int _417 = as_type<int>(_403) + (-2);
    float _419 = trunc(_407);
    int _421 = int(_419);
    float _423 = 1.0 / _405;
    float _425 = float(uint(_415));
    int _427 = ~_415;
    int _429 = _427 + 1;
    int _431 = ~_415;
    int _433 = _431 + 1;
    float _435 = float(uint(_421));
    float _437 = 1.0 / _425;
    float _439 = as_type<float>(_417) * _435;
    float _441 = _423 * _149;
    float _443 = 1.0 / _365;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _447 = _445 != 0;
    float _449 = trunc(_439);
    float _451 = precise::max(_449, 0.0);
    uint _454 = uint(_451);
    float _456 = _405;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_447)
    {
        _456 = 1.0;
    }
    float _460 = _456;
    float _462 = trunc(_441);
    int _464 = int(_462);
    float _466 = _460;
    if (!_447)
    {
        _466 = 7.345489978790283203125;
    }
    float _468 = _466;
    float _470 = _468 * _135;
    int _472 = _411 * int(_454);
    int _474 = _472 + _421;
    float _476 = float(uint(_474));
    int _478 = as_type<int>(_437) + (-2);
    float _480 = float(uint(_464));
    float _482 = as_type<float>(_417) * _476;
    float _484 = floor(_470);
    float _486 = as_type<float>(_478) * _480;
    float _488 = trunc(_482);
    float _490 = precise::max(_488, 0.0);
    uint _492 = uint(_490);
    float _494 = trunc(_486);
    float _496 = precise::max(_494, 0.0);
    uint _498 = uint(_496);
    float _500 = -_484;
    float _502 = _470 + _500;
    int _504 = int(_454) + int(_492);
    float _506 = float(_421);
    int _508 = _397 * _504;
    int _510 = _508 + _421;
    bool _512 = _506 >= _399;
    bool _514 = isnan(_506);
    bool _516 = _512 || _514;
    bool _518 = isnan(_399);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    int _524 = _429 * int(_498);
    int _526 = _524 + _464;
    bool _528 = uint(_510) >= uint(_379);
    float _530 = trunc(_522);
    int _532 = int(_530);
    float _534 = float(uint(_526));
    bool _536 = !_528;
    int _538 = _536 ? 0 : (-1);
    float _540 = as_type<float>(_478) * _534;
    int _542 = ~_504;
    int _544 = _542 + _538;
    int _546 = _544 + 1;
    float _548 = _502 * _399;
    float _550 = in.m_63.y;
    int _552 = _379 * _546;
    int _554 = _552 + _421;
    float _556 = trunc(_540);
    float _558 = precise::max(_556, 0.0);
    uint _560 = uint(_558);
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _568 = _566 != 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _572 = _570 != 0;
    int _574 = ~_532;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    bool _580 = !_401;
    int _582 = _580 ? _554 : (-1);
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _586 = _584 != 0;
    float _588 = trunc(_548);
    int _590 = int(_588);
    int _592 = _379 + (-1);
    int _594 = _582 * _578;
    bool _596 = !_568;
    int _598 = _596 ? 0 : 1;
    float _600 = _443 * _149;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _604 = _602 != 0;
    int _606 = _532 * _592;
    int _608 = _606 + _594;
    bool _610 = !_586;
    int _612 = _610 ? 0 : 1;
    float _614 = _399 * _600;
    int _616 = abs(_598);
    int _618 = abs(_612);
    float _620 = trunc(_614);
    int _622 = int(_620);
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _626 = _624 != 0;
    int _628 = _590 * _618;
    int _630 = _628 + _421;
    int _632 = int(_498) + int(_560);
    int _634 = _608 * _616;
    float _636 = as_type<float>(_546);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_604)
    {
        _636 = _135;
    }
    float _640 = _636;
    float _642 = _640;
    if (_604)
    {
        _458 = 1.0;
    }
    float _644 = _458;
    float _646 = _644;
    if (!_604)
    {
        _642 = _550;
    }
    float _648 = _642;
    if (!_604)
    {
        _646 = 1.2345600128173828125;
    }
    float _650 = _646;
    int _652 = ~_415;
    int _654 = _652 + 1;
    float _656 = float(_415);
    float _658 = _648 * _650;
    bool _660 = !_564;
    int _662 = _660 ? 0 : 1;
    bool _664 = !_572;
    int _666 = _664 ? 0 : 1;
    float _668 = floor(_658);
    int _670 = abs(_662);
    bool _672 = !_626;
    int _674 = _672 ? 0 : 1;
    int _676 = abs(_666);
    int _678 = _622 * _670;
    int _680 = _678 + _634;
    int _682 = abs(_674);
    int _684 = _654 * _632;
    int _686 = _684 + _464;
    float _688 = float(_464);
    int _690 = _630 * _676;
    int _692 = _690 + _680;
    bool _694 = _688 >= _656;
    bool _696 = isnan(_688);
    bool _698 = _694 || _696;
    bool _700 = isnan(_656);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -_668;
    float _708 = _658 + _706;
    bool _710 = uint(_686) >= uint(_415);
    int _712 = _590 * _682;
    int _714 = _712 + _692;
    bool _716 = _415 == 0;
    float _718 = _708 * _656;
    float _720 = trunc(_704);
    int _722 = int(_720);
    bool _724 = !_710;
    int _726 = _724 ? 0 : (-1);
    float _728 = _656 * _600;
    float _730 = float(uint(_714));
    int _732 = ~_632;
    int _734 = _732 + _726;
    int _736 = _734 + 1;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _740 = _738 != 0;
    float _742 = trunc(_718);
    int _744 = int(_742);
    float _746 = as_type<float>(_417) * _730;
    int _748 = _415 * _736;
    int _750 = _748 + _464;
    bool _752 = !_740;
    int _754 = _752 ? 0 : 1;
    int _756 = ~_379;
    int _758 = _756 + 1;
    bool _760 = !_716;
    int _762 = _760 ? _750 : (-1);
    float _764 = trunc(_746);
    float _766 = precise::max(_764, 0.0);
    uint _768 = uint(_766);
    int _770 = ~_722;
    int _772 = _770 + 1;
    int _774 = _772 + 1;
    int _776 = abs(_754);
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _780 = _778 != 0;
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _784 = _782 != 0;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _788 = _786 != 0;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _792 = _790 != 0;
    int _794 = _762 * _774;
    int _796 = _415 + (-1);
    float _798 = trunc(_728);
    int _800 = int(_798);
    int _802 = _744 * _776;
    int _804 = _802 + _464;
    bool _806 = !_784;
    int _808 = _806 ? 0 : 1;
    int _810 = _722 * _796;
    int _812 = _810 + _794;
    bool _814 = !_780;
    int _816 = _814 ? 0 : 1;
    int _818 = abs(_808);
    int _820 = _758 * int(_768);
    int _822 = _820 + _714;
    bool _824 = !_788;
    int _826 = _824 ? 0 : 1;
    int _828 = abs(_816);
    float _830 = float(uint(_822));
    int _832 = abs(_826);
    int _834 = _812 * _818;
    float _836 = as_type<float>(_417) * _830;
    bool _838 = !_792;
    int _840 = _838 ? 0 : 1;
    int _842 = _800 * _828;
    int _844 = _842 + _834;
    float _846 = float(uint(_630));
    float _848 = trunc(_836);
    float _850 = precise::max(_848, 0.0);
    uint _852 = uint(_850);
    int _854 = abs(_840);
    int _856 = _804 * _832;
    int _858 = _856 + _844;
    int _860 = ~_379;
    int _862 = _860 + 1;
    float _864 = as_type<float>(_417) * _846;
    bool _866 = _379 == 0;
    int _868 = _744 * _854;
    int _870 = _868 + _858;
    int _872 = ~_379;
    int _874 = _872 + 1;
    float _876 = trunc(_864);
    float _878 = precise::max(_876, 0.0);
    uint _880 = uint(_878);
    float _882 = float(uint(_804));
    float _884 = float(uint(_870));
    float _886 = as_type<float>(_478) * _882;
    float _888 = as_type<float>(_478) * _884;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _892 = trunc(_886);
    float _894 = precise::max(_892, 0.0);
    uint _896 = uint(_894);
    int _898 = int(_768) + int(_852);
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _902 = ~_415;
    int _904 = _902 + 1;
    int _906 = _862 * int(_880);
    int _908 = _906 + _630;
    float _910 = _550 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _912 = _874 * _898;
    int _914 = _912 + _714;
    float _916 = trunc(_888);
    float _918 = precise::max(_916, 0.0);
    uint _920 = uint(_918);
    float _922 = float(uint(_908));
    bool _924 = uint(_914) >= uint(_379);
    float _926 = as_type<float>(_417) * _922;
    bool _928 = !_924;
    int _930 = _928 ? 0 : (-1);
    int _932 = _433 * int(_896);
    int _934 = _932 + _804;
    int _936 = ~_898;
    int _938 = _936 + _930;
    int _940 = _938 + 1;
    float _942 = trunc(_926);
    float _944 = precise::max(_942, 0.0);
    uint _946 = uint(_944);
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _950 = _904 * int(_920);
    int _952 = _950 + _870;
    int _954 = _379 * _940;
    int _956 = _954 + _714;
    int _958 = ~_379;
    int _960 = _958 + 1;
    float _962 = float(uint(_952));
    bool _964 = !_866;
    int _966 = _964 ? _956 : (-1);
    float _968 = as_type<float>(_478) * _962;
    int _970 = _966 & 3;
    bool _972 = _970 != 0;
    int _974 = _966 & 3;
    bool _976 = _974 != 0;
    float _978 = trunc(_968);
    float _980 = precise::max(_978, 0.0);
    uint _982 = uint(_980);
    bool _984 = uint(_970) > 1u;
    int _986 = int(_880) + int(_946);
    int _988 = _976 ? 0 : 1;
    bool _990 = _970 != 3;
    int _992 = _960 * _986;
    int _994 = _992 + _630;
    int _996 = ~_988;
    int _998 = _996 + 1;
    int _1000 = _998 + 1;
    bool _1002 = uint(_994) >= uint(_379);
    int _1004 = _1000;
    int _1006 = 1;
    if (!_984)
    {
        int _1008 = ~_988;
        int _1010 = _1008 + 1;
        _1004 = _1010;
    }
    int _1012 = _1004;
    int _1014 = int(_920) + int(_982);
    float _1016 = in.m_63.z;
    int _1018 = ~_415;
    int _1020 = _1018 + 1;
    bool _1022 = uint(_970) >= 2u;
    bool _1024 = !_1002;
    int _1026 = _1024 ? 0 : (-1);
    int _1028 = _1020 * _1014;
    int _1030 = _1028 + _870;
    int _1032 = _1022 ? 0 : 1;
    int _1034 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1036 = _1034 != 0;
    bool _1038 = uint(_1030) >= uint(_415);
    float _1040 = in.m_63.w;
    int _1042 = ~_1032;
    int _1044 = _1042 + 1;
    int _1046 = _1044 + 1;
    int _1048 = _1046;
    if (_604)
    {
        _1006 = 0;
    }
    int _1050 = _1006;
    int _1052 = _1050;
    if (_990)
    {
        int _1054 = ~_1032;
        int _1056 = _1054 + 1;
        _1048 = _1056;
    }
    int _1058 = _1048;
    if (!_604)
    {
        _1052 = 1;
    }
    int _1060 = _1052;
    bool _1062 = _135 > 0.5;
    bool _1064 = _1060 != 1;
    float _1066 = -_223;
    int _1068 = _1062 ? as_type<int>(_1066) : as_type<int>(_223);
    bool _1070 = _550 > 0.5;
    bool _1072 = !_1036;
    float _1074 = _1072 ? _223 : as_type<float>(_1068);
    float _1076 = -_227;
    int _1078 = _1070 ? as_type<int>(_1076) : as_type<int>(_227);
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1082 = _1080 != 0;
    float _1084 = _1074 + 0.5;
    bool _1086 = _1016 > 0.5;
    bool _1088 = !_1038;
    int _1090 = _1088 ? 0 : (-1);
    bool _1092 = !_972;
    int _1094 = _1092 ? 0 : 1;
    bool _1096 = !_1082;
    float _1098 = _1096 ? _227 : as_type<float>(_1078);
    float _1100 = -_223;
    int _1102 = _1086 ? as_type<int>(_1100) : as_type<int>(_223);
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1106 = _1104 != 0;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1110 = _1108 != 0;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1114 = _1112 != 0;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1118 = _1116 != 0;
    float _1120 = 0.0;
    if (!_1064)
    {
        _1120 = _550;
    }
    float _1122 = _1120;
    float _1124 = 0.0;
    float _1126 = _1122;
    if (!_1064)
    {
        _1124 = _550;
    }
    float _1128 = _1124;
    float _1130 = _1128;
    if (!_1064)
    {
        _638 = _1016;
    }
    float _1132 = _638;
    float _1134 = 0.0;
    float _1136 = _1132;
    if (!_1064)
    {
        _1134 = _1016;
    }
    float _1138 = _1134;
    float _1140 = _1138;
    if (_1064)
    {
        _1126 = _135;
    }
    float _1142 = _1126;
    if (_1064)
    {
        _1130 = _135;
    }
    float _1144 = _1130;
    if (_1064)
    {
        _1136 = _550;
    }
    float _1146 = _1136;
    if (_1064)
    {
        _1140 = _550;
    }
    float _1148 = _1140;
    bool _1150 = _1040 > 0.5;
    float _1152 = _135 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1154 = ~_1014;
    int _1156 = _1154 + _1090;
    int _1158 = _1156 + 1;
    bool _1160 = !_1114;
    float _1162 = _1160 ? _223 : as_type<float>(_1102);
    float _1164 = -_890;
    float _1166 = fma(_1152, 2.0, _1164);
    float _1168 = float(uint(_934));
    float _1170 = fma(_910, -2.0, _900);
    float _1172 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[4].z, _375);
    float _1174 = -_149;
    float _1176 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1166);
    float _1178 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[5].z, _373);
    float _1180 = as_type<float>(_478) * _1168;
    float _1182 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[6].z, _381);
    float _1184 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1176);
    float _1186 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1170);
    float _1188 = _1098 + (-0.5);
    int _1190 = _415 * _1158;
    int _1192 = _1190 + _870;
    float _1194 = trunc(_1180);
    float _1196 = precise::max(_1194, 0.0);
    uint _1198 = uint(_1196);
    float _1200 = -_1188;
    float _1202 = -_1186;
    float _1204 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1202);
    float _1206 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1208 = !_716;
    int _1210 = _1208 ? _1192 : (-1);
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1214 = _1178 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1218 = _966 >> 31;
    float _1220 = -_383;
    float _1222 = fma(_1206, 2.0, _1220);
    float _1224 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1212);
    float _1226 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1228 = _1218 & 3;
    float _1230 = _1172 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1232 = ~_415;
    int _1234 = _1232 + 1;
    float _1236 = fma(_1226, -2.0, _948);
    int _1238 = int(_896) + int(_1198);
    float _1240 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1216);
    int _1242 = _1210 >> 31;
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1246 = _1230 + _1244;
    int _1248 = _966 + _1228;
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1252 = _1214 + _1250;
    int _1254 = _1242 & 3;
    int _1256 = _1234 * _1238;
    int _1258 = _1256 + _804;
    int _1260 = _1248 >> 2;
    float _1262 = _1182 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1264 = _1210 + _1254;
    float _1266 = _1162 + 0.5;
    int _1268 = _1260 << 4;
    int _1270 = _1268 + 368;
    float _1272 = -_149;
    float _1274 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1222);
    int _1276 = _1264 >> 2;
    float _1278 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1236);
    float _1280 = -_227;
    int _1282 = _1150 ? as_type<int>(_1280) : as_type<int>(_227);
    float _1284 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1224);
    int _1286 = _1276 << 4;
    int _1288 = _1286 + 512;
    float _1290 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1240);
    uint _1292 = uint(int(uint(_1270) >> uint(2)));
    uint _1294 = uint(int(uint(int(_1292)) >> uint(2)));
    int _1296 = int(_1292) & 3;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[int(_1294)][_1296];
    int _1300 = int(_1292) + 1;
    uint _1302 = uint(int(uint(_1300) >> uint(2)));
    int _1304 = _1300 & 3;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[int(_1302)][_1304];
    bool _1308 = _970 != 3;
    float _1310 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1312 = uint(_1258) >= uint(_415);
    float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1316 = _1262 + _1314;
    bool _1318 = !_1308;
    int _1320 = _1318 ? 0 : (-1);
    float _1322 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1310);
    int _1324 = ~_986;
    int _1326 = _1324 + _1026;
    int _1328 = _1326 + 1;
    uint _1330 = uint(int(uint(_1288) >> uint(2)));
    uint _1332 = uint(int(uint(int(_1330)) >> uint(2)));
    int _1334 = int(_1330) & 3;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[int(_1332)][_1334];
    int _1338 = int(_1330) + 1;
    uint _1340 = uint(int(uint(_1338) >> uint(2)));
    int _1342 = _1338 & 3;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[int(_1340)][_1342];
    bool _1346 = !_1118;
    float _1348 = _1346 ? _227 : as_type<float>(_1282);
    float _1350 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1322);
    int _1352 = _1210 & 3;
    bool _1354 = _1352 != 0;
    int _1356 = _379 * _1328;
    int _1358 = _1356 + _630;
    int _1360 = _1210 & 3;
    bool _1362 = _1360 != 0;
    float _1364 = _1348 + (-0.5);
    int _1366 = _1354 ? 0 : 1;
    int _1368 = _1270 + 8;
    uint _1370 = uint(int(uint(_1368) >> uint(2)));
    uint _1372 = uint(int(uint(int(_1370)) >> uint(2)));
    int _1374 = int(_1370) & 3;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[int(_1372)][_1374];
    int _1378 = int(_1370) + 1;
    uint _1380 = uint(int(uint(_1378) >> uint(2)));
    int _1382 = _1378 & 3;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[int(_1380)][_1382];
    bool _1386 = uint(_1360) > 1u;
    float _1388 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1274);
    bool _1390 = !_1312;
    int _1392 = _1390 ? 0 : (-1);
    float _1394 = -_1364;
    float _1396 = -_1278;
    float _1398 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1396);
    bool _1400 = !_1362;
    int _1402 = _1400 ? 0 : 1;
    int _1404 = ~_1238;
    int _1406 = _1404 + _1392;
    int _1408 = _1406 + 1;
    int _1410 = _1288 + 8;
    uint _1412 = uint(int(uint(_1410) >> uint(2)));
    uint _1414 = uint(int(uint(int(_1412)) >> uint(2)));
    int _1416 = int(_1412) & 3;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[int(_1414)][_1416];
    int _1420 = int(_1412) + 1;
    uint _1422 = uint(int(uint(_1420) >> uint(2)));
    int _1424 = _1420 & 3;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[int(_1422)][_1424];
    bool _1428 = uint(_1360) >= 2u;
    int _1430 = ~_1366;
    int _1432 = _1430 + 1;
    int _1434 = _1432 + 1;
    int _1436 = _415 * _1408;
    int _1438 = _1436 + _804;
    int _1440 = _1428 ? 0 : 1;
    int _1442 = _1434;
    if (!_1386)
    {
        int _1444 = ~_1366;
        int _1446 = _1444 + 1;
        _1442 = _1446;
    }
    int _1448 = _1442;
    bool _1450 = _1360 != 3;
    int _1452 = abs(_1012);
    bool _1454 = _1360 != 3;
    int _1456 = abs(_1448);
    int _1458 = abs(_1094);
    int _1460 = abs(_1402);
    int _1462 = ~_1452;
    int _1464 = _1462 + 1;
    int _1466 = _1464 + 1;
    int _1468 = ~_1440;
    int _1470 = _1468 + 1;
    int _1472 = _1470 + 1;
    int _1474 = ~_1456;
    int _1476 = _1474 + 1;
    int _1478 = _1476 + 1;
    int _1480 = _1466 * as_type<int>(_1306);
    int _1482 = _1472;
    if (_1450)
    {
        int _1484 = ~_1440;
        int _1486 = _1484 + 1;
        _1482 = _1486;
    }
    int _1488 = _1482;
    int _1490 = _1478 * as_type<int>(_1344);
    int _1492 = ~_1458;
    int _1494 = _1492 + 1;
    int _1496 = _1494 + 1;
    int _1498 = abs(_1058);
    int _1500 = abs(_1488);
    int _1502 = _1496 * as_type<int>(_1298);
    int _1504 = _1502 + _1480;
    int _1506 = ~_1460;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    int _1512 = abs(_1320);
    int _1514 = _1510 * as_type<int>(_1336);
    int _1516 = _1514 + _1490;
    int _1518 = ~_1498;
    int _1520 = _1518 + 1;
    int _1522 = _1520 + 1;
    int _1524 = ~_1500;
    int _1526 = _1524 + 1;
    int _1528 = _1526 + 1;
    bool _1530 = !_1106;
    int _1532 = _1530 ? 0 : 1;
    int _1534 = _1522 * as_type<int>(_1376);
    int _1536 = _1534 + _1504;
    bool _1538 = !_1454;
    int _1540 = _1538 ? 0 : (-1);
    int _1542 = _1528 * as_type<int>(_1418);
    int _1544 = _1542 + _1516;
    int _1546 = ~_1512;
    int _1548 = _1546 + 1;
    int _1550 = _1548 + 1;
    int _1552 = abs(_1540);
    int _1554 = abs(_1532);
    int _1556 = _1550 * as_type<int>(_1384);
    int _1558 = _1556 + _1536;
    bool _1560 = !_1110;
    int _1562 = _1560 ? 0 : 1;
    int _1564 = abs(_1562);
    int _1566 = ~_1554;
    int _1568 = _1566 + 1;
    int _1570 = _1568 + 1;
    int _1572 = ~_1552;
    int _1574 = _1572 + 1;
    int _1576 = _1574 + 1;
    int _1578 = _1558 * _1570;
    float _1580 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1582 = ~_1564;
    int _1584 = _1582 + 1;
    int _1586 = _1584 + 1;
    int _1588 = _1576 * as_type<int>(_1426);
    int _1590 = _1588 + _1544;
    bool _1592 = !_716;
    float _1594 = _1592 ? as_type<float>(_1438) : as_type<float>(0xffffffffu /* nan */);
    float _1596 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1598 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1580);
    int _1600 = _1590 * _1586;
    bool _1602 = !_866;
    int _1604 = _1602 ? _1358 : (-1);
    float _1606 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1596);
    float _1608 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1598);
    int _1610 = as_type<int>(_1594) * _1564;
    int _1612 = _1610 + _1600;
    float _1614 = _1252 * _1252;
    float _1616 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1606);
    float _1618 = -_1608;
    float _1620 = _1618 + 1.0;
    int _1622 = _1604 * _1554;
    int _1624 = _1622 + _1578;
    bool _1626 = _1350 >= 0.0;
    float _1628 = -_1616;
    float _1630 = _1628 + 1.0;
    float _1632 = fma(_1246, _1246, _1614);
    float _1634 = -_1284;
    float _1636 = _1634 + 1.0;
    float _1638 = -_1290;
    float _1640 = _1638 + 1.0;
    float _1642 = fma(_1098, _1630, _1204);
    float _1644 = fma(_1316, _1316, _1632);
    float _1646 = -_1620;
    float _1648 = fma(_1074, _1646, _1184);
    float _1650 = -_1636;
    float _1652 = fma(_1162, _1650, _1388);
    float _1654 = fma(_1348, _1640, _1398);
    float _1656 = float(_1624);
    float _1658 = rsqrt(_1644);
    float _1660 = _1594;
    if (_1626)
    {
        _1660 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1662 = _1660;
    out.m_72.x = _1648;
    out.m_72.y = _1642;
    out.m_72.z = _1652;
    out.m_72.w = _1654;
    float _1664 = float(_1612);
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1668 = _1666 != 0;
    int _1670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1672 = _1670 != 0;
    int _1674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1676 = _1674 != 0;
    int _1678 = as_type<int>(_1662);
    if (_1626)
    {
        float _1680 = _1662 * 5.0;
        _1678 = as_type<int>(_1680);
    }
    int _1682 = _1678;
    float _1684 = as_type<float>(_1682);
    if (_1626)
    {
        out.m_59.x = 0.0;
    }
    bool _1686 = !_1672;
    int _1688 = _1686 ? 0 : 1;
    if (_1626)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6531 = as_type<float>(_1682);
        out.gl_Position.z = _6531;
    }
    bool _1690 = !_1676;
    int _1692 = _1690 ? 0 : 1;
    bool _1694 = !_1668;
    int _1696 = _1694 ? 0 : 1;
    out.m_74.x = _1656;
    out.m_74.y = _1664;
    float _1698 = _1252 * _1658;
    float _1700 = _1246 * _1658;
    if (_1626)
    {
        return out;
    }
    float _1702 = -_1698;
    float _1704 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1214);
    float _1706 = _1316 * _1658;
    float _1708 = -_1700;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1230);
    float _1712 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1714 = _1704 + _1712;
    float _1716 = -_1706;
    float _1718 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1262);
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1722 = _1710 + _1720;
    float _1724 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1728 = _1718 + _1726;
    float _1730 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1724);
    float _1732 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1730);
    bool _1734 = _1732 >= 0.0;
    if (_1734)
    {
        _1684 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1736 = _1684;
    int _1738 = as_type<int>(_1736);
    if (_1734)
    {
        out.m_59.x = 0.0;
    }
    if (_1734)
    {
        float _1740 = _1736 * 5.0;
        _1738 = as_type<int>(_1740);
    }
    int _1742 = _1738;
    if (_1734)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6639 = as_type<float>(_1742);
        out.gl_Position.z = _6639;
    }
    if (_1734)
    {
        return out;
    }
    float _1744 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1746 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1748 = floor(_1744);
    float _1750 = floor(_1746);
    float _1752 = -_1748;
    float _1754 = _1744 + _1752;
    float _1756 = -_1750;
    float _1758 = _1746 + _1756;
    float2 _6675 = float2(_1754, _1758);
    float _1760 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6675, float2(0.0), isnan(_6675)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6675, float2(0.0), isnan(_6675)), level(0.0)).x;
    float _1762 = _135 * 2.0;
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1766 = _359 + _1764;
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1770 = _1768 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1772 = floor(_1762);
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1774;
    float _1778 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1780 = _359 + _1778;
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1782;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1788 = _1786 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1792 = _359 + _1790;
    int _1794 = abs(_1696);
    float _1796 = 1.0 / _1770;
    float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _1798;
    int _1802 = abs(_1688);
    float _1804 = 1.0 / _1800;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _1806;
    float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1812 = _359 + _1810;
    bool _1814 = _1772 > 0.0;
    bool _1816 = _1772 >= 0.0;
    bool _1818 = isnan(_1772);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan(0.0);
    bool _1824 = _1820 || _1822;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1828 = _359 + _1826;
    float _1830 = float(_1794);
    float _1832 = 1.0 / _1808;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1836 = _359 + _1834;
    float _1838 = _1766 * _1796;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1842 = _359 + _1840;
    float _1844 = 1.0 / _1784;
    float _1846 = _1836 * _1804;
    float _1848 = 1.0 / _1776;
    float _1850 = _1842 * _1832;
    float _1852 = _135 + _1016;
    float _1854 = _1852 + (-1.0);
    float _1856 = 1.0 / _1788;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1860 = _1858 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1862 = _1780 * _1844;
    float _1864 = _1016 * 2.0;
    float _1866 = 1.0 / _1860;
    float _1868 = _550 * 2.0;
    float _1870 = _1792 * _1848;
    float _1872 = _1812 * _1856;
    float _1874 = _135 + _550;
    float _1876 = floor(_1868);
    float _1878 = _1874 + (-1.0);
    float _1880 = _1016 + _550;
    float _1882 = _1016 + (-0.5);
    float _1884 = _1828 * _1866;
    float _1886 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1888 = floor(_1864);
    float _1890 = fma(_1854, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1894 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1892;
    float _1896 = _1880 + (-1.0);
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1898;
    float _1902 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1904 = _1902 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1906 = fma(_1896, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1908 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1910 = log2(_1908);
    float _1912 = fma(_1900, _1870, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1914 = fma(_1894, _1870, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1916 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1918 = _1916 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1920 = fma(_1904, _1838, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1922 = _1876 > 0.0;
    float _1924 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1924;
    bool _1928 = _1876 >= 0.0;
    bool _1930 = isnan(_1876);
    bool _1932 = _1928 || _1930;
    bool _1934 = isnan(0.0);
    bool _1936 = _1932 || _1934;
    float _1938 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1940 = _1938 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1942 = fma(_1918, _1838, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1944;
    bool _1948 = _1888 > 0.0;
    float _1950 = fma(_1940, _1872, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _1952 = _1888 >= 0.0;
    bool _1954 = isnan(_1888);
    bool _1956 = _1952 || _1954;
    bool _1958 = isnan(0.0);
    bool _1960 = _1956 || _1958;
    float _1962 = fma(_1926, _1862, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _1964;
    float _1968 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _1970 = _1968 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1972 = fma(_1946, _1862, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1974 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1976 = _1974 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _1980 = _1978 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1982 = _1910 * _149;
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _1984;
    float _1988 = fma(_1970, _1884, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _1990 = fma(_1976, _1872, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1992 = fma(_1980, _1884, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _1994 = fma(_1986, _1846, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _1996 = fma(_1966, _1846, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1998 = exp2(_1982);
    int _2000 = _1824 ? 0 : 1;
    int _2002 = _1960 ? 0 : 1;
    float _2004 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2006 = 1.0 + _2004;
    int _2008 = ~_2000;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    int _2014 = ~_2002;
    int _2016 = _2014 + 1;
    int _2018 = _2016 + 1;
    int _2020 = _2012;
    int _2022 = _2018;
    if (!_1814)
    {
        int _2024 = ~_2000;
        int _2026 = _2024 + 1;
        _2020 = _2026;
    }
    int _2028 = _2020;
    float _2030 = 1.0 / _2006;
    if (!_1948)
    {
        int _2032 = ~_2002;
        int _2034 = _2032 + 1;
        _2022 = _2034;
    }
    int _2036 = _2022;
    float _2038 = in.m_76.x;
    float _2040 = in.m_76.y;
    float _2042 = in.m_76.z;
    bool _2044 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2046 = isnan(1.0);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2052 = _2048 || _2050;
    float _2054 = -_1998;
    float _2056 = _2054 + 1.0;
    bool _2058 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2060 = isnan(0.0);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2066 = _2062 || _2064;
    float _2068 = float(_2036);
    float _2070 = float(_2028);
    float _2072 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _2072;
    float _2076 = float(_1802);
    float _2078 = _1830 * _2068;
    float _2080 = _2066 ? _2056 : 0.0;
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _2082;
    float _2086 = -_1698;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1252);
    float _2090 = _2076 * _2070;
    float _2092 = _2078 * (-2.0);
    if (_2052)
    {
        float _2094 = _2080 * _2030;
        _153 = _2094;
    }
    float _2096 = _153;
    float _2098 = fma(_2084, _1850, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _2100 = _2090 * (-2.0);
    float _2102 = fma(_1886, _2092, _1886);
    bool _2104 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _2106 = isnan(_359);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _2112 = _2108 || _2110;
    float _2114 = float(_2112);
    float _2116 = fma(_2074, _1850, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _2118 = fma(_1906, _2100, _1906);
    float _2120 = fma(_2100, _2040, _2040);
    bool _2122 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _2124 = isnan(_359);
    bool _2126 = _2122 || _2124;
    bool _2128 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _2130 = _2126 || _2128;
    float _2132 = float(_2130);
    float _2134 = _550 + (-0.5);
    float _2136 = -_2114;
    float _2138 = _2136 + 1.0;
    bool _2140 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _2142 = isnan(_359);
    bool _2144 = _2140 || _2142;
    bool _2146 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _2148 = _2144 || _2146;
    float _2150 = float(_2148);
    float _2152 = fma(_2092, _2038, _2038);
    float _2154 = -_2132;
    float _2156 = _2154 + 1.0;
    float _2158 = _135 + (-0.5);
    float _2160 = _2132 * _2138;
    bool _2162 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _2164 = isnan(_359);
    bool _2166 = _2162 || _2164;
    bool _2168 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _2170 = _2166 || _2168;
    float _2172 = float(_2170);
    float _2174 = _2150 * _2156;
    float _2176 = fma(_2134, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2120);
    float _2178 = -_2150;
    float _2180 = _2178 + 1.0;
    float _2182 = -_1700;
    float _2184 = fma(_2182, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1246);
    float _2186 = _2088 * _2088;
    float _2188 = fma(_2158, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2152);
    bool _2190 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2192 = isnan(_359);
    bool _2194 = _2190 || _2192;
    bool _2196 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2198 = _2194 || _2196;
    float _2200 = float(_2198);
    float _2202 = _2172 * _2180;
    float _2204 = -_2172;
    float _2206 = _2204 + 1.0;
    float _2208 = fma(_2184, _2184, _2186);
    bool _2210 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2212 = isnan(_359);
    bool _2214 = _2210 || _2212;
    bool _2216 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2218 = _2214 || _2216;
    float _2220 = float(_2218);
    float _2222 = -_1706;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1316);
    float _2226 = _2200 * _2206;
    float _2228 = -_2200;
    float _2230 = _2228 + 1.0;
    float _2232 = fma(_2102, _2096, _2188);
    bool _2234 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2236 = isnan(_359);
    bool _2238 = _2234 || _2236;
    bool _2240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2242 = _2238 || _2240;
    float _2244 = float(_2242);
    float _2246 = -_2220;
    float _2248 = _2246 + 1.0;
    float _2250 = _2220 * _2230;
    float _2252 = fma(_2224, _2224, _2208);
    bool _2254 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2256 = isnan(_359);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2262 = _2258 || _2260;
    float _2264 = float(_2262);
    float _2266 = _2244 * _2248;
    int _2268 = _1936 ? 0 : 1;
    float _2270 = -_2244;
    float _2272 = _2270 + 1.0;
    int _2274 = abs(_1692);
    float _2276 = _2232 * 0.15915493667125701904296875;
    int _2278 = ~_2268;
    int _2280 = _2278 + 1;
    int _2282 = _2280 + 1;
    float _2284 = _2264 * _2272;
    int _2286 = _2282;
    if (!_1922)
    {
        int _2288 = ~_2268;
        int _2290 = _2288 + 1;
        _2286 = _2290;
    }
    int _2292 = _2286;
    float _2294 = fma(_2118, _2096, _2176);
    float _2296 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2298 = float(_2292);
    float _2300 = _1914 * _2284;
    float _2302 = float(_2274);
    float _2304 = _1912 * _2284;
    float _2306 = -_2264;
    float _2308 = _2306 + 1.0;
    float _2310 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2296);
    float _2312 = _2294 * 0.15915493667125701904296875;
    float _2314 = _2302 * _2298;
    float _2316 = fma(_2308, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2304);
    float _2318 = fma(_2308, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2300);
    float _2320 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2310);
    float _2322 = _2314 * (-2.0);
    float _2324 = fma(_1920, _2266, _2316);
    float _2326 = fma(_1942, _2266, _2318);
    float _2328 = _2320 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2330 = fma(_2322, _2042, _2042);
    float _2332 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2334 = fma(_1890, _2322, _1890);
    float _2336 = 1.0 / _2328;
    float _2338 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2330);
    float _2340 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2332);
    float _2342 = fma(_1972, _2250, _2326);
    float _2344 = fma(_1962, _2250, _2324);
    float _2346 = fma(_2334, _2096, _2338);
    float _2348 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2340);
    float _2350 = fma(_1990, _2226, _2342);
    float _2352 = _2312 * 6.283185482025146484375;
    float _2354 = sin(_2352);
    float _2356 = _2346 * 0.15915493667125701904296875;
    float _2358 = _2348 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2360 = fma(_1950, _2226, _2344);
    float _2362 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2364 = in.m_70.x;
    float _2366 = in.m_70.y;
    float _2368 = _2358 + _2328;
    float _2370 = fma(_1996, _2202, _2350);
    float _2372 = _2312 * 6.283185482025146484375;
    float _2374 = cos(_2372);
    float _2376 = _1704 + _2362;
    float _2378 = _2368 * _2336;
    float _2380 = _2378 * 0.5;
    float _2382 = fma(_1992, _2174, _2370);
    float _2384 = fma(_1994, _2202, _2360);
    float _2386 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2388 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2390 = fma(_2116, _2160, _2382);
    float _2392 = sqrt(_2252);
    float _2394 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2386);
    float _2396 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2388);
    float _2398 = fma(_1988, _2174, _2384);
    float _2400 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[150].y, _2390);
    float _2402 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2404 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2402);
    float _2406 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2394);
    float _2408 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2396);
    float _2410 = _2276 * 6.283185482025146484375;
    float _2412 = sin(_2410);
    float _2414 = fma(_2098, _2160, _2398);
    float _2416 = _2406 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2418 = _2408 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2420 = _2400 * _2366;
    float _2422 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[150].x, _2414);
    float _2424 = _1658 * _2392;
    float _2426 = 1.0 / _2404;
    float _2428 = _2422 * _2364;
    float _2430 = _2420 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2432 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _2434 = _2428 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2436 = _2424 * _2430;
    float _2438 = _2276 * 6.283185482025146484375;
    float _2440 = cos(_2438);
    float _2442 = _2412 * _2374;
    float _2444 = _2424 * _2434;
    float _2446 = _2432 * _2436;
    float _2448 = _2412 * _2354;
    float _2450 = trunc(_2416);
    int _2452 = int(_2450);
    float _2454 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2456 = _2426 * _2454;
    bool _2458 = _2456 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2460 = trunc(_2418);
    int _2462 = int(_2460);
    bool _2464 = _2456 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2466 = _2440 * _2354;
    bool _2468 = !_2458;
    int _2470 = _2468 ? 0 : 1;
    float _2472 = _2440 * _2374;
    float _2474 = _2356 * 6.283185482025146484375;
    float _2476 = sin(_2474);
    int _2478 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2480 = _2452 + _2478;
    int _2482 = _2480 + 1;
    int _2484 = 2;
    int _2486 = _2482;
    float _2488 = _2322;
    float _2490 = _2320;
    float _2492 = _2418;
    float _2494 = _2376;
    if (!_2458)
    {
        _2484 = 1;
    }
    int _2496 = _2484;
    bool _2498 = _2482 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2500 = _2496;
    if (!_2464)
    {
        _2500 = _2470;
    }
    int _2502 = _2500;
    float _2504 = _2356 * 6.283185482025146484375;
    float _2506 = cos(_2504);
    int _2508 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2510 = _2462 + _2508;
    int _2512 = _2510 + 1;
    int _2514 = _2502 << 6;
    int _2516 = _2482 | _2512;
    int _2518 = _2514 + 72;
    uint _2520 = uint(int(uint(_2518) >> uint(2)));
    uint _2522 = uint(int(uint(int(_2520)) >> uint(2)));
    int _2524 = int(_2520) & 3;
    float _2526 = (*spvDescriptorSet0.vp_c15)._m0[int(_2522)][_2524];
    int _2528 = int(_2520) + 1;
    uint _2530 = uint(int(uint(_2528) >> uint(2)));
    int _2532 = _2528 & 3;
    float _2534 = (*spvDescriptorSet0.vp_c15)._m0[int(_2530)][_2532];
    float _2536 = -_2466;
    float _2538 = fma(_2476, _2442, _2536);
    float _2540 = -_2442;
    float _2542 = fma(_2476, _2466, _2540);
    float _2544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _2546 = fma(_2476, _2472, _2448);
    bool _2548 = _2516 < 0;
    bool _2550 = _2548 || _2498;
    float _2552 = -_2446;
    float _2554 = _2476 * _2552;
    float _2556 = _2544 * _2444;
    float _2558 = fma(_2476, _2448, _2472);
    float _2560 = _2440 * _2506;
    float _2562 = _2412 * _2506;
    float _2564 = _2374 * _2506;
    bool _2566 = _2512 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2568 = _2566 || _2550;
    float _2570 = _2560 * _2446;
    float _2572 = _2424 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2574 = _2572 * 0.5;
    float _2576 = _2562 * _2446;
    float _2578 = _2354 * _2506;
    float _2580 = fma(_2546, _2556, _2570);
    float _2582 = fma(_2564, _2556, _2554);
    int _2584 = _2514 + 96;
    uint _2586 = uint(int(uint(_2584) >> uint(2)));
    uint _2588 = uint(int(uint(int(_2586)) >> uint(2)));
    int _2590 = int(_2586) & 3;
    float _2592 = (*spvDescriptorSet0.vp_c15)._m0[int(_2588)][_2590];
    int _2594 = int(_2586) + 1;
    uint _2596 = uint(int(uint(_2594) >> uint(2)));
    int _2598 = _2594 & 3;
    float _2600 = (*spvDescriptorSet0.vp_c15)._m0[int(_2596)][_2598];
    float _2602 = fma(_2538, _2556, _2576);
    float _2604 = fma(_2542, _2574, _2580);
    float _2606 = fma(_2578, _2574, _2582);
    bool _2608 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2610 = isnan(0.5);
    bool _2612 = _2608 || _2610;
    bool _2614 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2616 = _2612 || _2614;
    float _2618 = fma(_2558, _2574, _2602);
    float _2620 = _2604 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2622 = as_type<int>(_2620);
    float _2624 = as_type<float>(_2502);
    if (!_2568)
    {
        int _2626 = _2512 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2628 = _2626 + _2482;
        _2486 = _2628;
    }
    int _2630 = _2486;
    int _2632 = _2514 + 104;
    uint _2634 = uint(int(uint(_2632) >> uint(2)));
    uint _2636 = uint(int(uint(int(_2634)) >> uint(2)));
    int _2638 = int(_2634) & 3;
    float _2640 = (*spvDescriptorSet0.vp_c15)._m0[int(_2636)][_2638];
    int _2642 = int(_2634) + 1;
    uint _2644 = uint(int(uint(_2642) >> uint(2)));
    int _2646 = _2642 & 3;
    float _2648 = (*spvDescriptorSet0.vp_c15)._m0[int(_2644)][_2646];
    float _2650 = _2604 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2652 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2620);
    int _2654 = as_type<int>(_2650);
    if (!_2568)
    {
        float _2656 = floor(_2416);
        _2488 = _2656;
    }
    float _2658 = _2488;
    float _2660 = _2658;
    if (!_2568)
    {
        int _2662 = _2630 << 2;
        _2622 = _2662;
    }
    int _2664 = _2622;
    float _2666 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2650);
    float _2668 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2652);
    int _2670 = as_type<int>(_2668);
    if (!_2568)
    {
        uint _2672 = uint(int(uint(_2630) >> uint(2)));
        _2654 = int(_2672);
    }
    int _2674 = _2654;
    int _2676 = _2514 + 48;
    uint _2678 = uint(int(uint(_2676) >> uint(2)));
    uint _2680 = uint(int(uint(int(_2678)) >> uint(2)));
    int _2682 = int(_2678) & 3;
    float _2684 = (*spvDescriptorSet0.vp_c15)._m0[int(_2680)][_2682];
    int _2686 = int(_2678) + 1;
    uint _2688 = uint(int(uint(_2686) >> uint(2)));
    int _2690 = _2686 & 3;
    float _2692 = (*spvDescriptorSet0.vp_c15)._m0[int(_2688)][_2690];
    float _2694 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2666);
    float _2696 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    if (!_2568)
    {
        int _2698 = 12 & _2664;
        _2670 = _2698;
    }
    int _2700 = _2670;
    float _2702 = _2694 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2704 = _1262 + _2696;
    float _2706 = _2704;
    if (!_2568)
    {
        int _2708 = _2674 << 4;
        int _2710 = _2708 + _2700;
        _2490 = as_type<float>(_2710);
    }
    float _2712 = _2490;
    int _2714 = _2514 + 64;
    uint _2716 = uint(int(uint(_2714) >> uint(2)));
    uint _2718 = uint(int(uint(int(_2716)) >> uint(2)));
    int _2720 = int(_2716) & 3;
    float _2722 = (*spvDescriptorSet0.vp_c15)._m0[int(_2718)][_2720];
    int _2724 = int(_2716) + 1;
    uint _2726 = uint(int(uint(_2724) >> uint(2)));
    int _2728 = _2724 & 3;
    float _2730 = (*spvDescriptorSet0.vp_c15)._m0[int(_2726)][_2728];
    float _2732 = _1230 + _2702;
    float _2734 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2736 = _2704 + _2734;
    float _2738 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2740 = _2732 + _2738;
    float _2742 = _2736 * _2736;
    int _2744 = _2514 + 56;
    uint _2746 = uint(int(uint(_2744) >> uint(2)));
    uint _2748 = uint(int(uint(int(_2746)) >> uint(2)));
    int _2750 = int(_2746) & 3;
    float _2752 = (*spvDescriptorSet0.vp_c15)._m0[int(_2748)][_2750];
    int _2754 = int(_2746) + 1;
    uint _2756 = uint(int(uint(_2754) >> uint(2)));
    int _2758 = _2754 & 3;
    float _2760 = (*spvDescriptorSet0.vp_c15)._m0[int(_2756)][_2758];
    float _2762 = fma(_2740, _2740, _2742);
    float _2764 = sqrt(_2762);
    int _2766 = _2514 + 80;
    uint _2768 = uint(int(uint(_2766) >> uint(2)));
    uint _2770 = uint(int(uint(int(_2768)) >> uint(2)));
    int _2772 = int(_2768) & 3;
    float _2774 = (*spvDescriptorSet0.vp_c15)._m0[int(_2770)][_2772];
    int _2776 = int(_2768) + 1;
    uint _2778 = uint(int(uint(_2776) >> uint(2)));
    int _2780 = _2776 & 3;
    float _2782 = (*spvDescriptorSet0.vp_c15)._m0[int(_2778)][_2780];
    int _2784 = _2514 + 88;
    uint _2786 = uint(int(uint(_2784) >> uint(2)));
    uint _2788 = uint(int(uint(int(_2786)) >> uint(2)));
    int _2790 = int(_2786) & 3;
    float _2792 = (*spvDescriptorSet0.vp_c15)._m0[int(_2788)][_2790];
    int _2794 = int(_2786) + 1;
    uint _2796 = uint(int(uint(_2794) >> uint(2)));
    int _2798 = _2794 & 3;
    float _2800 = (*spvDescriptorSet0.vp_c15)._m0[int(_2796)][_2798];
    float _2802 = _2376 * _2600;
    float _2804 = fma(_1710, _2592, _2802);
    float _2806 = _2604 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2808 = _2764 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2810 = _2712;
    float _2812 = _2648;
    float _2814 = _2732;
    if (!_2568)
    {
        int _2816 = as_type<int>(_2712) + 400;
        uint _2818 = uint(int(uint(_2816) >> uint(2)));
        uint _2820 = uint(int(uint(int(_2818)) >> uint(2)));
        int _2822 = int(_2818) & 3;
        float _2824 = (*spvDescriptorSet0.vp_c15)._m0[int(_2820)][_2822];
        _2810 = _2824;
    }
    float _2826 = _2810;
    float _2828 = fma(_1718, _2640, _2804);
    float _2830 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2806);
    float _2832 = _2604;
    if (!_2568)
    {
        float _2834 = floor(_2418);
        _2832 = _2834;
    }
    float _2836 = _2832;
    float _2838 = _2828 + _2648;
    float _2840 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2830);
    float _2842 = _2376 * _2692;
    float _2844 = 1.0 / _2838;
    float _2846 = fma(_1710, _2684, _2842);
    float _2848 = _2840 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2850 = _2376 * _2730;
    float _2852 = _1214 + _2848;
    float _2854 = fma(_1710, _2722, _2850);
    if (!_2808)
    {
        _2812 = _2852;
    }
    float _2856 = _2812;
    float _2858 = fma(_1718, _2752, _2846);
    float _2860 = fma(_1718, _2526, _2854);
    bool _2862 = !_2808;
    float _2864 = _2856;
    if (!_2862)
    {
        float _2866 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2870 = _2764 + _2868;
        float _2872 = rsqrt(_2762);
        float _2874 = _2870 * _2866;
        float _2876 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2878 = _2874 * 0.15915493667125701904296875;
        float _2880 = _2878 * 6.283185482025146484375;
        float _2882 = cos(_2880);
        float _2884 = _2878 * 6.283185482025146484375;
        float _2886 = sin(_2884);
        float _2888 = _2882 + (-1.0);
        float _2890 = fma(_2886, _2876, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2892 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2894 = _2872 * _2890;
        float _2896 = fma(_2852, _2882, _2892);
        float _2898 = fma(_2740, _2894, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2900 = fma(_2736, _2894, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2814 = _2898;
        _2864 = _2896;
        _2706 = _2900;
    }
    float _2902 = _2814;
    float _2904 = _2864;
    float _2906 = _2706;
    float _2908 = -_1700;
    float _2910 = fma(_2908, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2902);
    float _2912 = -_1698;
    float _2914 = fma(_2912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2904);
    float _2916 = -_1706;
    float _2918 = fma(_2916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2906);
    float _2920 = _2858 + _2760;
    float _2922 = _2860 + _2534;
    float _2924 = _2914;
    float _2926 = _2910;
    float _2928 = _2918;
    if (!_2616)
    {
        float _2930 = _1714 * _1714;
        float _2932 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2934 = -_1262;
        float _2936 = _2934 + _2906;
        float _2938 = -_1214;
        float _2940 = _2938 + _2904;
        float _2942 = fma(_1722, _1722, _2930);
        float _2944 = fma(_1728, _1728, _2942);
        float _2946 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2948 = sqrt(_2944);
        float _2950 = 1.0 / _2424;
        float _2952 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2954 = precise::min(_2948, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2956 = _2954 * _2932;
        float _2958 = _2956 * _2950;
        float _2960 = -_1230;
        float _2962 = _2960 + _2902;
        float _2964 = _2952 * _2958;
        float _2966 = _2936 * _2958;
        float _2968 = fma(_2940, _2964, _1704);
        float _2970 = fma(_2962, _2964, _1710);
        float _2972 = fma(_2952, _2966, _1718);
        _2924 = _2968;
        _2926 = _2970;
        _2928 = _2972;
    }
    float _2974 = _2924;
    float _2976 = _2926;
    float _2978 = _2928;
    float _2980 = _2974 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2982 = _2974 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2984 = _2920 * _2844;
    float _2986 = _2974 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2988 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2980);
    float _2990 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2982);
    float _2992 = _2974 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _2994 = _2984 >= 0.0;
    float _2996 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2988);
    float _2998 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2986);
    float _3000 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2990);
    float _3002 = _2922 * _2844;
    float _3004 = _2996 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3006 = _2984 <= 1.0;
    bool _3008 = _3006 && _2994;
    float _3010 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2998);
    float _3012 = _3000 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3014 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2992);
    float _3016 = _3004 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3018 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _3020 = _3002 >= 0.0;
    bool _3022 = _3020 && _3008;
    float _3024 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3014);
    float _3026 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3016);
    float _3028 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3030 = _3018 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _3032 = _3002 <= 1.0;
    bool _3034 = _3032 && _3022;
    float _3036 = _3024 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3038 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3026);
    float _3040 = -_3030;
    float _3042 = fma(_3040, _3028, 1.0);
    float _3044 = _2376 * _2782;
    float _3046 = _3004 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3048 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3038);
    float _3050 = _3004 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3052 = fma(_1710, _2774, _3044);
    float _3054 = log2(_3042);
    float _3056 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3046);
    float _3058 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3050);
    float _3060 = fma(_1718, _2792, _3052);
    float _3062 = _3014;
    float _3064 = _3048;
    if (_3034)
    {
        float _3066 = float(_2502);
        _2624 = _3066;
    }
    float _3068 = _2624;
    float _3070 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3056);
    float _3072 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3058);
    float _3074 = _3060 + _2800;
    float _3076 = 1.0 / _3048;
    float _3078 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3070);
    float _3080 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3072);
    float _3082 = _3072;
    float _3084 = _3068;
    float _3086 = _3078;
    if (!_2568)
    {
        float _3088 = -_2836;
        float _3090 = _2418 + _3088;
        _3062 = _3090;
    }
    float _3092 = _3062;
    if (!_2568)
    {
        float _3094 = -_2658;
        float _3096 = _2416 + _3094;
        _3082 = _3096;
    }
    float _3098 = _3082;
    float _3100 = _3074 * _2844;
    float _3102 = _2722;
    if (!_2568)
    {
        float _3104 = rint(_2826);
        float _3106 = precise::max(_3104, 0.0);
        uint _3108 = uint(_3106);
        uint _3110 = clamp(_3108, 0u, 65535u);
        _3102 = as_type<float>(_3110);
    }
    float _3112 = _3102;
    float _3114 = _3054 * 0.693147182464599609375;
    float _3116 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3118 = _3052;
    float _3120 = _3116;
    if (_3034)
    {
        float _3122 = rint(_3068);
        float _3124 = precise::max(_3122, 0.0);
        uint _3126 = uint(_3124);
        uint _3128 = clamp(_3126, 0u, 65535u);
        _3118 = as_type<float>(_3128);
    }
    float _3130 = _3118;
    float _3132 = _3078 * _3076;
    float _3134 = _3080 * _3076;
    float _3136 = fma(_3132, 0.5, 0.5);
    float _3138 = fma(_3134, -0.5, 0.5);
    float _3140 = _3092;
    float _3142 = _3136;
    if (!_2568)
    {
        float3 _8886 = float3(_3098, _3092, float(as_type<int>(_3112)));
        float3 _8890 = select(_8886, float3(0.0), isnan(_8886));
        float _3144 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8890.xy, uint(rint(_8890.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8890.xy, uint(rint(_8890.z)), level(0.0)).x;
        _3140 = _3144;
    }
    float _3146 = _3140;
    float _3148 = _3002;
    if (_3034)
    {
        float3 _8905 = float3(_2984, _3002, float(as_type<int>(_3130)));
        float3 _8907 = select(_8905, float3(0.0), isnan(_8905));
        float _3150 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8907.xy, uint(rint(_8907.z)), _3100, level(0.0));
        _3148 = _3150;
    }
    float _3152 = _3148;
    float3 _8917 = float3(_3136, _3138, _3116);
    float _3154 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8917, float3(0.0), isnan(_8917)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8917, float3(0.0), isnan(_8917)), level(0.0)).x;
    float3 _8926 = float3(_3136, _3138, _3116);
    float4 _3157 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8926, float3(0.0), isnan(_8926)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8926, float3(0.0), isnan(_8926)), level(0.0)).xyzw;
    float _3159 = _3157.x;
    float _3161 = _3157.y;
    float _3163 = _3157.z;
    float _3165 = _3157.w;
    bool _3167 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3169 = isnan(0.5);
    bool _3171 = _3167 || _3169;
    bool _3173 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3175 = _3171 || _3173;
    if (_2568)
    {
        _3084 = 1.0;
    }
    float _3177 = _3084;
    float _3179 = _3177;
    if (_3175)
    {
        _2660 = 1.0;
    }
    float _3181 = _2660;
    float _3183 = _3181;
    if (_3175)
    {
        _2492 = 1.0;
    }
    float _3185 = _2492;
    float _3187 = _3185;
    float _3189 = _3159;
    if (!_3175)
    {
        float _3191 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3193 = _3191 * 0.15915493667125701904296875;
        float _3195 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3197 = _3193 * 6.283185482025146484375;
        float _3199 = cos(_3197);
        float _3201 = _3195 * 0.15915493667125701904296875;
        float _3203 = _3193 * 6.283185482025146484375;
        float _3205 = sin(_3203);
        float _3207 = 1.0 / _3199;
        float _3209 = _3201 * 6.283185482025146484375;
        float _3211 = cos(_3209);
        float _3213 = _3205 * _3207;
        float _3215 = _3201 * 6.283185482025146484375;
        float _3217 = sin(_3215);
        float _3219 = _3211 * _3213;
        float _3221 = 1.0 / _3219;
        float _3223 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3225 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3223;
        float _3227 = 1.0 / _3225;
        float _3229 = _3217 * _3221;
        float _3231 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3233 = fma(_2456, _3229, _3231);
        float _3235 = _3233 * _3227;
        float _3237 = precise::clamp(_3235, 0.0, 1.0);
        _3142 = _3201;
        _3187 = _3237;
    }
    float _3239 = _3142;
    float _3241 = _3187;
    float _3243 = _3239;
    if (!_3175)
    {
        float _3245 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3247 = _3245 * 0.15915493667125701904296875;
        float _3249 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3251 = _3247 * 6.283185482025146484375;
        float _3253 = cos(_3251);
        float _3255 = _3249 * 0.15915493667125701904296875;
        float _3257 = _3247 * 6.283185482025146484375;
        float _3259 = sin(_3257);
        float _3261 = 1.0 / _3253;
        float _3263 = _3255 * 6.283185482025146484375;
        float _3265 = cos(_3263);
        float _3267 = _3259 * _3261;
        float _3269 = _3255 * 6.283185482025146484375;
        float _3271 = sin(_3269);
        float _3273 = _3265 * _3267;
        float _3275 = 1.0 / _3273;
        float _3277 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3279 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3277;
        float _3281 = 1.0 / _3279;
        float _3283 = _3271 * _3275;
        float _3285 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3287 = fma(_2456, _3283, _3285);
        float _3289 = _3287 * _3281;
        float _3291 = precise::clamp(_3289, 0.0, 1.0);
        float _3293 = -_3291;
        float _3295 = _3293 + 1.0;
        _3243 = _3273;
        _3183 = _3295;
    }
    float _3297 = _3243;
    float _3299 = _3183;
    if (!_2568)
    {
        int _3301 = _2630 << 4;
        int _3303 = _3301 + 2048;
        uint _3305 = uint(int(uint(_3303) >> uint(2)));
        uint _3307 = uint(int(uint(int(_3305)) >> uint(2)));
        int _3309 = int(_3305) & 3;
        float _3311 = (*spvDescriptorSet0.vp_c15)._m0[int(_3307)][_3309];
        int _3313 = int(_3305) + 1;
        uint _3315 = uint(int(uint(_3313) >> uint(2)));
        int _3317 = _3313 & 3;
        float _3319 = (*spvDescriptorSet0.vp_c15)._m0[int(_3315)][_3317];
        int _3321 = _3303 + 8;
        uint _3323 = uint(int(uint(_3321) >> uint(2)));
        uint _3325 = uint(int(uint(int(_3323)) >> uint(2)));
        int _3327 = int(_3323) & 3;
        float _3329 = (*spvDescriptorSet0.vp_c15)._m0[int(_3325)][_3327];
        int _3331 = int(_3323) + 1;
        uint _3333 = uint(int(uint(_3331) >> uint(2)));
        int _3335 = _3331 & 3;
        float _3337 = (*spvDescriptorSet0.vp_c15)._m0[int(_3333)][_3335];
        float _3339 = _2376 * _3319;
        float _3341 = fma(_1710, _3311, _3339);
        float _3343 = fma(_1718, _3329, _3341);
        float _3345 = _3343 + _3337;
        float _3347 = precise::clamp(_3345, 0.0, 1.0);
        float _3349 = -_3347;
        float _3351 = _3349 + _3146;
        float _3353 = fma(_3351, 500.0, 1.5);
        float _3355 = exp2(_3353);
        float _3357 = 0.0 + _3355;
        float _3359 = precise::clamp(_3357, 0.0, 1.0);
        _2494 = _3339;
        _3179 = _3359;
    }
    float _3361 = _2494;
    float _3363 = _3179;
    float _3365 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3367 = _2974 + _3365;
    float _3369 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3371 = _2976 + _3369;
    float _3373 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3375 = _2978 + _3373;
    float _3377 = _3367 * _3367;
    float _3379 = fma(_3371, _3371, _3377);
    float _3381 = fma(_3375, _3375, _3379);
    float _3383 = rsqrt(_3381);
    float _3385 = sqrt(_3381);
    float _3387 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3389 = _3371 * _3387;
    float _3391 = _3375 * _3387;
    float _3393 = _3389 * _3389;
    float _3395 = _3391 * _3391;
    float _3397 = _3393 + _3395;
    float _3399 = sqrt(_3397);
    bool _3401 = _3399 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3403 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3405 = _3399 + _3403;
    float _3407 = _3361;
    float _3409 = _3397;
    float _3411 = _3405;
    float _3413 = _3367;
    float _3415 = _3389;
    float _3417 = _3391;
    float _3419 = _3393;
    float _3421 = _3395;
    if (_3401)
    {
        float _3423 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3407 = _3423;
    }
    float _3425 = _3407;
    if (_3401)
    {
        float _3427 = rsqrt(_3397);
        _3409 = _3427;
    }
    float _3429 = _3409;
    if (_3401)
    {
        float _3431 = _3405 * _3425;
        _3411 = _3431;
    }
    float _3433 = _3411;
    if (_3401)
    {
        float _3435 = _3433 * 0.15915493667125701904296875;
        _3120 = _3435;
    }
    float _3437 = _3120;
    float _3439 = _3297;
    if (_3401)
    {
        float _3441 = _3437 * 6.283185482025146484375;
        float _3443 = sin(_3441);
        _3439 = _3443;
    }
    float _3445 = _3439;
    float _3447 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3449 = precise::max(0.0, _3447);
    float _3451 = _3146;
    float _3453 = _3445;
    float _3455 = _3447;
    float _3457 = _3449;
    if (_3401)
    {
        float _3459 = _3437 * 6.283185482025146484375;
        float _3461 = cos(_3459);
        _3451 = _3461;
    }
    float _3463 = _3451;
    float _3465 = -_3387;
    float _3467 = -_3449;
    float _3469 = fma(_3367, _3465, _3467);
    if (_3401)
    {
        float _3471 = _3469 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3413 = _3471;
    }
    float _3473 = _3413;
    float _3475 = _3473;
    if (_3401)
    {
        float _3477 = fma(_3445, _3473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3453 = _3477;
    }
    float _3479 = _3453;
    float _3481 = _3479;
    if (!_3401)
    {
        _3475 = _3469;
    }
    float _3483 = _3475;
    float _3485 = _3483;
    if (_3401)
    {
        float _3487 = _3463 + (-1.0);
        _3455 = _3487;
    }
    float _3489 = _3455;
    if (_3401)
    {
        float _3491 = _3429 * _3479;
        _3481 = _3491;
    }
    float _3493 = _3481;
    if (_3401)
    {
        float _3495 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3457 = _3495;
    }
    float _3497 = _3457;
    if (_3401)
    {
        float _3499 = _3389 * _3493;
        _3415 = _3499;
    }
    float _3501 = _3415;
    if (_3401)
    {
        float _3503 = _3391 * _3493;
        _3417 = _3503;
    }
    float _3505 = _3417;
    if (_3401)
    {
        float _3507 = fma(_3469, _3463, _3497);
        _3485 = _3507;
    }
    float _3509 = _3485;
    if (_3401)
    {
        float _3511 = _3501 * _3501;
        _3419 = _3511;
    }
    float _3513 = _3419;
    if (_3401)
    {
        float _3515 = _3505 * _3505;
        _3421 = _3515;
    }
    float _3517 = _3421;
    float _3519 = fma(_3509, _3509, _3513);
    float _3521 = _3519 + _3517;
    float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3525 = fma(_3385, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3523);
    float _3527 = precise::clamp(_3525, 0.0, 1.0);
    float _3529 = -_3527;
    float _3531 = _3529 + 1.0;
    float _3533 = rsqrt(_3521);
    float _3535 = _3533 * _3509;
    float _3537 = _3533 * _3501;
    float _3539 = abs(_3531);
    float _3541 = log2(_3539);
    float _3543 = _3533 * _3505;
    float _3545 = _3537 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3547 = -_3545;
    float _3549 = fma(_3535, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3547);
    float _3551 = -_3543;
    float _3553 = fma(_3551, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3549);
    float _3555 = fma(_3553, -0.5, 0.5);
    float _3557 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3559 = fma(_3553, 0.5, 0.5);
    float _3561 = sqrt(_3555);
    float _3563 = fma(_3559, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3565 = fma(_3559, _3563, -0.212114393711090087890625);
    float _3567 = _3535 + 1.0;
    float _3569 = exp2(_3557);
    float _3571 = fma(_3559, _3565, 1.570728778839111328125);
    float _3573 = _3561 * 0.636619746685028076171875;
    float _3575 = -_3571;
    float _3577 = fma(_3573, _3575, 1.0);
    float _3579 = -_3535;
    float _3581 = fma(_3569, _3567, _3579);
    float _3583 = fma(_3581, 0.5, 0.5);
    float2 _9545 = float2(_3577, _3583);
    float3 _3587 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9545, float2(0.0), isnan(_9545)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9545, float2(0.0), isnan(_9545)), level(0.0)).xyz;
    float _3589 = _3587.x;
    float _3591 = _3587.y;
    float _3593 = _3587.z;
    float _3595 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3597 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3599 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3601 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3603 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3595);
    float _3605 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3597);
    float _3607 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3609 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3611 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3613 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3599);
    float _3615 = -_2476;
    float _3617 = fma(_3615, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3607);
    float _3619 = -_2476;
    float _3621 = fma(_3619, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3609);
    float _3623 = -_2476;
    float _3625 = fma(_3623, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3611);
    float _3627 = fma(_3601, _3601, 1.0);
    float _3629 = abs(_2456);
    float _3631 = log2(_3629);
    float _3633 = _2542 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3635 = _2542 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3637 = _2542 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3639 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3617);
    float _3641 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3633);
    float _3643 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3635);
    float _3645 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3621);
    float _3647 = rsqrt(_3627);
    float _3649 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3605);
    float _3651 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3603);
    float _3653 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3613);
    float _3655 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3657 = _3601 * _3639;
    float _3659 = _3601 * _3645;
    float _3661 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3625);
    float _3663 = _3631 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3665 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3637);
    float _3667 = fma(_3655, _3651, _3657);
    float _3669 = fma(_3655, _3649, _3659);
    float _3671 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3643);
    float _3673 = _3601 * _3661;
    float _3675 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3641);
    float _3677 = exp2(_3663);
    float _3679 = _3601 * _3647;
    float _3681 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3665);
    float _3683 = _3004 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_78.x = _3651;
    out.m_78.y = _3649;
    out.m_78.z = _3653;
    float _3685 = fma(_3655, _3653, _3673);
    float _3687 = -_3681;
    float _3689 = _3679 * _3687;
    float _3691 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3683);
    float _3693 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3695 = -_3671;
    float _3697 = _3679 * _3695;
    float _3699 = _3671 + _3667;
    float _3701 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3691);
    float _3703 = -_1760;
    float _3705 = _3703 + 1.0;
    float _3707 = exp2(_3693);
    float _3709 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3701);
    float _3711 = -_3675;
    float _3713 = _3679 * _3711;
    float _3715 = fma(_3677, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3717 = precise::clamp(_3715, 0.0, 1.0);
    float _3719 = _3675 + _3669;
    float _3721 = _3681 + _3685;
    float _3723 = fma(_3647, _3645, _3713);
    float _3725 = fma(_3647, _3661, _3689);
    float _3727 = _3048 * 0.5;
    bool _3729 = _2456 <= 8000.0;
    bool _3731 = isnan(_2456);
    bool _3733 = _3729 || _3731;
    bool _3735 = isnan(8000.0);
    bool _3737 = _3733 || _3735;
    float _3739 = float(_3737);
    out.gl_Position.x = _3078;
    out.gl_Position.y = _3080;
    out.gl_Position.z = _3709;
    out.gl_Position.w = _3048;
    float _3741 = fma(_3647, _3639, _3697);
    float _3743 = fma(_3080, -0.5, _3727);
    float _3745 = _3709 + _3048;
    float _3747 = _3078 + _3048;
    out.m_80.x = _3741;
    out.m_80.y = _3723;
    out.m_80.z = _3725;
    float _3749 = fma(_3717, -2.0, 3.0);
    float _3751 = _3717 * _3717;
    float _3753 = _3745 * 0.5;
    float _3755 = _3747 * 0.5;
    out.m_82.x = _3699;
    out.m_82.y = _3719;
    out.m_82.z = _3721;
    float _3757 = _3751 * _3749;
    float _3759 = -_3707;
    float _3761 = _3759 + 1.0;
    if (!_3034)
    {
        _3086 = 1.0;
    }
    float _3763 = _3086;
    out.m_84.x = _3755;
    out.m_84.y = _3743;
    out.m_84.z = _3753;
    out.m_84.w = _3048;
    float _3765 = -_3757;
    float _3767 = _3765 + 1.0;
    float _3769 = _3761 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3771 = _3763;
    float _3773 = _3769;
    if (_3034)
    {
        bool _3775 = _3152 >= _3100;
        bool _3777 = isnan(_3152);
        bool _3779 = _3775 || _3777;
        bool _3781 = isnan(_3100);
        bool _3783 = _3779 || _3781;
        float _3785 = float(_3783);
        _3771 = _3785;
    }
    float _3787 = _3771;
    out.m_86.x = _2976;
    out.m_86.y = _2974;
    out.m_86.z = _2978;
    float _3789 = fma(_3767, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3757);
    float _3791 = _3769 * _3154;
    float _3793 = -_3769;
    float _3795 = _3793 + 1.0;
    bool _3797 = _3385 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3799 = isnan(_3385);
    bool _3801 = _3797 || _3799;
    bool _3803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3805 = _3801 || _3803;
    float _3807 = _3739 * _3789;
    float _3809 = _3787 * _3363;
    float _3811 = _3165 * _3795;
    float _3813 = _3807 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3815 = _3705 * _3813;
    float _3817 = precise::clamp(_3815, 0.0, 1.0);
    float _3819 = _3165 * _3791;
    float _3821 = -_3817;
    float _3823 = fma(_3821, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3825 = _3795;
    if (!_3805)
    {
        _3064 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3827 = _3064;
    float _3829 = _3827;
    float _3831 = _3827;
    if (!_3805)
    {
        _3825 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3833 = _3825;
    float _3835 = -_3809;
    float _3837 = fma(_3835, _3823, 1.0);
    float _3839 = precise::clamp(_3837, 0.0, 1.0);
    float _3841 = _3833;
    float _3843 = _3833;
    if (!_3805)
    {
        _3773 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3845 = _3773;
    float _3847 = _3839 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _3847;
    float _3849 = _3847;
    float _3851 = _3845;
    float _3853 = _3845;
    if (!_3805)
    {
        _3849 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3855 = _3849;
    float _3857 = _3593 * _3791;
    float _3859 = fma(_3589, _3819, _3159);
    float _3861 = fma(_3591, _3819, _3161);
    float _3863 = _3241 * _3299;
    float _3865 = fma(_3165, _3857, _3163);
    float _3867 = _3863;
    float _3869 = _3855;
    float _3871 = _3855;
    if (!_3805)
    {
        _3189 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3873 = _3189;
    float _3875 = _3863 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3877 = _3873;
    float _3879 = _3873;
    if (!_3805)
    {
        _3867 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3881 = _3867;
    out.m_90.x = _3859;
    out.m_90.y = _3861;
    out.m_90.z = _3865;
    out.m_90.w = _3811;
    bool _3883 = !_3805;
    float _3885 = _3881;
    float _3887 = _3881;
    if (!_3883)
    {
        bool _3889 = _3385 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3891 = isnan(_3385);
        bool _3893 = _3889 || _3891;
        bool _3895 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3897 = _3893 || _3895;
        if (!_3897)
        {
            float _3899 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3901 = _3385 + _3899;
            float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3905 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3903;
            float _3907 = 1.0 / _3905;
            float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3911 = _3909 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3915 = _3913 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3919 = _3917 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3921 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3923 = _3921 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3929 = _3901 * _3907;
            float _3931 = precise::clamp(_3929, 0.0, 1.0);
            float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3935 = _3933 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3937 = fma(_3931, _3911, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3939 = fma(_3931, _3935, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3941 = fma(_3931, _3915, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3943 = fma(_3931, _3919, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3945 = fma(_3931, _3923, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3947 = fma(_3931, _3927, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3831 = _3939;
            _3871 = _3945;
            _3879 = _3937;
            _3853 = _3943;
            _3843 = _3941;
            _3887 = _3947;
            _3949 = true;
        }
        else
        {
            bool _3951 = _3385 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3953 = isnan(_3385);
            bool _3955 = _3951 || _3953;
            bool _3957 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3959 = _3955 || _3957;
            if (!_3959)
            {
                _3877 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3961 = _3877;
            _3879 = _3961;
            if (!_3959)
            {
                _3829 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3963 = _3829;
            _3831 = _3963;
            if (!_3959)
            {
                _3841 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3965 = _3841;
            _3843 = _3965;
            if (!_3959)
            {
                _3851 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3967 = _3851;
            _3853 = _3967;
            if (!_3959)
            {
                _3869 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3969 = _3869;
            _3871 = _3969;
            if (!_3959)
            {
                _3885 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3971 = _3885;
            bool _3973 = !_3959;
            _3887 = _3971;
            if (!_3973)
            {
                bool _3975 = _3385 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3977 = isnan(_3385);
                bool _3979 = _3975 || _3977;
                bool _3981 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3983 = _3979 || _3981;
                if (!_3983)
                {
                    float _3985 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3987 = _3385 + _3985;
                    float _3989 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3991 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3989;
                    float _3993 = 1.0 / _3991;
                    float _3995 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3997 = _3995 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3999 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4001 = _3999 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4003 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4005 = _4003 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4007 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4009 = _4007 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4013 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4015 = _3987 * _3993;
                    float _4017 = precise::clamp(_4015, 0.0, 1.0);
                    float _4019 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4021 = _4019 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4023 = fma(_4017, _3997, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4025 = fma(_4017, _4021, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4027 = fma(_4017, _4001, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4029 = fma(_4017, _4005, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4031 = fma(_4017, _4009, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4033 = fma(_4017, _4013, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3831 = _4025;
                    _3871 = _4031;
                    _3879 = _4023;
                    _3853 = _4029;
                    _3843 = _4027;
                    _3887 = _4033;
                    _3949 = true;
                }
                else
                {
                    _3831 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3871 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3879 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3853 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3843 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3887 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3949 = false;
    float _4035 = _3831;
    float _4037 = _3871;
    float _4039 = _3879;
    float _4041 = _3853;
    float _4043 = _3843;
    float _4045 = _3887;
    float _4047 = fma(_3719, -0.5, 0.5);
    float _4049 = precise::clamp(_4047, 0.0, 1.0);
    float _4051 = _3875 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4053 = -_4035;
    float _4055 = _4053 + _4037;
    float _4057 = -_4039;
    float _4059 = _4057 + _4041;
    out.m_92.x = 0.0;
    float _4061 = fma(_4049, _4055, _4035);
    float _4063 = -_4043;
    float _4065 = _4063 + _4045;
    float _4067 = fma(_4049, _4059, _4039);
    out.m_59.x = _4051;
    float _4069 = _4061 * 0.586610972881317138671875;
    bool _4071 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4073 = fma(_4049, _4065, _4043);
    float _4075 = fma(_4067, 0.298911988735198974609375, _4069);
    bool _4077 = _3241 > 0.0;
    bool _4079 = isnan(_3241);
    bool _4081 = _4077 || _4079;
    bool _4083 = isnan(0.0);
    bool _4085 = _4081 || _4083;
    float _4087 = fma(_4073, 0.114477999508380889892578125, _4075);
    bool _4089 = _3299 <= 0.0;
    bool _4091 = !_4085;
    bool _4093 = _4089 || _4091;
    float _4095 = -_4087;
    float _4097 = _4067 + _4095;
    float _4099 = -_4087;
    float _4101 = _4061 + _4099;
    float _4103 = -_4087;
    float _4105 = _4073 + _4103;
    float _4107 = fma(_4097, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4087);
    float _4109 = fma(_4101, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4087);
    float _4111 = fma(_4105, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4087);
    bool _4113 = !_4071;
    if (!_4113)
    {
        float _4115 = -_2974;
        float _4117 = _4115 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4119 = -_2976;
        float _4121 = _4119 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4123 = -_2978;
        float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4127 = _4117 * _4117;
        float _4129 = fma(_4121, _4121, _4127);
        float _4131 = fma(_4125, _4125, _4129);
        float _4133 = sqrt(_4131);
        float _4135 = rsqrt(_4131);
        float _4137 = -_4133;
        float _4139 = _4137 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4141 = _4139 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4143 = precise::clamp(_4141, 0.0, 1.0);
        float _4145 = _4121 * _4135;
        float _4147 = _4117 * _4135;
        float _4149 = abs(_4143);
        float _4151 = log2(_4149);
        float _4153 = _4125 * _4135;
        float _4155 = _4145 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4157 = _3719 * _4147;
        float _4159 = -_4147;
        float _4161 = -_4155;
        float _4163 = fma(_4159, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4161);
        float _4165 = fma(_3699, _4145, _4157);
        float _4167 = -_4153;
        float _4169 = fma(_4167, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4163);
        float _4171 = fma(_3721, _4153, _4165);
        float _4173 = precise::clamp(_4171, 0.0, 1.0);
        float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4177 = _4169 + _4175;
        float _4179 = _4151 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4181 = _4177 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4183 = precise::clamp(_4181, 0.0, 1.0);
        float _4185 = exp2(_4179);
        float _4187 = _4185 * _4183;
        float _4189 = _4173 * _4187;
        float _4191 = _4189 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4193 = _4189 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4195 = _4189 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _4191;
        out.m_92.y = _4193;
        out.m_92.z = _4195;
    }
    out.m_94.x = _4107;
    out.m_94.y = _4109;
    out.m_94.z = _4111;
    if (!_4093)
    {
        return out;
    }
    float _4197 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4197;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3949 = false;
    bool _351 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_59.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4254 = as_type<float>(_129);
        out.gl_Position.z = _4254;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_61.w;
    float _135 = in.m_63.x;
    bool _137 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_133);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_133;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_65.x = _135;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_113);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _123;
    if (_163)
    {
        out.m_59.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _131 = as_type<int>(_167);
    }
    int _169 = _131;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4327 = as_type<float>(_169);
        out.gl_Position.z = _4327;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = in.m_70.w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_61.x;
    float _189 = in.m_61.y;
    float _191 = in.m_61.z;
    float _193 = in.m_56.x;
    float _195 = in.m_56.y;
    float _197 = in.m_56.z;
    float _199 = 0.0;
    if (!_185)
    {
        float _201 = _173 * _173;
        float _203 = _201 * 0.5;
        _199 = _203;
    }
    float _205 = _199;
    float _207 = _205;
    if (!_185)
    {
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    int _213 = as_type<int>(_171) & 1;
    bool _215 = _213 != 0;
    int _217 = as_type<int>(_171) & 2;
    bool _219 = _217 != 0;
    bool _221 = !_215;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_219;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_185;
    float _231 = _211;
    if (!_229)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = _173 * _235;
        float _245 = 1.0 / _239;
        float _247 = _241 * 0.693147182464599609375;
        float _249 = exp2(_243);
        float _251 = 1.0 / _247;
        float _253 = _249 + (-1.0);
        float _255 = -_253;
        float _257 = fma(_255, _251, _173);
        float _259 = _257 * _245;
        float _261 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _261;
    }
    float _263 = _231;
    float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _271 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _273 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _275 = _265 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _277 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[8].x, _271);
    float _279 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[8].y, _273);
    float _281 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[8].z, _275);
    float _283 = _273;
    if (!_185)
    {
        _283 = _173;
    }
    float _285 = _283;
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[10].x, _277);
    bool _289 = !_185;
    float _291 = _285;
    if (!_289)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = 1.0 / _299;
        float _303 = _173 * _295;
        float _305 = exp2(_303);
        float _307 = -_305;
        float _309 = _307 + 1.0;
        float _311 = _309 * _301;
        _291 = _311;
    }
    float _313 = _291;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _317 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[10].y, _279);
    float _319 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[10].z, _281);
    float _321 = fma(_313, _187, _287);
    float _323 = fma(_313, _189, _317);
    float _325 = fma(_313, _191, _319);
    float _327 = fma(_321, _175, _193);
    float _329 = fma(_323, _175, _195);
    float _331 = fma(_325, _175, _197);
    bool _333 = !_315;
    float _349;
    if (!_333)
    {
        float _335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _337 = _135 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _341 = _339 * _335;
        float _343 = floor(_341);
        float _345 = -_343;
        float _347 = _341 + _345;
        _349 = _347;
        _351 = true;
    }
    else
    {
        float _353 = float(_113);
        float _355 = 1.0 / _353;
        float _357 = _149 * _355;
        _349 = _357;
    }
    _351 = false;
    float _359 = _349;
    float _361 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _363 = int(_361);
    float _365 = float(_113);
    float _367 = _329 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _369 = _329 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _371 = _329 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _373 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[5].x, _367);
    float _375 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[4].x, _369);
    float _377 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _379 = int(_377);
    float _381 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[6].x, _371);
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _385 = float(_363);
    float _387 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _389 = int(_387);
    float _391 = float(uint(_379));
    float _393 = 1.0 / _385;
    int _395 = ~_379;
    int _397 = _395 + 1;
    float _399 = float(_379);
    bool _401 = _379 == 0;
    float _403 = 1.0 / _391;
    float _405 = float(_389);
    float _407 = _393 * _149;
    int _409 = ~_379;
    int _411 = _409 + 1;
    float _413 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _415 = int(_413);
    int _417 = as_type<int>(_403) + (-2);
    float _419 = trunc(_407);
    int _421 = int(_419);
    float _423 = 1.0 / _405;
    float _425 = float(uint(_415));
    int _427 = ~_415;
    int _429 = _427 + 1;
    int _431 = ~_415;
    int _433 = _431 + 1;
    float _435 = float(uint(_421));
    float _437 = 1.0 / _425;
    float _439 = as_type<float>(_417) * _435;
    float _441 = _423 * _149;
    float _443 = 1.0 / _365;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _447 = _445 != 0;
    float _449 = trunc(_439);
    float _451 = precise::max(_449, 0.0);
    uint _454 = uint(_451);
    float _456 = _405;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_447)
    {
        _456 = 1.0;
    }
    float _460 = _456;
    float _462 = trunc(_441);
    int _464 = int(_462);
    float _466 = _460;
    if (!_447)
    {
        _466 = 7.345489978790283203125;
    }
    float _468 = _466;
    float _470 = _468 * _135;
    int _472 = _411 * int(_454);
    int _474 = _472 + _421;
    float _476 = float(uint(_474));
    int _478 = as_type<int>(_437) + (-2);
    float _480 = float(uint(_464));
    float _482 = as_type<float>(_417) * _476;
    float _484 = floor(_470);
    float _486 = as_type<float>(_478) * _480;
    float _488 = trunc(_482);
    float _490 = precise::max(_488, 0.0);
    uint _492 = uint(_490);
    float _494 = trunc(_486);
    float _496 = precise::max(_494, 0.0);
    uint _498 = uint(_496);
    float _500 = -_484;
    float _502 = _470 + _500;
    int _504 = int(_454) + int(_492);
    float _506 = float(_421);
    int _508 = _397 * _504;
    int _510 = _508 + _421;
    bool _512 = _506 >= _399;
    bool _514 = isnan(_506);
    bool _516 = _512 || _514;
    bool _518 = isnan(_399);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    int _524 = _429 * int(_498);
    int _526 = _524 + _464;
    bool _528 = uint(_510) >= uint(_379);
    float _530 = trunc(_522);
    int _532 = int(_530);
    float _534 = float(uint(_526));
    bool _536 = !_528;
    int _538 = _536 ? 0 : (-1);
    float _540 = as_type<float>(_478) * _534;
    int _542 = ~_504;
    int _544 = _542 + _538;
    int _546 = _544 + 1;
    float _548 = _502 * _399;
    float _550 = in.m_63.y;
    int _552 = _379 * _546;
    int _554 = _552 + _421;
    float _556 = trunc(_540);
    float _558 = precise::max(_556, 0.0);
    uint _560 = uint(_558);
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _568 = _566 != 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _572 = _570 != 0;
    int _574 = ~_532;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    bool _580 = !_401;
    int _582 = _580 ? _554 : (-1);
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _586 = _584 != 0;
    float _588 = trunc(_548);
    int _590 = int(_588);
    int _592 = _379 + (-1);
    int _594 = _582 * _578;
    bool _596 = !_568;
    int _598 = _596 ? 0 : 1;
    float _600 = _443 * _149;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _604 = _602 != 0;
    int _606 = _532 * _592;
    int _608 = _606 + _594;
    bool _610 = !_586;
    int _612 = _610 ? 0 : 1;
    float _614 = _399 * _600;
    int _616 = abs(_598);
    int _618 = abs(_612);
    float _620 = trunc(_614);
    int _622 = int(_620);
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _626 = _624 != 0;
    int _628 = _590 * _618;
    int _630 = _628 + _421;
    int _632 = int(_498) + int(_560);
    int _634 = _608 * _616;
    float _636 = as_type<float>(_546);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_604)
    {
        _636 = _135;
    }
    float _640 = _636;
    float _642 = _640;
    if (_604)
    {
        _458 = 1.0;
    }
    float _644 = _458;
    float _646 = _644;
    if (!_604)
    {
        _642 = _550;
    }
    float _648 = _642;
    if (!_604)
    {
        _646 = 1.2345600128173828125;
    }
    float _650 = _646;
    int _652 = ~_415;
    int _654 = _652 + 1;
    float _656 = float(_415);
    float _658 = _648 * _650;
    bool _660 = !_564;
    int _662 = _660 ? 0 : 1;
    bool _664 = !_572;
    int _666 = _664 ? 0 : 1;
    float _668 = floor(_658);
    int _670 = abs(_662);
    bool _672 = !_626;
    int _674 = _672 ? 0 : 1;
    int _676 = abs(_666);
    int _678 = _622 * _670;
    int _680 = _678 + _634;
    int _682 = abs(_674);
    int _684 = _654 * _632;
    int _686 = _684 + _464;
    float _688 = float(_464);
    int _690 = _630 * _676;
    int _692 = _690 + _680;
    bool _694 = _688 >= _656;
    bool _696 = isnan(_688);
    bool _698 = _694 || _696;
    bool _700 = isnan(_656);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -_668;
    float _708 = _658 + _706;
    bool _710 = uint(_686) >= uint(_415);
    int _712 = _590 * _682;
    int _714 = _712 + _692;
    bool _716 = _415 == 0;
    float _718 = _708 * _656;
    float _720 = trunc(_704);
    int _722 = int(_720);
    bool _724 = !_710;
    int _726 = _724 ? 0 : (-1);
    float _728 = _656 * _600;
    float _730 = float(uint(_714));
    int _732 = ~_632;
    int _734 = _732 + _726;
    int _736 = _734 + 1;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _740 = _738 != 0;
    float _742 = trunc(_718);
    int _744 = int(_742);
    float _746 = as_type<float>(_417) * _730;
    int _748 = _415 * _736;
    int _750 = _748 + _464;
    bool _752 = !_740;
    int _754 = _752 ? 0 : 1;
    int _756 = ~_379;
    int _758 = _756 + 1;
    bool _760 = !_716;
    int _762 = _760 ? _750 : (-1);
    float _764 = trunc(_746);
    float _766 = precise::max(_764, 0.0);
    uint _768 = uint(_766);
    int _770 = ~_722;
    int _772 = _770 + 1;
    int _774 = _772 + 1;
    int _776 = abs(_754);
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _780 = _778 != 0;
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _784 = _782 != 0;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _788 = _786 != 0;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _792 = _790 != 0;
    int _794 = _762 * _774;
    int _796 = _415 + (-1);
    float _798 = trunc(_728);
    int _800 = int(_798);
    int _802 = _744 * _776;
    int _804 = _802 + _464;
    bool _806 = !_784;
    int _808 = _806 ? 0 : 1;
    int _810 = _722 * _796;
    int _812 = _810 + _794;
    bool _814 = !_780;
    int _816 = _814 ? 0 : 1;
    int _818 = abs(_808);
    int _820 = _758 * int(_768);
    int _822 = _820 + _714;
    bool _824 = !_788;
    int _826 = _824 ? 0 : 1;
    int _828 = abs(_816);
    float _830 = float(uint(_822));
    int _832 = abs(_826);
    int _834 = _812 * _818;
    float _836 = as_type<float>(_417) * _830;
    bool _838 = !_792;
    int _840 = _838 ? 0 : 1;
    int _842 = _800 * _828;
    int _844 = _842 + _834;
    float _846 = float(uint(_630));
    float _848 = trunc(_836);
    float _850 = precise::max(_848, 0.0);
    uint _852 = uint(_850);
    int _854 = abs(_840);
    int _856 = _804 * _832;
    int _858 = _856 + _844;
    int _860 = ~_379;
    int _862 = _860 + 1;
    float _864 = as_type<float>(_417) * _846;
    bool _866 = _379 == 0;
    int _868 = _744 * _854;
    int _870 = _868 + _858;
    int _872 = ~_379;
    int _874 = _872 + 1;
    float _876 = trunc(_864);
    float _878 = precise::max(_876, 0.0);
    uint _880 = uint(_878);
    float _882 = float(uint(_804));
    float _884 = float(uint(_870));
    float _886 = as_type<float>(_478) * _882;
    float _888 = as_type<float>(_478) * _884;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _892 = trunc(_886);
    float _894 = precise::max(_892, 0.0);
    uint _896 = uint(_894);
    int _898 = int(_768) + int(_852);
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _902 = ~_415;
    int _904 = _902 + 1;
    int _906 = _862 * int(_880);
    int _908 = _906 + _630;
    float _910 = _550 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _912 = _874 * _898;
    int _914 = _912 + _714;
    float _916 = trunc(_888);
    float _918 = precise::max(_916, 0.0);
    uint _920 = uint(_918);
    float _922 = float(uint(_908));
    bool _924 = uint(_914) >= uint(_379);
    float _926 = as_type<float>(_417) * _922;
    bool _928 = !_924;
    int _930 = _928 ? 0 : (-1);
    int _932 = _433 * int(_896);
    int _934 = _932 + _804;
    int _936 = ~_898;
    int _938 = _936 + _930;
    int _940 = _938 + 1;
    float _942 = trunc(_926);
    float _944 = precise::max(_942, 0.0);
    uint _946 = uint(_944);
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _950 = _904 * int(_920);
    int _952 = _950 + _870;
    int _954 = _379 * _940;
    int _956 = _954 + _714;
    int _958 = ~_379;
    int _960 = _958 + 1;
    float _962 = float(uint(_952));
    bool _964 = !_866;
    int _966 = _964 ? _956 : (-1);
    float _968 = as_type<float>(_478) * _962;
    int _970 = _966 & 3;
    bool _972 = _970 != 0;
    int _974 = _966 & 3;
    bool _976 = _974 != 0;
    float _978 = trunc(_968);
    float _980 = precise::max(_978, 0.0);
    uint _982 = uint(_980);
    bool _984 = uint(_970) > 1u;
    int _986 = int(_880) + int(_946);
    int _988 = _976 ? 0 : 1;
    bool _990 = _970 != 3;
    int _992 = _960 * _986;
    int _994 = _992 + _630;
    int _996 = ~_988;
    int _998 = _996 + 1;
    int _1000 = _998 + 1;
    bool _1002 = uint(_994) >= uint(_379);
    int _1004 = _1000;
    int _1006 = 1;
    if (!_984)
    {
        int _1008 = ~_988;
        int _1010 = _1008 + 1;
        _1004 = _1010;
    }
    int _1012 = _1004;
    int _1014 = int(_920) + int(_982);
    float _1016 = in.m_63.z;
    int _1018 = ~_415;
    int _1020 = _1018 + 1;
    bool _1022 = uint(_970) >= 2u;
    bool _1024 = !_1002;
    int _1026 = _1024 ? 0 : (-1);
    int _1028 = _1020 * _1014;
    int _1030 = _1028 + _870;
    int _1032 = _1022 ? 0 : 1;
    int _1034 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1036 = _1034 != 0;
    bool _1038 = uint(_1030) >= uint(_415);
    float _1040 = in.m_63.w;
    int _1042 = ~_1032;
    int _1044 = _1042 + 1;
    int _1046 = _1044 + 1;
    int _1048 = _1046;
    if (_604)
    {
        _1006 = 0;
    }
    int _1050 = _1006;
    int _1052 = _1050;
    if (_990)
    {
        int _1054 = ~_1032;
        int _1056 = _1054 + 1;
        _1048 = _1056;
    }
    int _1058 = _1048;
    if (!_604)
    {
        _1052 = 1;
    }
    int _1060 = _1052;
    bool _1062 = _135 > 0.5;
    bool _1064 = _1060 != 1;
    float _1066 = -_223;
    int _1068 = _1062 ? as_type<int>(_1066) : as_type<int>(_223);
    bool _1070 = _550 > 0.5;
    bool _1072 = !_1036;
    float _1074 = _1072 ? _223 : as_type<float>(_1068);
    float _1076 = -_227;
    int _1078 = _1070 ? as_type<int>(_1076) : as_type<int>(_227);
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1082 = _1080 != 0;
    float _1084 = _1074 + 0.5;
    bool _1086 = _1016 > 0.5;
    bool _1088 = !_1038;
    int _1090 = _1088 ? 0 : (-1);
    bool _1092 = !_972;
    int _1094 = _1092 ? 0 : 1;
    bool _1096 = !_1082;
    float _1098 = _1096 ? _227 : as_type<float>(_1078);
    float _1100 = -_223;
    int _1102 = _1086 ? as_type<int>(_1100) : as_type<int>(_223);
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1106 = _1104 != 0;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1110 = _1108 != 0;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1114 = _1112 != 0;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1118 = _1116 != 0;
    float _1120 = 0.0;
    if (!_1064)
    {
        _1120 = _550;
    }
    float _1122 = _1120;
    float _1124 = 0.0;
    float _1126 = _1122;
    if (!_1064)
    {
        _1124 = _550;
    }
    float _1128 = _1124;
    float _1130 = _1128;
    if (!_1064)
    {
        _638 = _1016;
    }
    float _1132 = _638;
    float _1134 = 0.0;
    float _1136 = _1132;
    if (!_1064)
    {
        _1134 = _1016;
    }
    float _1138 = _1134;
    float _1140 = _1138;
    if (_1064)
    {
        _1126 = _135;
    }
    float _1142 = _1126;
    if (_1064)
    {
        _1130 = _135;
    }
    float _1144 = _1130;
    if (_1064)
    {
        _1136 = _550;
    }
    float _1146 = _1136;
    if (_1064)
    {
        _1140 = _550;
    }
    float _1148 = _1140;
    bool _1150 = _1040 > 0.5;
    float _1152 = _135 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1154 = ~_1014;
    int _1156 = _1154 + _1090;
    int _1158 = _1156 + 1;
    bool _1160 = !_1114;
    float _1162 = _1160 ? _223 : as_type<float>(_1102);
    float _1164 = -_890;
    float _1166 = fma(_1152, 2.0, _1164);
    float _1168 = float(uint(_934));
    float _1170 = fma(_910, -2.0, _900);
    float _1172 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[4].z, _375);
    float _1174 = -_149;
    float _1176 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1166);
    float _1178 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[5].z, _373);
    float _1180 = as_type<float>(_478) * _1168;
    float _1182 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[6].z, _381);
    float _1184 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1176);
    float _1186 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1170);
    float _1188 = _1098 + (-0.5);
    int _1190 = _415 * _1158;
    int _1192 = _1190 + _870;
    float _1194 = trunc(_1180);
    float _1196 = precise::max(_1194, 0.0);
    uint _1198 = uint(_1196);
    float _1200 = -_1188;
    float _1202 = -_1186;
    float _1204 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1202);
    float _1206 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1208 = !_716;
    int _1210 = _1208 ? _1192 : (-1);
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1214 = _1178 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1218 = _966 >> 31;
    float _1220 = -_383;
    float _1222 = fma(_1206, 2.0, _1220);
    float _1224 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1212);
    float _1226 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1228 = _1218 & 3;
    float _1230 = _1172 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1232 = ~_415;
    int _1234 = _1232 + 1;
    float _1236 = fma(_1226, -2.0, _948);
    int _1238 = int(_896) + int(_1198);
    float _1240 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1216);
    int _1242 = _1210 >> 31;
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1246 = _1230 + _1244;
    int _1248 = _966 + _1228;
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1252 = _1214 + _1250;
    int _1254 = _1242 & 3;
    int _1256 = _1234 * _1238;
    int _1258 = _1256 + _804;
    int _1260 = _1248 >> 2;
    float _1262 = _1182 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1264 = _1210 + _1254;
    float _1266 = _1162 + 0.5;
    int _1268 = _1260 << 4;
    int _1270 = _1268 + 368;
    float _1272 = -_149;
    float _1274 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1222);
    int _1276 = _1264 >> 2;
    float _1278 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1236);
    float _1280 = -_227;
    int _1282 = _1150 ? as_type<int>(_1280) : as_type<int>(_227);
    float _1284 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1224);
    int _1286 = _1276 << 4;
    int _1288 = _1286 + 512;
    float _1290 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1240);
    uint _1292 = uint(int(uint(_1270) >> uint(2)));
    uint _1294 = uint(int(uint(int(_1292)) >> uint(2)));
    int _1296 = int(_1292) & 3;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[int(_1294)][_1296];
    int _1300 = int(_1292) + 1;
    uint _1302 = uint(int(uint(_1300) >> uint(2)));
    int _1304 = _1300 & 3;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[int(_1302)][_1304];
    bool _1308 = _970 != 3;
    float _1310 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1312 = uint(_1258) >= uint(_415);
    float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1316 = _1262 + _1314;
    bool _1318 = !_1308;
    int _1320 = _1318 ? 0 : (-1);
    float _1322 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1310);
    int _1324 = ~_986;
    int _1326 = _1324 + _1026;
    int _1328 = _1326 + 1;
    uint _1330 = uint(int(uint(_1288) >> uint(2)));
    uint _1332 = uint(int(uint(int(_1330)) >> uint(2)));
    int _1334 = int(_1330) & 3;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[int(_1332)][_1334];
    int _1338 = int(_1330) + 1;
    uint _1340 = uint(int(uint(_1338) >> uint(2)));
    int _1342 = _1338 & 3;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[int(_1340)][_1342];
    bool _1346 = !_1118;
    float _1348 = _1346 ? _227 : as_type<float>(_1282);
    float _1350 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1322);
    int _1352 = _1210 & 3;
    bool _1354 = _1352 != 0;
    int _1356 = _379 * _1328;
    int _1358 = _1356 + _630;
    int _1360 = _1210 & 3;
    bool _1362 = _1360 != 0;
    float _1364 = _1348 + (-0.5);
    int _1366 = _1354 ? 0 : 1;
    int _1368 = _1270 + 8;
    uint _1370 = uint(int(uint(_1368) >> uint(2)));
    uint _1372 = uint(int(uint(int(_1370)) >> uint(2)));
    int _1374 = int(_1370) & 3;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[int(_1372)][_1374];
    int _1378 = int(_1370) + 1;
    uint _1380 = uint(int(uint(_1378) >> uint(2)));
    int _1382 = _1378 & 3;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[int(_1380)][_1382];
    bool _1386 = uint(_1360) > 1u;
    float _1388 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1274);
    bool _1390 = !_1312;
    int _1392 = _1390 ? 0 : (-1);
    float _1394 = -_1364;
    float _1396 = -_1278;
    float _1398 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1396);
    bool _1400 = !_1362;
    int _1402 = _1400 ? 0 : 1;
    int _1404 = ~_1238;
    int _1406 = _1404 + _1392;
    int _1408 = _1406 + 1;
    int _1410 = _1288 + 8;
    uint _1412 = uint(int(uint(_1410) >> uint(2)));
    uint _1414 = uint(int(uint(int(_1412)) >> uint(2)));
    int _1416 = int(_1412) & 3;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[int(_1414)][_1416];
    int _1420 = int(_1412) + 1;
    uint _1422 = uint(int(uint(_1420) >> uint(2)));
    int _1424 = _1420 & 3;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[int(_1422)][_1424];
    bool _1428 = uint(_1360) >= 2u;
    int _1430 = ~_1366;
    int _1432 = _1430 + 1;
    int _1434 = _1432 + 1;
    int _1436 = _415 * _1408;
    int _1438 = _1436 + _804;
    int _1440 = _1428 ? 0 : 1;
    int _1442 = _1434;
    if (!_1386)
    {
        int _1444 = ~_1366;
        int _1446 = _1444 + 1;
        _1442 = _1446;
    }
    int _1448 = _1442;
    bool _1450 = _1360 != 3;
    int _1452 = abs(_1012);
    bool _1454 = _1360 != 3;
    int _1456 = abs(_1448);
    int _1458 = abs(_1094);
    int _1460 = abs(_1402);
    int _1462 = ~_1452;
    int _1464 = _1462 + 1;
    int _1466 = _1464 + 1;
    int _1468 = ~_1440;
    int _1470 = _1468 + 1;
    int _1472 = _1470 + 1;
    int _1474 = ~_1456;
    int _1476 = _1474 + 1;
    int _1478 = _1476 + 1;
    int _1480 = _1466 * as_type<int>(_1306);
    int _1482 = _1472;
    if (_1450)
    {
        int _1484 = ~_1440;
        int _1486 = _1484 + 1;
        _1482 = _1486;
    }
    int _1488 = _1482;
    int _1490 = _1478 * as_type<int>(_1344);
    int _1492 = ~_1458;
    int _1494 = _1492 + 1;
    int _1496 = _1494 + 1;
    int _1498 = abs(_1058);
    int _1500 = abs(_1488);
    int _1502 = _1496 * as_type<int>(_1298);
    int _1504 = _1502 + _1480;
    int _1506 = ~_1460;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    int _1512 = abs(_1320);
    int _1514 = _1510 * as_type<int>(_1336);
    int _1516 = _1514 + _1490;
    int _1518 = ~_1498;
    int _1520 = _1518 + 1;
    int _1522 = _1520 + 1;
    int _1524 = ~_1500;
    int _1526 = _1524 + 1;
    int _1528 = _1526 + 1;
    bool _1530 = !_1106;
    int _1532 = _1530 ? 0 : 1;
    int _1534 = _1522 * as_type<int>(_1376);
    int _1536 = _1534 + _1504;
    bool _1538 = !_1454;
    int _1540 = _1538 ? 0 : (-1);
    int _1542 = _1528 * as_type<int>(_1418);
    int _1544 = _1542 + _1516;
    int _1546 = ~_1512;
    int _1548 = _1546 + 1;
    int _1550 = _1548 + 1;
    int _1552 = abs(_1540);
    int _1554 = abs(_1532);
    int _1556 = _1550 * as_type<int>(_1384);
    int _1558 = _1556 + _1536;
    bool _1560 = !_1110;
    int _1562 = _1560 ? 0 : 1;
    int _1564 = abs(_1562);
    int _1566 = ~_1554;
    int _1568 = _1566 + 1;
    int _1570 = _1568 + 1;
    int _1572 = ~_1552;
    int _1574 = _1572 + 1;
    int _1576 = _1574 + 1;
    int _1578 = _1558 * _1570;
    float _1580 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1582 = ~_1564;
    int _1584 = _1582 + 1;
    int _1586 = _1584 + 1;
    int _1588 = _1576 * as_type<int>(_1426);
    int _1590 = _1588 + _1544;
    bool _1592 = !_716;
    float _1594 = _1592 ? as_type<float>(_1438) : as_type<float>(0xffffffffu /* nan */);
    float _1596 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1598 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1580);
    int _1600 = _1590 * _1586;
    bool _1602 = !_866;
    int _1604 = _1602 ? _1358 : (-1);
    float _1606 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1596);
    float _1608 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1598);
    int _1610 = as_type<int>(_1594) * _1564;
    int _1612 = _1610 + _1600;
    float _1614 = _1252 * _1252;
    float _1616 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1606);
    float _1618 = -_1608;
    float _1620 = _1618 + 1.0;
    int _1622 = _1604 * _1554;
    int _1624 = _1622 + _1578;
    bool _1626 = _1350 >= 0.0;
    float _1628 = -_1616;
    float _1630 = _1628 + 1.0;
    float _1632 = fma(_1246, _1246, _1614);
    float _1634 = -_1284;
    float _1636 = _1634 + 1.0;
    float _1638 = -_1290;
    float _1640 = _1638 + 1.0;
    float _1642 = fma(_1098, _1630, _1204);
    float _1644 = fma(_1316, _1316, _1632);
    float _1646 = -_1620;
    float _1648 = fma(_1074, _1646, _1184);
    float _1650 = -_1636;
    float _1652 = fma(_1162, _1650, _1388);
    float _1654 = fma(_1348, _1640, _1398);
    float _1656 = float(_1624);
    float _1658 = rsqrt(_1644);
    float _1660 = _1594;
    if (_1626)
    {
        _1660 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1662 = _1660;
    out.m_72.x = _1648;
    out.m_72.y = _1642;
    out.m_72.z = _1652;
    out.m_72.w = _1654;
    float _1664 = float(_1612);
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1668 = _1666 != 0;
    int _1670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1672 = _1670 != 0;
    int _1674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1676 = _1674 != 0;
    int _1678 = as_type<int>(_1662);
    if (_1626)
    {
        float _1680 = _1662 * 5.0;
        _1678 = as_type<int>(_1680);
    }
    int _1682 = _1678;
    float _1684 = as_type<float>(_1682);
    if (_1626)
    {
        out.m_59.x = 0.0;
    }
    bool _1686 = !_1672;
    int _1688 = _1686 ? 0 : 1;
    if (_1626)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6531 = as_type<float>(_1682);
        out.gl_Position.z = _6531;
    }
    bool _1690 = !_1676;
    int _1692 = _1690 ? 0 : 1;
    bool _1694 = !_1668;
    int _1696 = _1694 ? 0 : 1;
    out.m_74.x = _1656;
    out.m_74.y = _1664;
    float _1698 = _1252 * _1658;
    float _1700 = _1246 * _1658;
    if (_1626)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1702 = -_1698;
    float _1704 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1214);
    float _1706 = _1316 * _1658;
    float _1708 = -_1700;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1230);
    float _1712 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1714 = _1704 + _1712;
    float _1716 = -_1706;
    float _1718 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1262);
    float _1720 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1722 = _1710 + _1720;
    float _1724 = _1714 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1728 = _1718 + _1726;
    float _1730 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1724);
    float _1732 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1730);
    bool _1734 = _1732 >= 0.0;
    if (_1734)
    {
        _1684 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1736 = _1684;
    int _1738 = as_type<int>(_1736);
    if (_1734)
    {
        out.m_59.x = 0.0;
    }
    if (_1734)
    {
        float _1740 = _1736 * 5.0;
        _1738 = as_type<int>(_1740);
    }
    int _1742 = _1738;
    if (_1734)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6639 = as_type<float>(_1742);
        out.gl_Position.z = _6639;
    }
    if (_1734)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1744 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1746 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1748 = floor(_1744);
    float _1750 = floor(_1746);
    float _1752 = -_1748;
    float _1754 = _1744 + _1752;
    float _1756 = -_1750;
    float _1758 = _1746 + _1756;
    float2 _6675 = float2(_1754, _1758);
    float _1760 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6675, float2(0.0), isnan(_6675)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6675, float2(0.0), isnan(_6675)), level(0.0)).x;
    float _1762 = _135 * 2.0;
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1766 = _359 + _1764;
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1770 = _1768 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1772 = floor(_1762);
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1774;
    float _1778 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1780 = _359 + _1778;
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1782;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1788 = _1786 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1792 = _359 + _1790;
    int _1794 = abs(_1696);
    float _1796 = 1.0 / _1770;
    float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _1798;
    int _1802 = abs(_1688);
    float _1804 = 1.0 / _1800;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _1806;
    float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1812 = _359 + _1810;
    bool _1814 = _1772 > 0.0;
    bool _1816 = _1772 >= 0.0;
    bool _1818 = isnan(_1772);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan(0.0);
    bool _1824 = _1820 || _1822;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1828 = _359 + _1826;
    float _1830 = float(_1794);
    float _1832 = 1.0 / _1808;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1836 = _359 + _1834;
    float _1838 = _1766 * _1796;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1842 = _359 + _1840;
    float _1844 = 1.0 / _1784;
    float _1846 = _1836 * _1804;
    float _1848 = 1.0 / _1776;
    float _1850 = _1842 * _1832;
    float _1852 = _135 + _1016;
    float _1854 = _1852 + (-1.0);
    float _1856 = 1.0 / _1788;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1860 = _1858 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1862 = _1780 * _1844;
    float _1864 = _1016 * 2.0;
    float _1866 = 1.0 / _1860;
    float _1868 = _550 * 2.0;
    float _1870 = _1792 * _1848;
    float _1872 = _1812 * _1856;
    float _1874 = _135 + _550;
    float _1876 = floor(_1868);
    float _1878 = _1874 + (-1.0);
    float _1880 = _1016 + _550;
    float _1882 = _1016 + (-0.5);
    float _1884 = _1828 * _1866;
    float _1886 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1888 = floor(_1864);
    float _1890 = fma(_1854, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1894 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1892;
    float _1896 = _1880 + (-1.0);
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1898;
    float _1902 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1904 = _1902 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1906 = fma(_1896, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1908 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1910 = log2(_1908);
    float _1912 = fma(_1900, _1870, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1914 = fma(_1894, _1870, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1916 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1918 = _1916 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1920 = fma(_1904, _1838, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1922 = _1876 > 0.0;
    float _1924 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1924;
    bool _1928 = _1876 >= 0.0;
    bool _1930 = isnan(_1876);
    bool _1932 = _1928 || _1930;
    bool _1934 = isnan(0.0);
    bool _1936 = _1932 || _1934;
    float _1938 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1940 = _1938 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1942 = fma(_1918, _1838, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1944;
    bool _1948 = _1888 > 0.0;
    float _1950 = fma(_1940, _1872, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _1952 = _1888 >= 0.0;
    bool _1954 = isnan(_1888);
    bool _1956 = _1952 || _1954;
    bool _1958 = isnan(0.0);
    bool _1960 = _1956 || _1958;
    float _1962 = fma(_1926, _1862, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _1964;
    float _1968 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _1970 = _1968 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1972 = fma(_1946, _1862, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1974 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1976 = _1974 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _1980 = _1978 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1982 = _1910 * _149;
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _1984;
    float _1988 = fma(_1970, _1884, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _1990 = fma(_1976, _1872, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1992 = fma(_1980, _1884, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _1994 = fma(_1986, _1846, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _1996 = fma(_1966, _1846, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1998 = exp2(_1982);
    int _2000 = _1824 ? 0 : 1;
    int _2002 = _1960 ? 0 : 1;
    float _2004 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2006 = 1.0 + _2004;
    int _2008 = ~_2000;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    int _2014 = ~_2002;
    int _2016 = _2014 + 1;
    int _2018 = _2016 + 1;
    int _2020 = _2012;
    int _2022 = _2018;
    if (!_1814)
    {
        int _2024 = ~_2000;
        int _2026 = _2024 + 1;
        _2020 = _2026;
    }
    int _2028 = _2020;
    float _2030 = 1.0 / _2006;
    if (!_1948)
    {
        int _2032 = ~_2002;
        int _2034 = _2032 + 1;
        _2022 = _2034;
    }
    int _2036 = _2022;
    float _2038 = in.m_76.x;
    float _2040 = in.m_76.y;
    float _2042 = in.m_76.z;
    bool _2044 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2046 = isnan(1.0);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2052 = _2048 || _2050;
    float _2054 = -_1998;
    float _2056 = _2054 + 1.0;
    bool _2058 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2060 = isnan(0.0);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2066 = _2062 || _2064;
    float _2068 = float(_2036);
    float _2070 = float(_2028);
    float _2072 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _2072;
    float _2076 = float(_1802);
    float _2078 = _1830 * _2068;
    float _2080 = _2066 ? _2056 : 0.0;
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _2082;
    float _2086 = -_1698;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1252);
    float _2090 = _2076 * _2070;
    float _2092 = _2078 * (-2.0);
    if (_2052)
    {
        float _2094 = _2080 * _2030;
        _153 = _2094;
    }
    float _2096 = _153;
    float _2098 = fma(_2084, _1850, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _2100 = _2090 * (-2.0);
    float _2102 = fma(_1886, _2092, _1886);
    bool _2104 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _2106 = isnan(_359);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _2112 = _2108 || _2110;
    float _2114 = float(_2112);
    float _2116 = fma(_2074, _1850, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _2118 = fma(_1906, _2100, _1906);
    float _2120 = fma(_2100, _2040, _2040);
    bool _2122 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _2124 = isnan(_359);
    bool _2126 = _2122 || _2124;
    bool _2128 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _2130 = _2126 || _2128;
    float _2132 = float(_2130);
    float _2134 = _550 + (-0.5);
    float _2136 = -_2114;
    float _2138 = _2136 + 1.0;
    bool _2140 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _2142 = isnan(_359);
    bool _2144 = _2140 || _2142;
    bool _2146 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _2148 = _2144 || _2146;
    float _2150 = float(_2148);
    float _2152 = fma(_2092, _2038, _2038);
    float _2154 = -_2132;
    float _2156 = _2154 + 1.0;
    float _2158 = _135 + (-0.5);
    float _2160 = _2132 * _2138;
    bool _2162 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _2164 = isnan(_359);
    bool _2166 = _2162 || _2164;
    bool _2168 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _2170 = _2166 || _2168;
    float _2172 = float(_2170);
    float _2174 = _2150 * _2156;
    float _2176 = fma(_2134, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2120);
    float _2178 = -_2150;
    float _2180 = _2178 + 1.0;
    float _2182 = -_1700;
    float _2184 = fma(_2182, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1246);
    float _2186 = _2088 * _2088;
    float _2188 = fma(_2158, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2152);
    bool _2190 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2192 = isnan(_359);
    bool _2194 = _2190 || _2192;
    bool _2196 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2198 = _2194 || _2196;
    float _2200 = float(_2198);
    float _2202 = _2172 * _2180;
    float _2204 = -_2172;
    float _2206 = _2204 + 1.0;
    float _2208 = fma(_2184, _2184, _2186);
    bool _2210 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2212 = isnan(_359);
    bool _2214 = _2210 || _2212;
    bool _2216 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2218 = _2214 || _2216;
    float _2220 = float(_2218);
    float _2222 = -_1706;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1316);
    float _2226 = _2200 * _2206;
    float _2228 = -_2200;
    float _2230 = _2228 + 1.0;
    float _2232 = fma(_2102, _2096, _2188);
    bool _2234 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2236 = isnan(_359);
    bool _2238 = _2234 || _2236;
    bool _2240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2242 = _2238 || _2240;
    float _2244 = float(_2242);
    float _2246 = -_2220;
    float _2248 = _2246 + 1.0;
    float _2250 = _2220 * _2230;
    float _2252 = fma(_2224, _2224, _2208);
    bool _2254 = _359 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2256 = isnan(_359);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2262 = _2258 || _2260;
    float _2264 = float(_2262);
    float _2266 = _2244 * _2248;
    int _2268 = _1936 ? 0 : 1;
    float _2270 = -_2244;
    float _2272 = _2270 + 1.0;
    int _2274 = abs(_1692);
    float _2276 = _2232 * 0.15915493667125701904296875;
    int _2278 = ~_2268;
    int _2280 = _2278 + 1;
    int _2282 = _2280 + 1;
    float _2284 = _2264 * _2272;
    int _2286 = _2282;
    if (!_1922)
    {
        int _2288 = ~_2268;
        int _2290 = _2288 + 1;
        _2286 = _2290;
    }
    int _2292 = _2286;
    float _2294 = fma(_2118, _2096, _2176);
    float _2296 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2298 = float(_2292);
    float _2300 = _1914 * _2284;
    float _2302 = float(_2274);
    float _2304 = _1912 * _2284;
    float _2306 = -_2264;
    float _2308 = _2306 + 1.0;
    float _2310 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2296);
    float _2312 = _2294 * 0.15915493667125701904296875;
    float _2314 = _2302 * _2298;
    float _2316 = fma(_2308, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2304);
    float _2318 = fma(_2308, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2300);
    float _2320 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2310);
    float _2322 = _2314 * (-2.0);
    float _2324 = fma(_1920, _2266, _2316);
    float _2326 = fma(_1942, _2266, _2318);
    float _2328 = _2320 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2330 = fma(_2322, _2042, _2042);
    float _2332 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2334 = fma(_1890, _2322, _1890);
    float _2336 = 1.0 / _2328;
    float _2338 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2330);
    float _2340 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2332);
    float _2342 = fma(_1972, _2250, _2326);
    float _2344 = fma(_1962, _2250, _2324);
    float _2346 = fma(_2334, _2096, _2338);
    float _2348 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2340);
    float _2350 = fma(_1990, _2226, _2342);
    float _2352 = _2312 * 6.283185482025146484375;
    float _2354 = sin(_2352);
    float _2356 = _2346 * 0.15915493667125701904296875;
    float _2358 = _2348 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2360 = fma(_1950, _2226, _2344);
    float _2362 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2364 = in.m_70.x;
    float _2366 = in.m_70.y;
    float _2368 = _2358 + _2328;
    float _2370 = fma(_1996, _2202, _2350);
    float _2372 = _2312 * 6.283185482025146484375;
    float _2374 = cos(_2372);
    float _2376 = _1704 + _2362;
    float _2378 = _2368 * _2336;
    float _2380 = _2378 * 0.5;
    float _2382 = fma(_1992, _2174, _2370);
    float _2384 = fma(_1994, _2202, _2360);
    float _2386 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2388 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2390 = fma(_2116, _2160, _2382);
    float _2392 = sqrt(_2252);
    float _2394 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2386);
    float _2396 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2388);
    float _2398 = fma(_1988, _2174, _2384);
    float _2400 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[150].y, _2390);
    float _2402 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2404 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2402);
    float _2406 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2394);
    float _2408 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2396);
    float _2410 = _2276 * 6.283185482025146484375;
    float _2412 = sin(_2410);
    float _2414 = fma(_2098, _2160, _2398);
    float _2416 = _2406 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2418 = _2408 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2420 = _2400 * _2366;
    float _2422 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[150].x, _2414);
    float _2424 = _1658 * _2392;
    float _2426 = 1.0 / _2404;
    float _2428 = _2422 * _2364;
    float _2430 = _2420 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2432 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _2434 = _2428 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2436 = _2424 * _2430;
    float _2438 = _2276 * 6.283185482025146484375;
    float _2440 = cos(_2438);
    float _2442 = _2412 * _2374;
    float _2444 = _2424 * _2434;
    float _2446 = _2432 * _2436;
    float _2448 = _2412 * _2354;
    float _2450 = trunc(_2416);
    int _2452 = int(_2450);
    float _2454 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2456 = _2426 * _2454;
    bool _2458 = _2456 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2460 = trunc(_2418);
    int _2462 = int(_2460);
    bool _2464 = _2456 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2466 = _2440 * _2354;
    bool _2468 = !_2458;
    int _2470 = _2468 ? 0 : 1;
    float _2472 = _2440 * _2374;
    float _2474 = _2356 * 6.283185482025146484375;
    float _2476 = sin(_2474);
    int _2478 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2480 = _2452 + _2478;
    int _2482 = _2480 + 1;
    int _2484 = 2;
    int _2486 = _2482;
    float _2488 = _2322;
    float _2490 = _2320;
    float _2492 = _2418;
    float _2494 = _2376;
    if (!_2458)
    {
        _2484 = 1;
    }
    int _2496 = _2484;
    bool _2498 = _2482 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2500 = _2496;
    if (!_2464)
    {
        _2500 = _2470;
    }
    int _2502 = _2500;
    float _2504 = _2356 * 6.283185482025146484375;
    float _2506 = cos(_2504);
    int _2508 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2510 = _2462 + _2508;
    int _2512 = _2510 + 1;
    int _2514 = _2502 << 6;
    int _2516 = _2482 | _2512;
    int _2518 = _2514 + 72;
    uint _2520 = uint(int(uint(_2518) >> uint(2)));
    uint _2522 = uint(int(uint(int(_2520)) >> uint(2)));
    int _2524 = int(_2520) & 3;
    float _2526 = (*spvDescriptorSet0.vp_c15)._m0[int(_2522)][_2524];
    int _2528 = int(_2520) + 1;
    uint _2530 = uint(int(uint(_2528) >> uint(2)));
    int _2532 = _2528 & 3;
    float _2534 = (*spvDescriptorSet0.vp_c15)._m0[int(_2530)][_2532];
    float _2536 = -_2466;
    float _2538 = fma(_2476, _2442, _2536);
    float _2540 = -_2442;
    float _2542 = fma(_2476, _2466, _2540);
    float _2544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _2546 = fma(_2476, _2472, _2448);
    bool _2548 = _2516 < 0;
    bool _2550 = _2548 || _2498;
    float _2552 = -_2446;
    float _2554 = _2476 * _2552;
    float _2556 = _2544 * _2444;
    float _2558 = fma(_2476, _2448, _2472);
    float _2560 = _2440 * _2506;
    float _2562 = _2412 * _2506;
    float _2564 = _2374 * _2506;
    bool _2566 = _2512 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2568 = _2566 || _2550;
    float _2570 = _2560 * _2446;
    float _2572 = _2424 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2574 = _2572 * 0.5;
    float _2576 = _2562 * _2446;
    float _2578 = _2354 * _2506;
    float _2580 = fma(_2546, _2556, _2570);
    float _2582 = fma(_2564, _2556, _2554);
    int _2584 = _2514 + 96;
    uint _2586 = uint(int(uint(_2584) >> uint(2)));
    uint _2588 = uint(int(uint(int(_2586)) >> uint(2)));
    int _2590 = int(_2586) & 3;
    float _2592 = (*spvDescriptorSet0.vp_c15)._m0[int(_2588)][_2590];
    int _2594 = int(_2586) + 1;
    uint _2596 = uint(int(uint(_2594) >> uint(2)));
    int _2598 = _2594 & 3;
    float _2600 = (*spvDescriptorSet0.vp_c15)._m0[int(_2596)][_2598];
    float _2602 = fma(_2538, _2556, _2576);
    float _2604 = fma(_2542, _2574, _2580);
    float _2606 = fma(_2578, _2574, _2582);
    bool _2608 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2610 = isnan(0.5);
    bool _2612 = _2608 || _2610;
    bool _2614 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2616 = _2612 || _2614;
    float _2618 = fma(_2558, _2574, _2602);
    float _2620 = _2604 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2622 = as_type<int>(_2620);
    float _2624 = as_type<float>(_2502);
    if (!_2568)
    {
        int _2626 = _2512 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2628 = _2626 + _2482;
        _2486 = _2628;
    }
    int _2630 = _2486;
    int _2632 = _2514 + 104;
    uint _2634 = uint(int(uint(_2632) >> uint(2)));
    uint _2636 = uint(int(uint(int(_2634)) >> uint(2)));
    int _2638 = int(_2634) & 3;
    float _2640 = (*spvDescriptorSet0.vp_c15)._m0[int(_2636)][_2638];
    int _2642 = int(_2634) + 1;
    uint _2644 = uint(int(uint(_2642) >> uint(2)));
    int _2646 = _2642 & 3;
    float _2648 = (*spvDescriptorSet0.vp_c15)._m0[int(_2644)][_2646];
    float _2650 = _2604 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2652 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2620);
    int _2654 = as_type<int>(_2650);
    if (!_2568)
    {
        float _2656 = floor(_2416);
        _2488 = _2656;
    }
    float _2658 = _2488;
    float _2660 = _2658;
    if (!_2568)
    {
        int _2662 = _2630 << 2;
        _2622 = _2662;
    }
    int _2664 = _2622;
    float _2666 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2650);
    float _2668 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2652);
    int _2670 = as_type<int>(_2668);
    if (!_2568)
    {
        uint _2672 = uint(int(uint(_2630) >> uint(2)));
        _2654 = int(_2672);
    }
    int _2674 = _2654;
    int _2676 = _2514 + 48;
    uint _2678 = uint(int(uint(_2676) >> uint(2)));
    uint _2680 = uint(int(uint(int(_2678)) >> uint(2)));
    int _2682 = int(_2678) & 3;
    float _2684 = (*spvDescriptorSet0.vp_c15)._m0[int(_2680)][_2682];
    int _2686 = int(_2678) + 1;
    uint _2688 = uint(int(uint(_2686) >> uint(2)));
    int _2690 = _2686 & 3;
    float _2692 = (*spvDescriptorSet0.vp_c15)._m0[int(_2688)][_2690];
    float _2694 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2666);
    float _2696 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    if (!_2568)
    {
        int _2698 = 12 & _2664;
        _2670 = _2698;
    }
    int _2700 = _2670;
    float _2702 = _2694 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2704 = _1262 + _2696;
    float _2706 = _2704;
    if (!_2568)
    {
        int _2708 = _2674 << 4;
        int _2710 = _2708 + _2700;
        _2490 = as_type<float>(_2710);
    }
    float _2712 = _2490;
    int _2714 = _2514 + 64;
    uint _2716 = uint(int(uint(_2714) >> uint(2)));
    uint _2718 = uint(int(uint(int(_2716)) >> uint(2)));
    int _2720 = int(_2716) & 3;
    float _2722 = (*spvDescriptorSet0.vp_c15)._m0[int(_2718)][_2720];
    int _2724 = int(_2716) + 1;
    uint _2726 = uint(int(uint(_2724) >> uint(2)));
    int _2728 = _2724 & 3;
    float _2730 = (*spvDescriptorSet0.vp_c15)._m0[int(_2726)][_2728];
    float _2732 = _1230 + _2702;
    float _2734 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2736 = _2704 + _2734;
    float _2738 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2740 = _2732 + _2738;
    float _2742 = _2736 * _2736;
    int _2744 = _2514 + 56;
    uint _2746 = uint(int(uint(_2744) >> uint(2)));
    uint _2748 = uint(int(uint(int(_2746)) >> uint(2)));
    int _2750 = int(_2746) & 3;
    float _2752 = (*spvDescriptorSet0.vp_c15)._m0[int(_2748)][_2750];
    int _2754 = int(_2746) + 1;
    uint _2756 = uint(int(uint(_2754) >> uint(2)));
    int _2758 = _2754 & 3;
    float _2760 = (*spvDescriptorSet0.vp_c15)._m0[int(_2756)][_2758];
    float _2762 = fma(_2740, _2740, _2742);
    float _2764 = sqrt(_2762);
    int _2766 = _2514 + 80;
    uint _2768 = uint(int(uint(_2766) >> uint(2)));
    uint _2770 = uint(int(uint(int(_2768)) >> uint(2)));
    int _2772 = int(_2768) & 3;
    float _2774 = (*spvDescriptorSet0.vp_c15)._m0[int(_2770)][_2772];
    int _2776 = int(_2768) + 1;
    uint _2778 = uint(int(uint(_2776) >> uint(2)));
    int _2780 = _2776 & 3;
    float _2782 = (*spvDescriptorSet0.vp_c15)._m0[int(_2778)][_2780];
    int _2784 = _2514 + 88;
    uint _2786 = uint(int(uint(_2784) >> uint(2)));
    uint _2788 = uint(int(uint(int(_2786)) >> uint(2)));
    int _2790 = int(_2786) & 3;
    float _2792 = (*spvDescriptorSet0.vp_c15)._m0[int(_2788)][_2790];
    int _2794 = int(_2786) + 1;
    uint _2796 = uint(int(uint(_2794) >> uint(2)));
    int _2798 = _2794 & 3;
    float _2800 = (*spvDescriptorSet0.vp_c15)._m0[int(_2796)][_2798];
    float _2802 = _2376 * _2600;
    float _2804 = fma(_1710, _2592, _2802);
    float _2806 = _2604 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2808 = _2764 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2810 = _2712;
    float _2812 = _2648;
    float _2814 = _2732;
    if (!_2568)
    {
        int _2816 = as_type<int>(_2712) + 400;
        uint _2818 = uint(int(uint(_2816) >> uint(2)));
        uint _2820 = uint(int(uint(int(_2818)) >> uint(2)));
        int _2822 = int(_2818) & 3;
        float _2824 = (*spvDescriptorSet0.vp_c15)._m0[int(_2820)][_2822];
        _2810 = _2824;
    }
    float _2826 = _2810;
    float _2828 = fma(_1718, _2640, _2804);
    float _2830 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2806);
    float _2832 = _2604;
    if (!_2568)
    {
        float _2834 = floor(_2418);
        _2832 = _2834;
    }
    float _2836 = _2832;
    float _2838 = _2828 + _2648;
    float _2840 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2830);
    float _2842 = _2376 * _2692;
    float _2844 = 1.0 / _2838;
    float _2846 = fma(_1710, _2684, _2842);
    float _2848 = _2840 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2850 = _2376 * _2730;
    float _2852 = _1214 + _2848;
    float _2854 = fma(_1710, _2722, _2850);
    if (!_2808)
    {
        _2812 = _2852;
    }
    float _2856 = _2812;
    float _2858 = fma(_1718, _2752, _2846);
    float _2860 = fma(_1718, _2526, _2854);
    bool _2862 = !_2808;
    float _2864 = _2856;
    if (!_2862)
    {
        float _2866 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2870 = _2764 + _2868;
        float _2872 = rsqrt(_2762);
        float _2874 = _2870 * _2866;
        float _2876 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2878 = _2874 * 0.15915493667125701904296875;
        float _2880 = _2878 * 6.283185482025146484375;
        float _2882 = cos(_2880);
        float _2884 = _2878 * 6.283185482025146484375;
        float _2886 = sin(_2884);
        float _2888 = _2882 + (-1.0);
        float _2890 = fma(_2886, _2876, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2892 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2894 = _2872 * _2890;
        float _2896 = fma(_2852, _2882, _2892);
        float _2898 = fma(_2740, _2894, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2900 = fma(_2736, _2894, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2814 = _2898;
        _2864 = _2896;
        _2706 = _2900;
    }
    float _2902 = _2814;
    float _2904 = _2864;
    float _2906 = _2706;
    float _2908 = -_1700;
    float _2910 = fma(_2908, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2902);
    float _2912 = -_1698;
    float _2914 = fma(_2912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2904);
    float _2916 = -_1706;
    float _2918 = fma(_2916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2906);
    float _2920 = _2858 + _2760;
    float _2922 = _2860 + _2534;
    float _2924 = _2914;
    float _2926 = _2910;
    float _2928 = _2918;
    if (!_2616)
    {
        float _2930 = _1714 * _1714;
        float _2932 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2934 = -_1262;
        float _2936 = _2934 + _2906;
        float _2938 = -_1214;
        float _2940 = _2938 + _2904;
        float _2942 = fma(_1722, _1722, _2930);
        float _2944 = fma(_1728, _1728, _2942);
        float _2946 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2948 = sqrt(_2944);
        float _2950 = 1.0 / _2424;
        float _2952 = _2946 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2954 = precise::min(_2948, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2956 = _2954 * _2932;
        float _2958 = _2956 * _2950;
        float _2960 = -_1230;
        float _2962 = _2960 + _2902;
        float _2964 = _2952 * _2958;
        float _2966 = _2936 * _2958;
        float _2968 = fma(_2940, _2964, _1704);
        float _2970 = fma(_2962, _2964, _1710);
        float _2972 = fma(_2952, _2966, _1718);
        _2924 = _2968;
        _2926 = _2970;
        _2928 = _2972;
    }
    float _2974 = _2924;
    float _2976 = _2926;
    float _2978 = _2928;
    float _2980 = _2974 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2982 = _2974 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2984 = _2920 * _2844;
    float _2986 = _2974 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2988 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2980);
    float _2990 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2982);
    float _2992 = _2974 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _2994 = _2984 >= 0.0;
    float _2996 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2988);
    float _2998 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2986);
    float _3000 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2990);
    float _3002 = _2922 * _2844;
    float _3004 = _2996 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3006 = _2984 <= 1.0;
    bool _3008 = _3006 && _2994;
    float _3010 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2998);
    float _3012 = _3000 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3014 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2992);
    float _3016 = _3004 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3018 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _3020 = _3002 >= 0.0;
    bool _3022 = _3020 && _3008;
    float _3024 = fma(_2978, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3014);
    float _3026 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3016);
    float _3028 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3030 = _3018 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _3032 = _3002 <= 1.0;
    bool _3034 = _3032 && _3022;
    float _3036 = _3024 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3038 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3026);
    float _3040 = -_3030;
    float _3042 = fma(_3040, _3028, 1.0);
    float _3044 = _2376 * _2782;
    float _3046 = _3004 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3048 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3038);
    float _3050 = _3004 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3052 = fma(_1710, _2774, _3044);
    float _3054 = log2(_3042);
    float _3056 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3046);
    float _3058 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3050);
    float _3060 = fma(_1718, _2792, _3052);
    float _3062 = _3014;
    float _3064 = _3048;
    if (_3034)
    {
        float _3066 = float(_2502);
        _2624 = _3066;
    }
    float _3068 = _2624;
    float _3070 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3056);
    float _3072 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3058);
    float _3074 = _3060 + _2800;
    float _3076 = 1.0 / _3048;
    float _3078 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3070);
    float _3080 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3072);
    float _3082 = _3072;
    float _3084 = _3068;
    float _3086 = _3078;
    if (!_2568)
    {
        float _3088 = -_2836;
        float _3090 = _2418 + _3088;
        _3062 = _3090;
    }
    float _3092 = _3062;
    if (!_2568)
    {
        float _3094 = -_2658;
        float _3096 = _2416 + _3094;
        _3082 = _3096;
    }
    float _3098 = _3082;
    float _3100 = _3074 * _2844;
    float _3102 = _2722;
    if (!_2568)
    {
        float _3104 = rint(_2826);
        float _3106 = precise::max(_3104, 0.0);
        uint _3108 = uint(_3106);
        uint _3110 = clamp(_3108, 0u, 65535u);
        _3102 = as_type<float>(_3110);
    }
    float _3112 = _3102;
    float _3114 = _3054 * 0.693147182464599609375;
    float _3116 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3118 = _3052;
    float _3120 = _3116;
    if (_3034)
    {
        float _3122 = rint(_3068);
        float _3124 = precise::max(_3122, 0.0);
        uint _3126 = uint(_3124);
        uint _3128 = clamp(_3126, 0u, 65535u);
        _3118 = as_type<float>(_3128);
    }
    float _3130 = _3118;
    float _3132 = _3078 * _3076;
    float _3134 = _3080 * _3076;
    float _3136 = fma(_3132, 0.5, 0.5);
    float _3138 = fma(_3134, -0.5, 0.5);
    float _3140 = _3092;
    float _3142 = _3136;
    if (!_2568)
    {
        float3 _8886 = float3(_3098, _3092, float(as_type<int>(_3112)));
        float3 _8890 = select(_8886, float3(0.0), isnan(_8886));
        float _3144 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8890.xy, uint(rint(_8890.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8890.xy, uint(rint(_8890.z)), level(0.0)).x;
        _3140 = _3144;
    }
    float _3146 = _3140;
    float _3148 = _3002;
    if (_3034)
    {
        float3 _8905 = float3(_2984, _3002, float(as_type<int>(_3130)));
        float3 _8907 = select(_8905, float3(0.0), isnan(_8905));
        float _3150 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8907.xy, uint(rint(_8907.z)), _3100, level(0.0));
        _3148 = _3150;
    }
    float _3152 = _3148;
    float3 _8917 = float3(_3136, _3138, _3116);
    float _3154 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8917, float3(0.0), isnan(_8917)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8917, float3(0.0), isnan(_8917)), level(0.0)).x;
    float3 _8926 = float3(_3136, _3138, _3116);
    float4 _3157 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8926, float3(0.0), isnan(_8926)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8926, float3(0.0), isnan(_8926)), level(0.0)).xyzw;
    float _3159 = _3157.x;
    float _3161 = _3157.y;
    float _3163 = _3157.z;
    float _3165 = _3157.w;
    bool _3167 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3169 = isnan(0.5);
    bool _3171 = _3167 || _3169;
    bool _3173 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3175 = _3171 || _3173;
    if (_2568)
    {
        _3084 = 1.0;
    }
    float _3177 = _3084;
    float _3179 = _3177;
    if (_3175)
    {
        _2660 = 1.0;
    }
    float _3181 = _2660;
    float _3183 = _3181;
    if (_3175)
    {
        _2492 = 1.0;
    }
    float _3185 = _2492;
    float _3187 = _3185;
    float _3189 = _3159;
    if (!_3175)
    {
        float _3191 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3193 = _3191 * 0.15915493667125701904296875;
        float _3195 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3197 = _3193 * 6.283185482025146484375;
        float _3199 = cos(_3197);
        float _3201 = _3195 * 0.15915493667125701904296875;
        float _3203 = _3193 * 6.283185482025146484375;
        float _3205 = sin(_3203);
        float _3207 = 1.0 / _3199;
        float _3209 = _3201 * 6.283185482025146484375;
        float _3211 = cos(_3209);
        float _3213 = _3205 * _3207;
        float _3215 = _3201 * 6.283185482025146484375;
        float _3217 = sin(_3215);
        float _3219 = _3211 * _3213;
        float _3221 = 1.0 / _3219;
        float _3223 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3225 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3223;
        float _3227 = 1.0 / _3225;
        float _3229 = _3217 * _3221;
        float _3231 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3233 = fma(_2456, _3229, _3231);
        float _3235 = _3233 * _3227;
        float _3237 = precise::clamp(_3235, 0.0, 1.0);
        _3142 = _3201;
        _3187 = _3237;
    }
    float _3239 = _3142;
    float _3241 = _3187;
    float _3243 = _3239;
    if (!_3175)
    {
        float _3245 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3247 = _3245 * 0.15915493667125701904296875;
        float _3249 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3251 = _3247 * 6.283185482025146484375;
        float _3253 = cos(_3251);
        float _3255 = _3249 * 0.15915493667125701904296875;
        float _3257 = _3247 * 6.283185482025146484375;
        float _3259 = sin(_3257);
        float _3261 = 1.0 / _3253;
        float _3263 = _3255 * 6.283185482025146484375;
        float _3265 = cos(_3263);
        float _3267 = _3259 * _3261;
        float _3269 = _3255 * 6.283185482025146484375;
        float _3271 = sin(_3269);
        float _3273 = _3265 * _3267;
        float _3275 = 1.0 / _3273;
        float _3277 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3279 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3277;
        float _3281 = 1.0 / _3279;
        float _3283 = _3271 * _3275;
        float _3285 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3287 = fma(_2456, _3283, _3285);
        float _3289 = _3287 * _3281;
        float _3291 = precise::clamp(_3289, 0.0, 1.0);
        float _3293 = -_3291;
        float _3295 = _3293 + 1.0;
        _3243 = _3273;
        _3183 = _3295;
    }
    float _3297 = _3243;
    float _3299 = _3183;
    if (!_2568)
    {
        int _3301 = _2630 << 4;
        int _3303 = _3301 + 2048;
        uint _3305 = uint(int(uint(_3303) >> uint(2)));
        uint _3307 = uint(int(uint(int(_3305)) >> uint(2)));
        int _3309 = int(_3305) & 3;
        float _3311 = (*spvDescriptorSet0.vp_c15)._m0[int(_3307)][_3309];
        int _3313 = int(_3305) + 1;
        uint _3315 = uint(int(uint(_3313) >> uint(2)));
        int _3317 = _3313 & 3;
        float _3319 = (*spvDescriptorSet0.vp_c15)._m0[int(_3315)][_3317];
        int _3321 = _3303 + 8;
        uint _3323 = uint(int(uint(_3321) >> uint(2)));
        uint _3325 = uint(int(uint(int(_3323)) >> uint(2)));
        int _3327 = int(_3323) & 3;
        float _3329 = (*spvDescriptorSet0.vp_c15)._m0[int(_3325)][_3327];
        int _3331 = int(_3323) + 1;
        uint _3333 = uint(int(uint(_3331) >> uint(2)));
        int _3335 = _3331 & 3;
        float _3337 = (*spvDescriptorSet0.vp_c15)._m0[int(_3333)][_3335];
        float _3339 = _2376 * _3319;
        float _3341 = fma(_1710, _3311, _3339);
        float _3343 = fma(_1718, _3329, _3341);
        float _3345 = _3343 + _3337;
        float _3347 = precise::clamp(_3345, 0.0, 1.0);
        float _3349 = -_3347;
        float _3351 = _3349 + _3146;
        float _3353 = fma(_3351, 500.0, 1.5);
        float _3355 = exp2(_3353);
        float _3357 = 0.0 + _3355;
        float _3359 = precise::clamp(_3357, 0.0, 1.0);
        _2494 = _3339;
        _3179 = _3359;
    }
    float _3361 = _2494;
    float _3363 = _3179;
    float _3365 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3367 = _2974 + _3365;
    float _3369 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3371 = _2976 + _3369;
    float _3373 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3375 = _2978 + _3373;
    float _3377 = _3367 * _3367;
    float _3379 = fma(_3371, _3371, _3377);
    float _3381 = fma(_3375, _3375, _3379);
    float _3383 = rsqrt(_3381);
    float _3385 = sqrt(_3381);
    float _3387 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3389 = _3371 * _3387;
    float _3391 = _3375 * _3387;
    float _3393 = _3389 * _3389;
    float _3395 = _3391 * _3391;
    float _3397 = _3393 + _3395;
    float _3399 = sqrt(_3397);
    bool _3401 = _3399 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3403 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3405 = _3399 + _3403;
    float _3407 = _3361;
    float _3409 = _3397;
    float _3411 = _3405;
    float _3413 = _3367;
    float _3415 = _3389;
    float _3417 = _3391;
    float _3419 = _3393;
    float _3421 = _3395;
    if (_3401)
    {
        float _3423 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3407 = _3423;
    }
    float _3425 = _3407;
    if (_3401)
    {
        float _3427 = rsqrt(_3397);
        _3409 = _3427;
    }
    float _3429 = _3409;
    if (_3401)
    {
        float _3431 = _3405 * _3425;
        _3411 = _3431;
    }
    float _3433 = _3411;
    if (_3401)
    {
        float _3435 = _3433 * 0.15915493667125701904296875;
        _3120 = _3435;
    }
    float _3437 = _3120;
    float _3439 = _3297;
    if (_3401)
    {
        float _3441 = _3437 * 6.283185482025146484375;
        float _3443 = sin(_3441);
        _3439 = _3443;
    }
    float _3445 = _3439;
    float _3447 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3449 = precise::max(0.0, _3447);
    float _3451 = _3146;
    float _3453 = _3445;
    float _3455 = _3447;
    float _3457 = _3449;
    if (_3401)
    {
        float _3459 = _3437 * 6.283185482025146484375;
        float _3461 = cos(_3459);
        _3451 = _3461;
    }
    float _3463 = _3451;
    float _3465 = -_3387;
    float _3467 = -_3449;
    float _3469 = fma(_3367, _3465, _3467);
    if (_3401)
    {
        float _3471 = _3469 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3413 = _3471;
    }
    float _3473 = _3413;
    float _3475 = _3473;
    if (_3401)
    {
        float _3477 = fma(_3445, _3473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3453 = _3477;
    }
    float _3479 = _3453;
    float _3481 = _3479;
    if (!_3401)
    {
        _3475 = _3469;
    }
    float _3483 = _3475;
    float _3485 = _3483;
    if (_3401)
    {
        float _3487 = _3463 + (-1.0);
        _3455 = _3487;
    }
    float _3489 = _3455;
    if (_3401)
    {
        float _3491 = _3429 * _3479;
        _3481 = _3491;
    }
    float _3493 = _3481;
    if (_3401)
    {
        float _3495 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3457 = _3495;
    }
    float _3497 = _3457;
    if (_3401)
    {
        float _3499 = _3389 * _3493;
        _3415 = _3499;
    }
    float _3501 = _3415;
    if (_3401)
    {
        float _3503 = _3391 * _3493;
        _3417 = _3503;
    }
    float _3505 = _3417;
    if (_3401)
    {
        float _3507 = fma(_3469, _3463, _3497);
        _3485 = _3507;
    }
    float _3509 = _3485;
    if (_3401)
    {
        float _3511 = _3501 * _3501;
        _3419 = _3511;
    }
    float _3513 = _3419;
    if (_3401)
    {
        float _3515 = _3505 * _3505;
        _3421 = _3515;
    }
    float _3517 = _3421;
    float _3519 = fma(_3509, _3509, _3513);
    float _3521 = _3519 + _3517;
    float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3525 = fma(_3385, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3523);
    float _3527 = precise::clamp(_3525, 0.0, 1.0);
    float _3529 = -_3527;
    float _3531 = _3529 + 1.0;
    float _3533 = rsqrt(_3521);
    float _3535 = _3533 * _3509;
    float _3537 = _3533 * _3501;
    float _3539 = abs(_3531);
    float _3541 = log2(_3539);
    float _3543 = _3533 * _3505;
    float _3545 = _3537 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3547 = -_3545;
    float _3549 = fma(_3535, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3547);
    float _3551 = -_3543;
    float _3553 = fma(_3551, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3549);
    float _3555 = fma(_3553, -0.5, 0.5);
    float _3557 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3559 = fma(_3553, 0.5, 0.5);
    float _3561 = sqrt(_3555);
    float _3563 = fma(_3559, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3565 = fma(_3559, _3563, -0.212114393711090087890625);
    float _3567 = _3535 + 1.0;
    float _3569 = exp2(_3557);
    float _3571 = fma(_3559, _3565, 1.570728778839111328125);
    float _3573 = _3561 * 0.636619746685028076171875;
    float _3575 = -_3571;
    float _3577 = fma(_3573, _3575, 1.0);
    float _3579 = -_3535;
    float _3581 = fma(_3569, _3567, _3579);
    float _3583 = fma(_3581, 0.5, 0.5);
    float2 _9545 = float2(_3577, _3583);
    float3 _3587 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9545, float2(0.0), isnan(_9545)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9545, float2(0.0), isnan(_9545)), level(0.0)).xyz;
    float _3589 = _3587.x;
    float _3591 = _3587.y;
    float _3593 = _3587.z;
    float _3595 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3597 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3599 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3601 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3603 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3595);
    float _3605 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3597);
    float _3607 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3609 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3611 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3613 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3599);
    float _3615 = -_2476;
    float _3617 = fma(_3615, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3607);
    float _3619 = -_2476;
    float _3621 = fma(_3619, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3609);
    float _3623 = -_2476;
    float _3625 = fma(_3623, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3611);
    float _3627 = fma(_3601, _3601, 1.0);
    float _3629 = abs(_2456);
    float _3631 = log2(_3629);
    float _3633 = _2542 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3635 = _2542 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3637 = _2542 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3639 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3617);
    float _3641 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3633);
    float _3643 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3635);
    float _3645 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3621);
    float _3647 = rsqrt(_3627);
    float _3649 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3605);
    float _3651 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3603);
    float _3653 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3613);
    float _3655 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3657 = _3601 * _3639;
    float _3659 = _3601 * _3645;
    float _3661 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3625);
    float _3663 = _3631 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3665 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3637);
    float _3667 = fma(_3655, _3651, _3657);
    float _3669 = fma(_3655, _3649, _3659);
    float _3671 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3643);
    float _3673 = _3601 * _3661;
    float _3675 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3641);
    float _3677 = exp2(_3663);
    float _3679 = _3601 * _3647;
    float _3681 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3665);
    float _3683 = _3004 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_78.x = _3651;
    out.m_78.y = _3649;
    out.m_78.z = _3653;
    float _3685 = fma(_3655, _3653, _3673);
    float _3687 = -_3681;
    float _3689 = _3679 * _3687;
    float _3691 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3683);
    float _3693 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3695 = -_3671;
    float _3697 = _3679 * _3695;
    float _3699 = _3671 + _3667;
    float _3701 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3691);
    float _3703 = -_1760;
    float _3705 = _3703 + 1.0;
    float _3707 = exp2(_3693);
    float _3709 = fma(_3036, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3701);
    float _3711 = -_3675;
    float _3713 = _3679 * _3711;
    float _3715 = fma(_3677, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3717 = precise::clamp(_3715, 0.0, 1.0);
    float _3719 = _3675 + _3669;
    float _3721 = _3681 + _3685;
    float _3723 = fma(_3647, _3645, _3713);
    float _3725 = fma(_3647, _3661, _3689);
    float _3727 = _3048 * 0.5;
    bool _3729 = _2456 <= 8000.0;
    bool _3731 = isnan(_2456);
    bool _3733 = _3729 || _3731;
    bool _3735 = isnan(8000.0);
    bool _3737 = _3733 || _3735;
    float _3739 = float(_3737);
    out.gl_Position.x = _3078;
    out.gl_Position.y = _3080;
    out.gl_Position.z = _3709;
    out.gl_Position.w = _3048;
    float _3741 = fma(_3647, _3639, _3697);
    float _3743 = fma(_3080, -0.5, _3727);
    float _3745 = _3709 + _3048;
    float _3747 = _3078 + _3048;
    out.m_80.x = _3741;
    out.m_80.y = _3723;
    out.m_80.z = _3725;
    float _3749 = fma(_3717, -2.0, 3.0);
    float _3751 = _3717 * _3717;
    float _3753 = _3745 * 0.5;
    float _3755 = _3747 * 0.5;
    out.m_82.x = _3699;
    out.m_82.y = _3719;
    out.m_82.z = _3721;
    float _3757 = _3751 * _3749;
    float _3759 = -_3707;
    float _3761 = _3759 + 1.0;
    if (!_3034)
    {
        _3086 = 1.0;
    }
    float _3763 = _3086;
    out.m_84.x = _3755;
    out.m_84.y = _3743;
    out.m_84.z = _3753;
    out.m_84.w = _3048;
    float _3765 = -_3757;
    float _3767 = _3765 + 1.0;
    float _3769 = _3761 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3771 = _3763;
    float _3773 = _3769;
    if (_3034)
    {
        bool _3775 = _3152 >= _3100;
        bool _3777 = isnan(_3152);
        bool _3779 = _3775 || _3777;
        bool _3781 = isnan(_3100);
        bool _3783 = _3779 || _3781;
        float _3785 = float(_3783);
        _3771 = _3785;
    }
    float _3787 = _3771;
    out.m_86.x = _2976;
    out.m_86.y = _2974;
    out.m_86.z = _2978;
    float _3789 = fma(_3767, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3757);
    float _3791 = _3769 * _3154;
    float _3793 = -_3769;
    float _3795 = _3793 + 1.0;
    bool _3797 = _3385 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3799 = isnan(_3385);
    bool _3801 = _3797 || _3799;
    bool _3803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3805 = _3801 || _3803;
    float _3807 = _3739 * _3789;
    float _3809 = _3787 * _3363;
    float _3811 = _3165 * _3795;
    float _3813 = _3807 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3815 = _3705 * _3813;
    float _3817 = precise::clamp(_3815, 0.0, 1.0);
    float _3819 = _3165 * _3791;
    float _3821 = -_3817;
    float _3823 = fma(_3821, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3825 = _3795;
    if (!_3805)
    {
        _3064 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3827 = _3064;
    float _3829 = _3827;
    float _3831 = _3827;
    if (!_3805)
    {
        _3825 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3833 = _3825;
    float _3835 = -_3809;
    float _3837 = fma(_3835, _3823, 1.0);
    float _3839 = precise::clamp(_3837, 0.0, 1.0);
    float _3841 = _3833;
    float _3843 = _3833;
    if (!_3805)
    {
        _3773 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3845 = _3773;
    float _3847 = _3839 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _3847;
    float _3849 = _3847;
    float _3851 = _3845;
    float _3853 = _3845;
    if (!_3805)
    {
        _3849 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3855 = _3849;
    float _3857 = _3593 * _3791;
    float _3859 = fma(_3589, _3819, _3159);
    float _3861 = fma(_3591, _3819, _3161);
    float _3863 = _3241 * _3299;
    float _3865 = fma(_3165, _3857, _3163);
    float _3867 = _3863;
    float _3869 = _3855;
    float _3871 = _3855;
    if (!_3805)
    {
        _3189 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3873 = _3189;
    float _3875 = _3863 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3877 = _3873;
    float _3879 = _3873;
    if (!_3805)
    {
        _3867 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3881 = _3867;
    out.m_90.x = _3859;
    out.m_90.y = _3861;
    out.m_90.z = _3865;
    out.m_90.w = _3811;
    bool _3883 = !_3805;
    float _3885 = _3881;
    float _3887 = _3881;
    if (!_3883)
    {
        bool _3889 = _3385 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3891 = isnan(_3385);
        bool _3893 = _3889 || _3891;
        bool _3895 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3897 = _3893 || _3895;
        if (!_3897)
        {
            float _3899 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3901 = _3385 + _3899;
            float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3905 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3903;
            float _3907 = 1.0 / _3905;
            float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3911 = _3909 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3915 = _3913 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3919 = _3917 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3921 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3923 = _3921 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3929 = _3901 * _3907;
            float _3931 = precise::clamp(_3929, 0.0, 1.0);
            float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3935 = _3933 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3937 = fma(_3931, _3911, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3939 = fma(_3931, _3935, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3941 = fma(_3931, _3915, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3943 = fma(_3931, _3919, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3945 = fma(_3931, _3923, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3947 = fma(_3931, _3927, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3831 = _3939;
            _3871 = _3945;
            _3879 = _3937;
            _3853 = _3943;
            _3843 = _3941;
            _3887 = _3947;
            _3949 = true;
        }
        else
        {
            bool _3951 = _3385 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3953 = isnan(_3385);
            bool _3955 = _3951 || _3953;
            bool _3957 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3959 = _3955 || _3957;
            if (!_3959)
            {
                _3877 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3961 = _3877;
            _3879 = _3961;
            if (!_3959)
            {
                _3829 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3963 = _3829;
            _3831 = _3963;
            if (!_3959)
            {
                _3841 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3965 = _3841;
            _3843 = _3965;
            if (!_3959)
            {
                _3851 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3967 = _3851;
            _3853 = _3967;
            if (!_3959)
            {
                _3869 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3969 = _3869;
            _3871 = _3969;
            if (!_3959)
            {
                _3885 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3971 = _3885;
            bool _3973 = !_3959;
            _3887 = _3971;
            if (!_3973)
            {
                bool _3975 = _3385 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3977 = isnan(_3385);
                bool _3979 = _3975 || _3977;
                bool _3981 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3983 = _3979 || _3981;
                if (!_3983)
                {
                    float _3985 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3987 = _3385 + _3985;
                    float _3989 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3991 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3989;
                    float _3993 = 1.0 / _3991;
                    float _3995 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3997 = _3995 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3999 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4001 = _3999 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4003 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4005 = _4003 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4007 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4009 = _4007 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4013 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4015 = _3987 * _3993;
                    float _4017 = precise::clamp(_4015, 0.0, 1.0);
                    float _4019 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4021 = _4019 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4023 = fma(_4017, _3997, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4025 = fma(_4017, _4021, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4027 = fma(_4017, _4001, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4029 = fma(_4017, _4005, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4031 = fma(_4017, _4009, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4033 = fma(_4017, _4013, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3831 = _4025;
                    _3871 = _4031;
                    _3879 = _4023;
                    _3853 = _4029;
                    _3843 = _4027;
                    _3887 = _4033;
                    _3949 = true;
                }
                else
                {
                    _3831 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3871 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3879 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3853 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3843 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3887 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3949 = false;
    float _4035 = _3831;
    float _4037 = _3871;
    float _4039 = _3879;
    float _4041 = _3853;
    float _4043 = _3843;
    float _4045 = _3887;
    float _4047 = fma(_3719, -0.5, 0.5);
    float _4049 = precise::clamp(_4047, 0.0, 1.0);
    float _4051 = _3875 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4053 = -_4035;
    float _4055 = _4053 + _4037;
    float _4057 = -_4039;
    float _4059 = _4057 + _4041;
    out.m_92.x = 0.0;
    float _4061 = fma(_4049, _4055, _4035);
    float _4063 = -_4043;
    float _4065 = _4063 + _4045;
    float _4067 = fma(_4049, _4059, _4039);
    out.m_59.x = _4051;
    float _4069 = _4061 * 0.586610972881317138671875;
    bool _4071 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4073 = fma(_4049, _4065, _4043);
    float _4075 = fma(_4067, 0.298911988735198974609375, _4069);
    bool _4077 = _3241 > 0.0;
    bool _4079 = isnan(_3241);
    bool _4081 = _4077 || _4079;
    bool _4083 = isnan(0.0);
    bool _4085 = _4081 || _4083;
    float _4087 = fma(_4073, 0.114477999508380889892578125, _4075);
    bool _4089 = _3299 <= 0.0;
    bool _4091 = !_4085;
    bool _4093 = _4089 || _4091;
    float _4095 = -_4087;
    float _4097 = _4067 + _4095;
    float _4099 = -_4087;
    float _4101 = _4061 + _4099;
    float _4103 = -_4087;
    float _4105 = _4073 + _4103;
    float _4107 = fma(_4097, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4087);
    float _4109 = fma(_4101, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4087);
    float _4111 = fma(_4105, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4087);
    bool _4113 = !_4071;
    if (!_4113)
    {
        float _4115 = -_2974;
        float _4117 = _4115 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4119 = -_2976;
        float _4121 = _4119 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4123 = -_2978;
        float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4127 = _4117 * _4117;
        float _4129 = fma(_4121, _4121, _4127);
        float _4131 = fma(_4125, _4125, _4129);
        float _4133 = sqrt(_4131);
        float _4135 = rsqrt(_4131);
        float _4137 = -_4133;
        float _4139 = _4137 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4141 = _4139 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4143 = precise::clamp(_4141, 0.0, 1.0);
        float _4145 = _4121 * _4135;
        float _4147 = _4117 * _4135;
        float _4149 = abs(_4143);
        float _4151 = log2(_4149);
        float _4153 = _4125 * _4135;
        float _4155 = _4145 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4157 = _3719 * _4147;
        float _4159 = -_4147;
        float _4161 = -_4155;
        float _4163 = fma(_4159, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4161);
        float _4165 = fma(_3699, _4145, _4157);
        float _4167 = -_4153;
        float _4169 = fma(_4167, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4163);
        float _4171 = fma(_3721, _4153, _4165);
        float _4173 = precise::clamp(_4171, 0.0, 1.0);
        float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4177 = _4169 + _4175;
        float _4179 = _4151 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4181 = _4177 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4183 = precise::clamp(_4181, 0.0, 1.0);
        float _4185 = exp2(_4179);
        float _4187 = _4185 * _4183;
        float _4189 = _4173 * _4187;
        float _4191 = _4189 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4193 = _4189 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4195 = _4189 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _4191;
        out.m_92.y = _4193;
        out.m_92.z = _4195;
    }
    out.m_94.x = _4107;
    out.m_94.y = _4109;
    out.m_94.z = _4111;
    if (!_4093)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4197 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_59.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4197;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

