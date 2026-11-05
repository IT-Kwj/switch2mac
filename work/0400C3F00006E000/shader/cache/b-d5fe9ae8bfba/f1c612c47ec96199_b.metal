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
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c12 [[id(4)]];
    constant _16* vp_c11 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
    constant _16* vp_c7 [[id(7)]];
    texture2d<float> vp_t_tcb_22 [[id(8)]];
    sampler vp_t_tcb_22Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_14 [[id(10)]];
    sampler vp_t_tcb_14Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_22Smplr_w [[id(18)]];
    sampler vp_t_tcb_14Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_77 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_81 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_93 [[user(locn4)]];
    float4 m_58 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_71 [[attribute(2)]];
    float4 m_73 [[attribute(3)]];
    float4 m_67 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_60 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_75 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2164 = false;
    bool _1010 = false;
    bool _998 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_55.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    float _120 = as_type<float>(_112);
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _118;
    if (!_116)
    {
        out.m_58.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2412 = as_type<float>(_128);
        out.gl_Position.z = _2412;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_60.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _120 = _150;
    }
    float _152 = _120;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_58.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2482 = as_type<float>(_166);
        out.gl_Position.z = _2482;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = as_type<float>(int(gl_VertexIndex));
    float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _172 = _146 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _174 = in.m_65.x;
    float _176 = in.m_65.y;
    float _178 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _180 = in.m_65.z;
    float _182 = in.m_65.w;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _186 = in.m_67.x;
    float _188 = in.m_67.y;
    float _190 = in.m_67.z;
    float _192 = _172 * _170;
    float _194 = _184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _196 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _198 = in.m_69.x;
    float _200 = in.m_69.y;
    float _202 = in.m_69.z;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _206 = _196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _208 = as_type<int>(_168) & 1;
    bool _210 = _208 != 0;
    int _212 = as_type<int>(_168) & 2;
    bool _214 = _212 != 0;
    float _216 = in.m_71.x;
    float _218 = in.m_71.y;
    float _220 = in.m_71.z;
    float _222 = _204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _224 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[20].x, _192);
    bool _226 = !_214;
    float _228 = _226 ? (-0.5) : 0.5;
    float _230 = in.m_55.x;
    float _232 = in.m_55.y;
    float _234 = in.m_55.z;
    int _236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _238 = _236 != 0;
    int _240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _242 = _240 != 0;
    float _244 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _246 = _174 > 0.5;
    float _248 = in.m_73.x;
    float _250 = in.m_73.y;
    float _252 = in.m_73.z;
    bool _254 = !_210;
    float _256 = _254 ? (-0.5) : 0.5;
    bool _258 = _176 > 0.5;
    int _260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _262 = _260 != 0;
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _266 = _264 != 0;
    float _268 = -_256;
    int _270 = _246 ? as_type<int>(_268) : as_type<int>(_256);
    float _272 = _188 * _200;
    float _274 = -_228;
    int _276 = _258 ? as_type<int>(_274) : as_type<int>(_228);
    bool _278 = !_238;
    int _280 = _278 ? 0 : 1;
    bool _282 = _180 > 0.5;
    float _284 = _188 * _218;
    int _286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _288 = _286 != 0;
    bool _290 = _176 > 0.5;
    float _292 = _200 * _232;
    bool _294 = !_262;
    float _296 = _294 ? _256 : as_type<float>(_270);
    float _298 = _218 * _232;
    bool _300 = !_266;
    float _302 = _300 ? _228 : as_type<float>(_276);
    float _304 = _188 * _250;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _308 = _306 != 0;
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _312 = _310 != 0;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _316 = _314 != 0;
    float _318 = _250 * _232;
    float _320 = -_256;
    int _322 = _290 ? as_type<int>(_320) : as_type<int>(_256);
    float _324 = fma(_186, _198, _272);
    int _326 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _328 = _326 != 0;
    float _330 = fma(_198, _230, _292);
    float _332 = fma(_186, _216, _284);
    bool _334 = !_312;
    float _336 = _334 ? _256 : as_type<float>(_322);
    float _338 = fma(_186, _248, _304);
    int _340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _342 = _340 != 0;
    float _344 = in.m_75.x;
    float _346 = in.m_75.y;
    float _348 = fma(_248, _230, _318);
    float _350 = fma(_190, _202, _324);
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _354 = -_256;
    int _356 = _282 ? as_type<int>(_354) : as_type<int>(_256);
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _360 = fma(_216, _230, _298);
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _364 = _352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _366 = _358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _368 = fma(_190, _220, _332);
    float _370 = fma(_190, _252, _338);
    bool _372 = !_288;
    float _374 = _372 ? _256 : as_type<float>(_356);
    out.m_77.x = _364;
    out.m_77.y = _366;
    out.m_77.z = _194;
    out.m_77.w = _362;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _378 = _182 > 0.5;
    float _380 = in.m_71.w;
    float _382 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _384 = fma(_202, _234, _330);
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _388 = in.m_69.w;
    float _390 = -_376;
    float _392 = fma(_382, 2.0, _390);
    float _394 = _346 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _398 = _386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _400 = fma(_220, _234, _360);
    float _402 = _344 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _406 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _228);
    float _408 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    out.m_79.x = _206;
    out.m_79.y = _398;
    out.m_79.z = _222;
    float _410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _412 = _332;
    float _414 = _234;
    float _416 = _176;
    if (_342)
    {
        _412 = _174;
    }
    float _418 = _412;
    float _420 = _408 * _406;
    float _422 = _406;
    float _424 = _418;
    if (!_342)
    {
        float _426 = in.m_65.z;
        _422 = _426;
    }
    float _428 = _422;
    if (!_342)
    {
        _424 = _180;
    }
    float _430 = _424;
    float _432 = fma(_252, _234, _348);
    if (!_342)
    {
        _414 = _176;
    }
    float _434 = _414;
    float _436 = _400 + _380;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _440 = floor(_224);
    float _442 = _384 + _388;
    float _444 = _430 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _448 = in.m_73.w;
    float _450 = _396 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _452 = -_146;
    float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[76].x, _392);
    float _456 = _296 + 0.5;
    float _458 = fma(_244, -2.0, _438);
    float _460 = -_446;
    float _462 = fma(_444, 2.0, _460);
    float _464 = fma(_450, _456, _454);
    float _466 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _458);
    float _468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _470 = -(*spvDescriptorSet0.vp_c11)._m0[19].z;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c15)._m0[639].y, _368);
    float _474 = -_440;
    float _476 = _224 + _474;
    float _478 = _410 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _480 = _302 + (-0.5);
    float _482 = _434;
    if (_342)
    {
        _482 = _174;
    }
    float _484 = _482;
    float _486 = _224 * 6.283185482025146484375;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _490 = -_478;
    float _492 = -_466;
    float _494 = fma(_490, _480, _492);
    float _496 = _486 * 0.15915493667125701904296875;
    float _498 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[83].z, _488);
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _502 = _484 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _504 = _484;
    float _506 = _428;
    if (!_342)
    {
        _504 = _428;
    }
    float _508 = _504;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _512 = _508;
    if (_342)
    {
        _506 = _176;
    }
    float _514 = _506;
    float _516 = -_500;
    float _518 = fma(_502, 2.0, _516);
    float _520 = _496 * 6.283185482025146484375;
    float _522 = cos(_520);
    float _524 = _402 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _526 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _256);
    float _528 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[83].w, _510);
    float _530 = _468 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _532 = _524 * _526;
    float _534 = _432 + _448;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _538 = -_146;
    float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[86].x, _462);
    if (_342)
    {
        _512 = _176;
    }
    float _542 = _512;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _546 = _336 + 0.5;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _550 = _542 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _552 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].w, _544);
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _556 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].w, _404);
    float _558 = fma(_530, _546, _540);
    float _560 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _548);
    float _562 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _536);
    if (!_342)
    {
        _416 = _174;
    }
    float _564 = _416;
    float _566 = fma(_522, 0.5, 0.5);
    bool _568 = _476 < 0.5;
    float _570 = float(_568);
    float _572 = -_476;
    float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _576 = fma(_550, -2.0, _554);
    float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _580 = _436 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _582 = _442 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _584 = _472 * _472;
    float _586 = -_570;
    float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _590 = _580 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _592 = _580 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _594 = fma(_350, _350, _584);
    float _596 = _580 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _598 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[6].z, _590);
    float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _602 = fma(_370, _370, _594);
    float _604 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[6].x, _592);
    float _606 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[6].y, _596);
    int _608 = abs(_280);
    float _610 = -_566;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _614 = _578 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _616 = rsqrt(_602);
    float _618 = _374 + 0.5;
    float _620 = float(_608);
    float _622 = -_146;
    float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[81].x, _518);
    float _626 = -_228;
    int _628 = _378 ? as_type<int>(_626) : as_type<int>(_228);
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _632 = _564 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _634 = fma(_614, _618, _624);
    float _636 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _638 = abs(_574);
    float _640 = _620 * _638;
    bool _642 = !_308;
    float _644 = _642 ? _228 : as_type<float>(_628);
    float _646 = fma(_632, -2.0, _630);
    float _648 = _534 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _650 = _600 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _652 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _576);
    float _654 = _644 + (-0.5);
    float _656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _658 = fma(_648, (*spvDescriptorSet0.vp_c12)._m0[8].y, _606);
    float _660 = fma(_648, (*spvDescriptorSet0.vp_c12)._m0[8].x, _604);
    float _662 = fma(_648, (*spvDescriptorSet0.vp_c12)._m0[8].z, _598);
    float _664 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _552);
    float _666 = -_650;
    float _668 = -_652;
    float _670 = fma(_666, _654, _668);
    float _672 = _350 * _616;
    float _674 = _658 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _676 = _660 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _678 = _472 * _616;
    float _680 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _560);
    float _682 = -_664;
    float _684 = _682 + 1.0;
    float _686 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _688 = _370 * _616;
    float _690 = _676 * _636;
    float _692 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _498);
    float _694 = -_680;
    float _696 = _694 + 1.0;
    float _698 = fma(_302, _684, _494);
    float _700 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _528);
    float _702 = _656 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _704 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _706 = _688 * _704;
    float _708 = -_692;
    float _710 = _708 + 1.0;
    float _712 = -_696;
    float _714 = fma(_296, _712, _464);
    float _716 = -_700;
    float _718 = _716 + 1.0;
    float _720 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _722 = _678 * _720;
    float _724 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _726 = -_706;
    float _728 = fma(_672, _724, _726);
    float _730 = -_710;
    float _732 = fma(_374, _730, _634);
    float _734 = fma(_644, _718, _670);
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _738 = -_722;
    float _740 = fma(_688, _736, _738);
    float _742 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _744 = _672 * _742;
    float _746 = _728 * _728;
    float _748 = _662 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _750 = _674 * _686;
    float _752 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _754 = -_744;
    float _756 = fma(_678, _752, _754);
    float _758 = fma(_740, _740, _746);
    float _760 = _748 * _178;
    float _762 = fma(_690, 0.5, 0.5);
    bool _764 = !_328;
    int _766 = _764 ? 0 : 1;
    float _768 = fma(_750, 0.5, 0.5);
    float _770 = -_228;
    int _772 = _282 ? as_type<int>(_770) : as_type<int>(_228);
    float _774 = fma(_756, _756, _758);
    float _776 = floor(_762);
    int _778 = abs(_766);
    float _780 = fma(_760, 0.5, 0.5);
    bool _782 = !_316;
    float _784 = _782 ? _228 : as_type<float>(_772);
    float _786 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _562);
    float _788 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _646);
    float _790 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _556);
    float _792 = floor(_768);
    float _794 = _784 + (-0.5);
    float _796 = -_786;
    float _798 = _796 + 1.0;
    float _800 = float(_778);
    float _802 = -_790;
    float _804 = _802 + 1.0;
    float _806 = -_702;
    float _808 = -_788;
    float _810 = fma(_806, _794, _808);
    float _812 = -_798;
    float _814 = fma(_336, _812, _558);
    out.m_81.x = _714;
    out.m_81.y = _698;
    out.m_81.z = _732;
    out.m_81.w = _734;
    float _816 = rsqrt(_774);
    float _818 = fma(_784, _804, _810);
    float _820 = fma(_800, _612, _640);
    float _822 = -_776;
    float _824 = _762 + _822;
    float _826 = _228 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_83.x = _814;
    out.m_83.y = _818;
    float _828 = _256 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _830 = floor(_780);
    float _832 = -_792;
    float _834 = _768 + _832;
    float _836 = fma(_824, 2.0, -1.0);
    float _838 = _678 * _826;
    float _840 = _420 * _678;
    float _842 = fma(_834, 2.0, -1.0);
    float _844 = _420 * _672;
    float _846 = _728 * _816;
    float _848 = _740 * _816;
    float _850 = _672 * _826;
    float _852 = _756 * _816;
    float _854 = _420 * _688;
    float _856 = fma(_532, _846, _840);
    float _858 = fma(_848, _828, _850);
    float _860 = _672 * _846;
    float _862 = -_830;
    float _864 = _780 + _862;
    float _866 = fma(_532, _852, _854);
    float _868 = _842 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _870 = _688 * _826;
    float _872 = fma(_864, 2.0, -1.0);
    float _874 = fma(_532, _848, _844);
    float _876 = _688 * _848;
    float _878 = _678 * _852;
    float _880 = -_860;
    float _882 = fma(_678, _848, _880);
    float _884 = fma(_846, _828, _838);
    float _886 = _836 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _888 = _868 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _890 = fma(_852, _828, _870);
    float _892 = -_876;
    float _894 = fma(_672, _852, _892);
    float _896 = -_878;
    float _898 = fma(_688, _846, _896);
    float _900 = fma(_886, (*spvDescriptorSet0.vp_c12)._m0[2].x, _888);
    bool _902 = !_242;
    int _904 = _902 ? 0 : 1;
    float _906 = _894 + _884;
    float _908 = _898 + _858;
    float _910 = _882 + _890;
    float _912 = _872 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    int _914 = abs(_904);
    float _916 = _868 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _918 = _868 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    out.m_85.x = _908;
    out.m_85.y = _906;
    out.m_85.z = _910;
    float _920 = fma(_912, (*spvDescriptorSet0.vp_c12)._m0[4].x, _900);
    float _922 = fma(_886, (*spvDescriptorSet0.vp_c12)._m0[2].y, _916);
    float _924 = fma(_886, (*spvDescriptorSet0.vp_c12)._m0[2].z, _918);
    float _926 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _928 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _930 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _932 = _928 || _930;
    bool _934 = isnan(1.0);
    bool _936 = _932 || _934;
    float _938 = fma(_912, (*spvDescriptorSet0.vp_c12)._m0[4].y, _922);
    float _940 = fma(_912, (*spvDescriptorSet0.vp_c12)._m0[4].z, _924);
    float _942 = fma(_926, _898, _874);
    float _944 = fma(_926, _894, _856);
    float _946 = fma(_926, _882, _866);
    float _948 = float(_914);
    float _950 = _920 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _952 = _938 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _954 = _940 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _956 = abs(_588);
    float _958 = fma(_948, _956, _820);
    float _960 = _942 + _950;
    float _962 = _944 + _952;
    float _964 = _946 + _954;
    float _966 = _882;
    float _968 = _942;
    float _970 = _820;
    float _972 = _948;
    float _974 = _882;
    float _976 = _942;
    float _978 = _948;
    float _980 = _820;
    float _982 = _842;
    float _984 = _872;
    float _986 = _836;
    float _988 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _990 = _940;
    float _992 = _958;
    float _1002;
    float _1004;
    float _1006;
    float _1008;
    if (!_936)
    {
        bool _994 = _952 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _996 = !_994;
        _998 = _996;
        if (!_998)
        {
            float _1000 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1002 = _1000;
            _1004 = 0.0;
            _1006 = 0.0;
            _1008 = 0.0;
            _1010 = true;
        }
    }
    if ((!_1010) || _998)
    {
        bool _1046;
        if (!_998)
        {
            bool _1012 = _952 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1014 = isnan(_952);
            bool _1016 = _1012 || _1014;
            bool _1018 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1020 = _1016 || _1018;
            bool _1022 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1024 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1026 = !_1020;
            bool _1028 = _1024 && _1026;
            if (_1028)
            {
                _966 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1030 = _966;
            float _1032 = _1030;
            if (_1028)
            {
                _968 = 0.0;
            }
            float _1034 = _968;
            _976 = _1034;
            _1004 = _1034;
            if (_1028)
            {
                _970 = 0.0;
            }
            float _1036 = _970;
            _980 = _1036;
            _1006 = _1036;
            if (_1028)
            {
                float _1038 = _1030 * 5.0;
                _1032 = _1038;
            }
            float _1040 = _1032;
            _974 = _1040;
            _1002 = _1040;
            if (_1028)
            {
                _972 = 0.0;
            }
            float _1042 = _972;
            bool _1044 = !_1020;
            _1046 = _1044 && _1022;
            _978 = _1042;
            _1008 = _1042;
        }
        if ((!_1046) || _998)
        {
            _998 = false;
            float _1048 = _974;
            float _1050 = _976;
            float _1052 = _978;
            float _1054 = _980;
            bool _1056 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1058 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1060 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1062 = _1048;
            float _1064 = _1052;
            float _1066 = _1054;
            if (_1056)
            {
                float _1068 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1062 = _1068;
            }
            float _1070 = _1062;
            if (_1056)
            {
                float _1072 = abs(_836);
                float _1074 = -_1072;
                float _1076 = _1074 + 1.0;
                _1064 = _1076;
            }
            float _1078 = _1064;
            float _1080 = _1078;
            if (_1058)
            {
                float _1082 = abs(_842);
                float _1084 = -_1082;
                float _1086 = _1084 + 1.0;
                _982 = _1086;
            }
            float _1088 = _982;
            if (!_1056)
            {
                _1066 = 1.0;
            }
            float _1090 = _1066;
            float _1092 = _1090;
            if (_1060)
            {
                float _1094 = abs(_872);
                float _1096 = -_1094;
                float _1098 = _1096 + 1.0;
                _984 = _1098;
            }
            float _1100 = _984;
            if (!_1058)
            {
                _986 = 1.0;
            }
            float _1102 = _986;
            float _1104 = _1050;
            float _1106 = _1102;
            if (_1058)
            {
                float _1108 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1104 = _1108;
            }
            float _1110 = _1104;
            float _1112 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1060)
            {
                float _1114 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1112 = _1114;
            }
            float _1116 = _1112;
            if (_1056)
            {
                float _1118 = _1078 * _1070;
                float _1120 = precise::clamp(_1118, 0.0, 1.0);
                _1092 = _1120;
            }
            float _1122 = _1092;
            if (!_1060)
            {
                _1080 = 1.0;
            }
            float _1124 = _1080;
            float _1126 = _1124;
            _1002 = _964;
            if (_1058)
            {
                float _1128 = _1088 * _1110;
                float _1130 = precise::clamp(_1128, 0.0, 1.0);
                _1106 = _1130;
            }
            float _1132 = _1106;
            float _1134 = _1122 * _1132;
            _988 = _1116;
            _1004 = _960;
            _1006 = _962;
            if (_1060)
            {
                float _1136 = _1100 * _1116;
                float _1138 = precise::clamp(_1136, 0.0, 1.0);
                _1126 = _1138;
            }
            float _1140 = _1126;
            float _1142 = _1134 * _1140;
            _1008 = _1142;
        }
    }
    _1010 = false;
    float _1144 = _988;
    float _1146 = _1002;
    float _1148 = _1004;
    float _1150 = _1006;
    float _1152 = _1008;
    float _1154 = _952 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1156 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1158 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1160 = fma(_950, 6.2500002968590706586837768554688e-05, 0.5);
    float _1162 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1156);
    float _1164 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1158);
    float _1166 = fma(_954, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1162);
    float _1168 = fma(_954, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1164);
    float _1170 = _1166 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1172 = _1168 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1174 = trunc(_1170);
    int _1176 = int(_1174);
    float _1178 = trunc(_1172);
    int _1180 = int(_1178);
    int _1182 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1184 = _1176 + _1182;
    int _1186 = _1184 + 1;
    bool _1188 = _1186 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1190 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1192 = _1180 + _1190;
    int _1194 = _1192 + 1;
    int _1196 = _1186 | _1194;
    bool _1198 = _1196 < 0;
    bool _1200 = _1198 || _1188;
    bool _1202 = _1194 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1204 = _1202 || _1200;
    int _1206 = _1196;
    int _1208 = _1194;
    int _1210 = _1186;
    float _1212 = _1144;
    float _1214 = _1148;
    float _1216 = _1150;
    float _1218 = _1146;
    if (!_1204)
    {
        int _1220 = _1194 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1222 = _1220 + _1186;
        _1206 = _1222;
    }
    int _1224 = _1206;
    float _1226 = _938;
    if (!_1204)
    {
        float _1228 = floor(_1170);
        _1226 = _1228;
    }
    float _1230 = _1226;
    if (!_1204)
    {
        int _1232 = _1224 << 2;
        _1208 = _1232;
    }
    int _1234 = _1208;
    int _1236 = _1234;
    if (!_1204)
    {
        uint _1239 = uint(int(uint(_1224) >> uint(2)));
        _1210 = int(_1239);
    }
    int _1241 = _1210;
    if (!_1204)
    {
        int _1243 = 12 & _1234;
        _1236 = _1243;
    }
    int _1245 = _1236;
    float _1247 = as_type<float>(_1245);
    if (!_1204)
    {
        int _1249 = _1241 << 4;
        int _1251 = _1249 + _1245;
        _1212 = as_type<float>(_1251);
    }
    float _1253 = _1212;
    float _1255 = as_type<float>(_1241);
    if (!_1204)
    {
        float _1257 = floor(_1172);
        _1255 = _1257;
    }
    float _1259 = _1255;
    if (!_1204)
    {
        float _1261 = -_1230;
        float _1263 = _1170 + _1261;
        _990 = _1263;
    }
    float _1265 = _990;
    float _1267 = _1253;
    if (!_1204)
    {
        int _1269 = as_type<int>(_1253) + 400;
        uint _1271 = uint(int(uint(_1269) >> uint(2)));
        uint _1273 = uint(int(uint(int(_1271)) >> uint(2)));
        int _1275 = int(_1271) & 3;
        float _1277 = (*spvDescriptorSet0.vp_c15)._m0[int(_1273)][_1275];
        _1267 = _1277;
    }
    float _1279 = _1267;
    if (!_1204)
    {
        float _1281 = -_1259;
        float _1283 = _1172 + _1281;
        _1247 = _1283;
    }
    float _1285 = _1247;
    float _1287 = fma(_954, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4342 = float2(_1160, _1287);
    float _1289 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_4342, float2(0.0), isnan(_4342)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_4342, float2(0.0), isnan(_4342)), level(0.0)).x;
    float _1291 = _816;
    float _1293 = _1287;
    if (!_1204)
    {
        float _1295 = rint(_1279);
        float _1297 = precise::max(_1295, 0.0);
        uint _1299 = uint(_1297);
        uint _1301 = clamp(_1299, 0u, 65535u);
        _1291 = as_type<float>(_1301);
    }
    float _1303 = _1291;
    float _1305 = _1285;
    if (!_1204)
    {
        float3 _4378 = float3(_1265, _1285, float(as_type<int>(_1303)));
        float3 _4382 = select(_4378, float3(0.0), isnan(_4378));
        float _1307 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4382.xy, uint(rint(_4382.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4382.xy, uint(rint(_4382.z)), level(0.0)).x;
        _1305 = _1307;
    }
    float _1309 = _1305;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1313 = _1146 + _1311;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1317 = _1148 + _1315;
    float _1319 = _952 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1321 = _952 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1323 = _1313 * _1313;
    float _1325 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1319);
    float _1327 = fma(_1317, _1317, _1323);
    float _1329 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1321);
    bool _1331 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan(0.5);
    bool _1339 = _1335 || _1337;
    float _1341 = sqrt(_1327);
    bool _1343 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan(0.5);
    bool _1351 = _1347 || _1349;
    float _1353 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1325);
    float _1355 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1329);
    bool _1357 = _1341 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1359 = !_1357;
    float _1361 = _1341;
    float _1363 = _1353;
    float _1365 = _1289;
    if (!_1359)
    {
        float _1367 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1369 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1371 = _1341 + _1369;
        float _1373 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1375 = rsqrt(_1327);
        float _1377 = _1371 * _1367;
        float _1379 = _1377 * 0.15915493667125701904296875;
        float _1381 = _1379 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        float _1385 = _1379 * 6.283185482025146484375;
        float _1387 = cos(_1385);
        float _1389 = fma(_1383, _1373, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1391 = _1375 * _1389;
        float _1393 = _1387 + (-1.0);
        float _1395 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1397 = fma(_1317, _1391, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1399 = fma(_1313, _1391, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1401 = fma(_1387, _1150, _1395);
        _1214 = _1397;
        _1216 = _1401;
        _1218 = _1399;
        _1361 = _1387;
        _1293 = _1395;
    }
    float _1403 = _1214;
    float _1405 = _1216;
    float _1407 = _1218;
    float _1409 = _1361;
    float _1411 = _1293;
    float _1413 = _1353 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1415 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1417 = _1411;
    float _1419 = _1409;
    float _1421 = _1415;
    if (_1339)
    {
        _1417 = _1403;
    }
    float _1423 = _1417;
    float _1425 = _1423;
    if (_1339)
    {
        _1419 = _1405;
    }
    float _1427 = _1419;
    float _1429 = _1427;
    if (_1339)
    {
        _1363 = _1407;
    }
    float _1431 = _1363;
    float _1433 = _1431;
    if (!_1339)
    {
        float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1437 = _952 + _1435;
        float _1439 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1441 = _950 + _1439;
        float _1443 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1445 = -_952;
        float _1447 = _1445 + _1405;
        float _1449 = _1437 * _1437;
        float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1453 = _954 + _1451;
        float _1455 = -_950;
        float _1457 = _1455 + _1403;
        float _1459 = fma(_1441, _1441, _1449);
        float _1461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1463 = fma(_1453, _1453, _1459);
        float _1465 = sqrt(_1463);
        float _1467 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1469 = -_954;
        float _1471 = _1469 + _1407;
        float _1473 = precise::min(_1465, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1475 = _1473 * _1461;
        float _1477 = _1467 * _1475;
        float _1479 = fma(_1447, _1477, _952);
        float _1481 = fma(_1457, _1477, _950);
        float _1483 = fma(_1471, _1477, _954);
        _1429 = _1479;
        _1425 = _1481;
        _1433 = _1483;
    }
    float _1485 = _1429;
    float _1487 = _1425;
    float _1489 = _1433;
    float _1491 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1493 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1495 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1497 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1499 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1491);
    float _1501 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1493);
    float _1503 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1495);
    float _1505 = 1.0 / _1415;
    float _1507 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1499);
    float _1509 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1501);
    float _1511 = _1413 + _1415;
    float _1513 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1497);
    float _1515 = _1507 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1517 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1503);
    float _1519 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1521 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1513);
    float _1523 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1525 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1527 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1529 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1531 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1533 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1523);
    float _1535 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1525);
    float _1537 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1527);
    float _1539 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1529);
    float _1541 = _1521 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1543 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1533);
    float _1545 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1535);
    float _1547 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1537);
    float _1549 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1539);
    float _1551 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1543);
    float _1553 = _1511 * _1505;
    float _1555 = _1553 * 0.5;
    float _1557 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1545);
    float _1559 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1547);
    float _1561 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1549);
    float _1563 = _1535;
    float _1565 = _1551;
    float _1567 = _1557;
    if (_1351)
    {
        _1563 = 1.0;
    }
    float _1569 = _1563;
    float _1571 = _1569;
    if (!_1351)
    {
        float _1573 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1575 = _1573 * 0.15915493667125701904296875;
        float _1577 = _1575 * 6.283185482025146484375;
        float _1579 = cos(_1577);
        float _1581 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1583 = _1581 * 0.15915493667125701904296875;
        float _1585 = _1575 * 6.283185482025146484375;
        float _1587 = sin(_1585);
        float _1589 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1591 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1589);
        float _1593 = 1.0 / _1579;
        float _1595 = _1583 * 6.283185482025146484375;
        float _1597 = cos(_1595);
        float _1599 = _1587 * _1593;
        float _1601 = 1.0 / _1591;
        float _1603 = _1597 * _1599;
        float _1605 = _1583 * 6.283185482025146484375;
        float _1607 = sin(_1605);
        float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1611 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1609;
        float _1613 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1615 = _1601 * _1613;
        float _1617 = 1.0 / _1603;
        float _1619 = 1.0 / _1611;
        float _1621 = _1607 * _1617;
        float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1625 = fma(_1621, _1615, _1623);
        float _1627 = _1625 * _1619;
        float _1629 = precise::clamp(_1627, 0.0, 1.0);
        _1421 = _1615;
        _1571 = _1629;
    }
    float _1631 = _1421;
    float _1633 = _1571;
    float _1635 = abs(_1289);
    bool _1637 = _1635 != 0.0;
    bool _1639 = isnan(_1635);
    bool _1641 = _1637 || _1639;
    bool _1643 = isnan(0.0);
    bool _1645 = _1641 || _1643;
    out.gl_Position.x = _1551;
    out.gl_Position.y = _1557;
    out.gl_Position.z = _1559;
    out.gl_Position.w = _1561;
    bool _1647 = _146 > 0.001000000047497451305389404296875;
    bool _1649 = isnan(_146);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan(0.001000000047497451305389404296875);
    bool _1655 = _1651 || _1653;
    float _1657 = _1631;
    if (!_1645)
    {
        out.gl_Position.w = 0.0;
    }
    if (_1645)
    {
        _1365 = _1561;
    }
    float _1659 = _1365;
    float _1661 = _1659;
    if (!_1645)
    {
        _1661 = 0.0;
    }
    float _1663 = _1661;
    if (_1204)
    {
        _148 = _1663;
    }
    float _1665 = _148;
    float _1667 = _1665;
    float _1669 = _1665;
    if (!_1204)
    {
        int _1671 = _1224 << 4;
        int _1673 = _1671 + 2048;
        uint _1675 = uint(int(uint(_1673) >> uint(2)));
        uint _1677 = uint(int(uint(int(_1675)) >> uint(2)));
        int _1679 = int(_1675) & 3;
        float _1681 = (*spvDescriptorSet0.vp_c15)._m0[int(_1677)][_1679];
        int _1683 = int(_1675) + 1;
        uint _1685 = uint(int(uint(_1683) >> uint(2)));
        int _1687 = _1683 & 3;
        float _1689 = (*spvDescriptorSet0.vp_c15)._m0[int(_1685)][_1687];
        int _1691 = _1673 + 8;
        uint _1693 = uint(int(uint(_1691) >> uint(2)));
        uint _1695 = uint(int(uint(int(_1693)) >> uint(2)));
        int _1697 = int(_1693) & 3;
        float _1699 = (*spvDescriptorSet0.vp_c15)._m0[int(_1695)][_1697];
        int _1701 = int(_1693) + 1;
        uint _1703 = uint(int(uint(_1701) >> uint(2)));
        int _1705 = _1701 & 3;
        float _1707 = (*spvDescriptorSet0.vp_c15)._m0[int(_1703)][_1705];
        float _1709 = _1154 * _1689;
        float _1711 = fma(_950, _1681, _1709);
        float _1713 = fma(_954, _1699, _1711);
        float _1715 = _1713 + _1707;
        float _1717 = precise::clamp(_1715, 0.0, 1.0);
        float _1719 = -_1717;
        float _1721 = _1719 + _1309;
        float _1723 = fma(_1721, 500.0, 1.5);
        float _1725 = exp2(_1723);
        float _1727 = 0.0 + _1725;
        float _1729 = precise::clamp(_1727, 0.0, 1.0);
        bool _1731 = _1729 >= 1.0;
        bool _1733 = isnan(_1729);
        bool _1735 = _1731 || _1733;
        bool _1737 = isnan(1.0);
        bool _1739 = _1735 || _1737;
        _1657 = _1699;
        if (!_1739)
        {
            out.gl_Position.w = 0.0;
        }
        if (_1739)
        {
            _1667 = _1663;
        }
        float _1741 = _1667;
        _1669 = _1741;
        if (!_1739)
        {
            _1669 = 0.0;
        }
    }
    float _1743 = _1657;
    float _1745 = _1669;
    float _1747 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1749 = _1485 + _1747;
    float _1751 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1753 = _1487 + _1751;
    float _1755 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1757 = _1489 + _1755;
    float _1759 = _1531 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1761 = _1749 * _1749;
    float _1763 = _1743;
    float _1765 = _1749;
    if (!_1655)
    {
        _1565 = 0.0;
        _1567 = 0.0;
    }
    float _1767 = _1565;
    float _1769 = _1567;
    float _1771 = fma(_1753, _1753, _1761);
    float _1773 = fma(_1757, _1757, _1771);
    float _1775 = rsqrt(_1773);
    float _1777 = _1775 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1779 = _1753 * _1777;
    float _1781 = _1757 * _1777;
    float _1783 = _1779 * _1779;
    float _1785 = _1781 * _1781;
    float _1787 = _1783 + _1785;
    float _1789 = sqrt(_1787);
    bool _1791 = _1789 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1795 = _1789 + _1793;
    float _1797 = _1757;
    float _1799 = _1787;
    float _1801 = _1795;
    float _1803 = _1779;
    if (_1791)
    {
        float _1805 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1797 = _1805;
    }
    float _1807 = _1797;
    if (_1791)
    {
        float _1809 = rsqrt(_1787);
        _1799 = _1809;
    }
    float _1811 = _1799;
    if (_1791)
    {
        float _1813 = _1795 * _1807;
        _1801 = _1813;
    }
    float _1815 = _1801;
    if (_1791)
    {
        float _1817 = _1815 * 0.15915493667125701904296875;
        _1763 = _1817;
    }
    float _1819 = _1763;
    float _1821 = _1775;
    float _1823 = _1819;
    if (_1791)
    {
        float _1825 = _1819 * 6.283185482025146484375;
        float _1827 = sin(_1825);
        _1821 = _1827;
    }
    float _1829 = _1821;
    float _1831 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1833 = precise::max(0.0, _1831);
    float _1835 = _1663;
    float _1837 = _1833;
    float _1839 = _1831;
    if (_1791)
    {
        float _1841 = _1819 * 6.283185482025146484375;
        float _1843 = cos(_1841);
        _1835 = _1843;
    }
    float _1845 = _1835;
    float _1847 = -_1777;
    float _1849 = -_1833;
    float _1851 = fma(_1749, _1847, _1849);
    if (!_1791)
    {
        _1765 = _1785;
    }
    float _1853 = _1765;
    float _1855 = _1853;
    if (_1791)
    {
        float _1857 = _1851 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1837 = _1857;
    }
    float _1859 = _1837;
    float _1861 = _1859;
    float _1863 = _1829;
    if (_1791)
    {
        float _1865 = fma(_1829, _1859, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1861 = _1865;
    }
    float _1867 = _1861;
    float _1869 = _1867;
    if (!_1791)
    {
        _1863 = _1851;
    }
    float _1871 = _1863;
    float _1873 = _1871;
    float _1875 = _1845;
    if (_1791)
    {
        float _1877 = _1845 + (-1.0);
        _1839 = _1877;
    }
    float _1879 = _1839;
    float _1881 = _1879;
    if (_1791)
    {
        float _1883 = _1811 * _1867;
        _1823 = _1883;
    }
    float _1885 = _1823;
    if (!_1791)
    {
        _1869 = _1781;
    }
    float _1887 = _1869;
    float _1889 = _1887;
    if (_1791)
    {
        float _1891 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1881 = _1891;
    }
    float _1893 = _1881;
    if (_1791)
    {
        float _1895 = _1779 * _1885;
        _1803 = _1895;
    }
    float _1897 = _1803;
    if (_1791)
    {
        float _1899 = _1781 * _1885;
        _1889 = _1899;
    }
    float _1901 = _1889;
    if (_1791)
    {
        float _1903 = fma(_1851, _1845, _1893);
        _1873 = _1903;
    }
    float _1905 = _1873;
    if (!_1791)
    {
        _1875 = _1783;
    }
    float _1907 = _1875;
    float _1909 = _1907;
    if (_1791)
    {
        float _1911 = _1897 * _1897;
        _1909 = _1911;
    }
    float _1913 = _1909;
    float _1915 = sqrt(_1773);
    if (_1791)
    {
        float _1917 = _1901 * _1901;
        _1855 = _1917;
    }
    float _1919 = _1855;
    float _1921 = fma(_1905, _1905, _1913);
    float _1923 = _1921 + _1919;
    float _1925 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1927 = rsqrt(_1923);
    float _1929 = -_1759;
    float _1931 = fma(_1929, _1925, 1.0);
    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1935 = fma(_1915, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1933);
    float _1937 = precise::clamp(_1935, 0.0, 1.0);
    float _1939 = log2(_1931);
    float _1941 = -_1937;
    float _1943 = _1941 + 1.0;
    float _1945 = abs(_1943);
    float _1947 = log2(_1945);
    float _1949 = _1927 * _1897;
    float _1951 = _1927 * _1905;
    float _1953 = _1927 * _1901;
    float _1955 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1957 = 1.0 / _1745;
    float _1959 = -_1955;
    float _1961 = fma(_1951, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1959);
    float _1963 = -_1953;
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1961);
    float _1967 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1969 = fma(_1965, -0.5, 0.5);
    float _1971 = fma(_1965, 0.5, 0.5);
    float _1973 = _1939 * 0.693147182464599609375;
    float _1975 = _1951 + 1.0;
    float _1977 = exp2(_1967);
    float _1979 = fma(_1971, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1981 = _1957 * _1767;
    float _1983 = _1957 * _1769;
    float _1985 = fma(_1971, _1979, -0.212114393711090087890625);
    float _1987 = fma(_1981, 0.5, 0.5);
    float _1989 = fma(_1983, -0.5, 0.5);
    float _1991 = sqrt(_1969);
    float _1993 = fma(_1971, _1985, 1.570728778839111328125);
    float _1995 = _1973 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1997 = -_1951;
    float _1999 = fma(_1977, _1975, _1997);
    float _2001 = fma(_1999, 0.5, 0.5);
    float _2003 = _1991 * 0.636619746685028076171875;
    float _2005 = -_1993;
    float _2007 = fma(_2003, _2005, 1.0);
    float3 _5495 = float3(_1987, _1989, _1995);
    float _2009 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5495, float3(0.0), isnan(_5495)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5495, float3(0.0), isnan(_5495)), level(0.0)).x;
    float3 _5504 = float3(_1987, _1989, _1995);
    float4 _2012 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5504, float3(0.0), isnan(_5504)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5504, float3(0.0), isnan(_5504)), level(0.0)).xyzw;
    float _2014 = _2012.x;
    float _2016 = _2012.y;
    float _2018 = _2012.z;
    float _2020 = _2012.w;
    float2 _5520 = float2(_2007, _2001);
    float3 _2024 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5520, float2(0.0), isnan(_5520)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5520, float2(0.0), isnan(_5520)), level(0.0)).xyz;
    float _2026 = _2024.x;
    float _2028 = _2024.y;
    float _2030 = _2024.z;
    float _2032 = _1152 * _1633;
    float _2034 = _1559 + _1561;
    bool _2036 = _1915 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2038 = isnan(_1915);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2044 = _2040 || _2042;
    float _2046 = _2032 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2048 = _2034 * 0.5;
    float _2050 = _958 * _2046;
    float _2052 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_87.z = _2048;
    out.m_87.w = _1561;
    if (!_1655)
    {
        _992 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2054 = _992;
    float _2056 = exp2(_2052);
    int _2058 = as_type<int>(_2054);
    float _2060 = 0.0;
    float _2062 = 0.0;
    if (!_1655)
    {
        float _2064 = _2054 * 5.0;
        _2058 = as_type<int>(_2064);
    }
    int _2066 = _2058;
    float _2068 = as_type<float>(_2066);
    if (!_1655)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5599 = as_type<float>(_2066);
        out.gl_Position.z = _5599;
    }
    float _2070 = -_2056;
    float _2072 = _2070 + 1.0;
    float _2074 = _2056;
    if (_1655)
    {
        _2074 = _2050;
    }
    float _2076 = _2074;
    float _2078 = _2076;
    if (!_1655)
    {
        _2078 = 0.0;
    }
    float _2080 = _2078;
    float _2082 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2044)
    {
        _2068 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2084 = _2068;
    float _2086 = _2084;
    float _2088 = _2084;
    if (!_2044)
    {
        _2060 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2090 = _2060;
    float _2092 = _2090;
    float _2094 = _2090;
    if (!_2044)
    {
        _2062 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2096 = _2062;
    float _2098 = _2082 * _2009;
    float _2100 = -_2082;
    float _2102 = _2100 + 1.0;
    float _2104 = _2020 * _2098;
    float _2106 = _2030 * _2098;
    float _2108 = _2020 * _2102;
    float _2110 = fma(_2026, _2104, _2014);
    float _2112 = fma(_2028, _2104, _2016);
    float _2114 = fma(_2020, _2106, _2018);
    out.m_89.x = _2110;
    out.m_89.y = _2112;
    out.m_89.z = _2114;
    out.m_89.w = _2108;
    bool _2116 = !_2044;
    float _2118 = _2096;
    float _2120 = _2096;
    if (!_2116)
    {
        bool _2122 = _1915 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2124 = isnan(_1915);
        bool _2126 = _2122 || _2124;
        bool _2128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2130 = _2126 || _2128;
        if (!_2130)
        {
            float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2134 = _1915 + _2132;
            float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2138 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2136;
            float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2146 = _2144 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2148 = 1.0 / _2138;
            float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2152 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2154 = _2134 * _2148;
            float _2156 = precise::clamp(_2154, 0.0, 1.0);
            float _2158 = fma(_2156, _2142, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2160 = fma(_2156, _2146, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2162 = fma(_2156, _2152, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2094 = _2160;
            _2088 = _2158;
            _2120 = _2162;
            _2164 = true;
        }
        else
        {
            bool _2166 = _1915 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2168 = isnan(_1915);
            bool _2170 = _2166 || _2168;
            bool _2172 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2174 = _2170 || _2172;
            if (!_2174)
            {
                _2086 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2176 = _2086;
            _2088 = _2176;
            if (!_2174)
            {
                _2092 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2178 = _2092;
            _2094 = _2178;
            if (!_2174)
            {
                _2118 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2180 = _2118;
            bool _2182 = !_2174;
            _2120 = _2180;
            if (!_2182)
            {
                bool _2184 = _1915 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2186 = isnan(_1915);
                bool _2188 = _2184 || _2186;
                bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2192 = _2188 || _2190;
                if (!_2192)
                {
                    float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2196 = _1915 + _2194;
                    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2200 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2198;
                    float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2204 = _2202 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2206 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2208 = _2206 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2210 = 1.0 / _2200;
                    float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2214 = _2212 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2216 = _2196 * _2210;
                    float _2218 = precise::clamp(_2216, 0.0, 1.0);
                    float _2220 = fma(_2218, _2204, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2222 = fma(_2218, _2208, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2224 = fma(_2218, _2214, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2094 = _2222;
                    _2088 = _2220;
                    _2120 = _2224;
                    _2164 = true;
                }
                else
                {
                    _2094 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2088 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2120 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2164 = false;
    float _2226 = _2094;
    float _2228 = _2088;
    float _2230 = _2120;
    float _2232 = _2080 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _2234 = _2226 * 0.586610972881317138671875;
    bool _2236 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_58.x = _2232;
    float _2238 = fma(_2228, 0.298911988735198974609375, _2234);
    bool _2240 = _1633 > 0.0;
    bool _2242 = isnan(_1633);
    bool _2244 = _2240 || _2242;
    bool _2246 = isnan(0.0);
    bool _2248 = _2244 || _2246;
    float _2250 = fma(_2230, 0.114477999508380889892578125, _2238);
    float _2252 = -_2250;
    float _2254 = _2252 + _2228;
    float _2256 = -_2250;
    float _2258 = _2256 + _2226;
    float _2260 = -_2250;
    float _2262 = _2260 + _2230;
    float _2264 = fma(_2254, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2250);
    float _2266 = fma(_2258, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2250);
    float _2268 = fma(_2262, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2250);
    bool _2270 = !_2236;
    if (!_2270)
    {
        float _2272 = -_1485;
        float _2274 = _2272 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2276 = -_1487;
        float _2278 = _2276 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2280 = -_1489;
        float _2282 = _2280 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2284 = _2274 * _2274;
        float _2286 = fma(_2278, _2278, _2284);
        float _2288 = fma(_2282, _2282, _2286);
        float _2290 = sqrt(_2288);
        float _2292 = rsqrt(_2288);
        float _2294 = -_2290;
        float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2298 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2300 = precise::clamp(_2298, 0.0, 1.0);
        float _2302 = _2278 * _2292;
        float _2304 = _2274 * _2292;
        float _2306 = abs(_2300);
        float _2308 = log2(_2306);
        float _2310 = _2282 * _2292;
        float _2312 = _2302 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2314 = _906 * _2304;
        float _2316 = -_2304;
        float _2318 = -_2312;
        float _2320 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2318);
        float _2322 = fma(_908, _2302, _2314);
        float _2324 = -_2310;
        float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2320);
        float _2328 = fma(_910, _2310, _2322);
        float _2330 = precise::clamp(_2328, 0.0, 1.0);
        float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2334 = _2326 + _2332;
        float _2336 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2338 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2340 = precise::clamp(_2338, 0.0, 1.0);
        float _2342 = exp2(_2336);
        float _2344 = _2342 * _2340;
        float _2346 = _2330 * _2344;
        float _2348 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2350 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2352 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2348;
        out.m_91.y = _2350;
        out.m_91.z = _2352;
    }
    out.m_93.x = _2264;
    out.m_93.y = _2266;
    out.m_93.z = _2268;
    if (_2248)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_58.x = 0.0;
    float _2354 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2354;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2164 = false;
    bool _1010 = false;
    bool _998 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_55.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    float _120 = as_type<float>(_112);
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _118;
    if (!_116)
    {
        out.m_58.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2412 = as_type<float>(_128);
        out.gl_Position.z = _2412;
    }
    if (!_116)
    {
        return out;
    }
    float _132 = in.m_60.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _120 = _150;
    }
    float _152 = _120;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_58.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2482 = as_type<float>(_166);
        out.gl_Position.z = _2482;
    }
    if (_158)
    {
        return out;
    }
    float _168 = as_type<float>(int(gl_VertexIndex));
    float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _172 = _146 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _174 = in.m_65.x;
    float _176 = in.m_65.y;
    float _178 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _180 = in.m_65.z;
    float _182 = in.m_65.w;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _186 = in.m_67.x;
    float _188 = in.m_67.y;
    float _190 = in.m_67.z;
    float _192 = _172 * _170;
    float _194 = _184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _196 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _198 = in.m_69.x;
    float _200 = in.m_69.y;
    float _202 = in.m_69.z;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _206 = _196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _208 = as_type<int>(_168) & 1;
    bool _210 = _208 != 0;
    int _212 = as_type<int>(_168) & 2;
    bool _214 = _212 != 0;
    float _216 = in.m_71.x;
    float _218 = in.m_71.y;
    float _220 = in.m_71.z;
    float _222 = _204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _224 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[20].x, _192);
    bool _226 = !_214;
    float _228 = _226 ? (-0.5) : 0.5;
    float _230 = in.m_55.x;
    float _232 = in.m_55.y;
    float _234 = in.m_55.z;
    int _236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _238 = _236 != 0;
    int _240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _242 = _240 != 0;
    float _244 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _246 = _174 > 0.5;
    float _248 = in.m_73.x;
    float _250 = in.m_73.y;
    float _252 = in.m_73.z;
    bool _254 = !_210;
    float _256 = _254 ? (-0.5) : 0.5;
    bool _258 = _176 > 0.5;
    int _260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _262 = _260 != 0;
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _266 = _264 != 0;
    float _268 = -_256;
    int _270 = _246 ? as_type<int>(_268) : as_type<int>(_256);
    float _272 = _188 * _200;
    float _274 = -_228;
    int _276 = _258 ? as_type<int>(_274) : as_type<int>(_228);
    bool _278 = !_238;
    int _280 = _278 ? 0 : 1;
    bool _282 = _180 > 0.5;
    float _284 = _188 * _218;
    int _286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _288 = _286 != 0;
    bool _290 = _176 > 0.5;
    float _292 = _200 * _232;
    bool _294 = !_262;
    float _296 = _294 ? _256 : as_type<float>(_270);
    float _298 = _218 * _232;
    bool _300 = !_266;
    float _302 = _300 ? _228 : as_type<float>(_276);
    float _304 = _188 * _250;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _308 = _306 != 0;
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _312 = _310 != 0;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _316 = _314 != 0;
    float _318 = _250 * _232;
    float _320 = -_256;
    int _322 = _290 ? as_type<int>(_320) : as_type<int>(_256);
    float _324 = fma(_186, _198, _272);
    int _326 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _328 = _326 != 0;
    float _330 = fma(_198, _230, _292);
    float _332 = fma(_186, _216, _284);
    bool _334 = !_312;
    float _336 = _334 ? _256 : as_type<float>(_322);
    float _338 = fma(_186, _248, _304);
    int _340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _342 = _340 != 0;
    float _344 = in.m_75.x;
    float _346 = in.m_75.y;
    float _348 = fma(_248, _230, _318);
    float _350 = fma(_190, _202, _324);
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _354 = -_256;
    int _356 = _282 ? as_type<int>(_354) : as_type<int>(_256);
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _360 = fma(_216, _230, _298);
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _364 = _352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _366 = _358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _368 = fma(_190, _220, _332);
    float _370 = fma(_190, _252, _338);
    bool _372 = !_288;
    float _374 = _372 ? _256 : as_type<float>(_356);
    out.m_77.x = _364;
    out.m_77.y = _366;
    out.m_77.z = _194;
    out.m_77.w = _362;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _378 = _182 > 0.5;
    float _380 = in.m_71.w;
    float _382 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _384 = fma(_202, _234, _330);
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _388 = in.m_69.w;
    float _390 = -_376;
    float _392 = fma(_382, 2.0, _390);
    float _394 = _346 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _398 = _386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _400 = fma(_220, _234, _360);
    float _402 = _344 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _406 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _228);
    float _408 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    out.m_79.x = _206;
    out.m_79.y = _398;
    out.m_79.z = _222;
    float _410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _412 = _332;
    float _414 = _234;
    float _416 = _176;
    if (_342)
    {
        _412 = _174;
    }
    float _418 = _412;
    float _420 = _408 * _406;
    float _422 = _406;
    float _424 = _418;
    if (!_342)
    {
        float _426 = in.m_65.z;
        _422 = _426;
    }
    float _428 = _422;
    if (!_342)
    {
        _424 = _180;
    }
    float _430 = _424;
    float _432 = fma(_252, _234, _348);
    if (!_342)
    {
        _414 = _176;
    }
    float _434 = _414;
    float _436 = _400 + _380;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _440 = floor(_224);
    float _442 = _384 + _388;
    float _444 = _430 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _448 = in.m_73.w;
    float _450 = _396 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _452 = -_146;
    float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[76].x, _392);
    float _456 = _296 + 0.5;
    float _458 = fma(_244, -2.0, _438);
    float _460 = -_446;
    float _462 = fma(_444, 2.0, _460);
    float _464 = fma(_450, _456, _454);
    float _466 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _458);
    float _468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _470 = -(*spvDescriptorSet0.vp_c11)._m0[19].z;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c15)._m0[639].y, _368);
    float _474 = -_440;
    float _476 = _224 + _474;
    float _478 = _410 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _480 = _302 + (-0.5);
    float _482 = _434;
    if (_342)
    {
        _482 = _174;
    }
    float _484 = _482;
    float _486 = _224 * 6.283185482025146484375;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _490 = -_478;
    float _492 = -_466;
    float _494 = fma(_490, _480, _492);
    float _496 = _486 * 0.15915493667125701904296875;
    float _498 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[83].z, _488);
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _502 = _484 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _504 = _484;
    float _506 = _428;
    if (!_342)
    {
        _504 = _428;
    }
    float _508 = _504;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _512 = _508;
    if (_342)
    {
        _506 = _176;
    }
    float _514 = _506;
    float _516 = -_500;
    float _518 = fma(_502, 2.0, _516);
    float _520 = _496 * 6.283185482025146484375;
    float _522 = cos(_520);
    float _524 = _402 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _526 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _256);
    float _528 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[83].w, _510);
    float _530 = _468 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _532 = _524 * _526;
    float _534 = _432 + _448;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _538 = -_146;
    float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[86].x, _462);
    if (_342)
    {
        _512 = _176;
    }
    float _542 = _512;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _546 = _336 + 0.5;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _550 = _542 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _552 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].w, _544);
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _556 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].w, _404);
    float _558 = fma(_530, _546, _540);
    float _560 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _548);
    float _562 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _536);
    if (!_342)
    {
        _416 = _174;
    }
    float _564 = _416;
    float _566 = fma(_522, 0.5, 0.5);
    bool _568 = _476 < 0.5;
    float _570 = float(_568);
    float _572 = -_476;
    float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _576 = fma(_550, -2.0, _554);
    float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _580 = _436 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _582 = _442 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _584 = _472 * _472;
    float _586 = -_570;
    float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _590 = _580 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _592 = _580 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _594 = fma(_350, _350, _584);
    float _596 = _580 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _598 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[6].z, _590);
    float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _602 = fma(_370, _370, _594);
    float _604 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[6].x, _592);
    float _606 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[6].y, _596);
    int _608 = abs(_280);
    float _610 = -_566;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _614 = _578 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _616 = rsqrt(_602);
    float _618 = _374 + 0.5;
    float _620 = float(_608);
    float _622 = -_146;
    float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[81].x, _518);
    float _626 = -_228;
    int _628 = _378 ? as_type<int>(_626) : as_type<int>(_228);
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _632 = _564 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _634 = fma(_614, _618, _624);
    float _636 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _638 = abs(_574);
    float _640 = _620 * _638;
    bool _642 = !_308;
    float _644 = _642 ? _228 : as_type<float>(_628);
    float _646 = fma(_632, -2.0, _630);
    float _648 = _534 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _650 = _600 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _652 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _576);
    float _654 = _644 + (-0.5);
    float _656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _658 = fma(_648, (*spvDescriptorSet0.vp_c12)._m0[8].y, _606);
    float _660 = fma(_648, (*spvDescriptorSet0.vp_c12)._m0[8].x, _604);
    float _662 = fma(_648, (*spvDescriptorSet0.vp_c12)._m0[8].z, _598);
    float _664 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _552);
    float _666 = -_650;
    float _668 = -_652;
    float _670 = fma(_666, _654, _668);
    float _672 = _350 * _616;
    float _674 = _658 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _676 = _660 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _678 = _472 * _616;
    float _680 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _560);
    float _682 = -_664;
    float _684 = _682 + 1.0;
    float _686 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _688 = _370 * _616;
    float _690 = _676 * _636;
    float _692 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _498);
    float _694 = -_680;
    float _696 = _694 + 1.0;
    float _698 = fma(_302, _684, _494);
    float _700 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _528);
    float _702 = _656 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _704 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _706 = _688 * _704;
    float _708 = -_692;
    float _710 = _708 + 1.0;
    float _712 = -_696;
    float _714 = fma(_296, _712, _464);
    float _716 = -_700;
    float _718 = _716 + 1.0;
    float _720 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _722 = _678 * _720;
    float _724 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _726 = -_706;
    float _728 = fma(_672, _724, _726);
    float _730 = -_710;
    float _732 = fma(_374, _730, _634);
    float _734 = fma(_644, _718, _670);
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _738 = -_722;
    float _740 = fma(_688, _736, _738);
    float _742 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _744 = _672 * _742;
    float _746 = _728 * _728;
    float _748 = _662 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _750 = _674 * _686;
    float _752 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _754 = -_744;
    float _756 = fma(_678, _752, _754);
    float _758 = fma(_740, _740, _746);
    float _760 = _748 * _178;
    float _762 = fma(_690, 0.5, 0.5);
    bool _764 = !_328;
    int _766 = _764 ? 0 : 1;
    float _768 = fma(_750, 0.5, 0.5);
    float _770 = -_228;
    int _772 = _282 ? as_type<int>(_770) : as_type<int>(_228);
    float _774 = fma(_756, _756, _758);
    float _776 = floor(_762);
    int _778 = abs(_766);
    float _780 = fma(_760, 0.5, 0.5);
    bool _782 = !_316;
    float _784 = _782 ? _228 : as_type<float>(_772);
    float _786 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _562);
    float _788 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _646);
    float _790 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _556);
    float _792 = floor(_768);
    float _794 = _784 + (-0.5);
    float _796 = -_786;
    float _798 = _796 + 1.0;
    float _800 = float(_778);
    float _802 = -_790;
    float _804 = _802 + 1.0;
    float _806 = -_702;
    float _808 = -_788;
    float _810 = fma(_806, _794, _808);
    float _812 = -_798;
    float _814 = fma(_336, _812, _558);
    out.m_81.x = _714;
    out.m_81.y = _698;
    out.m_81.z = _732;
    out.m_81.w = _734;
    float _816 = rsqrt(_774);
    float _818 = fma(_784, _804, _810);
    float _820 = fma(_800, _612, _640);
    float _822 = -_776;
    float _824 = _762 + _822;
    float _826 = _228 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_83.x = _814;
    out.m_83.y = _818;
    float _828 = _256 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _830 = floor(_780);
    float _832 = -_792;
    float _834 = _768 + _832;
    float _836 = fma(_824, 2.0, -1.0);
    float _838 = _678 * _826;
    float _840 = _420 * _678;
    float _842 = fma(_834, 2.0, -1.0);
    float _844 = _420 * _672;
    float _846 = _728 * _816;
    float _848 = _740 * _816;
    float _850 = _672 * _826;
    float _852 = _756 * _816;
    float _854 = _420 * _688;
    float _856 = fma(_532, _846, _840);
    float _858 = fma(_848, _828, _850);
    float _860 = _672 * _846;
    float _862 = -_830;
    float _864 = _780 + _862;
    float _866 = fma(_532, _852, _854);
    float _868 = _842 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _870 = _688 * _826;
    float _872 = fma(_864, 2.0, -1.0);
    float _874 = fma(_532, _848, _844);
    float _876 = _688 * _848;
    float _878 = _678 * _852;
    float _880 = -_860;
    float _882 = fma(_678, _848, _880);
    float _884 = fma(_846, _828, _838);
    float _886 = _836 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _888 = _868 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _890 = fma(_852, _828, _870);
    float _892 = -_876;
    float _894 = fma(_672, _852, _892);
    float _896 = -_878;
    float _898 = fma(_688, _846, _896);
    float _900 = fma(_886, (*spvDescriptorSet0.vp_c12)._m0[2].x, _888);
    bool _902 = !_242;
    int _904 = _902 ? 0 : 1;
    float _906 = _894 + _884;
    float _908 = _898 + _858;
    float _910 = _882 + _890;
    float _912 = _872 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    int _914 = abs(_904);
    float _916 = _868 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _918 = _868 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    out.m_85.x = _908;
    out.m_85.y = _906;
    out.m_85.z = _910;
    float _920 = fma(_912, (*spvDescriptorSet0.vp_c12)._m0[4].x, _900);
    float _922 = fma(_886, (*spvDescriptorSet0.vp_c12)._m0[2].y, _916);
    float _924 = fma(_886, (*spvDescriptorSet0.vp_c12)._m0[2].z, _918);
    float _926 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _928 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _930 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _932 = _928 || _930;
    bool _934 = isnan(1.0);
    bool _936 = _932 || _934;
    float _938 = fma(_912, (*spvDescriptorSet0.vp_c12)._m0[4].y, _922);
    float _940 = fma(_912, (*spvDescriptorSet0.vp_c12)._m0[4].z, _924);
    float _942 = fma(_926, _898, _874);
    float _944 = fma(_926, _894, _856);
    float _946 = fma(_926, _882, _866);
    float _948 = float(_914);
    float _950 = _920 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _952 = _938 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _954 = _940 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _956 = abs(_588);
    float _958 = fma(_948, _956, _820);
    float _960 = _942 + _950;
    float _962 = _944 + _952;
    float _964 = _946 + _954;
    float _966 = _882;
    float _968 = _942;
    float _970 = _820;
    float _972 = _948;
    float _974 = _882;
    float _976 = _942;
    float _978 = _948;
    float _980 = _820;
    float _982 = _842;
    float _984 = _872;
    float _986 = _836;
    float _988 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _990 = _940;
    float _992 = _958;
    float _1002;
    float _1004;
    float _1006;
    float _1008;
    if (!_936)
    {
        bool _994 = _952 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _996 = !_994;
        _998 = _996;
        if (!_998)
        {
            float _1000 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1002 = _1000;
            _1004 = 0.0;
            _1006 = 0.0;
            _1008 = 0.0;
            _1010 = true;
        }
    }
    if ((!_1010) || _998)
    {
        bool _1046;
        if (!_998)
        {
            bool _1012 = _952 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1014 = isnan(_952);
            bool _1016 = _1012 || _1014;
            bool _1018 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1020 = _1016 || _1018;
            bool _1022 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1024 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1026 = !_1020;
            bool _1028 = _1024 && _1026;
            if (_1028)
            {
                _966 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1030 = _966;
            float _1032 = _1030;
            if (_1028)
            {
                _968 = 0.0;
            }
            float _1034 = _968;
            _976 = _1034;
            _1004 = _1034;
            if (_1028)
            {
                _970 = 0.0;
            }
            float _1036 = _970;
            _980 = _1036;
            _1006 = _1036;
            if (_1028)
            {
                float _1038 = _1030 * 5.0;
                _1032 = _1038;
            }
            float _1040 = _1032;
            _974 = _1040;
            _1002 = _1040;
            if (_1028)
            {
                _972 = 0.0;
            }
            float _1042 = _972;
            bool _1044 = !_1020;
            _1046 = _1044 && _1022;
            _978 = _1042;
            _1008 = _1042;
        }
        if ((!_1046) || _998)
        {
            _998 = false;
            float _1048 = _974;
            float _1050 = _976;
            float _1052 = _978;
            float _1054 = _980;
            bool _1056 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1058 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1060 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1062 = _1048;
            float _1064 = _1052;
            float _1066 = _1054;
            if (_1056)
            {
                float _1068 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1062 = _1068;
            }
            float _1070 = _1062;
            if (_1056)
            {
                float _1072 = abs(_836);
                float _1074 = -_1072;
                float _1076 = _1074 + 1.0;
                _1064 = _1076;
            }
            float _1078 = _1064;
            float _1080 = _1078;
            if (_1058)
            {
                float _1082 = abs(_842);
                float _1084 = -_1082;
                float _1086 = _1084 + 1.0;
                _982 = _1086;
            }
            float _1088 = _982;
            if (!_1056)
            {
                _1066 = 1.0;
            }
            float _1090 = _1066;
            float _1092 = _1090;
            if (_1060)
            {
                float _1094 = abs(_872);
                float _1096 = -_1094;
                float _1098 = _1096 + 1.0;
                _984 = _1098;
            }
            float _1100 = _984;
            if (!_1058)
            {
                _986 = 1.0;
            }
            float _1102 = _986;
            float _1104 = _1050;
            float _1106 = _1102;
            if (_1058)
            {
                float _1108 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1104 = _1108;
            }
            float _1110 = _1104;
            float _1112 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1060)
            {
                float _1114 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1112 = _1114;
            }
            float _1116 = _1112;
            if (_1056)
            {
                float _1118 = _1078 * _1070;
                float _1120 = precise::clamp(_1118, 0.0, 1.0);
                _1092 = _1120;
            }
            float _1122 = _1092;
            if (!_1060)
            {
                _1080 = 1.0;
            }
            float _1124 = _1080;
            float _1126 = _1124;
            _1002 = _964;
            if (_1058)
            {
                float _1128 = _1088 * _1110;
                float _1130 = precise::clamp(_1128, 0.0, 1.0);
                _1106 = _1130;
            }
            float _1132 = _1106;
            float _1134 = _1122 * _1132;
            _988 = _1116;
            _1004 = _960;
            _1006 = _962;
            if (_1060)
            {
                float _1136 = _1100 * _1116;
                float _1138 = precise::clamp(_1136, 0.0, 1.0);
                _1126 = _1138;
            }
            float _1140 = _1126;
            float _1142 = _1134 * _1140;
            _1008 = _1142;
        }
    }
    _1010 = false;
    float _1144 = _988;
    float _1146 = _1002;
    float _1148 = _1004;
    float _1150 = _1006;
    float _1152 = _1008;
    float _1154 = _952 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1156 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1158 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1160 = fma(_950, 6.2500002968590706586837768554688e-05, 0.5);
    float _1162 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1156);
    float _1164 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1158);
    float _1166 = fma(_954, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1162);
    float _1168 = fma(_954, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1164);
    float _1170 = _1166 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1172 = _1168 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1174 = trunc(_1170);
    int _1176 = int(_1174);
    float _1178 = trunc(_1172);
    int _1180 = int(_1178);
    int _1182 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1184 = _1176 + _1182;
    int _1186 = _1184 + 1;
    bool _1188 = _1186 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1190 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1192 = _1180 + _1190;
    int _1194 = _1192 + 1;
    int _1196 = _1186 | _1194;
    bool _1198 = _1196 < 0;
    bool _1200 = _1198 || _1188;
    bool _1202 = _1194 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1204 = _1202 || _1200;
    int _1206 = _1196;
    int _1208 = _1194;
    int _1210 = _1186;
    float _1212 = _1144;
    float _1214 = _1148;
    float _1216 = _1150;
    float _1218 = _1146;
    if (!_1204)
    {
        int _1220 = _1194 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1222 = _1220 + _1186;
        _1206 = _1222;
    }
    int _1224 = _1206;
    float _1226 = _938;
    if (!_1204)
    {
        float _1228 = floor(_1170);
        _1226 = _1228;
    }
    float _1230 = _1226;
    if (!_1204)
    {
        int _1232 = _1224 << 2;
        _1208 = _1232;
    }
    int _1234 = _1208;
    int _1236 = _1234;
    if (!_1204)
    {
        uint _1239 = uint(int(uint(_1224) >> uint(2)));
        _1210 = int(_1239);
    }
    int _1241 = _1210;
    if (!_1204)
    {
        int _1243 = 12 & _1234;
        _1236 = _1243;
    }
    int _1245 = _1236;
    float _1247 = as_type<float>(_1245);
    if (!_1204)
    {
        int _1249 = _1241 << 4;
        int _1251 = _1249 + _1245;
        _1212 = as_type<float>(_1251);
    }
    float _1253 = _1212;
    float _1255 = as_type<float>(_1241);
    if (!_1204)
    {
        float _1257 = floor(_1172);
        _1255 = _1257;
    }
    float _1259 = _1255;
    if (!_1204)
    {
        float _1261 = -_1230;
        float _1263 = _1170 + _1261;
        _990 = _1263;
    }
    float _1265 = _990;
    float _1267 = _1253;
    if (!_1204)
    {
        int _1269 = as_type<int>(_1253) + 400;
        uint _1271 = uint(int(uint(_1269) >> uint(2)));
        uint _1273 = uint(int(uint(int(_1271)) >> uint(2)));
        int _1275 = int(_1271) & 3;
        float _1277 = (*spvDescriptorSet0.vp_c15)._m0[int(_1273)][_1275];
        _1267 = _1277;
    }
    float _1279 = _1267;
    if (!_1204)
    {
        float _1281 = -_1259;
        float _1283 = _1172 + _1281;
        _1247 = _1283;
    }
    float _1285 = _1247;
    float _1287 = fma(_954, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4342 = float2(_1160, _1287);
    float _1289 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_4342, float2(0.0), isnan(_4342)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_4342, float2(0.0), isnan(_4342)), level(0.0)).x;
    float _1291 = _816;
    float _1293 = _1287;
    if (!_1204)
    {
        float _1295 = rint(_1279);
        float _1297 = precise::max(_1295, 0.0);
        uint _1299 = uint(_1297);
        uint _1301 = clamp(_1299, 0u, 65535u);
        _1291 = as_type<float>(_1301);
    }
    float _1303 = _1291;
    float _1305 = _1285;
    if (!_1204)
    {
        float3 _4378 = float3(_1265, _1285, float(as_type<int>(_1303)));
        float3 _4382 = select(_4378, float3(0.0), isnan(_4378));
        float _1307 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4382.xy, uint(rint(_4382.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4382.xy, uint(rint(_4382.z)), level(0.0)).x;
        _1305 = _1307;
    }
    float _1309 = _1305;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1313 = _1146 + _1311;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1317 = _1148 + _1315;
    float _1319 = _952 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1321 = _952 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1323 = _1313 * _1313;
    float _1325 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1319);
    float _1327 = fma(_1317, _1317, _1323);
    float _1329 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1321);
    bool _1331 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan(0.5);
    bool _1339 = _1335 || _1337;
    float _1341 = sqrt(_1327);
    bool _1343 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan(0.5);
    bool _1351 = _1347 || _1349;
    float _1353 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1325);
    float _1355 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1329);
    bool _1357 = _1341 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1359 = !_1357;
    float _1361 = _1341;
    float _1363 = _1353;
    float _1365 = _1289;
    if (!_1359)
    {
        float _1367 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1369 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1371 = _1341 + _1369;
        float _1373 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1375 = rsqrt(_1327);
        float _1377 = _1371 * _1367;
        float _1379 = _1377 * 0.15915493667125701904296875;
        float _1381 = _1379 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        float _1385 = _1379 * 6.283185482025146484375;
        float _1387 = cos(_1385);
        float _1389 = fma(_1383, _1373, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1391 = _1375 * _1389;
        float _1393 = _1387 + (-1.0);
        float _1395 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1397 = fma(_1317, _1391, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1399 = fma(_1313, _1391, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1401 = fma(_1387, _1150, _1395);
        _1214 = _1397;
        _1216 = _1401;
        _1218 = _1399;
        _1361 = _1387;
        _1293 = _1395;
    }
    float _1403 = _1214;
    float _1405 = _1216;
    float _1407 = _1218;
    float _1409 = _1361;
    float _1411 = _1293;
    float _1413 = _1353 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1415 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1417 = _1411;
    float _1419 = _1409;
    float _1421 = _1415;
    if (_1339)
    {
        _1417 = _1403;
    }
    float _1423 = _1417;
    float _1425 = _1423;
    if (_1339)
    {
        _1419 = _1405;
    }
    float _1427 = _1419;
    float _1429 = _1427;
    if (_1339)
    {
        _1363 = _1407;
    }
    float _1431 = _1363;
    float _1433 = _1431;
    if (!_1339)
    {
        float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1437 = _952 + _1435;
        float _1439 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1441 = _950 + _1439;
        float _1443 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1445 = -_952;
        float _1447 = _1445 + _1405;
        float _1449 = _1437 * _1437;
        float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1453 = _954 + _1451;
        float _1455 = -_950;
        float _1457 = _1455 + _1403;
        float _1459 = fma(_1441, _1441, _1449);
        float _1461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1463 = fma(_1453, _1453, _1459);
        float _1465 = sqrt(_1463);
        float _1467 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1469 = -_954;
        float _1471 = _1469 + _1407;
        float _1473 = precise::min(_1465, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1475 = _1473 * _1461;
        float _1477 = _1467 * _1475;
        float _1479 = fma(_1447, _1477, _952);
        float _1481 = fma(_1457, _1477, _950);
        float _1483 = fma(_1471, _1477, _954);
        _1429 = _1479;
        _1425 = _1481;
        _1433 = _1483;
    }
    float _1485 = _1429;
    float _1487 = _1425;
    float _1489 = _1433;
    float _1491 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1493 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1495 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1497 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1499 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1491);
    float _1501 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1493);
    float _1503 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1495);
    float _1505 = 1.0 / _1415;
    float _1507 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1499);
    float _1509 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1501);
    float _1511 = _1413 + _1415;
    float _1513 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1497);
    float _1515 = _1507 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1517 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1503);
    float _1519 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1521 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1513);
    float _1523 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1525 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1527 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1529 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1531 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1533 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1523);
    float _1535 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1525);
    float _1537 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1527);
    float _1539 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1529);
    float _1541 = _1521 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1543 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1533);
    float _1545 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1535);
    float _1547 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1537);
    float _1549 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1539);
    float _1551 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1543);
    float _1553 = _1511 * _1505;
    float _1555 = _1553 * 0.5;
    float _1557 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1545);
    float _1559 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1547);
    float _1561 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1549);
    float _1563 = _1535;
    float _1565 = _1551;
    float _1567 = _1557;
    if (_1351)
    {
        _1563 = 1.0;
    }
    float _1569 = _1563;
    float _1571 = _1569;
    if (!_1351)
    {
        float _1573 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1575 = _1573 * 0.15915493667125701904296875;
        float _1577 = _1575 * 6.283185482025146484375;
        float _1579 = cos(_1577);
        float _1581 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1583 = _1581 * 0.15915493667125701904296875;
        float _1585 = _1575 * 6.283185482025146484375;
        float _1587 = sin(_1585);
        float _1589 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1591 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1589);
        float _1593 = 1.0 / _1579;
        float _1595 = _1583 * 6.283185482025146484375;
        float _1597 = cos(_1595);
        float _1599 = _1587 * _1593;
        float _1601 = 1.0 / _1591;
        float _1603 = _1597 * _1599;
        float _1605 = _1583 * 6.283185482025146484375;
        float _1607 = sin(_1605);
        float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1611 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1609;
        float _1613 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1615 = _1601 * _1613;
        float _1617 = 1.0 / _1603;
        float _1619 = 1.0 / _1611;
        float _1621 = _1607 * _1617;
        float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1625 = fma(_1621, _1615, _1623);
        float _1627 = _1625 * _1619;
        float _1629 = precise::clamp(_1627, 0.0, 1.0);
        _1421 = _1615;
        _1571 = _1629;
    }
    float _1631 = _1421;
    float _1633 = _1571;
    float _1635 = abs(_1289);
    bool _1637 = _1635 != 0.0;
    bool _1639 = isnan(_1635);
    bool _1641 = _1637 || _1639;
    bool _1643 = isnan(0.0);
    bool _1645 = _1641 || _1643;
    out.gl_Position.x = _1551;
    out.gl_Position.y = _1557;
    out.gl_Position.z = _1559;
    out.gl_Position.w = _1561;
    bool _1647 = _146 > 0.001000000047497451305389404296875;
    bool _1649 = isnan(_146);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan(0.001000000047497451305389404296875);
    bool _1655 = _1651 || _1653;
    float _1657 = _1631;
    if (!_1645)
    {
        out.gl_Position.w = 0.0;
    }
    if (_1645)
    {
        _1365 = _1561;
    }
    float _1659 = _1365;
    float _1661 = _1659;
    if (!_1645)
    {
        _1661 = 0.0;
    }
    float _1663 = _1661;
    if (_1204)
    {
        _148 = _1663;
    }
    float _1665 = _148;
    float _1667 = _1665;
    float _1669 = _1665;
    if (!_1204)
    {
        int _1671 = _1224 << 4;
        int _1673 = _1671 + 2048;
        uint _1675 = uint(int(uint(_1673) >> uint(2)));
        uint _1677 = uint(int(uint(int(_1675)) >> uint(2)));
        int _1679 = int(_1675) & 3;
        float _1681 = (*spvDescriptorSet0.vp_c15)._m0[int(_1677)][_1679];
        int _1683 = int(_1675) + 1;
        uint _1685 = uint(int(uint(_1683) >> uint(2)));
        int _1687 = _1683 & 3;
        float _1689 = (*spvDescriptorSet0.vp_c15)._m0[int(_1685)][_1687];
        int _1691 = _1673 + 8;
        uint _1693 = uint(int(uint(_1691) >> uint(2)));
        uint _1695 = uint(int(uint(int(_1693)) >> uint(2)));
        int _1697 = int(_1693) & 3;
        float _1699 = (*spvDescriptorSet0.vp_c15)._m0[int(_1695)][_1697];
        int _1701 = int(_1693) + 1;
        uint _1703 = uint(int(uint(_1701) >> uint(2)));
        int _1705 = _1701 & 3;
        float _1707 = (*spvDescriptorSet0.vp_c15)._m0[int(_1703)][_1705];
        float _1709 = _1154 * _1689;
        float _1711 = fma(_950, _1681, _1709);
        float _1713 = fma(_954, _1699, _1711);
        float _1715 = _1713 + _1707;
        float _1717 = precise::clamp(_1715, 0.0, 1.0);
        float _1719 = -_1717;
        float _1721 = _1719 + _1309;
        float _1723 = fma(_1721, 500.0, 1.5);
        float _1725 = exp2(_1723);
        float _1727 = 0.0 + _1725;
        float _1729 = precise::clamp(_1727, 0.0, 1.0);
        bool _1731 = _1729 >= 1.0;
        bool _1733 = isnan(_1729);
        bool _1735 = _1731 || _1733;
        bool _1737 = isnan(1.0);
        bool _1739 = _1735 || _1737;
        _1657 = _1699;
        if (!_1739)
        {
            out.gl_Position.w = 0.0;
        }
        if (_1739)
        {
            _1667 = _1663;
        }
        float _1741 = _1667;
        _1669 = _1741;
        if (!_1739)
        {
            _1669 = 0.0;
        }
    }
    float _1743 = _1657;
    float _1745 = _1669;
    float _1747 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1749 = _1485 + _1747;
    float _1751 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1753 = _1487 + _1751;
    float _1755 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1757 = _1489 + _1755;
    float _1759 = _1531 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1761 = _1749 * _1749;
    float _1763 = _1743;
    float _1765 = _1749;
    if (!_1655)
    {
        _1565 = 0.0;
        _1567 = 0.0;
    }
    float _1767 = _1565;
    float _1769 = _1567;
    float _1771 = fma(_1753, _1753, _1761);
    float _1773 = fma(_1757, _1757, _1771);
    float _1775 = rsqrt(_1773);
    float _1777 = _1775 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1779 = _1753 * _1777;
    float _1781 = _1757 * _1777;
    float _1783 = _1779 * _1779;
    float _1785 = _1781 * _1781;
    float _1787 = _1783 + _1785;
    float _1789 = sqrt(_1787);
    bool _1791 = _1789 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1795 = _1789 + _1793;
    float _1797 = _1757;
    float _1799 = _1787;
    float _1801 = _1795;
    float _1803 = _1779;
    if (_1791)
    {
        float _1805 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1797 = _1805;
    }
    float _1807 = _1797;
    if (_1791)
    {
        float _1809 = rsqrt(_1787);
        _1799 = _1809;
    }
    float _1811 = _1799;
    if (_1791)
    {
        float _1813 = _1795 * _1807;
        _1801 = _1813;
    }
    float _1815 = _1801;
    if (_1791)
    {
        float _1817 = _1815 * 0.15915493667125701904296875;
        _1763 = _1817;
    }
    float _1819 = _1763;
    float _1821 = _1775;
    float _1823 = _1819;
    if (_1791)
    {
        float _1825 = _1819 * 6.283185482025146484375;
        float _1827 = sin(_1825);
        _1821 = _1827;
    }
    float _1829 = _1821;
    float _1831 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1833 = precise::max(0.0, _1831);
    float _1835 = _1663;
    float _1837 = _1833;
    float _1839 = _1831;
    if (_1791)
    {
        float _1841 = _1819 * 6.283185482025146484375;
        float _1843 = cos(_1841);
        _1835 = _1843;
    }
    float _1845 = _1835;
    float _1847 = -_1777;
    float _1849 = -_1833;
    float _1851 = fma(_1749, _1847, _1849);
    if (!_1791)
    {
        _1765 = _1785;
    }
    float _1853 = _1765;
    float _1855 = _1853;
    if (_1791)
    {
        float _1857 = _1851 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1837 = _1857;
    }
    float _1859 = _1837;
    float _1861 = _1859;
    float _1863 = _1829;
    if (_1791)
    {
        float _1865 = fma(_1829, _1859, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1861 = _1865;
    }
    float _1867 = _1861;
    float _1869 = _1867;
    if (!_1791)
    {
        _1863 = _1851;
    }
    float _1871 = _1863;
    float _1873 = _1871;
    float _1875 = _1845;
    if (_1791)
    {
        float _1877 = _1845 + (-1.0);
        _1839 = _1877;
    }
    float _1879 = _1839;
    float _1881 = _1879;
    if (_1791)
    {
        float _1883 = _1811 * _1867;
        _1823 = _1883;
    }
    float _1885 = _1823;
    if (!_1791)
    {
        _1869 = _1781;
    }
    float _1887 = _1869;
    float _1889 = _1887;
    if (_1791)
    {
        float _1891 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1881 = _1891;
    }
    float _1893 = _1881;
    if (_1791)
    {
        float _1895 = _1779 * _1885;
        _1803 = _1895;
    }
    float _1897 = _1803;
    if (_1791)
    {
        float _1899 = _1781 * _1885;
        _1889 = _1899;
    }
    float _1901 = _1889;
    if (_1791)
    {
        float _1903 = fma(_1851, _1845, _1893);
        _1873 = _1903;
    }
    float _1905 = _1873;
    if (!_1791)
    {
        _1875 = _1783;
    }
    float _1907 = _1875;
    float _1909 = _1907;
    if (_1791)
    {
        float _1911 = _1897 * _1897;
        _1909 = _1911;
    }
    float _1913 = _1909;
    float _1915 = sqrt(_1773);
    if (_1791)
    {
        float _1917 = _1901 * _1901;
        _1855 = _1917;
    }
    float _1919 = _1855;
    float _1921 = fma(_1905, _1905, _1913);
    float _1923 = _1921 + _1919;
    float _1925 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1927 = rsqrt(_1923);
    float _1929 = -_1759;
    float _1931 = fma(_1929, _1925, 1.0);
    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1935 = fma(_1915, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1933);
    float _1937 = precise::clamp(_1935, 0.0, 1.0);
    float _1939 = log2(_1931);
    float _1941 = -_1937;
    float _1943 = _1941 + 1.0;
    float _1945 = abs(_1943);
    float _1947 = log2(_1945);
    float _1949 = _1927 * _1897;
    float _1951 = _1927 * _1905;
    float _1953 = _1927 * _1901;
    float _1955 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1957 = 1.0 / _1745;
    float _1959 = -_1955;
    float _1961 = fma(_1951, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1959);
    float _1963 = -_1953;
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1961);
    float _1967 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1969 = fma(_1965, -0.5, 0.5);
    float _1971 = fma(_1965, 0.5, 0.5);
    float _1973 = _1939 * 0.693147182464599609375;
    float _1975 = _1951 + 1.0;
    float _1977 = exp2(_1967);
    float _1979 = fma(_1971, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1981 = _1957 * _1767;
    float _1983 = _1957 * _1769;
    float _1985 = fma(_1971, _1979, -0.212114393711090087890625);
    float _1987 = fma(_1981, 0.5, 0.5);
    float _1989 = fma(_1983, -0.5, 0.5);
    float _1991 = sqrt(_1969);
    float _1993 = fma(_1971, _1985, 1.570728778839111328125);
    float _1995 = _1973 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1997 = -_1951;
    float _1999 = fma(_1977, _1975, _1997);
    float _2001 = fma(_1999, 0.5, 0.5);
    float _2003 = _1991 * 0.636619746685028076171875;
    float _2005 = -_1993;
    float _2007 = fma(_2003, _2005, 1.0);
    float3 _5495 = float3(_1987, _1989, _1995);
    float _2009 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5495, float3(0.0), isnan(_5495)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5495, float3(0.0), isnan(_5495)), level(0.0)).x;
    float3 _5504 = float3(_1987, _1989, _1995);
    float4 _2012 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5504, float3(0.0), isnan(_5504)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5504, float3(0.0), isnan(_5504)), level(0.0)).xyzw;
    float _2014 = _2012.x;
    float _2016 = _2012.y;
    float _2018 = _2012.z;
    float _2020 = _2012.w;
    float2 _5520 = float2(_2007, _2001);
    float3 _2024 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5520, float2(0.0), isnan(_5520)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5520, float2(0.0), isnan(_5520)), level(0.0)).xyz;
    float _2026 = _2024.x;
    float _2028 = _2024.y;
    float _2030 = _2024.z;
    float _2032 = _1152 * _1633;
    float _2034 = _1559 + _1561;
    bool _2036 = _1915 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2038 = isnan(_1915);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2044 = _2040 || _2042;
    float _2046 = _2032 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2048 = _2034 * 0.5;
    float _2050 = _958 * _2046;
    float _2052 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_87.z = _2048;
    out.m_87.w = _1561;
    if (!_1655)
    {
        _992 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2054 = _992;
    float _2056 = exp2(_2052);
    int _2058 = as_type<int>(_2054);
    float _2060 = 0.0;
    float _2062 = 0.0;
    if (!_1655)
    {
        float _2064 = _2054 * 5.0;
        _2058 = as_type<int>(_2064);
    }
    int _2066 = _2058;
    float _2068 = as_type<float>(_2066);
    if (!_1655)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5599 = as_type<float>(_2066);
        out.gl_Position.z = _5599;
    }
    float _2070 = -_2056;
    float _2072 = _2070 + 1.0;
    float _2074 = _2056;
    if (_1655)
    {
        _2074 = _2050;
    }
    float _2076 = _2074;
    float _2078 = _2076;
    if (!_1655)
    {
        _2078 = 0.0;
    }
    float _2080 = _2078;
    float _2082 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2044)
    {
        _2068 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2084 = _2068;
    float _2086 = _2084;
    float _2088 = _2084;
    if (!_2044)
    {
        _2060 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2090 = _2060;
    float _2092 = _2090;
    float _2094 = _2090;
    if (!_2044)
    {
        _2062 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2096 = _2062;
    float _2098 = _2082 * _2009;
    float _2100 = -_2082;
    float _2102 = _2100 + 1.0;
    float _2104 = _2020 * _2098;
    float _2106 = _2030 * _2098;
    float _2108 = _2020 * _2102;
    float _2110 = fma(_2026, _2104, _2014);
    float _2112 = fma(_2028, _2104, _2016);
    float _2114 = fma(_2020, _2106, _2018);
    out.m_89.x = _2110;
    out.m_89.y = _2112;
    out.m_89.z = _2114;
    out.m_89.w = _2108;
    bool _2116 = !_2044;
    float _2118 = _2096;
    float _2120 = _2096;
    if (!_2116)
    {
        bool _2122 = _1915 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2124 = isnan(_1915);
        bool _2126 = _2122 || _2124;
        bool _2128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2130 = _2126 || _2128;
        if (!_2130)
        {
            float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2134 = _1915 + _2132;
            float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2138 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2136;
            float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2146 = _2144 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2148 = 1.0 / _2138;
            float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2152 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2154 = _2134 * _2148;
            float _2156 = precise::clamp(_2154, 0.0, 1.0);
            float _2158 = fma(_2156, _2142, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2160 = fma(_2156, _2146, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2162 = fma(_2156, _2152, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2094 = _2160;
            _2088 = _2158;
            _2120 = _2162;
            _2164 = true;
        }
        else
        {
            bool _2166 = _1915 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2168 = isnan(_1915);
            bool _2170 = _2166 || _2168;
            bool _2172 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2174 = _2170 || _2172;
            if (!_2174)
            {
                _2086 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2176 = _2086;
            _2088 = _2176;
            if (!_2174)
            {
                _2092 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2178 = _2092;
            _2094 = _2178;
            if (!_2174)
            {
                _2118 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2180 = _2118;
            bool _2182 = !_2174;
            _2120 = _2180;
            if (!_2182)
            {
                bool _2184 = _1915 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2186 = isnan(_1915);
                bool _2188 = _2184 || _2186;
                bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2192 = _2188 || _2190;
                if (!_2192)
                {
                    float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2196 = _1915 + _2194;
                    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2200 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2198;
                    float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2204 = _2202 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2206 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2208 = _2206 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2210 = 1.0 / _2200;
                    float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2214 = _2212 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2216 = _2196 * _2210;
                    float _2218 = precise::clamp(_2216, 0.0, 1.0);
                    float _2220 = fma(_2218, _2204, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2222 = fma(_2218, _2208, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2224 = fma(_2218, _2214, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2094 = _2222;
                    _2088 = _2220;
                    _2120 = _2224;
                    _2164 = true;
                }
                else
                {
                    _2094 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2088 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2120 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2164 = false;
    float _2226 = _2094;
    float _2228 = _2088;
    float _2230 = _2120;
    float _2232 = _2080 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _2234 = _2226 * 0.586610972881317138671875;
    bool _2236 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_58.x = _2232;
    float _2238 = fma(_2228, 0.298911988735198974609375, _2234);
    bool _2240 = _1633 > 0.0;
    bool _2242 = isnan(_1633);
    bool _2244 = _2240 || _2242;
    bool _2246 = isnan(0.0);
    bool _2248 = _2244 || _2246;
    float _2250 = fma(_2230, 0.114477999508380889892578125, _2238);
    float _2252 = -_2250;
    float _2254 = _2252 + _2228;
    float _2256 = -_2250;
    float _2258 = _2256 + _2226;
    float _2260 = -_2250;
    float _2262 = _2260 + _2230;
    float _2264 = fma(_2254, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2250);
    float _2266 = fma(_2258, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2250);
    float _2268 = fma(_2262, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2250);
    bool _2270 = !_2236;
    if (!_2270)
    {
        float _2272 = -_1485;
        float _2274 = _2272 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2276 = -_1487;
        float _2278 = _2276 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2280 = -_1489;
        float _2282 = _2280 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2284 = _2274 * _2274;
        float _2286 = fma(_2278, _2278, _2284);
        float _2288 = fma(_2282, _2282, _2286);
        float _2290 = sqrt(_2288);
        float _2292 = rsqrt(_2288);
        float _2294 = -_2290;
        float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2298 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2300 = precise::clamp(_2298, 0.0, 1.0);
        float _2302 = _2278 * _2292;
        float _2304 = _2274 * _2292;
        float _2306 = abs(_2300);
        float _2308 = log2(_2306);
        float _2310 = _2282 * _2292;
        float _2312 = _2302 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2314 = _906 * _2304;
        float _2316 = -_2304;
        float _2318 = -_2312;
        float _2320 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2318);
        float _2322 = fma(_908, _2302, _2314);
        float _2324 = -_2310;
        float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2320);
        float _2328 = fma(_910, _2310, _2322);
        float _2330 = precise::clamp(_2328, 0.0, 1.0);
        float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2334 = _2326 + _2332;
        float _2336 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2338 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2340 = precise::clamp(_2338, 0.0, 1.0);
        float _2342 = exp2(_2336);
        float _2344 = _2342 * _2340;
        float _2346 = _2330 * _2344;
        float _2348 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2350 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2352 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2348;
        out.m_91.y = _2350;
        out.m_91.z = _2352;
    }
    out.m_93.x = _2264;
    out.m_93.y = _2266;
    out.m_93.z = _2268;
    if (_2248)
    {
        return out;
    }
    out.m_58.x = 0.0;
    float _2354 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2354;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2164 = false;
    bool _1010 = false;
    bool _998 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_55.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    float _120 = as_type<float>(_112);
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _118;
    if (!_116)
    {
        out.m_58.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2412 = as_type<float>(_128);
        out.gl_Position.z = _2412;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_60.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _120 = _150;
    }
    float _152 = _120;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_58.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2482 = as_type<float>(_166);
        out.gl_Position.z = _2482;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = as_type<float>(int(gl_VertexIndex));
    float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _172 = _146 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _174 = in.m_65.x;
    float _176 = in.m_65.y;
    float _178 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _180 = in.m_65.z;
    float _182 = in.m_65.w;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _186 = in.m_67.x;
    float _188 = in.m_67.y;
    float _190 = in.m_67.z;
    float _192 = _172 * _170;
    float _194 = _184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _196 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _198 = in.m_69.x;
    float _200 = in.m_69.y;
    float _202 = in.m_69.z;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _206 = _196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _208 = as_type<int>(_168) & 1;
    bool _210 = _208 != 0;
    int _212 = as_type<int>(_168) & 2;
    bool _214 = _212 != 0;
    float _216 = in.m_71.x;
    float _218 = in.m_71.y;
    float _220 = in.m_71.z;
    float _222 = _204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _224 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[20].x, _192);
    bool _226 = !_214;
    float _228 = _226 ? (-0.5) : 0.5;
    float _230 = in.m_55.x;
    float _232 = in.m_55.y;
    float _234 = in.m_55.z;
    int _236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _238 = _236 != 0;
    int _240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _242 = _240 != 0;
    float _244 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _246 = _174 > 0.5;
    float _248 = in.m_73.x;
    float _250 = in.m_73.y;
    float _252 = in.m_73.z;
    bool _254 = !_210;
    float _256 = _254 ? (-0.5) : 0.5;
    bool _258 = _176 > 0.5;
    int _260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _262 = _260 != 0;
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _266 = _264 != 0;
    float _268 = -_256;
    int _270 = _246 ? as_type<int>(_268) : as_type<int>(_256);
    float _272 = _188 * _200;
    float _274 = -_228;
    int _276 = _258 ? as_type<int>(_274) : as_type<int>(_228);
    bool _278 = !_238;
    int _280 = _278 ? 0 : 1;
    bool _282 = _180 > 0.5;
    float _284 = _188 * _218;
    int _286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _288 = _286 != 0;
    bool _290 = _176 > 0.5;
    float _292 = _200 * _232;
    bool _294 = !_262;
    float _296 = _294 ? _256 : as_type<float>(_270);
    float _298 = _218 * _232;
    bool _300 = !_266;
    float _302 = _300 ? _228 : as_type<float>(_276);
    float _304 = _188 * _250;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _308 = _306 != 0;
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _312 = _310 != 0;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _316 = _314 != 0;
    float _318 = _250 * _232;
    float _320 = -_256;
    int _322 = _290 ? as_type<int>(_320) : as_type<int>(_256);
    float _324 = fma(_186, _198, _272);
    int _326 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _328 = _326 != 0;
    float _330 = fma(_198, _230, _292);
    float _332 = fma(_186, _216, _284);
    bool _334 = !_312;
    float _336 = _334 ? _256 : as_type<float>(_322);
    float _338 = fma(_186, _248, _304);
    int _340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _342 = _340 != 0;
    float _344 = in.m_75.x;
    float _346 = in.m_75.y;
    float _348 = fma(_248, _230, _318);
    float _350 = fma(_190, _202, _324);
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _354 = -_256;
    int _356 = _282 ? as_type<int>(_354) : as_type<int>(_256);
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _360 = fma(_216, _230, _298);
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _364 = _352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _366 = _358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _368 = fma(_190, _220, _332);
    float _370 = fma(_190, _252, _338);
    bool _372 = !_288;
    float _374 = _372 ? _256 : as_type<float>(_356);
    out.m_77.x = _364;
    out.m_77.y = _366;
    out.m_77.z = _194;
    out.m_77.w = _362;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _378 = _182 > 0.5;
    float _380 = in.m_71.w;
    float _382 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _384 = fma(_202, _234, _330);
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _388 = in.m_69.w;
    float _390 = -_376;
    float _392 = fma(_382, 2.0, _390);
    float _394 = _346 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _398 = _386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _400 = fma(_220, _234, _360);
    float _402 = _344 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _406 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _228);
    float _408 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    out.m_79.x = _206;
    out.m_79.y = _398;
    out.m_79.z = _222;
    float _410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _412 = _332;
    float _414 = _234;
    float _416 = _176;
    if (_342)
    {
        _412 = _174;
    }
    float _418 = _412;
    float _420 = _408 * _406;
    float _422 = _406;
    float _424 = _418;
    if (!_342)
    {
        float _426 = in.m_65.z;
        _422 = _426;
    }
    float _428 = _422;
    if (!_342)
    {
        _424 = _180;
    }
    float _430 = _424;
    float _432 = fma(_252, _234, _348);
    if (!_342)
    {
        _414 = _176;
    }
    float _434 = _414;
    float _436 = _400 + _380;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _440 = floor(_224);
    float _442 = _384 + _388;
    float _444 = _430 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _448 = in.m_73.w;
    float _450 = _396 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _452 = -_146;
    float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[76].x, _392);
    float _456 = _296 + 0.5;
    float _458 = fma(_244, -2.0, _438);
    float _460 = -_446;
    float _462 = fma(_444, 2.0, _460);
    float _464 = fma(_450, _456, _454);
    float _466 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _458);
    float _468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _470 = -(*spvDescriptorSet0.vp_c11)._m0[19].z;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c15)._m0[639].y, _368);
    float _474 = -_440;
    float _476 = _224 + _474;
    float _478 = _410 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _480 = _302 + (-0.5);
    float _482 = _434;
    if (_342)
    {
        _482 = _174;
    }
    float _484 = _482;
    float _486 = _224 * 6.283185482025146484375;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _490 = -_478;
    float _492 = -_466;
    float _494 = fma(_490, _480, _492);
    float _496 = _486 * 0.15915493667125701904296875;
    float _498 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[83].z, _488);
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _502 = _484 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _504 = _484;
    float _506 = _428;
    if (!_342)
    {
        _504 = _428;
    }
    float _508 = _504;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _512 = _508;
    if (_342)
    {
        _506 = _176;
    }
    float _514 = _506;
    float _516 = -_500;
    float _518 = fma(_502, 2.0, _516);
    float _520 = _496 * 6.283185482025146484375;
    float _522 = cos(_520);
    float _524 = _402 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _526 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _256);
    float _528 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[83].w, _510);
    float _530 = _468 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _532 = _524 * _526;
    float _534 = _432 + _448;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _538 = -_146;
    float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[86].x, _462);
    if (_342)
    {
        _512 = _176;
    }
    float _542 = _512;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _546 = _336 + 0.5;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _550 = _542 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _552 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].w, _544);
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _556 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].w, _404);
    float _558 = fma(_530, _546, _540);
    float _560 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _548);
    float _562 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _536);
    if (!_342)
    {
        _416 = _174;
    }
    float _564 = _416;
    float _566 = fma(_522, 0.5, 0.5);
    bool _568 = _476 < 0.5;
    float _570 = float(_568);
    float _572 = -_476;
    float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _576 = fma(_550, -2.0, _554);
    float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _580 = _436 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _582 = _442 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _584 = _472 * _472;
    float _586 = -_570;
    float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _590 = _580 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _592 = _580 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _594 = fma(_350, _350, _584);
    float _596 = _580 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _598 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[6].z, _590);
    float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _602 = fma(_370, _370, _594);
    float _604 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[6].x, _592);
    float _606 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[6].y, _596);
    int _608 = abs(_280);
    float _610 = -_566;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _614 = _578 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _616 = rsqrt(_602);
    float _618 = _374 + 0.5;
    float _620 = float(_608);
    float _622 = -_146;
    float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[81].x, _518);
    float _626 = -_228;
    int _628 = _378 ? as_type<int>(_626) : as_type<int>(_228);
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _632 = _564 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _634 = fma(_614, _618, _624);
    float _636 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _638 = abs(_574);
    float _640 = _620 * _638;
    bool _642 = !_308;
    float _644 = _642 ? _228 : as_type<float>(_628);
    float _646 = fma(_632, -2.0, _630);
    float _648 = _534 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _650 = _600 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _652 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _576);
    float _654 = _644 + (-0.5);
    float _656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _658 = fma(_648, (*spvDescriptorSet0.vp_c12)._m0[8].y, _606);
    float _660 = fma(_648, (*spvDescriptorSet0.vp_c12)._m0[8].x, _604);
    float _662 = fma(_648, (*spvDescriptorSet0.vp_c12)._m0[8].z, _598);
    float _664 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _552);
    float _666 = -_650;
    float _668 = -_652;
    float _670 = fma(_666, _654, _668);
    float _672 = _350 * _616;
    float _674 = _658 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _676 = _660 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _678 = _472 * _616;
    float _680 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _560);
    float _682 = -_664;
    float _684 = _682 + 1.0;
    float _686 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _688 = _370 * _616;
    float _690 = _676 * _636;
    float _692 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _498);
    float _694 = -_680;
    float _696 = _694 + 1.0;
    float _698 = fma(_302, _684, _494);
    float _700 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _528);
    float _702 = _656 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _704 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _706 = _688 * _704;
    float _708 = -_692;
    float _710 = _708 + 1.0;
    float _712 = -_696;
    float _714 = fma(_296, _712, _464);
    float _716 = -_700;
    float _718 = _716 + 1.0;
    float _720 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _722 = _678 * _720;
    float _724 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _726 = -_706;
    float _728 = fma(_672, _724, _726);
    float _730 = -_710;
    float _732 = fma(_374, _730, _634);
    float _734 = fma(_644, _718, _670);
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _738 = -_722;
    float _740 = fma(_688, _736, _738);
    float _742 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _744 = _672 * _742;
    float _746 = _728 * _728;
    float _748 = _662 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _750 = _674 * _686;
    float _752 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _754 = -_744;
    float _756 = fma(_678, _752, _754);
    float _758 = fma(_740, _740, _746);
    float _760 = _748 * _178;
    float _762 = fma(_690, 0.5, 0.5);
    bool _764 = !_328;
    int _766 = _764 ? 0 : 1;
    float _768 = fma(_750, 0.5, 0.5);
    float _770 = -_228;
    int _772 = _282 ? as_type<int>(_770) : as_type<int>(_228);
    float _774 = fma(_756, _756, _758);
    float _776 = floor(_762);
    int _778 = abs(_766);
    float _780 = fma(_760, 0.5, 0.5);
    bool _782 = !_316;
    float _784 = _782 ? _228 : as_type<float>(_772);
    float _786 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _562);
    float _788 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _646);
    float _790 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _556);
    float _792 = floor(_768);
    float _794 = _784 + (-0.5);
    float _796 = -_786;
    float _798 = _796 + 1.0;
    float _800 = float(_778);
    float _802 = -_790;
    float _804 = _802 + 1.0;
    float _806 = -_702;
    float _808 = -_788;
    float _810 = fma(_806, _794, _808);
    float _812 = -_798;
    float _814 = fma(_336, _812, _558);
    out.m_81.x = _714;
    out.m_81.y = _698;
    out.m_81.z = _732;
    out.m_81.w = _734;
    float _816 = rsqrt(_774);
    float _818 = fma(_784, _804, _810);
    float _820 = fma(_800, _612, _640);
    float _822 = -_776;
    float _824 = _762 + _822;
    float _826 = _228 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_83.x = _814;
    out.m_83.y = _818;
    float _828 = _256 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _830 = floor(_780);
    float _832 = -_792;
    float _834 = _768 + _832;
    float _836 = fma(_824, 2.0, -1.0);
    float _838 = _678 * _826;
    float _840 = _420 * _678;
    float _842 = fma(_834, 2.0, -1.0);
    float _844 = _420 * _672;
    float _846 = _728 * _816;
    float _848 = _740 * _816;
    float _850 = _672 * _826;
    float _852 = _756 * _816;
    float _854 = _420 * _688;
    float _856 = fma(_532, _846, _840);
    float _858 = fma(_848, _828, _850);
    float _860 = _672 * _846;
    float _862 = -_830;
    float _864 = _780 + _862;
    float _866 = fma(_532, _852, _854);
    float _868 = _842 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _870 = _688 * _826;
    float _872 = fma(_864, 2.0, -1.0);
    float _874 = fma(_532, _848, _844);
    float _876 = _688 * _848;
    float _878 = _678 * _852;
    float _880 = -_860;
    float _882 = fma(_678, _848, _880);
    float _884 = fma(_846, _828, _838);
    float _886 = _836 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _888 = _868 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _890 = fma(_852, _828, _870);
    float _892 = -_876;
    float _894 = fma(_672, _852, _892);
    float _896 = -_878;
    float _898 = fma(_688, _846, _896);
    float _900 = fma(_886, (*spvDescriptorSet0.vp_c12)._m0[2].x, _888);
    bool _902 = !_242;
    int _904 = _902 ? 0 : 1;
    float _906 = _894 + _884;
    float _908 = _898 + _858;
    float _910 = _882 + _890;
    float _912 = _872 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    int _914 = abs(_904);
    float _916 = _868 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _918 = _868 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    out.m_85.x = _908;
    out.m_85.y = _906;
    out.m_85.z = _910;
    float _920 = fma(_912, (*spvDescriptorSet0.vp_c12)._m0[4].x, _900);
    float _922 = fma(_886, (*spvDescriptorSet0.vp_c12)._m0[2].y, _916);
    float _924 = fma(_886, (*spvDescriptorSet0.vp_c12)._m0[2].z, _918);
    float _926 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _928 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _930 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _932 = _928 || _930;
    bool _934 = isnan(1.0);
    bool _936 = _932 || _934;
    float _938 = fma(_912, (*spvDescriptorSet0.vp_c12)._m0[4].y, _922);
    float _940 = fma(_912, (*spvDescriptorSet0.vp_c12)._m0[4].z, _924);
    float _942 = fma(_926, _898, _874);
    float _944 = fma(_926, _894, _856);
    float _946 = fma(_926, _882, _866);
    float _948 = float(_914);
    float _950 = _920 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _952 = _938 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _954 = _940 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _956 = abs(_588);
    float _958 = fma(_948, _956, _820);
    float _960 = _942 + _950;
    float _962 = _944 + _952;
    float _964 = _946 + _954;
    float _966 = _882;
    float _968 = _942;
    float _970 = _820;
    float _972 = _948;
    float _974 = _882;
    float _976 = _942;
    float _978 = _948;
    float _980 = _820;
    float _982 = _842;
    float _984 = _872;
    float _986 = _836;
    float _988 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _990 = _940;
    float _992 = _958;
    float _1002;
    float _1004;
    float _1006;
    float _1008;
    if (!_936)
    {
        bool _994 = _952 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _996 = !_994;
        _998 = _996;
        if (!_998)
        {
            float _1000 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1002 = _1000;
            _1004 = 0.0;
            _1006 = 0.0;
            _1008 = 0.0;
            _1010 = true;
        }
    }
    if ((!_1010) || _998)
    {
        bool _1046;
        if (!_998)
        {
            bool _1012 = _952 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1014 = isnan(_952);
            bool _1016 = _1012 || _1014;
            bool _1018 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1020 = _1016 || _1018;
            bool _1022 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1024 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1026 = !_1020;
            bool _1028 = _1024 && _1026;
            if (_1028)
            {
                _966 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1030 = _966;
            float _1032 = _1030;
            if (_1028)
            {
                _968 = 0.0;
            }
            float _1034 = _968;
            _976 = _1034;
            _1004 = _1034;
            if (_1028)
            {
                _970 = 0.0;
            }
            float _1036 = _970;
            _980 = _1036;
            _1006 = _1036;
            if (_1028)
            {
                float _1038 = _1030 * 5.0;
                _1032 = _1038;
            }
            float _1040 = _1032;
            _974 = _1040;
            _1002 = _1040;
            if (_1028)
            {
                _972 = 0.0;
            }
            float _1042 = _972;
            bool _1044 = !_1020;
            _1046 = _1044 && _1022;
            _978 = _1042;
            _1008 = _1042;
        }
        if ((!_1046) || _998)
        {
            _998 = false;
            float _1048 = _974;
            float _1050 = _976;
            float _1052 = _978;
            float _1054 = _980;
            bool _1056 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1058 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1060 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1062 = _1048;
            float _1064 = _1052;
            float _1066 = _1054;
            if (_1056)
            {
                float _1068 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1062 = _1068;
            }
            float _1070 = _1062;
            if (_1056)
            {
                float _1072 = abs(_836);
                float _1074 = -_1072;
                float _1076 = _1074 + 1.0;
                _1064 = _1076;
            }
            float _1078 = _1064;
            float _1080 = _1078;
            if (_1058)
            {
                float _1082 = abs(_842);
                float _1084 = -_1082;
                float _1086 = _1084 + 1.0;
                _982 = _1086;
            }
            float _1088 = _982;
            if (!_1056)
            {
                _1066 = 1.0;
            }
            float _1090 = _1066;
            float _1092 = _1090;
            if (_1060)
            {
                float _1094 = abs(_872);
                float _1096 = -_1094;
                float _1098 = _1096 + 1.0;
                _984 = _1098;
            }
            float _1100 = _984;
            if (!_1058)
            {
                _986 = 1.0;
            }
            float _1102 = _986;
            float _1104 = _1050;
            float _1106 = _1102;
            if (_1058)
            {
                float _1108 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1104 = _1108;
            }
            float _1110 = _1104;
            float _1112 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1060)
            {
                float _1114 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1112 = _1114;
            }
            float _1116 = _1112;
            if (_1056)
            {
                float _1118 = _1078 * _1070;
                float _1120 = precise::clamp(_1118, 0.0, 1.0);
                _1092 = _1120;
            }
            float _1122 = _1092;
            if (!_1060)
            {
                _1080 = 1.0;
            }
            float _1124 = _1080;
            float _1126 = _1124;
            _1002 = _964;
            if (_1058)
            {
                float _1128 = _1088 * _1110;
                float _1130 = precise::clamp(_1128, 0.0, 1.0);
                _1106 = _1130;
            }
            float _1132 = _1106;
            float _1134 = _1122 * _1132;
            _988 = _1116;
            _1004 = _960;
            _1006 = _962;
            if (_1060)
            {
                float _1136 = _1100 * _1116;
                float _1138 = precise::clamp(_1136, 0.0, 1.0);
                _1126 = _1138;
            }
            float _1140 = _1126;
            float _1142 = _1134 * _1140;
            _1008 = _1142;
        }
    }
    _1010 = false;
    float _1144 = _988;
    float _1146 = _1002;
    float _1148 = _1004;
    float _1150 = _1006;
    float _1152 = _1008;
    float _1154 = _952 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1156 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1158 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1160 = fma(_950, 6.2500002968590706586837768554688e-05, 0.5);
    float _1162 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1156);
    float _1164 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1158);
    float _1166 = fma(_954, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1162);
    float _1168 = fma(_954, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1164);
    float _1170 = _1166 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1172 = _1168 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1174 = trunc(_1170);
    int _1176 = int(_1174);
    float _1178 = trunc(_1172);
    int _1180 = int(_1178);
    int _1182 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1184 = _1176 + _1182;
    int _1186 = _1184 + 1;
    bool _1188 = _1186 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1190 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1192 = _1180 + _1190;
    int _1194 = _1192 + 1;
    int _1196 = _1186 | _1194;
    bool _1198 = _1196 < 0;
    bool _1200 = _1198 || _1188;
    bool _1202 = _1194 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1204 = _1202 || _1200;
    int _1206 = _1196;
    int _1208 = _1194;
    int _1210 = _1186;
    float _1212 = _1144;
    float _1214 = _1148;
    float _1216 = _1150;
    float _1218 = _1146;
    if (!_1204)
    {
        int _1220 = _1194 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1222 = _1220 + _1186;
        _1206 = _1222;
    }
    int _1224 = _1206;
    float _1226 = _938;
    if (!_1204)
    {
        float _1228 = floor(_1170);
        _1226 = _1228;
    }
    float _1230 = _1226;
    if (!_1204)
    {
        int _1232 = _1224 << 2;
        _1208 = _1232;
    }
    int _1234 = _1208;
    int _1236 = _1234;
    if (!_1204)
    {
        uint _1239 = uint(int(uint(_1224) >> uint(2)));
        _1210 = int(_1239);
    }
    int _1241 = _1210;
    if (!_1204)
    {
        int _1243 = 12 & _1234;
        _1236 = _1243;
    }
    int _1245 = _1236;
    float _1247 = as_type<float>(_1245);
    if (!_1204)
    {
        int _1249 = _1241 << 4;
        int _1251 = _1249 + _1245;
        _1212 = as_type<float>(_1251);
    }
    float _1253 = _1212;
    float _1255 = as_type<float>(_1241);
    if (!_1204)
    {
        float _1257 = floor(_1172);
        _1255 = _1257;
    }
    float _1259 = _1255;
    if (!_1204)
    {
        float _1261 = -_1230;
        float _1263 = _1170 + _1261;
        _990 = _1263;
    }
    float _1265 = _990;
    float _1267 = _1253;
    if (!_1204)
    {
        int _1269 = as_type<int>(_1253) + 400;
        uint _1271 = uint(int(uint(_1269) >> uint(2)));
        uint _1273 = uint(int(uint(int(_1271)) >> uint(2)));
        int _1275 = int(_1271) & 3;
        float _1277 = (*spvDescriptorSet0.vp_c15)._m0[int(_1273)][_1275];
        _1267 = _1277;
    }
    float _1279 = _1267;
    if (!_1204)
    {
        float _1281 = -_1259;
        float _1283 = _1172 + _1281;
        _1247 = _1283;
    }
    float _1285 = _1247;
    float _1287 = fma(_954, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4342 = float2(_1160, _1287);
    float _1289 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_4342, float2(0.0), isnan(_4342)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_4342, float2(0.0), isnan(_4342)), level(0.0)).x;
    float _1291 = _816;
    float _1293 = _1287;
    if (!_1204)
    {
        float _1295 = rint(_1279);
        float _1297 = precise::max(_1295, 0.0);
        uint _1299 = uint(_1297);
        uint _1301 = clamp(_1299, 0u, 65535u);
        _1291 = as_type<float>(_1301);
    }
    float _1303 = _1291;
    float _1305 = _1285;
    if (!_1204)
    {
        float3 _4378 = float3(_1265, _1285, float(as_type<int>(_1303)));
        float3 _4382 = select(_4378, float3(0.0), isnan(_4378));
        float _1307 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4382.xy, uint(rint(_4382.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4382.xy, uint(rint(_4382.z)), level(0.0)).x;
        _1305 = _1307;
    }
    float _1309 = _1305;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1313 = _1146 + _1311;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1317 = _1148 + _1315;
    float _1319 = _952 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1321 = _952 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1323 = _1313 * _1313;
    float _1325 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1319);
    float _1327 = fma(_1317, _1317, _1323);
    float _1329 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1321);
    bool _1331 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan(0.5);
    bool _1339 = _1335 || _1337;
    float _1341 = sqrt(_1327);
    bool _1343 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan(0.5);
    bool _1351 = _1347 || _1349;
    float _1353 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1325);
    float _1355 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1329);
    bool _1357 = _1341 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1359 = !_1357;
    float _1361 = _1341;
    float _1363 = _1353;
    float _1365 = _1289;
    if (!_1359)
    {
        float _1367 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1369 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1371 = _1341 + _1369;
        float _1373 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1375 = rsqrt(_1327);
        float _1377 = _1371 * _1367;
        float _1379 = _1377 * 0.15915493667125701904296875;
        float _1381 = _1379 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        float _1385 = _1379 * 6.283185482025146484375;
        float _1387 = cos(_1385);
        float _1389 = fma(_1383, _1373, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1391 = _1375 * _1389;
        float _1393 = _1387 + (-1.0);
        float _1395 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1397 = fma(_1317, _1391, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1399 = fma(_1313, _1391, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1401 = fma(_1387, _1150, _1395);
        _1214 = _1397;
        _1216 = _1401;
        _1218 = _1399;
        _1361 = _1387;
        _1293 = _1395;
    }
    float _1403 = _1214;
    float _1405 = _1216;
    float _1407 = _1218;
    float _1409 = _1361;
    float _1411 = _1293;
    float _1413 = _1353 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1415 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1417 = _1411;
    float _1419 = _1409;
    float _1421 = _1415;
    if (_1339)
    {
        _1417 = _1403;
    }
    float _1423 = _1417;
    float _1425 = _1423;
    if (_1339)
    {
        _1419 = _1405;
    }
    float _1427 = _1419;
    float _1429 = _1427;
    if (_1339)
    {
        _1363 = _1407;
    }
    float _1431 = _1363;
    float _1433 = _1431;
    if (!_1339)
    {
        float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1437 = _952 + _1435;
        float _1439 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1441 = _950 + _1439;
        float _1443 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1445 = -_952;
        float _1447 = _1445 + _1405;
        float _1449 = _1437 * _1437;
        float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1453 = _954 + _1451;
        float _1455 = -_950;
        float _1457 = _1455 + _1403;
        float _1459 = fma(_1441, _1441, _1449);
        float _1461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1463 = fma(_1453, _1453, _1459);
        float _1465 = sqrt(_1463);
        float _1467 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1469 = -_954;
        float _1471 = _1469 + _1407;
        float _1473 = precise::min(_1465, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1475 = _1473 * _1461;
        float _1477 = _1467 * _1475;
        float _1479 = fma(_1447, _1477, _952);
        float _1481 = fma(_1457, _1477, _950);
        float _1483 = fma(_1471, _1477, _954);
        _1429 = _1479;
        _1425 = _1481;
        _1433 = _1483;
    }
    float _1485 = _1429;
    float _1487 = _1425;
    float _1489 = _1433;
    float _1491 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1493 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1495 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1497 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1499 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1491);
    float _1501 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1493);
    float _1503 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1495);
    float _1505 = 1.0 / _1415;
    float _1507 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1499);
    float _1509 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1501);
    float _1511 = _1413 + _1415;
    float _1513 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1497);
    float _1515 = _1507 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1517 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1503);
    float _1519 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1521 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1513);
    float _1523 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1525 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1527 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1529 = _1515 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1531 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1533 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1523);
    float _1535 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1525);
    float _1537 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1527);
    float _1539 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1529);
    float _1541 = _1521 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1543 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1533);
    float _1545 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1535);
    float _1547 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1537);
    float _1549 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1539);
    float _1551 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1543);
    float _1553 = _1511 * _1505;
    float _1555 = _1553 * 0.5;
    float _1557 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1545);
    float _1559 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1547);
    float _1561 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1549);
    float _1563 = _1535;
    float _1565 = _1551;
    float _1567 = _1557;
    if (_1351)
    {
        _1563 = 1.0;
    }
    float _1569 = _1563;
    float _1571 = _1569;
    if (!_1351)
    {
        float _1573 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1575 = _1573 * 0.15915493667125701904296875;
        float _1577 = _1575 * 6.283185482025146484375;
        float _1579 = cos(_1577);
        float _1581 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1583 = _1581 * 0.15915493667125701904296875;
        float _1585 = _1575 * 6.283185482025146484375;
        float _1587 = sin(_1585);
        float _1589 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1591 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1589);
        float _1593 = 1.0 / _1579;
        float _1595 = _1583 * 6.283185482025146484375;
        float _1597 = cos(_1595);
        float _1599 = _1587 * _1593;
        float _1601 = 1.0 / _1591;
        float _1603 = _1597 * _1599;
        float _1605 = _1583 * 6.283185482025146484375;
        float _1607 = sin(_1605);
        float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1611 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1609;
        float _1613 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1615 = _1601 * _1613;
        float _1617 = 1.0 / _1603;
        float _1619 = 1.0 / _1611;
        float _1621 = _1607 * _1617;
        float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1625 = fma(_1621, _1615, _1623);
        float _1627 = _1625 * _1619;
        float _1629 = precise::clamp(_1627, 0.0, 1.0);
        _1421 = _1615;
        _1571 = _1629;
    }
    float _1631 = _1421;
    float _1633 = _1571;
    float _1635 = abs(_1289);
    bool _1637 = _1635 != 0.0;
    bool _1639 = isnan(_1635);
    bool _1641 = _1637 || _1639;
    bool _1643 = isnan(0.0);
    bool _1645 = _1641 || _1643;
    out.gl_Position.x = _1551;
    out.gl_Position.y = _1557;
    out.gl_Position.z = _1559;
    out.gl_Position.w = _1561;
    bool _1647 = _146 > 0.001000000047497451305389404296875;
    bool _1649 = isnan(_146);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan(0.001000000047497451305389404296875);
    bool _1655 = _1651 || _1653;
    float _1657 = _1631;
    if (!_1645)
    {
        out.gl_Position.w = 0.0;
    }
    if (_1645)
    {
        _1365 = _1561;
    }
    float _1659 = _1365;
    float _1661 = _1659;
    if (!_1645)
    {
        _1661 = 0.0;
    }
    float _1663 = _1661;
    if (_1204)
    {
        _148 = _1663;
    }
    float _1665 = _148;
    float _1667 = _1665;
    float _1669 = _1665;
    if (!_1204)
    {
        int _1671 = _1224 << 4;
        int _1673 = _1671 + 2048;
        uint _1675 = uint(int(uint(_1673) >> uint(2)));
        uint _1677 = uint(int(uint(int(_1675)) >> uint(2)));
        int _1679 = int(_1675) & 3;
        float _1681 = (*spvDescriptorSet0.vp_c15)._m0[int(_1677)][_1679];
        int _1683 = int(_1675) + 1;
        uint _1685 = uint(int(uint(_1683) >> uint(2)));
        int _1687 = _1683 & 3;
        float _1689 = (*spvDescriptorSet0.vp_c15)._m0[int(_1685)][_1687];
        int _1691 = _1673 + 8;
        uint _1693 = uint(int(uint(_1691) >> uint(2)));
        uint _1695 = uint(int(uint(int(_1693)) >> uint(2)));
        int _1697 = int(_1693) & 3;
        float _1699 = (*spvDescriptorSet0.vp_c15)._m0[int(_1695)][_1697];
        int _1701 = int(_1693) + 1;
        uint _1703 = uint(int(uint(_1701) >> uint(2)));
        int _1705 = _1701 & 3;
        float _1707 = (*spvDescriptorSet0.vp_c15)._m0[int(_1703)][_1705];
        float _1709 = _1154 * _1689;
        float _1711 = fma(_950, _1681, _1709);
        float _1713 = fma(_954, _1699, _1711);
        float _1715 = _1713 + _1707;
        float _1717 = precise::clamp(_1715, 0.0, 1.0);
        float _1719 = -_1717;
        float _1721 = _1719 + _1309;
        float _1723 = fma(_1721, 500.0, 1.5);
        float _1725 = exp2(_1723);
        float _1727 = 0.0 + _1725;
        float _1729 = precise::clamp(_1727, 0.0, 1.0);
        bool _1731 = _1729 >= 1.0;
        bool _1733 = isnan(_1729);
        bool _1735 = _1731 || _1733;
        bool _1737 = isnan(1.0);
        bool _1739 = _1735 || _1737;
        _1657 = _1699;
        if (!_1739)
        {
            out.gl_Position.w = 0.0;
        }
        if (_1739)
        {
            _1667 = _1663;
        }
        float _1741 = _1667;
        _1669 = _1741;
        if (!_1739)
        {
            _1669 = 0.0;
        }
    }
    float _1743 = _1657;
    float _1745 = _1669;
    float _1747 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1749 = _1485 + _1747;
    float _1751 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1753 = _1487 + _1751;
    float _1755 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1757 = _1489 + _1755;
    float _1759 = _1531 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1761 = _1749 * _1749;
    float _1763 = _1743;
    float _1765 = _1749;
    if (!_1655)
    {
        _1565 = 0.0;
        _1567 = 0.0;
    }
    float _1767 = _1565;
    float _1769 = _1567;
    float _1771 = fma(_1753, _1753, _1761);
    float _1773 = fma(_1757, _1757, _1771);
    float _1775 = rsqrt(_1773);
    float _1777 = _1775 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1779 = _1753 * _1777;
    float _1781 = _1757 * _1777;
    float _1783 = _1779 * _1779;
    float _1785 = _1781 * _1781;
    float _1787 = _1783 + _1785;
    float _1789 = sqrt(_1787);
    bool _1791 = _1789 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1795 = _1789 + _1793;
    float _1797 = _1757;
    float _1799 = _1787;
    float _1801 = _1795;
    float _1803 = _1779;
    if (_1791)
    {
        float _1805 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1797 = _1805;
    }
    float _1807 = _1797;
    if (_1791)
    {
        float _1809 = rsqrt(_1787);
        _1799 = _1809;
    }
    float _1811 = _1799;
    if (_1791)
    {
        float _1813 = _1795 * _1807;
        _1801 = _1813;
    }
    float _1815 = _1801;
    if (_1791)
    {
        float _1817 = _1815 * 0.15915493667125701904296875;
        _1763 = _1817;
    }
    float _1819 = _1763;
    float _1821 = _1775;
    float _1823 = _1819;
    if (_1791)
    {
        float _1825 = _1819 * 6.283185482025146484375;
        float _1827 = sin(_1825);
        _1821 = _1827;
    }
    float _1829 = _1821;
    float _1831 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1833 = precise::max(0.0, _1831);
    float _1835 = _1663;
    float _1837 = _1833;
    float _1839 = _1831;
    if (_1791)
    {
        float _1841 = _1819 * 6.283185482025146484375;
        float _1843 = cos(_1841);
        _1835 = _1843;
    }
    float _1845 = _1835;
    float _1847 = -_1777;
    float _1849 = -_1833;
    float _1851 = fma(_1749, _1847, _1849);
    if (!_1791)
    {
        _1765 = _1785;
    }
    float _1853 = _1765;
    float _1855 = _1853;
    if (_1791)
    {
        float _1857 = _1851 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1837 = _1857;
    }
    float _1859 = _1837;
    float _1861 = _1859;
    float _1863 = _1829;
    if (_1791)
    {
        float _1865 = fma(_1829, _1859, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1861 = _1865;
    }
    float _1867 = _1861;
    float _1869 = _1867;
    if (!_1791)
    {
        _1863 = _1851;
    }
    float _1871 = _1863;
    float _1873 = _1871;
    float _1875 = _1845;
    if (_1791)
    {
        float _1877 = _1845 + (-1.0);
        _1839 = _1877;
    }
    float _1879 = _1839;
    float _1881 = _1879;
    if (_1791)
    {
        float _1883 = _1811 * _1867;
        _1823 = _1883;
    }
    float _1885 = _1823;
    if (!_1791)
    {
        _1869 = _1781;
    }
    float _1887 = _1869;
    float _1889 = _1887;
    if (_1791)
    {
        float _1891 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1881 = _1891;
    }
    float _1893 = _1881;
    if (_1791)
    {
        float _1895 = _1779 * _1885;
        _1803 = _1895;
    }
    float _1897 = _1803;
    if (_1791)
    {
        float _1899 = _1781 * _1885;
        _1889 = _1899;
    }
    float _1901 = _1889;
    if (_1791)
    {
        float _1903 = fma(_1851, _1845, _1893);
        _1873 = _1903;
    }
    float _1905 = _1873;
    if (!_1791)
    {
        _1875 = _1783;
    }
    float _1907 = _1875;
    float _1909 = _1907;
    if (_1791)
    {
        float _1911 = _1897 * _1897;
        _1909 = _1911;
    }
    float _1913 = _1909;
    float _1915 = sqrt(_1773);
    if (_1791)
    {
        float _1917 = _1901 * _1901;
        _1855 = _1917;
    }
    float _1919 = _1855;
    float _1921 = fma(_1905, _1905, _1913);
    float _1923 = _1921 + _1919;
    float _1925 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1927 = rsqrt(_1923);
    float _1929 = -_1759;
    float _1931 = fma(_1929, _1925, 1.0);
    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1935 = fma(_1915, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1933);
    float _1937 = precise::clamp(_1935, 0.0, 1.0);
    float _1939 = log2(_1931);
    float _1941 = -_1937;
    float _1943 = _1941 + 1.0;
    float _1945 = abs(_1943);
    float _1947 = log2(_1945);
    float _1949 = _1927 * _1897;
    float _1951 = _1927 * _1905;
    float _1953 = _1927 * _1901;
    float _1955 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1957 = 1.0 / _1745;
    float _1959 = -_1955;
    float _1961 = fma(_1951, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1959);
    float _1963 = -_1953;
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1961);
    float _1967 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1969 = fma(_1965, -0.5, 0.5);
    float _1971 = fma(_1965, 0.5, 0.5);
    float _1973 = _1939 * 0.693147182464599609375;
    float _1975 = _1951 + 1.0;
    float _1977 = exp2(_1967);
    float _1979 = fma(_1971, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1981 = _1957 * _1767;
    float _1983 = _1957 * _1769;
    float _1985 = fma(_1971, _1979, -0.212114393711090087890625);
    float _1987 = fma(_1981, 0.5, 0.5);
    float _1989 = fma(_1983, -0.5, 0.5);
    float _1991 = sqrt(_1969);
    float _1993 = fma(_1971, _1985, 1.570728778839111328125);
    float _1995 = _1973 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1997 = -_1951;
    float _1999 = fma(_1977, _1975, _1997);
    float _2001 = fma(_1999, 0.5, 0.5);
    float _2003 = _1991 * 0.636619746685028076171875;
    float _2005 = -_1993;
    float _2007 = fma(_2003, _2005, 1.0);
    float3 _5495 = float3(_1987, _1989, _1995);
    float _2009 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5495, float3(0.0), isnan(_5495)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5495, float3(0.0), isnan(_5495)), level(0.0)).x;
    float3 _5504 = float3(_1987, _1989, _1995);
    float4 _2012 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5504, float3(0.0), isnan(_5504)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5504, float3(0.0), isnan(_5504)), level(0.0)).xyzw;
    float _2014 = _2012.x;
    float _2016 = _2012.y;
    float _2018 = _2012.z;
    float _2020 = _2012.w;
    float2 _5520 = float2(_2007, _2001);
    float3 _2024 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5520, float2(0.0), isnan(_5520)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5520, float2(0.0), isnan(_5520)), level(0.0)).xyz;
    float _2026 = _2024.x;
    float _2028 = _2024.y;
    float _2030 = _2024.z;
    float _2032 = _1152 * _1633;
    float _2034 = _1559 + _1561;
    bool _2036 = _1915 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2038 = isnan(_1915);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2044 = _2040 || _2042;
    float _2046 = _2032 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2048 = _2034 * 0.5;
    float _2050 = _958 * _2046;
    float _2052 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_87.z = _2048;
    out.m_87.w = _1561;
    if (!_1655)
    {
        _992 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2054 = _992;
    float _2056 = exp2(_2052);
    int _2058 = as_type<int>(_2054);
    float _2060 = 0.0;
    float _2062 = 0.0;
    if (!_1655)
    {
        float _2064 = _2054 * 5.0;
        _2058 = as_type<int>(_2064);
    }
    int _2066 = _2058;
    float _2068 = as_type<float>(_2066);
    if (!_1655)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5599 = as_type<float>(_2066);
        out.gl_Position.z = _5599;
    }
    float _2070 = -_2056;
    float _2072 = _2070 + 1.0;
    float _2074 = _2056;
    if (_1655)
    {
        _2074 = _2050;
    }
    float _2076 = _2074;
    float _2078 = _2076;
    if (!_1655)
    {
        _2078 = 0.0;
    }
    float _2080 = _2078;
    float _2082 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2044)
    {
        _2068 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2084 = _2068;
    float _2086 = _2084;
    float _2088 = _2084;
    if (!_2044)
    {
        _2060 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2090 = _2060;
    float _2092 = _2090;
    float _2094 = _2090;
    if (!_2044)
    {
        _2062 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2096 = _2062;
    float _2098 = _2082 * _2009;
    float _2100 = -_2082;
    float _2102 = _2100 + 1.0;
    float _2104 = _2020 * _2098;
    float _2106 = _2030 * _2098;
    float _2108 = _2020 * _2102;
    float _2110 = fma(_2026, _2104, _2014);
    float _2112 = fma(_2028, _2104, _2016);
    float _2114 = fma(_2020, _2106, _2018);
    out.m_89.x = _2110;
    out.m_89.y = _2112;
    out.m_89.z = _2114;
    out.m_89.w = _2108;
    bool _2116 = !_2044;
    float _2118 = _2096;
    float _2120 = _2096;
    if (!_2116)
    {
        bool _2122 = _1915 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2124 = isnan(_1915);
        bool _2126 = _2122 || _2124;
        bool _2128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2130 = _2126 || _2128;
        if (!_2130)
        {
            float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2134 = _1915 + _2132;
            float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2138 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2136;
            float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2146 = _2144 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2148 = 1.0 / _2138;
            float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2152 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2154 = _2134 * _2148;
            float _2156 = precise::clamp(_2154, 0.0, 1.0);
            float _2158 = fma(_2156, _2142, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2160 = fma(_2156, _2146, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2162 = fma(_2156, _2152, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2094 = _2160;
            _2088 = _2158;
            _2120 = _2162;
            _2164 = true;
        }
        else
        {
            bool _2166 = _1915 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2168 = isnan(_1915);
            bool _2170 = _2166 || _2168;
            bool _2172 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2174 = _2170 || _2172;
            if (!_2174)
            {
                _2086 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2176 = _2086;
            _2088 = _2176;
            if (!_2174)
            {
                _2092 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2178 = _2092;
            _2094 = _2178;
            if (!_2174)
            {
                _2118 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2180 = _2118;
            bool _2182 = !_2174;
            _2120 = _2180;
            if (!_2182)
            {
                bool _2184 = _1915 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2186 = isnan(_1915);
                bool _2188 = _2184 || _2186;
                bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2192 = _2188 || _2190;
                if (!_2192)
                {
                    float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2196 = _1915 + _2194;
                    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2200 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2198;
                    float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2204 = _2202 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2206 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2208 = _2206 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2210 = 1.0 / _2200;
                    float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2214 = _2212 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2216 = _2196 * _2210;
                    float _2218 = precise::clamp(_2216, 0.0, 1.0);
                    float _2220 = fma(_2218, _2204, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2222 = fma(_2218, _2208, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2224 = fma(_2218, _2214, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2094 = _2222;
                    _2088 = _2220;
                    _2120 = _2224;
                    _2164 = true;
                }
                else
                {
                    _2094 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2088 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2120 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2164 = false;
    float _2226 = _2094;
    float _2228 = _2088;
    float _2230 = _2120;
    float _2232 = _2080 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _2234 = _2226 * 0.586610972881317138671875;
    bool _2236 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_58.x = _2232;
    float _2238 = fma(_2228, 0.298911988735198974609375, _2234);
    bool _2240 = _1633 > 0.0;
    bool _2242 = isnan(_1633);
    bool _2244 = _2240 || _2242;
    bool _2246 = isnan(0.0);
    bool _2248 = _2244 || _2246;
    float _2250 = fma(_2230, 0.114477999508380889892578125, _2238);
    float _2252 = -_2250;
    float _2254 = _2252 + _2228;
    float _2256 = -_2250;
    float _2258 = _2256 + _2226;
    float _2260 = -_2250;
    float _2262 = _2260 + _2230;
    float _2264 = fma(_2254, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2250);
    float _2266 = fma(_2258, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2250);
    float _2268 = fma(_2262, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2250);
    bool _2270 = !_2236;
    if (!_2270)
    {
        float _2272 = -_1485;
        float _2274 = _2272 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2276 = -_1487;
        float _2278 = _2276 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2280 = -_1489;
        float _2282 = _2280 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2284 = _2274 * _2274;
        float _2286 = fma(_2278, _2278, _2284);
        float _2288 = fma(_2282, _2282, _2286);
        float _2290 = sqrt(_2288);
        float _2292 = rsqrt(_2288);
        float _2294 = -_2290;
        float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2298 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2300 = precise::clamp(_2298, 0.0, 1.0);
        float _2302 = _2278 * _2292;
        float _2304 = _2274 * _2292;
        float _2306 = abs(_2300);
        float _2308 = log2(_2306);
        float _2310 = _2282 * _2292;
        float _2312 = _2302 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2314 = _906 * _2304;
        float _2316 = -_2304;
        float _2318 = -_2312;
        float _2320 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2318);
        float _2322 = fma(_908, _2302, _2314);
        float _2324 = -_2310;
        float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2320);
        float _2328 = fma(_910, _2310, _2322);
        float _2330 = precise::clamp(_2328, 0.0, 1.0);
        float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2334 = _2326 + _2332;
        float _2336 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2338 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2340 = precise::clamp(_2338, 0.0, 1.0);
        float _2342 = exp2(_2336);
        float _2344 = _2342 * _2340;
        float _2346 = _2330 * _2344;
        float _2348 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2350 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2352 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2348;
        out.m_91.y = _2350;
        out.m_91.z = _2352;
    }
    out.m_93.x = _2264;
    out.m_93.y = _2266;
    out.m_93.z = _2268;
    if (_2248)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_58.x = 0.0;
    float _2354 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2354;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

