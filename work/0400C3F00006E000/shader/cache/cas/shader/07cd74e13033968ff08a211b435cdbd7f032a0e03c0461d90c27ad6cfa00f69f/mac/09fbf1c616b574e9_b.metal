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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c12 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
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
    float4 m_72 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_82 [[user(locn4)]];
    float4 m_86 [[user(locn5)]];
    float4 m_90 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_51 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_64 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_68 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2815 = false;
    bool _1842 = false;
    bool _1830 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
    float _106 = in.m_48.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_111);
    float _125 = _115;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _121;
    if (!_119)
    {
        out.m_53.x = 0.0;
    }
    int _129 = 0;
    if (!_119)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3132 = as_type<float>(_133);
        out.gl_Position.z = _3132;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _137 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_106);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = in.m_55.x;
    float _149 = float(_111);
    bool _151 = _115 >= _149;
    bool _153 = !_145;
    bool _155 = _151 || _153;
    if (_155)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _123;
    if (_155)
    {
        out.m_53.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _135 = as_type<int>(_159);
    }
    int _161 = _135;
    out.m_57.x = _147;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3191 = as_type<float>(_161);
        out.gl_Position.z = _3191;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = 1.0 / _149;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _169 = _115 * _165;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_167;
    float _189 = _169;
    float _191 = _181;
    if (!_187)
    {
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _195 = _147 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _189 = _205;
    }
    float _207 = _189;
    float _209 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _211 = int(_209);
    float _213 = in.m_46.x;
    float _215 = in.m_46.y;
    float _217 = in.m_46.z;
    float _219 = _147 * 2.0;
    int _221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _223 = _221 != 0;
    float _225 = in.m_62.x;
    float _227 = in.m_62.y;
    float _229 = in.m_62.z;
    float _231 = in.m_62.w;
    float _233 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _235 = int(_233);
    int _237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _239 = _237 != 0;
    int _241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _243 = _241 != 0;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _247 = _245 != 0;
    float _249 = in.m_64.x;
    float _251 = in.m_64.y;
    float _253 = in.m_64.z;
    float _255 = in.m_64.w;
    float _257 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _259 = in.m_66.x;
    float _261 = in.m_66.y;
    float _263 = in.m_66.z;
    float _265 = in.m_66.w;
    bool _267 = !_239;
    int _269 = _267 ? 0 : 1;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _273 = float(_211);
    float _275 = in.m_55.w;
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _279 = _277 != 0;
    float _281 = floor(_219);
    bool _283 = !_243;
    int _285 = _283 ? 0 : 1;
    float _287 = in.m_55.y;
    bool _289 = _147 > 0.5;
    float _291 = float(uint(_235));
    float _293 = -_181;
    int _295 = _289 ? as_type<int>(_293) : as_type<int>(_181);
    float _297 = 1.0 / _273;
    float _299 = _215 * _227;
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _303 = _301 != 0;
    float _305 = _215 * _251;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _311 = 1.0 / _291;
    float _313 = _215 * _261;
    float _315 = fma(_213, _225, _299);
    float _317 = fma(_213, _249, _305);
    float _319 = in.m_55.z;
    bool _321 = _275 > 0.5;
    float _323 = fma(_217, _229, _315);
    float _325 = _297 * _115;
    float _327 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _329 = -_185;
    int _331 = _321 ? as_type<int>(_329) : as_type<int>(_185);
    float _333 = fma(_213, _259, _313);
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _337 = _335 != 0;
    float _339 = -_271;
    float _341 = fma(_327, 2.0, _339);
    float _343 = trunc(_325);
    int _345 = int(_343);
    bool _347 = !_279;
    float _349 = _347 ? _185 : as_type<float>(_331);
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _353 = as_type<int>(_311) + (-2);
    float _355 = _287 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _357 = !_337;
    int _359 = _357 ? 0 : 1;
    float _361 = fma(_217, _253, _317);
    int _363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _365 = _363 != 0;
    float _367 = fma(_355, -2.0, _351);
    float _369 = 1.0 / _309;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _373 = _371 != 0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _375;
    bool _379 = !_365;
    float _381 = _379 ? _181 : as_type<float>(_295);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _391 = float(uint(_345));
    float _393 = fma(_217, _263, _333);
    bool _395 = _287 > 0.5;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _401 = !_373;
    int _403 = _401 ? 0 : 1;
    float _405 = as_type<float>(_353) * _391;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _409 = _407 != 0;
    float _411 = 1.0 / _385;
    float _413 = -_185;
    int _415 = _395 ? as_type<int>(_413) : as_type<int>(_185);
    float _417 = _377 * _369;
    bool _419 = _319 > 0.5;
    float _421 = _287 + _319;
    int _423 = ~_235;
    int _425 = _423 + 1;
    float _427 = _287 * 2.0;
    float _429 = _147 + _319;
    float _431 = trunc(_405);
    float _433 = precise::max(_431, 0.0);
    uint _436 = uint(_433);
    float _438 = _421 + (-1.0);
    float _440 = _429 + (-1.0);
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _444 = _442 != 0;
    float _446 = -_115;
    float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[76].x, _341);
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _452 = _450 != 0;
    float _454 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _456 = _389 * _411;
    bool _458 = !_409;
    float _460 = _458 ? _185 : as_type<float>(_415);
    float _462 = _147 + _287;
    float _464 = -_181;
    int _466 = _419 ? as_type<int>(_464) : as_type<int>(_181);
    float _468 = 1.0 / _399;
    bool _470 = _281 > 0.0;
    float _472 = _462 + (-1.0);
    bool _474 = _281 >= 0.0;
    bool _476 = isnan(_281);
    bool _478 = _474 || _476;
    bool _480 = isnan(0.0);
    bool _482 = _478 || _480;
    int _484 = _425 * int(_436);
    int _486 = _484 + _345;
    float _488 = float(_235);
    float _490 = _381 + 0.5;
    int _492 = ~_235;
    int _494 = _492 + 1;
    float _496 = floor(_427);
    float _498 = float(uint(_486));
    float _500 = _488 * _115;
    float _502 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[80].x, _448);
    int _504 = _482 ? 0 : 1;
    float _506 = as_type<float>(_353) * _498;
    float _508 = _500 * _165;
    float _510 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _512 = trunc(_506);
    float _514 = precise::max(_512, 0.0);
    uint _516 = uint(_514);
    float _518 = _393 + _265;
    bool _520 = !_223;
    float _522 = _520 ? 7.345489978790283203125 : 1.0;
    float _524 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _367);
    bool _526 = !_247;
    int _528 = _526 ? 0 : 1;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _530;
    bool _534 = _496 > 0.0;
    float _536 = _522 * _147;
    float _538 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _540 = ~_504;
    int _542 = _540 + 1;
    int _544 = _542 + 1;
    float _546 = in.m_68.x;
    float _548 = in.m_68.y;
    int _550 = _544;
    float _552 = _468;
    if (!_470)
    {
        int _554 = ~_504;
        int _556 = _554 + 1;
        _550 = _556;
    }
    int _558 = _550;
    float _560 = _532 * _468;
    float _562 = floor(_536);
    if (!_223)
    {
        _552 = _287;
    }
    float _564 = _552;
    float _566 = _361 + _255;
    int _568 = int(_436) + int(_516);
    float _570 = _323 + _231;
    bool _572 = !_303;
    float _574 = _572 ? _181 : as_type<float>(_466);
    float _576 = _319 * 2.0;
    bool _578 = _496 >= 0.0;
    bool _580 = isnan(_496);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    int _588 = _494 * _568;
    int _590 = _588 + _345;
    float _592 = 0.0;
    float _594 = _564;
    if (!_223)
    {
        _592 = _319;
    }
    float _596 = _592;
    float _598 = floor(_576);
    int _600 = _586 ? 0 : 1;
    float _602 = _570 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _604 = uint(_590) >= uint(_235);
    float _606 = _518 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    int _608 = ~_600;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    float _614 = -_562;
    float _616 = _536 + _614;
    bool _618 = !_604;
    int _620 = _618 ? 0 : (-1);
    float _622 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _624 = log2(_622);
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _628 = _626 != 0;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _632 = _630 != 0;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _636 = _634 != 0;
    float _638 = _616 * _488;
    float _640 = _546 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _642 = _612;
    float _644 = _546;
    float _646 = _596;
    bool _648 = _632;
    if (!_534)
    {
        int _650 = ~_600;
        int _652 = _650 + 1;
        _642 = _652;
    }
    int _654 = _642;
    float _656 = _548 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _658 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _660 = _640 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _662 = 0.0;
    float _664 = _658;
    if (!_223)
    {
        _662 = _319;
    }
    float _666 = _662;
    float _668 = _666;
    if (_444)
    {
        float _670 = _275 * 3.1415927410125732421875;
        _644 = _670;
    }
    float _672 = _644;
    if (_223)
    {
        _594 = _147;
    }
    float _674 = _594;
    float _676 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_223)
    {
        _646 = _287;
    }
    float _678 = _646;
    float _680 = _660 * _658;
    if (_223)
    {
        _668 = _287;
    }
    float _682 = _668;
    if (_452)
    {
        float _684 = _147 * 3.1415927410125732421875;
        _664 = _684;
    }
    float _686 = _664;
    bool _688 = _598 > 0.0;
    float _690 = 0.0;
    if (_444)
    {
        float _692 = _672 * 0.15915493667125701904296875;
        _690 = _692;
    }
    float _694 = _690;
    bool _696 = _598 >= 0.0;
    bool _698 = isnan(_598);
    bool _700 = _696 || _698;
    bool _702 = isnan(0.0);
    bool _704 = _700 || _702;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _708 = _207 + _706;
    float _710 = _676 * _257;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _714 = _207 + _712;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _718 = _207 + _716;
    float _720 = fma(_417, _708, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _722 = 0.0;
    bool _724 = _704;
    if (_452)
    {
        float _726 = _686 * 0.15915493667125701904296875;
        _722 = _726;
    }
    float _728 = _722;
    bool _730 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _732 = isnan(_207);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    float _742 = fma(_456, _714, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _744 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _746 = isnan(_207);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = fma(_560, _718, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _758 = _694;
    if (_444)
    {
        float _760 = _694 * 6.283185482025146484375;
        float _762 = sin(_760);
        _758 = _762;
    }
    float _764 = _758;
    bool _766 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _768 = isnan(_207);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = -_740;
    float _780 = _778 + 1.0;
    bool _782 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _784 = isnan(_207);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -_754;
    float _796 = _794 + 1.0;
    float _798 = _754 * _780;
    float _800 = _728;
    if (_452)
    {
        float _802 = _728 * 6.283185482025146484375;
        float _804 = sin(_802);
        _800 = _804;
    }
    float _806 = _800;
    float _808 = _792 * _796;
    float _810 = -_792;
    float _812 = _810 + 1.0;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _816 = !_632;
    int _818 = _816 ? 0 : 1;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _822 = _776 * _812;
    int _824 = _704 ? 0 : 1;
    float _826 = _624 * _115;
    if (_444)
    {
        bool _828 = _764 > 0.5;
        _648 = _828;
    }
    bool _830 = _648;
    float _832 = _720 * _822;
    float _834 = _460 + (-0.5);
    float _836 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[83].w, _820);
    float _838 = _674 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_452)
    {
        bool _842 = _806 > 0.5;
        _724 = _842;
    }
    bool _844 = _724;
    float _846 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[83].z, _814);
    float _848 = float(_345);
    float _850 = -_834;
    float _852 = -_524;
    float _854 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[80].y, _852);
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _858 = _678 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _860 = _848 >= _488;
    bool _862 = isnan(_848);
    bool _864 = _860 || _862;
    bool _866 = isnan(_488);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _874 = ~_568;
    int _876 = _874 + _620;
    int _878 = _876 + 1;
    float _880 = -_856;
    float _882 = fma(_838, 2.0, _880);
    float _884 = -_776;
    float _886 = _884 + 1.0;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _890 = !_628;
    int _892 = _890 ? 0 : 1;
    float _894 = -_115;
    float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[81].x, _882);
    float _898 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[115].x, _832);
    float _900 = exp2(_826);
    float _902 = fma(_858, -2.0, _888);
    int _904 = ~_824;
    int _906 = _904 + 1;
    int _908 = _906 + 1;
    float _910 = fma(_742, _808, _898);
    int _912 = _908;
    if (!_688)
    {
        int _914 = ~_824;
        int _916 = _914 + 1;
        _912 = _916;
    }
    int _918 = _912;
    int _920 = _235 * _878;
    int _922 = _920 + _345;
    float _924 = _840 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _926 = trunc(_870);
    int _928 = int(_926);
    bool _930 = _235 == 0;
    float _932 = _872 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _934 = _574 + 0.5;
    float _936 = _349 + (-0.5);
    float _938 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[81].y, _902);
    bool _940 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _942 = isnan(0.0);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _948 = _944 || _946;
    float _950 = fma(_924, _934, _896);
    float _952 = -_900;
    float _954 = _952 + 1.0;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _958 = 1.0 + _956;
    bool _960 = !_930;
    int _962 = _960 ? _922 : (-1);
    float _964 = -_932;
    float _966 = -_938;
    float _968 = fma(_964, _936, _966);
    float _970 = 1.0 / _958;
    float _972 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].z, _846);
    int _974 = ~_928;
    int _976 = _974 + 1;
    int _978 = _976 + 1;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _982 = _948 ? _954 : 0.0;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _986 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _988 = isnan(1.0);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _994 = _990 || _992;
    int _996 = _962 * _978;
    int _998 = _235 + (-1);
    float _1000 = trunc(_508);
    int _1002 = int(_1000);
    float _1004 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[78].w, _984);
    float _1006 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].w, _836);
    int _1008 = abs(_359);
    int _1010 = _928 * _998;
    int _1012 = _1010 + _996;
    int _1014 = abs(_285);
    float _1016 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].z, _980);
    int _1018 = abs(_403);
    float _1020 = trunc(_638);
    int _1022 = int(_1020);
    float _1024 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1004);
    float _1026 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1016);
    if (_994)
    {
        float _1028 = _982 * _970;
        _125 = _1028;
    }
    float _1030 = _125;
    float _1032 = _566 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _1034 = _1012 * _1014;
    float _1036 = float(_918);
    float _1038 = _287 + (-0.5);
    float _1040 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _1042 = abs(_269);
    float _1044 = _1032 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1046 = _1032 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1048 = fma(_602, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1044);
    int _1050 = abs(_528);
    int _1052 = _1022 * _1018;
    int _1054 = _1052 + _345;
    float _1056 = fma(_602, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1046);
    int _1058 = _1002 * _1042;
    int _1060 = _1058 + _1034;
    float _1062 = _1032 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1064 = fma(_756, _798, _910);
    int _1066 = abs(_892);
    float _1068 = fma(_606, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1048);
    float _1070 = in.m_70.x;
    float _1072 = in.m_70.y;
    float _1074 = in.m_70.z;
    float _1076 = float(uint(_1054));
    float _1078 = fma(_602, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1062);
    int _1080 = _1054 * _1050;
    int _1082 = _1080 + _1060;
    float _1084 = float(_1066);
    float _1086 = _1068 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1088 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1090 = as_type<float>(_353) * _1076;
    int _1092 = _1022 * _1008;
    int _1094 = _1092 + _1082;
    float _1096 = _1086 * _1040;
    float _1098 = _1084 * _1036;
    float _1100 = fma(_606, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1078);
    float _1102 = fma(_606, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1056);
    float _1104 = fma(_1096, 0.5, 0.5);
    float _1106 = _1098 * (-2.0);
    float _1108 = float(uint(_1094));
    float _1110 = _1100 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    bool _1112 = !_636;
    int _1114 = _1112 ? 0 : 1;
    float _1116 = fma(_538, _1106, _538);
    int _1118 = abs(_818);
    float _1120 = as_type<float>(_353) * _1108;
    int _1122 = abs(_1114);
    float _1124 = _1110 * _1088;
    float _1126 = float(_558);
    float _1128 = fma(_1106, _1070, _1070);
    float _1130 = _147 + (-0.5);
    float _1132 = trunc(_1120);
    float _1134 = precise::max(_1132, 0.0);
    uint _1136 = uint(_1134);
    float _1138 = fma(_1124, 0.5, 0.5);
    float _1140 = float(_654);
    float _1142 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1128);
    float _1144 = float(_1122);
    float _1146 = _1102 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1148 = float(_1118);
    float _1150 = fma(_1116, _1030, _1142);
    int _1152 = ~_235;
    int _1154 = _1152 + 1;
    float _1156 = _1144 * _1140;
    float _1158 = trunc(_1090);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    float _1164 = _1148 * _1126;
    float _1166 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1064);
    float _1168 = _1150 * 0.15915493667125701904296875;
    float _1170 = _1164 * (-2.0);
    float _1172 = _1156 * (-2.0);
    int _1174 = _1154 * int(_1136);
    int _1176 = _1174 + _1094;
    float _1178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1180 = fma(_510, _1170, _510);
    float _1182 = fma(_1170, _1072, _1072);
    int _1184 = ~_235;
    int _1186 = _1184 + 1;
    float _1188 = _1166 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1190 = float(uint(_1176));
    float _1192 = fma(_454, _1172, _454);
    float _1194 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1182);
    float _1196 = _1182;
    float _1198 = as_type<float>(_1186);
    if (!_444)
    {
        _1196 = _181;
    }
    float _1200 = _1196;
    float _1202 = as_type<float>(_353) * _1190;
    float _1204 = fma(_1172, _1074, _1074);
    float _1206 = fma(_1180, _1030, _1194);
    int _1208 = _1186 * int(_1162);
    int _1210 = _1208 + _1054;
    float _1212 = trunc(_1202);
    float _1214 = precise::max(_1212, 0.0);
    uint _1216 = uint(_1214);
    float _1218 = _1200;
    if (_444)
    {
        float _1220 = -_181;
        float _1222 = _830 ? _1220 : _181;
        _1218 = _1222;
    }
    float _1224 = _1218;
    float _1226 = _319 + (-0.5);
    if (!_452)
    {
        _1198 = _185;
    }
    float _1228 = _1198;
    float _1230 = _1206 * 0.15915493667125701904296875;
    float _1232 = _1228;
    if (_452)
    {
        float _1234 = -_185;
        float _1236 = _844 ? _1234 : _185;
        _1232 = _1236;
    }
    float _1238 = _1232;
    float _1240 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1204);
    float _1242 = float(uint(_1210));
    float _1244 = _1224 + 0.5;
    float _1246 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1248 = -_1238;
    float _1250 = _1248 + 0.5;
    float _1252 = fma(_1192, _1030, _1240);
    float _1254 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1256 = as_type<float>(_353) * _1242;
    float _1258 = -_1026;
    float _1260 = _1258 + 1.0;
    float _1262 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1264 = _1254 * _1178;
    float _1266 = _1252 * 0.15915493667125701904296875;
    float _1268 = -_1260;
    float _1270 = fma(_381, _1268, _502);
    float _1272 = -_1006;
    float _1274 = _1272 + 1.0;
    float _1276 = _1168 * 6.283185482025146484375;
    float _1278 = cos(_1276);
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1282 = int(_1136) + int(_1216);
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1286 = ~_235;
    int _1288 = _1286 + 1;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1292 = fma(_349, _1274, _968);
    float _1294 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1296 = _1266 * 6.283185482025146484375;
    float _1298 = cos(_1296);
    int _1300 = _1288 * _1282;
    int _1302 = _1300 + _1094;
    float _1304 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1308 = _1146 * _1246;
    float _1310 = -_1024;
    float _1312 = _1310 + 1.0;
    bool _1314 = uint(_1302) >= uint(_235);
    float _1316 = -_972;
    float _1318 = _1316 + 1.0;
    float _1320 = floor(_1104);
    out.m_72.x = _1294;
    out.m_72.y = _1304;
    out.m_72.z = _1306;
    out.m_72.w = _1188;
    float _1322 = fma(_460, _1312, _854);
    float _1324 = -_1318;
    float _1326 = fma(_574, _1324, _950);
    float _1328 = fma(_1308, 0.5, 0.5);
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1332 = _1330 != 0;
    float _1334 = _1168 * 6.283185482025146484375;
    float _1336 = sin(_1334);
    out.m_74.x = _1270;
    out.m_74.y = _1322;
    out.m_74.z = _1326;
    out.m_74.w = _1292;
    bool _1338 = !_1314;
    int _1340 = _1338 ? 0 : (-1);
    float _1342 = _1230 * 6.283185482025146484375;
    float _1344 = sin(_1342);
    float _1346 = _1278 * _1298;
    float _1348 = -_1320;
    float _1350 = _1104 + _1348;
    int _1352 = ~_1282;
    int _1354 = _1352 + _1340;
    int _1356 = _1354 + 1;
    float _1358 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1360 = ~_235;
    int _1362 = _1360 + 1;
    float _1364 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1366 = _1230 * 6.283185482025146484375;
    float _1368 = cos(_1366);
    float _1370 = _1266 * 6.283185482025146484375;
    float _1372 = sin(_1370);
    float _1374 = _1336 * _1344;
    float _1376 = _1278 * _1344;
    float _1378 = _1344 * _1298;
    float _1380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _1382 = _235 * _1356;
    int _1384 = _1382 + _1094;
    float _1386 = _1278 * _1368;
    float _1388 = _1336 * _1368;
    float _1390 = _1368 * _1298;
    float _1392 = _1346 * _710;
    bool _1394 = !_930;
    int _1396 = _1394 ? _1384 : (-1);
    float _1398 = trunc(_1256);
    float _1400 = precise::max(_1398, 0.0);
    uint _1402 = uint(_1400);
    float _1404 = -_1372;
    float _1406 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1358);
    int _1408 = _1396 >> 31;
    float _1410 = fma(_1372, _1386, _1374);
    float _1412 = fma(_1372, _1374, _1386);
    float _1414 = -_1388;
    float _1416 = fma(_1372, _1376, _1414);
    int _1418 = _1408 & 3;
    float _1420 = fma(_1410, _680, _1392);
    float _1422 = floor(_1138);
    float _1424 = _1262 * _1380;
    int _1426 = _1396 + _1418;
    int _1428 = _1396 & 3;
    bool _1430 = _1428 != 0;
    out.m_76.x = _1264;
    out.m_76.y = _1424;
    int _1432 = _1426 >> 2;
    float _1434 = floor(_1328);
    int _1436 = int(_1162) + int(_1402);
    float _1438 = -_1376;
    float _1440 = fma(_1372, _1388, _1438);
    float _1442 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1444 = _1432 << 4;
    int _1446 = _1444 + 368;
    float _1448 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1450 = _1362 * _1436;
    int _1452 = _1450 + _1054;
    int _1454 = _1396 & 3;
    bool _1456 = _1454 != 0;
    float _1458 = -_1422;
    float _1460 = _1138 + _1458;
    float _1462 = _1336 * _1298;
    float _1464 = -_1372;
    float _1466 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1442);
    float _1468 = -_1372;
    float _1470 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1364);
    float _1472 = -_710;
    float _1474 = _1372 * _1472;
    float _1476 = _1462 * _710;
    float _1478 = fma(_1460, 2.0, -1.0);
    float _1480 = fma(_1350, 2.0, -1.0);
    float _1482 = fma(_1390, _680, _1474);
    float _1484 = fma(_1440, _680, _1476);
    float _1486 = _1478 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1488 = -_1434;
    float _1490 = _1328 + _1488;
    float _1492 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1494 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1496 = _1486 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1498 = _1486 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1500 = _1486 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    int _1502 = _1446 + 8;
    uint _1504 = uint(int(uint(_1502) >> uint(2)));
    uint _1506 = uint(int(uint(int(_1504)) >> uint(2)));
    int _1508 = int(_1504) & 3;
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[int(_1506)][_1508];
    int _1512 = int(_1504) + 1;
    uint _1514 = uint(int(uint(_1512) >> uint(2)));
    int _1516 = _1512 & 3;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[int(_1514)][_1516];
    bool _1520 = uint(_1452) >= uint(_235);
    float _1522 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1466);
    float _1524 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1526 = _1480 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    bool _1528 = uint(_1454) > 1u;
    float _1530 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1492);
    float _1532 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1524);
    uint _1534 = uint(int(uint(_1446) >> uint(2)));
    uint _1536 = uint(int(uint(int(_1534)) >> uint(2)));
    int _1538 = int(_1534) & 3;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[int(_1536)][_1538];
    int _1542 = int(_1534) + 1;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    int _1546 = _1542 & 3;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[int(_1544)][_1546];
    float _1550 = fma(_1526, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1496);
    int _1552 = _1430 ? 0 : 1;
    float _1554 = fma(_1526, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1498);
    bool _1556 = _1454 != 3;
    float _1558 = fma(_1526, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1500);
    float _1560 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1562 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1406);
    float _1564 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1470);
    float _1566 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1448);
    float _1568 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1494);
    float _1570 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1572 = uint(_1454) >= 2u;
    float _1574 = fma(_1378, _1560, _1482);
    float _1576 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1578 = fma(_1416, _1560, _1420);
    float _1580 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1570);
    int _1582 = _1572 ? 0 : 1;
    float _1584 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1576);
    int _1586 = ~_1552;
    int _1588 = _1586 + 1;
    int _1590 = _1588 + 1;
    float _1592 = fma(_1412, _1560, _1484);
    int _1594 = _1590;
    float _1596 = _1592;
    float _1598 = _1480;
    float _1600 = _1478;
    float _1602 = _1574;
    if (!_1528)
    {
        int _1604 = ~_1552;
        int _1606 = _1604 + 1;
        _1594 = _1606;
    }
    int _1608 = _1594;
    float _1610 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1530);
    int _1612 = ~_1582;
    int _1614 = _1612 + 1;
    int _1616 = _1614 + 1;
    float _1618 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1566);
    bool _1620 = _1454 != 3;
    float _1622 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1568);
    int _1624 = _1616;
    float _1626 = _1622;
    if (_1556)
    {
        int _1628 = ~_1582;
        int _1630 = _1628 + 1;
        _1624 = _1630;
    }
    int _1632 = _1624;
    float _1634 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1636 = !_1456;
    int _1638 = _1636 ? 0 : 1;
    float _1640 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1532);
    int _1642 = abs(_1608);
    float _1644 = _1634 * _1562;
    int _1646 = abs(_1632);
    float _1648 = _1634 * _1564;
    int _1650 = abs(_1638);
    float _1652 = _1634 * _1522;
    int _1654 = ~_1642;
    int _1656 = _1654 + 1;
    int _1658 = _1656 + 1;
    float _1660 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1580);
    bool _1662 = !_1620;
    int _1664 = _1662 ? 0 : (-1);
    float _1666 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1584);
    int _1668 = ~_1650;
    int _1670 = _1668 + 1;
    int _1672 = _1670 + 1;
    float _1674 = fma(_1490, 2.0, -1.0);
    bool _1676 = !_1520;
    int _1678 = _1676 ? 0 : (-1);
    int _1680 = abs(_1664);
    int _1682 = ~_1436;
    int _1684 = _1682 + _1678;
    int _1686 = _1684 + 1;
    int _1688 = _1658 * as_type<int>(_1548);
    int _1690 = ~_1646;
    int _1692 = _1690 + 1;
    int _1694 = _1692 + 1;
    int _1696 = _1672 * as_type<int>(_1540);
    int _1698 = _1696 + _1688;
    bool _1700 = !_1332;
    int _1702 = _1700 ? 0 : 1;
    int _1704 = _235 * _1686;
    int _1706 = _1704 + _1054;
    float _1708 = _1578 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1710 = _1694 * as_type<int>(_1510);
    int _1712 = _1710 + _1698;
    int _1714 = abs(_1702);
    int _1716 = ~_1680;
    int _1718 = _1716 + 1;
    int _1720 = _1718 + 1;
    float _1722 = _1578 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1724 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1726 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1708);
    int _1728 = _1720 * as_type<int>(_1518);
    int _1730 = _1728 + _1712;
    int _1732 = ~_1714;
    int _1734 = _1732 + 1;
    int _1736 = _1734 + 1;
    float _1738 = fma(_1724, _1610, _1644);
    bool _1740 = !_930;
    int _1742 = _1740 ? _1706 : (-1);
    float _1744 = fma(_1724, _1618, _1652);
    float _1746 = fma(_1724, _1622, _1648);
    int _1748 = _1730 * _1736;
    float _1750 = _1578 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1752 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1754 = isnan(1.0);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1760 = _1756 || _1758;
    float _1762 = _1666 + _1746;
    int _1764 = _1742 * _1714;
    int _1766 = _1764 + _1748;
    float _1768 = _1640 + _1738;
    float _1770 = _1660 + _1744;
    float _1772 = _1674 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1774 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1722);
    float _1776 = float(_1766);
    float _1778 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1750);
    out.m_78.x = _1768;
    out.m_78.y = _1770;
    out.m_78.z = _1762;
    float _1780 = fma(_1772, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1550);
    float _1782 = fma(_1772, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1554);
    float _1784 = fma(_1772, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1558);
    out.m_80.x = _1776;
    float _1786 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1774);
    float _1788 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1726);
    float _1790 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1778);
    float _1792 = _1780 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1794 = _1782 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1796 = _1784 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1798 = _1786 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1800 = _1788 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1802 = _1790 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1804 = _1798 + _1792;
    float _1806 = _1800 + _1794;
    float _1808 = _1802 + _1796;
    float _1810 = _1744;
    float _1812 = _1802;
    float _1814 = _1776;
    float _1816 = _1802;
    float _1818 = _1800;
    float _1820 = _1674;
    float _1822 = _1796;
    float _1824 = _1794;
    float _1834;
    float _1836;
    float _1838;
    float _1840;
    if (!_1760)
    {
        bool _1826 = _1794 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1828 = !_1826;
        _1830 = _1828;
        if (!_1830)
        {
            float _1832 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1834 = _1832;
            _1836 = 0.0;
            _1838 = 0.0;
            _1840 = 0.0;
            _1842 = true;
        }
    }
    if ((!_1842) || _1830)
    {
        bool _1878;
        if (!_1830)
        {
            bool _1844 = _1794 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1846 = isnan(_1794);
            bool _1848 = _1844 || _1846;
            bool _1850 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1852 = _1848 || _1850;
            bool _1854 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1856 = !_1852;
            bool _1858 = _1854 && _1856;
            bool _1860 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _1814 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1858)
            {
                _1810 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1862 = _1810;
            float _1864 = _1862;
            if (_1858)
            {
                _1596 = 0.0;
                _191 = 0.0;
            }
            float _1866 = _1596;
            float _1868 = _191;
            _1836 = _1866;
            _1838 = _1868;
            if (_1858)
            {
                _1812 = 0.0;
            }
            float _1870 = _1812;
            _1816 = _1870;
            _1840 = _1870;
            if (_1858)
            {
                float _1872 = _1862 * 5.0;
                _1864 = _1872;
            }
            float _1874 = _1864;
            bool _1876 = !_1852;
            _1878 = _1876 && _1860;
            _1834 = _1874;
        }
        if ((!_1878) || _1830)
        {
            _1830 = false;
            float _1880 = _1814;
            float _1882 = _1816;
            bool _1884 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1886 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1888 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1890 = _1558;
            float _1892 = _1880;
            float _1894 = _1882;
            _1834 = _1808;
            _1836 = _1804;
            _1838 = _1806;
            if (_1884)
            {
                float _1896 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1890 = _1896;
            }
            float _1898 = _1890;
            if (_1884)
            {
                float _1900 = abs(_1480);
                float _1902 = -_1900;
                float _1904 = _1902 + 1.0;
                _1598 = _1904;
            }
            float _1906 = _1598;
            if (_1886)
            {
                float _1908 = abs(_1478);
                float _1910 = -_1908;
                float _1912 = _1910 + 1.0;
                _1600 = _1912;
            }
            float _1914 = _1600;
            if (!_1884)
            {
                _1818 = 1.0;
            }
            float _1916 = _1818;
            float _1918 = _1916;
            if (_1888)
            {
                float _1920 = abs(_1674);
                float _1922 = -_1920;
                float _1924 = _1922 + 1.0;
                _1820 = _1924;
            }
            float _1926 = _1820;
            if (!_1886)
            {
                _1892 = 1.0;
            }
            float _1928 = _1892;
            float _1930 = _1928;
            if (!_1888)
            {
                _1894 = 1.0;
            }
            float _1932 = _1894;
            float _1934 = _1574;
            float _1936 = _1932;
            if (_1886)
            {
                float _1938 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1934 = _1938;
            }
            float _1940 = _1934;
            float _1942 = _1798;
            if (_1888)
            {
                float _1944 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1942 = _1944;
            }
            float _1946 = _1942;
            if (_1884)
            {
                float _1948 = _1906 * _1898;
                float _1950 = precise::clamp(_1948, 0.0, 1.0);
                _1918 = _1950;
            }
            float _1952 = _1918;
            _1602 = _1940;
            if (_1886)
            {
                float _1954 = _1914 * _1940;
                float _1956 = precise::clamp(_1954, 0.0, 1.0);
                _1930 = _1956;
            }
            float _1958 = _1930;
            float _1960 = _1952 * _1958;
            if (_1888)
            {
                float _1962 = _1926 * _1946;
                float _1964 = precise::clamp(_1962, 0.0, 1.0);
                _1936 = _1964;
            }
            float _1966 = _1936;
            float _1968 = _1960 * _1966;
            _1840 = _1968;
        }
    }
    _1842 = false;
    float _1970 = _1834;
    float _1972 = _1836;
    float _1974 = _1838;
    float _1976 = _1602;
    float _1978 = _1840;
    float _1980 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1984 = _1970 + _1982;
    float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1988 = _1972 + _1986;
    float _1990 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1992 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1980);
    bool _1994 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1996 = isnan(0.5);
    bool _1998 = _1994 || _1996;
    bool _2000 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2002 = _1998 || _2000;
    float _2004 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1992);
    bool _2006 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2008 = isnan(0.5);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2014 = _2010 || _2012;
    float _2016 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2018 = _1984 * _1984;
    float _2020 = 1.0 / _2016;
    float _2022 = fma(_1988, _1988, _2018);
    float _2024 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1990);
    float _2026 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2024);
    float _2028 = sqrt(_2022);
    float _2030 = _2026 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2032 = _2030 + _2016;
    float _2034 = _2032 * _2020;
    float _2036 = _2034 * 0.5;
    float _2038 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2040 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2038);
    bool _2042 = _2028 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2044 = 1.0 / _2040;
    bool _2046 = !_2042;
    float _2048 = _1972;
    float _2050 = _1974;
    float _2052 = _1970;
    float _2054 = _1976;
    float _2056 = _2028;
    float _2058 = _1988;
    float _2060 = _2044;
    if (!_2046)
    {
        float _2062 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2066 = _2028 + _2064;
        float _2068 = _1974 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2070 = rsqrt(_2022);
        float _2072 = _2066 * _2062;
        float _2074 = _2072 * 0.15915493667125701904296875;
        float _2076 = _2074 * 6.283185482025146484375;
        float _2078 = cos(_2076);
        float _2080 = _2074 * 6.283185482025146484375;
        float _2082 = sin(_2080);
        float _2084 = _2078 + (-1.0);
        float _2086 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2088 = fma(_2082, _2068, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2090 = fma(_2078, _1974, _2086);
        float _2092 = _2070 * _2088;
        float _2094 = fma(_1988, _2092, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2096 = fma(_1984, _2092, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2048 = _2094;
        _2050 = _2090;
        _2052 = _2096;
        _2054 = _2074;
        _2056 = _2082;
    }
    float _2098 = _2048;
    float _2100 = _2050;
    float _2102 = _2052;
    float _2104 = _2054;
    float _2106 = _2056;
    float _2108 = _2106;
    float _2110 = _2104;
    float _2112 = _2100;
    float _2114 = _2098;
    float _2116 = _2102;
    if (_2014)
    {
        _2108 = 1.0;
    }
    float _2118 = _2108;
    float _2120 = _2118;
    if (!_2002)
    {
        float _2122 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2124 = _1794 + _2122;
        float _2126 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2128 = _1792 + _2126;
        float _2130 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2132 = _2124 * _2124;
        float _2134 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2136 = _1796 + _2134;
        float _2138 = fma(_2128, _2128, _2132);
        float _2140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2142 = fma(_2136, _2136, _2138);
        float _2144 = sqrt(_2142);
        float _2146 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2148 = precise::min(_2144, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2150 = _2148 * _2140;
        float _2152 = -_1792;
        float _2154 = _2152 + _2098;
        float _2156 = _2146 * _2150;
        float _2158 = -_1794;
        float _2160 = _2158 + _2100;
        float _2162 = -_1796;
        float _2164 = _2162 + _2102;
        float _2166 = fma(_2154, _2156, _1792);
        float _2168 = fma(_2160, _2156, _1794);
        float _2170 = fma(_2164, _2156, _1796);
        _2110 = _2156;
        _2112 = _2168;
        _2114 = _2166;
        _2116 = _2170;
    }
    float _2172 = _2110;
    float _2174 = _2112;
    float _2176 = _2114;
    float _2178 = _2116;
    float _2180 = _2172;
    if (_2014)
    {
        _2058 = 1.0;
    }
    float _2182 = _2058;
    float _2184 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2186 = _2044 * _2184;
    float _2188 = _2182;
    if (!_2014)
    {
        float _2190 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2192 = _2190 * 0.15915493667125701904296875;
        float _2194 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2196 = _2192 * 6.283185482025146484375;
        float _2198 = cos(_2196);
        float _2200 = _2194 * 0.15915493667125701904296875;
        float _2202 = _2192 * 6.283185482025146484375;
        float _2204 = sin(_2202);
        float _2206 = 1.0 / _2198;
        float _2208 = _2200 * 6.283185482025146484375;
        float _2210 = cos(_2208);
        float _2212 = _2204 * _2206;
        float _2214 = _2200 * 6.283185482025146484375;
        float _2216 = sin(_2214);
        float _2218 = _2210 * _2212;
        float _2220 = 1.0 / _2218;
        float _2222 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2224 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2222;
        float _2226 = 1.0 / _2224;
        float _2228 = _2216 * _2220;
        float _2230 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2232 = fma(_2186, _2228, _2230);
        float _2234 = _2232 * _2226;
        float _2236 = precise::clamp(_2234, 0.0, 1.0);
        _2060 = _2200;
        _2180 = _2220;
        _2120 = _2236;
    }
    float _2238 = _2060;
    float _2240 = _2180;
    float _2242 = _2120;
    float _2244 = _2238;
    float _2246 = _2240;
    if (!_2014)
    {
        float _2248 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2250 = _2248 * 0.15915493667125701904296875;
        float _2252 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2254 = _2250 * 6.283185482025146484375;
        float _2256 = cos(_2254);
        float _2258 = _2252 * 0.15915493667125701904296875;
        float _2260 = _2250 * 6.283185482025146484375;
        float _2262 = sin(_2260);
        float _2264 = 1.0 / _2256;
        float _2266 = _2258 * 6.283185482025146484375;
        float _2268 = cos(_2266);
        float _2270 = _2262 * _2264;
        float _2272 = _2258 * 6.283185482025146484375;
        float _2274 = sin(_2272);
        float _2276 = _2268 * _2270;
        float _2278 = 1.0 / _2276;
        float _2280 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2282 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2280;
        float _2284 = 1.0 / _2282;
        float _2286 = _2274 * _2278;
        float _2288 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2290 = fma(_2186, _2286, _2288);
        float _2292 = _2290 * _2284;
        float _2294 = precise::clamp(_2292, 0.0, 1.0);
        float _2296 = -_2294;
        float _2298 = _2296 + 1.0;
        _2244 = _2278;
        _2246 = _2250;
        _2188 = _2298;
    }
    float _2300 = _2244;
    float _2302 = _2246;
    float _2304 = _2188;
    float _2306 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2308 = _2174 + _2306;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2312 = _2176 + _2310;
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2316 = _2178 + _2314;
    float _2318 = _2308 * _2308;
    float _2320 = fma(_2312, _2312, _2318);
    float _2322 = fma(_2316, _2316, _2320);
    float _2324 = rsqrt(_2322);
    float _2326 = sqrt(_2322);
    float _2328 = _2324 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2330 = _2312 * _2328;
    float _2332 = _2316 * _2328;
    float _2334 = _2330 * _2330;
    float _2336 = _2332 * _2332;
    float _2338 = _2334 + _2336;
    float _2340 = sqrt(_2338);
    bool _2342 = _2340 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2346 = _2340 + _2344;
    float _2348 = _2324;
    float _2350 = _2346;
    float _2352 = _2300;
    float _2354 = _2308;
    float _2356 = _2328;
    if (_2342)
    {
        float _2358 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2348 = _2358;
    }
    float _2360 = _2348;
    float _2362 = _2360;
    if (_2342)
    {
        float _2364 = _2346 * _2360;
        _2350 = _2364;
    }
    float _2366 = _2350;
    if (_2342)
    {
        float _2368 = rsqrt(_2338);
        _2362 = _2368;
    }
    float _2370 = _2362;
    float _2372 = _2370;
    if (_2342)
    {
        float _2374 = _2366 * 0.15915493667125701904296875;
        _2352 = _2374;
    }
    float _2376 = _2352;
    float _2378 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2380 = _2316;
    if (_2342)
    {
        float _2382 = _2376 * 6.283185482025146484375;
        float _2384 = sin(_2382);
        _2380 = _2384;
    }
    float _2386 = _2380;
    float _2388 = precise::max(0.0, _2378);
    float _2390 = _2302;
    float _2392 = _2388;
    if (_2342)
    {
        float _2394 = _2376 * 6.283185482025146484375;
        float _2396 = cos(_2394);
        _2390 = _2396;
    }
    float _2398 = _2390;
    float _2400 = -_2328;
    float _2402 = -_2388;
    float _2404 = fma(_2308, _2400, _2402);
    if (_2342)
    {
        float _2406 = _2404 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2354 = _2406;
    }
    float _2408 = _2354;
    float _2410 = _2386;
    float _2412 = _2408;
    if (_2342)
    {
        float _2414 = fma(_2386, _2408, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2410 = _2414;
    }
    float _2416 = _2410;
    float _2418 = _2416;
    if (!_2342)
    {
        _2412 = _2404;
    }
    float _2420 = _2412;
    float _2422 = _2420;
    if (_2342)
    {
        float _2424 = _2370 * _2416;
        _1626 = _2424;
    }
    float _2426 = _1626;
    if (!_2342)
    {
        _2372 = _2330;
    }
    float _2428 = _2372;
    float _2430 = _2428;
    float _2432 = _2398;
    if (_2342)
    {
        float _2434 = _2398 + (-1.0);
        _2392 = _2434;
    }
    float _2436 = _2392;
    float _2438 = _2436;
    if (_2342)
    {
        float _2440 = _2330 * _2426;
        _2430 = _2440;
    }
    float _2442 = _2430;
    if (!_2342)
    {
        _2418 = _2334;
    }
    float _2444 = _2418;
    float _2446 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2448 = _2444;
    if (_2342)
    {
        float _2450 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2356 = _2450;
    }
    float _2452 = _2356;
    if (!_2342)
    {
        _2438 = _2332;
    }
    float _2454 = _2438;
    float _2456 = _2454;
    if (_2342)
    {
        float _2458 = _2442 * _2442;
        _2448 = _2458;
    }
    float _2460 = _2448;
    if (_2342)
    {
        float _2462 = _2332 * _2426;
        _2456 = _2462;
    }
    float _2464 = _2456;
    if (_2342)
    {
        float _2466 = fma(_2404, _2398, _2452);
        _2422 = _2466;
    }
    float _2468 = _2422;
    if (!_2342)
    {
        _2432 = _2336;
    }
    float _2470 = _2432;
    float _2472 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2474 = _2470;
    if (_2342)
    {
        float _2476 = _2464 * _2464;
        _2474 = _2476;
    }
    float _2478 = _2474;
    float _2480 = fma(_2468, _2468, _2460);
    float _2482 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2484 = _2480 + _2478;
    float _2486 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2472);
    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2490 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2488);
    float _2492 = precise::clamp(_2490, 0.0, 1.0);
    float _2494 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2496 = rsqrt(_2484);
    float _2498 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2486);
    float _2500 = -_2492;
    float _2502 = _2500 + 1.0;
    float _2504 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2494);
    float _2506 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2482);
    float _2508 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2510 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2512 = abs(_2502);
    float _2514 = log2(_2512);
    float _2516 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2504);
    float _2518 = _2508 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2520 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2506);
    float _2522 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2510);
    float _2524 = _2516 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2526 = -_2518;
    float _2528 = fma(_2526, _2446, 1.0);
    float _2530 = _2520 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2532 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2522);
    float _2534 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2536 = _2496 * _2442;
    float _2538 = _2496 * _2468;
    float _2540 = _2496 * _2464;
    float _2542 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2534);
    float _2544 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2546 = _2532 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2548 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2550 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2542);
    float _2552 = -_2544;
    float _2554 = fma(_2538, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2552);
    float _2556 = log2(_2528);
    float _2558 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2560 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2550);
    float _2562 = -_2540;
    float _2564 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2554);
    float _2566 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2568 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2558);
    float _2570 = fma(_2564, -0.5, 0.5);
    float _2572 = exp2(_2548);
    float _2574 = fma(_2564, 0.5, 0.5);
    float _2576 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2566);
    float _2578 = _2538 + 1.0;
    float _2580 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2568);
    float _2582 = fma(_2574, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2584 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2576);
    float _2586 = 1.0 / _2560;
    float _2588 = fma(_2574, _2582, -0.212114393711090087890625);
    float _2590 = _2556 * 0.693147182464599609375;
    float _2592 = fma(_2574, _2588, 1.570728778839111328125);
    float _2594 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2596 = sqrt(_2570);
    float _2598 = -_2538;
    float _2600 = fma(_2572, _2578, _2598);
    float _2602 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2584);
    float _2604 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2580);
    float _2606 = fma(_2600, 0.5, 0.5);
    float _2608 = _2602 * _2586;
    float _2610 = _2604 * _2586;
    float _2612 = fma(_2608, 0.5, 0.5);
    float _2614 = fma(_2610, -0.5, 0.5);
    float _2616 = _2596 * 0.636619746685028076171875;
    float3 _6916 = float3(_2612, _2614, _2594);
    float _2618 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6916, float3(0.0), isnan(_6916)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6916, float3(0.0), isnan(_6916)), level(0.0)).x;
    float _2620 = -_2592;
    float _2622 = fma(_2616, _2620, 1.0);
    float3 _6932 = float3(_2612, _2614, _2594);
    float4 _2625 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6932, float3(0.0), isnan(_6932)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6932, float3(0.0), isnan(_6932)), level(0.0)).xyzw;
    float _2627 = _2625.x;
    float _2629 = _2625.y;
    float _2631 = _2625.z;
    float _2633 = _2625.w;
    float2 _6949 = float2(_2622, _2606);
    float3 _2637 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6949, float2(0.0), isnan(_6949)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6949, float2(0.0), isnan(_6949)), level(0.0)).xyz;
    float _2639 = _2637.x;
    float _2641 = _2637.y;
    float _2643 = _2637.z;
    float _2645 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2647 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2649 = _2326 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2651 = isnan(_2326);
    bool _2653 = _2649 || _2651;
    bool _2655 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2657 = _2653 || _2655;
    float _2659 = _2602 + _2560;
    out.m_82.x = _1792;
    out.m_82.y = _1794;
    out.m_82.z = _1796;
    float _2661 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2647);
    float _2663 = exp2(_2645);
    float _2665 = _2560 * 0.5;
    float _2667 = _2659 * 0.5;
    float _2669 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2661);
    float _2671 = fma(_2604, -0.5, _2665);
    float _2673 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2669);
    float _2675 = _2242 * _2304;
    float _2677 = _2673 + _2560;
    out.gl_Position.x = _2602;
    out.gl_Position.y = _2604;
    out.gl_Position.z = _2673;
    out.gl_Position.w = _2560;
    float _2679 = _2560;
    float _2681 = _2602;
    float _2683 = _2604;
    if (!_2657)
    {
        _1822 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2685 = _1822;
    float _2687 = _2675 * _1978;
    float _2689 = _2677 * 0.5;
    float _2691 = -_2663;
    float _2693 = _2691 + 1.0;
    float _2695 = _2687;
    float _2697 = _2685;
    float _2699 = _2685;
    if (!_2657)
    {
        _1824 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2701 = _1824;
    float _2703 = _2693 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _2667;
    out.m_84.y = _2671;
    out.m_84.z = _2689;
    out.m_84.w = _2560;
    float _2705 = _2701;
    float _2707 = _2701;
    if (!_2657)
    {
        _2679 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2709 = _2679;
    float _2711 = _2709;
    float _2713 = _2709;
    if (!_2657)
    {
        _2681 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2715 = _2681;
    float _2717 = _2715;
    float _2719 = _2715;
    if (!_2657)
    {
        _2683 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2721 = _2683;
    float _2723 = _2687 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2725 = _2721;
    float _2727 = _2721;
    if (!_2657)
    {
        _2695 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2729 = _2695;
    float _2731 = _2703 * _2618;
    float _2733 = -_2703;
    float _2735 = _2733 + 1.0;
    float _2737 = _2633 * _2731;
    float _2739 = _2643 * _2731;
    float _2741 = fma(_2639, _2737, _2627);
    float _2743 = fma(_2641, _2737, _2629);
    float _2745 = _2633 * _2735;
    float _2747 = fma(_2633, _2739, _2631);
    out.m_86.x = _2741;
    out.m_86.y = _2743;
    out.m_86.z = _2747;
    out.m_86.w = _2745;
    bool _2749 = !_2657;
    float _2751 = _2729;
    float _2753 = _2729;
    if (!_2749)
    {
        bool _2755 = _2326 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2757 = isnan(_2326);
        bool _2759 = _2755 || _2757;
        bool _2761 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2763 = _2759 || _2761;
        if (!_2763)
        {
            float _2765 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2767 = _2326 + _2765;
            float _2769 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2771 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2769;
            float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2775 = _2773 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2777 = 1.0 / _2771;
            float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2781 = _2779 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2785 = _2783 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2793 = _2791 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2795 = _2767 * _2777;
            float _2797 = precise::clamp(_2795, 0.0, 1.0);
            float _2799 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2801 = _2799 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2803 = fma(_2797, _2775, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2805 = fma(_2797, _2801, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2807 = fma(_2797, _2781, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2809 = fma(_2797, _2785, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2811 = fma(_2797, _2789, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2813 = fma(_2797, _2793, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2719 = _2807;
            _2707 = _2811;
            _2713 = _2803;
            _2699 = _2809;
            _2727 = _2805;
            _2753 = _2813;
            _2815 = true;
        }
        else
        {
            bool _2817 = _2326 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2819 = isnan(_2326);
            bool _2821 = _2817 || _2819;
            bool _2823 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2825 = _2821 || _2823;
            if (!_2825)
            {
                _2711 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2827 = _2711;
            _2713 = _2827;
            if (!_2825)
            {
                _2717 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2829 = _2717;
            _2719 = _2829;
            if (!_2825)
            {
                _2725 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2831 = _2725;
            _2727 = _2831;
            if (!_2825)
            {
                _2697 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2833 = _2697;
            _2699 = _2833;
            if (!_2825)
            {
                _2705 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2835 = _2705;
            _2707 = _2835;
            if (!_2825)
            {
                _2751 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2837 = _2751;
            bool _2839 = !_2825;
            _2753 = _2837;
            if (!_2839)
            {
                bool _2841 = _2326 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2843 = isnan(_2326);
                bool _2845 = _2841 || _2843;
                bool _2847 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2849 = _2845 || _2847;
                if (!_2849)
                {
                    float _2851 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2853 = _2326 + _2851;
                    float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2857 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2855;
                    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2863 = 1.0 / _2857;
                    float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2867 = _2865 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2871 = _2869 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2875 = _2873 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2877 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2879 = _2877 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2881 = _2853 * _2863;
                    float _2883 = precise::clamp(_2881, 0.0, 1.0);
                    float _2885 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2887 = _2885 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2889 = fma(_2883, _2861, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2891 = fma(_2883, _2887, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2893 = fma(_2883, _2867, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2895 = fma(_2883, _2871, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2897 = fma(_2883, _2875, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2899 = fma(_2883, _2879, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2719 = _2893;
                    _2707 = _2897;
                    _2713 = _2889;
                    _2699 = _2895;
                    _2727 = _2891;
                    _2753 = _2899;
                    _2815 = true;
                }
                else
                {
                    _2719 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2707 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2713 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2699 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2727 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2753 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2815 = false;
    float _2901 = _2719;
    float _2903 = _2707;
    float _2905 = _2713;
    float _2907 = _2699;
    float _2909 = _2727;
    float _2911 = _2753;
    float _2913 = fma(_1770, -0.5, 0.5);
    float _2915 = precise::clamp(_2913, 0.0, 1.0);
    float _2917 = -_2901;
    float _2919 = _2917 + _2903;
    float _2921 = -_2905;
    float _2923 = _2921 + _2907;
    out.m_88.x = 0.0;
    float _2925 = fma(_2915, _2919, _2901);
    float _2927 = -_2909;
    float _2929 = _2927 + _2911;
    float _2931 = fma(_2915, _2923, _2905);
    float _2933 = _2925 * 0.586610972881317138671875;
    bool _2935 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2937 = fma(_2915, _2929, _2909);
    float _2939 = _2723 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2941 = fma(_2931, 0.298911988735198974609375, _2933);
    bool _2943 = _2242 > 0.0;
    bool _2945 = isnan(_2242);
    bool _2947 = _2943 || _2945;
    bool _2949 = isnan(0.0);
    bool _2951 = _2947 || _2949;
    float _2953 = fma(_2937, 0.114477999508380889892578125, _2941);
    out.m_53.x = _2939;
    bool _2955 = _2304 <= 0.0;
    bool _2957 = !_2951;
    bool _2959 = _2955 || _2957;
    float _2961 = -_2953;
    float _2963 = _2931 + _2961;
    float _2965 = -_2953;
    float _2967 = _2925 + _2965;
    float _2969 = -_2953;
    float _2971 = _2937 + _2969;
    float _2973 = fma(_2963, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2953);
    float _2975 = fma(_2967, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2953);
    float _2977 = fma(_2971, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2953);
    bool _2979 = !_2935;
    if (!_2979)
    {
        float _2981 = -_2174;
        float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2985 = -_2176;
        float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2989 = -_2178;
        float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2993 = _2983 * _2983;
        float _2995 = fma(_2987, _2987, _2993);
        float _2997 = fma(_2991, _2991, _2995);
        float _2999 = sqrt(_2997);
        float _3001 = rsqrt(_2997);
        float _3003 = -_2999;
        float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3007 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3009 = precise::clamp(_3007, 0.0, 1.0);
        float _3011 = _2987 * _3001;
        float _3013 = _2983 * _3001;
        float _3015 = abs(_3009);
        float _3017 = log2(_3015);
        float _3019 = _2991 * _3001;
        float _3021 = _3011 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3023 = _1770 * _3013;
        float _3025 = -_3013;
        float _3027 = -_3021;
        float _3029 = fma(_3025, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3027);
        float _3031 = fma(_1768, _3011, _3023);
        float _3033 = -_3019;
        float _3035 = fma(_3033, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3029);
        float _3037 = fma(_1762, _3019, _3031);
        float _3039 = precise::clamp(_3037, 0.0, 1.0);
        float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3043 = _3035 + _3041;
        float _3045 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3047 = _3043 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3049 = precise::clamp(_3047, 0.0, 1.0);
        float _3051 = exp2(_3045);
        float _3053 = _3051 * _3049;
        float _3055 = _3039 * _3053;
        float _3057 = _3055 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3059 = _3055 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3061 = _3055 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3057;
        out.m_88.y = _3059;
        out.m_88.z = _3061;
    }
    out.m_90.x = _2973;
    out.m_90.y = _2975;
    out.m_90.z = _2977;
    if (!_2959)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3063 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3063;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2815 = false;
    bool _1842 = false;
    bool _1830 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
    float _106 = in.m_48.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_111);
    float _125 = _115;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _121;
    if (!_119)
    {
        out.m_53.x = 0.0;
    }
    int _129 = 0;
    if (!_119)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3132 = as_type<float>(_133);
        out.gl_Position.z = _3132;
    }
    if (!_119)
    {
        return out;
    }
    bool _137 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_106);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = in.m_55.x;
    float _149 = float(_111);
    bool _151 = _115 >= _149;
    bool _153 = !_145;
    bool _155 = _151 || _153;
    if (_155)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _123;
    if (_155)
    {
        out.m_53.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _135 = as_type<int>(_159);
    }
    int _161 = _135;
    out.m_57.x = _147;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3191 = as_type<float>(_161);
        out.gl_Position.z = _3191;
    }
    if (_155)
    {
        return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = 1.0 / _149;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _169 = _115 * _165;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_167;
    float _189 = _169;
    float _191 = _181;
    if (!_187)
    {
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _195 = _147 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _189 = _205;
    }
    float _207 = _189;
    float _209 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _211 = int(_209);
    float _213 = in.m_46.x;
    float _215 = in.m_46.y;
    float _217 = in.m_46.z;
    float _219 = _147 * 2.0;
    int _221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _223 = _221 != 0;
    float _225 = in.m_62.x;
    float _227 = in.m_62.y;
    float _229 = in.m_62.z;
    float _231 = in.m_62.w;
    float _233 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _235 = int(_233);
    int _237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _239 = _237 != 0;
    int _241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _243 = _241 != 0;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _247 = _245 != 0;
    float _249 = in.m_64.x;
    float _251 = in.m_64.y;
    float _253 = in.m_64.z;
    float _255 = in.m_64.w;
    float _257 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _259 = in.m_66.x;
    float _261 = in.m_66.y;
    float _263 = in.m_66.z;
    float _265 = in.m_66.w;
    bool _267 = !_239;
    int _269 = _267 ? 0 : 1;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _273 = float(_211);
    float _275 = in.m_55.w;
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _279 = _277 != 0;
    float _281 = floor(_219);
    bool _283 = !_243;
    int _285 = _283 ? 0 : 1;
    float _287 = in.m_55.y;
    bool _289 = _147 > 0.5;
    float _291 = float(uint(_235));
    float _293 = -_181;
    int _295 = _289 ? as_type<int>(_293) : as_type<int>(_181);
    float _297 = 1.0 / _273;
    float _299 = _215 * _227;
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _303 = _301 != 0;
    float _305 = _215 * _251;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _311 = 1.0 / _291;
    float _313 = _215 * _261;
    float _315 = fma(_213, _225, _299);
    float _317 = fma(_213, _249, _305);
    float _319 = in.m_55.z;
    bool _321 = _275 > 0.5;
    float _323 = fma(_217, _229, _315);
    float _325 = _297 * _115;
    float _327 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _329 = -_185;
    int _331 = _321 ? as_type<int>(_329) : as_type<int>(_185);
    float _333 = fma(_213, _259, _313);
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _337 = _335 != 0;
    float _339 = -_271;
    float _341 = fma(_327, 2.0, _339);
    float _343 = trunc(_325);
    int _345 = int(_343);
    bool _347 = !_279;
    float _349 = _347 ? _185 : as_type<float>(_331);
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _353 = as_type<int>(_311) + (-2);
    float _355 = _287 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _357 = !_337;
    int _359 = _357 ? 0 : 1;
    float _361 = fma(_217, _253, _317);
    int _363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _365 = _363 != 0;
    float _367 = fma(_355, -2.0, _351);
    float _369 = 1.0 / _309;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _373 = _371 != 0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _375;
    bool _379 = !_365;
    float _381 = _379 ? _181 : as_type<float>(_295);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _391 = float(uint(_345));
    float _393 = fma(_217, _263, _333);
    bool _395 = _287 > 0.5;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _401 = !_373;
    int _403 = _401 ? 0 : 1;
    float _405 = as_type<float>(_353) * _391;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _409 = _407 != 0;
    float _411 = 1.0 / _385;
    float _413 = -_185;
    int _415 = _395 ? as_type<int>(_413) : as_type<int>(_185);
    float _417 = _377 * _369;
    bool _419 = _319 > 0.5;
    float _421 = _287 + _319;
    int _423 = ~_235;
    int _425 = _423 + 1;
    float _427 = _287 * 2.0;
    float _429 = _147 + _319;
    float _431 = trunc(_405);
    float _433 = precise::max(_431, 0.0);
    uint _436 = uint(_433);
    float _438 = _421 + (-1.0);
    float _440 = _429 + (-1.0);
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _444 = _442 != 0;
    float _446 = -_115;
    float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[76].x, _341);
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _452 = _450 != 0;
    float _454 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _456 = _389 * _411;
    bool _458 = !_409;
    float _460 = _458 ? _185 : as_type<float>(_415);
    float _462 = _147 + _287;
    float _464 = -_181;
    int _466 = _419 ? as_type<int>(_464) : as_type<int>(_181);
    float _468 = 1.0 / _399;
    bool _470 = _281 > 0.0;
    float _472 = _462 + (-1.0);
    bool _474 = _281 >= 0.0;
    bool _476 = isnan(_281);
    bool _478 = _474 || _476;
    bool _480 = isnan(0.0);
    bool _482 = _478 || _480;
    int _484 = _425 * int(_436);
    int _486 = _484 + _345;
    float _488 = float(_235);
    float _490 = _381 + 0.5;
    int _492 = ~_235;
    int _494 = _492 + 1;
    float _496 = floor(_427);
    float _498 = float(uint(_486));
    float _500 = _488 * _115;
    float _502 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[80].x, _448);
    int _504 = _482 ? 0 : 1;
    float _506 = as_type<float>(_353) * _498;
    float _508 = _500 * _165;
    float _510 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _512 = trunc(_506);
    float _514 = precise::max(_512, 0.0);
    uint _516 = uint(_514);
    float _518 = _393 + _265;
    bool _520 = !_223;
    float _522 = _520 ? 7.345489978790283203125 : 1.0;
    float _524 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _367);
    bool _526 = !_247;
    int _528 = _526 ? 0 : 1;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _530;
    bool _534 = _496 > 0.0;
    float _536 = _522 * _147;
    float _538 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _540 = ~_504;
    int _542 = _540 + 1;
    int _544 = _542 + 1;
    float _546 = in.m_68.x;
    float _548 = in.m_68.y;
    int _550 = _544;
    float _552 = _468;
    if (!_470)
    {
        int _554 = ~_504;
        int _556 = _554 + 1;
        _550 = _556;
    }
    int _558 = _550;
    float _560 = _532 * _468;
    float _562 = floor(_536);
    if (!_223)
    {
        _552 = _287;
    }
    float _564 = _552;
    float _566 = _361 + _255;
    int _568 = int(_436) + int(_516);
    float _570 = _323 + _231;
    bool _572 = !_303;
    float _574 = _572 ? _181 : as_type<float>(_466);
    float _576 = _319 * 2.0;
    bool _578 = _496 >= 0.0;
    bool _580 = isnan(_496);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    int _588 = _494 * _568;
    int _590 = _588 + _345;
    float _592 = 0.0;
    float _594 = _564;
    if (!_223)
    {
        _592 = _319;
    }
    float _596 = _592;
    float _598 = floor(_576);
    int _600 = _586 ? 0 : 1;
    float _602 = _570 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _604 = uint(_590) >= uint(_235);
    float _606 = _518 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    int _608 = ~_600;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    float _614 = -_562;
    float _616 = _536 + _614;
    bool _618 = !_604;
    int _620 = _618 ? 0 : (-1);
    float _622 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _624 = log2(_622);
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _628 = _626 != 0;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _632 = _630 != 0;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _636 = _634 != 0;
    float _638 = _616 * _488;
    float _640 = _546 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _642 = _612;
    float _644 = _546;
    float _646 = _596;
    bool _648 = _632;
    if (!_534)
    {
        int _650 = ~_600;
        int _652 = _650 + 1;
        _642 = _652;
    }
    int _654 = _642;
    float _656 = _548 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _658 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _660 = _640 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _662 = 0.0;
    float _664 = _658;
    if (!_223)
    {
        _662 = _319;
    }
    float _666 = _662;
    float _668 = _666;
    if (_444)
    {
        float _670 = _275 * 3.1415927410125732421875;
        _644 = _670;
    }
    float _672 = _644;
    if (_223)
    {
        _594 = _147;
    }
    float _674 = _594;
    float _676 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_223)
    {
        _646 = _287;
    }
    float _678 = _646;
    float _680 = _660 * _658;
    if (_223)
    {
        _668 = _287;
    }
    float _682 = _668;
    if (_452)
    {
        float _684 = _147 * 3.1415927410125732421875;
        _664 = _684;
    }
    float _686 = _664;
    bool _688 = _598 > 0.0;
    float _690 = 0.0;
    if (_444)
    {
        float _692 = _672 * 0.15915493667125701904296875;
        _690 = _692;
    }
    float _694 = _690;
    bool _696 = _598 >= 0.0;
    bool _698 = isnan(_598);
    bool _700 = _696 || _698;
    bool _702 = isnan(0.0);
    bool _704 = _700 || _702;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _708 = _207 + _706;
    float _710 = _676 * _257;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _714 = _207 + _712;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _718 = _207 + _716;
    float _720 = fma(_417, _708, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _722 = 0.0;
    bool _724 = _704;
    if (_452)
    {
        float _726 = _686 * 0.15915493667125701904296875;
        _722 = _726;
    }
    float _728 = _722;
    bool _730 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _732 = isnan(_207);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    float _742 = fma(_456, _714, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _744 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _746 = isnan(_207);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = fma(_560, _718, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _758 = _694;
    if (_444)
    {
        float _760 = _694 * 6.283185482025146484375;
        float _762 = sin(_760);
        _758 = _762;
    }
    float _764 = _758;
    bool _766 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _768 = isnan(_207);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = -_740;
    float _780 = _778 + 1.0;
    bool _782 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _784 = isnan(_207);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -_754;
    float _796 = _794 + 1.0;
    float _798 = _754 * _780;
    float _800 = _728;
    if (_452)
    {
        float _802 = _728 * 6.283185482025146484375;
        float _804 = sin(_802);
        _800 = _804;
    }
    float _806 = _800;
    float _808 = _792 * _796;
    float _810 = -_792;
    float _812 = _810 + 1.0;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _816 = !_632;
    int _818 = _816 ? 0 : 1;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _822 = _776 * _812;
    int _824 = _704 ? 0 : 1;
    float _826 = _624 * _115;
    if (_444)
    {
        bool _828 = _764 > 0.5;
        _648 = _828;
    }
    bool _830 = _648;
    float _832 = _720 * _822;
    float _834 = _460 + (-0.5);
    float _836 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[83].w, _820);
    float _838 = _674 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_452)
    {
        bool _842 = _806 > 0.5;
        _724 = _842;
    }
    bool _844 = _724;
    float _846 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[83].z, _814);
    float _848 = float(_345);
    float _850 = -_834;
    float _852 = -_524;
    float _854 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[80].y, _852);
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _858 = _678 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _860 = _848 >= _488;
    bool _862 = isnan(_848);
    bool _864 = _860 || _862;
    bool _866 = isnan(_488);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _874 = ~_568;
    int _876 = _874 + _620;
    int _878 = _876 + 1;
    float _880 = -_856;
    float _882 = fma(_838, 2.0, _880);
    float _884 = -_776;
    float _886 = _884 + 1.0;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _890 = !_628;
    int _892 = _890 ? 0 : 1;
    float _894 = -_115;
    float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[81].x, _882);
    float _898 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[115].x, _832);
    float _900 = exp2(_826);
    float _902 = fma(_858, -2.0, _888);
    int _904 = ~_824;
    int _906 = _904 + 1;
    int _908 = _906 + 1;
    float _910 = fma(_742, _808, _898);
    int _912 = _908;
    if (!_688)
    {
        int _914 = ~_824;
        int _916 = _914 + 1;
        _912 = _916;
    }
    int _918 = _912;
    int _920 = _235 * _878;
    int _922 = _920 + _345;
    float _924 = _840 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _926 = trunc(_870);
    int _928 = int(_926);
    bool _930 = _235 == 0;
    float _932 = _872 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _934 = _574 + 0.5;
    float _936 = _349 + (-0.5);
    float _938 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[81].y, _902);
    bool _940 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _942 = isnan(0.0);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _948 = _944 || _946;
    float _950 = fma(_924, _934, _896);
    float _952 = -_900;
    float _954 = _952 + 1.0;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _958 = 1.0 + _956;
    bool _960 = !_930;
    int _962 = _960 ? _922 : (-1);
    float _964 = -_932;
    float _966 = -_938;
    float _968 = fma(_964, _936, _966);
    float _970 = 1.0 / _958;
    float _972 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].z, _846);
    int _974 = ~_928;
    int _976 = _974 + 1;
    int _978 = _976 + 1;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _982 = _948 ? _954 : 0.0;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _986 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _988 = isnan(1.0);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _994 = _990 || _992;
    int _996 = _962 * _978;
    int _998 = _235 + (-1);
    float _1000 = trunc(_508);
    int _1002 = int(_1000);
    float _1004 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[78].w, _984);
    float _1006 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].w, _836);
    int _1008 = abs(_359);
    int _1010 = _928 * _998;
    int _1012 = _1010 + _996;
    int _1014 = abs(_285);
    float _1016 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].z, _980);
    int _1018 = abs(_403);
    float _1020 = trunc(_638);
    int _1022 = int(_1020);
    float _1024 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1004);
    float _1026 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1016);
    if (_994)
    {
        float _1028 = _982 * _970;
        _125 = _1028;
    }
    float _1030 = _125;
    float _1032 = _566 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _1034 = _1012 * _1014;
    float _1036 = float(_918);
    float _1038 = _287 + (-0.5);
    float _1040 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _1042 = abs(_269);
    float _1044 = _1032 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1046 = _1032 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1048 = fma(_602, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1044);
    int _1050 = abs(_528);
    int _1052 = _1022 * _1018;
    int _1054 = _1052 + _345;
    float _1056 = fma(_602, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1046);
    int _1058 = _1002 * _1042;
    int _1060 = _1058 + _1034;
    float _1062 = _1032 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1064 = fma(_756, _798, _910);
    int _1066 = abs(_892);
    float _1068 = fma(_606, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1048);
    float _1070 = in.m_70.x;
    float _1072 = in.m_70.y;
    float _1074 = in.m_70.z;
    float _1076 = float(uint(_1054));
    float _1078 = fma(_602, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1062);
    int _1080 = _1054 * _1050;
    int _1082 = _1080 + _1060;
    float _1084 = float(_1066);
    float _1086 = _1068 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1088 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1090 = as_type<float>(_353) * _1076;
    int _1092 = _1022 * _1008;
    int _1094 = _1092 + _1082;
    float _1096 = _1086 * _1040;
    float _1098 = _1084 * _1036;
    float _1100 = fma(_606, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1078);
    float _1102 = fma(_606, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1056);
    float _1104 = fma(_1096, 0.5, 0.5);
    float _1106 = _1098 * (-2.0);
    float _1108 = float(uint(_1094));
    float _1110 = _1100 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    bool _1112 = !_636;
    int _1114 = _1112 ? 0 : 1;
    float _1116 = fma(_538, _1106, _538);
    int _1118 = abs(_818);
    float _1120 = as_type<float>(_353) * _1108;
    int _1122 = abs(_1114);
    float _1124 = _1110 * _1088;
    float _1126 = float(_558);
    float _1128 = fma(_1106, _1070, _1070);
    float _1130 = _147 + (-0.5);
    float _1132 = trunc(_1120);
    float _1134 = precise::max(_1132, 0.0);
    uint _1136 = uint(_1134);
    float _1138 = fma(_1124, 0.5, 0.5);
    float _1140 = float(_654);
    float _1142 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1128);
    float _1144 = float(_1122);
    float _1146 = _1102 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1148 = float(_1118);
    float _1150 = fma(_1116, _1030, _1142);
    int _1152 = ~_235;
    int _1154 = _1152 + 1;
    float _1156 = _1144 * _1140;
    float _1158 = trunc(_1090);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    float _1164 = _1148 * _1126;
    float _1166 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1064);
    float _1168 = _1150 * 0.15915493667125701904296875;
    float _1170 = _1164 * (-2.0);
    float _1172 = _1156 * (-2.0);
    int _1174 = _1154 * int(_1136);
    int _1176 = _1174 + _1094;
    float _1178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1180 = fma(_510, _1170, _510);
    float _1182 = fma(_1170, _1072, _1072);
    int _1184 = ~_235;
    int _1186 = _1184 + 1;
    float _1188 = _1166 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1190 = float(uint(_1176));
    float _1192 = fma(_454, _1172, _454);
    float _1194 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1182);
    float _1196 = _1182;
    float _1198 = as_type<float>(_1186);
    if (!_444)
    {
        _1196 = _181;
    }
    float _1200 = _1196;
    float _1202 = as_type<float>(_353) * _1190;
    float _1204 = fma(_1172, _1074, _1074);
    float _1206 = fma(_1180, _1030, _1194);
    int _1208 = _1186 * int(_1162);
    int _1210 = _1208 + _1054;
    float _1212 = trunc(_1202);
    float _1214 = precise::max(_1212, 0.0);
    uint _1216 = uint(_1214);
    float _1218 = _1200;
    if (_444)
    {
        float _1220 = -_181;
        float _1222 = _830 ? _1220 : _181;
        _1218 = _1222;
    }
    float _1224 = _1218;
    float _1226 = _319 + (-0.5);
    if (!_452)
    {
        _1198 = _185;
    }
    float _1228 = _1198;
    float _1230 = _1206 * 0.15915493667125701904296875;
    float _1232 = _1228;
    if (_452)
    {
        float _1234 = -_185;
        float _1236 = _844 ? _1234 : _185;
        _1232 = _1236;
    }
    float _1238 = _1232;
    float _1240 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1204);
    float _1242 = float(uint(_1210));
    float _1244 = _1224 + 0.5;
    float _1246 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1248 = -_1238;
    float _1250 = _1248 + 0.5;
    float _1252 = fma(_1192, _1030, _1240);
    float _1254 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1256 = as_type<float>(_353) * _1242;
    float _1258 = -_1026;
    float _1260 = _1258 + 1.0;
    float _1262 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1264 = _1254 * _1178;
    float _1266 = _1252 * 0.15915493667125701904296875;
    float _1268 = -_1260;
    float _1270 = fma(_381, _1268, _502);
    float _1272 = -_1006;
    float _1274 = _1272 + 1.0;
    float _1276 = _1168 * 6.283185482025146484375;
    float _1278 = cos(_1276);
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1282 = int(_1136) + int(_1216);
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1286 = ~_235;
    int _1288 = _1286 + 1;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1292 = fma(_349, _1274, _968);
    float _1294 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1296 = _1266 * 6.283185482025146484375;
    float _1298 = cos(_1296);
    int _1300 = _1288 * _1282;
    int _1302 = _1300 + _1094;
    float _1304 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1308 = _1146 * _1246;
    float _1310 = -_1024;
    float _1312 = _1310 + 1.0;
    bool _1314 = uint(_1302) >= uint(_235);
    float _1316 = -_972;
    float _1318 = _1316 + 1.0;
    float _1320 = floor(_1104);
    out.m_72.x = _1294;
    out.m_72.y = _1304;
    out.m_72.z = _1306;
    out.m_72.w = _1188;
    float _1322 = fma(_460, _1312, _854);
    float _1324 = -_1318;
    float _1326 = fma(_574, _1324, _950);
    float _1328 = fma(_1308, 0.5, 0.5);
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1332 = _1330 != 0;
    float _1334 = _1168 * 6.283185482025146484375;
    float _1336 = sin(_1334);
    out.m_74.x = _1270;
    out.m_74.y = _1322;
    out.m_74.z = _1326;
    out.m_74.w = _1292;
    bool _1338 = !_1314;
    int _1340 = _1338 ? 0 : (-1);
    float _1342 = _1230 * 6.283185482025146484375;
    float _1344 = sin(_1342);
    float _1346 = _1278 * _1298;
    float _1348 = -_1320;
    float _1350 = _1104 + _1348;
    int _1352 = ~_1282;
    int _1354 = _1352 + _1340;
    int _1356 = _1354 + 1;
    float _1358 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1360 = ~_235;
    int _1362 = _1360 + 1;
    float _1364 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1366 = _1230 * 6.283185482025146484375;
    float _1368 = cos(_1366);
    float _1370 = _1266 * 6.283185482025146484375;
    float _1372 = sin(_1370);
    float _1374 = _1336 * _1344;
    float _1376 = _1278 * _1344;
    float _1378 = _1344 * _1298;
    float _1380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _1382 = _235 * _1356;
    int _1384 = _1382 + _1094;
    float _1386 = _1278 * _1368;
    float _1388 = _1336 * _1368;
    float _1390 = _1368 * _1298;
    float _1392 = _1346 * _710;
    bool _1394 = !_930;
    int _1396 = _1394 ? _1384 : (-1);
    float _1398 = trunc(_1256);
    float _1400 = precise::max(_1398, 0.0);
    uint _1402 = uint(_1400);
    float _1404 = -_1372;
    float _1406 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1358);
    int _1408 = _1396 >> 31;
    float _1410 = fma(_1372, _1386, _1374);
    float _1412 = fma(_1372, _1374, _1386);
    float _1414 = -_1388;
    float _1416 = fma(_1372, _1376, _1414);
    int _1418 = _1408 & 3;
    float _1420 = fma(_1410, _680, _1392);
    float _1422 = floor(_1138);
    float _1424 = _1262 * _1380;
    int _1426 = _1396 + _1418;
    int _1428 = _1396 & 3;
    bool _1430 = _1428 != 0;
    out.m_76.x = _1264;
    out.m_76.y = _1424;
    int _1432 = _1426 >> 2;
    float _1434 = floor(_1328);
    int _1436 = int(_1162) + int(_1402);
    float _1438 = -_1376;
    float _1440 = fma(_1372, _1388, _1438);
    float _1442 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1444 = _1432 << 4;
    int _1446 = _1444 + 368;
    float _1448 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1450 = _1362 * _1436;
    int _1452 = _1450 + _1054;
    int _1454 = _1396 & 3;
    bool _1456 = _1454 != 0;
    float _1458 = -_1422;
    float _1460 = _1138 + _1458;
    float _1462 = _1336 * _1298;
    float _1464 = -_1372;
    float _1466 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1442);
    float _1468 = -_1372;
    float _1470 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1364);
    float _1472 = -_710;
    float _1474 = _1372 * _1472;
    float _1476 = _1462 * _710;
    float _1478 = fma(_1460, 2.0, -1.0);
    float _1480 = fma(_1350, 2.0, -1.0);
    float _1482 = fma(_1390, _680, _1474);
    float _1484 = fma(_1440, _680, _1476);
    float _1486 = _1478 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1488 = -_1434;
    float _1490 = _1328 + _1488;
    float _1492 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1494 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1496 = _1486 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1498 = _1486 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1500 = _1486 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    int _1502 = _1446 + 8;
    uint _1504 = uint(int(uint(_1502) >> uint(2)));
    uint _1506 = uint(int(uint(int(_1504)) >> uint(2)));
    int _1508 = int(_1504) & 3;
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[int(_1506)][_1508];
    int _1512 = int(_1504) + 1;
    uint _1514 = uint(int(uint(_1512) >> uint(2)));
    int _1516 = _1512 & 3;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[int(_1514)][_1516];
    bool _1520 = uint(_1452) >= uint(_235);
    float _1522 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1466);
    float _1524 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1526 = _1480 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    bool _1528 = uint(_1454) > 1u;
    float _1530 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1492);
    float _1532 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1524);
    uint _1534 = uint(int(uint(_1446) >> uint(2)));
    uint _1536 = uint(int(uint(int(_1534)) >> uint(2)));
    int _1538 = int(_1534) & 3;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[int(_1536)][_1538];
    int _1542 = int(_1534) + 1;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    int _1546 = _1542 & 3;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[int(_1544)][_1546];
    float _1550 = fma(_1526, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1496);
    int _1552 = _1430 ? 0 : 1;
    float _1554 = fma(_1526, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1498);
    bool _1556 = _1454 != 3;
    float _1558 = fma(_1526, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1500);
    float _1560 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1562 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1406);
    float _1564 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1470);
    float _1566 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1448);
    float _1568 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1494);
    float _1570 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1572 = uint(_1454) >= 2u;
    float _1574 = fma(_1378, _1560, _1482);
    float _1576 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1578 = fma(_1416, _1560, _1420);
    float _1580 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1570);
    int _1582 = _1572 ? 0 : 1;
    float _1584 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1576);
    int _1586 = ~_1552;
    int _1588 = _1586 + 1;
    int _1590 = _1588 + 1;
    float _1592 = fma(_1412, _1560, _1484);
    int _1594 = _1590;
    float _1596 = _1592;
    float _1598 = _1480;
    float _1600 = _1478;
    float _1602 = _1574;
    if (!_1528)
    {
        int _1604 = ~_1552;
        int _1606 = _1604 + 1;
        _1594 = _1606;
    }
    int _1608 = _1594;
    float _1610 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1530);
    int _1612 = ~_1582;
    int _1614 = _1612 + 1;
    int _1616 = _1614 + 1;
    float _1618 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1566);
    bool _1620 = _1454 != 3;
    float _1622 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1568);
    int _1624 = _1616;
    float _1626 = _1622;
    if (_1556)
    {
        int _1628 = ~_1582;
        int _1630 = _1628 + 1;
        _1624 = _1630;
    }
    int _1632 = _1624;
    float _1634 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1636 = !_1456;
    int _1638 = _1636 ? 0 : 1;
    float _1640 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1532);
    int _1642 = abs(_1608);
    float _1644 = _1634 * _1562;
    int _1646 = abs(_1632);
    float _1648 = _1634 * _1564;
    int _1650 = abs(_1638);
    float _1652 = _1634 * _1522;
    int _1654 = ~_1642;
    int _1656 = _1654 + 1;
    int _1658 = _1656 + 1;
    float _1660 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1580);
    bool _1662 = !_1620;
    int _1664 = _1662 ? 0 : (-1);
    float _1666 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1584);
    int _1668 = ~_1650;
    int _1670 = _1668 + 1;
    int _1672 = _1670 + 1;
    float _1674 = fma(_1490, 2.0, -1.0);
    bool _1676 = !_1520;
    int _1678 = _1676 ? 0 : (-1);
    int _1680 = abs(_1664);
    int _1682 = ~_1436;
    int _1684 = _1682 + _1678;
    int _1686 = _1684 + 1;
    int _1688 = _1658 * as_type<int>(_1548);
    int _1690 = ~_1646;
    int _1692 = _1690 + 1;
    int _1694 = _1692 + 1;
    int _1696 = _1672 * as_type<int>(_1540);
    int _1698 = _1696 + _1688;
    bool _1700 = !_1332;
    int _1702 = _1700 ? 0 : 1;
    int _1704 = _235 * _1686;
    int _1706 = _1704 + _1054;
    float _1708 = _1578 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1710 = _1694 * as_type<int>(_1510);
    int _1712 = _1710 + _1698;
    int _1714 = abs(_1702);
    int _1716 = ~_1680;
    int _1718 = _1716 + 1;
    int _1720 = _1718 + 1;
    float _1722 = _1578 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1724 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1726 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1708);
    int _1728 = _1720 * as_type<int>(_1518);
    int _1730 = _1728 + _1712;
    int _1732 = ~_1714;
    int _1734 = _1732 + 1;
    int _1736 = _1734 + 1;
    float _1738 = fma(_1724, _1610, _1644);
    bool _1740 = !_930;
    int _1742 = _1740 ? _1706 : (-1);
    float _1744 = fma(_1724, _1618, _1652);
    float _1746 = fma(_1724, _1622, _1648);
    int _1748 = _1730 * _1736;
    float _1750 = _1578 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1752 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1754 = isnan(1.0);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1760 = _1756 || _1758;
    float _1762 = _1666 + _1746;
    int _1764 = _1742 * _1714;
    int _1766 = _1764 + _1748;
    float _1768 = _1640 + _1738;
    float _1770 = _1660 + _1744;
    float _1772 = _1674 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1774 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1722);
    float _1776 = float(_1766);
    float _1778 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1750);
    out.m_78.x = _1768;
    out.m_78.y = _1770;
    out.m_78.z = _1762;
    float _1780 = fma(_1772, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1550);
    float _1782 = fma(_1772, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1554);
    float _1784 = fma(_1772, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1558);
    out.m_80.x = _1776;
    float _1786 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1774);
    float _1788 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1726);
    float _1790 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1778);
    float _1792 = _1780 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1794 = _1782 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1796 = _1784 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1798 = _1786 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1800 = _1788 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1802 = _1790 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1804 = _1798 + _1792;
    float _1806 = _1800 + _1794;
    float _1808 = _1802 + _1796;
    float _1810 = _1744;
    float _1812 = _1802;
    float _1814 = _1776;
    float _1816 = _1802;
    float _1818 = _1800;
    float _1820 = _1674;
    float _1822 = _1796;
    float _1824 = _1794;
    float _1834;
    float _1836;
    float _1838;
    float _1840;
    if (!_1760)
    {
        bool _1826 = _1794 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1828 = !_1826;
        _1830 = _1828;
        if (!_1830)
        {
            float _1832 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1834 = _1832;
            _1836 = 0.0;
            _1838 = 0.0;
            _1840 = 0.0;
            _1842 = true;
        }
    }
    if ((!_1842) || _1830)
    {
        bool _1878;
        if (!_1830)
        {
            bool _1844 = _1794 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1846 = isnan(_1794);
            bool _1848 = _1844 || _1846;
            bool _1850 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1852 = _1848 || _1850;
            bool _1854 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1856 = !_1852;
            bool _1858 = _1854 && _1856;
            bool _1860 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _1814 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1858)
            {
                _1810 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1862 = _1810;
            float _1864 = _1862;
            if (_1858)
            {
                _1596 = 0.0;
                _191 = 0.0;
            }
            float _1866 = _1596;
            float _1868 = _191;
            _1836 = _1866;
            _1838 = _1868;
            if (_1858)
            {
                _1812 = 0.0;
            }
            float _1870 = _1812;
            _1816 = _1870;
            _1840 = _1870;
            if (_1858)
            {
                float _1872 = _1862 * 5.0;
                _1864 = _1872;
            }
            float _1874 = _1864;
            bool _1876 = !_1852;
            _1878 = _1876 && _1860;
            _1834 = _1874;
        }
        if ((!_1878) || _1830)
        {
            _1830 = false;
            float _1880 = _1814;
            float _1882 = _1816;
            bool _1884 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1886 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1888 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1890 = _1558;
            float _1892 = _1880;
            float _1894 = _1882;
            _1834 = _1808;
            _1836 = _1804;
            _1838 = _1806;
            if (_1884)
            {
                float _1896 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1890 = _1896;
            }
            float _1898 = _1890;
            if (_1884)
            {
                float _1900 = abs(_1480);
                float _1902 = -_1900;
                float _1904 = _1902 + 1.0;
                _1598 = _1904;
            }
            float _1906 = _1598;
            if (_1886)
            {
                float _1908 = abs(_1478);
                float _1910 = -_1908;
                float _1912 = _1910 + 1.0;
                _1600 = _1912;
            }
            float _1914 = _1600;
            if (!_1884)
            {
                _1818 = 1.0;
            }
            float _1916 = _1818;
            float _1918 = _1916;
            if (_1888)
            {
                float _1920 = abs(_1674);
                float _1922 = -_1920;
                float _1924 = _1922 + 1.0;
                _1820 = _1924;
            }
            float _1926 = _1820;
            if (!_1886)
            {
                _1892 = 1.0;
            }
            float _1928 = _1892;
            float _1930 = _1928;
            if (!_1888)
            {
                _1894 = 1.0;
            }
            float _1932 = _1894;
            float _1934 = _1574;
            float _1936 = _1932;
            if (_1886)
            {
                float _1938 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1934 = _1938;
            }
            float _1940 = _1934;
            float _1942 = _1798;
            if (_1888)
            {
                float _1944 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1942 = _1944;
            }
            float _1946 = _1942;
            if (_1884)
            {
                float _1948 = _1906 * _1898;
                float _1950 = precise::clamp(_1948, 0.0, 1.0);
                _1918 = _1950;
            }
            float _1952 = _1918;
            _1602 = _1940;
            if (_1886)
            {
                float _1954 = _1914 * _1940;
                float _1956 = precise::clamp(_1954, 0.0, 1.0);
                _1930 = _1956;
            }
            float _1958 = _1930;
            float _1960 = _1952 * _1958;
            if (_1888)
            {
                float _1962 = _1926 * _1946;
                float _1964 = precise::clamp(_1962, 0.0, 1.0);
                _1936 = _1964;
            }
            float _1966 = _1936;
            float _1968 = _1960 * _1966;
            _1840 = _1968;
        }
    }
    _1842 = false;
    float _1970 = _1834;
    float _1972 = _1836;
    float _1974 = _1838;
    float _1976 = _1602;
    float _1978 = _1840;
    float _1980 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1984 = _1970 + _1982;
    float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1988 = _1972 + _1986;
    float _1990 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1992 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1980);
    bool _1994 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1996 = isnan(0.5);
    bool _1998 = _1994 || _1996;
    bool _2000 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2002 = _1998 || _2000;
    float _2004 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1992);
    bool _2006 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2008 = isnan(0.5);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2014 = _2010 || _2012;
    float _2016 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2018 = _1984 * _1984;
    float _2020 = 1.0 / _2016;
    float _2022 = fma(_1988, _1988, _2018);
    float _2024 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1990);
    float _2026 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2024);
    float _2028 = sqrt(_2022);
    float _2030 = _2026 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2032 = _2030 + _2016;
    float _2034 = _2032 * _2020;
    float _2036 = _2034 * 0.5;
    float _2038 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2040 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2038);
    bool _2042 = _2028 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2044 = 1.0 / _2040;
    bool _2046 = !_2042;
    float _2048 = _1972;
    float _2050 = _1974;
    float _2052 = _1970;
    float _2054 = _1976;
    float _2056 = _2028;
    float _2058 = _1988;
    float _2060 = _2044;
    if (!_2046)
    {
        float _2062 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2066 = _2028 + _2064;
        float _2068 = _1974 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2070 = rsqrt(_2022);
        float _2072 = _2066 * _2062;
        float _2074 = _2072 * 0.15915493667125701904296875;
        float _2076 = _2074 * 6.283185482025146484375;
        float _2078 = cos(_2076);
        float _2080 = _2074 * 6.283185482025146484375;
        float _2082 = sin(_2080);
        float _2084 = _2078 + (-1.0);
        float _2086 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2088 = fma(_2082, _2068, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2090 = fma(_2078, _1974, _2086);
        float _2092 = _2070 * _2088;
        float _2094 = fma(_1988, _2092, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2096 = fma(_1984, _2092, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2048 = _2094;
        _2050 = _2090;
        _2052 = _2096;
        _2054 = _2074;
        _2056 = _2082;
    }
    float _2098 = _2048;
    float _2100 = _2050;
    float _2102 = _2052;
    float _2104 = _2054;
    float _2106 = _2056;
    float _2108 = _2106;
    float _2110 = _2104;
    float _2112 = _2100;
    float _2114 = _2098;
    float _2116 = _2102;
    if (_2014)
    {
        _2108 = 1.0;
    }
    float _2118 = _2108;
    float _2120 = _2118;
    if (!_2002)
    {
        float _2122 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2124 = _1794 + _2122;
        float _2126 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2128 = _1792 + _2126;
        float _2130 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2132 = _2124 * _2124;
        float _2134 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2136 = _1796 + _2134;
        float _2138 = fma(_2128, _2128, _2132);
        float _2140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2142 = fma(_2136, _2136, _2138);
        float _2144 = sqrt(_2142);
        float _2146 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2148 = precise::min(_2144, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2150 = _2148 * _2140;
        float _2152 = -_1792;
        float _2154 = _2152 + _2098;
        float _2156 = _2146 * _2150;
        float _2158 = -_1794;
        float _2160 = _2158 + _2100;
        float _2162 = -_1796;
        float _2164 = _2162 + _2102;
        float _2166 = fma(_2154, _2156, _1792);
        float _2168 = fma(_2160, _2156, _1794);
        float _2170 = fma(_2164, _2156, _1796);
        _2110 = _2156;
        _2112 = _2168;
        _2114 = _2166;
        _2116 = _2170;
    }
    float _2172 = _2110;
    float _2174 = _2112;
    float _2176 = _2114;
    float _2178 = _2116;
    float _2180 = _2172;
    if (_2014)
    {
        _2058 = 1.0;
    }
    float _2182 = _2058;
    float _2184 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2186 = _2044 * _2184;
    float _2188 = _2182;
    if (!_2014)
    {
        float _2190 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2192 = _2190 * 0.15915493667125701904296875;
        float _2194 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2196 = _2192 * 6.283185482025146484375;
        float _2198 = cos(_2196);
        float _2200 = _2194 * 0.15915493667125701904296875;
        float _2202 = _2192 * 6.283185482025146484375;
        float _2204 = sin(_2202);
        float _2206 = 1.0 / _2198;
        float _2208 = _2200 * 6.283185482025146484375;
        float _2210 = cos(_2208);
        float _2212 = _2204 * _2206;
        float _2214 = _2200 * 6.283185482025146484375;
        float _2216 = sin(_2214);
        float _2218 = _2210 * _2212;
        float _2220 = 1.0 / _2218;
        float _2222 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2224 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2222;
        float _2226 = 1.0 / _2224;
        float _2228 = _2216 * _2220;
        float _2230 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2232 = fma(_2186, _2228, _2230);
        float _2234 = _2232 * _2226;
        float _2236 = precise::clamp(_2234, 0.0, 1.0);
        _2060 = _2200;
        _2180 = _2220;
        _2120 = _2236;
    }
    float _2238 = _2060;
    float _2240 = _2180;
    float _2242 = _2120;
    float _2244 = _2238;
    float _2246 = _2240;
    if (!_2014)
    {
        float _2248 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2250 = _2248 * 0.15915493667125701904296875;
        float _2252 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2254 = _2250 * 6.283185482025146484375;
        float _2256 = cos(_2254);
        float _2258 = _2252 * 0.15915493667125701904296875;
        float _2260 = _2250 * 6.283185482025146484375;
        float _2262 = sin(_2260);
        float _2264 = 1.0 / _2256;
        float _2266 = _2258 * 6.283185482025146484375;
        float _2268 = cos(_2266);
        float _2270 = _2262 * _2264;
        float _2272 = _2258 * 6.283185482025146484375;
        float _2274 = sin(_2272);
        float _2276 = _2268 * _2270;
        float _2278 = 1.0 / _2276;
        float _2280 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2282 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2280;
        float _2284 = 1.0 / _2282;
        float _2286 = _2274 * _2278;
        float _2288 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2290 = fma(_2186, _2286, _2288);
        float _2292 = _2290 * _2284;
        float _2294 = precise::clamp(_2292, 0.0, 1.0);
        float _2296 = -_2294;
        float _2298 = _2296 + 1.0;
        _2244 = _2278;
        _2246 = _2250;
        _2188 = _2298;
    }
    float _2300 = _2244;
    float _2302 = _2246;
    float _2304 = _2188;
    float _2306 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2308 = _2174 + _2306;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2312 = _2176 + _2310;
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2316 = _2178 + _2314;
    float _2318 = _2308 * _2308;
    float _2320 = fma(_2312, _2312, _2318);
    float _2322 = fma(_2316, _2316, _2320);
    float _2324 = rsqrt(_2322);
    float _2326 = sqrt(_2322);
    float _2328 = _2324 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2330 = _2312 * _2328;
    float _2332 = _2316 * _2328;
    float _2334 = _2330 * _2330;
    float _2336 = _2332 * _2332;
    float _2338 = _2334 + _2336;
    float _2340 = sqrt(_2338);
    bool _2342 = _2340 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2346 = _2340 + _2344;
    float _2348 = _2324;
    float _2350 = _2346;
    float _2352 = _2300;
    float _2354 = _2308;
    float _2356 = _2328;
    if (_2342)
    {
        float _2358 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2348 = _2358;
    }
    float _2360 = _2348;
    float _2362 = _2360;
    if (_2342)
    {
        float _2364 = _2346 * _2360;
        _2350 = _2364;
    }
    float _2366 = _2350;
    if (_2342)
    {
        float _2368 = rsqrt(_2338);
        _2362 = _2368;
    }
    float _2370 = _2362;
    float _2372 = _2370;
    if (_2342)
    {
        float _2374 = _2366 * 0.15915493667125701904296875;
        _2352 = _2374;
    }
    float _2376 = _2352;
    float _2378 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2380 = _2316;
    if (_2342)
    {
        float _2382 = _2376 * 6.283185482025146484375;
        float _2384 = sin(_2382);
        _2380 = _2384;
    }
    float _2386 = _2380;
    float _2388 = precise::max(0.0, _2378);
    float _2390 = _2302;
    float _2392 = _2388;
    if (_2342)
    {
        float _2394 = _2376 * 6.283185482025146484375;
        float _2396 = cos(_2394);
        _2390 = _2396;
    }
    float _2398 = _2390;
    float _2400 = -_2328;
    float _2402 = -_2388;
    float _2404 = fma(_2308, _2400, _2402);
    if (_2342)
    {
        float _2406 = _2404 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2354 = _2406;
    }
    float _2408 = _2354;
    float _2410 = _2386;
    float _2412 = _2408;
    if (_2342)
    {
        float _2414 = fma(_2386, _2408, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2410 = _2414;
    }
    float _2416 = _2410;
    float _2418 = _2416;
    if (!_2342)
    {
        _2412 = _2404;
    }
    float _2420 = _2412;
    float _2422 = _2420;
    if (_2342)
    {
        float _2424 = _2370 * _2416;
        _1626 = _2424;
    }
    float _2426 = _1626;
    if (!_2342)
    {
        _2372 = _2330;
    }
    float _2428 = _2372;
    float _2430 = _2428;
    float _2432 = _2398;
    if (_2342)
    {
        float _2434 = _2398 + (-1.0);
        _2392 = _2434;
    }
    float _2436 = _2392;
    float _2438 = _2436;
    if (_2342)
    {
        float _2440 = _2330 * _2426;
        _2430 = _2440;
    }
    float _2442 = _2430;
    if (!_2342)
    {
        _2418 = _2334;
    }
    float _2444 = _2418;
    float _2446 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2448 = _2444;
    if (_2342)
    {
        float _2450 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2356 = _2450;
    }
    float _2452 = _2356;
    if (!_2342)
    {
        _2438 = _2332;
    }
    float _2454 = _2438;
    float _2456 = _2454;
    if (_2342)
    {
        float _2458 = _2442 * _2442;
        _2448 = _2458;
    }
    float _2460 = _2448;
    if (_2342)
    {
        float _2462 = _2332 * _2426;
        _2456 = _2462;
    }
    float _2464 = _2456;
    if (_2342)
    {
        float _2466 = fma(_2404, _2398, _2452);
        _2422 = _2466;
    }
    float _2468 = _2422;
    if (!_2342)
    {
        _2432 = _2336;
    }
    float _2470 = _2432;
    float _2472 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2474 = _2470;
    if (_2342)
    {
        float _2476 = _2464 * _2464;
        _2474 = _2476;
    }
    float _2478 = _2474;
    float _2480 = fma(_2468, _2468, _2460);
    float _2482 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2484 = _2480 + _2478;
    float _2486 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2472);
    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2490 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2488);
    float _2492 = precise::clamp(_2490, 0.0, 1.0);
    float _2494 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2496 = rsqrt(_2484);
    float _2498 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2486);
    float _2500 = -_2492;
    float _2502 = _2500 + 1.0;
    float _2504 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2494);
    float _2506 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2482);
    float _2508 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2510 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2512 = abs(_2502);
    float _2514 = log2(_2512);
    float _2516 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2504);
    float _2518 = _2508 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2520 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2506);
    float _2522 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2510);
    float _2524 = _2516 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2526 = -_2518;
    float _2528 = fma(_2526, _2446, 1.0);
    float _2530 = _2520 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2532 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2522);
    float _2534 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2536 = _2496 * _2442;
    float _2538 = _2496 * _2468;
    float _2540 = _2496 * _2464;
    float _2542 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2534);
    float _2544 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2546 = _2532 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2548 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2550 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2542);
    float _2552 = -_2544;
    float _2554 = fma(_2538, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2552);
    float _2556 = log2(_2528);
    float _2558 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2560 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2550);
    float _2562 = -_2540;
    float _2564 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2554);
    float _2566 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2568 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2558);
    float _2570 = fma(_2564, -0.5, 0.5);
    float _2572 = exp2(_2548);
    float _2574 = fma(_2564, 0.5, 0.5);
    float _2576 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2566);
    float _2578 = _2538 + 1.0;
    float _2580 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2568);
    float _2582 = fma(_2574, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2584 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2576);
    float _2586 = 1.0 / _2560;
    float _2588 = fma(_2574, _2582, -0.212114393711090087890625);
    float _2590 = _2556 * 0.693147182464599609375;
    float _2592 = fma(_2574, _2588, 1.570728778839111328125);
    float _2594 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2596 = sqrt(_2570);
    float _2598 = -_2538;
    float _2600 = fma(_2572, _2578, _2598);
    float _2602 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2584);
    float _2604 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2580);
    float _2606 = fma(_2600, 0.5, 0.5);
    float _2608 = _2602 * _2586;
    float _2610 = _2604 * _2586;
    float _2612 = fma(_2608, 0.5, 0.5);
    float _2614 = fma(_2610, -0.5, 0.5);
    float _2616 = _2596 * 0.636619746685028076171875;
    float3 _6916 = float3(_2612, _2614, _2594);
    float _2618 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6916, float3(0.0), isnan(_6916)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6916, float3(0.0), isnan(_6916)), level(0.0)).x;
    float _2620 = -_2592;
    float _2622 = fma(_2616, _2620, 1.0);
    float3 _6932 = float3(_2612, _2614, _2594);
    float4 _2625 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6932, float3(0.0), isnan(_6932)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6932, float3(0.0), isnan(_6932)), level(0.0)).xyzw;
    float _2627 = _2625.x;
    float _2629 = _2625.y;
    float _2631 = _2625.z;
    float _2633 = _2625.w;
    float2 _6949 = float2(_2622, _2606);
    float3 _2637 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6949, float2(0.0), isnan(_6949)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6949, float2(0.0), isnan(_6949)), level(0.0)).xyz;
    float _2639 = _2637.x;
    float _2641 = _2637.y;
    float _2643 = _2637.z;
    float _2645 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2647 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2649 = _2326 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2651 = isnan(_2326);
    bool _2653 = _2649 || _2651;
    bool _2655 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2657 = _2653 || _2655;
    float _2659 = _2602 + _2560;
    out.m_82.x = _1792;
    out.m_82.y = _1794;
    out.m_82.z = _1796;
    float _2661 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2647);
    float _2663 = exp2(_2645);
    float _2665 = _2560 * 0.5;
    float _2667 = _2659 * 0.5;
    float _2669 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2661);
    float _2671 = fma(_2604, -0.5, _2665);
    float _2673 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2669);
    float _2675 = _2242 * _2304;
    float _2677 = _2673 + _2560;
    out.gl_Position.x = _2602;
    out.gl_Position.y = _2604;
    out.gl_Position.z = _2673;
    out.gl_Position.w = _2560;
    float _2679 = _2560;
    float _2681 = _2602;
    float _2683 = _2604;
    if (!_2657)
    {
        _1822 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2685 = _1822;
    float _2687 = _2675 * _1978;
    float _2689 = _2677 * 0.5;
    float _2691 = -_2663;
    float _2693 = _2691 + 1.0;
    float _2695 = _2687;
    float _2697 = _2685;
    float _2699 = _2685;
    if (!_2657)
    {
        _1824 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2701 = _1824;
    float _2703 = _2693 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _2667;
    out.m_84.y = _2671;
    out.m_84.z = _2689;
    out.m_84.w = _2560;
    float _2705 = _2701;
    float _2707 = _2701;
    if (!_2657)
    {
        _2679 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2709 = _2679;
    float _2711 = _2709;
    float _2713 = _2709;
    if (!_2657)
    {
        _2681 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2715 = _2681;
    float _2717 = _2715;
    float _2719 = _2715;
    if (!_2657)
    {
        _2683 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2721 = _2683;
    float _2723 = _2687 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2725 = _2721;
    float _2727 = _2721;
    if (!_2657)
    {
        _2695 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2729 = _2695;
    float _2731 = _2703 * _2618;
    float _2733 = -_2703;
    float _2735 = _2733 + 1.0;
    float _2737 = _2633 * _2731;
    float _2739 = _2643 * _2731;
    float _2741 = fma(_2639, _2737, _2627);
    float _2743 = fma(_2641, _2737, _2629);
    float _2745 = _2633 * _2735;
    float _2747 = fma(_2633, _2739, _2631);
    out.m_86.x = _2741;
    out.m_86.y = _2743;
    out.m_86.z = _2747;
    out.m_86.w = _2745;
    bool _2749 = !_2657;
    float _2751 = _2729;
    float _2753 = _2729;
    if (!_2749)
    {
        bool _2755 = _2326 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2757 = isnan(_2326);
        bool _2759 = _2755 || _2757;
        bool _2761 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2763 = _2759 || _2761;
        if (!_2763)
        {
            float _2765 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2767 = _2326 + _2765;
            float _2769 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2771 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2769;
            float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2775 = _2773 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2777 = 1.0 / _2771;
            float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2781 = _2779 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2785 = _2783 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2793 = _2791 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2795 = _2767 * _2777;
            float _2797 = precise::clamp(_2795, 0.0, 1.0);
            float _2799 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2801 = _2799 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2803 = fma(_2797, _2775, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2805 = fma(_2797, _2801, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2807 = fma(_2797, _2781, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2809 = fma(_2797, _2785, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2811 = fma(_2797, _2789, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2813 = fma(_2797, _2793, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2719 = _2807;
            _2707 = _2811;
            _2713 = _2803;
            _2699 = _2809;
            _2727 = _2805;
            _2753 = _2813;
            _2815 = true;
        }
        else
        {
            bool _2817 = _2326 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2819 = isnan(_2326);
            bool _2821 = _2817 || _2819;
            bool _2823 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2825 = _2821 || _2823;
            if (!_2825)
            {
                _2711 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2827 = _2711;
            _2713 = _2827;
            if (!_2825)
            {
                _2717 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2829 = _2717;
            _2719 = _2829;
            if (!_2825)
            {
                _2725 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2831 = _2725;
            _2727 = _2831;
            if (!_2825)
            {
                _2697 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2833 = _2697;
            _2699 = _2833;
            if (!_2825)
            {
                _2705 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2835 = _2705;
            _2707 = _2835;
            if (!_2825)
            {
                _2751 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2837 = _2751;
            bool _2839 = !_2825;
            _2753 = _2837;
            if (!_2839)
            {
                bool _2841 = _2326 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2843 = isnan(_2326);
                bool _2845 = _2841 || _2843;
                bool _2847 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2849 = _2845 || _2847;
                if (!_2849)
                {
                    float _2851 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2853 = _2326 + _2851;
                    float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2857 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2855;
                    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2863 = 1.0 / _2857;
                    float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2867 = _2865 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2871 = _2869 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2875 = _2873 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2877 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2879 = _2877 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2881 = _2853 * _2863;
                    float _2883 = precise::clamp(_2881, 0.0, 1.0);
                    float _2885 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2887 = _2885 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2889 = fma(_2883, _2861, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2891 = fma(_2883, _2887, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2893 = fma(_2883, _2867, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2895 = fma(_2883, _2871, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2897 = fma(_2883, _2875, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2899 = fma(_2883, _2879, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2719 = _2893;
                    _2707 = _2897;
                    _2713 = _2889;
                    _2699 = _2895;
                    _2727 = _2891;
                    _2753 = _2899;
                    _2815 = true;
                }
                else
                {
                    _2719 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2707 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2713 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2699 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2727 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2753 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2815 = false;
    float _2901 = _2719;
    float _2903 = _2707;
    float _2905 = _2713;
    float _2907 = _2699;
    float _2909 = _2727;
    float _2911 = _2753;
    float _2913 = fma(_1770, -0.5, 0.5);
    float _2915 = precise::clamp(_2913, 0.0, 1.0);
    float _2917 = -_2901;
    float _2919 = _2917 + _2903;
    float _2921 = -_2905;
    float _2923 = _2921 + _2907;
    out.m_88.x = 0.0;
    float _2925 = fma(_2915, _2919, _2901);
    float _2927 = -_2909;
    float _2929 = _2927 + _2911;
    float _2931 = fma(_2915, _2923, _2905);
    float _2933 = _2925 * 0.586610972881317138671875;
    bool _2935 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2937 = fma(_2915, _2929, _2909);
    float _2939 = _2723 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2941 = fma(_2931, 0.298911988735198974609375, _2933);
    bool _2943 = _2242 > 0.0;
    bool _2945 = isnan(_2242);
    bool _2947 = _2943 || _2945;
    bool _2949 = isnan(0.0);
    bool _2951 = _2947 || _2949;
    float _2953 = fma(_2937, 0.114477999508380889892578125, _2941);
    out.m_53.x = _2939;
    bool _2955 = _2304 <= 0.0;
    bool _2957 = !_2951;
    bool _2959 = _2955 || _2957;
    float _2961 = -_2953;
    float _2963 = _2931 + _2961;
    float _2965 = -_2953;
    float _2967 = _2925 + _2965;
    float _2969 = -_2953;
    float _2971 = _2937 + _2969;
    float _2973 = fma(_2963, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2953);
    float _2975 = fma(_2967, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2953);
    float _2977 = fma(_2971, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2953);
    bool _2979 = !_2935;
    if (!_2979)
    {
        float _2981 = -_2174;
        float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2985 = -_2176;
        float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2989 = -_2178;
        float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2993 = _2983 * _2983;
        float _2995 = fma(_2987, _2987, _2993);
        float _2997 = fma(_2991, _2991, _2995);
        float _2999 = sqrt(_2997);
        float _3001 = rsqrt(_2997);
        float _3003 = -_2999;
        float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3007 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3009 = precise::clamp(_3007, 0.0, 1.0);
        float _3011 = _2987 * _3001;
        float _3013 = _2983 * _3001;
        float _3015 = abs(_3009);
        float _3017 = log2(_3015);
        float _3019 = _2991 * _3001;
        float _3021 = _3011 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3023 = _1770 * _3013;
        float _3025 = -_3013;
        float _3027 = -_3021;
        float _3029 = fma(_3025, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3027);
        float _3031 = fma(_1768, _3011, _3023);
        float _3033 = -_3019;
        float _3035 = fma(_3033, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3029);
        float _3037 = fma(_1762, _3019, _3031);
        float _3039 = precise::clamp(_3037, 0.0, 1.0);
        float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3043 = _3035 + _3041;
        float _3045 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3047 = _3043 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3049 = precise::clamp(_3047, 0.0, 1.0);
        float _3051 = exp2(_3045);
        float _3053 = _3051 * _3049;
        float _3055 = _3039 * _3053;
        float _3057 = _3055 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3059 = _3055 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3061 = _3055 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3057;
        out.m_88.y = _3059;
        out.m_88.z = _3061;
    }
    out.m_90.x = _2973;
    out.m_90.y = _2975;
    out.m_90.z = _2977;
    if (!_2959)
    {
        return out;
    }
    float _3063 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3063;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2815 = false;
    bool _1842 = false;
    bool _1830 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
    float _106 = in.m_48.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_111);
    float _125 = _115;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _121;
    if (!_119)
    {
        out.m_53.x = 0.0;
    }
    int _129 = 0;
    if (!_119)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3132 = as_type<float>(_133);
        out.gl_Position.z = _3132;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _137 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_106);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = in.m_55.x;
    float _149 = float(_111);
    bool _151 = _115 >= _149;
    bool _153 = !_145;
    bool _155 = _151 || _153;
    if (_155)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _123;
    if (_155)
    {
        out.m_53.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _135 = as_type<int>(_159);
    }
    int _161 = _135;
    out.m_57.x = _147;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3191 = as_type<float>(_161);
        out.gl_Position.z = _3191;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = 1.0 / _149;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _169 = _115 * _165;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_167;
    float _189 = _169;
    float _191 = _181;
    if (!_187)
    {
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _195 = _147 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _189 = _205;
    }
    float _207 = _189;
    float _209 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _211 = int(_209);
    float _213 = in.m_46.x;
    float _215 = in.m_46.y;
    float _217 = in.m_46.z;
    float _219 = _147 * 2.0;
    int _221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _223 = _221 != 0;
    float _225 = in.m_62.x;
    float _227 = in.m_62.y;
    float _229 = in.m_62.z;
    float _231 = in.m_62.w;
    float _233 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _235 = int(_233);
    int _237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _239 = _237 != 0;
    int _241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _243 = _241 != 0;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _247 = _245 != 0;
    float _249 = in.m_64.x;
    float _251 = in.m_64.y;
    float _253 = in.m_64.z;
    float _255 = in.m_64.w;
    float _257 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _259 = in.m_66.x;
    float _261 = in.m_66.y;
    float _263 = in.m_66.z;
    float _265 = in.m_66.w;
    bool _267 = !_239;
    int _269 = _267 ? 0 : 1;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _273 = float(_211);
    float _275 = in.m_55.w;
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _279 = _277 != 0;
    float _281 = floor(_219);
    bool _283 = !_243;
    int _285 = _283 ? 0 : 1;
    float _287 = in.m_55.y;
    bool _289 = _147 > 0.5;
    float _291 = float(uint(_235));
    float _293 = -_181;
    int _295 = _289 ? as_type<int>(_293) : as_type<int>(_181);
    float _297 = 1.0 / _273;
    float _299 = _215 * _227;
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _303 = _301 != 0;
    float _305 = _215 * _251;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _311 = 1.0 / _291;
    float _313 = _215 * _261;
    float _315 = fma(_213, _225, _299);
    float _317 = fma(_213, _249, _305);
    float _319 = in.m_55.z;
    bool _321 = _275 > 0.5;
    float _323 = fma(_217, _229, _315);
    float _325 = _297 * _115;
    float _327 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _329 = -_185;
    int _331 = _321 ? as_type<int>(_329) : as_type<int>(_185);
    float _333 = fma(_213, _259, _313);
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _337 = _335 != 0;
    float _339 = -_271;
    float _341 = fma(_327, 2.0, _339);
    float _343 = trunc(_325);
    int _345 = int(_343);
    bool _347 = !_279;
    float _349 = _347 ? _185 : as_type<float>(_331);
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _353 = as_type<int>(_311) + (-2);
    float _355 = _287 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _357 = !_337;
    int _359 = _357 ? 0 : 1;
    float _361 = fma(_217, _253, _317);
    int _363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _365 = _363 != 0;
    float _367 = fma(_355, -2.0, _351);
    float _369 = 1.0 / _309;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _373 = _371 != 0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _375;
    bool _379 = !_365;
    float _381 = _379 ? _181 : as_type<float>(_295);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _391 = float(uint(_345));
    float _393 = fma(_217, _263, _333);
    bool _395 = _287 > 0.5;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _401 = !_373;
    int _403 = _401 ? 0 : 1;
    float _405 = as_type<float>(_353) * _391;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _409 = _407 != 0;
    float _411 = 1.0 / _385;
    float _413 = -_185;
    int _415 = _395 ? as_type<int>(_413) : as_type<int>(_185);
    float _417 = _377 * _369;
    bool _419 = _319 > 0.5;
    float _421 = _287 + _319;
    int _423 = ~_235;
    int _425 = _423 + 1;
    float _427 = _287 * 2.0;
    float _429 = _147 + _319;
    float _431 = trunc(_405);
    float _433 = precise::max(_431, 0.0);
    uint _436 = uint(_433);
    float _438 = _421 + (-1.0);
    float _440 = _429 + (-1.0);
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _444 = _442 != 0;
    float _446 = -_115;
    float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[76].x, _341);
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _452 = _450 != 0;
    float _454 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _456 = _389 * _411;
    bool _458 = !_409;
    float _460 = _458 ? _185 : as_type<float>(_415);
    float _462 = _147 + _287;
    float _464 = -_181;
    int _466 = _419 ? as_type<int>(_464) : as_type<int>(_181);
    float _468 = 1.0 / _399;
    bool _470 = _281 > 0.0;
    float _472 = _462 + (-1.0);
    bool _474 = _281 >= 0.0;
    bool _476 = isnan(_281);
    bool _478 = _474 || _476;
    bool _480 = isnan(0.0);
    bool _482 = _478 || _480;
    int _484 = _425 * int(_436);
    int _486 = _484 + _345;
    float _488 = float(_235);
    float _490 = _381 + 0.5;
    int _492 = ~_235;
    int _494 = _492 + 1;
    float _496 = floor(_427);
    float _498 = float(uint(_486));
    float _500 = _488 * _115;
    float _502 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[80].x, _448);
    int _504 = _482 ? 0 : 1;
    float _506 = as_type<float>(_353) * _498;
    float _508 = _500 * _165;
    float _510 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _512 = trunc(_506);
    float _514 = precise::max(_512, 0.0);
    uint _516 = uint(_514);
    float _518 = _393 + _265;
    bool _520 = !_223;
    float _522 = _520 ? 7.345489978790283203125 : 1.0;
    float _524 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _367);
    bool _526 = !_247;
    int _528 = _526 ? 0 : 1;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _530;
    bool _534 = _496 > 0.0;
    float _536 = _522 * _147;
    float _538 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _540 = ~_504;
    int _542 = _540 + 1;
    int _544 = _542 + 1;
    float _546 = in.m_68.x;
    float _548 = in.m_68.y;
    int _550 = _544;
    float _552 = _468;
    if (!_470)
    {
        int _554 = ~_504;
        int _556 = _554 + 1;
        _550 = _556;
    }
    int _558 = _550;
    float _560 = _532 * _468;
    float _562 = floor(_536);
    if (!_223)
    {
        _552 = _287;
    }
    float _564 = _552;
    float _566 = _361 + _255;
    int _568 = int(_436) + int(_516);
    float _570 = _323 + _231;
    bool _572 = !_303;
    float _574 = _572 ? _181 : as_type<float>(_466);
    float _576 = _319 * 2.0;
    bool _578 = _496 >= 0.0;
    bool _580 = isnan(_496);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    int _588 = _494 * _568;
    int _590 = _588 + _345;
    float _592 = 0.0;
    float _594 = _564;
    if (!_223)
    {
        _592 = _319;
    }
    float _596 = _592;
    float _598 = floor(_576);
    int _600 = _586 ? 0 : 1;
    float _602 = _570 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _604 = uint(_590) >= uint(_235);
    float _606 = _518 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    int _608 = ~_600;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    float _614 = -_562;
    float _616 = _536 + _614;
    bool _618 = !_604;
    int _620 = _618 ? 0 : (-1);
    float _622 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _624 = log2(_622);
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _628 = _626 != 0;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _632 = _630 != 0;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _636 = _634 != 0;
    float _638 = _616 * _488;
    float _640 = _546 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _642 = _612;
    float _644 = _546;
    float _646 = _596;
    bool _648 = _632;
    if (!_534)
    {
        int _650 = ~_600;
        int _652 = _650 + 1;
        _642 = _652;
    }
    int _654 = _642;
    float _656 = _548 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _658 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _660 = _640 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _662 = 0.0;
    float _664 = _658;
    if (!_223)
    {
        _662 = _319;
    }
    float _666 = _662;
    float _668 = _666;
    if (_444)
    {
        float _670 = _275 * 3.1415927410125732421875;
        _644 = _670;
    }
    float _672 = _644;
    if (_223)
    {
        _594 = _147;
    }
    float _674 = _594;
    float _676 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_223)
    {
        _646 = _287;
    }
    float _678 = _646;
    float _680 = _660 * _658;
    if (_223)
    {
        _668 = _287;
    }
    float _682 = _668;
    if (_452)
    {
        float _684 = _147 * 3.1415927410125732421875;
        _664 = _684;
    }
    float _686 = _664;
    bool _688 = _598 > 0.0;
    float _690 = 0.0;
    if (_444)
    {
        float _692 = _672 * 0.15915493667125701904296875;
        _690 = _692;
    }
    float _694 = _690;
    bool _696 = _598 >= 0.0;
    bool _698 = isnan(_598);
    bool _700 = _696 || _698;
    bool _702 = isnan(0.0);
    bool _704 = _700 || _702;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _708 = _207 + _706;
    float _710 = _676 * _257;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _714 = _207 + _712;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _718 = _207 + _716;
    float _720 = fma(_417, _708, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _722 = 0.0;
    bool _724 = _704;
    if (_452)
    {
        float _726 = _686 * 0.15915493667125701904296875;
        _722 = _726;
    }
    float _728 = _722;
    bool _730 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _732 = isnan(_207);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    float _742 = fma(_456, _714, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _744 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _746 = isnan(_207);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = fma(_560, _718, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _758 = _694;
    if (_444)
    {
        float _760 = _694 * 6.283185482025146484375;
        float _762 = sin(_760);
        _758 = _762;
    }
    float _764 = _758;
    bool _766 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _768 = isnan(_207);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = -_740;
    float _780 = _778 + 1.0;
    bool _782 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _784 = isnan(_207);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -_754;
    float _796 = _794 + 1.0;
    float _798 = _754 * _780;
    float _800 = _728;
    if (_452)
    {
        float _802 = _728 * 6.283185482025146484375;
        float _804 = sin(_802);
        _800 = _804;
    }
    float _806 = _800;
    float _808 = _792 * _796;
    float _810 = -_792;
    float _812 = _810 + 1.0;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _816 = !_632;
    int _818 = _816 ? 0 : 1;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _822 = _776 * _812;
    int _824 = _704 ? 0 : 1;
    float _826 = _624 * _115;
    if (_444)
    {
        bool _828 = _764 > 0.5;
        _648 = _828;
    }
    bool _830 = _648;
    float _832 = _720 * _822;
    float _834 = _460 + (-0.5);
    float _836 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[83].w, _820);
    float _838 = _674 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_452)
    {
        bool _842 = _806 > 0.5;
        _724 = _842;
    }
    bool _844 = _724;
    float _846 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[83].z, _814);
    float _848 = float(_345);
    float _850 = -_834;
    float _852 = -_524;
    float _854 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[80].y, _852);
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _858 = _678 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _860 = _848 >= _488;
    bool _862 = isnan(_848);
    bool _864 = _860 || _862;
    bool _866 = isnan(_488);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _874 = ~_568;
    int _876 = _874 + _620;
    int _878 = _876 + 1;
    float _880 = -_856;
    float _882 = fma(_838, 2.0, _880);
    float _884 = -_776;
    float _886 = _884 + 1.0;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _890 = !_628;
    int _892 = _890 ? 0 : 1;
    float _894 = -_115;
    float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[81].x, _882);
    float _898 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[115].x, _832);
    float _900 = exp2(_826);
    float _902 = fma(_858, -2.0, _888);
    int _904 = ~_824;
    int _906 = _904 + 1;
    int _908 = _906 + 1;
    float _910 = fma(_742, _808, _898);
    int _912 = _908;
    if (!_688)
    {
        int _914 = ~_824;
        int _916 = _914 + 1;
        _912 = _916;
    }
    int _918 = _912;
    int _920 = _235 * _878;
    int _922 = _920 + _345;
    float _924 = _840 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _926 = trunc(_870);
    int _928 = int(_926);
    bool _930 = _235 == 0;
    float _932 = _872 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _934 = _574 + 0.5;
    float _936 = _349 + (-0.5);
    float _938 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[81].y, _902);
    bool _940 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _942 = isnan(0.0);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _948 = _944 || _946;
    float _950 = fma(_924, _934, _896);
    float _952 = -_900;
    float _954 = _952 + 1.0;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _958 = 1.0 + _956;
    bool _960 = !_930;
    int _962 = _960 ? _922 : (-1);
    float _964 = -_932;
    float _966 = -_938;
    float _968 = fma(_964, _936, _966);
    float _970 = 1.0 / _958;
    float _972 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].z, _846);
    int _974 = ~_928;
    int _976 = _974 + 1;
    int _978 = _976 + 1;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _982 = _948 ? _954 : 0.0;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _986 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _988 = isnan(1.0);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _994 = _990 || _992;
    int _996 = _962 * _978;
    int _998 = _235 + (-1);
    float _1000 = trunc(_508);
    int _1002 = int(_1000);
    float _1004 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[78].w, _984);
    float _1006 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].w, _836);
    int _1008 = abs(_359);
    int _1010 = _928 * _998;
    int _1012 = _1010 + _996;
    int _1014 = abs(_285);
    float _1016 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].z, _980);
    int _1018 = abs(_403);
    float _1020 = trunc(_638);
    int _1022 = int(_1020);
    float _1024 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1004);
    float _1026 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1016);
    if (_994)
    {
        float _1028 = _982 * _970;
        _125 = _1028;
    }
    float _1030 = _125;
    float _1032 = _566 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _1034 = _1012 * _1014;
    float _1036 = float(_918);
    float _1038 = _287 + (-0.5);
    float _1040 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _1042 = abs(_269);
    float _1044 = _1032 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1046 = _1032 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1048 = fma(_602, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1044);
    int _1050 = abs(_528);
    int _1052 = _1022 * _1018;
    int _1054 = _1052 + _345;
    float _1056 = fma(_602, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1046);
    int _1058 = _1002 * _1042;
    int _1060 = _1058 + _1034;
    float _1062 = _1032 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1064 = fma(_756, _798, _910);
    int _1066 = abs(_892);
    float _1068 = fma(_606, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1048);
    float _1070 = in.m_70.x;
    float _1072 = in.m_70.y;
    float _1074 = in.m_70.z;
    float _1076 = float(uint(_1054));
    float _1078 = fma(_602, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1062);
    int _1080 = _1054 * _1050;
    int _1082 = _1080 + _1060;
    float _1084 = float(_1066);
    float _1086 = _1068 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1088 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1090 = as_type<float>(_353) * _1076;
    int _1092 = _1022 * _1008;
    int _1094 = _1092 + _1082;
    float _1096 = _1086 * _1040;
    float _1098 = _1084 * _1036;
    float _1100 = fma(_606, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1078);
    float _1102 = fma(_606, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1056);
    float _1104 = fma(_1096, 0.5, 0.5);
    float _1106 = _1098 * (-2.0);
    float _1108 = float(uint(_1094));
    float _1110 = _1100 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    bool _1112 = !_636;
    int _1114 = _1112 ? 0 : 1;
    float _1116 = fma(_538, _1106, _538);
    int _1118 = abs(_818);
    float _1120 = as_type<float>(_353) * _1108;
    int _1122 = abs(_1114);
    float _1124 = _1110 * _1088;
    float _1126 = float(_558);
    float _1128 = fma(_1106, _1070, _1070);
    float _1130 = _147 + (-0.5);
    float _1132 = trunc(_1120);
    float _1134 = precise::max(_1132, 0.0);
    uint _1136 = uint(_1134);
    float _1138 = fma(_1124, 0.5, 0.5);
    float _1140 = float(_654);
    float _1142 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1128);
    float _1144 = float(_1122);
    float _1146 = _1102 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1148 = float(_1118);
    float _1150 = fma(_1116, _1030, _1142);
    int _1152 = ~_235;
    int _1154 = _1152 + 1;
    float _1156 = _1144 * _1140;
    float _1158 = trunc(_1090);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    float _1164 = _1148 * _1126;
    float _1166 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1064);
    float _1168 = _1150 * 0.15915493667125701904296875;
    float _1170 = _1164 * (-2.0);
    float _1172 = _1156 * (-2.0);
    int _1174 = _1154 * int(_1136);
    int _1176 = _1174 + _1094;
    float _1178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1180 = fma(_510, _1170, _510);
    float _1182 = fma(_1170, _1072, _1072);
    int _1184 = ~_235;
    int _1186 = _1184 + 1;
    float _1188 = _1166 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1190 = float(uint(_1176));
    float _1192 = fma(_454, _1172, _454);
    float _1194 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1182);
    float _1196 = _1182;
    float _1198 = as_type<float>(_1186);
    if (!_444)
    {
        _1196 = _181;
    }
    float _1200 = _1196;
    float _1202 = as_type<float>(_353) * _1190;
    float _1204 = fma(_1172, _1074, _1074);
    float _1206 = fma(_1180, _1030, _1194);
    int _1208 = _1186 * int(_1162);
    int _1210 = _1208 + _1054;
    float _1212 = trunc(_1202);
    float _1214 = precise::max(_1212, 0.0);
    uint _1216 = uint(_1214);
    float _1218 = _1200;
    if (_444)
    {
        float _1220 = -_181;
        float _1222 = _830 ? _1220 : _181;
        _1218 = _1222;
    }
    float _1224 = _1218;
    float _1226 = _319 + (-0.5);
    if (!_452)
    {
        _1198 = _185;
    }
    float _1228 = _1198;
    float _1230 = _1206 * 0.15915493667125701904296875;
    float _1232 = _1228;
    if (_452)
    {
        float _1234 = -_185;
        float _1236 = _844 ? _1234 : _185;
        _1232 = _1236;
    }
    float _1238 = _1232;
    float _1240 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1204);
    float _1242 = float(uint(_1210));
    float _1244 = _1224 + 0.5;
    float _1246 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1248 = -_1238;
    float _1250 = _1248 + 0.5;
    float _1252 = fma(_1192, _1030, _1240);
    float _1254 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1256 = as_type<float>(_353) * _1242;
    float _1258 = -_1026;
    float _1260 = _1258 + 1.0;
    float _1262 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1264 = _1254 * _1178;
    float _1266 = _1252 * 0.15915493667125701904296875;
    float _1268 = -_1260;
    float _1270 = fma(_381, _1268, _502);
    float _1272 = -_1006;
    float _1274 = _1272 + 1.0;
    float _1276 = _1168 * 6.283185482025146484375;
    float _1278 = cos(_1276);
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1282 = int(_1136) + int(_1216);
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1286 = ~_235;
    int _1288 = _1286 + 1;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1292 = fma(_349, _1274, _968);
    float _1294 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1296 = _1266 * 6.283185482025146484375;
    float _1298 = cos(_1296);
    int _1300 = _1288 * _1282;
    int _1302 = _1300 + _1094;
    float _1304 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1308 = _1146 * _1246;
    float _1310 = -_1024;
    float _1312 = _1310 + 1.0;
    bool _1314 = uint(_1302) >= uint(_235);
    float _1316 = -_972;
    float _1318 = _1316 + 1.0;
    float _1320 = floor(_1104);
    out.m_72.x = _1294;
    out.m_72.y = _1304;
    out.m_72.z = _1306;
    out.m_72.w = _1188;
    float _1322 = fma(_460, _1312, _854);
    float _1324 = -_1318;
    float _1326 = fma(_574, _1324, _950);
    float _1328 = fma(_1308, 0.5, 0.5);
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1332 = _1330 != 0;
    float _1334 = _1168 * 6.283185482025146484375;
    float _1336 = sin(_1334);
    out.m_74.x = _1270;
    out.m_74.y = _1322;
    out.m_74.z = _1326;
    out.m_74.w = _1292;
    bool _1338 = !_1314;
    int _1340 = _1338 ? 0 : (-1);
    float _1342 = _1230 * 6.283185482025146484375;
    float _1344 = sin(_1342);
    float _1346 = _1278 * _1298;
    float _1348 = -_1320;
    float _1350 = _1104 + _1348;
    int _1352 = ~_1282;
    int _1354 = _1352 + _1340;
    int _1356 = _1354 + 1;
    float _1358 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1360 = ~_235;
    int _1362 = _1360 + 1;
    float _1364 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1366 = _1230 * 6.283185482025146484375;
    float _1368 = cos(_1366);
    float _1370 = _1266 * 6.283185482025146484375;
    float _1372 = sin(_1370);
    float _1374 = _1336 * _1344;
    float _1376 = _1278 * _1344;
    float _1378 = _1344 * _1298;
    float _1380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _1382 = _235 * _1356;
    int _1384 = _1382 + _1094;
    float _1386 = _1278 * _1368;
    float _1388 = _1336 * _1368;
    float _1390 = _1368 * _1298;
    float _1392 = _1346 * _710;
    bool _1394 = !_930;
    int _1396 = _1394 ? _1384 : (-1);
    float _1398 = trunc(_1256);
    float _1400 = precise::max(_1398, 0.0);
    uint _1402 = uint(_1400);
    float _1404 = -_1372;
    float _1406 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1358);
    int _1408 = _1396 >> 31;
    float _1410 = fma(_1372, _1386, _1374);
    float _1412 = fma(_1372, _1374, _1386);
    float _1414 = -_1388;
    float _1416 = fma(_1372, _1376, _1414);
    int _1418 = _1408 & 3;
    float _1420 = fma(_1410, _680, _1392);
    float _1422 = floor(_1138);
    float _1424 = _1262 * _1380;
    int _1426 = _1396 + _1418;
    int _1428 = _1396 & 3;
    bool _1430 = _1428 != 0;
    out.m_76.x = _1264;
    out.m_76.y = _1424;
    int _1432 = _1426 >> 2;
    float _1434 = floor(_1328);
    int _1436 = int(_1162) + int(_1402);
    float _1438 = -_1376;
    float _1440 = fma(_1372, _1388, _1438);
    float _1442 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1444 = _1432 << 4;
    int _1446 = _1444 + 368;
    float _1448 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1450 = _1362 * _1436;
    int _1452 = _1450 + _1054;
    int _1454 = _1396 & 3;
    bool _1456 = _1454 != 0;
    float _1458 = -_1422;
    float _1460 = _1138 + _1458;
    float _1462 = _1336 * _1298;
    float _1464 = -_1372;
    float _1466 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1442);
    float _1468 = -_1372;
    float _1470 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1364);
    float _1472 = -_710;
    float _1474 = _1372 * _1472;
    float _1476 = _1462 * _710;
    float _1478 = fma(_1460, 2.0, -1.0);
    float _1480 = fma(_1350, 2.0, -1.0);
    float _1482 = fma(_1390, _680, _1474);
    float _1484 = fma(_1440, _680, _1476);
    float _1486 = _1478 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1488 = -_1434;
    float _1490 = _1328 + _1488;
    float _1492 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1494 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1496 = _1486 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1498 = _1486 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1500 = _1486 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    int _1502 = _1446 + 8;
    uint _1504 = uint(int(uint(_1502) >> uint(2)));
    uint _1506 = uint(int(uint(int(_1504)) >> uint(2)));
    int _1508 = int(_1504) & 3;
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[int(_1506)][_1508];
    int _1512 = int(_1504) + 1;
    uint _1514 = uint(int(uint(_1512) >> uint(2)));
    int _1516 = _1512 & 3;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[int(_1514)][_1516];
    bool _1520 = uint(_1452) >= uint(_235);
    float _1522 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1466);
    float _1524 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1526 = _1480 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    bool _1528 = uint(_1454) > 1u;
    float _1530 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1492);
    float _1532 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1524);
    uint _1534 = uint(int(uint(_1446) >> uint(2)));
    uint _1536 = uint(int(uint(int(_1534)) >> uint(2)));
    int _1538 = int(_1534) & 3;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[int(_1536)][_1538];
    int _1542 = int(_1534) + 1;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    int _1546 = _1542 & 3;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[int(_1544)][_1546];
    float _1550 = fma(_1526, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1496);
    int _1552 = _1430 ? 0 : 1;
    float _1554 = fma(_1526, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1498);
    bool _1556 = _1454 != 3;
    float _1558 = fma(_1526, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1500);
    float _1560 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1562 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1406);
    float _1564 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1470);
    float _1566 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1448);
    float _1568 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1494);
    float _1570 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1572 = uint(_1454) >= 2u;
    float _1574 = fma(_1378, _1560, _1482);
    float _1576 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1578 = fma(_1416, _1560, _1420);
    float _1580 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1570);
    int _1582 = _1572 ? 0 : 1;
    float _1584 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1576);
    int _1586 = ~_1552;
    int _1588 = _1586 + 1;
    int _1590 = _1588 + 1;
    float _1592 = fma(_1412, _1560, _1484);
    int _1594 = _1590;
    float _1596 = _1592;
    float _1598 = _1480;
    float _1600 = _1478;
    float _1602 = _1574;
    if (!_1528)
    {
        int _1604 = ~_1552;
        int _1606 = _1604 + 1;
        _1594 = _1606;
    }
    int _1608 = _1594;
    float _1610 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1530);
    int _1612 = ~_1582;
    int _1614 = _1612 + 1;
    int _1616 = _1614 + 1;
    float _1618 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1566);
    bool _1620 = _1454 != 3;
    float _1622 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1568);
    int _1624 = _1616;
    float _1626 = _1622;
    if (_1556)
    {
        int _1628 = ~_1582;
        int _1630 = _1628 + 1;
        _1624 = _1630;
    }
    int _1632 = _1624;
    float _1634 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1636 = !_1456;
    int _1638 = _1636 ? 0 : 1;
    float _1640 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1532);
    int _1642 = abs(_1608);
    float _1644 = _1634 * _1562;
    int _1646 = abs(_1632);
    float _1648 = _1634 * _1564;
    int _1650 = abs(_1638);
    float _1652 = _1634 * _1522;
    int _1654 = ~_1642;
    int _1656 = _1654 + 1;
    int _1658 = _1656 + 1;
    float _1660 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1580);
    bool _1662 = !_1620;
    int _1664 = _1662 ? 0 : (-1);
    float _1666 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1584);
    int _1668 = ~_1650;
    int _1670 = _1668 + 1;
    int _1672 = _1670 + 1;
    float _1674 = fma(_1490, 2.0, -1.0);
    bool _1676 = !_1520;
    int _1678 = _1676 ? 0 : (-1);
    int _1680 = abs(_1664);
    int _1682 = ~_1436;
    int _1684 = _1682 + _1678;
    int _1686 = _1684 + 1;
    int _1688 = _1658 * as_type<int>(_1548);
    int _1690 = ~_1646;
    int _1692 = _1690 + 1;
    int _1694 = _1692 + 1;
    int _1696 = _1672 * as_type<int>(_1540);
    int _1698 = _1696 + _1688;
    bool _1700 = !_1332;
    int _1702 = _1700 ? 0 : 1;
    int _1704 = _235 * _1686;
    int _1706 = _1704 + _1054;
    float _1708 = _1578 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1710 = _1694 * as_type<int>(_1510);
    int _1712 = _1710 + _1698;
    int _1714 = abs(_1702);
    int _1716 = ~_1680;
    int _1718 = _1716 + 1;
    int _1720 = _1718 + 1;
    float _1722 = _1578 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1724 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1726 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1708);
    int _1728 = _1720 * as_type<int>(_1518);
    int _1730 = _1728 + _1712;
    int _1732 = ~_1714;
    int _1734 = _1732 + 1;
    int _1736 = _1734 + 1;
    float _1738 = fma(_1724, _1610, _1644);
    bool _1740 = !_930;
    int _1742 = _1740 ? _1706 : (-1);
    float _1744 = fma(_1724, _1618, _1652);
    float _1746 = fma(_1724, _1622, _1648);
    int _1748 = _1730 * _1736;
    float _1750 = _1578 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1752 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1754 = isnan(1.0);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1760 = _1756 || _1758;
    float _1762 = _1666 + _1746;
    int _1764 = _1742 * _1714;
    int _1766 = _1764 + _1748;
    float _1768 = _1640 + _1738;
    float _1770 = _1660 + _1744;
    float _1772 = _1674 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1774 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1722);
    float _1776 = float(_1766);
    float _1778 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1750);
    out.m_78.x = _1768;
    out.m_78.y = _1770;
    out.m_78.z = _1762;
    float _1780 = fma(_1772, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1550);
    float _1782 = fma(_1772, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1554);
    float _1784 = fma(_1772, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1558);
    out.m_80.x = _1776;
    float _1786 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1774);
    float _1788 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1726);
    float _1790 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1778);
    float _1792 = _1780 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1794 = _1782 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1796 = _1784 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1798 = _1786 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1800 = _1788 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1802 = _1790 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1804 = _1798 + _1792;
    float _1806 = _1800 + _1794;
    float _1808 = _1802 + _1796;
    float _1810 = _1744;
    float _1812 = _1802;
    float _1814 = _1776;
    float _1816 = _1802;
    float _1818 = _1800;
    float _1820 = _1674;
    float _1822 = _1796;
    float _1824 = _1794;
    float _1834;
    float _1836;
    float _1838;
    float _1840;
    if (!_1760)
    {
        bool _1826 = _1794 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1828 = !_1826;
        _1830 = _1828;
        if (!_1830)
        {
            float _1832 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1834 = _1832;
            _1836 = 0.0;
            _1838 = 0.0;
            _1840 = 0.0;
            _1842 = true;
        }
    }
    if ((!_1842) || _1830)
    {
        bool _1878;
        if (!_1830)
        {
            bool _1844 = _1794 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1846 = isnan(_1794);
            bool _1848 = _1844 || _1846;
            bool _1850 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1852 = _1848 || _1850;
            bool _1854 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1856 = !_1852;
            bool _1858 = _1854 && _1856;
            bool _1860 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _1814 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1858)
            {
                _1810 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1862 = _1810;
            float _1864 = _1862;
            if (_1858)
            {
                _1596 = 0.0;
                _191 = 0.0;
            }
            float _1866 = _1596;
            float _1868 = _191;
            _1836 = _1866;
            _1838 = _1868;
            if (_1858)
            {
                _1812 = 0.0;
            }
            float _1870 = _1812;
            _1816 = _1870;
            _1840 = _1870;
            if (_1858)
            {
                float _1872 = _1862 * 5.0;
                _1864 = _1872;
            }
            float _1874 = _1864;
            bool _1876 = !_1852;
            _1878 = _1876 && _1860;
            _1834 = _1874;
        }
        if ((!_1878) || _1830)
        {
            _1830 = false;
            float _1880 = _1814;
            float _1882 = _1816;
            bool _1884 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1886 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1888 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1890 = _1558;
            float _1892 = _1880;
            float _1894 = _1882;
            _1834 = _1808;
            _1836 = _1804;
            _1838 = _1806;
            if (_1884)
            {
                float _1896 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1890 = _1896;
            }
            float _1898 = _1890;
            if (_1884)
            {
                float _1900 = abs(_1480);
                float _1902 = -_1900;
                float _1904 = _1902 + 1.0;
                _1598 = _1904;
            }
            float _1906 = _1598;
            if (_1886)
            {
                float _1908 = abs(_1478);
                float _1910 = -_1908;
                float _1912 = _1910 + 1.0;
                _1600 = _1912;
            }
            float _1914 = _1600;
            if (!_1884)
            {
                _1818 = 1.0;
            }
            float _1916 = _1818;
            float _1918 = _1916;
            if (_1888)
            {
                float _1920 = abs(_1674);
                float _1922 = -_1920;
                float _1924 = _1922 + 1.0;
                _1820 = _1924;
            }
            float _1926 = _1820;
            if (!_1886)
            {
                _1892 = 1.0;
            }
            float _1928 = _1892;
            float _1930 = _1928;
            if (!_1888)
            {
                _1894 = 1.0;
            }
            float _1932 = _1894;
            float _1934 = _1574;
            float _1936 = _1932;
            if (_1886)
            {
                float _1938 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1934 = _1938;
            }
            float _1940 = _1934;
            float _1942 = _1798;
            if (_1888)
            {
                float _1944 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1942 = _1944;
            }
            float _1946 = _1942;
            if (_1884)
            {
                float _1948 = _1906 * _1898;
                float _1950 = precise::clamp(_1948, 0.0, 1.0);
                _1918 = _1950;
            }
            float _1952 = _1918;
            _1602 = _1940;
            if (_1886)
            {
                float _1954 = _1914 * _1940;
                float _1956 = precise::clamp(_1954, 0.0, 1.0);
                _1930 = _1956;
            }
            float _1958 = _1930;
            float _1960 = _1952 * _1958;
            if (_1888)
            {
                float _1962 = _1926 * _1946;
                float _1964 = precise::clamp(_1962, 0.0, 1.0);
                _1936 = _1964;
            }
            float _1966 = _1936;
            float _1968 = _1960 * _1966;
            _1840 = _1968;
        }
    }
    _1842 = false;
    float _1970 = _1834;
    float _1972 = _1836;
    float _1974 = _1838;
    float _1976 = _1602;
    float _1978 = _1840;
    float _1980 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1984 = _1970 + _1982;
    float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1988 = _1972 + _1986;
    float _1990 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1992 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1980);
    bool _1994 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1996 = isnan(0.5);
    bool _1998 = _1994 || _1996;
    bool _2000 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2002 = _1998 || _2000;
    float _2004 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1992);
    bool _2006 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2008 = isnan(0.5);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2014 = _2010 || _2012;
    float _2016 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2018 = _1984 * _1984;
    float _2020 = 1.0 / _2016;
    float _2022 = fma(_1988, _1988, _2018);
    float _2024 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1990);
    float _2026 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2024);
    float _2028 = sqrt(_2022);
    float _2030 = _2026 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2032 = _2030 + _2016;
    float _2034 = _2032 * _2020;
    float _2036 = _2034 * 0.5;
    float _2038 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2040 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2038);
    bool _2042 = _2028 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2044 = 1.0 / _2040;
    bool _2046 = !_2042;
    float _2048 = _1972;
    float _2050 = _1974;
    float _2052 = _1970;
    float _2054 = _1976;
    float _2056 = _2028;
    float _2058 = _1988;
    float _2060 = _2044;
    if (!_2046)
    {
        float _2062 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2066 = _2028 + _2064;
        float _2068 = _1974 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2070 = rsqrt(_2022);
        float _2072 = _2066 * _2062;
        float _2074 = _2072 * 0.15915493667125701904296875;
        float _2076 = _2074 * 6.283185482025146484375;
        float _2078 = cos(_2076);
        float _2080 = _2074 * 6.283185482025146484375;
        float _2082 = sin(_2080);
        float _2084 = _2078 + (-1.0);
        float _2086 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2088 = fma(_2082, _2068, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2090 = fma(_2078, _1974, _2086);
        float _2092 = _2070 * _2088;
        float _2094 = fma(_1988, _2092, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2096 = fma(_1984, _2092, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2048 = _2094;
        _2050 = _2090;
        _2052 = _2096;
        _2054 = _2074;
        _2056 = _2082;
    }
    float _2098 = _2048;
    float _2100 = _2050;
    float _2102 = _2052;
    float _2104 = _2054;
    float _2106 = _2056;
    float _2108 = _2106;
    float _2110 = _2104;
    float _2112 = _2100;
    float _2114 = _2098;
    float _2116 = _2102;
    if (_2014)
    {
        _2108 = 1.0;
    }
    float _2118 = _2108;
    float _2120 = _2118;
    if (!_2002)
    {
        float _2122 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2124 = _1794 + _2122;
        float _2126 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2128 = _1792 + _2126;
        float _2130 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2132 = _2124 * _2124;
        float _2134 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2136 = _1796 + _2134;
        float _2138 = fma(_2128, _2128, _2132);
        float _2140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2142 = fma(_2136, _2136, _2138);
        float _2144 = sqrt(_2142);
        float _2146 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2148 = precise::min(_2144, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2150 = _2148 * _2140;
        float _2152 = -_1792;
        float _2154 = _2152 + _2098;
        float _2156 = _2146 * _2150;
        float _2158 = -_1794;
        float _2160 = _2158 + _2100;
        float _2162 = -_1796;
        float _2164 = _2162 + _2102;
        float _2166 = fma(_2154, _2156, _1792);
        float _2168 = fma(_2160, _2156, _1794);
        float _2170 = fma(_2164, _2156, _1796);
        _2110 = _2156;
        _2112 = _2168;
        _2114 = _2166;
        _2116 = _2170;
    }
    float _2172 = _2110;
    float _2174 = _2112;
    float _2176 = _2114;
    float _2178 = _2116;
    float _2180 = _2172;
    if (_2014)
    {
        _2058 = 1.0;
    }
    float _2182 = _2058;
    float _2184 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2186 = _2044 * _2184;
    float _2188 = _2182;
    if (!_2014)
    {
        float _2190 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2192 = _2190 * 0.15915493667125701904296875;
        float _2194 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2196 = _2192 * 6.283185482025146484375;
        float _2198 = cos(_2196);
        float _2200 = _2194 * 0.15915493667125701904296875;
        float _2202 = _2192 * 6.283185482025146484375;
        float _2204 = sin(_2202);
        float _2206 = 1.0 / _2198;
        float _2208 = _2200 * 6.283185482025146484375;
        float _2210 = cos(_2208);
        float _2212 = _2204 * _2206;
        float _2214 = _2200 * 6.283185482025146484375;
        float _2216 = sin(_2214);
        float _2218 = _2210 * _2212;
        float _2220 = 1.0 / _2218;
        float _2222 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2224 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2222;
        float _2226 = 1.0 / _2224;
        float _2228 = _2216 * _2220;
        float _2230 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2232 = fma(_2186, _2228, _2230);
        float _2234 = _2232 * _2226;
        float _2236 = precise::clamp(_2234, 0.0, 1.0);
        _2060 = _2200;
        _2180 = _2220;
        _2120 = _2236;
    }
    float _2238 = _2060;
    float _2240 = _2180;
    float _2242 = _2120;
    float _2244 = _2238;
    float _2246 = _2240;
    if (!_2014)
    {
        float _2248 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2250 = _2248 * 0.15915493667125701904296875;
        float _2252 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2254 = _2250 * 6.283185482025146484375;
        float _2256 = cos(_2254);
        float _2258 = _2252 * 0.15915493667125701904296875;
        float _2260 = _2250 * 6.283185482025146484375;
        float _2262 = sin(_2260);
        float _2264 = 1.0 / _2256;
        float _2266 = _2258 * 6.283185482025146484375;
        float _2268 = cos(_2266);
        float _2270 = _2262 * _2264;
        float _2272 = _2258 * 6.283185482025146484375;
        float _2274 = sin(_2272);
        float _2276 = _2268 * _2270;
        float _2278 = 1.0 / _2276;
        float _2280 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2282 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2280;
        float _2284 = 1.0 / _2282;
        float _2286 = _2274 * _2278;
        float _2288 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2290 = fma(_2186, _2286, _2288);
        float _2292 = _2290 * _2284;
        float _2294 = precise::clamp(_2292, 0.0, 1.0);
        float _2296 = -_2294;
        float _2298 = _2296 + 1.0;
        _2244 = _2278;
        _2246 = _2250;
        _2188 = _2298;
    }
    float _2300 = _2244;
    float _2302 = _2246;
    float _2304 = _2188;
    float _2306 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2308 = _2174 + _2306;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2312 = _2176 + _2310;
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2316 = _2178 + _2314;
    float _2318 = _2308 * _2308;
    float _2320 = fma(_2312, _2312, _2318);
    float _2322 = fma(_2316, _2316, _2320);
    float _2324 = rsqrt(_2322);
    float _2326 = sqrt(_2322);
    float _2328 = _2324 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2330 = _2312 * _2328;
    float _2332 = _2316 * _2328;
    float _2334 = _2330 * _2330;
    float _2336 = _2332 * _2332;
    float _2338 = _2334 + _2336;
    float _2340 = sqrt(_2338);
    bool _2342 = _2340 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2346 = _2340 + _2344;
    float _2348 = _2324;
    float _2350 = _2346;
    float _2352 = _2300;
    float _2354 = _2308;
    float _2356 = _2328;
    if (_2342)
    {
        float _2358 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2348 = _2358;
    }
    float _2360 = _2348;
    float _2362 = _2360;
    if (_2342)
    {
        float _2364 = _2346 * _2360;
        _2350 = _2364;
    }
    float _2366 = _2350;
    if (_2342)
    {
        float _2368 = rsqrt(_2338);
        _2362 = _2368;
    }
    float _2370 = _2362;
    float _2372 = _2370;
    if (_2342)
    {
        float _2374 = _2366 * 0.15915493667125701904296875;
        _2352 = _2374;
    }
    float _2376 = _2352;
    float _2378 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2380 = _2316;
    if (_2342)
    {
        float _2382 = _2376 * 6.283185482025146484375;
        float _2384 = sin(_2382);
        _2380 = _2384;
    }
    float _2386 = _2380;
    float _2388 = precise::max(0.0, _2378);
    float _2390 = _2302;
    float _2392 = _2388;
    if (_2342)
    {
        float _2394 = _2376 * 6.283185482025146484375;
        float _2396 = cos(_2394);
        _2390 = _2396;
    }
    float _2398 = _2390;
    float _2400 = -_2328;
    float _2402 = -_2388;
    float _2404 = fma(_2308, _2400, _2402);
    if (_2342)
    {
        float _2406 = _2404 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2354 = _2406;
    }
    float _2408 = _2354;
    float _2410 = _2386;
    float _2412 = _2408;
    if (_2342)
    {
        float _2414 = fma(_2386, _2408, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2410 = _2414;
    }
    float _2416 = _2410;
    float _2418 = _2416;
    if (!_2342)
    {
        _2412 = _2404;
    }
    float _2420 = _2412;
    float _2422 = _2420;
    if (_2342)
    {
        float _2424 = _2370 * _2416;
        _1626 = _2424;
    }
    float _2426 = _1626;
    if (!_2342)
    {
        _2372 = _2330;
    }
    float _2428 = _2372;
    float _2430 = _2428;
    float _2432 = _2398;
    if (_2342)
    {
        float _2434 = _2398 + (-1.0);
        _2392 = _2434;
    }
    float _2436 = _2392;
    float _2438 = _2436;
    if (_2342)
    {
        float _2440 = _2330 * _2426;
        _2430 = _2440;
    }
    float _2442 = _2430;
    if (!_2342)
    {
        _2418 = _2334;
    }
    float _2444 = _2418;
    float _2446 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2448 = _2444;
    if (_2342)
    {
        float _2450 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2356 = _2450;
    }
    float _2452 = _2356;
    if (!_2342)
    {
        _2438 = _2332;
    }
    float _2454 = _2438;
    float _2456 = _2454;
    if (_2342)
    {
        float _2458 = _2442 * _2442;
        _2448 = _2458;
    }
    float _2460 = _2448;
    if (_2342)
    {
        float _2462 = _2332 * _2426;
        _2456 = _2462;
    }
    float _2464 = _2456;
    if (_2342)
    {
        float _2466 = fma(_2404, _2398, _2452);
        _2422 = _2466;
    }
    float _2468 = _2422;
    if (!_2342)
    {
        _2432 = _2336;
    }
    float _2470 = _2432;
    float _2472 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2474 = _2470;
    if (_2342)
    {
        float _2476 = _2464 * _2464;
        _2474 = _2476;
    }
    float _2478 = _2474;
    float _2480 = fma(_2468, _2468, _2460);
    float _2482 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2484 = _2480 + _2478;
    float _2486 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2472);
    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2490 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2488);
    float _2492 = precise::clamp(_2490, 0.0, 1.0);
    float _2494 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2496 = rsqrt(_2484);
    float _2498 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2486);
    float _2500 = -_2492;
    float _2502 = _2500 + 1.0;
    float _2504 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2494);
    float _2506 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2482);
    float _2508 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2510 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2512 = abs(_2502);
    float _2514 = log2(_2512);
    float _2516 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2504);
    float _2518 = _2508 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2520 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2506);
    float _2522 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2510);
    float _2524 = _2516 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2526 = -_2518;
    float _2528 = fma(_2526, _2446, 1.0);
    float _2530 = _2520 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2532 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2522);
    float _2534 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2536 = _2496 * _2442;
    float _2538 = _2496 * _2468;
    float _2540 = _2496 * _2464;
    float _2542 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2534);
    float _2544 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2546 = _2532 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2548 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2550 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2542);
    float _2552 = -_2544;
    float _2554 = fma(_2538, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2552);
    float _2556 = log2(_2528);
    float _2558 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2560 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2550);
    float _2562 = -_2540;
    float _2564 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2554);
    float _2566 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2568 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2558);
    float _2570 = fma(_2564, -0.5, 0.5);
    float _2572 = exp2(_2548);
    float _2574 = fma(_2564, 0.5, 0.5);
    float _2576 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2566);
    float _2578 = _2538 + 1.0;
    float _2580 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2568);
    float _2582 = fma(_2574, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2584 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2576);
    float _2586 = 1.0 / _2560;
    float _2588 = fma(_2574, _2582, -0.212114393711090087890625);
    float _2590 = _2556 * 0.693147182464599609375;
    float _2592 = fma(_2574, _2588, 1.570728778839111328125);
    float _2594 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2596 = sqrt(_2570);
    float _2598 = -_2538;
    float _2600 = fma(_2572, _2578, _2598);
    float _2602 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2584);
    float _2604 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2580);
    float _2606 = fma(_2600, 0.5, 0.5);
    float _2608 = _2602 * _2586;
    float _2610 = _2604 * _2586;
    float _2612 = fma(_2608, 0.5, 0.5);
    float _2614 = fma(_2610, -0.5, 0.5);
    float _2616 = _2596 * 0.636619746685028076171875;
    float3 _6916 = float3(_2612, _2614, _2594);
    float _2618 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6916, float3(0.0), isnan(_6916)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6916, float3(0.0), isnan(_6916)), level(0.0)).x;
    float _2620 = -_2592;
    float _2622 = fma(_2616, _2620, 1.0);
    float3 _6932 = float3(_2612, _2614, _2594);
    float4 _2625 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6932, float3(0.0), isnan(_6932)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6932, float3(0.0), isnan(_6932)), level(0.0)).xyzw;
    float _2627 = _2625.x;
    float _2629 = _2625.y;
    float _2631 = _2625.z;
    float _2633 = _2625.w;
    float2 _6949 = float2(_2622, _2606);
    float3 _2637 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6949, float2(0.0), isnan(_6949)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6949, float2(0.0), isnan(_6949)), level(0.0)).xyz;
    float _2639 = _2637.x;
    float _2641 = _2637.y;
    float _2643 = _2637.z;
    float _2645 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2647 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2649 = _2326 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2651 = isnan(_2326);
    bool _2653 = _2649 || _2651;
    bool _2655 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2657 = _2653 || _2655;
    float _2659 = _2602 + _2560;
    out.m_82.x = _1792;
    out.m_82.y = _1794;
    out.m_82.z = _1796;
    float _2661 = fma(_2530, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2647);
    float _2663 = exp2(_2645);
    float _2665 = _2560 * 0.5;
    float _2667 = _2659 * 0.5;
    float _2669 = fma(_2508, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2661);
    float _2671 = fma(_2604, -0.5, _2665);
    float _2673 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2669);
    float _2675 = _2242 * _2304;
    float _2677 = _2673 + _2560;
    out.gl_Position.x = _2602;
    out.gl_Position.y = _2604;
    out.gl_Position.z = _2673;
    out.gl_Position.w = _2560;
    float _2679 = _2560;
    float _2681 = _2602;
    float _2683 = _2604;
    if (!_2657)
    {
        _1822 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2685 = _1822;
    float _2687 = _2675 * _1978;
    float _2689 = _2677 * 0.5;
    float _2691 = -_2663;
    float _2693 = _2691 + 1.0;
    float _2695 = _2687;
    float _2697 = _2685;
    float _2699 = _2685;
    if (!_2657)
    {
        _1824 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2701 = _1824;
    float _2703 = _2693 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _2667;
    out.m_84.y = _2671;
    out.m_84.z = _2689;
    out.m_84.w = _2560;
    float _2705 = _2701;
    float _2707 = _2701;
    if (!_2657)
    {
        _2679 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2709 = _2679;
    float _2711 = _2709;
    float _2713 = _2709;
    if (!_2657)
    {
        _2681 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2715 = _2681;
    float _2717 = _2715;
    float _2719 = _2715;
    if (!_2657)
    {
        _2683 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2721 = _2683;
    float _2723 = _2687 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2725 = _2721;
    float _2727 = _2721;
    if (!_2657)
    {
        _2695 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2729 = _2695;
    float _2731 = _2703 * _2618;
    float _2733 = -_2703;
    float _2735 = _2733 + 1.0;
    float _2737 = _2633 * _2731;
    float _2739 = _2643 * _2731;
    float _2741 = fma(_2639, _2737, _2627);
    float _2743 = fma(_2641, _2737, _2629);
    float _2745 = _2633 * _2735;
    float _2747 = fma(_2633, _2739, _2631);
    out.m_86.x = _2741;
    out.m_86.y = _2743;
    out.m_86.z = _2747;
    out.m_86.w = _2745;
    bool _2749 = !_2657;
    float _2751 = _2729;
    float _2753 = _2729;
    if (!_2749)
    {
        bool _2755 = _2326 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2757 = isnan(_2326);
        bool _2759 = _2755 || _2757;
        bool _2761 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2763 = _2759 || _2761;
        if (!_2763)
        {
            float _2765 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2767 = _2326 + _2765;
            float _2769 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2771 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2769;
            float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2775 = _2773 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2777 = 1.0 / _2771;
            float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2781 = _2779 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2785 = _2783 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2793 = _2791 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2795 = _2767 * _2777;
            float _2797 = precise::clamp(_2795, 0.0, 1.0);
            float _2799 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2801 = _2799 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2803 = fma(_2797, _2775, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2805 = fma(_2797, _2801, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2807 = fma(_2797, _2781, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2809 = fma(_2797, _2785, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2811 = fma(_2797, _2789, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2813 = fma(_2797, _2793, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2719 = _2807;
            _2707 = _2811;
            _2713 = _2803;
            _2699 = _2809;
            _2727 = _2805;
            _2753 = _2813;
            _2815 = true;
        }
        else
        {
            bool _2817 = _2326 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2819 = isnan(_2326);
            bool _2821 = _2817 || _2819;
            bool _2823 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2825 = _2821 || _2823;
            if (!_2825)
            {
                _2711 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2827 = _2711;
            _2713 = _2827;
            if (!_2825)
            {
                _2717 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2829 = _2717;
            _2719 = _2829;
            if (!_2825)
            {
                _2725 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2831 = _2725;
            _2727 = _2831;
            if (!_2825)
            {
                _2697 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2833 = _2697;
            _2699 = _2833;
            if (!_2825)
            {
                _2705 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2835 = _2705;
            _2707 = _2835;
            if (!_2825)
            {
                _2751 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2837 = _2751;
            bool _2839 = !_2825;
            _2753 = _2837;
            if (!_2839)
            {
                bool _2841 = _2326 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2843 = isnan(_2326);
                bool _2845 = _2841 || _2843;
                bool _2847 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2849 = _2845 || _2847;
                if (!_2849)
                {
                    float _2851 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2853 = _2326 + _2851;
                    float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2857 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2855;
                    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2863 = 1.0 / _2857;
                    float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2867 = _2865 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2871 = _2869 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2875 = _2873 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2877 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2879 = _2877 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2881 = _2853 * _2863;
                    float _2883 = precise::clamp(_2881, 0.0, 1.0);
                    float _2885 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2887 = _2885 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2889 = fma(_2883, _2861, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2891 = fma(_2883, _2887, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2893 = fma(_2883, _2867, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2895 = fma(_2883, _2871, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2897 = fma(_2883, _2875, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2899 = fma(_2883, _2879, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2719 = _2893;
                    _2707 = _2897;
                    _2713 = _2889;
                    _2699 = _2895;
                    _2727 = _2891;
                    _2753 = _2899;
                    _2815 = true;
                }
                else
                {
                    _2719 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2707 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2713 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2699 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2727 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2753 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2815 = false;
    float _2901 = _2719;
    float _2903 = _2707;
    float _2905 = _2713;
    float _2907 = _2699;
    float _2909 = _2727;
    float _2911 = _2753;
    float _2913 = fma(_1770, -0.5, 0.5);
    float _2915 = precise::clamp(_2913, 0.0, 1.0);
    float _2917 = -_2901;
    float _2919 = _2917 + _2903;
    float _2921 = -_2905;
    float _2923 = _2921 + _2907;
    out.m_88.x = 0.0;
    float _2925 = fma(_2915, _2919, _2901);
    float _2927 = -_2909;
    float _2929 = _2927 + _2911;
    float _2931 = fma(_2915, _2923, _2905);
    float _2933 = _2925 * 0.586610972881317138671875;
    bool _2935 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2937 = fma(_2915, _2929, _2909);
    float _2939 = _2723 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2941 = fma(_2931, 0.298911988735198974609375, _2933);
    bool _2943 = _2242 > 0.0;
    bool _2945 = isnan(_2242);
    bool _2947 = _2943 || _2945;
    bool _2949 = isnan(0.0);
    bool _2951 = _2947 || _2949;
    float _2953 = fma(_2937, 0.114477999508380889892578125, _2941);
    out.m_53.x = _2939;
    bool _2955 = _2304 <= 0.0;
    bool _2957 = !_2951;
    bool _2959 = _2955 || _2957;
    float _2961 = -_2953;
    float _2963 = _2931 + _2961;
    float _2965 = -_2953;
    float _2967 = _2925 + _2965;
    float _2969 = -_2953;
    float _2971 = _2937 + _2969;
    float _2973 = fma(_2963, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2953);
    float _2975 = fma(_2967, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2953);
    float _2977 = fma(_2971, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2953);
    bool _2979 = !_2935;
    if (!_2979)
    {
        float _2981 = -_2174;
        float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2985 = -_2176;
        float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2989 = -_2178;
        float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2993 = _2983 * _2983;
        float _2995 = fma(_2987, _2987, _2993);
        float _2997 = fma(_2991, _2991, _2995);
        float _2999 = sqrt(_2997);
        float _3001 = rsqrt(_2997);
        float _3003 = -_2999;
        float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3007 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3009 = precise::clamp(_3007, 0.0, 1.0);
        float _3011 = _2987 * _3001;
        float _3013 = _2983 * _3001;
        float _3015 = abs(_3009);
        float _3017 = log2(_3015);
        float _3019 = _2991 * _3001;
        float _3021 = _3011 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3023 = _1770 * _3013;
        float _3025 = -_3013;
        float _3027 = -_3021;
        float _3029 = fma(_3025, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3027);
        float _3031 = fma(_1768, _3011, _3023);
        float _3033 = -_3019;
        float _3035 = fma(_3033, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3029);
        float _3037 = fma(_1762, _3019, _3031);
        float _3039 = precise::clamp(_3037, 0.0, 1.0);
        float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3043 = _3035 + _3041;
        float _3045 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3047 = _3043 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3049 = precise::clamp(_3047, 0.0, 1.0);
        float _3051 = exp2(_3045);
        float _3053 = _3051 * _3049;
        float _3055 = _3039 * _3053;
        float _3057 = _3055 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3059 = _3055 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3061 = _3055 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3057;
        out.m_88.y = _3059;
        out.m_88.z = _3061;
    }
    out.m_90.x = _2973;
    out.m_90.y = _2975;
    out.m_90.z = _2977;
    if (!_2959)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3063 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3063;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

