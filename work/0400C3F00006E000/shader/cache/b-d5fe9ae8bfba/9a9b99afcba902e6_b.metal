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
    float4 m_55 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_67 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_63 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1478 = false;
    bool _482 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2090 = as_type<float>(_114);
        out.gl_Position.z = _2090;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_128)
    {
        float _134 = float(_98);
        _108 = _134;
    }
    float _136 = _108;
    bool _138 = _132 >= _136;
    bool _140 = !_128;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _116 = as_type<int>(_148);
    }
    int _150 = _116;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2159 = as_type<float>(_150);
        out.gl_Position.z = _2159;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_51.w;
    float _154 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_49.x;
    float _168 = in.m_49.y;
    float _170 = in.m_49.z;
    float _172 = in.m_44.x;
    float _174 = in.m_44.y;
    float _176 = in.m_44.z;
    float _178 = 0.0;
    float _180 = _154;
    if (!_164)
    {
        float _182 = _154 * _154;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_164)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_164;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _154 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _154);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_164;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _154 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _180 = _250;
    }
    float _252 = _180;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _166, _256);
    float _264 = fma(_252, _168, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _152, _172);
    float _270 = fma(_264, _152, _174);
    float _272 = fma(_266, _152, _176);
    bool _274 = !_254;
    float _292;
    if (!_274)
    {
        float _276 = in.m_53.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_98);
        float _298 = 1.0 / _296;
        float _300 = _132 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _312 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _314 = isnan(_302);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = 1.0 / _306;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _330 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _332 = isnan(_302);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _342;
    float _346 = -_322;
    float _348 = _346 + 1.0;
    bool _350 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _352 = isnan(_302);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _364 = 1.0 / _310;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _370 = _340 * _348;
    float _372 = -_340;
    float _374 = _372 + 1.0;
    float _376 = _360 * _374;
    float _378 = 1.0 / _328;
    float _380 = _344 * _324;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _384 = _302 + _382;
    float _386 = -_360;
    float _388 = _386 + 1.0;
    float _390 = fma(_380, _384, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _394 = _302 + _392;
    float _396 = _368 * _364;
    bool _398 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _400 = isnan(_302);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _410;
    float _414 = _390 * _376;
    float _416 = fma(_396, _394, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _420 = _302 + _418;
    float _422 = -_408;
    float _424 = _422 + 1.0;
    float _426 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[115].x, _414);
    float _428 = _412 * _378;
    float _430 = _322 * _424;
    float _432 = fma(_416, _370, _426);
    float _434 = fma(_428, _420, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _438 = fma(_434, _430, _432);
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _444 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[118].x, _438);
    float _446 = _436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _448 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _452 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _446;
    out.m_55.y = _448;
    out.m_55.z = _450;
    out.m_55.w = _452;
    bool _454 = !_362;
    float _478;
    float _480;
    if (!_454)
    {
        float _456 = in.m_53.x;
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _460 = float(_98);
        float _462 = 1.0 / _460;
        float _464 = _456 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _466 = _132 * _462;
        float _468 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _470 = _468 * _458;
        float _472 = floor(_470);
        float _474 = -_472;
        float _476 = _470 + _474;
        _478 = _476;
        _480 = _466;
        _482 = true;
    }
    else
    {
        float _484 = float(_98);
        float _486 = 1.0 / _484;
        float _488 = _132 * _486;
        _478 = _488;
        _480 = _488;
    }
    _482 = false;
    float _490 = _478;
    float _492 = _480;
    float _494 = in.m_53.w;
    float _496 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _498 = in.m_57.x;
    float _500 = in.m_57.y;
    float _502 = in.m_57.z;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _506 = _504 != 0;
    float _508 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _510 = in.m_51.x;
    float _512 = in.m_51.y;
    float _514 = in.m_51.z;
    float _516 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _520 = _518 != 0;
    float _522 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _496);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _530 = _528 != 0;
    float _532 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _508);
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _536 = _534 != 0;
    float _538 = 1.0 / _526;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _542 = _540 != 0;
    float _544 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _516);
    float _546 = in.m_53.y;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _550 = _490 + _548;
    float _552 = in.m_53.x;
    bool _554 = _494 > 0.5;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _560 = in.m_59.x;
    float _562 = in.m_59.y;
    float _564 = in.m_59.z;
    bool _566 = _500 != 0.0;
    bool _568 = isnan(_500);
    bool _570 = _566 || _568;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _580 = _512 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _582 = _498 == 0.0;
    bool _584 = !_574;
    bool _586 = _582 && _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _588;
    float _592 = _514 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _594 = 1.0 / _558;
    bool _596 = _502 == 0.0;
    bool _598 = _596 && _586;
    float _600 = _590 * _538;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _498);
    float _612 = 1.0 / _578;
    float _614 = in.m_61.y;
    float _616 = _510 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _502);
    float _622 = _560;
    float _624 = _564;
    float _626 = _562;
    bool _628 = _536;
    bool _630 = _598;
    if (!_598)
    {
        float _632 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[17].y, _560);
        _622 = _632;
    }
    float _634 = _622;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _640 = 1.0 / _604;
    if (!_598)
    {
        float _642 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[17].y, _564);
        _624 = _642;
    }
    float _644 = _624;
    if (!_598)
    {
        float _646 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[17].y, _562);
        _626 = _646;
    }
    float _648 = _626;
    float _650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _500);
    float _652 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _522);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _660 = 1.0 / _608;
    float _662 = _546 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _664 = _552 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _666 = 0.0;
    if (_530)
    {
        float _668 = in.m_53.z;
        _666 = _668;
    }
    float _670 = _666;
    float _672 = fma(_662, -2.0, _618);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _674;
    float _678 = 1.0 / _656;
    float _680 = _676 * _594;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _684 = _682 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _686 = -_658;
    float _688 = fma(_664, 2.0, _686);
    float _690 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _532);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _696 = _684 * _612;
    float _698 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _544);
    float _700 = 1.0 / _694;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _706 = 0.0;
    if (!_506)
    {
        float _708 = in.m_53.z;
        _706 = _708;
    }
    float _710 = _706;
    float _712 = _690 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _718 = 0.0;
    float _720 = _614;
    if (!_506)
    {
        _718 = _546;
    }
    float _722 = _718;
    float _724 = 1.0 / _638;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _736 = _722;
    if (_506)
    {
        _736 = _552;
    }
    float _738 = _736;
    float _740 = _728 * _660;
    float _742 = _732 * _640;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _744;
    float _748 = 1.0 / _704;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _758 = -_614;
    float _760 = _758 + 1.0;
    float _762 = _746 * _678;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _766 = _492 + _764;
    float _768 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[78].z, _734);
    float _770 = _652 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _772 = _752 * _724;
    float _774 = _716 * _700;
    int _776 = _554 ? as_type<int>(_760) : as_type<int>(_614);
    float _778 = fma(_740, _766, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _780 = _546 > 0.5;
    float _782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _784 = _536 ? as_type<float>(_776) : _614;
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _788 = _712 + _786;
    float _790 = _678;
    if (_520)
    {
        bool _792 = _552 > 0.5;
        _628 = _792;
    }
    bool _794 = _628;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _798 = _492 + _796;
    float _800 = _756 * _748;
    float _802 = fma(_680, _550, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_542)
    {
        float _804 = _780 ? _760 : _614;
        _720 = _804;
    }
    float _806 = _720;
    float _808 = fma(_772, _798, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    if (_530)
    {
        bool _810 = _670 > 0.5;
        _630 = _810;
    }
    bool _812 = _630;
    float _814 = _698 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _818 = _770 + _816;
    float _820 = _788 * _788;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _824 = _492 + _822;
    float _826 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _828 = _814 + _826;
    float _830 = fma(_818, _818, _820);
    float _832 = fma(_742, _824, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _834 = _490 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _836 = isnan(_490);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _848 = _782 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _850 = fma(_828, _828, _830);
    float _852 = 0.0;
    float _854 = _710;
    if (!_506)
    {
        _852 = _710;
    }
    float _856 = _852;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _860 = _490 + _858;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _864 = _492 + _862;
    float _866 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[78].w, _846);
    float _868 = _856;
    if (_506)
    {
        _868 = _546;
    }
    float _870 = _868;
    float _872 = fma(_784, _848, -0.5);
    if (_506)
    {
        _854 = _546;
    }
    float _874 = _854;
    float _876 = -_844;
    float _878 = _876 + 1.0;
    bool _880 = _490 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _882 = isnan(_490);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = fma(_696, _860, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _894 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _896 = isnan(_492);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = fma(_800, _864, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _908 = rsqrt(_850);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _912 = _492 + _910;
    bool _914 = _490 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _916 = isnan(_490);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = _890 * _878;
    float _928 = -_890;
    float _930 = _928 + 1.0;
    bool _932 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _934 = isnan(_492);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = -_904;
    float _946 = _944 + 1.0;
    float _948 = fma(_774, _912, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _950 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _952 = isnan(_492);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = _924 * _930;
    float _964 = _942 * _946;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _968 = _492 + _966;
    float _970 = -_942;
    float _972 = _970 + 1.0;
    float _974 = _802 * _962;
    bool _976 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _978 = isnan(_492);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = -_960;
    float _990 = _988 + 1.0;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _994 = _492 + _992;
    float _996 = fma(_600, _968, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _998 = _960 * _972;
    float _1000 = _986 * _990;
    float _1002 = fma(_762, _994, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1004 = _788 * _908;
    bool _1006 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1008 = isnan(_492);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1014 = _1010 || _1012;
    float _1016 = float(_1014);
    float _1018 = -_986;
    float _1020 = _1018 + 1.0;
    float _1022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1024 = _818 * _908;
    bool _1026 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1028 = isnan(_492);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1034 = _1030 || _1032;
    float _1036 = float(_1034);
    float _1038 = -_1004;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _788);
    float _1042 = _1016 * _1020;
    float _1044 = -_1016;
    float _1046 = _1044 + 1.0;
    float _1048 = -_1024;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    bool _1052 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1054 = isnan(_492);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = _1040 * _1040;
    float _1066 = _828 * _908;
    float _1068 = -_1036;
    float _1070 = _1068 + 1.0;
    float _1072 = _1036 * _1046;
    float _1074 = fma(_1050, _1050, _1064);
    float _1076 = -_1066;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _828);
    bool _1080 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1082 = isnan(_492);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    float _1092 = _1062 * _1070;
    float _1094 = -_1062;
    float _1096 = _1094 + 1.0;
    float _1098 = fma(_1078, _1078, _1074);
    float _1100 = _592 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1102 = _1090 * _1096;
    float _1104 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1106 = sqrt(_1098);
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1110 = fma(_1104, _806, -0.5);
    float _1112 = _778 * _1102;
    float _1114 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1108);
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1118 = _738 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1122 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _672);
    float _1124 = in.m_61.x;
    float _1126 = -_1116;
    float _1128 = fma(_1118, 2.0, _1126);
    float _1130 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1120);
    float _1132 = _580 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1134 = _616 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1136 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _866);
    float _1138 = _908 * _1106;
    float _1140 = _648 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1142 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _768);
    float _1144 = -_1122;
    float _1146 = fma(_1136, _1110, _1144);
    float _1148 = _1132 * _1138;
    float _1150 = _1134 * _1138;
    float _1152 = _1100 * _1138;
    float _1154 = -_132;
    float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1128);
    float _1158 = _1148 * _650;
    float _1160 = _1150 * _610;
    float _1162 = _1152 * _620;
    float _1164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1166 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1168 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1170 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1130);
    float _1172 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1166);
    float _1174 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1168);
    float _1176 = -_1090;
    float _1178 = _1176 + 1.0;
    float _1180 = -_924;
    float _1182 = _1180 + 1.0;
    float _1184 = fma(_1162, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1172);
    float _1186 = fma(_1162, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1174);
    float _1188 = _870 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1190 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[131].x, _974);
    float _1192 = _770 + _1184;
    float _1194 = _814 + _1186;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1198 = _648 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1202 = _1192 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1206 = _1194 + _1204;
    float _1208 = fma(_1188, -2.0, _1196);
    float _1210 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1212 = _1202 * _1202;
    float _1214 = _1206 * _1206;
    float _1216 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1112);
    float _1218 = _648 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[82].x);
    float _1222 = _1124;
    float _1224 = _1212;
    float _1226 = _1214;
    float _1228 = _1192;
    float _1230 = _1194;
    float _1232 = _906;
    if (_520)
    {
        float _1234 = -_1124;
        float _1236 = _1234 + 1.0;
        _1220 = as_type<int>(_1236);
    }
    int _1238 = _1220;
    float _1240 = _1212 + _1214;
    float _1242 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1198);
    if (!_520)
    {
        _790 = _1124;
    }
    float _1244 = _790;
    float _1246 = fma(_892, _926, _1190);
    float _1248 = sqrt(_1240);
    float _1250 = _1244;
    if (_520)
    {
        float _1252 = _794 ? as_type<float>(_1238) : _1124;
        _1250 = _1252;
    }
    float _1254 = _1250;
    int _1256 = 0;
    if (_530)
    {
        float _1258 = -_1124;
        float _1260 = _1258 + 1.0;
        _1256 = as_type<int>(_1260);
    }
    int _1262 = _1256;
    float _1264 = -_132;
    float _1266 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[76].x, _688);
    float _1268 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1208);
    float _1270 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1272 = fma(_1210, _1254, -0.5);
    float _1274 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1114);
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1278 = in.m_63.w;
    if (_530)
    {
        float _1280 = _812 ? as_type<float>(_1262) : _1124;
        _1222 = _1280;
    }
    float _1282 = _1222;
    float _1284 = fma(_832, _1092, _1216);
    float _1286 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1270);
    float _1288 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1218);
    float _1290 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1140);
    float _1292 = fma(_808, _1072, _1284);
    bool _1294 = _1248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1296 = fma(_1162, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1286);
    float _1298 = fma(_948, _1042, _1292);
    float _1300 = -_1268;
    float _1302 = fma(_1170, _872, _1300);
    float _1304 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1246);
    float _1306 = _712 + _1296;
    float _1308 = fma(_644, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1288);
    float _1310 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1312 = fma(_644, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1242);
    float _1314 = fma(_1142, _1272, _1266);
    float _1316 = fma(_1002, _1000, _1298);
    float _1318 = fma(_1310, _1282, -0.5);
    float _1320 = fma(_644, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1290);
    float _1322 = _1298;
    float _1324 = _1306;
    if (!_1294)
    {
        _1322 = _1306;
    }
    float _1326 = _1322;
    float _1328 = fma(_1274, _1318, _1156);
    bool _1330 = !_1294;
    float _1332 = _1326;
    if (!_1330)
    {
        float _1334 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1338 = _1248 + _1336;
        float _1340 = _1306 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1342 = rsqrt(_1240);
        float _1344 = _1338 * _1334;
        float _1346 = _1344 * 0.15915493667125701904296875;
        float _1348 = _1346 * 6.283185482025146484375;
        float _1350 = sin(_1348);
        float _1352 = _1346 * 6.283185482025146484375;
        float _1354 = cos(_1352);
        float _1356 = fma(_1350, _1340, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1358 = _1342 * _1356;
        float _1360 = _1354 + (-1.0);
        float _1362 = fma(_1202, _1358, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1364 = fma(_1206, _1358, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1366 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1370 = _1362 + _1368;
        float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1374 = _1364 + _1372;
        float _1376 = fma(_1306, _1354, _1366);
        float _1378 = _1370 * _1370;
        float _1380 = _1374 * _1374;
        _1332 = _1376;
        _1224 = _1378;
        _1226 = _1380;
        _1228 = _1362;
        _1230 = _1364;
    }
    float _1382 = _1332;
    float _1384 = _1224;
    float _1386 = _1226;
    float _1388 = _1228;
    float _1390 = _1230;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1394 = _1382 + _1392;
    float _1396 = fma(_906, _998, _1316);
    float _1398 = _1146 + 0.5;
    float _1400 = fma(_1394, _1394, _1384);
    float _1402 = fma(_996, _964, _1396);
    float _1404 = _1400 + _1386;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1410 = _1304 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1414 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1416 = sqrt(_1404);
    float _1418 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1420 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1314 + 0.5;
    float _1424 = _1328 + 0.5;
    float _1426 = _1302 + 0.5;
    float _1428 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1402);
    out.m_65.w = _1278;
    out.m_67.x = _1308;
    out.m_67.y = _1312;
    out.m_67.z = _1320;
    out.m_69.x = _1414;
    out.m_69.y = _1418;
    out.m_69.z = _1420;
    out.m_69.w = _1410;
    bool _1430 = _1416 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1432 = isnan(_1416);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1438 = _1434 || _1436;
    out.m_71.x = _1422;
    out.m_71.y = _1398;
    out.m_71.z = _1424;
    out.m_71.w = _1426;
    out.m_73.x = _1428;
    float _1440 = _1414;
    float _1442 = _1410;
    if (!_1438)
    {
        _1232 = 1.0;
    }
    float _1444 = _1232;
    bool _1446 = !_1438;
    float _1448 = _1444;
    if (!_1446)
    {
        bool _1450 = _1416 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1452 = isnan(_1416);
        bool _1454 = _1450 || _1452;
        bool _1456 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1458 = _1454 || _1456;
        if (!_1458)
        {
            float _1460 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1462 = _1416 + _1460;
            float _1464 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1466 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1464;
            float _1468 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1470 = _1468 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1472 = 1.0 / _1466;
            float _1474 = _1462 * _1472;
            float _1476 = fma(_1474, _1470, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1448 = _1476;
            _1478 = true;
        }
        else
        {
            bool _1480 = _1416 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1482 = isnan(_1416);
            bool _1484 = _1480 || _1482;
            bool _1486 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1488 = _1484 || _1486;
            if (!_1488)
            {
                float _1490 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1492 = _1416 + _1490;
                float _1494 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1496 = _1494 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1498 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1500 = _1498 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1502 = 1.0 / _1496;
                float _1504 = _1492 * _1502;
                float _1506 = fma(_1504, _1500, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1448 = _1506;
                _1478 = true;
            }
            else
            {
                _1448 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1478 = false;
    float _1508 = _1448;
    float _1510 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1512 = _1382 + _1510;
    float _1514 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1516 = _1388 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1520 = _1390 + _1518;
    float _1522 = fma(_1512, _1508, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1524 = fma(_1516, _1508, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1526 = fma(_1520, _1508, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1528 = -_1004;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1522);
    float _1532 = -_1024;
    float _1534 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1524);
    float _1536 = -_1066;
    float _1538 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1526);
    float _1540 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1544 = _1530 + _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1548 = _1534 + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1552 = _1538 + _1550;
    float _1554 = _1544 * _1544;
    float _1556 = fma(_1548, _1548, _1554);
    float _1558 = fma(_1552, _1552, _1556);
    float _1560 = rsqrt(_1558);
    float _1562 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1564 = _1548 * _1562;
    float _1566 = _1552 * _1562;
    float _1568 = _1564 * _1564;
    float _1570 = _1566 * _1566;
    float _1572 = _1568 + _1570;
    float _1574 = sqrt(_1572);
    bool _1576 = _1574 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = _1574 + _1578;
    float _1582 = _1556;
    float _1584 = _1580;
    float _1586 = _1564;
    if (_1576)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1582 = _1588;
    }
    float _1590 = _1582;
    if (_1576)
    {
        float _1592 = rsqrt(_1572);
        _1440 = _1592;
    }
    float _1594 = _1440;
    float _1596 = _1594;
    if (_1576)
    {
        float _1598 = _1580 * _1590;
        _1584 = _1598;
    }
    float _1600 = _1584;
    if (_1576)
    {
        float _1602 = _1600 * 0.15915493667125701904296875;
        _1442 = _1602;
    }
    float _1604 = _1442;
    float _1606 = _1590;
    if (_1576)
    {
        float _1608 = _1604 * 6.283185482025146484375;
        float _1610 = sin(_1608);
        _1606 = _1610;
    }
    float _1612 = _1606;
    float _1614 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1616 = precise::max(0.0, _1614);
    float _1618 = _904;
    float _1620 = _1616;
    if (_1576)
    {
        float _1622 = _1604 * 6.283185482025146484375;
        float _1624 = cos(_1622);
        _1618 = _1624;
    }
    float _1626 = _1618;
    float _1628 = -_1562;
    float _1630 = -_1616;
    float _1632 = fma(_1544, _1628, _1630);
    float _1634 = _1632;
    if (_1576)
    {
        float _1636 = _1632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1636;
    }
    float _1638 = _1620;
    float _1640 = sqrt(_1558);
    float _1642 = _1612;
    float _1644 = _1638;
    if (_1576)
    {
        float _1646 = fma(_1612, _1638, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1642 = _1646;
    }
    float _1648 = _1642;
    float _1650 = _1648;
    float _1652 = _1626;
    if (_1576)
    {
        float _1654 = _1626 + (-1.0);
        _1644 = _1654;
    }
    float _1656 = _1644;
    float _1658 = _1656;
    if (_1576)
    {
        float _1660 = _1594 * _1648;
        _1324 = _1660;
    }
    float _1662 = _1324;
    if (!_1576)
    {
        _1596 = _1566;
    }
    float _1664 = _1596;
    float _1666 = _1664;
    if (_1576)
    {
        float _1668 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1650 = _1668;
    }
    float _1670 = _1650;
    if (_1576)
    {
        float _1672 = _1564 * _1662;
        _1586 = _1672;
    }
    float _1674 = _1586;
    if (!_1576)
    {
        _1658 = _1568;
    }
    float _1676 = _1658;
    float _1678 = _1676;
    if (_1576)
    {
        float _1680 = _1566 * _1662;
        _1666 = _1680;
    }
    float _1682 = _1666;
    if (_1576)
    {
        float _1684 = fma(_1632, _1626, _1670);
        _1634 = _1684;
    }
    float _1686 = _1634;
    if (_1576)
    {
        float _1688 = _1674 * _1674;
        _1678 = _1688;
    }
    float _1690 = _1678;
    if (!_1576)
    {
        _1652 = _1570;
    }
    float _1692 = _1652;
    float _1694 = _1692;
    if (_1576)
    {
        float _1696 = _1682 * _1682;
        _1694 = _1696;
    }
    float _1698 = _1694;
    float _1700 = fma(_1686, _1686, _1690);
    float _1702 = _1700 + _1698;
    float _1704 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1708 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1706);
    float _1710 = precise::clamp(_1708, 0.0, 1.0);
    float _1712 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1714 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1704);
    float _1716 = rsqrt(_1702);
    float _1718 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1720 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1712);
    float _1722 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1714);
    float _1724 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1726 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1718);
    float _1728 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1720);
    float _1730 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1732 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1724);
    float _1734 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1726);
    float _1736 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1738 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1740 = -_1710;
    float _1742 = _1740 + 1.0;
    float _1744 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1746 = -_1738;
    float _1748 = fma(_1746, _1540, 1.0);
    float _1750 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1732);
    float _1752 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1754 = _1716 * _1674;
    float _1756 = abs(_1742);
    float _1758 = log2(_1756);
    float _1760 = _1716 * _1686;
    float _1762 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1752);
    float _1764 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1766 = _1716 * _1682;
    float _1768 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1770 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1762);
    float _1772 = -_1764;
    float _1774 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1772);
    float _1776 = log2(_1748);
    float _1778 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1780 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1770);
    float _1782 = -_1766;
    float _1784 = fma(_1782, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1774);
    float _1786 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1788 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1778);
    float _1790 = _1760 + 1.0;
    float _1792 = fma(_1784, -0.5, 0.5);
    float _1794 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1796 = 1.0 / _1780;
    float _1798 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1786);
    float _1800 = fma(_1784, 0.5, 0.5);
    float _1802 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1788);
    float _1804 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1798);
    float _1806 = fma(_1800, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1808 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1802);
    float _1810 = exp2(_1794);
    float _1812 = _1776 * 0.693147182464599609375;
    float _1814 = fma(_1800, _1806, -0.212114393711090087890625);
    float _1816 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1818 = fma(_1800, _1814, 1.570728778839111328125);
    float _1820 = sqrt(_1792);
    float _1822 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1804);
    float _1824 = _1808 * _1796;
    float _1826 = _1822 * _1796;
    float _1828 = fma(_1824, -0.5, 0.5);
    float _1830 = -_1760;
    float _1832 = fma(_1810, _1790, _1830);
    float _1834 = fma(_1826, 0.5, 0.5);
    float _1836 = fma(_1832, 0.5, 0.5);
    float _1838 = _1820 * 0.636619746685028076171875;
    float3 _4946 = float3(_1834, _1828, _1816);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4946, float3(0.0), isnan(_4946)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4946, float3(0.0), isnan(_4946)), level(0.0)).x;
    float3 _4957 = float3(_1834, _1828, _1816);
    float4 _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4957, float3(0.0), isnan(_4957)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4957, float3(0.0), isnan(_4957)), level(0.0)).xyzw;
    float _1845 = _1843.x;
    float _1847 = _1843.y;
    float _1849 = _1843.z;
    float _1851 = _1843.w;
    float _1853 = -_1818;
    float _1855 = fma(_1838, _1853, 1.0);
    float2 _4979 = float2(_1855, _1836);
    float3 _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4979, float2(0.0), isnan(_4979)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4979, float2(0.0), isnan(_4979)), level(0.0)).xyz;
    float _1861 = _1859.x;
    float _1863 = _1859.y;
    float _1865 = _1859.z;
    float _1867 = -_1004;
    float _1869 = fma(_1867, (*spvDescriptorSet0.vp_c9)._m0[18].w, _712);
    float _1871 = -_1024;
    float _1873 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[18].w, _770);
    float _1875 = -_1066;
    float _1877 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[18].w, _814);
    out.m_75.x = _1548;
    out.m_75.y = _1544;
    out.m_75.z = _1552;
    float _1879 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1881 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1883 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1879);
    float _1885 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1881);
    float _1887 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1883);
    float _1889 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1885);
    float _1891 = _1887 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1893 = _1889 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1895 = 1.0 / _1891;
    bool _1897 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1899 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1901 = _1897 || _1899;
    bool _1903 = isnan(0.5);
    bool _1905 = _1901 || _1903;
    float _1907 = _1893 + _1891;
    float _1909 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1911 = _1877;
    float _1913 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1915 = _1730;
    if (!_1905)
    {
        _1911 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1917 = _1911;
    float _1919 = exp2(_1909);
    float _1921 = _1907 * _1895;
    float _1923 = _1921 * 0.5;
    float _1925 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1927 = _1923;
    float _1929 = _1917;
    if (!_1905)
    {
        float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1933 = fma(_1923, _1917, _1931);
        _1927 = _1933;
    }
    float _1935 = _1927;
    if (!_1905)
    {
        _1929 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1937 = _1929;
    float _1939 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1925);
    float _1941 = _1937;
    if (!_1905)
    {
        float _1943 = -_1937;
        float _1945 = _1943 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1913 = _1945;
    }
    float _1947 = _1913;
    float _1949 = _1935;
    if (!_1905)
    {
        float _1951 = 1.0 / _1935;
        _1949 = _1951;
    }
    float _1953 = _1949;
    float _1955 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1939);
    if (_1905)
    {
        _1915 = 1.0;
    }
    float _1957 = _1915;
    float _1959 = -_1919;
    float _1961 = _1959 + 1.0;
    float _1963 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1955);
    float _1965 = _1947;
    float _1967 = _1957;
    if (!_1905)
    {
        float _1969 = 1.0 / _1947;
        _1965 = _1969;
    }
    float _1971 = _1965;
    float _1973 = _1963 + _1780;
    out.gl_Position.x = _1822;
    out.gl_Position.y = _1808;
    out.gl_Position.z = _1963;
    out.gl_Position.w = _1780;
    if (!_1905)
    {
        float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1977 = -_1937;
        float _1979 = fma(_1953, _1975, _1977);
        _1941 = _1979;
    }
    float _1981 = _1941;
    float _1983 = _1973 * 0.5;
    float _1985 = _1981;
    if (!_1905)
    {
        float _1987 = _1981 * _1971;
        float _1989 = precise::clamp(_1987, 0.0, 1.0);
        _1985 = _1989;
    }
    float _1991 = _1985;
    float _1993 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1905)
    {
        float _1995 = -_1991;
        float _1997 = _1995 + 1.0;
        _1967 = _1997;
    }
    float _1999 = _1967;
    float _2001 = _1999 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2003 = _1999 > 0.0;
    bool _2005 = isnan(_1999);
    bool _2007 = _2003 || _2005;
    bool _2009 = isnan(0.0);
    bool _2011 = _2007 || _2009;
    out.m_77.z = _1983;
    out.m_77.w = _1780;
    float _2013 = _2001 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _2013;
    float _2015 = _1993 * _1840;
    float _2017 = -_1993;
    float _2019 = _2017 + 1.0;
    float _2021 = _1851 * _2015;
    float _2023 = _1851 * _2019;
    float _2025 = _1865 * _2015;
    float _2027 = fma(_1861, _2021, _1845);
    float _2029 = fma(_1863, _2021, _1847);
    float _2031 = fma(_1851, _2025, _1849);
    out.m_79.x = _2027;
    out.m_79.y = _2029;
    out.m_79.z = _2031;
    out.m_79.w = _2023;
    if (_2011)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2033 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2033;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1478 = false;
    bool _482 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2090 = as_type<float>(_114);
        out.gl_Position.z = _2090;
    }
    if (!_102)
    {
        return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_128)
    {
        float _134 = float(_98);
        _108 = _134;
    }
    float _136 = _108;
    bool _138 = _132 >= _136;
    bool _140 = !_128;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _116 = as_type<int>(_148);
    }
    int _150 = _116;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2159 = as_type<float>(_150);
        out.gl_Position.z = _2159;
    }
    if (_142)
    {
        return out;
    }
    float _152 = in.m_51.w;
    float _154 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_49.x;
    float _168 = in.m_49.y;
    float _170 = in.m_49.z;
    float _172 = in.m_44.x;
    float _174 = in.m_44.y;
    float _176 = in.m_44.z;
    float _178 = 0.0;
    float _180 = _154;
    if (!_164)
    {
        float _182 = _154 * _154;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_164)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_164;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _154 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _154);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_164;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _154 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _180 = _250;
    }
    float _252 = _180;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _166, _256);
    float _264 = fma(_252, _168, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _152, _172);
    float _270 = fma(_264, _152, _174);
    float _272 = fma(_266, _152, _176);
    bool _274 = !_254;
    float _292;
    if (!_274)
    {
        float _276 = in.m_53.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_98);
        float _298 = 1.0 / _296;
        float _300 = _132 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _312 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _314 = isnan(_302);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = 1.0 / _306;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _330 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _332 = isnan(_302);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _342;
    float _346 = -_322;
    float _348 = _346 + 1.0;
    bool _350 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _352 = isnan(_302);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _364 = 1.0 / _310;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _370 = _340 * _348;
    float _372 = -_340;
    float _374 = _372 + 1.0;
    float _376 = _360 * _374;
    float _378 = 1.0 / _328;
    float _380 = _344 * _324;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _384 = _302 + _382;
    float _386 = -_360;
    float _388 = _386 + 1.0;
    float _390 = fma(_380, _384, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _394 = _302 + _392;
    float _396 = _368 * _364;
    bool _398 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _400 = isnan(_302);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _410;
    float _414 = _390 * _376;
    float _416 = fma(_396, _394, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _420 = _302 + _418;
    float _422 = -_408;
    float _424 = _422 + 1.0;
    float _426 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[115].x, _414);
    float _428 = _412 * _378;
    float _430 = _322 * _424;
    float _432 = fma(_416, _370, _426);
    float _434 = fma(_428, _420, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _438 = fma(_434, _430, _432);
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _444 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[118].x, _438);
    float _446 = _436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _448 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _452 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _446;
    out.m_55.y = _448;
    out.m_55.z = _450;
    out.m_55.w = _452;
    bool _454 = !_362;
    float _478;
    float _480;
    if (!_454)
    {
        float _456 = in.m_53.x;
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _460 = float(_98);
        float _462 = 1.0 / _460;
        float _464 = _456 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _466 = _132 * _462;
        float _468 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _470 = _468 * _458;
        float _472 = floor(_470);
        float _474 = -_472;
        float _476 = _470 + _474;
        _478 = _476;
        _480 = _466;
        _482 = true;
    }
    else
    {
        float _484 = float(_98);
        float _486 = 1.0 / _484;
        float _488 = _132 * _486;
        _478 = _488;
        _480 = _488;
    }
    _482 = false;
    float _490 = _478;
    float _492 = _480;
    float _494 = in.m_53.w;
    float _496 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _498 = in.m_57.x;
    float _500 = in.m_57.y;
    float _502 = in.m_57.z;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _506 = _504 != 0;
    float _508 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _510 = in.m_51.x;
    float _512 = in.m_51.y;
    float _514 = in.m_51.z;
    float _516 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _520 = _518 != 0;
    float _522 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _496);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _530 = _528 != 0;
    float _532 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _508);
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _536 = _534 != 0;
    float _538 = 1.0 / _526;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _542 = _540 != 0;
    float _544 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _516);
    float _546 = in.m_53.y;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _550 = _490 + _548;
    float _552 = in.m_53.x;
    bool _554 = _494 > 0.5;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _560 = in.m_59.x;
    float _562 = in.m_59.y;
    float _564 = in.m_59.z;
    bool _566 = _500 != 0.0;
    bool _568 = isnan(_500);
    bool _570 = _566 || _568;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _580 = _512 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _582 = _498 == 0.0;
    bool _584 = !_574;
    bool _586 = _582 && _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _588;
    float _592 = _514 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _594 = 1.0 / _558;
    bool _596 = _502 == 0.0;
    bool _598 = _596 && _586;
    float _600 = _590 * _538;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _498);
    float _612 = 1.0 / _578;
    float _614 = in.m_61.y;
    float _616 = _510 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _502);
    float _622 = _560;
    float _624 = _564;
    float _626 = _562;
    bool _628 = _536;
    bool _630 = _598;
    if (!_598)
    {
        float _632 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[17].y, _560);
        _622 = _632;
    }
    float _634 = _622;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _640 = 1.0 / _604;
    if (!_598)
    {
        float _642 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[17].y, _564);
        _624 = _642;
    }
    float _644 = _624;
    if (!_598)
    {
        float _646 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[17].y, _562);
        _626 = _646;
    }
    float _648 = _626;
    float _650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _500);
    float _652 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _522);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _660 = 1.0 / _608;
    float _662 = _546 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _664 = _552 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _666 = 0.0;
    if (_530)
    {
        float _668 = in.m_53.z;
        _666 = _668;
    }
    float _670 = _666;
    float _672 = fma(_662, -2.0, _618);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _674;
    float _678 = 1.0 / _656;
    float _680 = _676 * _594;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _684 = _682 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _686 = -_658;
    float _688 = fma(_664, 2.0, _686);
    float _690 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _532);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _696 = _684 * _612;
    float _698 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _544);
    float _700 = 1.0 / _694;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _706 = 0.0;
    if (!_506)
    {
        float _708 = in.m_53.z;
        _706 = _708;
    }
    float _710 = _706;
    float _712 = _690 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _718 = 0.0;
    float _720 = _614;
    if (!_506)
    {
        _718 = _546;
    }
    float _722 = _718;
    float _724 = 1.0 / _638;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _736 = _722;
    if (_506)
    {
        _736 = _552;
    }
    float _738 = _736;
    float _740 = _728 * _660;
    float _742 = _732 * _640;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _744;
    float _748 = 1.0 / _704;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _758 = -_614;
    float _760 = _758 + 1.0;
    float _762 = _746 * _678;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _766 = _492 + _764;
    float _768 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[78].z, _734);
    float _770 = _652 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _772 = _752 * _724;
    float _774 = _716 * _700;
    int _776 = _554 ? as_type<int>(_760) : as_type<int>(_614);
    float _778 = fma(_740, _766, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _780 = _546 > 0.5;
    float _782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _784 = _536 ? as_type<float>(_776) : _614;
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _788 = _712 + _786;
    float _790 = _678;
    if (_520)
    {
        bool _792 = _552 > 0.5;
        _628 = _792;
    }
    bool _794 = _628;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _798 = _492 + _796;
    float _800 = _756 * _748;
    float _802 = fma(_680, _550, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_542)
    {
        float _804 = _780 ? _760 : _614;
        _720 = _804;
    }
    float _806 = _720;
    float _808 = fma(_772, _798, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    if (_530)
    {
        bool _810 = _670 > 0.5;
        _630 = _810;
    }
    bool _812 = _630;
    float _814 = _698 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _818 = _770 + _816;
    float _820 = _788 * _788;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _824 = _492 + _822;
    float _826 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _828 = _814 + _826;
    float _830 = fma(_818, _818, _820);
    float _832 = fma(_742, _824, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _834 = _490 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _836 = isnan(_490);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _848 = _782 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _850 = fma(_828, _828, _830);
    float _852 = 0.0;
    float _854 = _710;
    if (!_506)
    {
        _852 = _710;
    }
    float _856 = _852;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _860 = _490 + _858;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _864 = _492 + _862;
    float _866 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[78].w, _846);
    float _868 = _856;
    if (_506)
    {
        _868 = _546;
    }
    float _870 = _868;
    float _872 = fma(_784, _848, -0.5);
    if (_506)
    {
        _854 = _546;
    }
    float _874 = _854;
    float _876 = -_844;
    float _878 = _876 + 1.0;
    bool _880 = _490 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _882 = isnan(_490);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = fma(_696, _860, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _894 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _896 = isnan(_492);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = fma(_800, _864, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _908 = rsqrt(_850);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _912 = _492 + _910;
    bool _914 = _490 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _916 = isnan(_490);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = _890 * _878;
    float _928 = -_890;
    float _930 = _928 + 1.0;
    bool _932 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _934 = isnan(_492);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = -_904;
    float _946 = _944 + 1.0;
    float _948 = fma(_774, _912, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _950 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _952 = isnan(_492);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = _924 * _930;
    float _964 = _942 * _946;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _968 = _492 + _966;
    float _970 = -_942;
    float _972 = _970 + 1.0;
    float _974 = _802 * _962;
    bool _976 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _978 = isnan(_492);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = -_960;
    float _990 = _988 + 1.0;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _994 = _492 + _992;
    float _996 = fma(_600, _968, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _998 = _960 * _972;
    float _1000 = _986 * _990;
    float _1002 = fma(_762, _994, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1004 = _788 * _908;
    bool _1006 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1008 = isnan(_492);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1014 = _1010 || _1012;
    float _1016 = float(_1014);
    float _1018 = -_986;
    float _1020 = _1018 + 1.0;
    float _1022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1024 = _818 * _908;
    bool _1026 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1028 = isnan(_492);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1034 = _1030 || _1032;
    float _1036 = float(_1034);
    float _1038 = -_1004;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _788);
    float _1042 = _1016 * _1020;
    float _1044 = -_1016;
    float _1046 = _1044 + 1.0;
    float _1048 = -_1024;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    bool _1052 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1054 = isnan(_492);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = _1040 * _1040;
    float _1066 = _828 * _908;
    float _1068 = -_1036;
    float _1070 = _1068 + 1.0;
    float _1072 = _1036 * _1046;
    float _1074 = fma(_1050, _1050, _1064);
    float _1076 = -_1066;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _828);
    bool _1080 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1082 = isnan(_492);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    float _1092 = _1062 * _1070;
    float _1094 = -_1062;
    float _1096 = _1094 + 1.0;
    float _1098 = fma(_1078, _1078, _1074);
    float _1100 = _592 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1102 = _1090 * _1096;
    float _1104 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1106 = sqrt(_1098);
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1110 = fma(_1104, _806, -0.5);
    float _1112 = _778 * _1102;
    float _1114 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1108);
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1118 = _738 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1122 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _672);
    float _1124 = in.m_61.x;
    float _1126 = -_1116;
    float _1128 = fma(_1118, 2.0, _1126);
    float _1130 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1120);
    float _1132 = _580 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1134 = _616 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1136 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _866);
    float _1138 = _908 * _1106;
    float _1140 = _648 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1142 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _768);
    float _1144 = -_1122;
    float _1146 = fma(_1136, _1110, _1144);
    float _1148 = _1132 * _1138;
    float _1150 = _1134 * _1138;
    float _1152 = _1100 * _1138;
    float _1154 = -_132;
    float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1128);
    float _1158 = _1148 * _650;
    float _1160 = _1150 * _610;
    float _1162 = _1152 * _620;
    float _1164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1166 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1168 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1170 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1130);
    float _1172 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1166);
    float _1174 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1168);
    float _1176 = -_1090;
    float _1178 = _1176 + 1.0;
    float _1180 = -_924;
    float _1182 = _1180 + 1.0;
    float _1184 = fma(_1162, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1172);
    float _1186 = fma(_1162, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1174);
    float _1188 = _870 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1190 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[131].x, _974);
    float _1192 = _770 + _1184;
    float _1194 = _814 + _1186;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1198 = _648 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1202 = _1192 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1206 = _1194 + _1204;
    float _1208 = fma(_1188, -2.0, _1196);
    float _1210 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1212 = _1202 * _1202;
    float _1214 = _1206 * _1206;
    float _1216 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1112);
    float _1218 = _648 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[82].x);
    float _1222 = _1124;
    float _1224 = _1212;
    float _1226 = _1214;
    float _1228 = _1192;
    float _1230 = _1194;
    float _1232 = _906;
    if (_520)
    {
        float _1234 = -_1124;
        float _1236 = _1234 + 1.0;
        _1220 = as_type<int>(_1236);
    }
    int _1238 = _1220;
    float _1240 = _1212 + _1214;
    float _1242 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1198);
    if (!_520)
    {
        _790 = _1124;
    }
    float _1244 = _790;
    float _1246 = fma(_892, _926, _1190);
    float _1248 = sqrt(_1240);
    float _1250 = _1244;
    if (_520)
    {
        float _1252 = _794 ? as_type<float>(_1238) : _1124;
        _1250 = _1252;
    }
    float _1254 = _1250;
    int _1256 = 0;
    if (_530)
    {
        float _1258 = -_1124;
        float _1260 = _1258 + 1.0;
        _1256 = as_type<int>(_1260);
    }
    int _1262 = _1256;
    float _1264 = -_132;
    float _1266 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[76].x, _688);
    float _1268 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1208);
    float _1270 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1272 = fma(_1210, _1254, -0.5);
    float _1274 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1114);
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1278 = in.m_63.w;
    if (_530)
    {
        float _1280 = _812 ? as_type<float>(_1262) : _1124;
        _1222 = _1280;
    }
    float _1282 = _1222;
    float _1284 = fma(_832, _1092, _1216);
    float _1286 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1270);
    float _1288 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1218);
    float _1290 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1140);
    float _1292 = fma(_808, _1072, _1284);
    bool _1294 = _1248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1296 = fma(_1162, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1286);
    float _1298 = fma(_948, _1042, _1292);
    float _1300 = -_1268;
    float _1302 = fma(_1170, _872, _1300);
    float _1304 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1246);
    float _1306 = _712 + _1296;
    float _1308 = fma(_644, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1288);
    float _1310 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1312 = fma(_644, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1242);
    float _1314 = fma(_1142, _1272, _1266);
    float _1316 = fma(_1002, _1000, _1298);
    float _1318 = fma(_1310, _1282, -0.5);
    float _1320 = fma(_644, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1290);
    float _1322 = _1298;
    float _1324 = _1306;
    if (!_1294)
    {
        _1322 = _1306;
    }
    float _1326 = _1322;
    float _1328 = fma(_1274, _1318, _1156);
    bool _1330 = !_1294;
    float _1332 = _1326;
    if (!_1330)
    {
        float _1334 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1338 = _1248 + _1336;
        float _1340 = _1306 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1342 = rsqrt(_1240);
        float _1344 = _1338 * _1334;
        float _1346 = _1344 * 0.15915493667125701904296875;
        float _1348 = _1346 * 6.283185482025146484375;
        float _1350 = sin(_1348);
        float _1352 = _1346 * 6.283185482025146484375;
        float _1354 = cos(_1352);
        float _1356 = fma(_1350, _1340, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1358 = _1342 * _1356;
        float _1360 = _1354 + (-1.0);
        float _1362 = fma(_1202, _1358, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1364 = fma(_1206, _1358, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1366 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1370 = _1362 + _1368;
        float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1374 = _1364 + _1372;
        float _1376 = fma(_1306, _1354, _1366);
        float _1378 = _1370 * _1370;
        float _1380 = _1374 * _1374;
        _1332 = _1376;
        _1224 = _1378;
        _1226 = _1380;
        _1228 = _1362;
        _1230 = _1364;
    }
    float _1382 = _1332;
    float _1384 = _1224;
    float _1386 = _1226;
    float _1388 = _1228;
    float _1390 = _1230;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1394 = _1382 + _1392;
    float _1396 = fma(_906, _998, _1316);
    float _1398 = _1146 + 0.5;
    float _1400 = fma(_1394, _1394, _1384);
    float _1402 = fma(_996, _964, _1396);
    float _1404 = _1400 + _1386;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1410 = _1304 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1414 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1416 = sqrt(_1404);
    float _1418 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1420 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1314 + 0.5;
    float _1424 = _1328 + 0.5;
    float _1426 = _1302 + 0.5;
    float _1428 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1402);
    out.m_65.w = _1278;
    out.m_67.x = _1308;
    out.m_67.y = _1312;
    out.m_67.z = _1320;
    out.m_69.x = _1414;
    out.m_69.y = _1418;
    out.m_69.z = _1420;
    out.m_69.w = _1410;
    bool _1430 = _1416 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1432 = isnan(_1416);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1438 = _1434 || _1436;
    out.m_71.x = _1422;
    out.m_71.y = _1398;
    out.m_71.z = _1424;
    out.m_71.w = _1426;
    out.m_73.x = _1428;
    float _1440 = _1414;
    float _1442 = _1410;
    if (!_1438)
    {
        _1232 = 1.0;
    }
    float _1444 = _1232;
    bool _1446 = !_1438;
    float _1448 = _1444;
    if (!_1446)
    {
        bool _1450 = _1416 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1452 = isnan(_1416);
        bool _1454 = _1450 || _1452;
        bool _1456 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1458 = _1454 || _1456;
        if (!_1458)
        {
            float _1460 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1462 = _1416 + _1460;
            float _1464 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1466 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1464;
            float _1468 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1470 = _1468 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1472 = 1.0 / _1466;
            float _1474 = _1462 * _1472;
            float _1476 = fma(_1474, _1470, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1448 = _1476;
            _1478 = true;
        }
        else
        {
            bool _1480 = _1416 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1482 = isnan(_1416);
            bool _1484 = _1480 || _1482;
            bool _1486 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1488 = _1484 || _1486;
            if (!_1488)
            {
                float _1490 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1492 = _1416 + _1490;
                float _1494 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1496 = _1494 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1498 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1500 = _1498 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1502 = 1.0 / _1496;
                float _1504 = _1492 * _1502;
                float _1506 = fma(_1504, _1500, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1448 = _1506;
                _1478 = true;
            }
            else
            {
                _1448 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1478 = false;
    float _1508 = _1448;
    float _1510 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1512 = _1382 + _1510;
    float _1514 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1516 = _1388 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1520 = _1390 + _1518;
    float _1522 = fma(_1512, _1508, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1524 = fma(_1516, _1508, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1526 = fma(_1520, _1508, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1528 = -_1004;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1522);
    float _1532 = -_1024;
    float _1534 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1524);
    float _1536 = -_1066;
    float _1538 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1526);
    float _1540 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1544 = _1530 + _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1548 = _1534 + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1552 = _1538 + _1550;
    float _1554 = _1544 * _1544;
    float _1556 = fma(_1548, _1548, _1554);
    float _1558 = fma(_1552, _1552, _1556);
    float _1560 = rsqrt(_1558);
    float _1562 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1564 = _1548 * _1562;
    float _1566 = _1552 * _1562;
    float _1568 = _1564 * _1564;
    float _1570 = _1566 * _1566;
    float _1572 = _1568 + _1570;
    float _1574 = sqrt(_1572);
    bool _1576 = _1574 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = _1574 + _1578;
    float _1582 = _1556;
    float _1584 = _1580;
    float _1586 = _1564;
    if (_1576)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1582 = _1588;
    }
    float _1590 = _1582;
    if (_1576)
    {
        float _1592 = rsqrt(_1572);
        _1440 = _1592;
    }
    float _1594 = _1440;
    float _1596 = _1594;
    if (_1576)
    {
        float _1598 = _1580 * _1590;
        _1584 = _1598;
    }
    float _1600 = _1584;
    if (_1576)
    {
        float _1602 = _1600 * 0.15915493667125701904296875;
        _1442 = _1602;
    }
    float _1604 = _1442;
    float _1606 = _1590;
    if (_1576)
    {
        float _1608 = _1604 * 6.283185482025146484375;
        float _1610 = sin(_1608);
        _1606 = _1610;
    }
    float _1612 = _1606;
    float _1614 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1616 = precise::max(0.0, _1614);
    float _1618 = _904;
    float _1620 = _1616;
    if (_1576)
    {
        float _1622 = _1604 * 6.283185482025146484375;
        float _1624 = cos(_1622);
        _1618 = _1624;
    }
    float _1626 = _1618;
    float _1628 = -_1562;
    float _1630 = -_1616;
    float _1632 = fma(_1544, _1628, _1630);
    float _1634 = _1632;
    if (_1576)
    {
        float _1636 = _1632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1636;
    }
    float _1638 = _1620;
    float _1640 = sqrt(_1558);
    float _1642 = _1612;
    float _1644 = _1638;
    if (_1576)
    {
        float _1646 = fma(_1612, _1638, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1642 = _1646;
    }
    float _1648 = _1642;
    float _1650 = _1648;
    float _1652 = _1626;
    if (_1576)
    {
        float _1654 = _1626 + (-1.0);
        _1644 = _1654;
    }
    float _1656 = _1644;
    float _1658 = _1656;
    if (_1576)
    {
        float _1660 = _1594 * _1648;
        _1324 = _1660;
    }
    float _1662 = _1324;
    if (!_1576)
    {
        _1596 = _1566;
    }
    float _1664 = _1596;
    float _1666 = _1664;
    if (_1576)
    {
        float _1668 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1650 = _1668;
    }
    float _1670 = _1650;
    if (_1576)
    {
        float _1672 = _1564 * _1662;
        _1586 = _1672;
    }
    float _1674 = _1586;
    if (!_1576)
    {
        _1658 = _1568;
    }
    float _1676 = _1658;
    float _1678 = _1676;
    if (_1576)
    {
        float _1680 = _1566 * _1662;
        _1666 = _1680;
    }
    float _1682 = _1666;
    if (_1576)
    {
        float _1684 = fma(_1632, _1626, _1670);
        _1634 = _1684;
    }
    float _1686 = _1634;
    if (_1576)
    {
        float _1688 = _1674 * _1674;
        _1678 = _1688;
    }
    float _1690 = _1678;
    if (!_1576)
    {
        _1652 = _1570;
    }
    float _1692 = _1652;
    float _1694 = _1692;
    if (_1576)
    {
        float _1696 = _1682 * _1682;
        _1694 = _1696;
    }
    float _1698 = _1694;
    float _1700 = fma(_1686, _1686, _1690);
    float _1702 = _1700 + _1698;
    float _1704 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1708 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1706);
    float _1710 = precise::clamp(_1708, 0.0, 1.0);
    float _1712 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1714 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1704);
    float _1716 = rsqrt(_1702);
    float _1718 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1720 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1712);
    float _1722 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1714);
    float _1724 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1726 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1718);
    float _1728 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1720);
    float _1730 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1732 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1724);
    float _1734 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1726);
    float _1736 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1738 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1740 = -_1710;
    float _1742 = _1740 + 1.0;
    float _1744 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1746 = -_1738;
    float _1748 = fma(_1746, _1540, 1.0);
    float _1750 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1732);
    float _1752 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1754 = _1716 * _1674;
    float _1756 = abs(_1742);
    float _1758 = log2(_1756);
    float _1760 = _1716 * _1686;
    float _1762 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1752);
    float _1764 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1766 = _1716 * _1682;
    float _1768 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1770 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1762);
    float _1772 = -_1764;
    float _1774 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1772);
    float _1776 = log2(_1748);
    float _1778 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1780 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1770);
    float _1782 = -_1766;
    float _1784 = fma(_1782, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1774);
    float _1786 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1788 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1778);
    float _1790 = _1760 + 1.0;
    float _1792 = fma(_1784, -0.5, 0.5);
    float _1794 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1796 = 1.0 / _1780;
    float _1798 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1786);
    float _1800 = fma(_1784, 0.5, 0.5);
    float _1802 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1788);
    float _1804 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1798);
    float _1806 = fma(_1800, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1808 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1802);
    float _1810 = exp2(_1794);
    float _1812 = _1776 * 0.693147182464599609375;
    float _1814 = fma(_1800, _1806, -0.212114393711090087890625);
    float _1816 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1818 = fma(_1800, _1814, 1.570728778839111328125);
    float _1820 = sqrt(_1792);
    float _1822 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1804);
    float _1824 = _1808 * _1796;
    float _1826 = _1822 * _1796;
    float _1828 = fma(_1824, -0.5, 0.5);
    float _1830 = -_1760;
    float _1832 = fma(_1810, _1790, _1830);
    float _1834 = fma(_1826, 0.5, 0.5);
    float _1836 = fma(_1832, 0.5, 0.5);
    float _1838 = _1820 * 0.636619746685028076171875;
    float3 _4946 = float3(_1834, _1828, _1816);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4946, float3(0.0), isnan(_4946)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4946, float3(0.0), isnan(_4946)), level(0.0)).x;
    float3 _4957 = float3(_1834, _1828, _1816);
    float4 _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4957, float3(0.0), isnan(_4957)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4957, float3(0.0), isnan(_4957)), level(0.0)).xyzw;
    float _1845 = _1843.x;
    float _1847 = _1843.y;
    float _1849 = _1843.z;
    float _1851 = _1843.w;
    float _1853 = -_1818;
    float _1855 = fma(_1838, _1853, 1.0);
    float2 _4979 = float2(_1855, _1836);
    float3 _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4979, float2(0.0), isnan(_4979)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4979, float2(0.0), isnan(_4979)), level(0.0)).xyz;
    float _1861 = _1859.x;
    float _1863 = _1859.y;
    float _1865 = _1859.z;
    float _1867 = -_1004;
    float _1869 = fma(_1867, (*spvDescriptorSet0.vp_c9)._m0[18].w, _712);
    float _1871 = -_1024;
    float _1873 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[18].w, _770);
    float _1875 = -_1066;
    float _1877 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[18].w, _814);
    out.m_75.x = _1548;
    out.m_75.y = _1544;
    out.m_75.z = _1552;
    float _1879 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1881 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1883 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1879);
    float _1885 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1881);
    float _1887 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1883);
    float _1889 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1885);
    float _1891 = _1887 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1893 = _1889 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1895 = 1.0 / _1891;
    bool _1897 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1899 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1901 = _1897 || _1899;
    bool _1903 = isnan(0.5);
    bool _1905 = _1901 || _1903;
    float _1907 = _1893 + _1891;
    float _1909 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1911 = _1877;
    float _1913 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1915 = _1730;
    if (!_1905)
    {
        _1911 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1917 = _1911;
    float _1919 = exp2(_1909);
    float _1921 = _1907 * _1895;
    float _1923 = _1921 * 0.5;
    float _1925 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1927 = _1923;
    float _1929 = _1917;
    if (!_1905)
    {
        float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1933 = fma(_1923, _1917, _1931);
        _1927 = _1933;
    }
    float _1935 = _1927;
    if (!_1905)
    {
        _1929 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1937 = _1929;
    float _1939 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1925);
    float _1941 = _1937;
    if (!_1905)
    {
        float _1943 = -_1937;
        float _1945 = _1943 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1913 = _1945;
    }
    float _1947 = _1913;
    float _1949 = _1935;
    if (!_1905)
    {
        float _1951 = 1.0 / _1935;
        _1949 = _1951;
    }
    float _1953 = _1949;
    float _1955 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1939);
    if (_1905)
    {
        _1915 = 1.0;
    }
    float _1957 = _1915;
    float _1959 = -_1919;
    float _1961 = _1959 + 1.0;
    float _1963 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1955);
    float _1965 = _1947;
    float _1967 = _1957;
    if (!_1905)
    {
        float _1969 = 1.0 / _1947;
        _1965 = _1969;
    }
    float _1971 = _1965;
    float _1973 = _1963 + _1780;
    out.gl_Position.x = _1822;
    out.gl_Position.y = _1808;
    out.gl_Position.z = _1963;
    out.gl_Position.w = _1780;
    if (!_1905)
    {
        float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1977 = -_1937;
        float _1979 = fma(_1953, _1975, _1977);
        _1941 = _1979;
    }
    float _1981 = _1941;
    float _1983 = _1973 * 0.5;
    float _1985 = _1981;
    if (!_1905)
    {
        float _1987 = _1981 * _1971;
        float _1989 = precise::clamp(_1987, 0.0, 1.0);
        _1985 = _1989;
    }
    float _1991 = _1985;
    float _1993 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1905)
    {
        float _1995 = -_1991;
        float _1997 = _1995 + 1.0;
        _1967 = _1997;
    }
    float _1999 = _1967;
    float _2001 = _1999 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2003 = _1999 > 0.0;
    bool _2005 = isnan(_1999);
    bool _2007 = _2003 || _2005;
    bool _2009 = isnan(0.0);
    bool _2011 = _2007 || _2009;
    out.m_77.z = _1983;
    out.m_77.w = _1780;
    float _2013 = _2001 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _2013;
    float _2015 = _1993 * _1840;
    float _2017 = -_1993;
    float _2019 = _2017 + 1.0;
    float _2021 = _1851 * _2015;
    float _2023 = _1851 * _2019;
    float _2025 = _1865 * _2015;
    float _2027 = fma(_1861, _2021, _1845);
    float _2029 = fma(_1863, _2021, _1847);
    float _2031 = fma(_1851, _2025, _1849);
    out.m_79.x = _2027;
    out.m_79.y = _2029;
    out.m_79.z = _2031;
    out.m_79.w = _2023;
    if (_2011)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2033 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2033;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1478 = false;
    bool _482 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2090 = as_type<float>(_114);
        out.gl_Position.z = _2090;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_128)
    {
        float _134 = float(_98);
        _108 = _134;
    }
    float _136 = _108;
    bool _138 = _132 >= _136;
    bool _140 = !_128;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _116 = as_type<int>(_148);
    }
    int _150 = _116;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2159 = as_type<float>(_150);
        out.gl_Position.z = _2159;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_51.w;
    float _154 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_49.x;
    float _168 = in.m_49.y;
    float _170 = in.m_49.z;
    float _172 = in.m_44.x;
    float _174 = in.m_44.y;
    float _176 = in.m_44.z;
    float _178 = 0.0;
    float _180 = _154;
    if (!_164)
    {
        float _182 = _154 * _154;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_164)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_164;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _154 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _154);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_164;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _154 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _180 = _250;
    }
    float _252 = _180;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _166, _256);
    float _264 = fma(_252, _168, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _152, _172);
    float _270 = fma(_264, _152, _174);
    float _272 = fma(_266, _152, _176);
    bool _274 = !_254;
    float _292;
    if (!_274)
    {
        float _276 = in.m_53.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_98);
        float _298 = 1.0 / _296;
        float _300 = _132 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _312 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _314 = isnan(_302);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = 1.0 / _306;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _330 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _332 = isnan(_302);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _342;
    float _346 = -_322;
    float _348 = _346 + 1.0;
    bool _350 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _352 = isnan(_302);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _364 = 1.0 / _310;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _370 = _340 * _348;
    float _372 = -_340;
    float _374 = _372 + 1.0;
    float _376 = _360 * _374;
    float _378 = 1.0 / _328;
    float _380 = _344 * _324;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _384 = _302 + _382;
    float _386 = -_360;
    float _388 = _386 + 1.0;
    float _390 = fma(_380, _384, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _394 = _302 + _392;
    float _396 = _368 * _364;
    bool _398 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _400 = isnan(_302);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _410;
    float _414 = _390 * _376;
    float _416 = fma(_396, _394, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _420 = _302 + _418;
    float _422 = -_408;
    float _424 = _422 + 1.0;
    float _426 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[115].x, _414);
    float _428 = _412 * _378;
    float _430 = _322 * _424;
    float _432 = fma(_416, _370, _426);
    float _434 = fma(_428, _420, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _438 = fma(_434, _430, _432);
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _444 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[118].x, _438);
    float _446 = _436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _448 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _452 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _446;
    out.m_55.y = _448;
    out.m_55.z = _450;
    out.m_55.w = _452;
    bool _454 = !_362;
    float _478;
    float _480;
    if (!_454)
    {
        float _456 = in.m_53.x;
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _460 = float(_98);
        float _462 = 1.0 / _460;
        float _464 = _456 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _466 = _132 * _462;
        float _468 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _470 = _468 * _458;
        float _472 = floor(_470);
        float _474 = -_472;
        float _476 = _470 + _474;
        _478 = _476;
        _480 = _466;
        _482 = true;
    }
    else
    {
        float _484 = float(_98);
        float _486 = 1.0 / _484;
        float _488 = _132 * _486;
        _478 = _488;
        _480 = _488;
    }
    _482 = false;
    float _490 = _478;
    float _492 = _480;
    float _494 = in.m_53.w;
    float _496 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _498 = in.m_57.x;
    float _500 = in.m_57.y;
    float _502 = in.m_57.z;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _506 = _504 != 0;
    float _508 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _510 = in.m_51.x;
    float _512 = in.m_51.y;
    float _514 = in.m_51.z;
    float _516 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _520 = _518 != 0;
    float _522 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _496);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _530 = _528 != 0;
    float _532 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _508);
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _536 = _534 != 0;
    float _538 = 1.0 / _526;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _542 = _540 != 0;
    float _544 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _516);
    float _546 = in.m_53.y;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _550 = _490 + _548;
    float _552 = in.m_53.x;
    bool _554 = _494 > 0.5;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _560 = in.m_59.x;
    float _562 = in.m_59.y;
    float _564 = in.m_59.z;
    bool _566 = _500 != 0.0;
    bool _568 = isnan(_500);
    bool _570 = _566 || _568;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _580 = _512 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _582 = _498 == 0.0;
    bool _584 = !_574;
    bool _586 = _582 && _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _588;
    float _592 = _514 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _594 = 1.0 / _558;
    bool _596 = _502 == 0.0;
    bool _598 = _596 && _586;
    float _600 = _590 * _538;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _498);
    float _612 = 1.0 / _578;
    float _614 = in.m_61.y;
    float _616 = _510 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _502);
    float _622 = _560;
    float _624 = _564;
    float _626 = _562;
    bool _628 = _536;
    bool _630 = _598;
    if (!_598)
    {
        float _632 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[17].y, _560);
        _622 = _632;
    }
    float _634 = _622;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _640 = 1.0 / _604;
    if (!_598)
    {
        float _642 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[17].y, _564);
        _624 = _642;
    }
    float _644 = _624;
    if (!_598)
    {
        float _646 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[17].y, _562);
        _626 = _646;
    }
    float _648 = _626;
    float _650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _500);
    float _652 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _522);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _660 = 1.0 / _608;
    float _662 = _546 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _664 = _552 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _666 = 0.0;
    if (_530)
    {
        float _668 = in.m_53.z;
        _666 = _668;
    }
    float _670 = _666;
    float _672 = fma(_662, -2.0, _618);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _674;
    float _678 = 1.0 / _656;
    float _680 = _676 * _594;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _684 = _682 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _686 = -_658;
    float _688 = fma(_664, 2.0, _686);
    float _690 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _532);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _696 = _684 * _612;
    float _698 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _544);
    float _700 = 1.0 / _694;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _706 = 0.0;
    if (!_506)
    {
        float _708 = in.m_53.z;
        _706 = _708;
    }
    float _710 = _706;
    float _712 = _690 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _718 = 0.0;
    float _720 = _614;
    if (!_506)
    {
        _718 = _546;
    }
    float _722 = _718;
    float _724 = 1.0 / _638;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _736 = _722;
    if (_506)
    {
        _736 = _552;
    }
    float _738 = _736;
    float _740 = _728 * _660;
    float _742 = _732 * _640;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _744;
    float _748 = 1.0 / _704;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _758 = -_614;
    float _760 = _758 + 1.0;
    float _762 = _746 * _678;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _766 = _492 + _764;
    float _768 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[78].z, _734);
    float _770 = _652 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _772 = _752 * _724;
    float _774 = _716 * _700;
    int _776 = _554 ? as_type<int>(_760) : as_type<int>(_614);
    float _778 = fma(_740, _766, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _780 = _546 > 0.5;
    float _782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _784 = _536 ? as_type<float>(_776) : _614;
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _788 = _712 + _786;
    float _790 = _678;
    if (_520)
    {
        bool _792 = _552 > 0.5;
        _628 = _792;
    }
    bool _794 = _628;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _798 = _492 + _796;
    float _800 = _756 * _748;
    float _802 = fma(_680, _550, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_542)
    {
        float _804 = _780 ? _760 : _614;
        _720 = _804;
    }
    float _806 = _720;
    float _808 = fma(_772, _798, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    if (_530)
    {
        bool _810 = _670 > 0.5;
        _630 = _810;
    }
    bool _812 = _630;
    float _814 = _698 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _818 = _770 + _816;
    float _820 = _788 * _788;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _824 = _492 + _822;
    float _826 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _828 = _814 + _826;
    float _830 = fma(_818, _818, _820);
    float _832 = fma(_742, _824, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _834 = _490 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _836 = isnan(_490);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _848 = _782 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _850 = fma(_828, _828, _830);
    float _852 = 0.0;
    float _854 = _710;
    if (!_506)
    {
        _852 = _710;
    }
    float _856 = _852;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _860 = _490 + _858;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _864 = _492 + _862;
    float _866 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[78].w, _846);
    float _868 = _856;
    if (_506)
    {
        _868 = _546;
    }
    float _870 = _868;
    float _872 = fma(_784, _848, -0.5);
    if (_506)
    {
        _854 = _546;
    }
    float _874 = _854;
    float _876 = -_844;
    float _878 = _876 + 1.0;
    bool _880 = _490 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _882 = isnan(_490);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = fma(_696, _860, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _894 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _896 = isnan(_492);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = fma(_800, _864, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _908 = rsqrt(_850);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _912 = _492 + _910;
    bool _914 = _490 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _916 = isnan(_490);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = _890 * _878;
    float _928 = -_890;
    float _930 = _928 + 1.0;
    bool _932 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _934 = isnan(_492);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = -_904;
    float _946 = _944 + 1.0;
    float _948 = fma(_774, _912, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _950 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _952 = isnan(_492);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = _924 * _930;
    float _964 = _942 * _946;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _968 = _492 + _966;
    float _970 = -_942;
    float _972 = _970 + 1.0;
    float _974 = _802 * _962;
    bool _976 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _978 = isnan(_492);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = -_960;
    float _990 = _988 + 1.0;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _994 = _492 + _992;
    float _996 = fma(_600, _968, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _998 = _960 * _972;
    float _1000 = _986 * _990;
    float _1002 = fma(_762, _994, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1004 = _788 * _908;
    bool _1006 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1008 = isnan(_492);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1014 = _1010 || _1012;
    float _1016 = float(_1014);
    float _1018 = -_986;
    float _1020 = _1018 + 1.0;
    float _1022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1024 = _818 * _908;
    bool _1026 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1028 = isnan(_492);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1034 = _1030 || _1032;
    float _1036 = float(_1034);
    float _1038 = -_1004;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _788);
    float _1042 = _1016 * _1020;
    float _1044 = -_1016;
    float _1046 = _1044 + 1.0;
    float _1048 = -_1024;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    bool _1052 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1054 = isnan(_492);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = _1040 * _1040;
    float _1066 = _828 * _908;
    float _1068 = -_1036;
    float _1070 = _1068 + 1.0;
    float _1072 = _1036 * _1046;
    float _1074 = fma(_1050, _1050, _1064);
    float _1076 = -_1066;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _828);
    bool _1080 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1082 = isnan(_492);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    float _1092 = _1062 * _1070;
    float _1094 = -_1062;
    float _1096 = _1094 + 1.0;
    float _1098 = fma(_1078, _1078, _1074);
    float _1100 = _592 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1102 = _1090 * _1096;
    float _1104 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1106 = sqrt(_1098);
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1110 = fma(_1104, _806, -0.5);
    float _1112 = _778 * _1102;
    float _1114 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1108);
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1118 = _738 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1122 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _672);
    float _1124 = in.m_61.x;
    float _1126 = -_1116;
    float _1128 = fma(_1118, 2.0, _1126);
    float _1130 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1120);
    float _1132 = _580 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1134 = _616 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1136 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _866);
    float _1138 = _908 * _1106;
    float _1140 = _648 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1142 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _768);
    float _1144 = -_1122;
    float _1146 = fma(_1136, _1110, _1144);
    float _1148 = _1132 * _1138;
    float _1150 = _1134 * _1138;
    float _1152 = _1100 * _1138;
    float _1154 = -_132;
    float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1128);
    float _1158 = _1148 * _650;
    float _1160 = _1150 * _610;
    float _1162 = _1152 * _620;
    float _1164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1166 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1168 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1170 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1130);
    float _1172 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1166);
    float _1174 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1168);
    float _1176 = -_1090;
    float _1178 = _1176 + 1.0;
    float _1180 = -_924;
    float _1182 = _1180 + 1.0;
    float _1184 = fma(_1162, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1172);
    float _1186 = fma(_1162, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1174);
    float _1188 = _870 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1190 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[131].x, _974);
    float _1192 = _770 + _1184;
    float _1194 = _814 + _1186;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1198 = _648 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1202 = _1192 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1206 = _1194 + _1204;
    float _1208 = fma(_1188, -2.0, _1196);
    float _1210 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1212 = _1202 * _1202;
    float _1214 = _1206 * _1206;
    float _1216 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1112);
    float _1218 = _648 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[82].x);
    float _1222 = _1124;
    float _1224 = _1212;
    float _1226 = _1214;
    float _1228 = _1192;
    float _1230 = _1194;
    float _1232 = _906;
    if (_520)
    {
        float _1234 = -_1124;
        float _1236 = _1234 + 1.0;
        _1220 = as_type<int>(_1236);
    }
    int _1238 = _1220;
    float _1240 = _1212 + _1214;
    float _1242 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1198);
    if (!_520)
    {
        _790 = _1124;
    }
    float _1244 = _790;
    float _1246 = fma(_892, _926, _1190);
    float _1248 = sqrt(_1240);
    float _1250 = _1244;
    if (_520)
    {
        float _1252 = _794 ? as_type<float>(_1238) : _1124;
        _1250 = _1252;
    }
    float _1254 = _1250;
    int _1256 = 0;
    if (_530)
    {
        float _1258 = -_1124;
        float _1260 = _1258 + 1.0;
        _1256 = as_type<int>(_1260);
    }
    int _1262 = _1256;
    float _1264 = -_132;
    float _1266 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[76].x, _688);
    float _1268 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1208);
    float _1270 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1272 = fma(_1210, _1254, -0.5);
    float _1274 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1114);
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1278 = in.m_63.w;
    if (_530)
    {
        float _1280 = _812 ? as_type<float>(_1262) : _1124;
        _1222 = _1280;
    }
    float _1282 = _1222;
    float _1284 = fma(_832, _1092, _1216);
    float _1286 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1270);
    float _1288 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1218);
    float _1290 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1140);
    float _1292 = fma(_808, _1072, _1284);
    bool _1294 = _1248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1296 = fma(_1162, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1286);
    float _1298 = fma(_948, _1042, _1292);
    float _1300 = -_1268;
    float _1302 = fma(_1170, _872, _1300);
    float _1304 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1246);
    float _1306 = _712 + _1296;
    float _1308 = fma(_644, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1288);
    float _1310 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1312 = fma(_644, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1242);
    float _1314 = fma(_1142, _1272, _1266);
    float _1316 = fma(_1002, _1000, _1298);
    float _1318 = fma(_1310, _1282, -0.5);
    float _1320 = fma(_644, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1290);
    float _1322 = _1298;
    float _1324 = _1306;
    if (!_1294)
    {
        _1322 = _1306;
    }
    float _1326 = _1322;
    float _1328 = fma(_1274, _1318, _1156);
    bool _1330 = !_1294;
    float _1332 = _1326;
    if (!_1330)
    {
        float _1334 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1338 = _1248 + _1336;
        float _1340 = _1306 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1342 = rsqrt(_1240);
        float _1344 = _1338 * _1334;
        float _1346 = _1344 * 0.15915493667125701904296875;
        float _1348 = _1346 * 6.283185482025146484375;
        float _1350 = sin(_1348);
        float _1352 = _1346 * 6.283185482025146484375;
        float _1354 = cos(_1352);
        float _1356 = fma(_1350, _1340, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1358 = _1342 * _1356;
        float _1360 = _1354 + (-1.0);
        float _1362 = fma(_1202, _1358, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1364 = fma(_1206, _1358, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1366 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1370 = _1362 + _1368;
        float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1374 = _1364 + _1372;
        float _1376 = fma(_1306, _1354, _1366);
        float _1378 = _1370 * _1370;
        float _1380 = _1374 * _1374;
        _1332 = _1376;
        _1224 = _1378;
        _1226 = _1380;
        _1228 = _1362;
        _1230 = _1364;
    }
    float _1382 = _1332;
    float _1384 = _1224;
    float _1386 = _1226;
    float _1388 = _1228;
    float _1390 = _1230;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1394 = _1382 + _1392;
    float _1396 = fma(_906, _998, _1316);
    float _1398 = _1146 + 0.5;
    float _1400 = fma(_1394, _1394, _1384);
    float _1402 = fma(_996, _964, _1396);
    float _1404 = _1400 + _1386;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1410 = _1304 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1414 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1416 = sqrt(_1404);
    float _1418 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1420 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1314 + 0.5;
    float _1424 = _1328 + 0.5;
    float _1426 = _1302 + 0.5;
    float _1428 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1402);
    out.m_65.w = _1278;
    out.m_67.x = _1308;
    out.m_67.y = _1312;
    out.m_67.z = _1320;
    out.m_69.x = _1414;
    out.m_69.y = _1418;
    out.m_69.z = _1420;
    out.m_69.w = _1410;
    bool _1430 = _1416 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1432 = isnan(_1416);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1438 = _1434 || _1436;
    out.m_71.x = _1422;
    out.m_71.y = _1398;
    out.m_71.z = _1424;
    out.m_71.w = _1426;
    out.m_73.x = _1428;
    float _1440 = _1414;
    float _1442 = _1410;
    if (!_1438)
    {
        _1232 = 1.0;
    }
    float _1444 = _1232;
    bool _1446 = !_1438;
    float _1448 = _1444;
    if (!_1446)
    {
        bool _1450 = _1416 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1452 = isnan(_1416);
        bool _1454 = _1450 || _1452;
        bool _1456 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1458 = _1454 || _1456;
        if (!_1458)
        {
            float _1460 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1462 = _1416 + _1460;
            float _1464 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1466 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1464;
            float _1468 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1470 = _1468 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1472 = 1.0 / _1466;
            float _1474 = _1462 * _1472;
            float _1476 = fma(_1474, _1470, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1448 = _1476;
            _1478 = true;
        }
        else
        {
            bool _1480 = _1416 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1482 = isnan(_1416);
            bool _1484 = _1480 || _1482;
            bool _1486 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1488 = _1484 || _1486;
            if (!_1488)
            {
                float _1490 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1492 = _1416 + _1490;
                float _1494 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1496 = _1494 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1498 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1500 = _1498 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1502 = 1.0 / _1496;
                float _1504 = _1492 * _1502;
                float _1506 = fma(_1504, _1500, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1448 = _1506;
                _1478 = true;
            }
            else
            {
                _1448 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1478 = false;
    float _1508 = _1448;
    float _1510 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1512 = _1382 + _1510;
    float _1514 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1516 = _1388 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1520 = _1390 + _1518;
    float _1522 = fma(_1512, _1508, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1524 = fma(_1516, _1508, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1526 = fma(_1520, _1508, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1528 = -_1004;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1522);
    float _1532 = -_1024;
    float _1534 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1524);
    float _1536 = -_1066;
    float _1538 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1526);
    float _1540 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1544 = _1530 + _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1548 = _1534 + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1552 = _1538 + _1550;
    float _1554 = _1544 * _1544;
    float _1556 = fma(_1548, _1548, _1554);
    float _1558 = fma(_1552, _1552, _1556);
    float _1560 = rsqrt(_1558);
    float _1562 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1564 = _1548 * _1562;
    float _1566 = _1552 * _1562;
    float _1568 = _1564 * _1564;
    float _1570 = _1566 * _1566;
    float _1572 = _1568 + _1570;
    float _1574 = sqrt(_1572);
    bool _1576 = _1574 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = _1574 + _1578;
    float _1582 = _1556;
    float _1584 = _1580;
    float _1586 = _1564;
    if (_1576)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1582 = _1588;
    }
    float _1590 = _1582;
    if (_1576)
    {
        float _1592 = rsqrt(_1572);
        _1440 = _1592;
    }
    float _1594 = _1440;
    float _1596 = _1594;
    if (_1576)
    {
        float _1598 = _1580 * _1590;
        _1584 = _1598;
    }
    float _1600 = _1584;
    if (_1576)
    {
        float _1602 = _1600 * 0.15915493667125701904296875;
        _1442 = _1602;
    }
    float _1604 = _1442;
    float _1606 = _1590;
    if (_1576)
    {
        float _1608 = _1604 * 6.283185482025146484375;
        float _1610 = sin(_1608);
        _1606 = _1610;
    }
    float _1612 = _1606;
    float _1614 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1616 = precise::max(0.0, _1614);
    float _1618 = _904;
    float _1620 = _1616;
    if (_1576)
    {
        float _1622 = _1604 * 6.283185482025146484375;
        float _1624 = cos(_1622);
        _1618 = _1624;
    }
    float _1626 = _1618;
    float _1628 = -_1562;
    float _1630 = -_1616;
    float _1632 = fma(_1544, _1628, _1630);
    float _1634 = _1632;
    if (_1576)
    {
        float _1636 = _1632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1636;
    }
    float _1638 = _1620;
    float _1640 = sqrt(_1558);
    float _1642 = _1612;
    float _1644 = _1638;
    if (_1576)
    {
        float _1646 = fma(_1612, _1638, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1642 = _1646;
    }
    float _1648 = _1642;
    float _1650 = _1648;
    float _1652 = _1626;
    if (_1576)
    {
        float _1654 = _1626 + (-1.0);
        _1644 = _1654;
    }
    float _1656 = _1644;
    float _1658 = _1656;
    if (_1576)
    {
        float _1660 = _1594 * _1648;
        _1324 = _1660;
    }
    float _1662 = _1324;
    if (!_1576)
    {
        _1596 = _1566;
    }
    float _1664 = _1596;
    float _1666 = _1664;
    if (_1576)
    {
        float _1668 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1650 = _1668;
    }
    float _1670 = _1650;
    if (_1576)
    {
        float _1672 = _1564 * _1662;
        _1586 = _1672;
    }
    float _1674 = _1586;
    if (!_1576)
    {
        _1658 = _1568;
    }
    float _1676 = _1658;
    float _1678 = _1676;
    if (_1576)
    {
        float _1680 = _1566 * _1662;
        _1666 = _1680;
    }
    float _1682 = _1666;
    if (_1576)
    {
        float _1684 = fma(_1632, _1626, _1670);
        _1634 = _1684;
    }
    float _1686 = _1634;
    if (_1576)
    {
        float _1688 = _1674 * _1674;
        _1678 = _1688;
    }
    float _1690 = _1678;
    if (!_1576)
    {
        _1652 = _1570;
    }
    float _1692 = _1652;
    float _1694 = _1692;
    if (_1576)
    {
        float _1696 = _1682 * _1682;
        _1694 = _1696;
    }
    float _1698 = _1694;
    float _1700 = fma(_1686, _1686, _1690);
    float _1702 = _1700 + _1698;
    float _1704 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1708 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1706);
    float _1710 = precise::clamp(_1708, 0.0, 1.0);
    float _1712 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1714 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1704);
    float _1716 = rsqrt(_1702);
    float _1718 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1720 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1712);
    float _1722 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1714);
    float _1724 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1726 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1718);
    float _1728 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1720);
    float _1730 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1732 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1724);
    float _1734 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1726);
    float _1736 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1738 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1740 = -_1710;
    float _1742 = _1740 + 1.0;
    float _1744 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1746 = -_1738;
    float _1748 = fma(_1746, _1540, 1.0);
    float _1750 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1732);
    float _1752 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1754 = _1716 * _1674;
    float _1756 = abs(_1742);
    float _1758 = log2(_1756);
    float _1760 = _1716 * _1686;
    float _1762 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1752);
    float _1764 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1766 = _1716 * _1682;
    float _1768 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1770 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1762);
    float _1772 = -_1764;
    float _1774 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1772);
    float _1776 = log2(_1748);
    float _1778 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1780 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1770);
    float _1782 = -_1766;
    float _1784 = fma(_1782, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1774);
    float _1786 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1788 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1778);
    float _1790 = _1760 + 1.0;
    float _1792 = fma(_1784, -0.5, 0.5);
    float _1794 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1796 = 1.0 / _1780;
    float _1798 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1786);
    float _1800 = fma(_1784, 0.5, 0.5);
    float _1802 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1788);
    float _1804 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1798);
    float _1806 = fma(_1800, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1808 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1802);
    float _1810 = exp2(_1794);
    float _1812 = _1776 * 0.693147182464599609375;
    float _1814 = fma(_1800, _1806, -0.212114393711090087890625);
    float _1816 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1818 = fma(_1800, _1814, 1.570728778839111328125);
    float _1820 = sqrt(_1792);
    float _1822 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1804);
    float _1824 = _1808 * _1796;
    float _1826 = _1822 * _1796;
    float _1828 = fma(_1824, -0.5, 0.5);
    float _1830 = -_1760;
    float _1832 = fma(_1810, _1790, _1830);
    float _1834 = fma(_1826, 0.5, 0.5);
    float _1836 = fma(_1832, 0.5, 0.5);
    float _1838 = _1820 * 0.636619746685028076171875;
    float3 _4946 = float3(_1834, _1828, _1816);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4946, float3(0.0), isnan(_4946)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4946, float3(0.0), isnan(_4946)), level(0.0)).x;
    float3 _4957 = float3(_1834, _1828, _1816);
    float4 _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4957, float3(0.0), isnan(_4957)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4957, float3(0.0), isnan(_4957)), level(0.0)).xyzw;
    float _1845 = _1843.x;
    float _1847 = _1843.y;
    float _1849 = _1843.z;
    float _1851 = _1843.w;
    float _1853 = -_1818;
    float _1855 = fma(_1838, _1853, 1.0);
    float2 _4979 = float2(_1855, _1836);
    float3 _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4979, float2(0.0), isnan(_4979)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4979, float2(0.0), isnan(_4979)), level(0.0)).xyz;
    float _1861 = _1859.x;
    float _1863 = _1859.y;
    float _1865 = _1859.z;
    float _1867 = -_1004;
    float _1869 = fma(_1867, (*spvDescriptorSet0.vp_c9)._m0[18].w, _712);
    float _1871 = -_1024;
    float _1873 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[18].w, _770);
    float _1875 = -_1066;
    float _1877 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[18].w, _814);
    out.m_75.x = _1548;
    out.m_75.y = _1544;
    out.m_75.z = _1552;
    float _1879 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1881 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1883 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1879);
    float _1885 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1881);
    float _1887 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1883);
    float _1889 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1885);
    float _1891 = _1887 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1893 = _1889 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1895 = 1.0 / _1891;
    bool _1897 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1899 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1901 = _1897 || _1899;
    bool _1903 = isnan(0.5);
    bool _1905 = _1901 || _1903;
    float _1907 = _1893 + _1891;
    float _1909 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1911 = _1877;
    float _1913 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1915 = _1730;
    if (!_1905)
    {
        _1911 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1917 = _1911;
    float _1919 = exp2(_1909);
    float _1921 = _1907 * _1895;
    float _1923 = _1921 * 0.5;
    float _1925 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1927 = _1923;
    float _1929 = _1917;
    if (!_1905)
    {
        float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1933 = fma(_1923, _1917, _1931);
        _1927 = _1933;
    }
    float _1935 = _1927;
    if (!_1905)
    {
        _1929 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1937 = _1929;
    float _1939 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1925);
    float _1941 = _1937;
    if (!_1905)
    {
        float _1943 = -_1937;
        float _1945 = _1943 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1913 = _1945;
    }
    float _1947 = _1913;
    float _1949 = _1935;
    if (!_1905)
    {
        float _1951 = 1.0 / _1935;
        _1949 = _1951;
    }
    float _1953 = _1949;
    float _1955 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1939);
    if (_1905)
    {
        _1915 = 1.0;
    }
    float _1957 = _1915;
    float _1959 = -_1919;
    float _1961 = _1959 + 1.0;
    float _1963 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1955);
    float _1965 = _1947;
    float _1967 = _1957;
    if (!_1905)
    {
        float _1969 = 1.0 / _1947;
        _1965 = _1969;
    }
    float _1971 = _1965;
    float _1973 = _1963 + _1780;
    out.gl_Position.x = _1822;
    out.gl_Position.y = _1808;
    out.gl_Position.z = _1963;
    out.gl_Position.w = _1780;
    if (!_1905)
    {
        float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1977 = -_1937;
        float _1979 = fma(_1953, _1975, _1977);
        _1941 = _1979;
    }
    float _1981 = _1941;
    float _1983 = _1973 * 0.5;
    float _1985 = _1981;
    if (!_1905)
    {
        float _1987 = _1981 * _1971;
        float _1989 = precise::clamp(_1987, 0.0, 1.0);
        _1985 = _1989;
    }
    float _1991 = _1985;
    float _1993 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1905)
    {
        float _1995 = -_1991;
        float _1997 = _1995 + 1.0;
        _1967 = _1997;
    }
    float _1999 = _1967;
    float _2001 = _1999 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2003 = _1999 > 0.0;
    bool _2005 = isnan(_1999);
    bool _2007 = _2003 || _2005;
    bool _2009 = isnan(0.0);
    bool _2011 = _2007 || _2009;
    out.m_77.z = _1983;
    out.m_77.w = _1780;
    float _2013 = _2001 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _2013;
    float _2015 = _1993 * _1840;
    float _2017 = -_1993;
    float _2019 = _2017 + 1.0;
    float _2021 = _1851 * _2015;
    float _2023 = _1851 * _2019;
    float _2025 = _1865 * _2015;
    float _2027 = fma(_1861, _2021, _1845);
    float _2029 = fma(_1863, _2021, _1847);
    float _2031 = fma(_1851, _2025, _1849);
    out.m_79.x = _2027;
    out.m_79.y = _2029;
    out.m_79.z = _2031;
    out.m_79.w = _2023;
    if (_2011)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2033 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2033;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

