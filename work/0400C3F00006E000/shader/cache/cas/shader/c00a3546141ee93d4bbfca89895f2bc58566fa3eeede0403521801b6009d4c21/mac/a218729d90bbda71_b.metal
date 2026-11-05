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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_16 [[id(9)]];
    sampler vp_t_tcb_16Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d_array<float> vp_t_tcb_14 [[id(15)]];
    sampler vp_t_tcb_14Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_14Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_82 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_84 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_98 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_88 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_96 [[user(locn10)]];
    float4 m_92 [[user(locn11)]];
    float4 m_94 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(1)]];
    float4 m_68 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_70 [[attribute(5)]];
    float4 m_72 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4155 = false;
    bool _2734 = false;
    bool _341 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_58.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_61.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4460 = as_type<float>(_133);
        out.gl_Position.z = _4460;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_63.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    float _155 = _151;
    if (_147)
    {
        float _157 = float(_117);
        _153 = _157;
    }
    float _159 = _153;
    bool _161 = _151 >= _159;
    bool _163 = !_147;
    bool _165 = _161 || _163;
    if (_165)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _127;
    if (_165)
    {
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4529 = as_type<float>(_171);
        out.gl_Position.z = _4529;
    }
    if (_165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    float _175 = in.m_68.x;
    float _177 = in.m_68.y;
    float _179 = in.m_68.z;
    int _181 = as_type<int>(_173) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_173) & 2;
    bool _187 = _185 != 0;
    bool _189 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _191 = _177 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _193 = _177 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _195 = _177 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _197 = !_183;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].x, _191);
    float _203 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].x, _193);
    float _205 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].x, _195);
    bool _207 = !_187;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[4].z, _201);
    float _213 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[5].z, _203);
    float _215 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[6].z, _205);
    bool _217 = !_189;
    int _219 = as_type<int>(_215);
    float _237;
    if (!_217)
    {
        float _221 = in.m_70.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        float _241 = float(_117);
        float _243 = 1.0 / _241;
        float _245 = _151 * _243;
        _237 = _245;
    }
    _239 = false;
    float _247 = _237;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = _247 + _249;
    bool _253 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _255 = isnan(_247);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    float _269 = -_263;
    float _271 = _269 + 1.0;
    bool _273 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _275 = isnan(_247);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _291 = 1.0 / _267;
    float _293 = _283 * _271;
    float _295 = -_283;
    float _297 = _295 + 1.0;
    float _299 = _251 * _291;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _301;
    float _305 = fma(_287, _299, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _307 = fma(_303, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _309 = _305 * _293;
    float _311 = _307 * _293;
    float _313 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _315 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].y, _311);
    float _317 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].x, _313);
    float _319 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].y, _315);
    bool _321 = !_289;
    float _339;
    if (!_321)
    {
        float _323 = in.m_70.x;
        float _325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _327 = _323 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _331 = _329 * _325;
        float _333 = floor(_331);
        float _335 = -_333;
        float _337 = _331 + _335;
        _339 = _337;
        _341 = true;
    }
    else
    {
        float _343 = float(_117);
        float _345 = 1.0 / _343;
        float _347 = _151 * _345;
        _339 = _347;
    }
    _341 = false;
    float _349 = _339;
    float _351 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _353 = int(_351);
    float _355 = float(_117);
    int _357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _359 = _357 != 0;
    float _361 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _363 = int(_361);
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _375 = float(_353);
    float _377 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _379 = int(_377);
    float _381 = 0.0;
    int _383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_359)
    {
        float _385 = in.m_70.x;
        _381 = _385;
    }
    float _387 = _381;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _395 = _387;
    if (!_359)
    {
        float _397 = in.m_70.y;
        _395 = _397;
    }
    float _399 = _395;
    float _401 = float(_363);
    float _403 = 1.0 / _375;
    float _405 = float(uint(_379));
    float _407 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _409 = int(_407);
    int _411 = ~_379;
    int _413 = _411 + 1;
    bool _415 = _379 == 0;
    float _417 = 1.0 / _401;
    float _419 = _403 * _151;
    float _421 = float(uint(_409));
    float _423 = 1.0 / _405;
    int _425 = ~_409;
    int _427 = _425 + 1;
    float _429 = _417 * _151;
    float _431 = trunc(_419);
    int _433 = int(_431);
    float _435 = 1.0 / _421;
    int _437 = as_type<int>(_423) + (-2);
    float _439 = in.m_70.x;
    float _441 = in.m_70.y;
    float _443 = in.m_70.z;
    float _445 = in.m_70.w;
    float _447 = trunc(_429);
    int _449 = int(_447);
    float _451 = float(uint(_433));
    float _453 = float(_433);
    float _455 = as_type<float>(_437) * _451;
    int _457 = as_type<int>(_435) + (-2);
    float _459 = 1.0 / _355;
    float _461 = float(uint(_449));
    float _463 = trunc(_455);
    float _465 = precise::max(_463, 0.0);
    uint _468 = uint(_465);
    float _470 = _441 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _472 = _443 + _439;
    float _474 = as_type<float>(_457) * _461;
    float _476 = _461;
    if (_359)
    {
        _476 = 1.0;
    }
    float _478 = _476;
    float _480 = fma(_470, -2.0, _365);
    float _482 = _478;
    if (!_359)
    {
        _482 = 7.345489978790283203125;
    }
    float _484 = _482;
    float _486 = trunc(_474);
    float _488 = precise::max(_486, 0.0);
    uint _490 = uint(_488);
    float _492 = _459 * _151;
    float _494 = _472 + (-1.0);
    float _496 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _480);
    float _498 = _484 * _439;
    float _500 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _502 = _413 * int(_468);
    int _504 = _502 + _433;
    float _506 = float(_379);
    float _508 = 1.0 / _391;
    float _510 = float(uint(_504));
    int _512 = _427 * int(_490);
    int _514 = _512 + _449;
    float _516 = floor(_498);
    float _518 = float(uint(_514));
    float _520 = as_type<float>(_437) * _510;
    float _522 = _510;
    if (_359)
    {
        _522 = 1.0;
    }
    float _524 = _522;
    float _526 = _524;
    if (!_359)
    {
        _526 = 1.2345600128173828125;
    }
    float _528 = _526;
    float _530 = trunc(_520);
    float _532 = precise::max(_530, 0.0);
    uint _534 = uint(_532);
    float _536 = as_type<float>(_457) * _518;
    float _538 = _369 * _508;
    float _540 = _443 + _441;
    float _542 = _399 * _528;
    int _544 = ~_379;
    int _546 = _544 + 1;
    float _548 = _540 + (-1.0);
    float _550 = trunc(_536);
    float _552 = precise::max(_550, 0.0);
    uint _554 = uint(_552);
    float _556 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _558 = int(_468) + int(_534);
    float _560 = floor(_542);
    bool _562 = _453 >= _506;
    bool _564 = isnan(_453);
    bool _566 = _562 || _564;
    bool _568 = isnan(_506);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -_516;
    float _576 = _498 + _574;
    int _578 = _546 * _558;
    int _580 = _578 + _433;
    int _582 = int(_490) + int(_554);
    float _584 = _576 * _506;
    int _586 = ~_409;
    int _588 = _586 + 1;
    float _590 = trunc(_572);
    int _592 = int(_590);
    bool _594 = uint(_580) >= uint(_379);
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _598 = _596 != 0;
    int _600 = _588 * _582;
    int _602 = _600 + _449;
    bool _604 = !_594;
    int _606 = _604 ? 0 : (-1);
    float _608 = -_560;
    float _610 = _542 + _608;
    bool _612 = !_598;
    int _614 = _612 ? 0 : 1;
    float _616 = trunc(_584);
    int _618 = int(_616);
    int _620 = ~_558;
    int _622 = _620 + _606;
    int _624 = _622 + 1;
    bool _626 = uint(_602) >= uint(_409);
    int _628 = abs(_614);
    int _630 = _379 * _624;
    int _632 = _630 + _433;
    bool _634 = !_626;
    int _636 = _634 ? 0 : (-1);
    int _638 = ~_592;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    bool _644 = !_415;
    int _646 = _644 ? _632 : (-1);
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _650 = _648 != 0;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _658 = _656 != 0;
    int _660 = _618 * _628;
    int _662 = _660 + _433;
    int _664 = ~_582;
    int _666 = _664 + _636;
    int _668 = _666 + 1;
    float _670 = _506 * _492;
    float _672 = float(_409);
    int _674 = _646 * _642;
    float _676 = float(_449);
    float _678 = trunc(_670);
    int _680 = int(_678);
    bool _682 = !_654;
    int _684 = _682 ? 0 : 1;
    int _686 = _409 * _668;
    int _688 = _686 + _449;
    bool _690 = _676 >= _672;
    bool _692 = isnan(_676);
    bool _694 = _690 || _692;
    bool _696 = isnan(_672);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    bool _702 = !_650;
    int _704 = _702 ? 0 : 1;
    int _706 = _379 + (-1);
    int _708 = abs(_684);
    float _710 = _610 * _672;
    int _712 = abs(_704);
    float _714 = trunc(_700);
    int _716 = int(_714);
    int _718 = _592 * _706;
    int _720 = _718 + _674;
    bool _722 = !_658;
    int _724 = _722 ? 0 : 1;
    float _726 = _672 * _492;
    int _728 = _720 * _708;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _732 = _730 != 0;
    float _734 = trunc(_710);
    int _736 = int(_734);
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _740 = _738 != 0;
    int _742 = _680 * _712;
    int _744 = _742 + _728;
    int _746 = abs(_724);
    bool _748 = !_732;
    int _750 = _748 ? 0 : 1;
    bool _752 = !_740;
    int _754 = _752 ? 0 : 1;
    int _756 = _662 * _746;
    int _758 = _756 + _744;
    bool _760 = _409 == 0;
    float _762 = trunc(_726);
    int _764 = int(_762);
    int _766 = abs(_750);
    int _768 = abs(_754);
    int _770 = ~_716;
    int _772 = _770 + 1;
    int _774 = _772 + 1;
    int _776 = _736 * _766;
    int _778 = _776 + _449;
    bool _780 = !_760;
    int _782 = _780 ? _688 : (-1);
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _790 = _788 != 0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _794 = _792 != 0;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _798 = _796 != 0;
    int _800 = _409 + (-1);
    int _802 = _782 * _774;
    bool _804 = _379 == 0;
    int _806 = _618 * _768;
    int _808 = _806 + _758;
    bool _810 = !_790;
    int _812 = _810 ? 0 : 1;
    int _814 = _716 * _800;
    int _816 = _814 + _802;
    bool _818 = !_786;
    int _820 = _818 ? 0 : 1;
    float _822 = float(uint(_808));
    int _824 = abs(_812);
    bool _826 = !_794;
    int _828 = _826 ? 0 : 1;
    float _830 = as_type<float>(_437) * _822;
    int _832 = abs(_820);
    int _834 = _816 * _824;
    bool _836 = !_798;
    int _838 = _836 ? 0 : 1;
    int _840 = abs(_828);
    float _842 = trunc(_830);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    int _848 = abs(_838);
    int _850 = _764 * _832;
    int _852 = _850 + _834;
    int _854 = ~_379;
    int _856 = _854 + 1;
    int _858 = _778 * _840;
    int _860 = _858 + _852;
    int _862 = ~_409;
    int _864 = _862 + 1;
    float _866 = float(uint(_778));
    int _868 = _736 * _848;
    int _870 = _868 + _860;
    float _872 = float(uint(_662));
    float _874 = as_type<float>(_457) * _866;
    float _876 = float(uint(_870));
    int _878 = _856 * int(_846);
    int _880 = _878 + _808;
    int _882 = ~_379;
    int _884 = _882 + 1;
    float _886 = as_type<float>(_437) * _872;
    int _888 = ~_379;
    int _890 = _888 + 1;
    float _892 = as_type<float>(_457) * _876;
    float _894 = float(uint(_880));
    float _896 = trunc(_874);
    float _898 = precise::max(_896, 0.0);
    uint _900 = uint(_898);
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _904 = _902 != 0;
    int _906 = ~_409;
    int _908 = _906 + 1;
    float _910 = as_type<float>(_437) * _894;
    float _912 = trunc(_892);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    float _918 = as_type<float>(_712);
    if (_904)
    {
        _383 = 0;
    }
    int _920 = _383;
    float _922 = trunc(_910);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    int _928 = _920;
    if (!_904)
    {
        _928 = 1;
    }
    int _930 = _928;
    float _932 = trunc(_886);
    float _934 = precise::max(_932, 0.0);
    uint _936 = uint(_934);
    int _938 = _864 * int(_916);
    int _940 = _938 + _870;
    float _942 = float(uint(_940));
    int _944 = int(_846) + int(_926);
    float _946 = as_type<float>(_457) * _942;
    int _948 = ~_409;
    int _950 = _948 + 1;
    int _952 = _884 * _944;
    int _954 = _952 + _808;
    float _956 = trunc(_946);
    float _958 = precise::max(_956, 0.0);
    uint _960 = uint(_958);
    int _962 = _890 * int(_936);
    int _964 = _962 + _662;
    int _966 = _950 * int(_900);
    int _968 = _966 + _778;
    bool _970 = uint(_954) >= uint(_379);
    float _972 = float(uint(_964));
    float _974 = float(uint(_968));
    float _976 = _441 * 2.0;
    float _978 = as_type<float>(_437) * _972;
    bool _980 = !_970;
    int _982 = _980 ? 0 : (-1);
    float _984 = as_type<float>(_457) * _974;
    float _986 = trunc(_978);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    int _992 = ~_944;
    int _994 = _992 + _982;
    int _996 = _994 + 1;
    int _998 = ~_409;
    int _1000 = _998 + 1;
    int _1002 = int(_916) + int(_960);
    int _1004 = _379 * _996;
    int _1006 = _1004 + _808;
    float _1008 = floor(_976);
    bool _1010 = !_804;
    int _1012 = _1010 ? _1006 : (-1);
    int _1014 = _1000 * _1002;
    int _1016 = _1014 + _870;
    int _1018 = _1012 & 3;
    bool _1020 = _1018 != 0;
    bool _1022 = uint(_1016) >= uint(_409);
    bool _1024 = uint(_1018) >= 2u;
    bool _1026 = !_1022;
    int _1028 = _1026 ? 0 : (-1);
    int _1030 = _1024 ? 0 : 1;
    bool _1032 = _1018 != 3;
    int _1034 = int(_936) + int(_990);
    float _1036 = trunc(_984);
    float _1038 = precise::max(_1036, 0.0);
    uint _1040 = uint(_1038);
    int _1042 = _1012 & 3;
    bool _1044 = _1042 != 0;
    int _1046 = ~_1002;
    int _1048 = _1046 + _1028;
    int _1050 = _1048 + 1;
    int _1052 = _1044 ? 0 : 1;
    bool _1054 = uint(_1018) > 1u;
    int _1056 = _409 * _1050;
    int _1058 = _1056 + _870;
    int _1060 = ~_1030;
    int _1062 = _1060 + 1;
    int _1064 = _1062 + 1;
    float _1066 = _439 * 2.0;
    int _1068 = _1064;
    if (_1032)
    {
        int _1070 = ~_1030;
        int _1072 = _1070 + 1;
        _1068 = _1072;
    }
    int _1074 = _1068;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1078 = _1076 != 0;
    float _1080 = floor(_1066);
    bool _1082 = !_760;
    int _1084 = _1082 ? _1058 : (-1);
    int _1086 = ~_379;
    int _1088 = _1086 + 1;
    bool _1090 = !_1078;
    int _1092 = _1090 ? 0 : 1;
    int _1094 = int(_900) + int(_1040);
    int _1096 = _1088 * _1034;
    int _1098 = _1096 + _662;
    int _1100 = _1084 & 3;
    bool _1102 = _1100 != 0;
    int _1104 = ~_1052;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    int _1110 = _908 * _1094;
    int _1112 = _1110 + _778;
    int _1114 = _1108;
    if (!_1054)
    {
        int _1116 = ~_1052;
        int _1118 = _1116 + 1;
        _1114 = _1118;
    }
    int _1120 = _1114;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1124 = _1122 != 0;
    bool _1126 = _1100 != 3;
    bool _1128 = uint(_1098) >= uint(_379);
    bool _1130 = !_1124;
    int _1132 = _1130 ? 0 : 1;
    bool _1134 = uint(_1100) >= 2u;
    bool _1136 = !_1128;
    int _1138 = _1136 ? 0 : (-1);
    bool _1140 = uint(_1100) > 1u;
    int _1142 = _1134 ? 0 : 1;
    int _1144 = _1084 & 3;
    bool _1146 = _1144 != 0;
    int _1148 = ~_1142;
    int _1150 = _1148 + 1;
    int _1152 = _1150 + 1;
    int _1154 = _1152;
    if (_1126)
    {
        int _1156 = ~_1142;
        int _1158 = _1156 + 1;
        _1154 = _1158;
    }
    int _1160 = _1154;
    bool _1162 = _930 != 1;
    bool _1164 = _1080 > 0.0;
    int _1166 = _1146 ? 0 : 1;
    bool _1168 = _1080 >= 0.0;
    bool _1170 = isnan(_1080);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan(0.0);
    bool _1176 = _1172 || _1174;
    int _1178 = ~_1166;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    int _1184 = _1182;
    if (!_1140)
    {
        int _1186 = ~_1166;
        int _1188 = _1186 + 1;
        _1184 = _1188;
    }
    int _1190 = _1184;
    bool _1192 = uint(_1112) >= uint(_409);
    int _1194 = ~_1034;
    int _1196 = _1194 + _1138;
    int _1198 = _1196 + 1;
    int _1200 = _1176 ? 0 : 1;
    bool _1202 = !_1192;
    int _1204 = _1202 ? 0 : (-1);
    int _1206 = _379 * _1198;
    int _1208 = _1206 + _662;
    int _1210 = ~_1200;
    int _1212 = _1210 + 1;
    int _1214 = _1212 + 1;
    float _1216 = in.m_72.x;
    float _1218 = in.m_72.y;
    bool _1220 = _1008 > 0.0;
    int _1222 = _1214;
    if (!_1162)
    {
        _918 = _441;
    }
    float _1224 = _918;
    float _1226 = 0.0;
    float _1228 = _1224;
    if (!_1162)
    {
        _1226 = _441;
    }
    float _1230 = _1226;
    float _1232 = 0.0;
    float _1234 = _1230;
    if (!_1162)
    {
        _1232 = _443;
    }
    float _1236 = _1232;
    float _1238 = 0.0;
    float _1240 = _1236;
    if (!_1162)
    {
        _1238 = _443;
    }
    float _1242 = _1238;
    bool _1244 = _1008 >= 0.0;
    bool _1246 = isnan(_1008);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan(0.0);
    bool _1252 = _1248 || _1250;
    float _1254 = _1242;
    if (!_1164)
    {
        int _1256 = ~_1200;
        int _1258 = _1256 + 1;
        _1222 = _1258;
    }
    int _1260 = _1222;
    if (_1162)
    {
        _1228 = _439;
    }
    float _1262 = _1228;
    if (_1162)
    {
        _1234 = _439;
    }
    float _1264 = _1234;
    if (_1162)
    {
        _1240 = _441;
    }
    float _1266 = _1240;
    if (_1162)
    {
        _1254 = _441;
    }
    float _1268 = _1254;
    float _1270 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[83].z, _393);
    bool _1272 = _1018 != 3;
    float _1274 = _317 * _1216;
    bool _1276 = !_1020;
    int _1278 = _1276 ? 0 : 1;
    float _1280 = _319 * _1218;
    bool _1282 = _445 > 0.5;
    float _1284 = _439 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1286 = _1100 != 3;
    float _1288 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1290 = _1252 ? 0 : 1;
    bool _1292 = !_804;
    int _1294 = _1292 ? _1208 : (-1);
    bool _1296 = !_1272;
    int _1298 = _1296 ? 0 : (-1);
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1302 = _1300 != 0;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1306 = _1304 != 0;
    int _1308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1310 = _1308 != 0;
    float _1312 = in.m_58.x;
    float _1314 = in.m_58.y;
    float _1316 = in.m_58.z;
    bool _1318 = !_1286;
    int _1320 = _1318 ? 0 : (-1);
    int _1322 = ~_1290;
    int _1324 = _1322 + 1;
    int _1326 = _1324 + 1;
    int _1328 = _1326;
    if (!_1220)
    {
        int _1330 = ~_1290;
        int _1332 = _1330 + 1;
        _1328 = _1332;
    }
    int _1334 = _1328;
    int _1336 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1338 = _1336 != 0;
    float _1340 = _443 * 2.0;
    bool _1342 = !_1302;
    int _1344 = _1342 ? 0 : 1;
    float _1346 = floor(_1340);
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1350 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1352 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1354 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1356 = -_1348;
    float _1358 = fma(_1284, 2.0, _1356);
    float _1360 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1350);
    float _1362 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1352);
    float _1364 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1354);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1372 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1360);
    float _1374 = 1.0 / _1368;
    bool _1376 = _1346 >= 0.0;
    bool _1378 = isnan(_1346);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan(0.0);
    bool _1384 = _1380 || _1382;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1392 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1394 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1398 = !_1306;
    int _1400 = _1398 ? 0 : 1;
    float _1402 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1362);
    float _1404 = float(_1260);
    out.m_74.x = _1394;
    out.m_74.y = _1392;
    out.m_74.z = _1396;
    out.m_74.w = _1390;
    bool _1406 = !_1310;
    int _1408 = _1406 ? 0 : 1;
    float _1410 = _1402 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1412 = ~_1094;
    int _1414 = _1412 + _1204;
    int _1416 = _1414 + 1;
    float _1418 = _373 * _1374;
    int _1420 = _1384 ? 0 : 1;
    bool _1422 = _1346 > 0.0;
    float _1424 = _439 + _441;
    int _1426 = ~_1420;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    int _1432 = _409 * _1416;
    int _1434 = _1432 + _778;
    float _1436 = float(_1334);
    float _1438 = _1424 + (-1.0);
    bool _1440 = _409 == 0;
    float _1442 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1444 = log2(_1442);
    float _1446 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1448 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1452 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1456 = _1430;
    if (!_1422)
    {
        int _1458 = ~_1420;
        int _1460 = _1458 + 1;
        _1456 = _1460;
    }
    int _1462 = _1456;
    float _1464 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1450);
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1468 = fma(_1452, -2.0, _1454);
    bool _1470 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1472 = isnan(0.0);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1478 = _1474 || _1476;
    float _1480 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1464);
    float _1482 = -_1466;
    float _1484 = fma(_1448, 2.0, _1482);
    float _1486 = _1444 * _151;
    float _1488 = in.m_76.x;
    float _1490 = in.m_76.y;
    float _1492 = in.m_76.z;
    int _1494 = abs(_1400);
    float _1496 = exp2(_1486);
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1500 = 1.0 + _1498;
    int _1502 = abs(_1344);
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1506 = float(_1494);
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1510 = float(_1502);
    float _1512 = 1.0 / _1500;
    float _1514 = float(_1462);
    float _1516 = _1506 * _1404;
    float _1518 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1508);
    float _1520 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1504);
    float _1522 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1468);
    float _1524 = _1510 * _1514;
    float _1526 = -_151;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1358);
    float _1530 = -_1496;
    float _1532 = _1530 + 1.0;
    float _1534 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1518);
    float _1536 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1520);
    float _1538 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1270);
    float _1540 = -_151;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1484);
    float _1544 = _1478 ? _1532 : 0.0;
    float _1546 = _1524 * (-2.0);
    bool _1548 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1550 = isnan(1.0);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1556 = _1552 || _1554;
    float _1558 = _1516 * (-2.0);
    bool _1560 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1562 = isnan(_349);
    bool _1564 = _1560 || _1562;
    bool _1566 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1568 = _1564 || _1566;
    float _1570 = float(_1568);
    float _1572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    bool _1574 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1576 = isnan(_349);
    bool _1578 = _1574 || _1576;
    bool _1580 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1582 = _1578 || _1580;
    float _1584 = float(_1582);
    bool _1586 = !_1102;
    int _1588 = _1586 ? 0 : 1;
    int _1590 = abs(_1320);
    int _1592 = abs(_1588);
    int _1594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1596 = _1594 != 0;
    if (_1556)
    {
        float _1598 = _1544 * _1512;
        _155 = _1598;
    }
    float _1600 = _155;
    int _1602 = abs(_1408);
    float _1604 = fma(_1546, _1488, _1488);
    bool _1606 = _439 > 0.5;
    float _1608 = _439 + (-0.5);
    float _1610 = float(_1602);
    float _1612 = fma(_1446, _1546, _1446);
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1616 = _349 + _1614;
    float _1618 = fma(_1608, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1604);
    float _1620 = -_1570;
    float _1622 = _1620 + 1.0;
    float _1624 = _1610 * _1436;
    bool _1626 = !_1440;
    int _1628 = _1626 ? _1434 : (-1);
    float _1630 = fma(_1612, _1600, _1618);
    bool _1632 = _441 > 0.5;
    float _1634 = _441 + (-0.5);
    float _1636 = fma(_1558, _1490, _1490);
    float _1638 = _1624 * (-2.0);
    float _1640 = _1630 * 0.15915493667125701904296875;
    float _1642 = fma(_556, _1558, _556);
    float _1644 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1636);
    float _1646 = fma(_500, _1638, _500);
    float _1648 = fma(_1638, _1492, _1492);
    bool _1650 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1652 = isnan(_349);
    bool _1654 = _1650 || _1652;
    bool _1656 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1658 = _1654 || _1656;
    float _1660 = float(_1658);
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1664 = _349 + _1662;
    float _1666 = -_1584;
    float _1668 = _1666 + 1.0;
    float _1670 = fma(_1642, _1600, _1644);
    float _1672 = fma(_538, _1616, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1674 = _1584 * _1622;
    float _1676 = _443 + (-0.5);
    float _1678 = _1660 * _1668;
    float _1680 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1682 = _1012 >> 31;
    float _1684 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1648);
    int _1686 = _1084 >> 31;
    float _1688 = _1672 * _1678;
    int _1690 = _1682 & 3;
    float _1692 = _1670 * 0.15915493667125701904296875;
    int _1694 = _1686 & 3;
    float _1696 = fma(_1646, _1600, _1684);
    int _1698 = _1012 + _1690;
    float _1700 = _1640 * 6.283185482025146484375;
    float _1702 = sin(_1700);
    int _1704 = _1084 + _1694;
    float _1706 = -_1660;
    float _1708 = _1706 + 1.0;
    float _1710 = fma(_1418, _1664, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1712 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    int _1714 = _1704 >> 2;
    float _1716 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1688);
    float _1718 = _1680 * _1572;
    float _1720 = _1640 * 6.283185482025146484375;
    float _1722 = cos(_1720);
    int _1724 = _1714 << 4;
    int _1726 = _1724 + 512;
    float _1728 = fma(_1710, _1674, _1716);
    float _1730 = _1288 * _1712;
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1734 = _1732 != 0;
    float _1736 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1728);
    float _1738 = _1692 * 6.283185482025146484375;
    float _1740 = sin(_1738);
    float _1742 = _1696 * 0.15915493667125701904296875;
    float _1744 = _1692 * 6.283185482025146484375;
    float _1746 = cos(_1744);
    float _1748 = _1742 * 6.283185482025146484375;
    float _1750 = cos(_1748);
    int _1752 = _1698 >> 2;
    float _1754 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1364);
    float _1756 = _1702 * _1740;
    uint _1758 = uint(int(uint(_1726) >> uint(2)));
    uint _1760 = uint(int(uint(int(_1758)) >> uint(2)));
    int _1762 = int(_1758) & 3;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[int(_1760)][_1762];
    int _1766 = int(_1758) + 1;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    int _1770 = _1766 & 3;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[int(_1768)][_1770];
    int _1774 = _1752 << 4;
    int _1776 = _1774 + 368;
    float _1778 = _1742 * 6.283185482025146484375;
    float _1780 = sin(_1778);
    float _1782 = _1722 * _1746;
    float _1784 = _1702 * _1746;
    uint _1786 = uint(int(uint(_1776) >> uint(2)));
    uint _1788 = uint(int(uint(int(_1786)) >> uint(2)));
    int _1790 = int(_1786) & 3;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[int(_1788)][_1790];
    int _1794 = int(_1786) + 1;
    uint _1796 = uint(int(uint(_1794) >> uint(2)));
    int _1798 = _1794 & 3;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[int(_1796)][_1798];
    float _1802 = _1702 * _1750;
    float _1804 = _1722 * _1740;
    float _1806 = _1746 * _1750;
    float _1808 = _1722 * _1750;
    float _1810 = _1740 * _1750;
    float _1812 = _1802 * _1730;
    float _1814 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1816 = fma(_1780, _1782, _1756);
    float _1818 = fma(_1780, _1756, _1782);
    float _1820 = -_1804;
    float _1822 = fma(_1780, _1784, _1820);
    int _1824 = _1776 + 8;
    uint _1826 = uint(int(uint(_1824) >> uint(2)));
    uint _1828 = uint(int(uint(int(_1826)) >> uint(2)));
    int _1830 = int(_1826) & 3;
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[int(_1828)][_1830];
    int _1834 = int(_1826) + 1;
    uint _1836 = uint(int(uint(_1834) >> uint(2)));
    int _1838 = _1834 & 3;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[int(_1836)][_1838];
    float _1842 = -_1784;
    float _1844 = fma(_1780, _1804, _1842);
    float _1846 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1848 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1850 = -_1730;
    float _1852 = _1780 * _1850;
    float _1854 = _1808 * _1730;
    float _1856 = -_1780;
    float _1858 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1814);
    float _1860 = -_1780;
    float _1862 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1846);
    int _1864 = _1726 + 8;
    uint _1866 = uint(int(uint(_1864) >> uint(2)));
    uint _1868 = uint(int(uint(int(_1866)) >> uint(2)));
    int _1870 = int(_1866) & 3;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[int(_1868)][_1870];
    int _1874 = int(_1866) + 1;
    uint _1876 = uint(int(uint(_1874) >> uint(2)));
    int _1878 = _1874 & 3;
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[int(_1876)][_1878];
    float _1882 = -_1780;
    float _1884 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1848);
    float _1886 = fma(_1806, _1718, _1852);
    float _1888 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1858);
    float _1890 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1862);
    float _1892 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1884);
    int _1894 = abs(_1190);
    float _1896 = fma(_1816, _1718, _1854);
    int _1898 = abs(_1120);
    float _1900 = fma(_1822, _1718, _1812);
    int _1902 = abs(_1278);
    float _1904 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1906 = ~_1898;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    float _1912 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1914 = ~_1894;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    float _1920 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1922 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1904);
    float _1924 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1912);
    float _1926 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1928 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1920);
    int _1930 = ~_1902;
    int _1932 = _1930 + 1;
    int _1934 = _1932 + 1;
    float _1936 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1938 = _1910 * as_type<int>(_1800);
    int _1940 = _1918 * as_type<int>(_1772);
    int _1942 = _1934 * as_type<int>(_1792);
    int _1944 = _1942 + _1938;
    int _1946 = abs(_1074);
    int _1948 = abs(_1160);
    int _1950 = ~_1592;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    float _1956 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1958 = int(_1956);
    int _1960 = _1954 * as_type<int>(_1764);
    int _1962 = _1960 + _1940;
    int _1964 = abs(_1298);
    float _1966 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1926);
    int _1968 = ~_1946;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    int _1974 = ~_1948;
    int _1976 = _1974 + 1;
    int _1978 = _1976 + 1;
    int _1980 = _1972 * as_type<int>(_1832);
    int _1982 = _1980 + _1944;
    int _1984 = abs(_1132);
    int _1986 = _1978 * as_type<int>(_1872);
    int _1988 = _1986 + _1962;
    int _1990 = ~_1964;
    int _1992 = _1990 + 1;
    int _1994 = _1992 + 1;
    float _1996 = _1372 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1998 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2000 = int(_1998);
    int _2002 = abs(_1092);
    int _2004 = _1994 * as_type<int>(_1840);
    int _2006 = _2004 + _1982;
    int _2008 = ~_1590;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    float _2014 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2016 = fma(_1844, _2014, _1896);
    int _2018 = ~_1984;
    int _2020 = _2018 + 1;
    int _2022 = _2020 + 1;
    int _2024 = _2012 * as_type<int>(_1880);
    int _2026 = _2024 + _1988;
    float _2028 = fma(_1810, _2014, _1886);
    float _2030 = float(uint(_1958));
    float _2032 = _2016 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2034 = ~_2002;
    int _2036 = _2034 + 1;
    int _2038 = _2036 + 1;
    int _2040 = _2026 * _2022;
    float _2042 = fma(_1818, _2014, _1900);
    float _2044 = _2016 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2046 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2032);
    float _2048 = 1.0 / _2030;
    int _2050 = _2006 * _2038;
    float _2052 = float(uint(_2000));
    float _2054 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2044);
    float _2056 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2046);
    int _2058 = abs(_2000);
    int _2060 = _1294 * _2002;
    int _2062 = _2060 + _2050;
    int _2064 = abs(_1958);
    float _2066 = 1.0 / _2052;
    float _2068 = _2056 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2070 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2072 = float(uint(_2064));
    int _2074 = _1628 * _1984;
    int _2076 = _2074 + _2040;
    float _2078 = float(uint(_2058));
    float _2080 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2054);
    int _2082 = as_type<int>(_2048) + (-2);
    float _2084 = _1754 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2086 = float(uint(_2062));
    float _2088 = 1.0 / _2072;
    float _2090 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2070);
    float _2092 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1936);
    float _2094 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2096 = as_type<float>(_2082) * _2086;
    int _2098 = as_type<int>(_2066) + (-2);
    float _2100 = _2084 + _2068;
    float _2102 = float(uint(_2076));
    float _2104 = 1.0 / _2078;
    float _2106 = _1996 + _2094;
    float _2108 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1966);
    float _2110 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2090);
    float _2112 = as_type<float>(_2098) * _2102;
    int _2114 = abs(_2076);
    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2118 = _2106 + _2116;
    float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2122 = _2100 + _2120;
    float _2124 = trunc(_2096);
    float _2126 = precise::max(_2124, 0.0);
    uint _2128 = uint(_2126);
    int _2130 = abs(_2062);
    float _2132 = _2016 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2134 = float(uint(_2114));
    float _2136 = _2118 * _2118;
    float _2138 = _2122 * _2122;
    int _2140 = as_type<int>(_2088) + (-2);
    float _2142 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2092);
    float _2144 = trunc(_2112);
    float _2146 = precise::max(_2144, 0.0);
    uint _2148 = uint(_2146);
    int _2150 = as_type<int>(_2104) + (-2);
    float _2152 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2132);
    float _2154 = float(uint(_2130));
    float _2156 = _2136 + _2138;
    int _2158 = ~_1958;
    int _2160 = _2158 + 1;
    float _2162 = as_type<float>(_2150) * _2134;
    int _2164 = ~_2000;
    int _2166 = _2164 + 1;
    float _2168 = as_type<float>(_2140) * _2154;
    float _2170 = sqrt(_2156);
    int _2172 = _2160 * int(_2128);
    int _2174 = _2172 + _2062;
    float _2176 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2152);
    int _2178 = ~_2064;
    int _2180 = _2178 + 1;
    float _2182 = float(uint(_2174));
    float _2184 = _2176 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2186 = trunc(_2168);
    float _2188 = precise::max(_2186, 0.0);
    uint _2190 = uint(_2188);
    float _2192 = as_type<float>(_2082) * _2182;
    float _2194 = trunc(_2162);
    float _2196 = precise::max(_2194, 0.0);
    uint _2198 = uint(_2196);
    bool _2200 = _2170 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2202 = -_209;
    int _2204 = _1282 ? as_type<int>(_2202) : as_type<int>(_209);
    int _2206 = _2166 * int(_2148);
    int _2208 = _2206 + _2076;
    bool _2210 = _443 > 0.5;
    int _2212 = _2180 * int(_2190);
    int _2214 = _2212 + _2130;
    float _2216 = float(uint(_2208));
    int _2218 = ~_2058;
    int _2220 = _2218 + 1;
    float _2222 = float(uint(_2214));
    float _2224 = as_type<float>(_2098) * _2216;
    float _2226 = _1410 + _2184;
    int _2228 = _2220 * int(_2198);
    int _2230 = _2228 + _2114;
    float _2232 = _2184;
    float _2234 = _2136;
    float _2236 = _2106;
    float _2238 = _2138;
    float _2240 = _2100;
    if (!_2200)
    {
        _2232 = _2136;
    }
    float _2242 = _2232;
    float _2244 = trunc(_2192);
    float _2246 = precise::max(_2244, 0.0);
    uint _2248 = uint(_2246);
    float _2250 = _2242;
    if (!_2200)
    {
        _2234 = _2106;
    }
    float _2252 = _2234;
    float _2254 = _2252;
    if (!_2200)
    {
        _2236 = _2226;
    }
    float _2256 = _2236;
    float _2258 = float(uint(_2230));
    bool _2260 = !_2200;
    float _2262 = _2256;
    if (!_2260)
    {
        float _2264 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2268 = _2170 + _2266;
        float _2270 = _2226 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2272 = rsqrt(_2156);
        float _2274 = _2268 * _2264;
        float _2276 = _2274 * 0.15915493667125701904296875;
        float _2278 = _2276 * 6.283185482025146484375;
        float _2280 = sin(_2278);
        float _2282 = _2276 * 6.283185482025146484375;
        float _2284 = cos(_2282);
        float _2286 = fma(_2280, _2270, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2288 = _2272 * _2286;
        float _2290 = fma(_2118, _2288, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2292 = _2284 + (-1.0);
        float _2294 = fma(_2122, _2288, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2298 = _2290 + _2296;
        float _2300 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2304 = _2294 + _2302;
        float _2306 = _2298 * _2298;
        float _2308 = fma(_2226, _2284, _2300);
        float _2310 = _2304 * _2304;
        _2262 = _2308;
        _2250 = _2306;
        _2238 = _2310;
        _2240 = _2294;
        _2254 = _2290;
    }
    float _2312 = _2262;
    float _2314 = _2250;
    float _2316 = _2238;
    float _2318 = _2240;
    float _2320 = _2254;
    float _2322 = as_type<float>(_2140) * _2222;
    float _2324 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1924);
    float _2326 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1922);
    float _2328 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1928);
    float _2330 = -_209;
    int _2332 = _1632 ? as_type<int>(_2330) : as_type<int>(_209);
    float _2334 = trunc(_2322);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    int _2340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2342 = _2340 != 0;
    float _2344 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2346 = -_199;
    int _2348 = _1606 ? as_type<int>(_2346) : as_type<int>(_199);
    float _2350 = as_type<float>(_2150) * _2258;
    float _2352 = -_199;
    int _2354 = _2210 ? as_type<int>(_2352) : as_type<int>(_199);
    float _2356 = _2344 * _1892;
    bool _2358 = !_1596;
    float _2360 = _2358 ? _209 : as_type<float>(_2204);
    float _2362 = trunc(_2224);
    float _2364 = precise::max(_2362, 0.0);
    uint _2366 = uint(_2364);
    bool _2368 = !_2342;
    float _2370 = _2368 ? _209 : as_type<float>(_2332);
    float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2374 = _2312 + _2372;
    bool _2376 = !_1338;
    float _2378 = _2376 ? _199 : as_type<float>(_2348);
    float _2380 = _2344 * _1890;
    bool _2382 = !_1734;
    float _2384 = _2382 ? _199 : as_type<float>(_2354);
    float _2386 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2388 = fma(_2374, _2374, _2314);
    float _2390 = trunc(_2350);
    float _2392 = precise::max(_2390, 0.0);
    uint _2394 = uint(_2392);
    float _2396 = _2344 * _1888;
    float _2398 = fma(_2386, _2326, _2380);
    int _2400 = int(_2190) + int(_2338);
    float _2402 = _2388 + _2316;
    float _2404 = fma(_2386, _2324, _2396);
    float _2406 = fma(_2386, _2328, _2356);
    int _2408 = int(_2128) + int(_2248);
    float _2410 = -_1534;
    float _2412 = _2410 + 1.0;
    int _2414 = ~_1958;
    int _2416 = _2414 + 1;
    float _2418 = sqrt(_2402);
    int _2420 = int(_2148) + int(_2366);
    float _2422 = -_1538;
    float _2424 = _2422 + 1.0;
    float _2426 = -_1536;
    float _2428 = _2426 + 1.0;
    int _2430 = ~_2000;
    int _2432 = _2430 + 1;
    float _2434 = -_1480;
    float _2436 = _2434 + 1.0;
    int _2438 = ~_2064;
    int _2440 = _2438 + 1;
    int _2442 = _2416 * _2408;
    int _2444 = _2442 + _2062;
    int _2446 = ~_2058;
    int _2448 = _2446 + 1;
    int _2450 = _2432 * _2420;
    int _2452 = _2450 + _2076;
    int _2454 = int(_2198) + int(_2394);
    int _2456 = _2440 * _2400;
    int _2458 = _2456 + _2130;
    bool _2460 = uint(_2444) >= uint(_1958);
    out.m_78.x = _2326;
    out.m_78.y = _2324;
    out.m_78.z = _2328;
    bool _2462 = uint(_2452) >= uint(_2000);
    float _2464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2466 = !_2460;
    int _2468 = _2466 ? 0 : (-1);
    int _2470 = _2448 * _2454;
    int _2472 = _2470 + _2114;
    bool _2474 = uint(_2458) >= uint(_2064);
    bool _2476 = !_2462;
    int _2478 = _2476 ? 0 : (-1);
    int _2480 = ~_2408;
    int _2482 = _2480 + _2468;
    int _2484 = _2482 + 1;
    float _2486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2488 = uint(_2472) >= uint(_2058);
    int _2490 = ~_2420;
    int _2492 = _2490 + _2478;
    int _2494 = _2492 + 1;
    int _2496 = _1958 * _2484;
    int _2498 = _2496 + _2062;
    int _2500 = _2062 ^ _1958;
    int _2502 = _2076 ^ _2000;
    int _2504 = _2000 * _2494;
    int _2506 = _2504 + _2076;
    bool _2508 = _1958 == 0;
    float _2510 = _2464 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2512 = _1958 == 0;
    float _2514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2516 = !_2474;
    int _2518 = _2516 ? 0 : (-1);
    uint _2520 = uint(int(uint(_2500) >> uint(31)));
    float _2522 = _2486 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2524 = !_2488;
    int _2526 = _2524 ? 0 : (-1);
    uint _2528 = uint(int(uint(_2502) >> uint(31)));
    bool _2530 = !_2508;
    int _2532 = _2530 ? _2498 : (-1);
    int _2534 = ~_2518;
    int _2536 = _2400 + _2534;
    int _2538 = _2536 + 1;
    float _2540 = fma(_2344, _2344, 1.0);
    int _2542 = ~int(_2520);
    int _2544 = _2542 + 1;
    int _2546 = ~_2526;
    int _2548 = _2454 + _2546;
    int _2550 = _2548 + 1;
    int _2552 = ~int(_2528);
    int _2554 = _2552 + 1;
    bool _2556 = _2000 == 0;
    float _2558 = float(_2532);
    bool _2560 = _2000 == 0;
    int _2562 = _2538 ^ _2544;
    float _2564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2566 = _2550 ^ _2554;
    float _2568 = fma(_2510, _2558, _1528);
    bool _2570 = !_2556;
    int _2572 = _2570 ? _2506 : (-1);
    int _2574 = ~_2544;
    int _2576 = _2574 + _2562;
    int _2578 = _2576 + 1;
    int _2580 = ~_2554;
    int _2582 = _2580 + _2566;
    int _2584 = _2582 + 1;
    float _2586 = rsqrt(_2540);
    float _2588 = float(_2572);
    float _2590 = _2514 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2592 = !_2512;
    int _2594 = _2592 ? _2578 : (-1);
    float _2596 = _2378 + 0.5;
    bool _2598 = _2418 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2600 = isnan(_2418);
    bool _2602 = _2598 || _2600;
    bool _2604 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2606 = _2602 || _2604;
    float _2608 = fma(_2590, _2588, _1542);
    float _2610 = float(_2594);
    float _2612 = _2564 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2614 = !_2560;
    int _2616 = _2614 ? _2584 : (-1);
    float _2618 = fma(_2510, _2596, _2568);
    float _2620 = _2384 + 0.5;
    float _2622 = -_496;
    float _2624 = fma(_2522, _2610, _2622);
    float _2626 = float(_2616);
    float _2628 = _2370 + (-0.5);
    float _2630 = fma(_2590, _2620, _2608);
    float _2632 = _2344 * _2586;
    float _2634 = -_2412;
    float _2636 = fma(_2378, _2634, _2618);
    float _2638 = -_1522;
    float _2640 = fma(_2612, _2626, _2638);
    float _2642 = -_2522;
    float _2644 = fma(_2642, _2628, _2624);
    float _2646 = _2360 + (-0.5);
    float _2648 = -_2110;
    float _2650 = _2632 * _2648;
    float _2652 = -_2108;
    float _2654 = _2632 * _2652;
    float _2656 = -_2612;
    float _2658 = fma(_2656, _2646, _2640);
    float _2660 = fma(_2586, _1890, _2650);
    float _2662 = fma(_2586, _1888, _2654);
    float _2664 = _2108 + _2404;
    float _2666 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2668 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2670 = -_2142;
    float _2672 = _2632 * _2670;
    float _2674 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2676 = _2666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2678 = _2668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2680 = _1736 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2682 = -_2424;
    float _2684 = fma(_2384, _2682, _2630);
    float _2686 = fma(_2586, _1892, _2672);
    float _2688 = _2110 + _2398;
    float _2690 = _2674 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2692 = fma(_2370, _2428, _2644);
    float _2694 = fma(_2360, _2436, _2658);
    float _2696 = _2142 + _2406;
    out.m_80.x = _2660;
    out.m_80.y = _2662;
    out.m_80.z = _2686;
    float _2698 = _2370;
    if (!_2606)
    {
        _2698 = 1.0;
    }
    float _2700 = _2698;
    out.m_82.x = _2690;
    out.m_82.y = _2676;
    out.m_82.z = _2678;
    out.m_82.w = _2680;
    out.m_84.x = _2636;
    out.m_84.y = _2692;
    out.m_84.z = _2684;
    out.m_84.w = _2694;
    out.m_86.x = _2688;
    out.m_86.y = _2664;
    out.m_86.z = _2696;
    bool _2702 = !_2606;
    float _2704 = _2700;
    if (!_2702)
    {
        bool _2706 = _2418 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2708 = isnan(_2418);
        bool _2710 = _2706 || _2708;
        bool _2712 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2714 = _2710 || _2712;
        if (!_2714)
        {
            float _2716 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2718 = _2418 + _2716;
            float _2720 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2722 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2720;
            float _2724 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2728 = 1.0 / _2722;
            float _2730 = _2718 * _2728;
            float _2732 = fma(_2730, _2726, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2704 = _2732;
            _2734 = true;
        }
        else
        {
            bool _2736 = _2418 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2738 = isnan(_2418);
            bool _2740 = _2736 || _2738;
            bool _2742 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2744 = _2740 || _2742;
            if (!_2744)
            {
                float _2746 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2748 = _2418 + _2746;
                float _2750 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2752 = _2750 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2754 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2756 = _2754 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2758 = 1.0 / _2752;
                float _2760 = _2748 * _2758;
                float _2762 = fma(_2760, _2756, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2704 = _2762;
                _2734 = true;
            }
            else
            {
                _2704 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2734 = false;
    float _2764 = _2704;
    float _2766 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2768 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2770 = floor(_2766);
    float _2772 = floor(_2768);
    float _2774 = -_2770;
    float _2776 = _2766 + _2774;
    float _2778 = -_2772;
    float _2780 = _2768 + _2778;
    float2 _8400 = float2(_2776, _2780);
    float _2782 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8400, float2(0.0), isnan(_8400)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8400, float2(0.0), isnan(_8400)), level(0.0)).x;
    float _2784 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2786 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2788 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2790 = _2318 + _2788;
    float _2792 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2784);
    float _2794 = _1410 + _2786;
    float _2796 = fma(_2790, _2764, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2798 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2792);
    float _2800 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2802 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2804 = _2798 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2806 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2800);
    float _2808 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2802);
    float _2810 = 1.0 / _2804;
    float _2812 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2806);
    float _2814 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2808);
    float _2816 = _2812 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2818 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2820 = _2816 + _2804;
    float _2822 = trunc(_2818);
    int _2824 = int(_2822);
    float _2826 = _2820 * _2810;
    float _2828 = _2826 * 0.5;
    float _2830 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2832 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2830);
    float _2834 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2836 = _2320 + _2834;
    float _2838 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2840 = _2312 + _2838;
    float _2842 = fma(_2836, _2764, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2844 = 1.0 / _2832;
    float _2846 = fma(_2840, _2764, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    int _2848 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2850 = _2824 + _2848;
    int _2852 = _2850 + 1;
    float _2854 = -_1996;
    float _2856 = _2854 + _2842;
    float _2858 = -_1410;
    float _2860 = _2858 + _2846;
    float _2862 = _2860 * _2860;
    float _2864 = fma(_2856, _2856, _2862);
    float _2866 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2868 = _2844 * _2866;
    float _2870 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _2872 = _2868 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2874 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2870);
    bool _2876 = _2868 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2878 = !_2872;
    int _2880 = _2878 ? 0 : 1;
    float _2882 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2874);
    float _2884 = _2882 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _2886 = 2;
    float _2888 = _2846;
    float _2890 = _2796;
    float _2892 = _2860;
    float _2894 = _2842;
    if (!_2872)
    {
        _2886 = 1;
    }
    int _2896 = _2886;
    float _2898 = trunc(_2884);
    int _2900 = int(_2898);
    int _2902 = _2896;
    if (!_2876)
    {
        _2902 = _2880;
    }
    int _2904 = _2902;
    bool _2906 = _2852 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2908 = _2904 << 6;
    int _2910 = _2908 + 96;
    uint _2912 = uint(int(uint(_2910) >> uint(2)));
    uint _2914 = uint(int(uint(int(_2912)) >> uint(2)));
    int _2916 = int(_2912) & 3;
    float _2918 = (*spvDescriptorSet0.vp_c15)._m0[int(_2914)][_2916];
    int _2920 = int(_2912) + 1;
    uint _2922 = uint(int(uint(_2920) >> uint(2)));
    int _2924 = _2920 & 3;
    float _2926 = (*spvDescriptorSet0.vp_c15)._m0[int(_2922)][_2924];
    int _2928 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2930 = _2900 + _2928;
    int _2932 = _2930 + 1;
    int _2934 = _2908 + 104;
    uint _2936 = uint(int(uint(_2934) >> uint(2)));
    uint _2938 = uint(int(uint(int(_2936)) >> uint(2)));
    int _2940 = int(_2936) & 3;
    float _2942 = (*spvDescriptorSet0.vp_c15)._m0[int(_2938)][_2940];
    int _2944 = int(_2936) + 1;
    uint _2946 = uint(int(uint(_2944) >> uint(2)));
    int _2948 = _2944 & 3;
    float _2950 = (*spvDescriptorSet0.vp_c15)._m0[int(_2946)][_2948];
    float _2952 = -_2084;
    float _2954 = _2952 + _2796;
    int _2956 = _2852 | _2932;
    float _2958 = fma(_2954, _2954, _2864);
    bool _2960 = _2956 < 0;
    bool _2962 = _2960 || _2906;
    int _2964 = _2908 + 48;
    uint _2966 = uint(int(uint(_2964) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c15)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c15)._m0[int(_2976)][_2978];
    float _2982 = sqrt(_2958);
    bool _2984 = _2932 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2986 = _2984 || _2962;
    int _2988 = _2908 + 64;
    uint _2990 = uint(int(uint(_2988) >> uint(2)));
    uint _2992 = uint(int(uint(int(_2990)) >> uint(2)));
    int _2994 = int(_2990) & 3;
    float _2996 = (*spvDescriptorSet0.vp_c15)._m0[int(_2992)][_2994];
    int _2998 = int(_2990) + 1;
    uint _3000 = uint(int(uint(_2998) >> uint(2)));
    int _3002 = _2998 & 3;
    float _3004 = (*spvDescriptorSet0.vp_c15)._m0[int(_3000)][_3002];
    int _3006 = _2908 + 56;
    uint _3008 = uint(int(uint(_3006) >> uint(2)));
    uint _3010 = uint(int(uint(int(_3008)) >> uint(2)));
    int _3012 = int(_3008) & 3;
    float _3014 = (*spvDescriptorSet0.vp_c15)._m0[int(_3010)][_3012];
    int _3016 = int(_3008) + 1;
    uint _3018 = uint(int(uint(_3016) >> uint(2)));
    int _3020 = _3016 & 3;
    float _3022 = (*spvDescriptorSet0.vp_c15)._m0[int(_3018)][_3020];
    bool _3024 = _2982 > 0.0;
    int _3026 = _2908 + 72;
    uint _3028 = uint(int(uint(_3026) >> uint(2)));
    uint _3030 = uint(int(uint(int(_3028)) >> uint(2)));
    int _3032 = int(_3028) & 3;
    float _3034 = (*spvDescriptorSet0.vp_c15)._m0[int(_3030)][_3032];
    int _3036 = int(_3028) + 1;
    uint _3038 = uint(int(uint(_3036) >> uint(2)));
    int _3040 = _3036 & 3;
    float _3042 = (*spvDescriptorSet0.vp_c15)._m0[int(_3038)][_3040];
    int _3044 = _2908 + 80;
    uint _3046 = uint(int(uint(_3044) >> uint(2)));
    uint _3048 = uint(int(uint(int(_3046)) >> uint(2)));
    int _3050 = int(_3046) & 3;
    float _3052 = (*spvDescriptorSet0.vp_c15)._m0[int(_3048)][_3050];
    int _3054 = int(_3046) + 1;
    uint _3056 = uint(int(uint(_3054) >> uint(2)));
    int _3058 = _3054 & 3;
    float _3060 = (*spvDescriptorSet0.vp_c15)._m0[int(_3056)][_3058];
    float _3062 = _2794 * _2926;
    float _3064 = _2926;
    float _3066 = as_type<float>(_2904);
    if (!_2986)
    {
        float _3068 = floor(_2818);
        _3064 = _3068;
    }
    float _3070 = _3064;
    float _3072 = fma(_1996, _2918, _3062);
    float _3074 = fma(_2084, _2942, _3072);
    float _3076 = _3074 + _2950;
    float _3078 = 1.0 / _3076;
    bool _3080 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3082 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3084 = _3080 || _3082;
    bool _3086 = isnan(0.5);
    bool _3088 = _3084 || _3086;
    float _3090 = _2794 * _2980;
    int _3092 = as_type<int>(_2980);
    float _3094 = _3090;
    int _3096 = as_type<int>(_2972);
    float _3098 = _3076;
    if (!_2986)
    {
        int _3100 = _2932 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3102 = _3100 + _2852;
        _3092 = _3102;
    }
    int _3104 = _3092;
    float _3106 = fma(_1996, _2972, _3090);
    float _3108 = _2794 * _3004;
    if (!_3024)
    {
        _3094 = _2842;
    }
    float _3110 = _3094;
    float _3112 = fma(_1996, _2996, _3108);
    bool _3114 = !_3024;
    float _3116 = _3110;
    float _3118 = _3070;
    if (!_3114)
    {
        float _3120 = _213 * _213;
        float _3122 = rsqrt(_2958);
        float _3124 = fma(_211, _211, _3120);
        float _3126 = fma(_215, _215, _3124);
        float _3128 = sqrt(_3126);
        float _3130 = _2856 * _3122;
        float _3132 = _2860 * _3122;
        float _3134 = _2954 * _3122;
        bool _3136 = _3128 > 0.0;
        float _3138 = _3128;
        _3096 = as_type<int>(_3126);
        _3098 = _3122;
        _2892 = _3132;
        if (!_3136)
        {
            _3138 = _2842;
        }
        float _3140 = _3138;
        bool _3142 = !_3136;
        _3116 = _3140;
        if (!_3142)
        {
            float _3144 = rsqrt(_3126);
            float _3146 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3148 = _213 * _3144;
            float _3150 = _211 * _3144;
            float _3152 = _3132 * _3148;
            float _3154 = _215 * _3144;
            float _3156 = fma(_3130, _3150, _3152);
            float _3158 = _3146 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3160 = fma(_3134, _3154, _3156);
            float _3162 = _3160 * _3158;
            float _3164 = fma(_211, _3162, _2842);
            float _3166 = fma(_213, _3162, _2846);
            float _3168 = fma(_215, _3162, _2796);
            _2888 = _3166;
            _3096 = as_type<int>(_3144);
            _2890 = _3168;
            _3116 = _3164;
            _3098 = _3154;
        }
    }
    float _3170 = _2888;
    int _3172 = _3096;
    float _3174 = _2890;
    float _3176 = _3116;
    float _3178 = _3098;
    float _3180 = _2892;
    int _3182 = _3172;
    float _3184 = _3178;
    float _3186 = _3176;
    float _3188 = _3180;
    if (!_2986)
    {
        int _3190 = _3104 << 2;
        _3182 = _3190;
    }
    int _3192 = _3182;
    float _3194 = fma(_2084, _3014, _3106);
    float _3196 = fma(_2084, _3034, _3112);
    int _3198 = _3192;
    if (_3088)
    {
        _3184 = _3170;
    }
    float _3200 = _3184;
    float _3202 = _3200;
    if (!_2986)
    {
        uint _3204 = uint(int(uint(_3104) >> uint(2)));
        _219 = int(_3204);
    }
    int _3206 = _219;
    if (!_2986)
    {
        int _3208 = 12 & _3192;
        _3198 = _3208;
    }
    int _3210 = _3198;
    if (_3088)
    {
        _2894 = _3174;
    }
    float _3212 = _2894;
    float _3214 = _3212;
    if (!_3088)
    {
        float _3216 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3218 = _1410 + _3216;
        float _3220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3222 = _1996 + _3220;
        float _3224 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3226 = -_1996;
        float _3228 = _3226 + _3176;
        float _3230 = _3218 * _3218;
        float _3232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3234 = _2084 + _3232;
        float _3236 = -_2084;
        float _3238 = _3236 + _3174;
        float _3240 = fma(_3222, _3222, _3230);
        float _3242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3244 = fma(_3234, _3234, _3240);
        float _3246 = sqrt(_3244);
        float _3248 = _3224 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3250 = precise::min(_3246, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3252 = _3250 * _3242;
        float _3254 = -_1410;
        float _3256 = _3254 + _3170;
        float _3258 = _3248 * _3252;
        float _3260 = fma(_3256, _3258, _1410);
        float _3262 = fma(_3228, _3258, _1996);
        float _3264 = fma(_3238, _3258, _2084);
        _3202 = _3260;
        _3186 = _3262;
        _3214 = _3264;
    }
    float _3266 = _3202;
    float _3268 = _3186;
    float _3270 = _3214;
    if (!_2986)
    {
        int _3272 = _3206 << 4;
        int _3274 = _3272 + _3210;
        _3188 = as_type<float>(_3274);
    }
    float _3276 = _3188;
    int _3278 = _2908 + 88;
    uint _3280 = uint(int(uint(_3278) >> uint(2)));
    uint _3282 = uint(int(uint(int(_3280)) >> uint(2)));
    int _3284 = int(_3280) & 3;
    float _3286 = (*spvDescriptorSet0.vp_c15)._m0[int(_3282)][_3284];
    int _3288 = int(_3280) + 1;
    uint _3290 = uint(int(uint(_3288) >> uint(2)));
    int _3292 = _3288 & 3;
    float _3294 = (*spvDescriptorSet0.vp_c15)._m0[int(_3290)][_3292];
    float _3296 = _3194 + _3022;
    float _3298 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3300 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3302 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3304 = _3296 * _3078;
    float _3306 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3298);
    float _3308 = _3196 + _3042;
    float _3310 = _3276;
    float _3312 = _3304;
    if (!_2986)
    {
        int _3314 = as_type<int>(_3276) + 400;
        uint _3316 = uint(int(uint(_3314) >> uint(2)));
        uint _3318 = uint(int(uint(int(_3316)) >> uint(2)));
        int _3320 = int(_3316) & 3;
        float _3322 = (*spvDescriptorSet0.vp_c15)._m0[int(_3318)][_3320];
        _3310 = _3322;
    }
    float _3324 = _3310;
    float _3326 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3300);
    float _3328 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3306);
    bool _3330 = _3304 >= 0.0;
    float _3332 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3302);
    float _3334 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3336 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3326);
    float _3338 = _3328 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3340 = _3308 * _3078;
    bool _3342 = _3304 <= 1.0;
    bool _3344 = _3342 && _3330;
    float _3346 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3332);
    float _3348 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3334);
    float _3350 = _3336 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3352 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3354 = _3340 >= 0.0;
    bool _3356 = _3354 && _3344;
    float _3358 = _3346 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3360 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3348);
    float _3362 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3352);
    bool _3364 = _3340 <= 1.0;
    bool _3366 = _3364 && _3356;
    float _3368 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3370 = _3358 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3372 = _3360 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3374 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3362);
    float _3376 = _3196;
    float _3378 = _3372;
    if (!_2986)
    {
        float _3380 = floor(_2884);
        _3376 = _3380;
    }
    float _3382 = _3376;
    float _3384 = -_3370;
    float _3386 = fma(_3384, _3368, 1.0);
    float _3388 = _2794 * _3060;
    float _3390 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3374);
    float _3392 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3394 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3396 = fma(_1996, _3052, _3388);
    float _3398 = log2(_3386);
    float _3400 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3392);
    float _3402 = _3392;
    if (_3366)
    {
        float _3404 = float(_2904);
        _3402 = _3404;
    }
    float _3406 = _3402;
    float _3408 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3394);
    float _3410 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3400);
    float _3412 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3408);
    float _3414 = 1.0 / _3390;
    float _3416 = fma(_2084, _3286, _3396);
    float _3418 = _3294;
    if (!_2986)
    {
        float _3420 = -_3382;
        float _3422 = _2884 + _3420;
        _3066 = _3422;
    }
    float _3424 = _3066;
    float _3426 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3410);
    float _3428 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3412);
    float _3430 = _3416 + _3294;
    if (!_2986)
    {
        float _3432 = -_3070;
        float _3434 = _2818 + _3432;
        _3418 = _3434;
    }
    float _3436 = _3418;
    float _3438 = _3406;
    if (_3366)
    {
        float _3440 = rint(_3406);
        float _3442 = precise::max(_3440, 0.0);
        uint _3444 = uint(_3442);
        uint _3446 = clamp(_3444, 0u, 65535u);
        _3438 = as_type<float>(_3446);
    }
    float _3448 = _3438;
    float _3450 = _3398 * 0.693147182464599609375;
    float _3452 = _3430 * _3078;
    float _3454 = _3450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3456 = _3416;
    float _3458 = _3454;
    if (!_2986)
    {
        float _3460 = rint(_3324);
        float _3462 = precise::max(_3460, 0.0);
        uint _3464 = uint(_3462);
        uint _3466 = clamp(_3464, 0u, 65535u);
        _3456 = as_type<float>(_3466);
    }
    float _3468 = _3456;
    float _3470 = _3426 * _3414;
    float _3472 = _3428 * _3414;
    float _3474 = fma(_3470, 0.5, 0.5);
    float _3476 = fma(_3472, -0.5, 0.5);
    float _3478 = _3340;
    if (_3366)
    {
        float3 _9566 = float3(_3304, _3340, float(as_type<int>(_3448)));
        float3 _9570 = select(_9566, float3(0.0), isnan(_9566));
        float _3480 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9570.xy, uint(rint(_9570.z)), _3452, level(0.0));
        _3478 = _3480;
    }
    float _3482 = _3478;
    float3 _9580 = float3(_3474, _3476, _3454);
    float _3484 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9580, float3(0.0), isnan(_9580)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9580, float3(0.0), isnan(_9580)), level(0.0)).x;
    float3 _9589 = float3(_3474, _3476, _3454);
    float4 _3487 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9589, float3(0.0), isnan(_9589)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9589, float3(0.0), isnan(_9589)), level(0.0)).xyzw;
    float _3489 = _3487.x;
    float _3491 = _3487.y;
    float _3493 = _3487.z;
    float _3495 = _3487.w;
    float _3497 = _3424;
    if (!_2986)
    {
        float3 _9612 = float3(_3436, _3424, float(as_type<int>(_3468)));
        float3 _9614 = select(_9612, float3(0.0), isnan(_9612));
        float _3499 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9614.xy, uint(rint(_9614.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9614.xy, uint(rint(_9614.z)), level(0.0)).x;
        _3497 = _3499;
    }
    float _3501 = _3497;
    if (_2986)
    {
        _3118 = 1.0;
    }
    float _3503 = _3118;
    float _3505 = _3503;
    float _3507 = _3491;
    float _3509 = _3489;
    if (!_2986)
    {
        int _3511 = _3104 << 4;
        int _3513 = _3511 + 2048;
        uint _3515 = uint(int(uint(_3513) >> uint(2)));
        uint _3517 = uint(int(uint(int(_3515)) >> uint(2)));
        int _3519 = int(_3515) & 3;
        float _3521 = (*spvDescriptorSet0.vp_c15)._m0[int(_3517)][_3519];
        int _3523 = int(_3515) + 1;
        uint _3525 = uint(int(uint(_3523) >> uint(2)));
        int _3527 = _3523 & 3;
        float _3529 = (*spvDescriptorSet0.vp_c15)._m0[int(_3525)][_3527];
        int _3531 = _3513 + 8;
        uint _3533 = uint(int(uint(_3531) >> uint(2)));
        uint _3535 = uint(int(uint(int(_3533)) >> uint(2)));
        int _3537 = int(_3533) & 3;
        float _3539 = (*spvDescriptorSet0.vp_c15)._m0[int(_3535)][_3537];
        int _3541 = int(_3533) + 1;
        uint _3543 = uint(int(uint(_3541) >> uint(2)));
        int _3545 = _3541 & 3;
        float _3547 = (*spvDescriptorSet0.vp_c15)._m0[int(_3543)][_3545];
        float _3549 = _2794 * _3529;
        float _3551 = fma(_1996, _3521, _3549);
        float _3553 = fma(_2084, _3539, _3551);
        float _3555 = _3553 + _3547;
        float _3557 = precise::clamp(_3555, 0.0, 1.0);
        float _3559 = -_3557;
        float _3561 = _3559 + _3501;
        float _3563 = fma(_3561, 500.0, 1.5);
        float _3565 = exp2(_3563);
        float _3567 = 0.0 + _3565;
        float _3569 = precise::clamp(_3567, 0.0, 1.0);
        _3312 = _3529;
        _3505 = _3569;
    }
    float _3571 = _3312;
    float _3573 = _3505;
    float _3575 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3577 = _3266 + _3575;
    float _3579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3581 = _3268 + _3579;
    float _3583 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3585 = _3270 + _3583;
    float _3587 = _3577 * _3577;
    float _3589 = fma(_3581, _3581, _3587);
    float _3591 = fma(_3585, _3585, _3589);
    float _3593 = rsqrt(_3591);
    float _3595 = _3593 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3597 = _3581 * _3595;
    float _3599 = _3585 * _3595;
    float _3601 = _3597 * _3597;
    float _3603 = _3599 * _3599;
    float _3605 = _3601 + _3603;
    float _3607 = sqrt(_3605);
    bool _3609 = _3607 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3611 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3613 = _3607 + _3611;
    float _3615 = _3593;
    float _3617 = _3613;
    float _3619 = _3571;
    float _3621 = _3577;
    if (_3609)
    {
        float _3623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3615 = _3623;
    }
    float _3625 = _3615;
    float _3627 = _3625;
    if (_3609)
    {
        float _3629 = _3613 * _3625;
        _3617 = _3629;
    }
    float _3631 = _3617;
    if (_3609)
    {
        float _3633 = rsqrt(_3605);
        _3627 = _3633;
    }
    float _3635 = _3627;
    float _3637 = _3635;
    if (_3609)
    {
        float _3639 = _3631 * 0.15915493667125701904296875;
        _3619 = _3639;
    }
    float _3641 = _3619;
    float _3643 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3645 = _3585;
    float _3647 = _3641;
    if (_3609)
    {
        float _3649 = _3641 * 6.283185482025146484375;
        float _3651 = sin(_3649);
        _3645 = _3651;
    }
    float _3653 = _3645;
    float _3655 = precise::max(0.0, _3643);
    float _3657 = _2818;
    float _3659 = _3655;
    if (_3609)
    {
        float _3661 = _3641 * 6.283185482025146484375;
        float _3663 = cos(_3661);
        _3657 = _3663;
    }
    float _3665 = _3657;
    float _3667 = -_3595;
    float _3669 = -_3655;
    float _3671 = fma(_3577, _3667, _3669);
    if (_3609)
    {
        float _3673 = _3671 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3621 = _3673;
    }
    float _3675 = _3621;
    float _3677 = _3653;
    float _3679 = _3675;
    if (_3609)
    {
        float _3681 = fma(_3653, _3675, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3677 = _3681;
    }
    float _3683 = _3677;
    float _3685 = _3683;
    if (!_3609)
    {
        _3679 = _3671;
    }
    float _3687 = _3679;
    float _3689 = _3687;
    if (!_3609)
    {
        _3647 = _3601;
    }
    float _3691 = _3647;
    float _3693 = _3691;
    if (_3609)
    {
        float _3695 = _3635 * _3683;
        _3458 = _3695;
    }
    float _3697 = _3458;
    if (!_3609)
    {
        _3637 = _3597;
    }
    float _3699 = _3637;
    float _3701 = _3699;
    float _3703 = _3665;
    if (_3609)
    {
        float _3705 = _3665 + (-1.0);
        _3659 = _3705;
    }
    float _3707 = _3659;
    float _3709 = _3707;
    if (_3609)
    {
        float _3711 = _3597 * _3697;
        _3701 = _3711;
    }
    float _3713 = _3701;
    if (!_3609)
    {
        _3685 = _3599;
    }
    float _3715 = _3685;
    float _3717 = _3715;
    if (_3609)
    {
        float _3719 = _3599 * _3697;
        _3717 = _3719;
    }
    float _3721 = _3717;
    if (_3609)
    {
        float _3723 = _3707 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3709 = _3723;
    }
    float _3725 = _3709;
    if (_3609)
    {
        float _3727 = _3713 * _3713;
        _3693 = _3727;
    }
    float _3729 = _3693;
    if (_3609)
    {
        float _3731 = fma(_3671, _3665, _3725);
        _3689 = _3731;
    }
    float _3733 = _3689;
    if (!_3609)
    {
        _3703 = _3603;
    }
    float _3735 = _3703;
    float _3737 = _3735;
    if (_3609)
    {
        float _3739 = _3721 * _3721;
        _3737 = _3739;
    }
    float _3741 = _3737;
    float _3743 = sqrt(_3591);
    float _3745 = fma(_3733, _3733, _3729);
    float _3747 = _3745 + _3741;
    float _3749 = rsqrt(_3747);
    float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3753 = fma(_3743, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3751);
    float _3755 = precise::clamp(_3753, 0.0, 1.0);
    float _3757 = -_3755;
    float _3759 = _3757 + 1.0;
    float _3761 = _3749 * _3733;
    float _3763 = _3749 * _3713;
    float _3765 = abs(_3759);
    float _3767 = log2(_3765);
    float _3769 = _3749 * _3721;
    float _3771 = _3763 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3773 = -_3771;
    float _3775 = fma(_3761, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3773);
    float _3777 = -_3769;
    float _3779 = fma(_3777, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3775);
    float _3781 = fma(_3779, -0.5, 0.5);
    float _3783 = _3767 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3785 = fma(_3779, 0.5, 0.5);
    float _3787 = _3761 + 1.0;
    float _3789 = exp2(_3783);
    float _3791 = fma(_3785, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3793 = fma(_3785, _3791, -0.212114393711090087890625);
    float _3795 = sqrt(_3781);
    float _3797 = fma(_3785, _3793, 1.570728778839111328125);
    float _3799 = -_3761;
    float _3801 = fma(_3789, _3787, _3799);
    float _3803 = fma(_3801, 0.5, 0.5);
    float _3805 = _3795 * 0.636619746685028076171875;
    float _3807 = -_3797;
    float _3809 = fma(_3805, _3807, 1.0);
    float2 _10089 = float2(_3809, _3803);
    float3 _3813 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10089, float2(0.0), isnan(_10089)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10089, float2(0.0), isnan(_10089)), level(0.0)).xyz;
    float _3815 = _3813.x;
    float _3817 = _3813.y;
    float _3819 = _3813.z;
    float _3821 = abs(_2868);
    float _3823 = log2(_3821);
    float _3825 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3827 = _3767 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3829 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3831 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3833 = _3829 || _3831;
    bool _3835 = isnan(0.5);
    bool _3837 = _3833 || _3835;
    float _3839 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3825);
    float _3841 = -_2782;
    float _3843 = _3841 + 1.0;
    out.m_88.x = _3268;
    out.m_88.y = _3266;
    out.m_88.z = _3270;
    float _3845 = exp2(_3827);
    float _3847 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3839);
    float _3849 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3847);
    float _3851 = _3823 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3853 = _3809;
    float _3855 = _3825;
    float _3857 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _3859 = _3839;
    if (!_3837)
    {
        _3853 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _3861 = _3853;
    if (!_3837)
    {
        float _3863 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3865 = _2868 + _3863;
        _3855 = _3865;
    }
    float _3867 = _3855;
    float _3869 = _3867;
    if (!_3837)
    {
        _3857 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _3871 = _3857;
    float _3873 = _3871;
    if (!_3837)
    {
        float _3875 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3877 = _2868 + _3875;
        _3378 = _3877;
    }
    float _3879 = _3378;
    float _3881 = exp2(_3851);
    bool _3883 = _2868 <= 8000.0;
    bool _3885 = isnan(_2868);
    bool _3887 = _3883 || _3885;
    bool _3889 = isnan(8000.0);
    bool _3891 = _3887 || _3889;
    float _3893 = float(_3891);
    out.gl_Position.x = _3426;
    out.gl_Position.y = _3428;
    out.gl_Position.z = _3849;
    out.gl_Position.w = _3390;
    if (!_3837)
    {
        float _3895 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3897 = _3871 + _3895;
        _3873 = _3897;
    }
    float _3899 = _3873;
    float _3901 = -_3845;
    float _3903 = _3901 + 1.0;
    if (_3837)
    {
        _3859 = 1.0;
    }
    float _3905 = _3859;
    float _3907 = _3903 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3909 = _3899;
    float _3911 = _3905;
    if (!_3837)
    {
        float _3913 = 1.0 / _3899;
        _3909 = _3913;
    }
    float _3915 = _3909;
    float _3917 = _3907 * _3484;
    float _3919 = fma(_3881, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3921 = precise::clamp(_3919, 0.0, 1.0);
    float _3923 = _3881;
    if (!_3837)
    {
        float _3925 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3927 = _3861 + _3925;
        _3923 = _3927;
    }
    float _3929 = _3923;
    float _3931 = fma(_3921, -2.0, 3.0);
    float _3933 = _3921 * _3921;
    float _3935 = _3603;
    float _3937 = _3933;
    if (!_3837)
    {
        float _3939 = 1.0 / _3929;
        _3935 = _3939;
    }
    float _3941 = _3935;
    float _3943 = _3933 * _3931;
    if (!_3837)
    {
        float _3945 = _3867 * _3915;
        float _3947 = precise::clamp(_3945, 0.0, 1.0);
        _3937 = _3947;
    }
    float _3949 = _3937;
    float _3951 = -_3943;
    float _3953 = _3951 + 1.0;
    if (_3837)
    {
        _3869 = 1.0;
    }
    float _3955 = _3869;
    float _3957 = _3849 + _3390;
    float _3959 = _3955;
    float _3961 = _3957;
    if (!_3837)
    {
        float _3963 = -_3949;
        float _3965 = _3963 + 1.0;
        _3959 = _3965;
    }
    float _3967 = _3959;
    float _3969 = fma(_3953, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3943);
    float _3971 = _3957 * 0.5;
    if (!_3366)
    {
        _3961 = 1.0;
    }
    float _3973 = _3961;
    float _3975 = _3893 * _3969;
    float _3977 = _3973;
    if (_3366)
    {
        bool _3979 = _3482 >= _3452;
        bool _3981 = isnan(_3482);
        bool _3983 = _3979 || _3981;
        bool _3985 = isnan(_3452);
        bool _3987 = _3983 || _3985;
        float _3989 = float(_3987);
        _3977 = _3989;
    }
    float _3991 = _3977;
    float _3993 = -_3907;
    float _3995 = _3993 + 1.0;
    out.m_90.z = _3971;
    out.m_90.w = _3390;
    float _3997 = _3975 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3999 = _3995;
    float _4001 = _3997;
    if (!_3837)
    {
        float _4003 = _3879 * _3941;
        float _4005 = precise::clamp(_4003, 0.0, 1.0);
        _3911 = _4005;
    }
    float _4007 = _3911;
    float _4009 = _3991 * _3573;
    bool _4011 = _3743 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4013 = isnan(_3743);
    bool _4015 = _4011 || _4013;
    bool _4017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4019 = _4015 || _4017;
    float _4021 = _3843 * _3997;
    float _4023 = precise::clamp(_4021, 0.0, 1.0);
    float _4025 = -_4023;
    float _4027 = fma(_4025, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4029 = _3495 * _3917;
    float _4031 = -_4009;
    float _4033 = fma(_4031, _4027, 1.0);
    float _4035 = precise::clamp(_4033, 0.0, 1.0);
    float _4037 = _3495 * _3995;
    float _4039 = _4035 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4041 = _4035;
    if (!_4019)
    {
        _3999 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4043 = _3999;
    float _4045 = _4043;
    float _4047 = _4043;
    if (!_4019)
    {
        _4001 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4049 = _4001;
    out.m_92.x = _4039;
    float _4051 = _4049;
    float _4053 = _4049;
    if (!_4019)
    {
        _4041 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4055 = _4041;
    float _4057 = _3819 * _3917;
    float _4059 = fma(_3815, _4029, _3489);
    float _4061 = fma(_3817, _4029, _3491);
    float _4063 = _4007 * _3967;
    float _4065 = fma(_3495, _4057, _3493);
    float _4067 = _4063;
    float _4069 = _4055;
    float _4071 = _4055;
    if (!_4019)
    {
        _3507 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4073 = _3507;
    float _4075 = _4063 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4077 = _4073;
    float _4079 = _4073;
    if (!_4019)
    {
        _3509 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4081 = _3509;
    out.m_94.x = _4059;
    out.m_94.y = _4061;
    out.m_94.z = _4065;
    out.m_94.w = _4037;
    float _4083 = _4081;
    float _4085 = _4081;
    if (!_4019)
    {
        _4067 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4087 = _4067;
    bool _4089 = !_4019;
    float _4091 = _4087;
    float _4093 = _4087;
    if (!_4089)
    {
        bool _4095 = _3743 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4097 = isnan(_3743);
        bool _4099 = _4095 || _4097;
        bool _4101 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4103 = _4099 || _4101;
        if (!_4103)
        {
            float _4105 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4107 = _3743 + _4105;
            float _4109 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4111 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4109;
            float _4113 = 1.0 / _4111;
            float _4115 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4117 = _4115 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4119 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4121 = _4119 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4123 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4127 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4129 = _4127 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4131 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4133 = _4131 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4135 = _4107 * _4113;
            float _4137 = precise::clamp(_4135, 0.0, 1.0);
            float _4139 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4141 = _4139 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4143 = fma(_4137, _4117, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4145 = fma(_4137, _4141, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4147 = fma(_4137, _4121, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4149 = fma(_4137, _4125, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4151 = fma(_4137, _4129, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4153 = fma(_4137, _4133, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4053 = _4145;
            _4085 = _4151;
            _4047 = _4143;
            _4079 = _4149;
            _4071 = _4147;
            _4093 = _4153;
            _4155 = true;
        }
        else
        {
            bool _4157 = _3743 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4159 = isnan(_3743);
            bool _4161 = _4157 || _4159;
            bool _4163 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4165 = _4161 || _4163;
            if (!_4165)
            {
                _4045 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4167 = _4045;
            _4047 = _4167;
            if (!_4165)
            {
                _4051 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4169 = _4051;
            _4053 = _4169;
            if (!_4165)
            {
                _4069 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4171 = _4069;
            _4071 = _4171;
            if (!_4165)
            {
                _4077 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4173 = _4077;
            _4079 = _4173;
            if (!_4165)
            {
                _4083 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4175 = _4083;
            _4085 = _4175;
            if (!_4165)
            {
                _4091 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4177 = _4091;
            bool _4179 = !_4165;
            _4093 = _4177;
            if (!_4179)
            {
                bool _4181 = _3743 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4183 = isnan(_3743);
                bool _4185 = _4181 || _4183;
                bool _4187 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4189 = _4185 || _4187;
                if (!_4189)
                {
                    float _4191 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4193 = _3743 + _4191;
                    float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4197 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4195;
                    float _4199 = 1.0 / _4197;
                    float _4201 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4203 = _4201 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4205 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4207 = _4205 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4209 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4211 = _4209 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4213 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4215 = _4213 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4217 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4219 = _4217 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4221 = _4193 * _4199;
                    float _4223 = precise::clamp(_4221, 0.0, 1.0);
                    float _4225 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4227 = _4225 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4229 = fma(_4223, _4203, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4231 = fma(_4223, _4227, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4233 = fma(_4223, _4207, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4235 = fma(_4223, _4211, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4237 = fma(_4223, _4215, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4239 = fma(_4223, _4219, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4053 = _4231;
                    _4085 = _4237;
                    _4047 = _4229;
                    _4079 = _4235;
                    _4071 = _4233;
                    _4093 = _4239;
                    _4155 = true;
                }
                else
                {
                    _4053 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4085 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4047 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4079 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4071 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4093 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4155 = false;
    float _4241 = _4053;
    float _4243 = _4085;
    float _4245 = _4047;
    float _4247 = _4079;
    float _4249 = _4071;
    float _4251 = _4093;
    float _4253 = fma(_2664, -0.5, 0.5);
    float _4255 = precise::clamp(_4253, 0.0, 1.0);
    float _4257 = -_4241;
    float _4259 = _4257 + _4243;
    float _4261 = _4075 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4263 = -_4245;
    float _4265 = _4263 + _4247;
    out.m_96.x = 0.0;
    float _4267 = fma(_4255, _4259, _4241);
    float _4269 = fma(_4255, _4265, _4245);
    out.m_61.x = _4261;
    float _4271 = -_4249;
    float _4273 = _4271 + _4251;
    float _4275 = _4267 * 0.586610972881317138671875;
    bool _4277 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4279 = fma(_4255, _4273, _4249);
    float _4281 = fma(_4269, 0.298911988735198974609375, _4275);
    bool _4283 = _4007 > 0.0;
    bool _4285 = isnan(_4007);
    bool _4287 = _4283 || _4285;
    bool _4289 = isnan(0.0);
    bool _4291 = _4287 || _4289;
    float _4293 = fma(_4279, 0.114477999508380889892578125, _4281);
    bool _4295 = _3967 <= 0.0;
    bool _4297 = !_4291;
    bool _4299 = _4295 || _4297;
    float _4301 = -_4293;
    float _4303 = _4269 + _4301;
    float _4305 = -_4293;
    float _4307 = _4267 + _4305;
    float _4309 = -_4293;
    float _4311 = _4279 + _4309;
    float _4313 = fma(_4303, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4293);
    float _4315 = fma(_4307, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4293);
    float _4317 = fma(_4311, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4293);
    bool _4319 = !_4277;
    if (!_4319)
    {
        float _4321 = -_3266;
        float _4323 = _4321 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4325 = -_3268;
        float _4327 = _4325 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4329 = -_3270;
        float _4331 = _4329 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4333 = _4323 * _4323;
        float _4335 = fma(_4327, _4327, _4333);
        float _4337 = fma(_4331, _4331, _4335);
        float _4339 = sqrt(_4337);
        float _4341 = rsqrt(_4337);
        float _4343 = -_4339;
        float _4345 = _4343 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4347 = _4345 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4349 = precise::clamp(_4347, 0.0, 1.0);
        float _4351 = _4327 * _4341;
        float _4353 = _4323 * _4341;
        float _4355 = abs(_4349);
        float _4357 = log2(_4355);
        float _4359 = _4331 * _4341;
        float _4361 = _4351 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4363 = _2664 * _4353;
        float _4365 = -_4353;
        float _4367 = -_4361;
        float _4369 = fma(_4365, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4367);
        float _4371 = fma(_2688, _4351, _4363);
        float _4373 = -_4359;
        float _4375 = fma(_4373, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4369);
        float _4377 = fma(_2696, _4359, _4371);
        float _4379 = precise::clamp(_4377, 0.0, 1.0);
        float _4381 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4383 = _4375 + _4381;
        float _4385 = _4357 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4387 = _4383 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4389 = precise::clamp(_4387, 0.0, 1.0);
        float _4391 = exp2(_4385);
        float _4393 = _4391 * _4389;
        float _4395 = _4379 * _4393;
        float _4397 = _4395 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4399 = _4395 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4401 = _4395 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _4397;
        out.m_96.y = _4399;
        out.m_96.z = _4401;
    }
    out.m_98.x = _4313;
    out.m_98.y = _4315;
    out.m_98.z = _4317;
    if (!_4299)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _4403 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4403;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4155 = false;
    bool _2734 = false;
    bool _341 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_58.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_61.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4460 = as_type<float>(_133);
        out.gl_Position.z = _4460;
    }
    if (!_121)
    {
        return out;
    }
    float _137 = in.m_63.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    float _155 = _151;
    if (_147)
    {
        float _157 = float(_117);
        _153 = _157;
    }
    float _159 = _153;
    bool _161 = _151 >= _159;
    bool _163 = !_147;
    bool _165 = _161 || _163;
    if (_165)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _127;
    if (_165)
    {
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4529 = as_type<float>(_171);
        out.gl_Position.z = _4529;
    }
    if (_165)
    {
        return out;
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    float _175 = in.m_68.x;
    float _177 = in.m_68.y;
    float _179 = in.m_68.z;
    int _181 = as_type<int>(_173) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_173) & 2;
    bool _187 = _185 != 0;
    bool _189 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _191 = _177 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _193 = _177 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _195 = _177 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _197 = !_183;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].x, _191);
    float _203 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].x, _193);
    float _205 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].x, _195);
    bool _207 = !_187;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[4].z, _201);
    float _213 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[5].z, _203);
    float _215 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[6].z, _205);
    bool _217 = !_189;
    int _219 = as_type<int>(_215);
    float _237;
    if (!_217)
    {
        float _221 = in.m_70.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        float _241 = float(_117);
        float _243 = 1.0 / _241;
        float _245 = _151 * _243;
        _237 = _245;
    }
    _239 = false;
    float _247 = _237;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = _247 + _249;
    bool _253 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _255 = isnan(_247);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    float _269 = -_263;
    float _271 = _269 + 1.0;
    bool _273 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _275 = isnan(_247);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _291 = 1.0 / _267;
    float _293 = _283 * _271;
    float _295 = -_283;
    float _297 = _295 + 1.0;
    float _299 = _251 * _291;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _301;
    float _305 = fma(_287, _299, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _307 = fma(_303, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _309 = _305 * _293;
    float _311 = _307 * _293;
    float _313 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _315 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].y, _311);
    float _317 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].x, _313);
    float _319 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].y, _315);
    bool _321 = !_289;
    float _339;
    if (!_321)
    {
        float _323 = in.m_70.x;
        float _325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _327 = _323 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _331 = _329 * _325;
        float _333 = floor(_331);
        float _335 = -_333;
        float _337 = _331 + _335;
        _339 = _337;
        _341 = true;
    }
    else
    {
        float _343 = float(_117);
        float _345 = 1.0 / _343;
        float _347 = _151 * _345;
        _339 = _347;
    }
    _341 = false;
    float _349 = _339;
    float _351 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _353 = int(_351);
    float _355 = float(_117);
    int _357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _359 = _357 != 0;
    float _361 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _363 = int(_361);
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _375 = float(_353);
    float _377 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _379 = int(_377);
    float _381 = 0.0;
    int _383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_359)
    {
        float _385 = in.m_70.x;
        _381 = _385;
    }
    float _387 = _381;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _395 = _387;
    if (!_359)
    {
        float _397 = in.m_70.y;
        _395 = _397;
    }
    float _399 = _395;
    float _401 = float(_363);
    float _403 = 1.0 / _375;
    float _405 = float(uint(_379));
    float _407 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _409 = int(_407);
    int _411 = ~_379;
    int _413 = _411 + 1;
    bool _415 = _379 == 0;
    float _417 = 1.0 / _401;
    float _419 = _403 * _151;
    float _421 = float(uint(_409));
    float _423 = 1.0 / _405;
    int _425 = ~_409;
    int _427 = _425 + 1;
    float _429 = _417 * _151;
    float _431 = trunc(_419);
    int _433 = int(_431);
    float _435 = 1.0 / _421;
    int _437 = as_type<int>(_423) + (-2);
    float _439 = in.m_70.x;
    float _441 = in.m_70.y;
    float _443 = in.m_70.z;
    float _445 = in.m_70.w;
    float _447 = trunc(_429);
    int _449 = int(_447);
    float _451 = float(uint(_433));
    float _453 = float(_433);
    float _455 = as_type<float>(_437) * _451;
    int _457 = as_type<int>(_435) + (-2);
    float _459 = 1.0 / _355;
    float _461 = float(uint(_449));
    float _463 = trunc(_455);
    float _465 = precise::max(_463, 0.0);
    uint _468 = uint(_465);
    float _470 = _441 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _472 = _443 + _439;
    float _474 = as_type<float>(_457) * _461;
    float _476 = _461;
    if (_359)
    {
        _476 = 1.0;
    }
    float _478 = _476;
    float _480 = fma(_470, -2.0, _365);
    float _482 = _478;
    if (!_359)
    {
        _482 = 7.345489978790283203125;
    }
    float _484 = _482;
    float _486 = trunc(_474);
    float _488 = precise::max(_486, 0.0);
    uint _490 = uint(_488);
    float _492 = _459 * _151;
    float _494 = _472 + (-1.0);
    float _496 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _480);
    float _498 = _484 * _439;
    float _500 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _502 = _413 * int(_468);
    int _504 = _502 + _433;
    float _506 = float(_379);
    float _508 = 1.0 / _391;
    float _510 = float(uint(_504));
    int _512 = _427 * int(_490);
    int _514 = _512 + _449;
    float _516 = floor(_498);
    float _518 = float(uint(_514));
    float _520 = as_type<float>(_437) * _510;
    float _522 = _510;
    if (_359)
    {
        _522 = 1.0;
    }
    float _524 = _522;
    float _526 = _524;
    if (!_359)
    {
        _526 = 1.2345600128173828125;
    }
    float _528 = _526;
    float _530 = trunc(_520);
    float _532 = precise::max(_530, 0.0);
    uint _534 = uint(_532);
    float _536 = as_type<float>(_457) * _518;
    float _538 = _369 * _508;
    float _540 = _443 + _441;
    float _542 = _399 * _528;
    int _544 = ~_379;
    int _546 = _544 + 1;
    float _548 = _540 + (-1.0);
    float _550 = trunc(_536);
    float _552 = precise::max(_550, 0.0);
    uint _554 = uint(_552);
    float _556 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _558 = int(_468) + int(_534);
    float _560 = floor(_542);
    bool _562 = _453 >= _506;
    bool _564 = isnan(_453);
    bool _566 = _562 || _564;
    bool _568 = isnan(_506);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -_516;
    float _576 = _498 + _574;
    int _578 = _546 * _558;
    int _580 = _578 + _433;
    int _582 = int(_490) + int(_554);
    float _584 = _576 * _506;
    int _586 = ~_409;
    int _588 = _586 + 1;
    float _590 = trunc(_572);
    int _592 = int(_590);
    bool _594 = uint(_580) >= uint(_379);
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _598 = _596 != 0;
    int _600 = _588 * _582;
    int _602 = _600 + _449;
    bool _604 = !_594;
    int _606 = _604 ? 0 : (-1);
    float _608 = -_560;
    float _610 = _542 + _608;
    bool _612 = !_598;
    int _614 = _612 ? 0 : 1;
    float _616 = trunc(_584);
    int _618 = int(_616);
    int _620 = ~_558;
    int _622 = _620 + _606;
    int _624 = _622 + 1;
    bool _626 = uint(_602) >= uint(_409);
    int _628 = abs(_614);
    int _630 = _379 * _624;
    int _632 = _630 + _433;
    bool _634 = !_626;
    int _636 = _634 ? 0 : (-1);
    int _638 = ~_592;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    bool _644 = !_415;
    int _646 = _644 ? _632 : (-1);
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _650 = _648 != 0;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _658 = _656 != 0;
    int _660 = _618 * _628;
    int _662 = _660 + _433;
    int _664 = ~_582;
    int _666 = _664 + _636;
    int _668 = _666 + 1;
    float _670 = _506 * _492;
    float _672 = float(_409);
    int _674 = _646 * _642;
    float _676 = float(_449);
    float _678 = trunc(_670);
    int _680 = int(_678);
    bool _682 = !_654;
    int _684 = _682 ? 0 : 1;
    int _686 = _409 * _668;
    int _688 = _686 + _449;
    bool _690 = _676 >= _672;
    bool _692 = isnan(_676);
    bool _694 = _690 || _692;
    bool _696 = isnan(_672);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    bool _702 = !_650;
    int _704 = _702 ? 0 : 1;
    int _706 = _379 + (-1);
    int _708 = abs(_684);
    float _710 = _610 * _672;
    int _712 = abs(_704);
    float _714 = trunc(_700);
    int _716 = int(_714);
    int _718 = _592 * _706;
    int _720 = _718 + _674;
    bool _722 = !_658;
    int _724 = _722 ? 0 : 1;
    float _726 = _672 * _492;
    int _728 = _720 * _708;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _732 = _730 != 0;
    float _734 = trunc(_710);
    int _736 = int(_734);
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _740 = _738 != 0;
    int _742 = _680 * _712;
    int _744 = _742 + _728;
    int _746 = abs(_724);
    bool _748 = !_732;
    int _750 = _748 ? 0 : 1;
    bool _752 = !_740;
    int _754 = _752 ? 0 : 1;
    int _756 = _662 * _746;
    int _758 = _756 + _744;
    bool _760 = _409 == 0;
    float _762 = trunc(_726);
    int _764 = int(_762);
    int _766 = abs(_750);
    int _768 = abs(_754);
    int _770 = ~_716;
    int _772 = _770 + 1;
    int _774 = _772 + 1;
    int _776 = _736 * _766;
    int _778 = _776 + _449;
    bool _780 = !_760;
    int _782 = _780 ? _688 : (-1);
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _790 = _788 != 0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _794 = _792 != 0;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _798 = _796 != 0;
    int _800 = _409 + (-1);
    int _802 = _782 * _774;
    bool _804 = _379 == 0;
    int _806 = _618 * _768;
    int _808 = _806 + _758;
    bool _810 = !_790;
    int _812 = _810 ? 0 : 1;
    int _814 = _716 * _800;
    int _816 = _814 + _802;
    bool _818 = !_786;
    int _820 = _818 ? 0 : 1;
    float _822 = float(uint(_808));
    int _824 = abs(_812);
    bool _826 = !_794;
    int _828 = _826 ? 0 : 1;
    float _830 = as_type<float>(_437) * _822;
    int _832 = abs(_820);
    int _834 = _816 * _824;
    bool _836 = !_798;
    int _838 = _836 ? 0 : 1;
    int _840 = abs(_828);
    float _842 = trunc(_830);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    int _848 = abs(_838);
    int _850 = _764 * _832;
    int _852 = _850 + _834;
    int _854 = ~_379;
    int _856 = _854 + 1;
    int _858 = _778 * _840;
    int _860 = _858 + _852;
    int _862 = ~_409;
    int _864 = _862 + 1;
    float _866 = float(uint(_778));
    int _868 = _736 * _848;
    int _870 = _868 + _860;
    float _872 = float(uint(_662));
    float _874 = as_type<float>(_457) * _866;
    float _876 = float(uint(_870));
    int _878 = _856 * int(_846);
    int _880 = _878 + _808;
    int _882 = ~_379;
    int _884 = _882 + 1;
    float _886 = as_type<float>(_437) * _872;
    int _888 = ~_379;
    int _890 = _888 + 1;
    float _892 = as_type<float>(_457) * _876;
    float _894 = float(uint(_880));
    float _896 = trunc(_874);
    float _898 = precise::max(_896, 0.0);
    uint _900 = uint(_898);
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _904 = _902 != 0;
    int _906 = ~_409;
    int _908 = _906 + 1;
    float _910 = as_type<float>(_437) * _894;
    float _912 = trunc(_892);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    float _918 = as_type<float>(_712);
    if (_904)
    {
        _383 = 0;
    }
    int _920 = _383;
    float _922 = trunc(_910);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    int _928 = _920;
    if (!_904)
    {
        _928 = 1;
    }
    int _930 = _928;
    float _932 = trunc(_886);
    float _934 = precise::max(_932, 0.0);
    uint _936 = uint(_934);
    int _938 = _864 * int(_916);
    int _940 = _938 + _870;
    float _942 = float(uint(_940));
    int _944 = int(_846) + int(_926);
    float _946 = as_type<float>(_457) * _942;
    int _948 = ~_409;
    int _950 = _948 + 1;
    int _952 = _884 * _944;
    int _954 = _952 + _808;
    float _956 = trunc(_946);
    float _958 = precise::max(_956, 0.0);
    uint _960 = uint(_958);
    int _962 = _890 * int(_936);
    int _964 = _962 + _662;
    int _966 = _950 * int(_900);
    int _968 = _966 + _778;
    bool _970 = uint(_954) >= uint(_379);
    float _972 = float(uint(_964));
    float _974 = float(uint(_968));
    float _976 = _441 * 2.0;
    float _978 = as_type<float>(_437) * _972;
    bool _980 = !_970;
    int _982 = _980 ? 0 : (-1);
    float _984 = as_type<float>(_457) * _974;
    float _986 = trunc(_978);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    int _992 = ~_944;
    int _994 = _992 + _982;
    int _996 = _994 + 1;
    int _998 = ~_409;
    int _1000 = _998 + 1;
    int _1002 = int(_916) + int(_960);
    int _1004 = _379 * _996;
    int _1006 = _1004 + _808;
    float _1008 = floor(_976);
    bool _1010 = !_804;
    int _1012 = _1010 ? _1006 : (-1);
    int _1014 = _1000 * _1002;
    int _1016 = _1014 + _870;
    int _1018 = _1012 & 3;
    bool _1020 = _1018 != 0;
    bool _1022 = uint(_1016) >= uint(_409);
    bool _1024 = uint(_1018) >= 2u;
    bool _1026 = !_1022;
    int _1028 = _1026 ? 0 : (-1);
    int _1030 = _1024 ? 0 : 1;
    bool _1032 = _1018 != 3;
    int _1034 = int(_936) + int(_990);
    float _1036 = trunc(_984);
    float _1038 = precise::max(_1036, 0.0);
    uint _1040 = uint(_1038);
    int _1042 = _1012 & 3;
    bool _1044 = _1042 != 0;
    int _1046 = ~_1002;
    int _1048 = _1046 + _1028;
    int _1050 = _1048 + 1;
    int _1052 = _1044 ? 0 : 1;
    bool _1054 = uint(_1018) > 1u;
    int _1056 = _409 * _1050;
    int _1058 = _1056 + _870;
    int _1060 = ~_1030;
    int _1062 = _1060 + 1;
    int _1064 = _1062 + 1;
    float _1066 = _439 * 2.0;
    int _1068 = _1064;
    if (_1032)
    {
        int _1070 = ~_1030;
        int _1072 = _1070 + 1;
        _1068 = _1072;
    }
    int _1074 = _1068;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1078 = _1076 != 0;
    float _1080 = floor(_1066);
    bool _1082 = !_760;
    int _1084 = _1082 ? _1058 : (-1);
    int _1086 = ~_379;
    int _1088 = _1086 + 1;
    bool _1090 = !_1078;
    int _1092 = _1090 ? 0 : 1;
    int _1094 = int(_900) + int(_1040);
    int _1096 = _1088 * _1034;
    int _1098 = _1096 + _662;
    int _1100 = _1084 & 3;
    bool _1102 = _1100 != 0;
    int _1104 = ~_1052;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    int _1110 = _908 * _1094;
    int _1112 = _1110 + _778;
    int _1114 = _1108;
    if (!_1054)
    {
        int _1116 = ~_1052;
        int _1118 = _1116 + 1;
        _1114 = _1118;
    }
    int _1120 = _1114;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1124 = _1122 != 0;
    bool _1126 = _1100 != 3;
    bool _1128 = uint(_1098) >= uint(_379);
    bool _1130 = !_1124;
    int _1132 = _1130 ? 0 : 1;
    bool _1134 = uint(_1100) >= 2u;
    bool _1136 = !_1128;
    int _1138 = _1136 ? 0 : (-1);
    bool _1140 = uint(_1100) > 1u;
    int _1142 = _1134 ? 0 : 1;
    int _1144 = _1084 & 3;
    bool _1146 = _1144 != 0;
    int _1148 = ~_1142;
    int _1150 = _1148 + 1;
    int _1152 = _1150 + 1;
    int _1154 = _1152;
    if (_1126)
    {
        int _1156 = ~_1142;
        int _1158 = _1156 + 1;
        _1154 = _1158;
    }
    int _1160 = _1154;
    bool _1162 = _930 != 1;
    bool _1164 = _1080 > 0.0;
    int _1166 = _1146 ? 0 : 1;
    bool _1168 = _1080 >= 0.0;
    bool _1170 = isnan(_1080);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan(0.0);
    bool _1176 = _1172 || _1174;
    int _1178 = ~_1166;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    int _1184 = _1182;
    if (!_1140)
    {
        int _1186 = ~_1166;
        int _1188 = _1186 + 1;
        _1184 = _1188;
    }
    int _1190 = _1184;
    bool _1192 = uint(_1112) >= uint(_409);
    int _1194 = ~_1034;
    int _1196 = _1194 + _1138;
    int _1198 = _1196 + 1;
    int _1200 = _1176 ? 0 : 1;
    bool _1202 = !_1192;
    int _1204 = _1202 ? 0 : (-1);
    int _1206 = _379 * _1198;
    int _1208 = _1206 + _662;
    int _1210 = ~_1200;
    int _1212 = _1210 + 1;
    int _1214 = _1212 + 1;
    float _1216 = in.m_72.x;
    float _1218 = in.m_72.y;
    bool _1220 = _1008 > 0.0;
    int _1222 = _1214;
    if (!_1162)
    {
        _918 = _441;
    }
    float _1224 = _918;
    float _1226 = 0.0;
    float _1228 = _1224;
    if (!_1162)
    {
        _1226 = _441;
    }
    float _1230 = _1226;
    float _1232 = 0.0;
    float _1234 = _1230;
    if (!_1162)
    {
        _1232 = _443;
    }
    float _1236 = _1232;
    float _1238 = 0.0;
    float _1240 = _1236;
    if (!_1162)
    {
        _1238 = _443;
    }
    float _1242 = _1238;
    bool _1244 = _1008 >= 0.0;
    bool _1246 = isnan(_1008);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan(0.0);
    bool _1252 = _1248 || _1250;
    float _1254 = _1242;
    if (!_1164)
    {
        int _1256 = ~_1200;
        int _1258 = _1256 + 1;
        _1222 = _1258;
    }
    int _1260 = _1222;
    if (_1162)
    {
        _1228 = _439;
    }
    float _1262 = _1228;
    if (_1162)
    {
        _1234 = _439;
    }
    float _1264 = _1234;
    if (_1162)
    {
        _1240 = _441;
    }
    float _1266 = _1240;
    if (_1162)
    {
        _1254 = _441;
    }
    float _1268 = _1254;
    float _1270 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[83].z, _393);
    bool _1272 = _1018 != 3;
    float _1274 = _317 * _1216;
    bool _1276 = !_1020;
    int _1278 = _1276 ? 0 : 1;
    float _1280 = _319 * _1218;
    bool _1282 = _445 > 0.5;
    float _1284 = _439 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1286 = _1100 != 3;
    float _1288 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1290 = _1252 ? 0 : 1;
    bool _1292 = !_804;
    int _1294 = _1292 ? _1208 : (-1);
    bool _1296 = !_1272;
    int _1298 = _1296 ? 0 : (-1);
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1302 = _1300 != 0;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1306 = _1304 != 0;
    int _1308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1310 = _1308 != 0;
    float _1312 = in.m_58.x;
    float _1314 = in.m_58.y;
    float _1316 = in.m_58.z;
    bool _1318 = !_1286;
    int _1320 = _1318 ? 0 : (-1);
    int _1322 = ~_1290;
    int _1324 = _1322 + 1;
    int _1326 = _1324 + 1;
    int _1328 = _1326;
    if (!_1220)
    {
        int _1330 = ~_1290;
        int _1332 = _1330 + 1;
        _1328 = _1332;
    }
    int _1334 = _1328;
    int _1336 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1338 = _1336 != 0;
    float _1340 = _443 * 2.0;
    bool _1342 = !_1302;
    int _1344 = _1342 ? 0 : 1;
    float _1346 = floor(_1340);
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1350 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1352 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1354 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1356 = -_1348;
    float _1358 = fma(_1284, 2.0, _1356);
    float _1360 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1350);
    float _1362 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1352);
    float _1364 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1354);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1372 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1360);
    float _1374 = 1.0 / _1368;
    bool _1376 = _1346 >= 0.0;
    bool _1378 = isnan(_1346);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan(0.0);
    bool _1384 = _1380 || _1382;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1392 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1394 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1398 = !_1306;
    int _1400 = _1398 ? 0 : 1;
    float _1402 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1362);
    float _1404 = float(_1260);
    out.m_74.x = _1394;
    out.m_74.y = _1392;
    out.m_74.z = _1396;
    out.m_74.w = _1390;
    bool _1406 = !_1310;
    int _1408 = _1406 ? 0 : 1;
    float _1410 = _1402 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1412 = ~_1094;
    int _1414 = _1412 + _1204;
    int _1416 = _1414 + 1;
    float _1418 = _373 * _1374;
    int _1420 = _1384 ? 0 : 1;
    bool _1422 = _1346 > 0.0;
    float _1424 = _439 + _441;
    int _1426 = ~_1420;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    int _1432 = _409 * _1416;
    int _1434 = _1432 + _778;
    float _1436 = float(_1334);
    float _1438 = _1424 + (-1.0);
    bool _1440 = _409 == 0;
    float _1442 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1444 = log2(_1442);
    float _1446 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1448 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1452 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1456 = _1430;
    if (!_1422)
    {
        int _1458 = ~_1420;
        int _1460 = _1458 + 1;
        _1456 = _1460;
    }
    int _1462 = _1456;
    float _1464 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1450);
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1468 = fma(_1452, -2.0, _1454);
    bool _1470 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1472 = isnan(0.0);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1478 = _1474 || _1476;
    float _1480 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1464);
    float _1482 = -_1466;
    float _1484 = fma(_1448, 2.0, _1482);
    float _1486 = _1444 * _151;
    float _1488 = in.m_76.x;
    float _1490 = in.m_76.y;
    float _1492 = in.m_76.z;
    int _1494 = abs(_1400);
    float _1496 = exp2(_1486);
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1500 = 1.0 + _1498;
    int _1502 = abs(_1344);
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1506 = float(_1494);
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1510 = float(_1502);
    float _1512 = 1.0 / _1500;
    float _1514 = float(_1462);
    float _1516 = _1506 * _1404;
    float _1518 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1508);
    float _1520 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1504);
    float _1522 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1468);
    float _1524 = _1510 * _1514;
    float _1526 = -_151;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1358);
    float _1530 = -_1496;
    float _1532 = _1530 + 1.0;
    float _1534 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1518);
    float _1536 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1520);
    float _1538 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1270);
    float _1540 = -_151;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1484);
    float _1544 = _1478 ? _1532 : 0.0;
    float _1546 = _1524 * (-2.0);
    bool _1548 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1550 = isnan(1.0);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1556 = _1552 || _1554;
    float _1558 = _1516 * (-2.0);
    bool _1560 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1562 = isnan(_349);
    bool _1564 = _1560 || _1562;
    bool _1566 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1568 = _1564 || _1566;
    float _1570 = float(_1568);
    float _1572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    bool _1574 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1576 = isnan(_349);
    bool _1578 = _1574 || _1576;
    bool _1580 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1582 = _1578 || _1580;
    float _1584 = float(_1582);
    bool _1586 = !_1102;
    int _1588 = _1586 ? 0 : 1;
    int _1590 = abs(_1320);
    int _1592 = abs(_1588);
    int _1594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1596 = _1594 != 0;
    if (_1556)
    {
        float _1598 = _1544 * _1512;
        _155 = _1598;
    }
    float _1600 = _155;
    int _1602 = abs(_1408);
    float _1604 = fma(_1546, _1488, _1488);
    bool _1606 = _439 > 0.5;
    float _1608 = _439 + (-0.5);
    float _1610 = float(_1602);
    float _1612 = fma(_1446, _1546, _1446);
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1616 = _349 + _1614;
    float _1618 = fma(_1608, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1604);
    float _1620 = -_1570;
    float _1622 = _1620 + 1.0;
    float _1624 = _1610 * _1436;
    bool _1626 = !_1440;
    int _1628 = _1626 ? _1434 : (-1);
    float _1630 = fma(_1612, _1600, _1618);
    bool _1632 = _441 > 0.5;
    float _1634 = _441 + (-0.5);
    float _1636 = fma(_1558, _1490, _1490);
    float _1638 = _1624 * (-2.0);
    float _1640 = _1630 * 0.15915493667125701904296875;
    float _1642 = fma(_556, _1558, _556);
    float _1644 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1636);
    float _1646 = fma(_500, _1638, _500);
    float _1648 = fma(_1638, _1492, _1492);
    bool _1650 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1652 = isnan(_349);
    bool _1654 = _1650 || _1652;
    bool _1656 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1658 = _1654 || _1656;
    float _1660 = float(_1658);
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1664 = _349 + _1662;
    float _1666 = -_1584;
    float _1668 = _1666 + 1.0;
    float _1670 = fma(_1642, _1600, _1644);
    float _1672 = fma(_538, _1616, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1674 = _1584 * _1622;
    float _1676 = _443 + (-0.5);
    float _1678 = _1660 * _1668;
    float _1680 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1682 = _1012 >> 31;
    float _1684 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1648);
    int _1686 = _1084 >> 31;
    float _1688 = _1672 * _1678;
    int _1690 = _1682 & 3;
    float _1692 = _1670 * 0.15915493667125701904296875;
    int _1694 = _1686 & 3;
    float _1696 = fma(_1646, _1600, _1684);
    int _1698 = _1012 + _1690;
    float _1700 = _1640 * 6.283185482025146484375;
    float _1702 = sin(_1700);
    int _1704 = _1084 + _1694;
    float _1706 = -_1660;
    float _1708 = _1706 + 1.0;
    float _1710 = fma(_1418, _1664, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1712 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    int _1714 = _1704 >> 2;
    float _1716 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1688);
    float _1718 = _1680 * _1572;
    float _1720 = _1640 * 6.283185482025146484375;
    float _1722 = cos(_1720);
    int _1724 = _1714 << 4;
    int _1726 = _1724 + 512;
    float _1728 = fma(_1710, _1674, _1716);
    float _1730 = _1288 * _1712;
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1734 = _1732 != 0;
    float _1736 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1728);
    float _1738 = _1692 * 6.283185482025146484375;
    float _1740 = sin(_1738);
    float _1742 = _1696 * 0.15915493667125701904296875;
    float _1744 = _1692 * 6.283185482025146484375;
    float _1746 = cos(_1744);
    float _1748 = _1742 * 6.283185482025146484375;
    float _1750 = cos(_1748);
    int _1752 = _1698 >> 2;
    float _1754 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1364);
    float _1756 = _1702 * _1740;
    uint _1758 = uint(int(uint(_1726) >> uint(2)));
    uint _1760 = uint(int(uint(int(_1758)) >> uint(2)));
    int _1762 = int(_1758) & 3;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[int(_1760)][_1762];
    int _1766 = int(_1758) + 1;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    int _1770 = _1766 & 3;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[int(_1768)][_1770];
    int _1774 = _1752 << 4;
    int _1776 = _1774 + 368;
    float _1778 = _1742 * 6.283185482025146484375;
    float _1780 = sin(_1778);
    float _1782 = _1722 * _1746;
    float _1784 = _1702 * _1746;
    uint _1786 = uint(int(uint(_1776) >> uint(2)));
    uint _1788 = uint(int(uint(int(_1786)) >> uint(2)));
    int _1790 = int(_1786) & 3;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[int(_1788)][_1790];
    int _1794 = int(_1786) + 1;
    uint _1796 = uint(int(uint(_1794) >> uint(2)));
    int _1798 = _1794 & 3;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[int(_1796)][_1798];
    float _1802 = _1702 * _1750;
    float _1804 = _1722 * _1740;
    float _1806 = _1746 * _1750;
    float _1808 = _1722 * _1750;
    float _1810 = _1740 * _1750;
    float _1812 = _1802 * _1730;
    float _1814 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1816 = fma(_1780, _1782, _1756);
    float _1818 = fma(_1780, _1756, _1782);
    float _1820 = -_1804;
    float _1822 = fma(_1780, _1784, _1820);
    int _1824 = _1776 + 8;
    uint _1826 = uint(int(uint(_1824) >> uint(2)));
    uint _1828 = uint(int(uint(int(_1826)) >> uint(2)));
    int _1830 = int(_1826) & 3;
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[int(_1828)][_1830];
    int _1834 = int(_1826) + 1;
    uint _1836 = uint(int(uint(_1834) >> uint(2)));
    int _1838 = _1834 & 3;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[int(_1836)][_1838];
    float _1842 = -_1784;
    float _1844 = fma(_1780, _1804, _1842);
    float _1846 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1848 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1850 = -_1730;
    float _1852 = _1780 * _1850;
    float _1854 = _1808 * _1730;
    float _1856 = -_1780;
    float _1858 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1814);
    float _1860 = -_1780;
    float _1862 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1846);
    int _1864 = _1726 + 8;
    uint _1866 = uint(int(uint(_1864) >> uint(2)));
    uint _1868 = uint(int(uint(int(_1866)) >> uint(2)));
    int _1870 = int(_1866) & 3;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[int(_1868)][_1870];
    int _1874 = int(_1866) + 1;
    uint _1876 = uint(int(uint(_1874) >> uint(2)));
    int _1878 = _1874 & 3;
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[int(_1876)][_1878];
    float _1882 = -_1780;
    float _1884 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1848);
    float _1886 = fma(_1806, _1718, _1852);
    float _1888 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1858);
    float _1890 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1862);
    float _1892 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1884);
    int _1894 = abs(_1190);
    float _1896 = fma(_1816, _1718, _1854);
    int _1898 = abs(_1120);
    float _1900 = fma(_1822, _1718, _1812);
    int _1902 = abs(_1278);
    float _1904 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1906 = ~_1898;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    float _1912 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1914 = ~_1894;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    float _1920 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1922 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1904);
    float _1924 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1912);
    float _1926 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1928 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1920);
    int _1930 = ~_1902;
    int _1932 = _1930 + 1;
    int _1934 = _1932 + 1;
    float _1936 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1938 = _1910 * as_type<int>(_1800);
    int _1940 = _1918 * as_type<int>(_1772);
    int _1942 = _1934 * as_type<int>(_1792);
    int _1944 = _1942 + _1938;
    int _1946 = abs(_1074);
    int _1948 = abs(_1160);
    int _1950 = ~_1592;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    float _1956 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1958 = int(_1956);
    int _1960 = _1954 * as_type<int>(_1764);
    int _1962 = _1960 + _1940;
    int _1964 = abs(_1298);
    float _1966 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1926);
    int _1968 = ~_1946;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    int _1974 = ~_1948;
    int _1976 = _1974 + 1;
    int _1978 = _1976 + 1;
    int _1980 = _1972 * as_type<int>(_1832);
    int _1982 = _1980 + _1944;
    int _1984 = abs(_1132);
    int _1986 = _1978 * as_type<int>(_1872);
    int _1988 = _1986 + _1962;
    int _1990 = ~_1964;
    int _1992 = _1990 + 1;
    int _1994 = _1992 + 1;
    float _1996 = _1372 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1998 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2000 = int(_1998);
    int _2002 = abs(_1092);
    int _2004 = _1994 * as_type<int>(_1840);
    int _2006 = _2004 + _1982;
    int _2008 = ~_1590;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    float _2014 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2016 = fma(_1844, _2014, _1896);
    int _2018 = ~_1984;
    int _2020 = _2018 + 1;
    int _2022 = _2020 + 1;
    int _2024 = _2012 * as_type<int>(_1880);
    int _2026 = _2024 + _1988;
    float _2028 = fma(_1810, _2014, _1886);
    float _2030 = float(uint(_1958));
    float _2032 = _2016 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2034 = ~_2002;
    int _2036 = _2034 + 1;
    int _2038 = _2036 + 1;
    int _2040 = _2026 * _2022;
    float _2042 = fma(_1818, _2014, _1900);
    float _2044 = _2016 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2046 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2032);
    float _2048 = 1.0 / _2030;
    int _2050 = _2006 * _2038;
    float _2052 = float(uint(_2000));
    float _2054 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2044);
    float _2056 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2046);
    int _2058 = abs(_2000);
    int _2060 = _1294 * _2002;
    int _2062 = _2060 + _2050;
    int _2064 = abs(_1958);
    float _2066 = 1.0 / _2052;
    float _2068 = _2056 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2070 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2072 = float(uint(_2064));
    int _2074 = _1628 * _1984;
    int _2076 = _2074 + _2040;
    float _2078 = float(uint(_2058));
    float _2080 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2054);
    int _2082 = as_type<int>(_2048) + (-2);
    float _2084 = _1754 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2086 = float(uint(_2062));
    float _2088 = 1.0 / _2072;
    float _2090 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2070);
    float _2092 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1936);
    float _2094 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2096 = as_type<float>(_2082) * _2086;
    int _2098 = as_type<int>(_2066) + (-2);
    float _2100 = _2084 + _2068;
    float _2102 = float(uint(_2076));
    float _2104 = 1.0 / _2078;
    float _2106 = _1996 + _2094;
    float _2108 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1966);
    float _2110 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2090);
    float _2112 = as_type<float>(_2098) * _2102;
    int _2114 = abs(_2076);
    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2118 = _2106 + _2116;
    float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2122 = _2100 + _2120;
    float _2124 = trunc(_2096);
    float _2126 = precise::max(_2124, 0.0);
    uint _2128 = uint(_2126);
    int _2130 = abs(_2062);
    float _2132 = _2016 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2134 = float(uint(_2114));
    float _2136 = _2118 * _2118;
    float _2138 = _2122 * _2122;
    int _2140 = as_type<int>(_2088) + (-2);
    float _2142 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2092);
    float _2144 = trunc(_2112);
    float _2146 = precise::max(_2144, 0.0);
    uint _2148 = uint(_2146);
    int _2150 = as_type<int>(_2104) + (-2);
    float _2152 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2132);
    float _2154 = float(uint(_2130));
    float _2156 = _2136 + _2138;
    int _2158 = ~_1958;
    int _2160 = _2158 + 1;
    float _2162 = as_type<float>(_2150) * _2134;
    int _2164 = ~_2000;
    int _2166 = _2164 + 1;
    float _2168 = as_type<float>(_2140) * _2154;
    float _2170 = sqrt(_2156);
    int _2172 = _2160 * int(_2128);
    int _2174 = _2172 + _2062;
    float _2176 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2152);
    int _2178 = ~_2064;
    int _2180 = _2178 + 1;
    float _2182 = float(uint(_2174));
    float _2184 = _2176 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2186 = trunc(_2168);
    float _2188 = precise::max(_2186, 0.0);
    uint _2190 = uint(_2188);
    float _2192 = as_type<float>(_2082) * _2182;
    float _2194 = trunc(_2162);
    float _2196 = precise::max(_2194, 0.0);
    uint _2198 = uint(_2196);
    bool _2200 = _2170 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2202 = -_209;
    int _2204 = _1282 ? as_type<int>(_2202) : as_type<int>(_209);
    int _2206 = _2166 * int(_2148);
    int _2208 = _2206 + _2076;
    bool _2210 = _443 > 0.5;
    int _2212 = _2180 * int(_2190);
    int _2214 = _2212 + _2130;
    float _2216 = float(uint(_2208));
    int _2218 = ~_2058;
    int _2220 = _2218 + 1;
    float _2222 = float(uint(_2214));
    float _2224 = as_type<float>(_2098) * _2216;
    float _2226 = _1410 + _2184;
    int _2228 = _2220 * int(_2198);
    int _2230 = _2228 + _2114;
    float _2232 = _2184;
    float _2234 = _2136;
    float _2236 = _2106;
    float _2238 = _2138;
    float _2240 = _2100;
    if (!_2200)
    {
        _2232 = _2136;
    }
    float _2242 = _2232;
    float _2244 = trunc(_2192);
    float _2246 = precise::max(_2244, 0.0);
    uint _2248 = uint(_2246);
    float _2250 = _2242;
    if (!_2200)
    {
        _2234 = _2106;
    }
    float _2252 = _2234;
    float _2254 = _2252;
    if (!_2200)
    {
        _2236 = _2226;
    }
    float _2256 = _2236;
    float _2258 = float(uint(_2230));
    bool _2260 = !_2200;
    float _2262 = _2256;
    if (!_2260)
    {
        float _2264 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2268 = _2170 + _2266;
        float _2270 = _2226 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2272 = rsqrt(_2156);
        float _2274 = _2268 * _2264;
        float _2276 = _2274 * 0.15915493667125701904296875;
        float _2278 = _2276 * 6.283185482025146484375;
        float _2280 = sin(_2278);
        float _2282 = _2276 * 6.283185482025146484375;
        float _2284 = cos(_2282);
        float _2286 = fma(_2280, _2270, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2288 = _2272 * _2286;
        float _2290 = fma(_2118, _2288, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2292 = _2284 + (-1.0);
        float _2294 = fma(_2122, _2288, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2298 = _2290 + _2296;
        float _2300 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2304 = _2294 + _2302;
        float _2306 = _2298 * _2298;
        float _2308 = fma(_2226, _2284, _2300);
        float _2310 = _2304 * _2304;
        _2262 = _2308;
        _2250 = _2306;
        _2238 = _2310;
        _2240 = _2294;
        _2254 = _2290;
    }
    float _2312 = _2262;
    float _2314 = _2250;
    float _2316 = _2238;
    float _2318 = _2240;
    float _2320 = _2254;
    float _2322 = as_type<float>(_2140) * _2222;
    float _2324 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1924);
    float _2326 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1922);
    float _2328 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1928);
    float _2330 = -_209;
    int _2332 = _1632 ? as_type<int>(_2330) : as_type<int>(_209);
    float _2334 = trunc(_2322);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    int _2340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2342 = _2340 != 0;
    float _2344 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2346 = -_199;
    int _2348 = _1606 ? as_type<int>(_2346) : as_type<int>(_199);
    float _2350 = as_type<float>(_2150) * _2258;
    float _2352 = -_199;
    int _2354 = _2210 ? as_type<int>(_2352) : as_type<int>(_199);
    float _2356 = _2344 * _1892;
    bool _2358 = !_1596;
    float _2360 = _2358 ? _209 : as_type<float>(_2204);
    float _2362 = trunc(_2224);
    float _2364 = precise::max(_2362, 0.0);
    uint _2366 = uint(_2364);
    bool _2368 = !_2342;
    float _2370 = _2368 ? _209 : as_type<float>(_2332);
    float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2374 = _2312 + _2372;
    bool _2376 = !_1338;
    float _2378 = _2376 ? _199 : as_type<float>(_2348);
    float _2380 = _2344 * _1890;
    bool _2382 = !_1734;
    float _2384 = _2382 ? _199 : as_type<float>(_2354);
    float _2386 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2388 = fma(_2374, _2374, _2314);
    float _2390 = trunc(_2350);
    float _2392 = precise::max(_2390, 0.0);
    uint _2394 = uint(_2392);
    float _2396 = _2344 * _1888;
    float _2398 = fma(_2386, _2326, _2380);
    int _2400 = int(_2190) + int(_2338);
    float _2402 = _2388 + _2316;
    float _2404 = fma(_2386, _2324, _2396);
    float _2406 = fma(_2386, _2328, _2356);
    int _2408 = int(_2128) + int(_2248);
    float _2410 = -_1534;
    float _2412 = _2410 + 1.0;
    int _2414 = ~_1958;
    int _2416 = _2414 + 1;
    float _2418 = sqrt(_2402);
    int _2420 = int(_2148) + int(_2366);
    float _2422 = -_1538;
    float _2424 = _2422 + 1.0;
    float _2426 = -_1536;
    float _2428 = _2426 + 1.0;
    int _2430 = ~_2000;
    int _2432 = _2430 + 1;
    float _2434 = -_1480;
    float _2436 = _2434 + 1.0;
    int _2438 = ~_2064;
    int _2440 = _2438 + 1;
    int _2442 = _2416 * _2408;
    int _2444 = _2442 + _2062;
    int _2446 = ~_2058;
    int _2448 = _2446 + 1;
    int _2450 = _2432 * _2420;
    int _2452 = _2450 + _2076;
    int _2454 = int(_2198) + int(_2394);
    int _2456 = _2440 * _2400;
    int _2458 = _2456 + _2130;
    bool _2460 = uint(_2444) >= uint(_1958);
    out.m_78.x = _2326;
    out.m_78.y = _2324;
    out.m_78.z = _2328;
    bool _2462 = uint(_2452) >= uint(_2000);
    float _2464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2466 = !_2460;
    int _2468 = _2466 ? 0 : (-1);
    int _2470 = _2448 * _2454;
    int _2472 = _2470 + _2114;
    bool _2474 = uint(_2458) >= uint(_2064);
    bool _2476 = !_2462;
    int _2478 = _2476 ? 0 : (-1);
    int _2480 = ~_2408;
    int _2482 = _2480 + _2468;
    int _2484 = _2482 + 1;
    float _2486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2488 = uint(_2472) >= uint(_2058);
    int _2490 = ~_2420;
    int _2492 = _2490 + _2478;
    int _2494 = _2492 + 1;
    int _2496 = _1958 * _2484;
    int _2498 = _2496 + _2062;
    int _2500 = _2062 ^ _1958;
    int _2502 = _2076 ^ _2000;
    int _2504 = _2000 * _2494;
    int _2506 = _2504 + _2076;
    bool _2508 = _1958 == 0;
    float _2510 = _2464 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2512 = _1958 == 0;
    float _2514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2516 = !_2474;
    int _2518 = _2516 ? 0 : (-1);
    uint _2520 = uint(int(uint(_2500) >> uint(31)));
    float _2522 = _2486 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2524 = !_2488;
    int _2526 = _2524 ? 0 : (-1);
    uint _2528 = uint(int(uint(_2502) >> uint(31)));
    bool _2530 = !_2508;
    int _2532 = _2530 ? _2498 : (-1);
    int _2534 = ~_2518;
    int _2536 = _2400 + _2534;
    int _2538 = _2536 + 1;
    float _2540 = fma(_2344, _2344, 1.0);
    int _2542 = ~int(_2520);
    int _2544 = _2542 + 1;
    int _2546 = ~_2526;
    int _2548 = _2454 + _2546;
    int _2550 = _2548 + 1;
    int _2552 = ~int(_2528);
    int _2554 = _2552 + 1;
    bool _2556 = _2000 == 0;
    float _2558 = float(_2532);
    bool _2560 = _2000 == 0;
    int _2562 = _2538 ^ _2544;
    float _2564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2566 = _2550 ^ _2554;
    float _2568 = fma(_2510, _2558, _1528);
    bool _2570 = !_2556;
    int _2572 = _2570 ? _2506 : (-1);
    int _2574 = ~_2544;
    int _2576 = _2574 + _2562;
    int _2578 = _2576 + 1;
    int _2580 = ~_2554;
    int _2582 = _2580 + _2566;
    int _2584 = _2582 + 1;
    float _2586 = rsqrt(_2540);
    float _2588 = float(_2572);
    float _2590 = _2514 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2592 = !_2512;
    int _2594 = _2592 ? _2578 : (-1);
    float _2596 = _2378 + 0.5;
    bool _2598 = _2418 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2600 = isnan(_2418);
    bool _2602 = _2598 || _2600;
    bool _2604 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2606 = _2602 || _2604;
    float _2608 = fma(_2590, _2588, _1542);
    float _2610 = float(_2594);
    float _2612 = _2564 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2614 = !_2560;
    int _2616 = _2614 ? _2584 : (-1);
    float _2618 = fma(_2510, _2596, _2568);
    float _2620 = _2384 + 0.5;
    float _2622 = -_496;
    float _2624 = fma(_2522, _2610, _2622);
    float _2626 = float(_2616);
    float _2628 = _2370 + (-0.5);
    float _2630 = fma(_2590, _2620, _2608);
    float _2632 = _2344 * _2586;
    float _2634 = -_2412;
    float _2636 = fma(_2378, _2634, _2618);
    float _2638 = -_1522;
    float _2640 = fma(_2612, _2626, _2638);
    float _2642 = -_2522;
    float _2644 = fma(_2642, _2628, _2624);
    float _2646 = _2360 + (-0.5);
    float _2648 = -_2110;
    float _2650 = _2632 * _2648;
    float _2652 = -_2108;
    float _2654 = _2632 * _2652;
    float _2656 = -_2612;
    float _2658 = fma(_2656, _2646, _2640);
    float _2660 = fma(_2586, _1890, _2650);
    float _2662 = fma(_2586, _1888, _2654);
    float _2664 = _2108 + _2404;
    float _2666 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2668 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2670 = -_2142;
    float _2672 = _2632 * _2670;
    float _2674 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2676 = _2666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2678 = _2668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2680 = _1736 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2682 = -_2424;
    float _2684 = fma(_2384, _2682, _2630);
    float _2686 = fma(_2586, _1892, _2672);
    float _2688 = _2110 + _2398;
    float _2690 = _2674 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2692 = fma(_2370, _2428, _2644);
    float _2694 = fma(_2360, _2436, _2658);
    float _2696 = _2142 + _2406;
    out.m_80.x = _2660;
    out.m_80.y = _2662;
    out.m_80.z = _2686;
    float _2698 = _2370;
    if (!_2606)
    {
        _2698 = 1.0;
    }
    float _2700 = _2698;
    out.m_82.x = _2690;
    out.m_82.y = _2676;
    out.m_82.z = _2678;
    out.m_82.w = _2680;
    out.m_84.x = _2636;
    out.m_84.y = _2692;
    out.m_84.z = _2684;
    out.m_84.w = _2694;
    out.m_86.x = _2688;
    out.m_86.y = _2664;
    out.m_86.z = _2696;
    bool _2702 = !_2606;
    float _2704 = _2700;
    if (!_2702)
    {
        bool _2706 = _2418 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2708 = isnan(_2418);
        bool _2710 = _2706 || _2708;
        bool _2712 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2714 = _2710 || _2712;
        if (!_2714)
        {
            float _2716 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2718 = _2418 + _2716;
            float _2720 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2722 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2720;
            float _2724 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2728 = 1.0 / _2722;
            float _2730 = _2718 * _2728;
            float _2732 = fma(_2730, _2726, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2704 = _2732;
            _2734 = true;
        }
        else
        {
            bool _2736 = _2418 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2738 = isnan(_2418);
            bool _2740 = _2736 || _2738;
            bool _2742 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2744 = _2740 || _2742;
            if (!_2744)
            {
                float _2746 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2748 = _2418 + _2746;
                float _2750 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2752 = _2750 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2754 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2756 = _2754 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2758 = 1.0 / _2752;
                float _2760 = _2748 * _2758;
                float _2762 = fma(_2760, _2756, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2704 = _2762;
                _2734 = true;
            }
            else
            {
                _2704 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2734 = false;
    float _2764 = _2704;
    float _2766 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2768 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2770 = floor(_2766);
    float _2772 = floor(_2768);
    float _2774 = -_2770;
    float _2776 = _2766 + _2774;
    float _2778 = -_2772;
    float _2780 = _2768 + _2778;
    float2 _8400 = float2(_2776, _2780);
    float _2782 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8400, float2(0.0), isnan(_8400)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8400, float2(0.0), isnan(_8400)), level(0.0)).x;
    float _2784 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2786 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2788 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2790 = _2318 + _2788;
    float _2792 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2784);
    float _2794 = _1410 + _2786;
    float _2796 = fma(_2790, _2764, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2798 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2792);
    float _2800 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2802 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2804 = _2798 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2806 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2800);
    float _2808 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2802);
    float _2810 = 1.0 / _2804;
    float _2812 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2806);
    float _2814 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2808);
    float _2816 = _2812 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2818 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2820 = _2816 + _2804;
    float _2822 = trunc(_2818);
    int _2824 = int(_2822);
    float _2826 = _2820 * _2810;
    float _2828 = _2826 * 0.5;
    float _2830 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2832 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2830);
    float _2834 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2836 = _2320 + _2834;
    float _2838 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2840 = _2312 + _2838;
    float _2842 = fma(_2836, _2764, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2844 = 1.0 / _2832;
    float _2846 = fma(_2840, _2764, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    int _2848 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2850 = _2824 + _2848;
    int _2852 = _2850 + 1;
    float _2854 = -_1996;
    float _2856 = _2854 + _2842;
    float _2858 = -_1410;
    float _2860 = _2858 + _2846;
    float _2862 = _2860 * _2860;
    float _2864 = fma(_2856, _2856, _2862);
    float _2866 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2868 = _2844 * _2866;
    float _2870 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _2872 = _2868 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2874 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2870);
    bool _2876 = _2868 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2878 = !_2872;
    int _2880 = _2878 ? 0 : 1;
    float _2882 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2874);
    float _2884 = _2882 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _2886 = 2;
    float _2888 = _2846;
    float _2890 = _2796;
    float _2892 = _2860;
    float _2894 = _2842;
    if (!_2872)
    {
        _2886 = 1;
    }
    int _2896 = _2886;
    float _2898 = trunc(_2884);
    int _2900 = int(_2898);
    int _2902 = _2896;
    if (!_2876)
    {
        _2902 = _2880;
    }
    int _2904 = _2902;
    bool _2906 = _2852 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2908 = _2904 << 6;
    int _2910 = _2908 + 96;
    uint _2912 = uint(int(uint(_2910) >> uint(2)));
    uint _2914 = uint(int(uint(int(_2912)) >> uint(2)));
    int _2916 = int(_2912) & 3;
    float _2918 = (*spvDescriptorSet0.vp_c15)._m0[int(_2914)][_2916];
    int _2920 = int(_2912) + 1;
    uint _2922 = uint(int(uint(_2920) >> uint(2)));
    int _2924 = _2920 & 3;
    float _2926 = (*spvDescriptorSet0.vp_c15)._m0[int(_2922)][_2924];
    int _2928 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2930 = _2900 + _2928;
    int _2932 = _2930 + 1;
    int _2934 = _2908 + 104;
    uint _2936 = uint(int(uint(_2934) >> uint(2)));
    uint _2938 = uint(int(uint(int(_2936)) >> uint(2)));
    int _2940 = int(_2936) & 3;
    float _2942 = (*spvDescriptorSet0.vp_c15)._m0[int(_2938)][_2940];
    int _2944 = int(_2936) + 1;
    uint _2946 = uint(int(uint(_2944) >> uint(2)));
    int _2948 = _2944 & 3;
    float _2950 = (*spvDescriptorSet0.vp_c15)._m0[int(_2946)][_2948];
    float _2952 = -_2084;
    float _2954 = _2952 + _2796;
    int _2956 = _2852 | _2932;
    float _2958 = fma(_2954, _2954, _2864);
    bool _2960 = _2956 < 0;
    bool _2962 = _2960 || _2906;
    int _2964 = _2908 + 48;
    uint _2966 = uint(int(uint(_2964) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c15)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c15)._m0[int(_2976)][_2978];
    float _2982 = sqrt(_2958);
    bool _2984 = _2932 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2986 = _2984 || _2962;
    int _2988 = _2908 + 64;
    uint _2990 = uint(int(uint(_2988) >> uint(2)));
    uint _2992 = uint(int(uint(int(_2990)) >> uint(2)));
    int _2994 = int(_2990) & 3;
    float _2996 = (*spvDescriptorSet0.vp_c15)._m0[int(_2992)][_2994];
    int _2998 = int(_2990) + 1;
    uint _3000 = uint(int(uint(_2998) >> uint(2)));
    int _3002 = _2998 & 3;
    float _3004 = (*spvDescriptorSet0.vp_c15)._m0[int(_3000)][_3002];
    int _3006 = _2908 + 56;
    uint _3008 = uint(int(uint(_3006) >> uint(2)));
    uint _3010 = uint(int(uint(int(_3008)) >> uint(2)));
    int _3012 = int(_3008) & 3;
    float _3014 = (*spvDescriptorSet0.vp_c15)._m0[int(_3010)][_3012];
    int _3016 = int(_3008) + 1;
    uint _3018 = uint(int(uint(_3016) >> uint(2)));
    int _3020 = _3016 & 3;
    float _3022 = (*spvDescriptorSet0.vp_c15)._m0[int(_3018)][_3020];
    bool _3024 = _2982 > 0.0;
    int _3026 = _2908 + 72;
    uint _3028 = uint(int(uint(_3026) >> uint(2)));
    uint _3030 = uint(int(uint(int(_3028)) >> uint(2)));
    int _3032 = int(_3028) & 3;
    float _3034 = (*spvDescriptorSet0.vp_c15)._m0[int(_3030)][_3032];
    int _3036 = int(_3028) + 1;
    uint _3038 = uint(int(uint(_3036) >> uint(2)));
    int _3040 = _3036 & 3;
    float _3042 = (*spvDescriptorSet0.vp_c15)._m0[int(_3038)][_3040];
    int _3044 = _2908 + 80;
    uint _3046 = uint(int(uint(_3044) >> uint(2)));
    uint _3048 = uint(int(uint(int(_3046)) >> uint(2)));
    int _3050 = int(_3046) & 3;
    float _3052 = (*spvDescriptorSet0.vp_c15)._m0[int(_3048)][_3050];
    int _3054 = int(_3046) + 1;
    uint _3056 = uint(int(uint(_3054) >> uint(2)));
    int _3058 = _3054 & 3;
    float _3060 = (*spvDescriptorSet0.vp_c15)._m0[int(_3056)][_3058];
    float _3062 = _2794 * _2926;
    float _3064 = _2926;
    float _3066 = as_type<float>(_2904);
    if (!_2986)
    {
        float _3068 = floor(_2818);
        _3064 = _3068;
    }
    float _3070 = _3064;
    float _3072 = fma(_1996, _2918, _3062);
    float _3074 = fma(_2084, _2942, _3072);
    float _3076 = _3074 + _2950;
    float _3078 = 1.0 / _3076;
    bool _3080 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3082 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3084 = _3080 || _3082;
    bool _3086 = isnan(0.5);
    bool _3088 = _3084 || _3086;
    float _3090 = _2794 * _2980;
    int _3092 = as_type<int>(_2980);
    float _3094 = _3090;
    int _3096 = as_type<int>(_2972);
    float _3098 = _3076;
    if (!_2986)
    {
        int _3100 = _2932 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3102 = _3100 + _2852;
        _3092 = _3102;
    }
    int _3104 = _3092;
    float _3106 = fma(_1996, _2972, _3090);
    float _3108 = _2794 * _3004;
    if (!_3024)
    {
        _3094 = _2842;
    }
    float _3110 = _3094;
    float _3112 = fma(_1996, _2996, _3108);
    bool _3114 = !_3024;
    float _3116 = _3110;
    float _3118 = _3070;
    if (!_3114)
    {
        float _3120 = _213 * _213;
        float _3122 = rsqrt(_2958);
        float _3124 = fma(_211, _211, _3120);
        float _3126 = fma(_215, _215, _3124);
        float _3128 = sqrt(_3126);
        float _3130 = _2856 * _3122;
        float _3132 = _2860 * _3122;
        float _3134 = _2954 * _3122;
        bool _3136 = _3128 > 0.0;
        float _3138 = _3128;
        _3096 = as_type<int>(_3126);
        _3098 = _3122;
        _2892 = _3132;
        if (!_3136)
        {
            _3138 = _2842;
        }
        float _3140 = _3138;
        bool _3142 = !_3136;
        _3116 = _3140;
        if (!_3142)
        {
            float _3144 = rsqrt(_3126);
            float _3146 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3148 = _213 * _3144;
            float _3150 = _211 * _3144;
            float _3152 = _3132 * _3148;
            float _3154 = _215 * _3144;
            float _3156 = fma(_3130, _3150, _3152);
            float _3158 = _3146 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3160 = fma(_3134, _3154, _3156);
            float _3162 = _3160 * _3158;
            float _3164 = fma(_211, _3162, _2842);
            float _3166 = fma(_213, _3162, _2846);
            float _3168 = fma(_215, _3162, _2796);
            _2888 = _3166;
            _3096 = as_type<int>(_3144);
            _2890 = _3168;
            _3116 = _3164;
            _3098 = _3154;
        }
    }
    float _3170 = _2888;
    int _3172 = _3096;
    float _3174 = _2890;
    float _3176 = _3116;
    float _3178 = _3098;
    float _3180 = _2892;
    int _3182 = _3172;
    float _3184 = _3178;
    float _3186 = _3176;
    float _3188 = _3180;
    if (!_2986)
    {
        int _3190 = _3104 << 2;
        _3182 = _3190;
    }
    int _3192 = _3182;
    float _3194 = fma(_2084, _3014, _3106);
    float _3196 = fma(_2084, _3034, _3112);
    int _3198 = _3192;
    if (_3088)
    {
        _3184 = _3170;
    }
    float _3200 = _3184;
    float _3202 = _3200;
    if (!_2986)
    {
        uint _3204 = uint(int(uint(_3104) >> uint(2)));
        _219 = int(_3204);
    }
    int _3206 = _219;
    if (!_2986)
    {
        int _3208 = 12 & _3192;
        _3198 = _3208;
    }
    int _3210 = _3198;
    if (_3088)
    {
        _2894 = _3174;
    }
    float _3212 = _2894;
    float _3214 = _3212;
    if (!_3088)
    {
        float _3216 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3218 = _1410 + _3216;
        float _3220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3222 = _1996 + _3220;
        float _3224 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3226 = -_1996;
        float _3228 = _3226 + _3176;
        float _3230 = _3218 * _3218;
        float _3232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3234 = _2084 + _3232;
        float _3236 = -_2084;
        float _3238 = _3236 + _3174;
        float _3240 = fma(_3222, _3222, _3230);
        float _3242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3244 = fma(_3234, _3234, _3240);
        float _3246 = sqrt(_3244);
        float _3248 = _3224 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3250 = precise::min(_3246, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3252 = _3250 * _3242;
        float _3254 = -_1410;
        float _3256 = _3254 + _3170;
        float _3258 = _3248 * _3252;
        float _3260 = fma(_3256, _3258, _1410);
        float _3262 = fma(_3228, _3258, _1996);
        float _3264 = fma(_3238, _3258, _2084);
        _3202 = _3260;
        _3186 = _3262;
        _3214 = _3264;
    }
    float _3266 = _3202;
    float _3268 = _3186;
    float _3270 = _3214;
    if (!_2986)
    {
        int _3272 = _3206 << 4;
        int _3274 = _3272 + _3210;
        _3188 = as_type<float>(_3274);
    }
    float _3276 = _3188;
    int _3278 = _2908 + 88;
    uint _3280 = uint(int(uint(_3278) >> uint(2)));
    uint _3282 = uint(int(uint(int(_3280)) >> uint(2)));
    int _3284 = int(_3280) & 3;
    float _3286 = (*spvDescriptorSet0.vp_c15)._m0[int(_3282)][_3284];
    int _3288 = int(_3280) + 1;
    uint _3290 = uint(int(uint(_3288) >> uint(2)));
    int _3292 = _3288 & 3;
    float _3294 = (*spvDescriptorSet0.vp_c15)._m0[int(_3290)][_3292];
    float _3296 = _3194 + _3022;
    float _3298 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3300 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3302 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3304 = _3296 * _3078;
    float _3306 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3298);
    float _3308 = _3196 + _3042;
    float _3310 = _3276;
    float _3312 = _3304;
    if (!_2986)
    {
        int _3314 = as_type<int>(_3276) + 400;
        uint _3316 = uint(int(uint(_3314) >> uint(2)));
        uint _3318 = uint(int(uint(int(_3316)) >> uint(2)));
        int _3320 = int(_3316) & 3;
        float _3322 = (*spvDescriptorSet0.vp_c15)._m0[int(_3318)][_3320];
        _3310 = _3322;
    }
    float _3324 = _3310;
    float _3326 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3300);
    float _3328 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3306);
    bool _3330 = _3304 >= 0.0;
    float _3332 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3302);
    float _3334 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3336 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3326);
    float _3338 = _3328 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3340 = _3308 * _3078;
    bool _3342 = _3304 <= 1.0;
    bool _3344 = _3342 && _3330;
    float _3346 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3332);
    float _3348 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3334);
    float _3350 = _3336 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3352 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3354 = _3340 >= 0.0;
    bool _3356 = _3354 && _3344;
    float _3358 = _3346 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3360 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3348);
    float _3362 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3352);
    bool _3364 = _3340 <= 1.0;
    bool _3366 = _3364 && _3356;
    float _3368 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3370 = _3358 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3372 = _3360 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3374 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3362);
    float _3376 = _3196;
    float _3378 = _3372;
    if (!_2986)
    {
        float _3380 = floor(_2884);
        _3376 = _3380;
    }
    float _3382 = _3376;
    float _3384 = -_3370;
    float _3386 = fma(_3384, _3368, 1.0);
    float _3388 = _2794 * _3060;
    float _3390 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3374);
    float _3392 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3394 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3396 = fma(_1996, _3052, _3388);
    float _3398 = log2(_3386);
    float _3400 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3392);
    float _3402 = _3392;
    if (_3366)
    {
        float _3404 = float(_2904);
        _3402 = _3404;
    }
    float _3406 = _3402;
    float _3408 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3394);
    float _3410 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3400);
    float _3412 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3408);
    float _3414 = 1.0 / _3390;
    float _3416 = fma(_2084, _3286, _3396);
    float _3418 = _3294;
    if (!_2986)
    {
        float _3420 = -_3382;
        float _3422 = _2884 + _3420;
        _3066 = _3422;
    }
    float _3424 = _3066;
    float _3426 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3410);
    float _3428 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3412);
    float _3430 = _3416 + _3294;
    if (!_2986)
    {
        float _3432 = -_3070;
        float _3434 = _2818 + _3432;
        _3418 = _3434;
    }
    float _3436 = _3418;
    float _3438 = _3406;
    if (_3366)
    {
        float _3440 = rint(_3406);
        float _3442 = precise::max(_3440, 0.0);
        uint _3444 = uint(_3442);
        uint _3446 = clamp(_3444, 0u, 65535u);
        _3438 = as_type<float>(_3446);
    }
    float _3448 = _3438;
    float _3450 = _3398 * 0.693147182464599609375;
    float _3452 = _3430 * _3078;
    float _3454 = _3450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3456 = _3416;
    float _3458 = _3454;
    if (!_2986)
    {
        float _3460 = rint(_3324);
        float _3462 = precise::max(_3460, 0.0);
        uint _3464 = uint(_3462);
        uint _3466 = clamp(_3464, 0u, 65535u);
        _3456 = as_type<float>(_3466);
    }
    float _3468 = _3456;
    float _3470 = _3426 * _3414;
    float _3472 = _3428 * _3414;
    float _3474 = fma(_3470, 0.5, 0.5);
    float _3476 = fma(_3472, -0.5, 0.5);
    float _3478 = _3340;
    if (_3366)
    {
        float3 _9566 = float3(_3304, _3340, float(as_type<int>(_3448)));
        float3 _9570 = select(_9566, float3(0.0), isnan(_9566));
        float _3480 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9570.xy, uint(rint(_9570.z)), _3452, level(0.0));
        _3478 = _3480;
    }
    float _3482 = _3478;
    float3 _9580 = float3(_3474, _3476, _3454);
    float _3484 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9580, float3(0.0), isnan(_9580)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9580, float3(0.0), isnan(_9580)), level(0.0)).x;
    float3 _9589 = float3(_3474, _3476, _3454);
    float4 _3487 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9589, float3(0.0), isnan(_9589)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9589, float3(0.0), isnan(_9589)), level(0.0)).xyzw;
    float _3489 = _3487.x;
    float _3491 = _3487.y;
    float _3493 = _3487.z;
    float _3495 = _3487.w;
    float _3497 = _3424;
    if (!_2986)
    {
        float3 _9612 = float3(_3436, _3424, float(as_type<int>(_3468)));
        float3 _9614 = select(_9612, float3(0.0), isnan(_9612));
        float _3499 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9614.xy, uint(rint(_9614.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9614.xy, uint(rint(_9614.z)), level(0.0)).x;
        _3497 = _3499;
    }
    float _3501 = _3497;
    if (_2986)
    {
        _3118 = 1.0;
    }
    float _3503 = _3118;
    float _3505 = _3503;
    float _3507 = _3491;
    float _3509 = _3489;
    if (!_2986)
    {
        int _3511 = _3104 << 4;
        int _3513 = _3511 + 2048;
        uint _3515 = uint(int(uint(_3513) >> uint(2)));
        uint _3517 = uint(int(uint(int(_3515)) >> uint(2)));
        int _3519 = int(_3515) & 3;
        float _3521 = (*spvDescriptorSet0.vp_c15)._m0[int(_3517)][_3519];
        int _3523 = int(_3515) + 1;
        uint _3525 = uint(int(uint(_3523) >> uint(2)));
        int _3527 = _3523 & 3;
        float _3529 = (*spvDescriptorSet0.vp_c15)._m0[int(_3525)][_3527];
        int _3531 = _3513 + 8;
        uint _3533 = uint(int(uint(_3531) >> uint(2)));
        uint _3535 = uint(int(uint(int(_3533)) >> uint(2)));
        int _3537 = int(_3533) & 3;
        float _3539 = (*spvDescriptorSet0.vp_c15)._m0[int(_3535)][_3537];
        int _3541 = int(_3533) + 1;
        uint _3543 = uint(int(uint(_3541) >> uint(2)));
        int _3545 = _3541 & 3;
        float _3547 = (*spvDescriptorSet0.vp_c15)._m0[int(_3543)][_3545];
        float _3549 = _2794 * _3529;
        float _3551 = fma(_1996, _3521, _3549);
        float _3553 = fma(_2084, _3539, _3551);
        float _3555 = _3553 + _3547;
        float _3557 = precise::clamp(_3555, 0.0, 1.0);
        float _3559 = -_3557;
        float _3561 = _3559 + _3501;
        float _3563 = fma(_3561, 500.0, 1.5);
        float _3565 = exp2(_3563);
        float _3567 = 0.0 + _3565;
        float _3569 = precise::clamp(_3567, 0.0, 1.0);
        _3312 = _3529;
        _3505 = _3569;
    }
    float _3571 = _3312;
    float _3573 = _3505;
    float _3575 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3577 = _3266 + _3575;
    float _3579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3581 = _3268 + _3579;
    float _3583 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3585 = _3270 + _3583;
    float _3587 = _3577 * _3577;
    float _3589 = fma(_3581, _3581, _3587);
    float _3591 = fma(_3585, _3585, _3589);
    float _3593 = rsqrt(_3591);
    float _3595 = _3593 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3597 = _3581 * _3595;
    float _3599 = _3585 * _3595;
    float _3601 = _3597 * _3597;
    float _3603 = _3599 * _3599;
    float _3605 = _3601 + _3603;
    float _3607 = sqrt(_3605);
    bool _3609 = _3607 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3611 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3613 = _3607 + _3611;
    float _3615 = _3593;
    float _3617 = _3613;
    float _3619 = _3571;
    float _3621 = _3577;
    if (_3609)
    {
        float _3623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3615 = _3623;
    }
    float _3625 = _3615;
    float _3627 = _3625;
    if (_3609)
    {
        float _3629 = _3613 * _3625;
        _3617 = _3629;
    }
    float _3631 = _3617;
    if (_3609)
    {
        float _3633 = rsqrt(_3605);
        _3627 = _3633;
    }
    float _3635 = _3627;
    float _3637 = _3635;
    if (_3609)
    {
        float _3639 = _3631 * 0.15915493667125701904296875;
        _3619 = _3639;
    }
    float _3641 = _3619;
    float _3643 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3645 = _3585;
    float _3647 = _3641;
    if (_3609)
    {
        float _3649 = _3641 * 6.283185482025146484375;
        float _3651 = sin(_3649);
        _3645 = _3651;
    }
    float _3653 = _3645;
    float _3655 = precise::max(0.0, _3643);
    float _3657 = _2818;
    float _3659 = _3655;
    if (_3609)
    {
        float _3661 = _3641 * 6.283185482025146484375;
        float _3663 = cos(_3661);
        _3657 = _3663;
    }
    float _3665 = _3657;
    float _3667 = -_3595;
    float _3669 = -_3655;
    float _3671 = fma(_3577, _3667, _3669);
    if (_3609)
    {
        float _3673 = _3671 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3621 = _3673;
    }
    float _3675 = _3621;
    float _3677 = _3653;
    float _3679 = _3675;
    if (_3609)
    {
        float _3681 = fma(_3653, _3675, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3677 = _3681;
    }
    float _3683 = _3677;
    float _3685 = _3683;
    if (!_3609)
    {
        _3679 = _3671;
    }
    float _3687 = _3679;
    float _3689 = _3687;
    if (!_3609)
    {
        _3647 = _3601;
    }
    float _3691 = _3647;
    float _3693 = _3691;
    if (_3609)
    {
        float _3695 = _3635 * _3683;
        _3458 = _3695;
    }
    float _3697 = _3458;
    if (!_3609)
    {
        _3637 = _3597;
    }
    float _3699 = _3637;
    float _3701 = _3699;
    float _3703 = _3665;
    if (_3609)
    {
        float _3705 = _3665 + (-1.0);
        _3659 = _3705;
    }
    float _3707 = _3659;
    float _3709 = _3707;
    if (_3609)
    {
        float _3711 = _3597 * _3697;
        _3701 = _3711;
    }
    float _3713 = _3701;
    if (!_3609)
    {
        _3685 = _3599;
    }
    float _3715 = _3685;
    float _3717 = _3715;
    if (_3609)
    {
        float _3719 = _3599 * _3697;
        _3717 = _3719;
    }
    float _3721 = _3717;
    if (_3609)
    {
        float _3723 = _3707 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3709 = _3723;
    }
    float _3725 = _3709;
    if (_3609)
    {
        float _3727 = _3713 * _3713;
        _3693 = _3727;
    }
    float _3729 = _3693;
    if (_3609)
    {
        float _3731 = fma(_3671, _3665, _3725);
        _3689 = _3731;
    }
    float _3733 = _3689;
    if (!_3609)
    {
        _3703 = _3603;
    }
    float _3735 = _3703;
    float _3737 = _3735;
    if (_3609)
    {
        float _3739 = _3721 * _3721;
        _3737 = _3739;
    }
    float _3741 = _3737;
    float _3743 = sqrt(_3591);
    float _3745 = fma(_3733, _3733, _3729);
    float _3747 = _3745 + _3741;
    float _3749 = rsqrt(_3747);
    float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3753 = fma(_3743, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3751);
    float _3755 = precise::clamp(_3753, 0.0, 1.0);
    float _3757 = -_3755;
    float _3759 = _3757 + 1.0;
    float _3761 = _3749 * _3733;
    float _3763 = _3749 * _3713;
    float _3765 = abs(_3759);
    float _3767 = log2(_3765);
    float _3769 = _3749 * _3721;
    float _3771 = _3763 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3773 = -_3771;
    float _3775 = fma(_3761, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3773);
    float _3777 = -_3769;
    float _3779 = fma(_3777, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3775);
    float _3781 = fma(_3779, -0.5, 0.5);
    float _3783 = _3767 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3785 = fma(_3779, 0.5, 0.5);
    float _3787 = _3761 + 1.0;
    float _3789 = exp2(_3783);
    float _3791 = fma(_3785, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3793 = fma(_3785, _3791, -0.212114393711090087890625);
    float _3795 = sqrt(_3781);
    float _3797 = fma(_3785, _3793, 1.570728778839111328125);
    float _3799 = -_3761;
    float _3801 = fma(_3789, _3787, _3799);
    float _3803 = fma(_3801, 0.5, 0.5);
    float _3805 = _3795 * 0.636619746685028076171875;
    float _3807 = -_3797;
    float _3809 = fma(_3805, _3807, 1.0);
    float2 _10089 = float2(_3809, _3803);
    float3 _3813 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10089, float2(0.0), isnan(_10089)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10089, float2(0.0), isnan(_10089)), level(0.0)).xyz;
    float _3815 = _3813.x;
    float _3817 = _3813.y;
    float _3819 = _3813.z;
    float _3821 = abs(_2868);
    float _3823 = log2(_3821);
    float _3825 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3827 = _3767 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3829 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3831 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3833 = _3829 || _3831;
    bool _3835 = isnan(0.5);
    bool _3837 = _3833 || _3835;
    float _3839 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3825);
    float _3841 = -_2782;
    float _3843 = _3841 + 1.0;
    out.m_88.x = _3268;
    out.m_88.y = _3266;
    out.m_88.z = _3270;
    float _3845 = exp2(_3827);
    float _3847 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3839);
    float _3849 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3847);
    float _3851 = _3823 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3853 = _3809;
    float _3855 = _3825;
    float _3857 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _3859 = _3839;
    if (!_3837)
    {
        _3853 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _3861 = _3853;
    if (!_3837)
    {
        float _3863 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3865 = _2868 + _3863;
        _3855 = _3865;
    }
    float _3867 = _3855;
    float _3869 = _3867;
    if (!_3837)
    {
        _3857 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _3871 = _3857;
    float _3873 = _3871;
    if (!_3837)
    {
        float _3875 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3877 = _2868 + _3875;
        _3378 = _3877;
    }
    float _3879 = _3378;
    float _3881 = exp2(_3851);
    bool _3883 = _2868 <= 8000.0;
    bool _3885 = isnan(_2868);
    bool _3887 = _3883 || _3885;
    bool _3889 = isnan(8000.0);
    bool _3891 = _3887 || _3889;
    float _3893 = float(_3891);
    out.gl_Position.x = _3426;
    out.gl_Position.y = _3428;
    out.gl_Position.z = _3849;
    out.gl_Position.w = _3390;
    if (!_3837)
    {
        float _3895 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3897 = _3871 + _3895;
        _3873 = _3897;
    }
    float _3899 = _3873;
    float _3901 = -_3845;
    float _3903 = _3901 + 1.0;
    if (_3837)
    {
        _3859 = 1.0;
    }
    float _3905 = _3859;
    float _3907 = _3903 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3909 = _3899;
    float _3911 = _3905;
    if (!_3837)
    {
        float _3913 = 1.0 / _3899;
        _3909 = _3913;
    }
    float _3915 = _3909;
    float _3917 = _3907 * _3484;
    float _3919 = fma(_3881, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3921 = precise::clamp(_3919, 0.0, 1.0);
    float _3923 = _3881;
    if (!_3837)
    {
        float _3925 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3927 = _3861 + _3925;
        _3923 = _3927;
    }
    float _3929 = _3923;
    float _3931 = fma(_3921, -2.0, 3.0);
    float _3933 = _3921 * _3921;
    float _3935 = _3603;
    float _3937 = _3933;
    if (!_3837)
    {
        float _3939 = 1.0 / _3929;
        _3935 = _3939;
    }
    float _3941 = _3935;
    float _3943 = _3933 * _3931;
    if (!_3837)
    {
        float _3945 = _3867 * _3915;
        float _3947 = precise::clamp(_3945, 0.0, 1.0);
        _3937 = _3947;
    }
    float _3949 = _3937;
    float _3951 = -_3943;
    float _3953 = _3951 + 1.0;
    if (_3837)
    {
        _3869 = 1.0;
    }
    float _3955 = _3869;
    float _3957 = _3849 + _3390;
    float _3959 = _3955;
    float _3961 = _3957;
    if (!_3837)
    {
        float _3963 = -_3949;
        float _3965 = _3963 + 1.0;
        _3959 = _3965;
    }
    float _3967 = _3959;
    float _3969 = fma(_3953, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3943);
    float _3971 = _3957 * 0.5;
    if (!_3366)
    {
        _3961 = 1.0;
    }
    float _3973 = _3961;
    float _3975 = _3893 * _3969;
    float _3977 = _3973;
    if (_3366)
    {
        bool _3979 = _3482 >= _3452;
        bool _3981 = isnan(_3482);
        bool _3983 = _3979 || _3981;
        bool _3985 = isnan(_3452);
        bool _3987 = _3983 || _3985;
        float _3989 = float(_3987);
        _3977 = _3989;
    }
    float _3991 = _3977;
    float _3993 = -_3907;
    float _3995 = _3993 + 1.0;
    out.m_90.z = _3971;
    out.m_90.w = _3390;
    float _3997 = _3975 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3999 = _3995;
    float _4001 = _3997;
    if (!_3837)
    {
        float _4003 = _3879 * _3941;
        float _4005 = precise::clamp(_4003, 0.0, 1.0);
        _3911 = _4005;
    }
    float _4007 = _3911;
    float _4009 = _3991 * _3573;
    bool _4011 = _3743 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4013 = isnan(_3743);
    bool _4015 = _4011 || _4013;
    bool _4017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4019 = _4015 || _4017;
    float _4021 = _3843 * _3997;
    float _4023 = precise::clamp(_4021, 0.0, 1.0);
    float _4025 = -_4023;
    float _4027 = fma(_4025, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4029 = _3495 * _3917;
    float _4031 = -_4009;
    float _4033 = fma(_4031, _4027, 1.0);
    float _4035 = precise::clamp(_4033, 0.0, 1.0);
    float _4037 = _3495 * _3995;
    float _4039 = _4035 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4041 = _4035;
    if (!_4019)
    {
        _3999 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4043 = _3999;
    float _4045 = _4043;
    float _4047 = _4043;
    if (!_4019)
    {
        _4001 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4049 = _4001;
    out.m_92.x = _4039;
    float _4051 = _4049;
    float _4053 = _4049;
    if (!_4019)
    {
        _4041 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4055 = _4041;
    float _4057 = _3819 * _3917;
    float _4059 = fma(_3815, _4029, _3489);
    float _4061 = fma(_3817, _4029, _3491);
    float _4063 = _4007 * _3967;
    float _4065 = fma(_3495, _4057, _3493);
    float _4067 = _4063;
    float _4069 = _4055;
    float _4071 = _4055;
    if (!_4019)
    {
        _3507 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4073 = _3507;
    float _4075 = _4063 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4077 = _4073;
    float _4079 = _4073;
    if (!_4019)
    {
        _3509 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4081 = _3509;
    out.m_94.x = _4059;
    out.m_94.y = _4061;
    out.m_94.z = _4065;
    out.m_94.w = _4037;
    float _4083 = _4081;
    float _4085 = _4081;
    if (!_4019)
    {
        _4067 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4087 = _4067;
    bool _4089 = !_4019;
    float _4091 = _4087;
    float _4093 = _4087;
    if (!_4089)
    {
        bool _4095 = _3743 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4097 = isnan(_3743);
        bool _4099 = _4095 || _4097;
        bool _4101 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4103 = _4099 || _4101;
        if (!_4103)
        {
            float _4105 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4107 = _3743 + _4105;
            float _4109 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4111 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4109;
            float _4113 = 1.0 / _4111;
            float _4115 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4117 = _4115 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4119 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4121 = _4119 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4123 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4127 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4129 = _4127 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4131 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4133 = _4131 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4135 = _4107 * _4113;
            float _4137 = precise::clamp(_4135, 0.0, 1.0);
            float _4139 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4141 = _4139 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4143 = fma(_4137, _4117, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4145 = fma(_4137, _4141, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4147 = fma(_4137, _4121, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4149 = fma(_4137, _4125, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4151 = fma(_4137, _4129, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4153 = fma(_4137, _4133, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4053 = _4145;
            _4085 = _4151;
            _4047 = _4143;
            _4079 = _4149;
            _4071 = _4147;
            _4093 = _4153;
            _4155 = true;
        }
        else
        {
            bool _4157 = _3743 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4159 = isnan(_3743);
            bool _4161 = _4157 || _4159;
            bool _4163 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4165 = _4161 || _4163;
            if (!_4165)
            {
                _4045 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4167 = _4045;
            _4047 = _4167;
            if (!_4165)
            {
                _4051 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4169 = _4051;
            _4053 = _4169;
            if (!_4165)
            {
                _4069 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4171 = _4069;
            _4071 = _4171;
            if (!_4165)
            {
                _4077 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4173 = _4077;
            _4079 = _4173;
            if (!_4165)
            {
                _4083 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4175 = _4083;
            _4085 = _4175;
            if (!_4165)
            {
                _4091 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4177 = _4091;
            bool _4179 = !_4165;
            _4093 = _4177;
            if (!_4179)
            {
                bool _4181 = _3743 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4183 = isnan(_3743);
                bool _4185 = _4181 || _4183;
                bool _4187 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4189 = _4185 || _4187;
                if (!_4189)
                {
                    float _4191 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4193 = _3743 + _4191;
                    float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4197 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4195;
                    float _4199 = 1.0 / _4197;
                    float _4201 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4203 = _4201 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4205 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4207 = _4205 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4209 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4211 = _4209 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4213 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4215 = _4213 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4217 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4219 = _4217 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4221 = _4193 * _4199;
                    float _4223 = precise::clamp(_4221, 0.0, 1.0);
                    float _4225 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4227 = _4225 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4229 = fma(_4223, _4203, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4231 = fma(_4223, _4227, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4233 = fma(_4223, _4207, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4235 = fma(_4223, _4211, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4237 = fma(_4223, _4215, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4239 = fma(_4223, _4219, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4053 = _4231;
                    _4085 = _4237;
                    _4047 = _4229;
                    _4079 = _4235;
                    _4071 = _4233;
                    _4093 = _4239;
                    _4155 = true;
                }
                else
                {
                    _4053 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4085 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4047 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4079 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4071 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4093 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4155 = false;
    float _4241 = _4053;
    float _4243 = _4085;
    float _4245 = _4047;
    float _4247 = _4079;
    float _4249 = _4071;
    float _4251 = _4093;
    float _4253 = fma(_2664, -0.5, 0.5);
    float _4255 = precise::clamp(_4253, 0.0, 1.0);
    float _4257 = -_4241;
    float _4259 = _4257 + _4243;
    float _4261 = _4075 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4263 = -_4245;
    float _4265 = _4263 + _4247;
    out.m_96.x = 0.0;
    float _4267 = fma(_4255, _4259, _4241);
    float _4269 = fma(_4255, _4265, _4245);
    out.m_61.x = _4261;
    float _4271 = -_4249;
    float _4273 = _4271 + _4251;
    float _4275 = _4267 * 0.586610972881317138671875;
    bool _4277 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4279 = fma(_4255, _4273, _4249);
    float _4281 = fma(_4269, 0.298911988735198974609375, _4275);
    bool _4283 = _4007 > 0.0;
    bool _4285 = isnan(_4007);
    bool _4287 = _4283 || _4285;
    bool _4289 = isnan(0.0);
    bool _4291 = _4287 || _4289;
    float _4293 = fma(_4279, 0.114477999508380889892578125, _4281);
    bool _4295 = _3967 <= 0.0;
    bool _4297 = !_4291;
    bool _4299 = _4295 || _4297;
    float _4301 = -_4293;
    float _4303 = _4269 + _4301;
    float _4305 = -_4293;
    float _4307 = _4267 + _4305;
    float _4309 = -_4293;
    float _4311 = _4279 + _4309;
    float _4313 = fma(_4303, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4293);
    float _4315 = fma(_4307, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4293);
    float _4317 = fma(_4311, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4293);
    bool _4319 = !_4277;
    if (!_4319)
    {
        float _4321 = -_3266;
        float _4323 = _4321 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4325 = -_3268;
        float _4327 = _4325 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4329 = -_3270;
        float _4331 = _4329 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4333 = _4323 * _4323;
        float _4335 = fma(_4327, _4327, _4333);
        float _4337 = fma(_4331, _4331, _4335);
        float _4339 = sqrt(_4337);
        float _4341 = rsqrt(_4337);
        float _4343 = -_4339;
        float _4345 = _4343 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4347 = _4345 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4349 = precise::clamp(_4347, 0.0, 1.0);
        float _4351 = _4327 * _4341;
        float _4353 = _4323 * _4341;
        float _4355 = abs(_4349);
        float _4357 = log2(_4355);
        float _4359 = _4331 * _4341;
        float _4361 = _4351 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4363 = _2664 * _4353;
        float _4365 = -_4353;
        float _4367 = -_4361;
        float _4369 = fma(_4365, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4367);
        float _4371 = fma(_2688, _4351, _4363);
        float _4373 = -_4359;
        float _4375 = fma(_4373, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4369);
        float _4377 = fma(_2696, _4359, _4371);
        float _4379 = precise::clamp(_4377, 0.0, 1.0);
        float _4381 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4383 = _4375 + _4381;
        float _4385 = _4357 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4387 = _4383 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4389 = precise::clamp(_4387, 0.0, 1.0);
        float _4391 = exp2(_4385);
        float _4393 = _4391 * _4389;
        float _4395 = _4379 * _4393;
        float _4397 = _4395 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4399 = _4395 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4401 = _4395 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _4397;
        out.m_96.y = _4399;
        out.m_96.z = _4401;
    }
    out.m_98.x = _4313;
    out.m_98.y = _4315;
    out.m_98.z = _4317;
    if (!_4299)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _4403 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4403;
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
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4155 = false;
    bool _2734 = false;
    bool _341 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_58.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_61.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4460 = as_type<float>(_133);
        out.gl_Position.z = _4460;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_63.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    float _155 = _151;
    if (_147)
    {
        float _157 = float(_117);
        _153 = _157;
    }
    float _159 = _153;
    bool _161 = _151 >= _159;
    bool _163 = !_147;
    bool _165 = _161 || _163;
    if (_165)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _127;
    if (_165)
    {
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4529 = as_type<float>(_171);
        out.gl_Position.z = _4529;
    }
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    float _175 = in.m_68.x;
    float _177 = in.m_68.y;
    float _179 = in.m_68.z;
    int _181 = as_type<int>(_173) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_173) & 2;
    bool _187 = _185 != 0;
    bool _189 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _191 = _177 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _193 = _177 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _195 = _177 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _197 = !_183;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].x, _191);
    float _203 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].x, _193);
    float _205 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].x, _195);
    bool _207 = !_187;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[4].z, _201);
    float _213 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[5].z, _203);
    float _215 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[6].z, _205);
    bool _217 = !_189;
    int _219 = as_type<int>(_215);
    float _237;
    if (!_217)
    {
        float _221 = in.m_70.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        float _241 = float(_117);
        float _243 = 1.0 / _241;
        float _245 = _151 * _243;
        _237 = _245;
    }
    _239 = false;
    float _247 = _237;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = _247 + _249;
    bool _253 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _255 = isnan(_247);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    float _269 = -_263;
    float _271 = _269 + 1.0;
    bool _273 = _247 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _275 = isnan(_247);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _291 = 1.0 / _267;
    float _293 = _283 * _271;
    float _295 = -_283;
    float _297 = _295 + 1.0;
    float _299 = _251 * _291;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _301;
    float _305 = fma(_287, _299, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _307 = fma(_303, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _309 = _305 * _293;
    float _311 = _307 * _293;
    float _313 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _315 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].y, _311);
    float _317 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].x, _313);
    float _319 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].y, _315);
    bool _321 = !_289;
    float _339;
    if (!_321)
    {
        float _323 = in.m_70.x;
        float _325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _327 = _323 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _331 = _329 * _325;
        float _333 = floor(_331);
        float _335 = -_333;
        float _337 = _331 + _335;
        _339 = _337;
        _341 = true;
    }
    else
    {
        float _343 = float(_117);
        float _345 = 1.0 / _343;
        float _347 = _151 * _345;
        _339 = _347;
    }
    _341 = false;
    float _349 = _339;
    float _351 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _353 = int(_351);
    float _355 = float(_117);
    int _357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _359 = _357 != 0;
    float _361 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _363 = int(_361);
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _375 = float(_353);
    float _377 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _379 = int(_377);
    float _381 = 0.0;
    int _383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_359)
    {
        float _385 = in.m_70.x;
        _381 = _385;
    }
    float _387 = _381;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _395 = _387;
    if (!_359)
    {
        float _397 = in.m_70.y;
        _395 = _397;
    }
    float _399 = _395;
    float _401 = float(_363);
    float _403 = 1.0 / _375;
    float _405 = float(uint(_379));
    float _407 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _409 = int(_407);
    int _411 = ~_379;
    int _413 = _411 + 1;
    bool _415 = _379 == 0;
    float _417 = 1.0 / _401;
    float _419 = _403 * _151;
    float _421 = float(uint(_409));
    float _423 = 1.0 / _405;
    int _425 = ~_409;
    int _427 = _425 + 1;
    float _429 = _417 * _151;
    float _431 = trunc(_419);
    int _433 = int(_431);
    float _435 = 1.0 / _421;
    int _437 = as_type<int>(_423) + (-2);
    float _439 = in.m_70.x;
    float _441 = in.m_70.y;
    float _443 = in.m_70.z;
    float _445 = in.m_70.w;
    float _447 = trunc(_429);
    int _449 = int(_447);
    float _451 = float(uint(_433));
    float _453 = float(_433);
    float _455 = as_type<float>(_437) * _451;
    int _457 = as_type<int>(_435) + (-2);
    float _459 = 1.0 / _355;
    float _461 = float(uint(_449));
    float _463 = trunc(_455);
    float _465 = precise::max(_463, 0.0);
    uint _468 = uint(_465);
    float _470 = _441 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _472 = _443 + _439;
    float _474 = as_type<float>(_457) * _461;
    float _476 = _461;
    if (_359)
    {
        _476 = 1.0;
    }
    float _478 = _476;
    float _480 = fma(_470, -2.0, _365);
    float _482 = _478;
    if (!_359)
    {
        _482 = 7.345489978790283203125;
    }
    float _484 = _482;
    float _486 = trunc(_474);
    float _488 = precise::max(_486, 0.0);
    uint _490 = uint(_488);
    float _492 = _459 * _151;
    float _494 = _472 + (-1.0);
    float _496 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _480);
    float _498 = _484 * _439;
    float _500 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _502 = _413 * int(_468);
    int _504 = _502 + _433;
    float _506 = float(_379);
    float _508 = 1.0 / _391;
    float _510 = float(uint(_504));
    int _512 = _427 * int(_490);
    int _514 = _512 + _449;
    float _516 = floor(_498);
    float _518 = float(uint(_514));
    float _520 = as_type<float>(_437) * _510;
    float _522 = _510;
    if (_359)
    {
        _522 = 1.0;
    }
    float _524 = _522;
    float _526 = _524;
    if (!_359)
    {
        _526 = 1.2345600128173828125;
    }
    float _528 = _526;
    float _530 = trunc(_520);
    float _532 = precise::max(_530, 0.0);
    uint _534 = uint(_532);
    float _536 = as_type<float>(_457) * _518;
    float _538 = _369 * _508;
    float _540 = _443 + _441;
    float _542 = _399 * _528;
    int _544 = ~_379;
    int _546 = _544 + 1;
    float _548 = _540 + (-1.0);
    float _550 = trunc(_536);
    float _552 = precise::max(_550, 0.0);
    uint _554 = uint(_552);
    float _556 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _558 = int(_468) + int(_534);
    float _560 = floor(_542);
    bool _562 = _453 >= _506;
    bool _564 = isnan(_453);
    bool _566 = _562 || _564;
    bool _568 = isnan(_506);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -_516;
    float _576 = _498 + _574;
    int _578 = _546 * _558;
    int _580 = _578 + _433;
    int _582 = int(_490) + int(_554);
    float _584 = _576 * _506;
    int _586 = ~_409;
    int _588 = _586 + 1;
    float _590 = trunc(_572);
    int _592 = int(_590);
    bool _594 = uint(_580) >= uint(_379);
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _598 = _596 != 0;
    int _600 = _588 * _582;
    int _602 = _600 + _449;
    bool _604 = !_594;
    int _606 = _604 ? 0 : (-1);
    float _608 = -_560;
    float _610 = _542 + _608;
    bool _612 = !_598;
    int _614 = _612 ? 0 : 1;
    float _616 = trunc(_584);
    int _618 = int(_616);
    int _620 = ~_558;
    int _622 = _620 + _606;
    int _624 = _622 + 1;
    bool _626 = uint(_602) >= uint(_409);
    int _628 = abs(_614);
    int _630 = _379 * _624;
    int _632 = _630 + _433;
    bool _634 = !_626;
    int _636 = _634 ? 0 : (-1);
    int _638 = ~_592;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    bool _644 = !_415;
    int _646 = _644 ? _632 : (-1);
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _650 = _648 != 0;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _658 = _656 != 0;
    int _660 = _618 * _628;
    int _662 = _660 + _433;
    int _664 = ~_582;
    int _666 = _664 + _636;
    int _668 = _666 + 1;
    float _670 = _506 * _492;
    float _672 = float(_409);
    int _674 = _646 * _642;
    float _676 = float(_449);
    float _678 = trunc(_670);
    int _680 = int(_678);
    bool _682 = !_654;
    int _684 = _682 ? 0 : 1;
    int _686 = _409 * _668;
    int _688 = _686 + _449;
    bool _690 = _676 >= _672;
    bool _692 = isnan(_676);
    bool _694 = _690 || _692;
    bool _696 = isnan(_672);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    bool _702 = !_650;
    int _704 = _702 ? 0 : 1;
    int _706 = _379 + (-1);
    int _708 = abs(_684);
    float _710 = _610 * _672;
    int _712 = abs(_704);
    float _714 = trunc(_700);
    int _716 = int(_714);
    int _718 = _592 * _706;
    int _720 = _718 + _674;
    bool _722 = !_658;
    int _724 = _722 ? 0 : 1;
    float _726 = _672 * _492;
    int _728 = _720 * _708;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _732 = _730 != 0;
    float _734 = trunc(_710);
    int _736 = int(_734);
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _740 = _738 != 0;
    int _742 = _680 * _712;
    int _744 = _742 + _728;
    int _746 = abs(_724);
    bool _748 = !_732;
    int _750 = _748 ? 0 : 1;
    bool _752 = !_740;
    int _754 = _752 ? 0 : 1;
    int _756 = _662 * _746;
    int _758 = _756 + _744;
    bool _760 = _409 == 0;
    float _762 = trunc(_726);
    int _764 = int(_762);
    int _766 = abs(_750);
    int _768 = abs(_754);
    int _770 = ~_716;
    int _772 = _770 + 1;
    int _774 = _772 + 1;
    int _776 = _736 * _766;
    int _778 = _776 + _449;
    bool _780 = !_760;
    int _782 = _780 ? _688 : (-1);
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _790 = _788 != 0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _794 = _792 != 0;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _798 = _796 != 0;
    int _800 = _409 + (-1);
    int _802 = _782 * _774;
    bool _804 = _379 == 0;
    int _806 = _618 * _768;
    int _808 = _806 + _758;
    bool _810 = !_790;
    int _812 = _810 ? 0 : 1;
    int _814 = _716 * _800;
    int _816 = _814 + _802;
    bool _818 = !_786;
    int _820 = _818 ? 0 : 1;
    float _822 = float(uint(_808));
    int _824 = abs(_812);
    bool _826 = !_794;
    int _828 = _826 ? 0 : 1;
    float _830 = as_type<float>(_437) * _822;
    int _832 = abs(_820);
    int _834 = _816 * _824;
    bool _836 = !_798;
    int _838 = _836 ? 0 : 1;
    int _840 = abs(_828);
    float _842 = trunc(_830);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    int _848 = abs(_838);
    int _850 = _764 * _832;
    int _852 = _850 + _834;
    int _854 = ~_379;
    int _856 = _854 + 1;
    int _858 = _778 * _840;
    int _860 = _858 + _852;
    int _862 = ~_409;
    int _864 = _862 + 1;
    float _866 = float(uint(_778));
    int _868 = _736 * _848;
    int _870 = _868 + _860;
    float _872 = float(uint(_662));
    float _874 = as_type<float>(_457) * _866;
    float _876 = float(uint(_870));
    int _878 = _856 * int(_846);
    int _880 = _878 + _808;
    int _882 = ~_379;
    int _884 = _882 + 1;
    float _886 = as_type<float>(_437) * _872;
    int _888 = ~_379;
    int _890 = _888 + 1;
    float _892 = as_type<float>(_457) * _876;
    float _894 = float(uint(_880));
    float _896 = trunc(_874);
    float _898 = precise::max(_896, 0.0);
    uint _900 = uint(_898);
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _904 = _902 != 0;
    int _906 = ~_409;
    int _908 = _906 + 1;
    float _910 = as_type<float>(_437) * _894;
    float _912 = trunc(_892);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    float _918 = as_type<float>(_712);
    if (_904)
    {
        _383 = 0;
    }
    int _920 = _383;
    float _922 = trunc(_910);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    int _928 = _920;
    if (!_904)
    {
        _928 = 1;
    }
    int _930 = _928;
    float _932 = trunc(_886);
    float _934 = precise::max(_932, 0.0);
    uint _936 = uint(_934);
    int _938 = _864 * int(_916);
    int _940 = _938 + _870;
    float _942 = float(uint(_940));
    int _944 = int(_846) + int(_926);
    float _946 = as_type<float>(_457) * _942;
    int _948 = ~_409;
    int _950 = _948 + 1;
    int _952 = _884 * _944;
    int _954 = _952 + _808;
    float _956 = trunc(_946);
    float _958 = precise::max(_956, 0.0);
    uint _960 = uint(_958);
    int _962 = _890 * int(_936);
    int _964 = _962 + _662;
    int _966 = _950 * int(_900);
    int _968 = _966 + _778;
    bool _970 = uint(_954) >= uint(_379);
    float _972 = float(uint(_964));
    float _974 = float(uint(_968));
    float _976 = _441 * 2.0;
    float _978 = as_type<float>(_437) * _972;
    bool _980 = !_970;
    int _982 = _980 ? 0 : (-1);
    float _984 = as_type<float>(_457) * _974;
    float _986 = trunc(_978);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    int _992 = ~_944;
    int _994 = _992 + _982;
    int _996 = _994 + 1;
    int _998 = ~_409;
    int _1000 = _998 + 1;
    int _1002 = int(_916) + int(_960);
    int _1004 = _379 * _996;
    int _1006 = _1004 + _808;
    float _1008 = floor(_976);
    bool _1010 = !_804;
    int _1012 = _1010 ? _1006 : (-1);
    int _1014 = _1000 * _1002;
    int _1016 = _1014 + _870;
    int _1018 = _1012 & 3;
    bool _1020 = _1018 != 0;
    bool _1022 = uint(_1016) >= uint(_409);
    bool _1024 = uint(_1018) >= 2u;
    bool _1026 = !_1022;
    int _1028 = _1026 ? 0 : (-1);
    int _1030 = _1024 ? 0 : 1;
    bool _1032 = _1018 != 3;
    int _1034 = int(_936) + int(_990);
    float _1036 = trunc(_984);
    float _1038 = precise::max(_1036, 0.0);
    uint _1040 = uint(_1038);
    int _1042 = _1012 & 3;
    bool _1044 = _1042 != 0;
    int _1046 = ~_1002;
    int _1048 = _1046 + _1028;
    int _1050 = _1048 + 1;
    int _1052 = _1044 ? 0 : 1;
    bool _1054 = uint(_1018) > 1u;
    int _1056 = _409 * _1050;
    int _1058 = _1056 + _870;
    int _1060 = ~_1030;
    int _1062 = _1060 + 1;
    int _1064 = _1062 + 1;
    float _1066 = _439 * 2.0;
    int _1068 = _1064;
    if (_1032)
    {
        int _1070 = ~_1030;
        int _1072 = _1070 + 1;
        _1068 = _1072;
    }
    int _1074 = _1068;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1078 = _1076 != 0;
    float _1080 = floor(_1066);
    bool _1082 = !_760;
    int _1084 = _1082 ? _1058 : (-1);
    int _1086 = ~_379;
    int _1088 = _1086 + 1;
    bool _1090 = !_1078;
    int _1092 = _1090 ? 0 : 1;
    int _1094 = int(_900) + int(_1040);
    int _1096 = _1088 * _1034;
    int _1098 = _1096 + _662;
    int _1100 = _1084 & 3;
    bool _1102 = _1100 != 0;
    int _1104 = ~_1052;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    int _1110 = _908 * _1094;
    int _1112 = _1110 + _778;
    int _1114 = _1108;
    if (!_1054)
    {
        int _1116 = ~_1052;
        int _1118 = _1116 + 1;
        _1114 = _1118;
    }
    int _1120 = _1114;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1124 = _1122 != 0;
    bool _1126 = _1100 != 3;
    bool _1128 = uint(_1098) >= uint(_379);
    bool _1130 = !_1124;
    int _1132 = _1130 ? 0 : 1;
    bool _1134 = uint(_1100) >= 2u;
    bool _1136 = !_1128;
    int _1138 = _1136 ? 0 : (-1);
    bool _1140 = uint(_1100) > 1u;
    int _1142 = _1134 ? 0 : 1;
    int _1144 = _1084 & 3;
    bool _1146 = _1144 != 0;
    int _1148 = ~_1142;
    int _1150 = _1148 + 1;
    int _1152 = _1150 + 1;
    int _1154 = _1152;
    if (_1126)
    {
        int _1156 = ~_1142;
        int _1158 = _1156 + 1;
        _1154 = _1158;
    }
    int _1160 = _1154;
    bool _1162 = _930 != 1;
    bool _1164 = _1080 > 0.0;
    int _1166 = _1146 ? 0 : 1;
    bool _1168 = _1080 >= 0.0;
    bool _1170 = isnan(_1080);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan(0.0);
    bool _1176 = _1172 || _1174;
    int _1178 = ~_1166;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    int _1184 = _1182;
    if (!_1140)
    {
        int _1186 = ~_1166;
        int _1188 = _1186 + 1;
        _1184 = _1188;
    }
    int _1190 = _1184;
    bool _1192 = uint(_1112) >= uint(_409);
    int _1194 = ~_1034;
    int _1196 = _1194 + _1138;
    int _1198 = _1196 + 1;
    int _1200 = _1176 ? 0 : 1;
    bool _1202 = !_1192;
    int _1204 = _1202 ? 0 : (-1);
    int _1206 = _379 * _1198;
    int _1208 = _1206 + _662;
    int _1210 = ~_1200;
    int _1212 = _1210 + 1;
    int _1214 = _1212 + 1;
    float _1216 = in.m_72.x;
    float _1218 = in.m_72.y;
    bool _1220 = _1008 > 0.0;
    int _1222 = _1214;
    if (!_1162)
    {
        _918 = _441;
    }
    float _1224 = _918;
    float _1226 = 0.0;
    float _1228 = _1224;
    if (!_1162)
    {
        _1226 = _441;
    }
    float _1230 = _1226;
    float _1232 = 0.0;
    float _1234 = _1230;
    if (!_1162)
    {
        _1232 = _443;
    }
    float _1236 = _1232;
    float _1238 = 0.0;
    float _1240 = _1236;
    if (!_1162)
    {
        _1238 = _443;
    }
    float _1242 = _1238;
    bool _1244 = _1008 >= 0.0;
    bool _1246 = isnan(_1008);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan(0.0);
    bool _1252 = _1248 || _1250;
    float _1254 = _1242;
    if (!_1164)
    {
        int _1256 = ~_1200;
        int _1258 = _1256 + 1;
        _1222 = _1258;
    }
    int _1260 = _1222;
    if (_1162)
    {
        _1228 = _439;
    }
    float _1262 = _1228;
    if (_1162)
    {
        _1234 = _439;
    }
    float _1264 = _1234;
    if (_1162)
    {
        _1240 = _441;
    }
    float _1266 = _1240;
    if (_1162)
    {
        _1254 = _441;
    }
    float _1268 = _1254;
    float _1270 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[83].z, _393);
    bool _1272 = _1018 != 3;
    float _1274 = _317 * _1216;
    bool _1276 = !_1020;
    int _1278 = _1276 ? 0 : 1;
    float _1280 = _319 * _1218;
    bool _1282 = _445 > 0.5;
    float _1284 = _439 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1286 = _1100 != 3;
    float _1288 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1290 = _1252 ? 0 : 1;
    bool _1292 = !_804;
    int _1294 = _1292 ? _1208 : (-1);
    bool _1296 = !_1272;
    int _1298 = _1296 ? 0 : (-1);
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1302 = _1300 != 0;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1306 = _1304 != 0;
    int _1308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1310 = _1308 != 0;
    float _1312 = in.m_58.x;
    float _1314 = in.m_58.y;
    float _1316 = in.m_58.z;
    bool _1318 = !_1286;
    int _1320 = _1318 ? 0 : (-1);
    int _1322 = ~_1290;
    int _1324 = _1322 + 1;
    int _1326 = _1324 + 1;
    int _1328 = _1326;
    if (!_1220)
    {
        int _1330 = ~_1290;
        int _1332 = _1330 + 1;
        _1328 = _1332;
    }
    int _1334 = _1328;
    int _1336 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1338 = _1336 != 0;
    float _1340 = _443 * 2.0;
    bool _1342 = !_1302;
    int _1344 = _1342 ? 0 : 1;
    float _1346 = floor(_1340);
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1350 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1352 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1354 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1356 = -_1348;
    float _1358 = fma(_1284, 2.0, _1356);
    float _1360 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1350);
    float _1362 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1352);
    float _1364 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1354);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1372 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1360);
    float _1374 = 1.0 / _1368;
    bool _1376 = _1346 >= 0.0;
    bool _1378 = isnan(_1346);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan(0.0);
    bool _1384 = _1380 || _1382;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1392 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1394 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1398 = !_1306;
    int _1400 = _1398 ? 0 : 1;
    float _1402 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1362);
    float _1404 = float(_1260);
    out.m_74.x = _1394;
    out.m_74.y = _1392;
    out.m_74.z = _1396;
    out.m_74.w = _1390;
    bool _1406 = !_1310;
    int _1408 = _1406 ? 0 : 1;
    float _1410 = _1402 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1412 = ~_1094;
    int _1414 = _1412 + _1204;
    int _1416 = _1414 + 1;
    float _1418 = _373 * _1374;
    int _1420 = _1384 ? 0 : 1;
    bool _1422 = _1346 > 0.0;
    float _1424 = _439 + _441;
    int _1426 = ~_1420;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    int _1432 = _409 * _1416;
    int _1434 = _1432 + _778;
    float _1436 = float(_1334);
    float _1438 = _1424 + (-1.0);
    bool _1440 = _409 == 0;
    float _1442 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1444 = log2(_1442);
    float _1446 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1448 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1452 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1456 = _1430;
    if (!_1422)
    {
        int _1458 = ~_1420;
        int _1460 = _1458 + 1;
        _1456 = _1460;
    }
    int _1462 = _1456;
    float _1464 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1450);
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1468 = fma(_1452, -2.0, _1454);
    bool _1470 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1472 = isnan(0.0);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1478 = _1474 || _1476;
    float _1480 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1464);
    float _1482 = -_1466;
    float _1484 = fma(_1448, 2.0, _1482);
    float _1486 = _1444 * _151;
    float _1488 = in.m_76.x;
    float _1490 = in.m_76.y;
    float _1492 = in.m_76.z;
    int _1494 = abs(_1400);
    float _1496 = exp2(_1486);
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1500 = 1.0 + _1498;
    int _1502 = abs(_1344);
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1506 = float(_1494);
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1510 = float(_1502);
    float _1512 = 1.0 / _1500;
    float _1514 = float(_1462);
    float _1516 = _1506 * _1404;
    float _1518 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1508);
    float _1520 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1504);
    float _1522 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1468);
    float _1524 = _1510 * _1514;
    float _1526 = -_151;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1358);
    float _1530 = -_1496;
    float _1532 = _1530 + 1.0;
    float _1534 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1518);
    float _1536 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1520);
    float _1538 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1270);
    float _1540 = -_151;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1484);
    float _1544 = _1478 ? _1532 : 0.0;
    float _1546 = _1524 * (-2.0);
    bool _1548 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1550 = isnan(1.0);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1556 = _1552 || _1554;
    float _1558 = _1516 * (-2.0);
    bool _1560 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1562 = isnan(_349);
    bool _1564 = _1560 || _1562;
    bool _1566 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1568 = _1564 || _1566;
    float _1570 = float(_1568);
    float _1572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    bool _1574 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1576 = isnan(_349);
    bool _1578 = _1574 || _1576;
    bool _1580 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1582 = _1578 || _1580;
    float _1584 = float(_1582);
    bool _1586 = !_1102;
    int _1588 = _1586 ? 0 : 1;
    int _1590 = abs(_1320);
    int _1592 = abs(_1588);
    int _1594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1596 = _1594 != 0;
    if (_1556)
    {
        float _1598 = _1544 * _1512;
        _155 = _1598;
    }
    float _1600 = _155;
    int _1602 = abs(_1408);
    float _1604 = fma(_1546, _1488, _1488);
    bool _1606 = _439 > 0.5;
    float _1608 = _439 + (-0.5);
    float _1610 = float(_1602);
    float _1612 = fma(_1446, _1546, _1446);
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1616 = _349 + _1614;
    float _1618 = fma(_1608, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1604);
    float _1620 = -_1570;
    float _1622 = _1620 + 1.0;
    float _1624 = _1610 * _1436;
    bool _1626 = !_1440;
    int _1628 = _1626 ? _1434 : (-1);
    float _1630 = fma(_1612, _1600, _1618);
    bool _1632 = _441 > 0.5;
    float _1634 = _441 + (-0.5);
    float _1636 = fma(_1558, _1490, _1490);
    float _1638 = _1624 * (-2.0);
    float _1640 = _1630 * 0.15915493667125701904296875;
    float _1642 = fma(_556, _1558, _556);
    float _1644 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1636);
    float _1646 = fma(_500, _1638, _500);
    float _1648 = fma(_1638, _1492, _1492);
    bool _1650 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1652 = isnan(_349);
    bool _1654 = _1650 || _1652;
    bool _1656 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1658 = _1654 || _1656;
    float _1660 = float(_1658);
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1664 = _349 + _1662;
    float _1666 = -_1584;
    float _1668 = _1666 + 1.0;
    float _1670 = fma(_1642, _1600, _1644);
    float _1672 = fma(_538, _1616, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1674 = _1584 * _1622;
    float _1676 = _443 + (-0.5);
    float _1678 = _1660 * _1668;
    float _1680 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1682 = _1012 >> 31;
    float _1684 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1648);
    int _1686 = _1084 >> 31;
    float _1688 = _1672 * _1678;
    int _1690 = _1682 & 3;
    float _1692 = _1670 * 0.15915493667125701904296875;
    int _1694 = _1686 & 3;
    float _1696 = fma(_1646, _1600, _1684);
    int _1698 = _1012 + _1690;
    float _1700 = _1640 * 6.283185482025146484375;
    float _1702 = sin(_1700);
    int _1704 = _1084 + _1694;
    float _1706 = -_1660;
    float _1708 = _1706 + 1.0;
    float _1710 = fma(_1418, _1664, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1712 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    int _1714 = _1704 >> 2;
    float _1716 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1688);
    float _1718 = _1680 * _1572;
    float _1720 = _1640 * 6.283185482025146484375;
    float _1722 = cos(_1720);
    int _1724 = _1714 << 4;
    int _1726 = _1724 + 512;
    float _1728 = fma(_1710, _1674, _1716);
    float _1730 = _1288 * _1712;
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1734 = _1732 != 0;
    float _1736 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1728);
    float _1738 = _1692 * 6.283185482025146484375;
    float _1740 = sin(_1738);
    float _1742 = _1696 * 0.15915493667125701904296875;
    float _1744 = _1692 * 6.283185482025146484375;
    float _1746 = cos(_1744);
    float _1748 = _1742 * 6.283185482025146484375;
    float _1750 = cos(_1748);
    int _1752 = _1698 >> 2;
    float _1754 = fma(_1316, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1364);
    float _1756 = _1702 * _1740;
    uint _1758 = uint(int(uint(_1726) >> uint(2)));
    uint _1760 = uint(int(uint(int(_1758)) >> uint(2)));
    int _1762 = int(_1758) & 3;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[int(_1760)][_1762];
    int _1766 = int(_1758) + 1;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    int _1770 = _1766 & 3;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[int(_1768)][_1770];
    int _1774 = _1752 << 4;
    int _1776 = _1774 + 368;
    float _1778 = _1742 * 6.283185482025146484375;
    float _1780 = sin(_1778);
    float _1782 = _1722 * _1746;
    float _1784 = _1702 * _1746;
    uint _1786 = uint(int(uint(_1776) >> uint(2)));
    uint _1788 = uint(int(uint(int(_1786)) >> uint(2)));
    int _1790 = int(_1786) & 3;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[int(_1788)][_1790];
    int _1794 = int(_1786) + 1;
    uint _1796 = uint(int(uint(_1794) >> uint(2)));
    int _1798 = _1794 & 3;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[int(_1796)][_1798];
    float _1802 = _1702 * _1750;
    float _1804 = _1722 * _1740;
    float _1806 = _1746 * _1750;
    float _1808 = _1722 * _1750;
    float _1810 = _1740 * _1750;
    float _1812 = _1802 * _1730;
    float _1814 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1816 = fma(_1780, _1782, _1756);
    float _1818 = fma(_1780, _1756, _1782);
    float _1820 = -_1804;
    float _1822 = fma(_1780, _1784, _1820);
    int _1824 = _1776 + 8;
    uint _1826 = uint(int(uint(_1824) >> uint(2)));
    uint _1828 = uint(int(uint(int(_1826)) >> uint(2)));
    int _1830 = int(_1826) & 3;
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[int(_1828)][_1830];
    int _1834 = int(_1826) + 1;
    uint _1836 = uint(int(uint(_1834) >> uint(2)));
    int _1838 = _1834 & 3;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[int(_1836)][_1838];
    float _1842 = -_1784;
    float _1844 = fma(_1780, _1804, _1842);
    float _1846 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1848 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1850 = -_1730;
    float _1852 = _1780 * _1850;
    float _1854 = _1808 * _1730;
    float _1856 = -_1780;
    float _1858 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1814);
    float _1860 = -_1780;
    float _1862 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1846);
    int _1864 = _1726 + 8;
    uint _1866 = uint(int(uint(_1864) >> uint(2)));
    uint _1868 = uint(int(uint(int(_1866)) >> uint(2)));
    int _1870 = int(_1866) & 3;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[int(_1868)][_1870];
    int _1874 = int(_1866) + 1;
    uint _1876 = uint(int(uint(_1874) >> uint(2)));
    int _1878 = _1874 & 3;
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[int(_1876)][_1878];
    float _1882 = -_1780;
    float _1884 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1848);
    float _1886 = fma(_1806, _1718, _1852);
    float _1888 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1858);
    float _1890 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1862);
    float _1892 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1884);
    int _1894 = abs(_1190);
    float _1896 = fma(_1816, _1718, _1854);
    int _1898 = abs(_1120);
    float _1900 = fma(_1822, _1718, _1812);
    int _1902 = abs(_1278);
    float _1904 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1906 = ~_1898;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    float _1912 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1914 = ~_1894;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    float _1920 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1922 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1904);
    float _1924 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1912);
    float _1926 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1928 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1920);
    int _1930 = ~_1902;
    int _1932 = _1930 + 1;
    int _1934 = _1932 + 1;
    float _1936 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1938 = _1910 * as_type<int>(_1800);
    int _1940 = _1918 * as_type<int>(_1772);
    int _1942 = _1934 * as_type<int>(_1792);
    int _1944 = _1942 + _1938;
    int _1946 = abs(_1074);
    int _1948 = abs(_1160);
    int _1950 = ~_1592;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    float _1956 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1958 = int(_1956);
    int _1960 = _1954 * as_type<int>(_1764);
    int _1962 = _1960 + _1940;
    int _1964 = abs(_1298);
    float _1966 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1926);
    int _1968 = ~_1946;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    int _1974 = ~_1948;
    int _1976 = _1974 + 1;
    int _1978 = _1976 + 1;
    int _1980 = _1972 * as_type<int>(_1832);
    int _1982 = _1980 + _1944;
    int _1984 = abs(_1132);
    int _1986 = _1978 * as_type<int>(_1872);
    int _1988 = _1986 + _1962;
    int _1990 = ~_1964;
    int _1992 = _1990 + 1;
    int _1994 = _1992 + 1;
    float _1996 = _1372 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1998 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2000 = int(_1998);
    int _2002 = abs(_1092);
    int _2004 = _1994 * as_type<int>(_1840);
    int _2006 = _2004 + _1982;
    int _2008 = ~_1590;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    float _2014 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2016 = fma(_1844, _2014, _1896);
    int _2018 = ~_1984;
    int _2020 = _2018 + 1;
    int _2022 = _2020 + 1;
    int _2024 = _2012 * as_type<int>(_1880);
    int _2026 = _2024 + _1988;
    float _2028 = fma(_1810, _2014, _1886);
    float _2030 = float(uint(_1958));
    float _2032 = _2016 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2034 = ~_2002;
    int _2036 = _2034 + 1;
    int _2038 = _2036 + 1;
    int _2040 = _2026 * _2022;
    float _2042 = fma(_1818, _2014, _1900);
    float _2044 = _2016 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2046 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2032);
    float _2048 = 1.0 / _2030;
    int _2050 = _2006 * _2038;
    float _2052 = float(uint(_2000));
    float _2054 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2044);
    float _2056 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2046);
    int _2058 = abs(_2000);
    int _2060 = _1294 * _2002;
    int _2062 = _2060 + _2050;
    int _2064 = abs(_1958);
    float _2066 = 1.0 / _2052;
    float _2068 = _2056 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2070 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2072 = float(uint(_2064));
    int _2074 = _1628 * _1984;
    int _2076 = _2074 + _2040;
    float _2078 = float(uint(_2058));
    float _2080 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2054);
    int _2082 = as_type<int>(_2048) + (-2);
    float _2084 = _1754 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2086 = float(uint(_2062));
    float _2088 = 1.0 / _2072;
    float _2090 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2070);
    float _2092 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1936);
    float _2094 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2096 = as_type<float>(_2082) * _2086;
    int _2098 = as_type<int>(_2066) + (-2);
    float _2100 = _2084 + _2068;
    float _2102 = float(uint(_2076));
    float _2104 = 1.0 / _2078;
    float _2106 = _1996 + _2094;
    float _2108 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1966);
    float _2110 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2090);
    float _2112 = as_type<float>(_2098) * _2102;
    int _2114 = abs(_2076);
    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2118 = _2106 + _2116;
    float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2122 = _2100 + _2120;
    float _2124 = trunc(_2096);
    float _2126 = precise::max(_2124, 0.0);
    uint _2128 = uint(_2126);
    int _2130 = abs(_2062);
    float _2132 = _2016 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2134 = float(uint(_2114));
    float _2136 = _2118 * _2118;
    float _2138 = _2122 * _2122;
    int _2140 = as_type<int>(_2088) + (-2);
    float _2142 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2092);
    float _2144 = trunc(_2112);
    float _2146 = precise::max(_2144, 0.0);
    uint _2148 = uint(_2146);
    int _2150 = as_type<int>(_2104) + (-2);
    float _2152 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2132);
    float _2154 = float(uint(_2130));
    float _2156 = _2136 + _2138;
    int _2158 = ~_1958;
    int _2160 = _2158 + 1;
    float _2162 = as_type<float>(_2150) * _2134;
    int _2164 = ~_2000;
    int _2166 = _2164 + 1;
    float _2168 = as_type<float>(_2140) * _2154;
    float _2170 = sqrt(_2156);
    int _2172 = _2160 * int(_2128);
    int _2174 = _2172 + _2062;
    float _2176 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2152);
    int _2178 = ~_2064;
    int _2180 = _2178 + 1;
    float _2182 = float(uint(_2174));
    float _2184 = _2176 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2186 = trunc(_2168);
    float _2188 = precise::max(_2186, 0.0);
    uint _2190 = uint(_2188);
    float _2192 = as_type<float>(_2082) * _2182;
    float _2194 = trunc(_2162);
    float _2196 = precise::max(_2194, 0.0);
    uint _2198 = uint(_2196);
    bool _2200 = _2170 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2202 = -_209;
    int _2204 = _1282 ? as_type<int>(_2202) : as_type<int>(_209);
    int _2206 = _2166 * int(_2148);
    int _2208 = _2206 + _2076;
    bool _2210 = _443 > 0.5;
    int _2212 = _2180 * int(_2190);
    int _2214 = _2212 + _2130;
    float _2216 = float(uint(_2208));
    int _2218 = ~_2058;
    int _2220 = _2218 + 1;
    float _2222 = float(uint(_2214));
    float _2224 = as_type<float>(_2098) * _2216;
    float _2226 = _1410 + _2184;
    int _2228 = _2220 * int(_2198);
    int _2230 = _2228 + _2114;
    float _2232 = _2184;
    float _2234 = _2136;
    float _2236 = _2106;
    float _2238 = _2138;
    float _2240 = _2100;
    if (!_2200)
    {
        _2232 = _2136;
    }
    float _2242 = _2232;
    float _2244 = trunc(_2192);
    float _2246 = precise::max(_2244, 0.0);
    uint _2248 = uint(_2246);
    float _2250 = _2242;
    if (!_2200)
    {
        _2234 = _2106;
    }
    float _2252 = _2234;
    float _2254 = _2252;
    if (!_2200)
    {
        _2236 = _2226;
    }
    float _2256 = _2236;
    float _2258 = float(uint(_2230));
    bool _2260 = !_2200;
    float _2262 = _2256;
    if (!_2260)
    {
        float _2264 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2268 = _2170 + _2266;
        float _2270 = _2226 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2272 = rsqrt(_2156);
        float _2274 = _2268 * _2264;
        float _2276 = _2274 * 0.15915493667125701904296875;
        float _2278 = _2276 * 6.283185482025146484375;
        float _2280 = sin(_2278);
        float _2282 = _2276 * 6.283185482025146484375;
        float _2284 = cos(_2282);
        float _2286 = fma(_2280, _2270, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2288 = _2272 * _2286;
        float _2290 = fma(_2118, _2288, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2292 = _2284 + (-1.0);
        float _2294 = fma(_2122, _2288, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2298 = _2290 + _2296;
        float _2300 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2304 = _2294 + _2302;
        float _2306 = _2298 * _2298;
        float _2308 = fma(_2226, _2284, _2300);
        float _2310 = _2304 * _2304;
        _2262 = _2308;
        _2250 = _2306;
        _2238 = _2310;
        _2240 = _2294;
        _2254 = _2290;
    }
    float _2312 = _2262;
    float _2314 = _2250;
    float _2316 = _2238;
    float _2318 = _2240;
    float _2320 = _2254;
    float _2322 = as_type<float>(_2140) * _2222;
    float _2324 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1924);
    float _2326 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1922);
    float _2328 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1928);
    float _2330 = -_209;
    int _2332 = _1632 ? as_type<int>(_2330) : as_type<int>(_209);
    float _2334 = trunc(_2322);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    int _2340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2342 = _2340 != 0;
    float _2344 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2346 = -_199;
    int _2348 = _1606 ? as_type<int>(_2346) : as_type<int>(_199);
    float _2350 = as_type<float>(_2150) * _2258;
    float _2352 = -_199;
    int _2354 = _2210 ? as_type<int>(_2352) : as_type<int>(_199);
    float _2356 = _2344 * _1892;
    bool _2358 = !_1596;
    float _2360 = _2358 ? _209 : as_type<float>(_2204);
    float _2362 = trunc(_2224);
    float _2364 = precise::max(_2362, 0.0);
    uint _2366 = uint(_2364);
    bool _2368 = !_2342;
    float _2370 = _2368 ? _209 : as_type<float>(_2332);
    float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2374 = _2312 + _2372;
    bool _2376 = !_1338;
    float _2378 = _2376 ? _199 : as_type<float>(_2348);
    float _2380 = _2344 * _1890;
    bool _2382 = !_1734;
    float _2384 = _2382 ? _199 : as_type<float>(_2354);
    float _2386 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2388 = fma(_2374, _2374, _2314);
    float _2390 = trunc(_2350);
    float _2392 = precise::max(_2390, 0.0);
    uint _2394 = uint(_2392);
    float _2396 = _2344 * _1888;
    float _2398 = fma(_2386, _2326, _2380);
    int _2400 = int(_2190) + int(_2338);
    float _2402 = _2388 + _2316;
    float _2404 = fma(_2386, _2324, _2396);
    float _2406 = fma(_2386, _2328, _2356);
    int _2408 = int(_2128) + int(_2248);
    float _2410 = -_1534;
    float _2412 = _2410 + 1.0;
    int _2414 = ~_1958;
    int _2416 = _2414 + 1;
    float _2418 = sqrt(_2402);
    int _2420 = int(_2148) + int(_2366);
    float _2422 = -_1538;
    float _2424 = _2422 + 1.0;
    float _2426 = -_1536;
    float _2428 = _2426 + 1.0;
    int _2430 = ~_2000;
    int _2432 = _2430 + 1;
    float _2434 = -_1480;
    float _2436 = _2434 + 1.0;
    int _2438 = ~_2064;
    int _2440 = _2438 + 1;
    int _2442 = _2416 * _2408;
    int _2444 = _2442 + _2062;
    int _2446 = ~_2058;
    int _2448 = _2446 + 1;
    int _2450 = _2432 * _2420;
    int _2452 = _2450 + _2076;
    int _2454 = int(_2198) + int(_2394);
    int _2456 = _2440 * _2400;
    int _2458 = _2456 + _2130;
    bool _2460 = uint(_2444) >= uint(_1958);
    out.m_78.x = _2326;
    out.m_78.y = _2324;
    out.m_78.z = _2328;
    bool _2462 = uint(_2452) >= uint(_2000);
    float _2464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2466 = !_2460;
    int _2468 = _2466 ? 0 : (-1);
    int _2470 = _2448 * _2454;
    int _2472 = _2470 + _2114;
    bool _2474 = uint(_2458) >= uint(_2064);
    bool _2476 = !_2462;
    int _2478 = _2476 ? 0 : (-1);
    int _2480 = ~_2408;
    int _2482 = _2480 + _2468;
    int _2484 = _2482 + 1;
    float _2486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2488 = uint(_2472) >= uint(_2058);
    int _2490 = ~_2420;
    int _2492 = _2490 + _2478;
    int _2494 = _2492 + 1;
    int _2496 = _1958 * _2484;
    int _2498 = _2496 + _2062;
    int _2500 = _2062 ^ _1958;
    int _2502 = _2076 ^ _2000;
    int _2504 = _2000 * _2494;
    int _2506 = _2504 + _2076;
    bool _2508 = _1958 == 0;
    float _2510 = _2464 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2512 = _1958 == 0;
    float _2514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2516 = !_2474;
    int _2518 = _2516 ? 0 : (-1);
    uint _2520 = uint(int(uint(_2500) >> uint(31)));
    float _2522 = _2486 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2524 = !_2488;
    int _2526 = _2524 ? 0 : (-1);
    uint _2528 = uint(int(uint(_2502) >> uint(31)));
    bool _2530 = !_2508;
    int _2532 = _2530 ? _2498 : (-1);
    int _2534 = ~_2518;
    int _2536 = _2400 + _2534;
    int _2538 = _2536 + 1;
    float _2540 = fma(_2344, _2344, 1.0);
    int _2542 = ~int(_2520);
    int _2544 = _2542 + 1;
    int _2546 = ~_2526;
    int _2548 = _2454 + _2546;
    int _2550 = _2548 + 1;
    int _2552 = ~int(_2528);
    int _2554 = _2552 + 1;
    bool _2556 = _2000 == 0;
    float _2558 = float(_2532);
    bool _2560 = _2000 == 0;
    int _2562 = _2538 ^ _2544;
    float _2564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2566 = _2550 ^ _2554;
    float _2568 = fma(_2510, _2558, _1528);
    bool _2570 = !_2556;
    int _2572 = _2570 ? _2506 : (-1);
    int _2574 = ~_2544;
    int _2576 = _2574 + _2562;
    int _2578 = _2576 + 1;
    int _2580 = ~_2554;
    int _2582 = _2580 + _2566;
    int _2584 = _2582 + 1;
    float _2586 = rsqrt(_2540);
    float _2588 = float(_2572);
    float _2590 = _2514 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2592 = !_2512;
    int _2594 = _2592 ? _2578 : (-1);
    float _2596 = _2378 + 0.5;
    bool _2598 = _2418 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2600 = isnan(_2418);
    bool _2602 = _2598 || _2600;
    bool _2604 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2606 = _2602 || _2604;
    float _2608 = fma(_2590, _2588, _1542);
    float _2610 = float(_2594);
    float _2612 = _2564 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2614 = !_2560;
    int _2616 = _2614 ? _2584 : (-1);
    float _2618 = fma(_2510, _2596, _2568);
    float _2620 = _2384 + 0.5;
    float _2622 = -_496;
    float _2624 = fma(_2522, _2610, _2622);
    float _2626 = float(_2616);
    float _2628 = _2370 + (-0.5);
    float _2630 = fma(_2590, _2620, _2608);
    float _2632 = _2344 * _2586;
    float _2634 = -_2412;
    float _2636 = fma(_2378, _2634, _2618);
    float _2638 = -_1522;
    float _2640 = fma(_2612, _2626, _2638);
    float _2642 = -_2522;
    float _2644 = fma(_2642, _2628, _2624);
    float _2646 = _2360 + (-0.5);
    float _2648 = -_2110;
    float _2650 = _2632 * _2648;
    float _2652 = -_2108;
    float _2654 = _2632 * _2652;
    float _2656 = -_2612;
    float _2658 = fma(_2656, _2646, _2640);
    float _2660 = fma(_2586, _1890, _2650);
    float _2662 = fma(_2586, _1888, _2654);
    float _2664 = _2108 + _2404;
    float _2666 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2668 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2670 = -_2142;
    float _2672 = _2632 * _2670;
    float _2674 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2676 = _2666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2678 = _2668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2680 = _1736 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2682 = -_2424;
    float _2684 = fma(_2384, _2682, _2630);
    float _2686 = fma(_2586, _1892, _2672);
    float _2688 = _2110 + _2398;
    float _2690 = _2674 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2692 = fma(_2370, _2428, _2644);
    float _2694 = fma(_2360, _2436, _2658);
    float _2696 = _2142 + _2406;
    out.m_80.x = _2660;
    out.m_80.y = _2662;
    out.m_80.z = _2686;
    float _2698 = _2370;
    if (!_2606)
    {
        _2698 = 1.0;
    }
    float _2700 = _2698;
    out.m_82.x = _2690;
    out.m_82.y = _2676;
    out.m_82.z = _2678;
    out.m_82.w = _2680;
    out.m_84.x = _2636;
    out.m_84.y = _2692;
    out.m_84.z = _2684;
    out.m_84.w = _2694;
    out.m_86.x = _2688;
    out.m_86.y = _2664;
    out.m_86.z = _2696;
    bool _2702 = !_2606;
    float _2704 = _2700;
    if (!_2702)
    {
        bool _2706 = _2418 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2708 = isnan(_2418);
        bool _2710 = _2706 || _2708;
        bool _2712 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2714 = _2710 || _2712;
        if (!_2714)
        {
            float _2716 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2718 = _2418 + _2716;
            float _2720 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2722 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2720;
            float _2724 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2728 = 1.0 / _2722;
            float _2730 = _2718 * _2728;
            float _2732 = fma(_2730, _2726, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2704 = _2732;
            _2734 = true;
        }
        else
        {
            bool _2736 = _2418 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2738 = isnan(_2418);
            bool _2740 = _2736 || _2738;
            bool _2742 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2744 = _2740 || _2742;
            if (!_2744)
            {
                float _2746 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2748 = _2418 + _2746;
                float _2750 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2752 = _2750 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2754 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2756 = _2754 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2758 = 1.0 / _2752;
                float _2760 = _2748 * _2758;
                float _2762 = fma(_2760, _2756, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2704 = _2762;
                _2734 = true;
            }
            else
            {
                _2704 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2734 = false;
    float _2764 = _2704;
    float _2766 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2768 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2770 = floor(_2766);
    float _2772 = floor(_2768);
    float _2774 = -_2770;
    float _2776 = _2766 + _2774;
    float _2778 = -_2772;
    float _2780 = _2768 + _2778;
    float2 _8400 = float2(_2776, _2780);
    float _2782 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8400, float2(0.0), isnan(_8400)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8400, float2(0.0), isnan(_8400)), level(0.0)).x;
    float _2784 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2786 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2788 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2790 = _2318 + _2788;
    float _2792 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2784);
    float _2794 = _1410 + _2786;
    float _2796 = fma(_2790, _2764, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2798 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2792);
    float _2800 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2802 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2804 = _2798 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2806 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2800);
    float _2808 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2802);
    float _2810 = 1.0 / _2804;
    float _2812 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2806);
    float _2814 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2808);
    float _2816 = _2812 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2818 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2820 = _2816 + _2804;
    float _2822 = trunc(_2818);
    int _2824 = int(_2822);
    float _2826 = _2820 * _2810;
    float _2828 = _2826 * 0.5;
    float _2830 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2832 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2830);
    float _2834 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2836 = _2320 + _2834;
    float _2838 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2840 = _2312 + _2838;
    float _2842 = fma(_2836, _2764, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2844 = 1.0 / _2832;
    float _2846 = fma(_2840, _2764, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    int _2848 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2850 = _2824 + _2848;
    int _2852 = _2850 + 1;
    float _2854 = -_1996;
    float _2856 = _2854 + _2842;
    float _2858 = -_1410;
    float _2860 = _2858 + _2846;
    float _2862 = _2860 * _2860;
    float _2864 = fma(_2856, _2856, _2862);
    float _2866 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2868 = _2844 * _2866;
    float _2870 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _2872 = _2868 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2874 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2870);
    bool _2876 = _2868 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2878 = !_2872;
    int _2880 = _2878 ? 0 : 1;
    float _2882 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2874);
    float _2884 = _2882 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _2886 = 2;
    float _2888 = _2846;
    float _2890 = _2796;
    float _2892 = _2860;
    float _2894 = _2842;
    if (!_2872)
    {
        _2886 = 1;
    }
    int _2896 = _2886;
    float _2898 = trunc(_2884);
    int _2900 = int(_2898);
    int _2902 = _2896;
    if (!_2876)
    {
        _2902 = _2880;
    }
    int _2904 = _2902;
    bool _2906 = _2852 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2908 = _2904 << 6;
    int _2910 = _2908 + 96;
    uint _2912 = uint(int(uint(_2910) >> uint(2)));
    uint _2914 = uint(int(uint(int(_2912)) >> uint(2)));
    int _2916 = int(_2912) & 3;
    float _2918 = (*spvDescriptorSet0.vp_c15)._m0[int(_2914)][_2916];
    int _2920 = int(_2912) + 1;
    uint _2922 = uint(int(uint(_2920) >> uint(2)));
    int _2924 = _2920 & 3;
    float _2926 = (*spvDescriptorSet0.vp_c15)._m0[int(_2922)][_2924];
    int _2928 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2930 = _2900 + _2928;
    int _2932 = _2930 + 1;
    int _2934 = _2908 + 104;
    uint _2936 = uint(int(uint(_2934) >> uint(2)));
    uint _2938 = uint(int(uint(int(_2936)) >> uint(2)));
    int _2940 = int(_2936) & 3;
    float _2942 = (*spvDescriptorSet0.vp_c15)._m0[int(_2938)][_2940];
    int _2944 = int(_2936) + 1;
    uint _2946 = uint(int(uint(_2944) >> uint(2)));
    int _2948 = _2944 & 3;
    float _2950 = (*spvDescriptorSet0.vp_c15)._m0[int(_2946)][_2948];
    float _2952 = -_2084;
    float _2954 = _2952 + _2796;
    int _2956 = _2852 | _2932;
    float _2958 = fma(_2954, _2954, _2864);
    bool _2960 = _2956 < 0;
    bool _2962 = _2960 || _2906;
    int _2964 = _2908 + 48;
    uint _2966 = uint(int(uint(_2964) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c15)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c15)._m0[int(_2976)][_2978];
    float _2982 = sqrt(_2958);
    bool _2984 = _2932 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2986 = _2984 || _2962;
    int _2988 = _2908 + 64;
    uint _2990 = uint(int(uint(_2988) >> uint(2)));
    uint _2992 = uint(int(uint(int(_2990)) >> uint(2)));
    int _2994 = int(_2990) & 3;
    float _2996 = (*spvDescriptorSet0.vp_c15)._m0[int(_2992)][_2994];
    int _2998 = int(_2990) + 1;
    uint _3000 = uint(int(uint(_2998) >> uint(2)));
    int _3002 = _2998 & 3;
    float _3004 = (*spvDescriptorSet0.vp_c15)._m0[int(_3000)][_3002];
    int _3006 = _2908 + 56;
    uint _3008 = uint(int(uint(_3006) >> uint(2)));
    uint _3010 = uint(int(uint(int(_3008)) >> uint(2)));
    int _3012 = int(_3008) & 3;
    float _3014 = (*spvDescriptorSet0.vp_c15)._m0[int(_3010)][_3012];
    int _3016 = int(_3008) + 1;
    uint _3018 = uint(int(uint(_3016) >> uint(2)));
    int _3020 = _3016 & 3;
    float _3022 = (*spvDescriptorSet0.vp_c15)._m0[int(_3018)][_3020];
    bool _3024 = _2982 > 0.0;
    int _3026 = _2908 + 72;
    uint _3028 = uint(int(uint(_3026) >> uint(2)));
    uint _3030 = uint(int(uint(int(_3028)) >> uint(2)));
    int _3032 = int(_3028) & 3;
    float _3034 = (*spvDescriptorSet0.vp_c15)._m0[int(_3030)][_3032];
    int _3036 = int(_3028) + 1;
    uint _3038 = uint(int(uint(_3036) >> uint(2)));
    int _3040 = _3036 & 3;
    float _3042 = (*spvDescriptorSet0.vp_c15)._m0[int(_3038)][_3040];
    int _3044 = _2908 + 80;
    uint _3046 = uint(int(uint(_3044) >> uint(2)));
    uint _3048 = uint(int(uint(int(_3046)) >> uint(2)));
    int _3050 = int(_3046) & 3;
    float _3052 = (*spvDescriptorSet0.vp_c15)._m0[int(_3048)][_3050];
    int _3054 = int(_3046) + 1;
    uint _3056 = uint(int(uint(_3054) >> uint(2)));
    int _3058 = _3054 & 3;
    float _3060 = (*spvDescriptorSet0.vp_c15)._m0[int(_3056)][_3058];
    float _3062 = _2794 * _2926;
    float _3064 = _2926;
    float _3066 = as_type<float>(_2904);
    if (!_2986)
    {
        float _3068 = floor(_2818);
        _3064 = _3068;
    }
    float _3070 = _3064;
    float _3072 = fma(_1996, _2918, _3062);
    float _3074 = fma(_2084, _2942, _3072);
    float _3076 = _3074 + _2950;
    float _3078 = 1.0 / _3076;
    bool _3080 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3082 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3084 = _3080 || _3082;
    bool _3086 = isnan(0.5);
    bool _3088 = _3084 || _3086;
    float _3090 = _2794 * _2980;
    int _3092 = as_type<int>(_2980);
    float _3094 = _3090;
    int _3096 = as_type<int>(_2972);
    float _3098 = _3076;
    if (!_2986)
    {
        int _3100 = _2932 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3102 = _3100 + _2852;
        _3092 = _3102;
    }
    int _3104 = _3092;
    float _3106 = fma(_1996, _2972, _3090);
    float _3108 = _2794 * _3004;
    if (!_3024)
    {
        _3094 = _2842;
    }
    float _3110 = _3094;
    float _3112 = fma(_1996, _2996, _3108);
    bool _3114 = !_3024;
    float _3116 = _3110;
    float _3118 = _3070;
    if (!_3114)
    {
        float _3120 = _213 * _213;
        float _3122 = rsqrt(_2958);
        float _3124 = fma(_211, _211, _3120);
        float _3126 = fma(_215, _215, _3124);
        float _3128 = sqrt(_3126);
        float _3130 = _2856 * _3122;
        float _3132 = _2860 * _3122;
        float _3134 = _2954 * _3122;
        bool _3136 = _3128 > 0.0;
        float _3138 = _3128;
        _3096 = as_type<int>(_3126);
        _3098 = _3122;
        _2892 = _3132;
        if (!_3136)
        {
            _3138 = _2842;
        }
        float _3140 = _3138;
        bool _3142 = !_3136;
        _3116 = _3140;
        if (!_3142)
        {
            float _3144 = rsqrt(_3126);
            float _3146 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3148 = _213 * _3144;
            float _3150 = _211 * _3144;
            float _3152 = _3132 * _3148;
            float _3154 = _215 * _3144;
            float _3156 = fma(_3130, _3150, _3152);
            float _3158 = _3146 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3160 = fma(_3134, _3154, _3156);
            float _3162 = _3160 * _3158;
            float _3164 = fma(_211, _3162, _2842);
            float _3166 = fma(_213, _3162, _2846);
            float _3168 = fma(_215, _3162, _2796);
            _2888 = _3166;
            _3096 = as_type<int>(_3144);
            _2890 = _3168;
            _3116 = _3164;
            _3098 = _3154;
        }
    }
    float _3170 = _2888;
    int _3172 = _3096;
    float _3174 = _2890;
    float _3176 = _3116;
    float _3178 = _3098;
    float _3180 = _2892;
    int _3182 = _3172;
    float _3184 = _3178;
    float _3186 = _3176;
    float _3188 = _3180;
    if (!_2986)
    {
        int _3190 = _3104 << 2;
        _3182 = _3190;
    }
    int _3192 = _3182;
    float _3194 = fma(_2084, _3014, _3106);
    float _3196 = fma(_2084, _3034, _3112);
    int _3198 = _3192;
    if (_3088)
    {
        _3184 = _3170;
    }
    float _3200 = _3184;
    float _3202 = _3200;
    if (!_2986)
    {
        uint _3204 = uint(int(uint(_3104) >> uint(2)));
        _219 = int(_3204);
    }
    int _3206 = _219;
    if (!_2986)
    {
        int _3208 = 12 & _3192;
        _3198 = _3208;
    }
    int _3210 = _3198;
    if (_3088)
    {
        _2894 = _3174;
    }
    float _3212 = _2894;
    float _3214 = _3212;
    if (!_3088)
    {
        float _3216 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3218 = _1410 + _3216;
        float _3220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3222 = _1996 + _3220;
        float _3224 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3226 = -_1996;
        float _3228 = _3226 + _3176;
        float _3230 = _3218 * _3218;
        float _3232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3234 = _2084 + _3232;
        float _3236 = -_2084;
        float _3238 = _3236 + _3174;
        float _3240 = fma(_3222, _3222, _3230);
        float _3242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3244 = fma(_3234, _3234, _3240);
        float _3246 = sqrt(_3244);
        float _3248 = _3224 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3250 = precise::min(_3246, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3252 = _3250 * _3242;
        float _3254 = -_1410;
        float _3256 = _3254 + _3170;
        float _3258 = _3248 * _3252;
        float _3260 = fma(_3256, _3258, _1410);
        float _3262 = fma(_3228, _3258, _1996);
        float _3264 = fma(_3238, _3258, _2084);
        _3202 = _3260;
        _3186 = _3262;
        _3214 = _3264;
    }
    float _3266 = _3202;
    float _3268 = _3186;
    float _3270 = _3214;
    if (!_2986)
    {
        int _3272 = _3206 << 4;
        int _3274 = _3272 + _3210;
        _3188 = as_type<float>(_3274);
    }
    float _3276 = _3188;
    int _3278 = _2908 + 88;
    uint _3280 = uint(int(uint(_3278) >> uint(2)));
    uint _3282 = uint(int(uint(int(_3280)) >> uint(2)));
    int _3284 = int(_3280) & 3;
    float _3286 = (*spvDescriptorSet0.vp_c15)._m0[int(_3282)][_3284];
    int _3288 = int(_3280) + 1;
    uint _3290 = uint(int(uint(_3288) >> uint(2)));
    int _3292 = _3288 & 3;
    float _3294 = (*spvDescriptorSet0.vp_c15)._m0[int(_3290)][_3292];
    float _3296 = _3194 + _3022;
    float _3298 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3300 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3302 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3304 = _3296 * _3078;
    float _3306 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3298);
    float _3308 = _3196 + _3042;
    float _3310 = _3276;
    float _3312 = _3304;
    if (!_2986)
    {
        int _3314 = as_type<int>(_3276) + 400;
        uint _3316 = uint(int(uint(_3314) >> uint(2)));
        uint _3318 = uint(int(uint(int(_3316)) >> uint(2)));
        int _3320 = int(_3316) & 3;
        float _3322 = (*spvDescriptorSet0.vp_c15)._m0[int(_3318)][_3320];
        _3310 = _3322;
    }
    float _3324 = _3310;
    float _3326 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3300);
    float _3328 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3306);
    bool _3330 = _3304 >= 0.0;
    float _3332 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3302);
    float _3334 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3336 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3326);
    float _3338 = _3328 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3340 = _3308 * _3078;
    bool _3342 = _3304 <= 1.0;
    bool _3344 = _3342 && _3330;
    float _3346 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3332);
    float _3348 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3334);
    float _3350 = _3336 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3352 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3354 = _3340 >= 0.0;
    bool _3356 = _3354 && _3344;
    float _3358 = _3346 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3360 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3348);
    float _3362 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3352);
    bool _3364 = _3340 <= 1.0;
    bool _3366 = _3364 && _3356;
    float _3368 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3370 = _3358 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3372 = _3360 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3374 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3362);
    float _3376 = _3196;
    float _3378 = _3372;
    if (!_2986)
    {
        float _3380 = floor(_2884);
        _3376 = _3380;
    }
    float _3382 = _3376;
    float _3384 = -_3370;
    float _3386 = fma(_3384, _3368, 1.0);
    float _3388 = _2794 * _3060;
    float _3390 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3374);
    float _3392 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3394 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3396 = fma(_1996, _3052, _3388);
    float _3398 = log2(_3386);
    float _3400 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3392);
    float _3402 = _3392;
    if (_3366)
    {
        float _3404 = float(_2904);
        _3402 = _3404;
    }
    float _3406 = _3402;
    float _3408 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3394);
    float _3410 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3400);
    float _3412 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3408);
    float _3414 = 1.0 / _3390;
    float _3416 = fma(_2084, _3286, _3396);
    float _3418 = _3294;
    if (!_2986)
    {
        float _3420 = -_3382;
        float _3422 = _2884 + _3420;
        _3066 = _3422;
    }
    float _3424 = _3066;
    float _3426 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3410);
    float _3428 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3412);
    float _3430 = _3416 + _3294;
    if (!_2986)
    {
        float _3432 = -_3070;
        float _3434 = _2818 + _3432;
        _3418 = _3434;
    }
    float _3436 = _3418;
    float _3438 = _3406;
    if (_3366)
    {
        float _3440 = rint(_3406);
        float _3442 = precise::max(_3440, 0.0);
        uint _3444 = uint(_3442);
        uint _3446 = clamp(_3444, 0u, 65535u);
        _3438 = as_type<float>(_3446);
    }
    float _3448 = _3438;
    float _3450 = _3398 * 0.693147182464599609375;
    float _3452 = _3430 * _3078;
    float _3454 = _3450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3456 = _3416;
    float _3458 = _3454;
    if (!_2986)
    {
        float _3460 = rint(_3324);
        float _3462 = precise::max(_3460, 0.0);
        uint _3464 = uint(_3462);
        uint _3466 = clamp(_3464, 0u, 65535u);
        _3456 = as_type<float>(_3466);
    }
    float _3468 = _3456;
    float _3470 = _3426 * _3414;
    float _3472 = _3428 * _3414;
    float _3474 = fma(_3470, 0.5, 0.5);
    float _3476 = fma(_3472, -0.5, 0.5);
    float _3478 = _3340;
    if (_3366)
    {
        float3 _9566 = float3(_3304, _3340, float(as_type<int>(_3448)));
        float3 _9570 = select(_9566, float3(0.0), isnan(_9566));
        float _3480 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9570.xy, uint(rint(_9570.z)), _3452, level(0.0));
        _3478 = _3480;
    }
    float _3482 = _3478;
    float3 _9580 = float3(_3474, _3476, _3454);
    float _3484 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9580, float3(0.0), isnan(_9580)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9580, float3(0.0), isnan(_9580)), level(0.0)).x;
    float3 _9589 = float3(_3474, _3476, _3454);
    float4 _3487 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9589, float3(0.0), isnan(_9589)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9589, float3(0.0), isnan(_9589)), level(0.0)).xyzw;
    float _3489 = _3487.x;
    float _3491 = _3487.y;
    float _3493 = _3487.z;
    float _3495 = _3487.w;
    float _3497 = _3424;
    if (!_2986)
    {
        float3 _9612 = float3(_3436, _3424, float(as_type<int>(_3468)));
        float3 _9614 = select(_9612, float3(0.0), isnan(_9612));
        float _3499 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9614.xy, uint(rint(_9614.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9614.xy, uint(rint(_9614.z)), level(0.0)).x;
        _3497 = _3499;
    }
    float _3501 = _3497;
    if (_2986)
    {
        _3118 = 1.0;
    }
    float _3503 = _3118;
    float _3505 = _3503;
    float _3507 = _3491;
    float _3509 = _3489;
    if (!_2986)
    {
        int _3511 = _3104 << 4;
        int _3513 = _3511 + 2048;
        uint _3515 = uint(int(uint(_3513) >> uint(2)));
        uint _3517 = uint(int(uint(int(_3515)) >> uint(2)));
        int _3519 = int(_3515) & 3;
        float _3521 = (*spvDescriptorSet0.vp_c15)._m0[int(_3517)][_3519];
        int _3523 = int(_3515) + 1;
        uint _3525 = uint(int(uint(_3523) >> uint(2)));
        int _3527 = _3523 & 3;
        float _3529 = (*spvDescriptorSet0.vp_c15)._m0[int(_3525)][_3527];
        int _3531 = _3513 + 8;
        uint _3533 = uint(int(uint(_3531) >> uint(2)));
        uint _3535 = uint(int(uint(int(_3533)) >> uint(2)));
        int _3537 = int(_3533) & 3;
        float _3539 = (*spvDescriptorSet0.vp_c15)._m0[int(_3535)][_3537];
        int _3541 = int(_3533) + 1;
        uint _3543 = uint(int(uint(_3541) >> uint(2)));
        int _3545 = _3541 & 3;
        float _3547 = (*spvDescriptorSet0.vp_c15)._m0[int(_3543)][_3545];
        float _3549 = _2794 * _3529;
        float _3551 = fma(_1996, _3521, _3549);
        float _3553 = fma(_2084, _3539, _3551);
        float _3555 = _3553 + _3547;
        float _3557 = precise::clamp(_3555, 0.0, 1.0);
        float _3559 = -_3557;
        float _3561 = _3559 + _3501;
        float _3563 = fma(_3561, 500.0, 1.5);
        float _3565 = exp2(_3563);
        float _3567 = 0.0 + _3565;
        float _3569 = precise::clamp(_3567, 0.0, 1.0);
        _3312 = _3529;
        _3505 = _3569;
    }
    float _3571 = _3312;
    float _3573 = _3505;
    float _3575 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3577 = _3266 + _3575;
    float _3579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3581 = _3268 + _3579;
    float _3583 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3585 = _3270 + _3583;
    float _3587 = _3577 * _3577;
    float _3589 = fma(_3581, _3581, _3587);
    float _3591 = fma(_3585, _3585, _3589);
    float _3593 = rsqrt(_3591);
    float _3595 = _3593 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3597 = _3581 * _3595;
    float _3599 = _3585 * _3595;
    float _3601 = _3597 * _3597;
    float _3603 = _3599 * _3599;
    float _3605 = _3601 + _3603;
    float _3607 = sqrt(_3605);
    bool _3609 = _3607 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3611 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3613 = _3607 + _3611;
    float _3615 = _3593;
    float _3617 = _3613;
    float _3619 = _3571;
    float _3621 = _3577;
    if (_3609)
    {
        float _3623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3615 = _3623;
    }
    float _3625 = _3615;
    float _3627 = _3625;
    if (_3609)
    {
        float _3629 = _3613 * _3625;
        _3617 = _3629;
    }
    float _3631 = _3617;
    if (_3609)
    {
        float _3633 = rsqrt(_3605);
        _3627 = _3633;
    }
    float _3635 = _3627;
    float _3637 = _3635;
    if (_3609)
    {
        float _3639 = _3631 * 0.15915493667125701904296875;
        _3619 = _3639;
    }
    float _3641 = _3619;
    float _3643 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3645 = _3585;
    float _3647 = _3641;
    if (_3609)
    {
        float _3649 = _3641 * 6.283185482025146484375;
        float _3651 = sin(_3649);
        _3645 = _3651;
    }
    float _3653 = _3645;
    float _3655 = precise::max(0.0, _3643);
    float _3657 = _2818;
    float _3659 = _3655;
    if (_3609)
    {
        float _3661 = _3641 * 6.283185482025146484375;
        float _3663 = cos(_3661);
        _3657 = _3663;
    }
    float _3665 = _3657;
    float _3667 = -_3595;
    float _3669 = -_3655;
    float _3671 = fma(_3577, _3667, _3669);
    if (_3609)
    {
        float _3673 = _3671 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3621 = _3673;
    }
    float _3675 = _3621;
    float _3677 = _3653;
    float _3679 = _3675;
    if (_3609)
    {
        float _3681 = fma(_3653, _3675, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3677 = _3681;
    }
    float _3683 = _3677;
    float _3685 = _3683;
    if (!_3609)
    {
        _3679 = _3671;
    }
    float _3687 = _3679;
    float _3689 = _3687;
    if (!_3609)
    {
        _3647 = _3601;
    }
    float _3691 = _3647;
    float _3693 = _3691;
    if (_3609)
    {
        float _3695 = _3635 * _3683;
        _3458 = _3695;
    }
    float _3697 = _3458;
    if (!_3609)
    {
        _3637 = _3597;
    }
    float _3699 = _3637;
    float _3701 = _3699;
    float _3703 = _3665;
    if (_3609)
    {
        float _3705 = _3665 + (-1.0);
        _3659 = _3705;
    }
    float _3707 = _3659;
    float _3709 = _3707;
    if (_3609)
    {
        float _3711 = _3597 * _3697;
        _3701 = _3711;
    }
    float _3713 = _3701;
    if (!_3609)
    {
        _3685 = _3599;
    }
    float _3715 = _3685;
    float _3717 = _3715;
    if (_3609)
    {
        float _3719 = _3599 * _3697;
        _3717 = _3719;
    }
    float _3721 = _3717;
    if (_3609)
    {
        float _3723 = _3707 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3709 = _3723;
    }
    float _3725 = _3709;
    if (_3609)
    {
        float _3727 = _3713 * _3713;
        _3693 = _3727;
    }
    float _3729 = _3693;
    if (_3609)
    {
        float _3731 = fma(_3671, _3665, _3725);
        _3689 = _3731;
    }
    float _3733 = _3689;
    if (!_3609)
    {
        _3703 = _3603;
    }
    float _3735 = _3703;
    float _3737 = _3735;
    if (_3609)
    {
        float _3739 = _3721 * _3721;
        _3737 = _3739;
    }
    float _3741 = _3737;
    float _3743 = sqrt(_3591);
    float _3745 = fma(_3733, _3733, _3729);
    float _3747 = _3745 + _3741;
    float _3749 = rsqrt(_3747);
    float _3751 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3753 = fma(_3743, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3751);
    float _3755 = precise::clamp(_3753, 0.0, 1.0);
    float _3757 = -_3755;
    float _3759 = _3757 + 1.0;
    float _3761 = _3749 * _3733;
    float _3763 = _3749 * _3713;
    float _3765 = abs(_3759);
    float _3767 = log2(_3765);
    float _3769 = _3749 * _3721;
    float _3771 = _3763 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3773 = -_3771;
    float _3775 = fma(_3761, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3773);
    float _3777 = -_3769;
    float _3779 = fma(_3777, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3775);
    float _3781 = fma(_3779, -0.5, 0.5);
    float _3783 = _3767 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3785 = fma(_3779, 0.5, 0.5);
    float _3787 = _3761 + 1.0;
    float _3789 = exp2(_3783);
    float _3791 = fma(_3785, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3793 = fma(_3785, _3791, -0.212114393711090087890625);
    float _3795 = sqrt(_3781);
    float _3797 = fma(_3785, _3793, 1.570728778839111328125);
    float _3799 = -_3761;
    float _3801 = fma(_3789, _3787, _3799);
    float _3803 = fma(_3801, 0.5, 0.5);
    float _3805 = _3795 * 0.636619746685028076171875;
    float _3807 = -_3797;
    float _3809 = fma(_3805, _3807, 1.0);
    float2 _10089 = float2(_3809, _3803);
    float3 _3813 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10089, float2(0.0), isnan(_10089)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10089, float2(0.0), isnan(_10089)), level(0.0)).xyz;
    float _3815 = _3813.x;
    float _3817 = _3813.y;
    float _3819 = _3813.z;
    float _3821 = abs(_2868);
    float _3823 = log2(_3821);
    float _3825 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3827 = _3767 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3829 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3831 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3833 = _3829 || _3831;
    bool _3835 = isnan(0.5);
    bool _3837 = _3833 || _3835;
    float _3839 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3825);
    float _3841 = -_2782;
    float _3843 = _3841 + 1.0;
    out.m_88.x = _3268;
    out.m_88.y = _3266;
    out.m_88.z = _3270;
    float _3845 = exp2(_3827);
    float _3847 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3839);
    float _3849 = fma(_3372, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3847);
    float _3851 = _3823 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3853 = _3809;
    float _3855 = _3825;
    float _3857 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _3859 = _3839;
    if (!_3837)
    {
        _3853 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _3861 = _3853;
    if (!_3837)
    {
        float _3863 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3865 = _2868 + _3863;
        _3855 = _3865;
    }
    float _3867 = _3855;
    float _3869 = _3867;
    if (!_3837)
    {
        _3857 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _3871 = _3857;
    float _3873 = _3871;
    if (!_3837)
    {
        float _3875 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3877 = _2868 + _3875;
        _3378 = _3877;
    }
    float _3879 = _3378;
    float _3881 = exp2(_3851);
    bool _3883 = _2868 <= 8000.0;
    bool _3885 = isnan(_2868);
    bool _3887 = _3883 || _3885;
    bool _3889 = isnan(8000.0);
    bool _3891 = _3887 || _3889;
    float _3893 = float(_3891);
    out.gl_Position.x = _3426;
    out.gl_Position.y = _3428;
    out.gl_Position.z = _3849;
    out.gl_Position.w = _3390;
    if (!_3837)
    {
        float _3895 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3897 = _3871 + _3895;
        _3873 = _3897;
    }
    float _3899 = _3873;
    float _3901 = -_3845;
    float _3903 = _3901 + 1.0;
    if (_3837)
    {
        _3859 = 1.0;
    }
    float _3905 = _3859;
    float _3907 = _3903 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3909 = _3899;
    float _3911 = _3905;
    if (!_3837)
    {
        float _3913 = 1.0 / _3899;
        _3909 = _3913;
    }
    float _3915 = _3909;
    float _3917 = _3907 * _3484;
    float _3919 = fma(_3881, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3921 = precise::clamp(_3919, 0.0, 1.0);
    float _3923 = _3881;
    if (!_3837)
    {
        float _3925 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3927 = _3861 + _3925;
        _3923 = _3927;
    }
    float _3929 = _3923;
    float _3931 = fma(_3921, -2.0, 3.0);
    float _3933 = _3921 * _3921;
    float _3935 = _3603;
    float _3937 = _3933;
    if (!_3837)
    {
        float _3939 = 1.0 / _3929;
        _3935 = _3939;
    }
    float _3941 = _3935;
    float _3943 = _3933 * _3931;
    if (!_3837)
    {
        float _3945 = _3867 * _3915;
        float _3947 = precise::clamp(_3945, 0.0, 1.0);
        _3937 = _3947;
    }
    float _3949 = _3937;
    float _3951 = -_3943;
    float _3953 = _3951 + 1.0;
    if (_3837)
    {
        _3869 = 1.0;
    }
    float _3955 = _3869;
    float _3957 = _3849 + _3390;
    float _3959 = _3955;
    float _3961 = _3957;
    if (!_3837)
    {
        float _3963 = -_3949;
        float _3965 = _3963 + 1.0;
        _3959 = _3965;
    }
    float _3967 = _3959;
    float _3969 = fma(_3953, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3943);
    float _3971 = _3957 * 0.5;
    if (!_3366)
    {
        _3961 = 1.0;
    }
    float _3973 = _3961;
    float _3975 = _3893 * _3969;
    float _3977 = _3973;
    if (_3366)
    {
        bool _3979 = _3482 >= _3452;
        bool _3981 = isnan(_3482);
        bool _3983 = _3979 || _3981;
        bool _3985 = isnan(_3452);
        bool _3987 = _3983 || _3985;
        float _3989 = float(_3987);
        _3977 = _3989;
    }
    float _3991 = _3977;
    float _3993 = -_3907;
    float _3995 = _3993 + 1.0;
    out.m_90.z = _3971;
    out.m_90.w = _3390;
    float _3997 = _3975 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3999 = _3995;
    float _4001 = _3997;
    if (!_3837)
    {
        float _4003 = _3879 * _3941;
        float _4005 = precise::clamp(_4003, 0.0, 1.0);
        _3911 = _4005;
    }
    float _4007 = _3911;
    float _4009 = _3991 * _3573;
    bool _4011 = _3743 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4013 = isnan(_3743);
    bool _4015 = _4011 || _4013;
    bool _4017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4019 = _4015 || _4017;
    float _4021 = _3843 * _3997;
    float _4023 = precise::clamp(_4021, 0.0, 1.0);
    float _4025 = -_4023;
    float _4027 = fma(_4025, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4029 = _3495 * _3917;
    float _4031 = -_4009;
    float _4033 = fma(_4031, _4027, 1.0);
    float _4035 = precise::clamp(_4033, 0.0, 1.0);
    float _4037 = _3495 * _3995;
    float _4039 = _4035 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4041 = _4035;
    if (!_4019)
    {
        _3999 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4043 = _3999;
    float _4045 = _4043;
    float _4047 = _4043;
    if (!_4019)
    {
        _4001 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4049 = _4001;
    out.m_92.x = _4039;
    float _4051 = _4049;
    float _4053 = _4049;
    if (!_4019)
    {
        _4041 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4055 = _4041;
    float _4057 = _3819 * _3917;
    float _4059 = fma(_3815, _4029, _3489);
    float _4061 = fma(_3817, _4029, _3491);
    float _4063 = _4007 * _3967;
    float _4065 = fma(_3495, _4057, _3493);
    float _4067 = _4063;
    float _4069 = _4055;
    float _4071 = _4055;
    if (!_4019)
    {
        _3507 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4073 = _3507;
    float _4075 = _4063 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4077 = _4073;
    float _4079 = _4073;
    if (!_4019)
    {
        _3509 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4081 = _3509;
    out.m_94.x = _4059;
    out.m_94.y = _4061;
    out.m_94.z = _4065;
    out.m_94.w = _4037;
    float _4083 = _4081;
    float _4085 = _4081;
    if (!_4019)
    {
        _4067 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4087 = _4067;
    bool _4089 = !_4019;
    float _4091 = _4087;
    float _4093 = _4087;
    if (!_4089)
    {
        bool _4095 = _3743 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4097 = isnan(_3743);
        bool _4099 = _4095 || _4097;
        bool _4101 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4103 = _4099 || _4101;
        if (!_4103)
        {
            float _4105 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4107 = _3743 + _4105;
            float _4109 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4111 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4109;
            float _4113 = 1.0 / _4111;
            float _4115 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4117 = _4115 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4119 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4121 = _4119 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4123 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4127 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4129 = _4127 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4131 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4133 = _4131 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4135 = _4107 * _4113;
            float _4137 = precise::clamp(_4135, 0.0, 1.0);
            float _4139 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4141 = _4139 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4143 = fma(_4137, _4117, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4145 = fma(_4137, _4141, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4147 = fma(_4137, _4121, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4149 = fma(_4137, _4125, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4151 = fma(_4137, _4129, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4153 = fma(_4137, _4133, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4053 = _4145;
            _4085 = _4151;
            _4047 = _4143;
            _4079 = _4149;
            _4071 = _4147;
            _4093 = _4153;
            _4155 = true;
        }
        else
        {
            bool _4157 = _3743 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4159 = isnan(_3743);
            bool _4161 = _4157 || _4159;
            bool _4163 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4165 = _4161 || _4163;
            if (!_4165)
            {
                _4045 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4167 = _4045;
            _4047 = _4167;
            if (!_4165)
            {
                _4051 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4169 = _4051;
            _4053 = _4169;
            if (!_4165)
            {
                _4069 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4171 = _4069;
            _4071 = _4171;
            if (!_4165)
            {
                _4077 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4173 = _4077;
            _4079 = _4173;
            if (!_4165)
            {
                _4083 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4175 = _4083;
            _4085 = _4175;
            if (!_4165)
            {
                _4091 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4177 = _4091;
            bool _4179 = !_4165;
            _4093 = _4177;
            if (!_4179)
            {
                bool _4181 = _3743 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4183 = isnan(_3743);
                bool _4185 = _4181 || _4183;
                bool _4187 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4189 = _4185 || _4187;
                if (!_4189)
                {
                    float _4191 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4193 = _3743 + _4191;
                    float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4197 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4195;
                    float _4199 = 1.0 / _4197;
                    float _4201 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4203 = _4201 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4205 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4207 = _4205 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4209 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4211 = _4209 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4213 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4215 = _4213 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4217 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4219 = _4217 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4221 = _4193 * _4199;
                    float _4223 = precise::clamp(_4221, 0.0, 1.0);
                    float _4225 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4227 = _4225 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4229 = fma(_4223, _4203, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4231 = fma(_4223, _4227, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4233 = fma(_4223, _4207, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4235 = fma(_4223, _4211, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4237 = fma(_4223, _4215, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4239 = fma(_4223, _4219, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4053 = _4231;
                    _4085 = _4237;
                    _4047 = _4229;
                    _4079 = _4235;
                    _4071 = _4233;
                    _4093 = _4239;
                    _4155 = true;
                }
                else
                {
                    _4053 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4085 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4047 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4079 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4071 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4093 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4155 = false;
    float _4241 = _4053;
    float _4243 = _4085;
    float _4245 = _4047;
    float _4247 = _4079;
    float _4249 = _4071;
    float _4251 = _4093;
    float _4253 = fma(_2664, -0.5, 0.5);
    float _4255 = precise::clamp(_4253, 0.0, 1.0);
    float _4257 = -_4241;
    float _4259 = _4257 + _4243;
    float _4261 = _4075 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4263 = -_4245;
    float _4265 = _4263 + _4247;
    out.m_96.x = 0.0;
    float _4267 = fma(_4255, _4259, _4241);
    float _4269 = fma(_4255, _4265, _4245);
    out.m_61.x = _4261;
    float _4271 = -_4249;
    float _4273 = _4271 + _4251;
    float _4275 = _4267 * 0.586610972881317138671875;
    bool _4277 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4279 = fma(_4255, _4273, _4249);
    float _4281 = fma(_4269, 0.298911988735198974609375, _4275);
    bool _4283 = _4007 > 0.0;
    bool _4285 = isnan(_4007);
    bool _4287 = _4283 || _4285;
    bool _4289 = isnan(0.0);
    bool _4291 = _4287 || _4289;
    float _4293 = fma(_4279, 0.114477999508380889892578125, _4281);
    bool _4295 = _3967 <= 0.0;
    bool _4297 = !_4291;
    bool _4299 = _4295 || _4297;
    float _4301 = -_4293;
    float _4303 = _4269 + _4301;
    float _4305 = -_4293;
    float _4307 = _4267 + _4305;
    float _4309 = -_4293;
    float _4311 = _4279 + _4309;
    float _4313 = fma(_4303, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4293);
    float _4315 = fma(_4307, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4293);
    float _4317 = fma(_4311, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4293);
    bool _4319 = !_4277;
    if (!_4319)
    {
        float _4321 = -_3266;
        float _4323 = _4321 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4325 = -_3268;
        float _4327 = _4325 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4329 = -_3270;
        float _4331 = _4329 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4333 = _4323 * _4323;
        float _4335 = fma(_4327, _4327, _4333);
        float _4337 = fma(_4331, _4331, _4335);
        float _4339 = sqrt(_4337);
        float _4341 = rsqrt(_4337);
        float _4343 = -_4339;
        float _4345 = _4343 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4347 = _4345 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4349 = precise::clamp(_4347, 0.0, 1.0);
        float _4351 = _4327 * _4341;
        float _4353 = _4323 * _4341;
        float _4355 = abs(_4349);
        float _4357 = log2(_4355);
        float _4359 = _4331 * _4341;
        float _4361 = _4351 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4363 = _2664 * _4353;
        float _4365 = -_4353;
        float _4367 = -_4361;
        float _4369 = fma(_4365, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4367);
        float _4371 = fma(_2688, _4351, _4363);
        float _4373 = -_4359;
        float _4375 = fma(_4373, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4369);
        float _4377 = fma(_2696, _4359, _4371);
        float _4379 = precise::clamp(_4377, 0.0, 1.0);
        float _4381 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4383 = _4375 + _4381;
        float _4385 = _4357 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4387 = _4383 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4389 = precise::clamp(_4387, 0.0, 1.0);
        float _4391 = exp2(_4385);
        float _4393 = _4391 * _4389;
        float _4395 = _4379 * _4393;
        float _4397 = _4395 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4399 = _4395 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4401 = _4395 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _4397;
        out.m_96.y = _4399;
        out.m_96.z = _4401;
    }
    out.m_98.x = _4313;
    out.m_98.y = _4315;
    out.m_98.z = _4317;
    if (!_4299)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _4403 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4403;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

