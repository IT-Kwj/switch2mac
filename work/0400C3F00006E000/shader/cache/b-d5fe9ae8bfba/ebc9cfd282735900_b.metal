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
    bool _2034 = false;
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
        float _2268 = as_type<float>(_128);
        out.gl_Position.z = _2268;
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
        float _2338 = as_type<float>(_166);
        out.gl_Position.z = _2338;
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
    float _966 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _968 = _946;
    float _970 = _820;
    float _972 = _948;
    float _974 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _976 = _948;
    float _978 = _820;
    float _980 = _842;
    float _982 = _872;
    float _984 = _836;
    float _986 = _938;
    float _988 = as_type<float>(_914);
    float _990 = _898;
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
            _1004 = _1034;
            if (_1028)
            {
                _970 = 0.0;
            }
            float _1036 = _970;
            _978 = _1036;
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
            _976 = _1042;
            _1008 = _1042;
        }
        if ((!_1046) || _998)
        {
            _998 = false;
            float _1048 = _974;
            float _1050 = _976;
            float _1052 = _978;
            bool _1054 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1056 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1058 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1060 = _1048;
            float _1062 = _1050;
            float _1064 = _1052;
            _1004 = _960;
            if (_1054)
            {
                float _1066 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1060 = _1066;
            }
            float _1068 = _1060;
            if (_1054)
            {
                float _1070 = abs(_836);
                float _1072 = -_1070;
                float _1074 = _1072 + 1.0;
                _1062 = _1074;
            }
            float _1076 = _1062;
            float _1078 = _1076;
            if (_1056)
            {
                float _1080 = abs(_842);
                float _1082 = -_1080;
                float _1084 = _1082 + 1.0;
                _980 = _1084;
            }
            float _1086 = _980;
            if (!_1054)
            {
                _1064 = 1.0;
            }
            float _1088 = _1064;
            float _1090 = _1088;
            if (_1058)
            {
                float _1092 = abs(_872);
                float _1094 = -_1092;
                float _1096 = _1094 + 1.0;
                _982 = _1096;
            }
            float _1098 = _982;
            if (!_1056)
            {
                _984 = 1.0;
            }
            float _1100 = _984;
            float _1102 = _856;
            float _1104 = _1100;
            if (_1056)
            {
                float _1106 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1102 = _1106;
            }
            float _1108 = _1102;
            float _1110 = _938;
            if (_1058)
            {
                float _1112 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1110 = _1112;
            }
            float _1114 = _1110;
            if (_1054)
            {
                float _1116 = _1076 * _1068;
                float _1118 = precise::clamp(_1116, 0.0, 1.0);
                _1090 = _1118;
            }
            float _1120 = _1090;
            if (!_1058)
            {
                _1078 = 1.0;
            }
            float _1122 = _1078;
            float _1124 = _1122;
            _1002 = _964;
            if (_1056)
            {
                float _1126 = _1086 * _1108;
                float _1128 = precise::clamp(_1126, 0.0, 1.0);
                _1104 = _1128;
            }
            float _1130 = _1104;
            float _1132 = _1120 * _1130;
            _986 = _1114;
            _1006 = _962;
            if (_1058)
            {
                float _1134 = _1098 * _1114;
                float _1136 = precise::clamp(_1134, 0.0, 1.0);
                _1124 = _1136;
            }
            float _1138 = _1124;
            float _1140 = _1132 * _1138;
            _1008 = _1140;
        }
    }
    _1010 = false;
    float _1142 = _986;
    float _1144 = _1002;
    float _1146 = _1004;
    float _1148 = _1006;
    float _1150 = _1008;
    float _1152 = _952 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1154 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1156 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1158 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1154);
    float _1160 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1156);
    float _1162 = fma(_954, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1158);
    float _1164 = fma(_954, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1160);
    float _1166 = _1162 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1168 = _1164 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1170 = trunc(_1166);
    int _1172 = int(_1170);
    float _1174 = trunc(_1168);
    int _1176 = int(_1174);
    int _1178 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1180 = _1172 + _1178;
    int _1182 = _1180 + 1;
    bool _1184 = _1182 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1186 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1188 = _1176 + _1186;
    int _1190 = _1188 + 1;
    int _1192 = _1182 | _1190;
    bool _1194 = _1192 < 0;
    bool _1196 = _1194 || _1184;
    bool _1198 = _1190 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1200 = _1198 || _1196;
    int _1202 = _1182;
    int _1204 = _1192;
    int _1206 = _1190;
    float _1208 = _1164;
    float _1210 = _1148;
    float _1212 = _1146;
    float _1214 = _1144;
    if (!_1200)
    {
        int _1216 = _1190 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1218 = _1216 + _1182;
        _1202 = _1218;
    }
    int _1220 = _1202;
    float _1222 = _1142;
    if (!_1200)
    {
        float _1224 = floor(_1166);
        _1222 = _1224;
    }
    float _1226 = _1222;
    if (!_1200)
    {
        int _1228 = _1220 << 2;
        _1204 = _1228;
    }
    int _1230 = _1204;
    int _1232 = _1230;
    if (!_1200)
    {
        uint _1235 = uint(int(uint(_1220) >> uint(2)));
        _1206 = int(_1235);
    }
    int _1237 = _1206;
    if (!_1200)
    {
        int _1239 = 12 & _1230;
        _1232 = _1239;
    }
    int _1241 = _1232;
    if (!_1200)
    {
        int _1243 = _1237 << 4;
        int _1245 = _1243 + _1241;
        _988 = as_type<float>(_1245);
    }
    float _1247 = _988;
    float _1249 = fma(_954, 6.2500002968590706586837768554688e-05, 0.5);
    float _1251 = as_type<float>(_1237);
    if (!_1200)
    {
        float _1253 = floor(_1168);
        _1251 = _1253;
    }
    float _1255 = _1251;
    if (!_1200)
    {
        float _1257 = -_1226;
        float _1259 = _1166 + _1257;
        _990 = _1259;
    }
    float _1261 = _990;
    float _1263 = _1247;
    if (!_1200)
    {
        int _1265 = as_type<int>(_1247) + 400;
        uint _1267 = uint(int(uint(_1265) >> uint(2)));
        uint _1269 = uint(int(uint(int(_1267)) >> uint(2)));
        int _1271 = int(_1267) & 3;
        float _1273 = (*spvDescriptorSet0.vp_c15)._m0[int(_1269)][_1271];
        _1263 = _1273;
    }
    float _1275 = _1263;
    if (!_1200)
    {
        float _1277 = -_1255;
        float _1279 = _1168 + _1277;
        _1208 = _1279;
    }
    float _1281 = _1208;
    float _1283 = fma(_950, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4195 = float2(_1283, _1249);
    float _1285 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_4195, float2(0.0), isnan(_4195)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_4195, float2(0.0), isnan(_4195)), level(0.0)).x;
    float _1287 = _740;
    if (!_1200)
    {
        float _1289 = rint(_1275);
        float _1291 = precise::max(_1289, 0.0);
        uint _1293 = uint(_1291);
        uint _1295 = clamp(_1293, 0u, 65535u);
        _1287 = as_type<float>(_1295);
    }
    float _1297 = _1287;
    float _1299 = _1281;
    if (!_1200)
    {
        float3 _4230 = float3(_1261, _1281, float(as_type<int>(_1297)));
        float3 _4234 = select(_4230, float3(0.0), isnan(_4230));
        float _1301 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4234.xy, uint(rint(_4234.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4234.xy, uint(rint(_4234.z)), level(0.0)).x;
        _1299 = _1301;
    }
    float _1303 = _1299;
    float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1307 = _1144 + _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1311 = _1146 + _1309;
    float _1313 = _1307 * _1307;
    bool _1315 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1319 = _1315 || _1317;
    bool _1321 = isnan(0.5);
    bool _1323 = _1319 || _1321;
    float _1325 = fma(_1311, _1311, _1313);
    float _1327 = sqrt(_1325);
    bool _1329 = _1327 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1331 = !_1329;
    float _1333 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_1331)
    {
        float _1335 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1337 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1339 = _1327 + _1337;
        float _1341 = _1148 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1343 = rsqrt(_1325);
        float _1345 = _1339 * _1335;
        float _1347 = _1345 * 0.15915493667125701904296875;
        float _1349 = _1347 * 6.283185482025146484375;
        float _1351 = sin(_1349);
        float _1353 = _1347 * 6.283185482025146484375;
        float _1355 = cos(_1353);
        float _1357 = fma(_1351, _1341, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1359 = _1343 * _1357;
        float _1361 = _1355 + (-1.0);
        float _1363 = fma(_1311, _1359, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1365 = fma(_1307, _1359, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1367 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1369 = fma(_1355, _1148, _1367);
        _1210 = _1369;
        _1212 = _1363;
        _1214 = _1365;
        _1333 = _1367;
    }
    float _1371 = _1210;
    float _1373 = _1212;
    float _1375 = _1214;
    float _1377 = _1333;
    float _1379 = _1377;
    float _1381 = _1373;
    float _1383 = _1375;
    if (_1323)
    {
        _1379 = _1371;
    }
    float _1385 = _1379;
    float _1387 = _1385;
    if (!_1323)
    {
        float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1391 = _952 + _1389;
        float _1393 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1395 = _950 + _1393;
        float _1397 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1399 = -_952;
        float _1401 = _1399 + _1371;
        float _1403 = _1391 * _1391;
        float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1407 = _954 + _1405;
        float _1409 = -_950;
        float _1411 = _1409 + _1373;
        float _1413 = fma(_1395, _1395, _1403);
        float _1415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1417 = fma(_1407, _1407, _1413);
        float _1419 = sqrt(_1417);
        float _1421 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1423 = precise::min(_1419, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1425 = _1423 * _1415;
        float _1427 = _1421 * _1425;
        float _1429 = -_954;
        float _1431 = _1429 + _1375;
        float _1433 = fma(_1401, _1427, _952);
        float _1435 = fma(_1411, _1427, _950);
        float _1437 = fma(_1431, _1427, _954);
        _1387 = _1433;
        _1381 = _1435;
        _1383 = _1437;
    }
    float _1439 = _1387;
    float _1441 = _1381;
    float _1443 = _1383;
    float _1445 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1447 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1449 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1451 = abs(_1285);
    bool _1453 = _1451 != 0.0;
    bool _1455 = isnan(_1451);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan(0.0);
    bool _1461 = _1457 || _1459;
    float _1463 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1445);
    float _1465 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1447);
    float _1467 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1449);
    float _1469 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1471 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1463);
    float _1473 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1465);
    float _1475 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1467);
    float _1477 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1469);
    float _1479 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1481 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1483 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1485 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1477);
    float _1487 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1489 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1491 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1493 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1495 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1487);
    float _1497 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1499 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1489);
    float _1501 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1491);
    float _1503 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1495);
    float _1505 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1493);
    float _1507 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1499);
    float _1509 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1501);
    float _1511 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1503);
    float _1513 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1505);
    float _1515 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1507);
    float _1517 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1509);
    float _1519 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1513);
    bool _1521 = _146 > 0.001000000047497451305389404296875;
    bool _1523 = isnan(_146);
    bool _1525 = _1521 || _1523;
    bool _1527 = isnan(0.001000000047497451305389404296875);
    bool _1529 = _1525 || _1527;
    float _1531 = _1509;
    float _1533 = _1511;
    float _1535 = _1515;
    if (_1461)
    {
        _148 = _1519;
    }
    float _1537 = _148;
    out.gl_Position.x = _1511;
    out.gl_Position.y = _1515;
    out.gl_Position.z = _1517;
    out.gl_Position.w = _1519;
    float _1539 = _1537;
    if (!_1461)
    {
        _1539 = 0.0;
    }
    float _1541 = _1539;
    float _1543 = _1541;
    if (!_1461)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_1200)
    {
        int _1545 = _1220 << 4;
        int _1547 = _1545 + 2048;
        uint _1549 = uint(int(uint(_1547) >> uint(2)));
        uint _1551 = uint(int(uint(int(_1549)) >> uint(2)));
        int _1553 = int(_1549) & 3;
        float _1555 = (*spvDescriptorSet0.vp_c15)._m0[int(_1551)][_1553];
        int _1557 = int(_1549) + 1;
        uint _1559 = uint(int(uint(_1557) >> uint(2)));
        int _1561 = _1557 & 3;
        float _1563 = (*spvDescriptorSet0.vp_c15)._m0[int(_1559)][_1561];
        int _1565 = _1547 + 8;
        uint _1567 = uint(int(uint(_1565) >> uint(2)));
        uint _1569 = uint(int(uint(int(_1567)) >> uint(2)));
        int _1571 = int(_1567) & 3;
        float _1573 = (*spvDescriptorSet0.vp_c15)._m0[int(_1569)][_1571];
        int _1575 = int(_1567) + 1;
        uint _1577 = uint(int(uint(_1575) >> uint(2)));
        int _1579 = _1575 & 3;
        float _1581 = (*spvDescriptorSet0.vp_c15)._m0[int(_1577)][_1579];
        float _1583 = _1152 * _1563;
        float _1585 = fma(_950, _1555, _1583);
        float _1587 = fma(_954, _1573, _1585);
        float _1589 = _1587 + _1581;
        float _1591 = precise::clamp(_1589, 0.0, 1.0);
        float _1593 = -_1591;
        float _1595 = _1593 + _1303;
        float _1597 = fma(_1595, 500.0, 1.5);
        float _1599 = exp2(_1597);
        float _1601 = 0.0 + _1599;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        bool _1605 = _1603 >= 1.0;
        bool _1607 = isnan(_1603);
        bool _1609 = _1605 || _1607;
        bool _1611 = isnan(1.0);
        bool _1613 = _1609 || _1611;
        _1531 = _1563;
        if (!_1613)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_1613)
        {
            _1543 = 0.0;
        }
    }
    float _1615 = _1531;
    float _1617 = _1543;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1621 = _1439 + _1619;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1625 = _1441 + _1623;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1629 = _1443 + _1627;
    float _1631 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1633 = _1621 * _1621;
    float _1635 = _1615;
    float _1637 = _1621;
    if (!_1529)
    {
        _1533 = 0.0;
    }
    float _1639 = _1533;
    if (!_1529)
    {
        _1535 = 0.0;
    }
    float _1641 = _1535;
    float _1643 = fma(_1625, _1625, _1633);
    float _1645 = fma(_1629, _1629, _1643);
    float _1647 = rsqrt(_1645);
    float _1649 = _1647 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1651 = _1625 * _1649;
    float _1653 = _1629 * _1649;
    float _1655 = _1651 * _1651;
    float _1657 = _1653 * _1653;
    float _1659 = _1655 + _1657;
    float _1661 = sqrt(_1659);
    bool _1663 = _1661 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1667 = _1661 + _1665;
    float _1669 = _1629;
    float _1671 = _1659;
    float _1673 = _1667;
    float _1675 = _1651;
    if (_1663)
    {
        float _1677 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1669 = _1677;
    }
    float _1679 = _1669;
    if (_1663)
    {
        float _1681 = rsqrt(_1659);
        _1671 = _1681;
    }
    float _1683 = _1671;
    if (_1663)
    {
        float _1685 = _1667 * _1679;
        _1673 = _1685;
    }
    float _1687 = _1673;
    if (_1663)
    {
        float _1689 = _1687 * 0.15915493667125701904296875;
        _1635 = _1689;
    }
    float _1691 = _1635;
    float _1693 = _1647;
    float _1695 = _1691;
    if (_1663)
    {
        float _1697 = _1691 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        _1693 = _1699;
    }
    float _1701 = _1693;
    float _1703 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1705 = precise::max(0.0, _1703);
    float _1707 = _1303;
    float _1709 = _1705;
    float _1711 = _1703;
    if (_1663)
    {
        float _1713 = _1691 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        _1707 = _1715;
    }
    float _1717 = _1707;
    float _1719 = -_1649;
    float _1721 = -_1705;
    float _1723 = fma(_1621, _1719, _1721);
    if (_1663)
    {
        float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1709 = _1725;
    }
    float _1727 = _1709;
    float _1729 = _1701;
    float _1731 = _1727;
    if (_1663)
    {
        float _1733 = fma(_1701, _1727, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1637 = _1733;
    }
    float _1735 = _1637;
    float _1737 = _1735;
    if (!_1663)
    {
        _1729 = _1723;
    }
    float _1739 = _1729;
    float _1741 = _1739;
    if (!_1663)
    {
        _1731 = _1653;
    }
    float _1743 = _1731;
    float _1745 = _1743;
    float _1747 = _1717;
    if (_1663)
    {
        float _1749 = _1717 + (-1.0);
        _1711 = _1749;
    }
    float _1751 = _1711;
    float _1753 = _1751;
    if (_1663)
    {
        float _1755 = _1683 * _1735;
        _1695 = _1755;
    }
    float _1757 = _1695;
    if (!_1663)
    {
        _1737 = _1657;
    }
    float _1759 = _1737;
    float _1761 = _1759;
    if (_1663)
    {
        float _1763 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1753 = _1763;
    }
    float _1765 = _1753;
    if (_1663)
    {
        float _1767 = _1651 * _1757;
        _1675 = _1767;
    }
    float _1769 = _1675;
    if (_1663)
    {
        float _1771 = _1653 * _1757;
        _1745 = _1771;
    }
    float _1773 = _1745;
    if (_1663)
    {
        float _1775 = fma(_1723, _1717, _1765);
        _1741 = _1775;
    }
    float _1777 = _1741;
    if (!_1663)
    {
        _1747 = _1655;
    }
    float _1779 = _1747;
    float _1781 = _1779;
    if (_1663)
    {
        float _1783 = _1769 * _1769;
        _1781 = _1783;
    }
    float _1785 = _1781;
    float _1787 = sqrt(_1645);
    if (_1663)
    {
        float _1789 = _1773 * _1773;
        _1761 = _1789;
    }
    float _1791 = _1761;
    float _1793 = fma(_1777, _1777, _1785);
    float _1795 = _1793 + _1791;
    float _1797 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1799 = rsqrt(_1795);
    float _1801 = -_1631;
    float _1803 = fma(_1801, _1797, 1.0);
    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1807 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1805);
    float _1809 = precise::clamp(_1807, 0.0, 1.0);
    float _1811 = log2(_1803);
    float _1813 = -_1809;
    float _1815 = _1813 + 1.0;
    float _1817 = abs(_1815);
    float _1819 = log2(_1817);
    float _1821 = _1799 * _1769;
    float _1823 = _1799 * _1777;
    float _1825 = _1799 * _1773;
    float _1827 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1829 = 1.0 / _1617;
    float _1831 = -_1827;
    float _1833 = fma(_1823, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1831);
    float _1835 = _1811 * 0.693147182464599609375;
    float _1837 = -_1825;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1833);
    float _1841 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1843 = fma(_1839, -0.5, 0.5);
    float _1845 = fma(_1839, 0.5, 0.5);
    float _1847 = _1823 + 1.0;
    float _1849 = exp2(_1841);
    float _1851 = fma(_1845, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1853 = _1829 * _1639;
    float _1855 = _1829 * _1641;
    float _1857 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1859 = fma(_1845, _1851, -0.212114393711090087890625);
    float _1861 = fma(_1853, 0.5, 0.5);
    float _1863 = fma(_1855, -0.5, 0.5);
    float _1865 = sqrt(_1843);
    float _1867 = fma(_1845, _1859, 1.570728778839111328125);
    float3 _5157 = float3(_1861, _1863, _1857);
    float _1869 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5157, float3(0.0), isnan(_5157)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5157, float3(0.0), isnan(_5157)), level(0.0)).x;
    float _1871 = -_1823;
    float _1873 = fma(_1849, _1847, _1871);
    float _1875 = fma(_1873, 0.5, 0.5);
    float _1877 = _1865 * 0.636619746685028076171875;
    float _1879 = -_1867;
    float _1881 = fma(_1877, _1879, 1.0);
    float3 _5182 = float3(_1861, _1863, _1857);
    float4 _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5182, float3(0.0), isnan(_5182)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5182, float3(0.0), isnan(_5182)), level(0.0)).xyzw;
    float _1886 = _1884.x;
    float _1888 = _1884.y;
    float _1890 = _1884.z;
    float _1892 = _1884.w;
    float2 _5198 = float2(_1881, _1875);
    float3 _1896 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5198, float2(0.0), isnan(_5198)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5198, float2(0.0), isnan(_5198)), level(0.0)).xyz;
    float _1898 = _1896.x;
    float _1900 = _1896.y;
    float _1902 = _1896.z;
    float _1904 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1906 = _1517 + _1519;
    bool _1908 = _1787 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1910 = isnan(_1787);
    bool _1912 = _1908 || _1910;
    bool _1914 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1916 = _1912 || _1914;
    float _1918 = _958 * _1904;
    float _1920 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1922 = _1906 * 0.5;
    if (!_1529)
    {
        _992 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1924 = _992;
    float _1926 = exp2(_1920);
    out.m_87.z = _1922;
    out.m_87.w = _1519;
    int _1928 = as_type<int>(_1924);
    float _1930 = 0.0;
    float _1932 = 0.0;
    if (!_1529)
    {
        float _1934 = _1924 * 5.0;
        _1928 = as_type<int>(_1934);
    }
    int _1936 = _1928;
    float _1938 = as_type<float>(_1936);
    if (!_1529)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5274 = as_type<float>(_1936);
        out.gl_Position.z = _5274;
    }
    float _1940 = -_1926;
    float _1942 = _1940 + 1.0;
    float _1944 = _1926;
    if (_1529)
    {
        _1944 = _1918;
    }
    float _1946 = _1944;
    float _1948 = _1946;
    if (!_1529)
    {
        _1948 = 0.0;
    }
    float _1950 = _1948;
    float _1952 = _1942 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1916)
    {
        _1938 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1954 = _1938;
    float _1956 = _1954;
    float _1958 = _1954;
    if (!_1916)
    {
        _1930 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1960 = _1930;
    float _1962 = _1960;
    float _1964 = _1960;
    if (!_1916)
    {
        _1932 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1966 = _1932;
    float _1968 = _1952 * _1869;
    float _1970 = -_1952;
    float _1972 = _1970 + 1.0;
    float _1974 = _1892 * _1968;
    float _1976 = _1892 * _1972;
    float _1978 = _1902 * _1968;
    float _1980 = fma(_1898, _1974, _1886);
    float _1982 = fma(_1900, _1974, _1888);
    float _1984 = fma(_1892, _1978, _1890);
    out.m_89.x = _1980;
    out.m_89.y = _1982;
    out.m_89.z = _1984;
    out.m_89.w = _1976;
    bool _1986 = !_1916;
    float _1988 = _1966;
    float _1990 = _1966;
    if (!_1986)
    {
        bool _1992 = _1787 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1994 = isnan(_1787);
        bool _1996 = _1992 || _1994;
        bool _1998 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2000 = _1996 || _1998;
        if (!_2000)
        {
            float _2002 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2004 = _1787 + _2002;
            float _2006 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2008 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2006;
            float _2010 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2012 = _2010 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2014 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2016 = _2014 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2018 = 1.0 / _2008;
            float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2022 = _2020 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2024 = _2004 * _2018;
            float _2026 = precise::clamp(_2024, 0.0, 1.0);
            float _2028 = fma(_2026, _2012, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2030 = fma(_2026, _2016, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2032 = fma(_2026, _2022, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1964 = _2030;
            _1958 = _2028;
            _1990 = _2032;
            _2034 = true;
        }
        else
        {
            bool _2036 = _1787 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2038 = isnan(_1787);
            bool _2040 = _2036 || _2038;
            bool _2042 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2044 = _2040 || _2042;
            if (!_2044)
            {
                _1956 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2046 = _1956;
            _1958 = _2046;
            if (!_2044)
            {
                _1962 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2048 = _1962;
            _1964 = _2048;
            if (!_2044)
            {
                _1988 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2050 = _1988;
            bool _2052 = !_2044;
            _1990 = _2050;
            if (!_2052)
            {
                bool _2054 = _1787 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2056 = isnan(_1787);
                bool _2058 = _2054 || _2056;
                bool _2060 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2062 = _2058 || _2060;
                if (!_2062)
                {
                    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2066 = _1787 + _2064;
                    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2070 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2068;
                    float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2078 = _2076 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2080 = 1.0 / _2070;
                    float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2084 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2086 = _2066 * _2080;
                    float _2088 = precise::clamp(_2086, 0.0, 1.0);
                    float _2090 = fma(_2088, _2074, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2092 = fma(_2088, _2078, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2094 = fma(_2088, _2084, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1964 = _2092;
                    _1958 = _2090;
                    _1990 = _2094;
                    _2034 = true;
                }
                else
                {
                    _1964 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1958 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1990 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2034 = false;
    float _2096 = _1964;
    float _2098 = _1958;
    float _2100 = _1990;
    float _2102 = _2096 * 0.586610972881317138671875;
    bool _2104 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2106 = _1950 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _2108 = fma(_2098, 0.298911988735198974609375, _2102);
    out.m_58.x = _2106;
    float _2110 = fma(_2100, 0.114477999508380889892578125, _2108);
    float _2112 = -_2110;
    float _2114 = _2112 + _2098;
    float _2116 = -_2110;
    float _2118 = _2116 + _2096;
    float _2120 = -_2110;
    float _2122 = _2120 + _2100;
    float _2124 = fma(_2114, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2110);
    float _2126 = fma(_2118, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2110);
    float _2128 = fma(_2122, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2110);
    out.m_93.x = _2124;
    out.m_93.y = _2126;
    out.m_93.z = _2128;
    if (!_2104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2130 = -_1439;
    float _2132 = _2130 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2134 = -_1441;
    float _2136 = _2134 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2138 = -_1443;
    float _2140 = _2138 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2142 = _2132 * _2132;
    float _2144 = fma(_2136, _2136, _2142);
    float _2146 = fma(_2140, _2140, _2144);
    float _2148 = sqrt(_2146);
    float _2150 = rsqrt(_2146);
    float _2152 = -_2148;
    float _2154 = _2152 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2156 = _2154 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2158 = precise::clamp(_2156, 0.0, 1.0);
    float _2160 = _2136 * _2150;
    float _2162 = _2132 * _2150;
    float _2164 = abs(_2158);
    float _2166 = log2(_2164);
    float _2168 = _2140 * _2150;
    float _2170 = _2160 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2172 = _906 * _2162;
    float _2174 = -_2162;
    float _2176 = -_2170;
    float _2178 = fma(_2174, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2176);
    float _2180 = fma(_908, _2160, _2172);
    float _2182 = -_2168;
    float _2184 = fma(_2182, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2178);
    float _2186 = fma(_910, _2168, _2180);
    float _2188 = precise::clamp(_2186, 0.0, 1.0);
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2192 = _2184 + _2190;
    float _2194 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2196 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2198 = precise::clamp(_2196, 0.0, 1.0);
    float _2200 = exp2(_2194);
    float _2202 = _2200 * _2198;
    float _2204 = _2188 * _2202;
    float _2206 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2208 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2210 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _2206;
    out.m_91.y = _2208;
    out.m_91.z = _2210;
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
    bool _2034 = false;
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
        float _2268 = as_type<float>(_128);
        out.gl_Position.z = _2268;
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
        float _2338 = as_type<float>(_166);
        out.gl_Position.z = _2338;
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
    float _966 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _968 = _946;
    float _970 = _820;
    float _972 = _948;
    float _974 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _976 = _948;
    float _978 = _820;
    float _980 = _842;
    float _982 = _872;
    float _984 = _836;
    float _986 = _938;
    float _988 = as_type<float>(_914);
    float _990 = _898;
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
            _1004 = _1034;
            if (_1028)
            {
                _970 = 0.0;
            }
            float _1036 = _970;
            _978 = _1036;
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
            _976 = _1042;
            _1008 = _1042;
        }
        if ((!_1046) || _998)
        {
            _998 = false;
            float _1048 = _974;
            float _1050 = _976;
            float _1052 = _978;
            bool _1054 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1056 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1058 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1060 = _1048;
            float _1062 = _1050;
            float _1064 = _1052;
            _1004 = _960;
            if (_1054)
            {
                float _1066 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1060 = _1066;
            }
            float _1068 = _1060;
            if (_1054)
            {
                float _1070 = abs(_836);
                float _1072 = -_1070;
                float _1074 = _1072 + 1.0;
                _1062 = _1074;
            }
            float _1076 = _1062;
            float _1078 = _1076;
            if (_1056)
            {
                float _1080 = abs(_842);
                float _1082 = -_1080;
                float _1084 = _1082 + 1.0;
                _980 = _1084;
            }
            float _1086 = _980;
            if (!_1054)
            {
                _1064 = 1.0;
            }
            float _1088 = _1064;
            float _1090 = _1088;
            if (_1058)
            {
                float _1092 = abs(_872);
                float _1094 = -_1092;
                float _1096 = _1094 + 1.0;
                _982 = _1096;
            }
            float _1098 = _982;
            if (!_1056)
            {
                _984 = 1.0;
            }
            float _1100 = _984;
            float _1102 = _856;
            float _1104 = _1100;
            if (_1056)
            {
                float _1106 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1102 = _1106;
            }
            float _1108 = _1102;
            float _1110 = _938;
            if (_1058)
            {
                float _1112 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1110 = _1112;
            }
            float _1114 = _1110;
            if (_1054)
            {
                float _1116 = _1076 * _1068;
                float _1118 = precise::clamp(_1116, 0.0, 1.0);
                _1090 = _1118;
            }
            float _1120 = _1090;
            if (!_1058)
            {
                _1078 = 1.0;
            }
            float _1122 = _1078;
            float _1124 = _1122;
            _1002 = _964;
            if (_1056)
            {
                float _1126 = _1086 * _1108;
                float _1128 = precise::clamp(_1126, 0.0, 1.0);
                _1104 = _1128;
            }
            float _1130 = _1104;
            float _1132 = _1120 * _1130;
            _986 = _1114;
            _1006 = _962;
            if (_1058)
            {
                float _1134 = _1098 * _1114;
                float _1136 = precise::clamp(_1134, 0.0, 1.0);
                _1124 = _1136;
            }
            float _1138 = _1124;
            float _1140 = _1132 * _1138;
            _1008 = _1140;
        }
    }
    _1010 = false;
    float _1142 = _986;
    float _1144 = _1002;
    float _1146 = _1004;
    float _1148 = _1006;
    float _1150 = _1008;
    float _1152 = _952 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1154 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1156 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1158 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1154);
    float _1160 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1156);
    float _1162 = fma(_954, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1158);
    float _1164 = fma(_954, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1160);
    float _1166 = _1162 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1168 = _1164 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1170 = trunc(_1166);
    int _1172 = int(_1170);
    float _1174 = trunc(_1168);
    int _1176 = int(_1174);
    int _1178 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1180 = _1172 + _1178;
    int _1182 = _1180 + 1;
    bool _1184 = _1182 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1186 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1188 = _1176 + _1186;
    int _1190 = _1188 + 1;
    int _1192 = _1182 | _1190;
    bool _1194 = _1192 < 0;
    bool _1196 = _1194 || _1184;
    bool _1198 = _1190 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1200 = _1198 || _1196;
    int _1202 = _1182;
    int _1204 = _1192;
    int _1206 = _1190;
    float _1208 = _1164;
    float _1210 = _1148;
    float _1212 = _1146;
    float _1214 = _1144;
    if (!_1200)
    {
        int _1216 = _1190 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1218 = _1216 + _1182;
        _1202 = _1218;
    }
    int _1220 = _1202;
    float _1222 = _1142;
    if (!_1200)
    {
        float _1224 = floor(_1166);
        _1222 = _1224;
    }
    float _1226 = _1222;
    if (!_1200)
    {
        int _1228 = _1220 << 2;
        _1204 = _1228;
    }
    int _1230 = _1204;
    int _1232 = _1230;
    if (!_1200)
    {
        uint _1235 = uint(int(uint(_1220) >> uint(2)));
        _1206 = int(_1235);
    }
    int _1237 = _1206;
    if (!_1200)
    {
        int _1239 = 12 & _1230;
        _1232 = _1239;
    }
    int _1241 = _1232;
    if (!_1200)
    {
        int _1243 = _1237 << 4;
        int _1245 = _1243 + _1241;
        _988 = as_type<float>(_1245);
    }
    float _1247 = _988;
    float _1249 = fma(_954, 6.2500002968590706586837768554688e-05, 0.5);
    float _1251 = as_type<float>(_1237);
    if (!_1200)
    {
        float _1253 = floor(_1168);
        _1251 = _1253;
    }
    float _1255 = _1251;
    if (!_1200)
    {
        float _1257 = -_1226;
        float _1259 = _1166 + _1257;
        _990 = _1259;
    }
    float _1261 = _990;
    float _1263 = _1247;
    if (!_1200)
    {
        int _1265 = as_type<int>(_1247) + 400;
        uint _1267 = uint(int(uint(_1265) >> uint(2)));
        uint _1269 = uint(int(uint(int(_1267)) >> uint(2)));
        int _1271 = int(_1267) & 3;
        float _1273 = (*spvDescriptorSet0.vp_c15)._m0[int(_1269)][_1271];
        _1263 = _1273;
    }
    float _1275 = _1263;
    if (!_1200)
    {
        float _1277 = -_1255;
        float _1279 = _1168 + _1277;
        _1208 = _1279;
    }
    float _1281 = _1208;
    float _1283 = fma(_950, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4195 = float2(_1283, _1249);
    float _1285 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_4195, float2(0.0), isnan(_4195)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_4195, float2(0.0), isnan(_4195)), level(0.0)).x;
    float _1287 = _740;
    if (!_1200)
    {
        float _1289 = rint(_1275);
        float _1291 = precise::max(_1289, 0.0);
        uint _1293 = uint(_1291);
        uint _1295 = clamp(_1293, 0u, 65535u);
        _1287 = as_type<float>(_1295);
    }
    float _1297 = _1287;
    float _1299 = _1281;
    if (!_1200)
    {
        float3 _4230 = float3(_1261, _1281, float(as_type<int>(_1297)));
        float3 _4234 = select(_4230, float3(0.0), isnan(_4230));
        float _1301 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4234.xy, uint(rint(_4234.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4234.xy, uint(rint(_4234.z)), level(0.0)).x;
        _1299 = _1301;
    }
    float _1303 = _1299;
    float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1307 = _1144 + _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1311 = _1146 + _1309;
    float _1313 = _1307 * _1307;
    bool _1315 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1319 = _1315 || _1317;
    bool _1321 = isnan(0.5);
    bool _1323 = _1319 || _1321;
    float _1325 = fma(_1311, _1311, _1313);
    float _1327 = sqrt(_1325);
    bool _1329 = _1327 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1331 = !_1329;
    float _1333 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_1331)
    {
        float _1335 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1337 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1339 = _1327 + _1337;
        float _1341 = _1148 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1343 = rsqrt(_1325);
        float _1345 = _1339 * _1335;
        float _1347 = _1345 * 0.15915493667125701904296875;
        float _1349 = _1347 * 6.283185482025146484375;
        float _1351 = sin(_1349);
        float _1353 = _1347 * 6.283185482025146484375;
        float _1355 = cos(_1353);
        float _1357 = fma(_1351, _1341, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1359 = _1343 * _1357;
        float _1361 = _1355 + (-1.0);
        float _1363 = fma(_1311, _1359, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1365 = fma(_1307, _1359, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1367 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1369 = fma(_1355, _1148, _1367);
        _1210 = _1369;
        _1212 = _1363;
        _1214 = _1365;
        _1333 = _1367;
    }
    float _1371 = _1210;
    float _1373 = _1212;
    float _1375 = _1214;
    float _1377 = _1333;
    float _1379 = _1377;
    float _1381 = _1373;
    float _1383 = _1375;
    if (_1323)
    {
        _1379 = _1371;
    }
    float _1385 = _1379;
    float _1387 = _1385;
    if (!_1323)
    {
        float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1391 = _952 + _1389;
        float _1393 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1395 = _950 + _1393;
        float _1397 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1399 = -_952;
        float _1401 = _1399 + _1371;
        float _1403 = _1391 * _1391;
        float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1407 = _954 + _1405;
        float _1409 = -_950;
        float _1411 = _1409 + _1373;
        float _1413 = fma(_1395, _1395, _1403);
        float _1415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1417 = fma(_1407, _1407, _1413);
        float _1419 = sqrt(_1417);
        float _1421 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1423 = precise::min(_1419, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1425 = _1423 * _1415;
        float _1427 = _1421 * _1425;
        float _1429 = -_954;
        float _1431 = _1429 + _1375;
        float _1433 = fma(_1401, _1427, _952);
        float _1435 = fma(_1411, _1427, _950);
        float _1437 = fma(_1431, _1427, _954);
        _1387 = _1433;
        _1381 = _1435;
        _1383 = _1437;
    }
    float _1439 = _1387;
    float _1441 = _1381;
    float _1443 = _1383;
    float _1445 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1447 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1449 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1451 = abs(_1285);
    bool _1453 = _1451 != 0.0;
    bool _1455 = isnan(_1451);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan(0.0);
    bool _1461 = _1457 || _1459;
    float _1463 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1445);
    float _1465 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1447);
    float _1467 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1449);
    float _1469 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1471 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1463);
    float _1473 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1465);
    float _1475 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1467);
    float _1477 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1469);
    float _1479 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1481 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1483 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1485 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1477);
    float _1487 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1489 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1491 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1493 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1495 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1487);
    float _1497 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1499 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1489);
    float _1501 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1491);
    float _1503 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1495);
    float _1505 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1493);
    float _1507 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1499);
    float _1509 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1501);
    float _1511 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1503);
    float _1513 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1505);
    float _1515 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1507);
    float _1517 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1509);
    float _1519 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1513);
    bool _1521 = _146 > 0.001000000047497451305389404296875;
    bool _1523 = isnan(_146);
    bool _1525 = _1521 || _1523;
    bool _1527 = isnan(0.001000000047497451305389404296875);
    bool _1529 = _1525 || _1527;
    float _1531 = _1509;
    float _1533 = _1511;
    float _1535 = _1515;
    if (_1461)
    {
        _148 = _1519;
    }
    float _1537 = _148;
    out.gl_Position.x = _1511;
    out.gl_Position.y = _1515;
    out.gl_Position.z = _1517;
    out.gl_Position.w = _1519;
    float _1539 = _1537;
    if (!_1461)
    {
        _1539 = 0.0;
    }
    float _1541 = _1539;
    float _1543 = _1541;
    if (!_1461)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_1200)
    {
        int _1545 = _1220 << 4;
        int _1547 = _1545 + 2048;
        uint _1549 = uint(int(uint(_1547) >> uint(2)));
        uint _1551 = uint(int(uint(int(_1549)) >> uint(2)));
        int _1553 = int(_1549) & 3;
        float _1555 = (*spvDescriptorSet0.vp_c15)._m0[int(_1551)][_1553];
        int _1557 = int(_1549) + 1;
        uint _1559 = uint(int(uint(_1557) >> uint(2)));
        int _1561 = _1557 & 3;
        float _1563 = (*spvDescriptorSet0.vp_c15)._m0[int(_1559)][_1561];
        int _1565 = _1547 + 8;
        uint _1567 = uint(int(uint(_1565) >> uint(2)));
        uint _1569 = uint(int(uint(int(_1567)) >> uint(2)));
        int _1571 = int(_1567) & 3;
        float _1573 = (*spvDescriptorSet0.vp_c15)._m0[int(_1569)][_1571];
        int _1575 = int(_1567) + 1;
        uint _1577 = uint(int(uint(_1575) >> uint(2)));
        int _1579 = _1575 & 3;
        float _1581 = (*spvDescriptorSet0.vp_c15)._m0[int(_1577)][_1579];
        float _1583 = _1152 * _1563;
        float _1585 = fma(_950, _1555, _1583);
        float _1587 = fma(_954, _1573, _1585);
        float _1589 = _1587 + _1581;
        float _1591 = precise::clamp(_1589, 0.0, 1.0);
        float _1593 = -_1591;
        float _1595 = _1593 + _1303;
        float _1597 = fma(_1595, 500.0, 1.5);
        float _1599 = exp2(_1597);
        float _1601 = 0.0 + _1599;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        bool _1605 = _1603 >= 1.0;
        bool _1607 = isnan(_1603);
        bool _1609 = _1605 || _1607;
        bool _1611 = isnan(1.0);
        bool _1613 = _1609 || _1611;
        _1531 = _1563;
        if (!_1613)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_1613)
        {
            _1543 = 0.0;
        }
    }
    float _1615 = _1531;
    float _1617 = _1543;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1621 = _1439 + _1619;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1625 = _1441 + _1623;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1629 = _1443 + _1627;
    float _1631 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1633 = _1621 * _1621;
    float _1635 = _1615;
    float _1637 = _1621;
    if (!_1529)
    {
        _1533 = 0.0;
    }
    float _1639 = _1533;
    if (!_1529)
    {
        _1535 = 0.0;
    }
    float _1641 = _1535;
    float _1643 = fma(_1625, _1625, _1633);
    float _1645 = fma(_1629, _1629, _1643);
    float _1647 = rsqrt(_1645);
    float _1649 = _1647 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1651 = _1625 * _1649;
    float _1653 = _1629 * _1649;
    float _1655 = _1651 * _1651;
    float _1657 = _1653 * _1653;
    float _1659 = _1655 + _1657;
    float _1661 = sqrt(_1659);
    bool _1663 = _1661 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1667 = _1661 + _1665;
    float _1669 = _1629;
    float _1671 = _1659;
    float _1673 = _1667;
    float _1675 = _1651;
    if (_1663)
    {
        float _1677 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1669 = _1677;
    }
    float _1679 = _1669;
    if (_1663)
    {
        float _1681 = rsqrt(_1659);
        _1671 = _1681;
    }
    float _1683 = _1671;
    if (_1663)
    {
        float _1685 = _1667 * _1679;
        _1673 = _1685;
    }
    float _1687 = _1673;
    if (_1663)
    {
        float _1689 = _1687 * 0.15915493667125701904296875;
        _1635 = _1689;
    }
    float _1691 = _1635;
    float _1693 = _1647;
    float _1695 = _1691;
    if (_1663)
    {
        float _1697 = _1691 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        _1693 = _1699;
    }
    float _1701 = _1693;
    float _1703 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1705 = precise::max(0.0, _1703);
    float _1707 = _1303;
    float _1709 = _1705;
    float _1711 = _1703;
    if (_1663)
    {
        float _1713 = _1691 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        _1707 = _1715;
    }
    float _1717 = _1707;
    float _1719 = -_1649;
    float _1721 = -_1705;
    float _1723 = fma(_1621, _1719, _1721);
    if (_1663)
    {
        float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1709 = _1725;
    }
    float _1727 = _1709;
    float _1729 = _1701;
    float _1731 = _1727;
    if (_1663)
    {
        float _1733 = fma(_1701, _1727, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1637 = _1733;
    }
    float _1735 = _1637;
    float _1737 = _1735;
    if (!_1663)
    {
        _1729 = _1723;
    }
    float _1739 = _1729;
    float _1741 = _1739;
    if (!_1663)
    {
        _1731 = _1653;
    }
    float _1743 = _1731;
    float _1745 = _1743;
    float _1747 = _1717;
    if (_1663)
    {
        float _1749 = _1717 + (-1.0);
        _1711 = _1749;
    }
    float _1751 = _1711;
    float _1753 = _1751;
    if (_1663)
    {
        float _1755 = _1683 * _1735;
        _1695 = _1755;
    }
    float _1757 = _1695;
    if (!_1663)
    {
        _1737 = _1657;
    }
    float _1759 = _1737;
    float _1761 = _1759;
    if (_1663)
    {
        float _1763 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1753 = _1763;
    }
    float _1765 = _1753;
    if (_1663)
    {
        float _1767 = _1651 * _1757;
        _1675 = _1767;
    }
    float _1769 = _1675;
    if (_1663)
    {
        float _1771 = _1653 * _1757;
        _1745 = _1771;
    }
    float _1773 = _1745;
    if (_1663)
    {
        float _1775 = fma(_1723, _1717, _1765);
        _1741 = _1775;
    }
    float _1777 = _1741;
    if (!_1663)
    {
        _1747 = _1655;
    }
    float _1779 = _1747;
    float _1781 = _1779;
    if (_1663)
    {
        float _1783 = _1769 * _1769;
        _1781 = _1783;
    }
    float _1785 = _1781;
    float _1787 = sqrt(_1645);
    if (_1663)
    {
        float _1789 = _1773 * _1773;
        _1761 = _1789;
    }
    float _1791 = _1761;
    float _1793 = fma(_1777, _1777, _1785);
    float _1795 = _1793 + _1791;
    float _1797 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1799 = rsqrt(_1795);
    float _1801 = -_1631;
    float _1803 = fma(_1801, _1797, 1.0);
    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1807 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1805);
    float _1809 = precise::clamp(_1807, 0.0, 1.0);
    float _1811 = log2(_1803);
    float _1813 = -_1809;
    float _1815 = _1813 + 1.0;
    float _1817 = abs(_1815);
    float _1819 = log2(_1817);
    float _1821 = _1799 * _1769;
    float _1823 = _1799 * _1777;
    float _1825 = _1799 * _1773;
    float _1827 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1829 = 1.0 / _1617;
    float _1831 = -_1827;
    float _1833 = fma(_1823, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1831);
    float _1835 = _1811 * 0.693147182464599609375;
    float _1837 = -_1825;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1833);
    float _1841 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1843 = fma(_1839, -0.5, 0.5);
    float _1845 = fma(_1839, 0.5, 0.5);
    float _1847 = _1823 + 1.0;
    float _1849 = exp2(_1841);
    float _1851 = fma(_1845, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1853 = _1829 * _1639;
    float _1855 = _1829 * _1641;
    float _1857 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1859 = fma(_1845, _1851, -0.212114393711090087890625);
    float _1861 = fma(_1853, 0.5, 0.5);
    float _1863 = fma(_1855, -0.5, 0.5);
    float _1865 = sqrt(_1843);
    float _1867 = fma(_1845, _1859, 1.570728778839111328125);
    float3 _5157 = float3(_1861, _1863, _1857);
    float _1869 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5157, float3(0.0), isnan(_5157)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5157, float3(0.0), isnan(_5157)), level(0.0)).x;
    float _1871 = -_1823;
    float _1873 = fma(_1849, _1847, _1871);
    float _1875 = fma(_1873, 0.5, 0.5);
    float _1877 = _1865 * 0.636619746685028076171875;
    float _1879 = -_1867;
    float _1881 = fma(_1877, _1879, 1.0);
    float3 _5182 = float3(_1861, _1863, _1857);
    float4 _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5182, float3(0.0), isnan(_5182)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5182, float3(0.0), isnan(_5182)), level(0.0)).xyzw;
    float _1886 = _1884.x;
    float _1888 = _1884.y;
    float _1890 = _1884.z;
    float _1892 = _1884.w;
    float2 _5198 = float2(_1881, _1875);
    float3 _1896 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5198, float2(0.0), isnan(_5198)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5198, float2(0.0), isnan(_5198)), level(0.0)).xyz;
    float _1898 = _1896.x;
    float _1900 = _1896.y;
    float _1902 = _1896.z;
    float _1904 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1906 = _1517 + _1519;
    bool _1908 = _1787 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1910 = isnan(_1787);
    bool _1912 = _1908 || _1910;
    bool _1914 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1916 = _1912 || _1914;
    float _1918 = _958 * _1904;
    float _1920 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1922 = _1906 * 0.5;
    if (!_1529)
    {
        _992 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1924 = _992;
    float _1926 = exp2(_1920);
    out.m_87.z = _1922;
    out.m_87.w = _1519;
    int _1928 = as_type<int>(_1924);
    float _1930 = 0.0;
    float _1932 = 0.0;
    if (!_1529)
    {
        float _1934 = _1924 * 5.0;
        _1928 = as_type<int>(_1934);
    }
    int _1936 = _1928;
    float _1938 = as_type<float>(_1936);
    if (!_1529)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5274 = as_type<float>(_1936);
        out.gl_Position.z = _5274;
    }
    float _1940 = -_1926;
    float _1942 = _1940 + 1.0;
    float _1944 = _1926;
    if (_1529)
    {
        _1944 = _1918;
    }
    float _1946 = _1944;
    float _1948 = _1946;
    if (!_1529)
    {
        _1948 = 0.0;
    }
    float _1950 = _1948;
    float _1952 = _1942 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1916)
    {
        _1938 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1954 = _1938;
    float _1956 = _1954;
    float _1958 = _1954;
    if (!_1916)
    {
        _1930 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1960 = _1930;
    float _1962 = _1960;
    float _1964 = _1960;
    if (!_1916)
    {
        _1932 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1966 = _1932;
    float _1968 = _1952 * _1869;
    float _1970 = -_1952;
    float _1972 = _1970 + 1.0;
    float _1974 = _1892 * _1968;
    float _1976 = _1892 * _1972;
    float _1978 = _1902 * _1968;
    float _1980 = fma(_1898, _1974, _1886);
    float _1982 = fma(_1900, _1974, _1888);
    float _1984 = fma(_1892, _1978, _1890);
    out.m_89.x = _1980;
    out.m_89.y = _1982;
    out.m_89.z = _1984;
    out.m_89.w = _1976;
    bool _1986 = !_1916;
    float _1988 = _1966;
    float _1990 = _1966;
    if (!_1986)
    {
        bool _1992 = _1787 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1994 = isnan(_1787);
        bool _1996 = _1992 || _1994;
        bool _1998 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2000 = _1996 || _1998;
        if (!_2000)
        {
            float _2002 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2004 = _1787 + _2002;
            float _2006 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2008 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2006;
            float _2010 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2012 = _2010 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2014 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2016 = _2014 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2018 = 1.0 / _2008;
            float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2022 = _2020 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2024 = _2004 * _2018;
            float _2026 = precise::clamp(_2024, 0.0, 1.0);
            float _2028 = fma(_2026, _2012, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2030 = fma(_2026, _2016, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2032 = fma(_2026, _2022, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1964 = _2030;
            _1958 = _2028;
            _1990 = _2032;
            _2034 = true;
        }
        else
        {
            bool _2036 = _1787 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2038 = isnan(_1787);
            bool _2040 = _2036 || _2038;
            bool _2042 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2044 = _2040 || _2042;
            if (!_2044)
            {
                _1956 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2046 = _1956;
            _1958 = _2046;
            if (!_2044)
            {
                _1962 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2048 = _1962;
            _1964 = _2048;
            if (!_2044)
            {
                _1988 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2050 = _1988;
            bool _2052 = !_2044;
            _1990 = _2050;
            if (!_2052)
            {
                bool _2054 = _1787 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2056 = isnan(_1787);
                bool _2058 = _2054 || _2056;
                bool _2060 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2062 = _2058 || _2060;
                if (!_2062)
                {
                    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2066 = _1787 + _2064;
                    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2070 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2068;
                    float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2078 = _2076 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2080 = 1.0 / _2070;
                    float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2084 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2086 = _2066 * _2080;
                    float _2088 = precise::clamp(_2086, 0.0, 1.0);
                    float _2090 = fma(_2088, _2074, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2092 = fma(_2088, _2078, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2094 = fma(_2088, _2084, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1964 = _2092;
                    _1958 = _2090;
                    _1990 = _2094;
                    _2034 = true;
                }
                else
                {
                    _1964 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1958 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1990 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2034 = false;
    float _2096 = _1964;
    float _2098 = _1958;
    float _2100 = _1990;
    float _2102 = _2096 * 0.586610972881317138671875;
    bool _2104 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2106 = _1950 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _2108 = fma(_2098, 0.298911988735198974609375, _2102);
    out.m_58.x = _2106;
    float _2110 = fma(_2100, 0.114477999508380889892578125, _2108);
    float _2112 = -_2110;
    float _2114 = _2112 + _2098;
    float _2116 = -_2110;
    float _2118 = _2116 + _2096;
    float _2120 = -_2110;
    float _2122 = _2120 + _2100;
    float _2124 = fma(_2114, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2110);
    float _2126 = fma(_2118, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2110);
    float _2128 = fma(_2122, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2110);
    out.m_93.x = _2124;
    out.m_93.y = _2126;
    out.m_93.z = _2128;
    if (!_2104)
    {
        return out;
    }
    float _2130 = -_1439;
    float _2132 = _2130 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2134 = -_1441;
    float _2136 = _2134 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2138 = -_1443;
    float _2140 = _2138 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2142 = _2132 * _2132;
    float _2144 = fma(_2136, _2136, _2142);
    float _2146 = fma(_2140, _2140, _2144);
    float _2148 = sqrt(_2146);
    float _2150 = rsqrt(_2146);
    float _2152 = -_2148;
    float _2154 = _2152 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2156 = _2154 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2158 = precise::clamp(_2156, 0.0, 1.0);
    float _2160 = _2136 * _2150;
    float _2162 = _2132 * _2150;
    float _2164 = abs(_2158);
    float _2166 = log2(_2164);
    float _2168 = _2140 * _2150;
    float _2170 = _2160 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2172 = _906 * _2162;
    float _2174 = -_2162;
    float _2176 = -_2170;
    float _2178 = fma(_2174, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2176);
    float _2180 = fma(_908, _2160, _2172);
    float _2182 = -_2168;
    float _2184 = fma(_2182, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2178);
    float _2186 = fma(_910, _2168, _2180);
    float _2188 = precise::clamp(_2186, 0.0, 1.0);
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2192 = _2184 + _2190;
    float _2194 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2196 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2198 = precise::clamp(_2196, 0.0, 1.0);
    float _2200 = exp2(_2194);
    float _2202 = _2200 * _2198;
    float _2204 = _2188 * _2202;
    float _2206 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2208 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2210 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _2206;
    out.m_91.y = _2208;
    out.m_91.z = _2210;
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
    bool _2034 = false;
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
        float _2268 = as_type<float>(_128);
        out.gl_Position.z = _2268;
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
        float _2338 = as_type<float>(_166);
        out.gl_Position.z = _2338;
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
    float _966 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _968 = _946;
    float _970 = _820;
    float _972 = _948;
    float _974 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _976 = _948;
    float _978 = _820;
    float _980 = _842;
    float _982 = _872;
    float _984 = _836;
    float _986 = _938;
    float _988 = as_type<float>(_914);
    float _990 = _898;
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
            _1004 = _1034;
            if (_1028)
            {
                _970 = 0.0;
            }
            float _1036 = _970;
            _978 = _1036;
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
            _976 = _1042;
            _1008 = _1042;
        }
        if ((!_1046) || _998)
        {
            _998 = false;
            float _1048 = _974;
            float _1050 = _976;
            float _1052 = _978;
            bool _1054 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1056 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1058 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1060 = _1048;
            float _1062 = _1050;
            float _1064 = _1052;
            _1004 = _960;
            if (_1054)
            {
                float _1066 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1060 = _1066;
            }
            float _1068 = _1060;
            if (_1054)
            {
                float _1070 = abs(_836);
                float _1072 = -_1070;
                float _1074 = _1072 + 1.0;
                _1062 = _1074;
            }
            float _1076 = _1062;
            float _1078 = _1076;
            if (_1056)
            {
                float _1080 = abs(_842);
                float _1082 = -_1080;
                float _1084 = _1082 + 1.0;
                _980 = _1084;
            }
            float _1086 = _980;
            if (!_1054)
            {
                _1064 = 1.0;
            }
            float _1088 = _1064;
            float _1090 = _1088;
            if (_1058)
            {
                float _1092 = abs(_872);
                float _1094 = -_1092;
                float _1096 = _1094 + 1.0;
                _982 = _1096;
            }
            float _1098 = _982;
            if (!_1056)
            {
                _984 = 1.0;
            }
            float _1100 = _984;
            float _1102 = _856;
            float _1104 = _1100;
            if (_1056)
            {
                float _1106 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1102 = _1106;
            }
            float _1108 = _1102;
            float _1110 = _938;
            if (_1058)
            {
                float _1112 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1110 = _1112;
            }
            float _1114 = _1110;
            if (_1054)
            {
                float _1116 = _1076 * _1068;
                float _1118 = precise::clamp(_1116, 0.0, 1.0);
                _1090 = _1118;
            }
            float _1120 = _1090;
            if (!_1058)
            {
                _1078 = 1.0;
            }
            float _1122 = _1078;
            float _1124 = _1122;
            _1002 = _964;
            if (_1056)
            {
                float _1126 = _1086 * _1108;
                float _1128 = precise::clamp(_1126, 0.0, 1.0);
                _1104 = _1128;
            }
            float _1130 = _1104;
            float _1132 = _1120 * _1130;
            _986 = _1114;
            _1006 = _962;
            if (_1058)
            {
                float _1134 = _1098 * _1114;
                float _1136 = precise::clamp(_1134, 0.0, 1.0);
                _1124 = _1136;
            }
            float _1138 = _1124;
            float _1140 = _1132 * _1138;
            _1008 = _1140;
        }
    }
    _1010 = false;
    float _1142 = _986;
    float _1144 = _1002;
    float _1146 = _1004;
    float _1148 = _1006;
    float _1150 = _1008;
    float _1152 = _952 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1154 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1156 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1158 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1154);
    float _1160 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1156);
    float _1162 = fma(_954, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1158);
    float _1164 = fma(_954, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1160);
    float _1166 = _1162 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1168 = _1164 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1170 = trunc(_1166);
    int _1172 = int(_1170);
    float _1174 = trunc(_1168);
    int _1176 = int(_1174);
    int _1178 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1180 = _1172 + _1178;
    int _1182 = _1180 + 1;
    bool _1184 = _1182 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1186 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1188 = _1176 + _1186;
    int _1190 = _1188 + 1;
    int _1192 = _1182 | _1190;
    bool _1194 = _1192 < 0;
    bool _1196 = _1194 || _1184;
    bool _1198 = _1190 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1200 = _1198 || _1196;
    int _1202 = _1182;
    int _1204 = _1192;
    int _1206 = _1190;
    float _1208 = _1164;
    float _1210 = _1148;
    float _1212 = _1146;
    float _1214 = _1144;
    if (!_1200)
    {
        int _1216 = _1190 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1218 = _1216 + _1182;
        _1202 = _1218;
    }
    int _1220 = _1202;
    float _1222 = _1142;
    if (!_1200)
    {
        float _1224 = floor(_1166);
        _1222 = _1224;
    }
    float _1226 = _1222;
    if (!_1200)
    {
        int _1228 = _1220 << 2;
        _1204 = _1228;
    }
    int _1230 = _1204;
    int _1232 = _1230;
    if (!_1200)
    {
        uint _1235 = uint(int(uint(_1220) >> uint(2)));
        _1206 = int(_1235);
    }
    int _1237 = _1206;
    if (!_1200)
    {
        int _1239 = 12 & _1230;
        _1232 = _1239;
    }
    int _1241 = _1232;
    if (!_1200)
    {
        int _1243 = _1237 << 4;
        int _1245 = _1243 + _1241;
        _988 = as_type<float>(_1245);
    }
    float _1247 = _988;
    float _1249 = fma(_954, 6.2500002968590706586837768554688e-05, 0.5);
    float _1251 = as_type<float>(_1237);
    if (!_1200)
    {
        float _1253 = floor(_1168);
        _1251 = _1253;
    }
    float _1255 = _1251;
    if (!_1200)
    {
        float _1257 = -_1226;
        float _1259 = _1166 + _1257;
        _990 = _1259;
    }
    float _1261 = _990;
    float _1263 = _1247;
    if (!_1200)
    {
        int _1265 = as_type<int>(_1247) + 400;
        uint _1267 = uint(int(uint(_1265) >> uint(2)));
        uint _1269 = uint(int(uint(int(_1267)) >> uint(2)));
        int _1271 = int(_1267) & 3;
        float _1273 = (*spvDescriptorSet0.vp_c15)._m0[int(_1269)][_1271];
        _1263 = _1273;
    }
    float _1275 = _1263;
    if (!_1200)
    {
        float _1277 = -_1255;
        float _1279 = _1168 + _1277;
        _1208 = _1279;
    }
    float _1281 = _1208;
    float _1283 = fma(_950, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4195 = float2(_1283, _1249);
    float _1285 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_4195, float2(0.0), isnan(_4195)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_4195, float2(0.0), isnan(_4195)), level(0.0)).x;
    float _1287 = _740;
    if (!_1200)
    {
        float _1289 = rint(_1275);
        float _1291 = precise::max(_1289, 0.0);
        uint _1293 = uint(_1291);
        uint _1295 = clamp(_1293, 0u, 65535u);
        _1287 = as_type<float>(_1295);
    }
    float _1297 = _1287;
    float _1299 = _1281;
    if (!_1200)
    {
        float3 _4230 = float3(_1261, _1281, float(as_type<int>(_1297)));
        float3 _4234 = select(_4230, float3(0.0), isnan(_4230));
        float _1301 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4234.xy, uint(rint(_4234.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4234.xy, uint(rint(_4234.z)), level(0.0)).x;
        _1299 = _1301;
    }
    float _1303 = _1299;
    float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1307 = _1144 + _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1311 = _1146 + _1309;
    float _1313 = _1307 * _1307;
    bool _1315 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1319 = _1315 || _1317;
    bool _1321 = isnan(0.5);
    bool _1323 = _1319 || _1321;
    float _1325 = fma(_1311, _1311, _1313);
    float _1327 = sqrt(_1325);
    bool _1329 = _1327 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1331 = !_1329;
    float _1333 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_1331)
    {
        float _1335 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1337 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1339 = _1327 + _1337;
        float _1341 = _1148 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1343 = rsqrt(_1325);
        float _1345 = _1339 * _1335;
        float _1347 = _1345 * 0.15915493667125701904296875;
        float _1349 = _1347 * 6.283185482025146484375;
        float _1351 = sin(_1349);
        float _1353 = _1347 * 6.283185482025146484375;
        float _1355 = cos(_1353);
        float _1357 = fma(_1351, _1341, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1359 = _1343 * _1357;
        float _1361 = _1355 + (-1.0);
        float _1363 = fma(_1311, _1359, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1365 = fma(_1307, _1359, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1367 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1369 = fma(_1355, _1148, _1367);
        _1210 = _1369;
        _1212 = _1363;
        _1214 = _1365;
        _1333 = _1367;
    }
    float _1371 = _1210;
    float _1373 = _1212;
    float _1375 = _1214;
    float _1377 = _1333;
    float _1379 = _1377;
    float _1381 = _1373;
    float _1383 = _1375;
    if (_1323)
    {
        _1379 = _1371;
    }
    float _1385 = _1379;
    float _1387 = _1385;
    if (!_1323)
    {
        float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1391 = _952 + _1389;
        float _1393 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1395 = _950 + _1393;
        float _1397 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1399 = -_952;
        float _1401 = _1399 + _1371;
        float _1403 = _1391 * _1391;
        float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1407 = _954 + _1405;
        float _1409 = -_950;
        float _1411 = _1409 + _1373;
        float _1413 = fma(_1395, _1395, _1403);
        float _1415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1417 = fma(_1407, _1407, _1413);
        float _1419 = sqrt(_1417);
        float _1421 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1423 = precise::min(_1419, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1425 = _1423 * _1415;
        float _1427 = _1421 * _1425;
        float _1429 = -_954;
        float _1431 = _1429 + _1375;
        float _1433 = fma(_1401, _1427, _952);
        float _1435 = fma(_1411, _1427, _950);
        float _1437 = fma(_1431, _1427, _954);
        _1387 = _1433;
        _1381 = _1435;
        _1383 = _1437;
    }
    float _1439 = _1387;
    float _1441 = _1381;
    float _1443 = _1383;
    float _1445 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1447 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1449 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1451 = abs(_1285);
    bool _1453 = _1451 != 0.0;
    bool _1455 = isnan(_1451);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan(0.0);
    bool _1461 = _1457 || _1459;
    float _1463 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1445);
    float _1465 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1447);
    float _1467 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1449);
    float _1469 = _1439 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1471 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1463);
    float _1473 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1465);
    float _1475 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1467);
    float _1477 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1469);
    float _1479 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1481 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1483 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1485 = fma(_1443, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1477);
    float _1487 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1489 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1491 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1493 = _1479 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1495 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1487);
    float _1497 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1499 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1489);
    float _1501 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1491);
    float _1503 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1495);
    float _1505 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1493);
    float _1507 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1499);
    float _1509 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1501);
    float _1511 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1503);
    float _1513 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1505);
    float _1515 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1507);
    float _1517 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1509);
    float _1519 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1513);
    bool _1521 = _146 > 0.001000000047497451305389404296875;
    bool _1523 = isnan(_146);
    bool _1525 = _1521 || _1523;
    bool _1527 = isnan(0.001000000047497451305389404296875);
    bool _1529 = _1525 || _1527;
    float _1531 = _1509;
    float _1533 = _1511;
    float _1535 = _1515;
    if (_1461)
    {
        _148 = _1519;
    }
    float _1537 = _148;
    out.gl_Position.x = _1511;
    out.gl_Position.y = _1515;
    out.gl_Position.z = _1517;
    out.gl_Position.w = _1519;
    float _1539 = _1537;
    if (!_1461)
    {
        _1539 = 0.0;
    }
    float _1541 = _1539;
    float _1543 = _1541;
    if (!_1461)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_1200)
    {
        int _1545 = _1220 << 4;
        int _1547 = _1545 + 2048;
        uint _1549 = uint(int(uint(_1547) >> uint(2)));
        uint _1551 = uint(int(uint(int(_1549)) >> uint(2)));
        int _1553 = int(_1549) & 3;
        float _1555 = (*spvDescriptorSet0.vp_c15)._m0[int(_1551)][_1553];
        int _1557 = int(_1549) + 1;
        uint _1559 = uint(int(uint(_1557) >> uint(2)));
        int _1561 = _1557 & 3;
        float _1563 = (*spvDescriptorSet0.vp_c15)._m0[int(_1559)][_1561];
        int _1565 = _1547 + 8;
        uint _1567 = uint(int(uint(_1565) >> uint(2)));
        uint _1569 = uint(int(uint(int(_1567)) >> uint(2)));
        int _1571 = int(_1567) & 3;
        float _1573 = (*spvDescriptorSet0.vp_c15)._m0[int(_1569)][_1571];
        int _1575 = int(_1567) + 1;
        uint _1577 = uint(int(uint(_1575) >> uint(2)));
        int _1579 = _1575 & 3;
        float _1581 = (*spvDescriptorSet0.vp_c15)._m0[int(_1577)][_1579];
        float _1583 = _1152 * _1563;
        float _1585 = fma(_950, _1555, _1583);
        float _1587 = fma(_954, _1573, _1585);
        float _1589 = _1587 + _1581;
        float _1591 = precise::clamp(_1589, 0.0, 1.0);
        float _1593 = -_1591;
        float _1595 = _1593 + _1303;
        float _1597 = fma(_1595, 500.0, 1.5);
        float _1599 = exp2(_1597);
        float _1601 = 0.0 + _1599;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        bool _1605 = _1603 >= 1.0;
        bool _1607 = isnan(_1603);
        bool _1609 = _1605 || _1607;
        bool _1611 = isnan(1.0);
        bool _1613 = _1609 || _1611;
        _1531 = _1563;
        if (!_1613)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_1613)
        {
            _1543 = 0.0;
        }
    }
    float _1615 = _1531;
    float _1617 = _1543;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1621 = _1439 + _1619;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1625 = _1441 + _1623;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1629 = _1443 + _1627;
    float _1631 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1633 = _1621 * _1621;
    float _1635 = _1615;
    float _1637 = _1621;
    if (!_1529)
    {
        _1533 = 0.0;
    }
    float _1639 = _1533;
    if (!_1529)
    {
        _1535 = 0.0;
    }
    float _1641 = _1535;
    float _1643 = fma(_1625, _1625, _1633);
    float _1645 = fma(_1629, _1629, _1643);
    float _1647 = rsqrt(_1645);
    float _1649 = _1647 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1651 = _1625 * _1649;
    float _1653 = _1629 * _1649;
    float _1655 = _1651 * _1651;
    float _1657 = _1653 * _1653;
    float _1659 = _1655 + _1657;
    float _1661 = sqrt(_1659);
    bool _1663 = _1661 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1667 = _1661 + _1665;
    float _1669 = _1629;
    float _1671 = _1659;
    float _1673 = _1667;
    float _1675 = _1651;
    if (_1663)
    {
        float _1677 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1669 = _1677;
    }
    float _1679 = _1669;
    if (_1663)
    {
        float _1681 = rsqrt(_1659);
        _1671 = _1681;
    }
    float _1683 = _1671;
    if (_1663)
    {
        float _1685 = _1667 * _1679;
        _1673 = _1685;
    }
    float _1687 = _1673;
    if (_1663)
    {
        float _1689 = _1687 * 0.15915493667125701904296875;
        _1635 = _1689;
    }
    float _1691 = _1635;
    float _1693 = _1647;
    float _1695 = _1691;
    if (_1663)
    {
        float _1697 = _1691 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        _1693 = _1699;
    }
    float _1701 = _1693;
    float _1703 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1705 = precise::max(0.0, _1703);
    float _1707 = _1303;
    float _1709 = _1705;
    float _1711 = _1703;
    if (_1663)
    {
        float _1713 = _1691 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        _1707 = _1715;
    }
    float _1717 = _1707;
    float _1719 = -_1649;
    float _1721 = -_1705;
    float _1723 = fma(_1621, _1719, _1721);
    if (_1663)
    {
        float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1709 = _1725;
    }
    float _1727 = _1709;
    float _1729 = _1701;
    float _1731 = _1727;
    if (_1663)
    {
        float _1733 = fma(_1701, _1727, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1637 = _1733;
    }
    float _1735 = _1637;
    float _1737 = _1735;
    if (!_1663)
    {
        _1729 = _1723;
    }
    float _1739 = _1729;
    float _1741 = _1739;
    if (!_1663)
    {
        _1731 = _1653;
    }
    float _1743 = _1731;
    float _1745 = _1743;
    float _1747 = _1717;
    if (_1663)
    {
        float _1749 = _1717 + (-1.0);
        _1711 = _1749;
    }
    float _1751 = _1711;
    float _1753 = _1751;
    if (_1663)
    {
        float _1755 = _1683 * _1735;
        _1695 = _1755;
    }
    float _1757 = _1695;
    if (!_1663)
    {
        _1737 = _1657;
    }
    float _1759 = _1737;
    float _1761 = _1759;
    if (_1663)
    {
        float _1763 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1753 = _1763;
    }
    float _1765 = _1753;
    if (_1663)
    {
        float _1767 = _1651 * _1757;
        _1675 = _1767;
    }
    float _1769 = _1675;
    if (_1663)
    {
        float _1771 = _1653 * _1757;
        _1745 = _1771;
    }
    float _1773 = _1745;
    if (_1663)
    {
        float _1775 = fma(_1723, _1717, _1765);
        _1741 = _1775;
    }
    float _1777 = _1741;
    if (!_1663)
    {
        _1747 = _1655;
    }
    float _1779 = _1747;
    float _1781 = _1779;
    if (_1663)
    {
        float _1783 = _1769 * _1769;
        _1781 = _1783;
    }
    float _1785 = _1781;
    float _1787 = sqrt(_1645);
    if (_1663)
    {
        float _1789 = _1773 * _1773;
        _1761 = _1789;
    }
    float _1791 = _1761;
    float _1793 = fma(_1777, _1777, _1785);
    float _1795 = _1793 + _1791;
    float _1797 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1799 = rsqrt(_1795);
    float _1801 = -_1631;
    float _1803 = fma(_1801, _1797, 1.0);
    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1807 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1805);
    float _1809 = precise::clamp(_1807, 0.0, 1.0);
    float _1811 = log2(_1803);
    float _1813 = -_1809;
    float _1815 = _1813 + 1.0;
    float _1817 = abs(_1815);
    float _1819 = log2(_1817);
    float _1821 = _1799 * _1769;
    float _1823 = _1799 * _1777;
    float _1825 = _1799 * _1773;
    float _1827 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1829 = 1.0 / _1617;
    float _1831 = -_1827;
    float _1833 = fma(_1823, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1831);
    float _1835 = _1811 * 0.693147182464599609375;
    float _1837 = -_1825;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1833);
    float _1841 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1843 = fma(_1839, -0.5, 0.5);
    float _1845 = fma(_1839, 0.5, 0.5);
    float _1847 = _1823 + 1.0;
    float _1849 = exp2(_1841);
    float _1851 = fma(_1845, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1853 = _1829 * _1639;
    float _1855 = _1829 * _1641;
    float _1857 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1859 = fma(_1845, _1851, -0.212114393711090087890625);
    float _1861 = fma(_1853, 0.5, 0.5);
    float _1863 = fma(_1855, -0.5, 0.5);
    float _1865 = sqrt(_1843);
    float _1867 = fma(_1845, _1859, 1.570728778839111328125);
    float3 _5157 = float3(_1861, _1863, _1857);
    float _1869 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5157, float3(0.0), isnan(_5157)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5157, float3(0.0), isnan(_5157)), level(0.0)).x;
    float _1871 = -_1823;
    float _1873 = fma(_1849, _1847, _1871);
    float _1875 = fma(_1873, 0.5, 0.5);
    float _1877 = _1865 * 0.636619746685028076171875;
    float _1879 = -_1867;
    float _1881 = fma(_1877, _1879, 1.0);
    float3 _5182 = float3(_1861, _1863, _1857);
    float4 _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5182, float3(0.0), isnan(_5182)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5182, float3(0.0), isnan(_5182)), level(0.0)).xyzw;
    float _1886 = _1884.x;
    float _1888 = _1884.y;
    float _1890 = _1884.z;
    float _1892 = _1884.w;
    float2 _5198 = float2(_1881, _1875);
    float3 _1896 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5198, float2(0.0), isnan(_5198)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5198, float2(0.0), isnan(_5198)), level(0.0)).xyz;
    float _1898 = _1896.x;
    float _1900 = _1896.y;
    float _1902 = _1896.z;
    float _1904 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1906 = _1517 + _1519;
    bool _1908 = _1787 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1910 = isnan(_1787);
    bool _1912 = _1908 || _1910;
    bool _1914 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1916 = _1912 || _1914;
    float _1918 = _958 * _1904;
    float _1920 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1922 = _1906 * 0.5;
    if (!_1529)
    {
        _992 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1924 = _992;
    float _1926 = exp2(_1920);
    out.m_87.z = _1922;
    out.m_87.w = _1519;
    int _1928 = as_type<int>(_1924);
    float _1930 = 0.0;
    float _1932 = 0.0;
    if (!_1529)
    {
        float _1934 = _1924 * 5.0;
        _1928 = as_type<int>(_1934);
    }
    int _1936 = _1928;
    float _1938 = as_type<float>(_1936);
    if (!_1529)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5274 = as_type<float>(_1936);
        out.gl_Position.z = _5274;
    }
    float _1940 = -_1926;
    float _1942 = _1940 + 1.0;
    float _1944 = _1926;
    if (_1529)
    {
        _1944 = _1918;
    }
    float _1946 = _1944;
    float _1948 = _1946;
    if (!_1529)
    {
        _1948 = 0.0;
    }
    float _1950 = _1948;
    float _1952 = _1942 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1916)
    {
        _1938 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1954 = _1938;
    float _1956 = _1954;
    float _1958 = _1954;
    if (!_1916)
    {
        _1930 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1960 = _1930;
    float _1962 = _1960;
    float _1964 = _1960;
    if (!_1916)
    {
        _1932 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1966 = _1932;
    float _1968 = _1952 * _1869;
    float _1970 = -_1952;
    float _1972 = _1970 + 1.0;
    float _1974 = _1892 * _1968;
    float _1976 = _1892 * _1972;
    float _1978 = _1902 * _1968;
    float _1980 = fma(_1898, _1974, _1886);
    float _1982 = fma(_1900, _1974, _1888);
    float _1984 = fma(_1892, _1978, _1890);
    out.m_89.x = _1980;
    out.m_89.y = _1982;
    out.m_89.z = _1984;
    out.m_89.w = _1976;
    bool _1986 = !_1916;
    float _1988 = _1966;
    float _1990 = _1966;
    if (!_1986)
    {
        bool _1992 = _1787 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1994 = isnan(_1787);
        bool _1996 = _1992 || _1994;
        bool _1998 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2000 = _1996 || _1998;
        if (!_2000)
        {
            float _2002 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2004 = _1787 + _2002;
            float _2006 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2008 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2006;
            float _2010 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2012 = _2010 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2014 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2016 = _2014 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2018 = 1.0 / _2008;
            float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2022 = _2020 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2024 = _2004 * _2018;
            float _2026 = precise::clamp(_2024, 0.0, 1.0);
            float _2028 = fma(_2026, _2012, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2030 = fma(_2026, _2016, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2032 = fma(_2026, _2022, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1964 = _2030;
            _1958 = _2028;
            _1990 = _2032;
            _2034 = true;
        }
        else
        {
            bool _2036 = _1787 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2038 = isnan(_1787);
            bool _2040 = _2036 || _2038;
            bool _2042 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2044 = _2040 || _2042;
            if (!_2044)
            {
                _1956 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2046 = _1956;
            _1958 = _2046;
            if (!_2044)
            {
                _1962 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2048 = _1962;
            _1964 = _2048;
            if (!_2044)
            {
                _1988 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2050 = _1988;
            bool _2052 = !_2044;
            _1990 = _2050;
            if (!_2052)
            {
                bool _2054 = _1787 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2056 = isnan(_1787);
                bool _2058 = _2054 || _2056;
                bool _2060 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2062 = _2058 || _2060;
                if (!_2062)
                {
                    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2066 = _1787 + _2064;
                    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2070 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2068;
                    float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2078 = _2076 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2080 = 1.0 / _2070;
                    float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2084 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2086 = _2066 * _2080;
                    float _2088 = precise::clamp(_2086, 0.0, 1.0);
                    float _2090 = fma(_2088, _2074, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2092 = fma(_2088, _2078, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2094 = fma(_2088, _2084, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1964 = _2092;
                    _1958 = _2090;
                    _1990 = _2094;
                    _2034 = true;
                }
                else
                {
                    _1964 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1958 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1990 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2034 = false;
    float _2096 = _1964;
    float _2098 = _1958;
    float _2100 = _1990;
    float _2102 = _2096 * 0.586610972881317138671875;
    bool _2104 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2106 = _1950 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _2108 = fma(_2098, 0.298911988735198974609375, _2102);
    out.m_58.x = _2106;
    float _2110 = fma(_2100, 0.114477999508380889892578125, _2108);
    float _2112 = -_2110;
    float _2114 = _2112 + _2098;
    float _2116 = -_2110;
    float _2118 = _2116 + _2096;
    float _2120 = -_2110;
    float _2122 = _2120 + _2100;
    float _2124 = fma(_2114, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2110);
    float _2126 = fma(_2118, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2110);
    float _2128 = fma(_2122, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2110);
    out.m_93.x = _2124;
    out.m_93.y = _2126;
    out.m_93.z = _2128;
    if (!_2104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2130 = -_1439;
    float _2132 = _2130 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2134 = -_1441;
    float _2136 = _2134 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2138 = -_1443;
    float _2140 = _2138 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2142 = _2132 * _2132;
    float _2144 = fma(_2136, _2136, _2142);
    float _2146 = fma(_2140, _2140, _2144);
    float _2148 = sqrt(_2146);
    float _2150 = rsqrt(_2146);
    float _2152 = -_2148;
    float _2154 = _2152 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2156 = _2154 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2158 = precise::clamp(_2156, 0.0, 1.0);
    float _2160 = _2136 * _2150;
    float _2162 = _2132 * _2150;
    float _2164 = abs(_2158);
    float _2166 = log2(_2164);
    float _2168 = _2140 * _2150;
    float _2170 = _2160 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2172 = _906 * _2162;
    float _2174 = -_2162;
    float _2176 = -_2170;
    float _2178 = fma(_2174, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2176);
    float _2180 = fma(_908, _2160, _2172);
    float _2182 = -_2168;
    float _2184 = fma(_2182, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2178);
    float _2186 = fma(_910, _2168, _2180);
    float _2188 = precise::clamp(_2186, 0.0, 1.0);
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2192 = _2184 + _2190;
    float _2194 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2196 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2198 = precise::clamp(_2196, 0.0, 1.0);
    float _2200 = exp2(_2194);
    float _2202 = _2200 * _2198;
    float _2204 = _2188 * _2202;
    float _2206 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2208 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2210 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _2206;
    out.m_91.y = _2208;
    out.m_91.z = _2210;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

