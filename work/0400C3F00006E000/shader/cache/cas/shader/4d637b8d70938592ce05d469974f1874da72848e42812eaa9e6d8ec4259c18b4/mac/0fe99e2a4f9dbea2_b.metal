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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
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
    float4 m_69 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_85 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_67 [[user(locn8)]];
    float4 m_81 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_75 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_77 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1354 = false;
    bool _412 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_46.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    if (!_108)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_108)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2077 = as_type<float>(_118);
        out.gl_Position.z = _2077;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_51.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = 0.0;
    if (_132)
    {
        float _140 = float(_104);
        _138 = _140;
    }
    float _142 = _138;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2146 = as_type<float>(_156);
        out.gl_Position.z = _2146;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_53.x;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _162 = _136 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _164 = in.m_55.x;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_55.y;
    int _178 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _180 = _178 != 0;
    float _182 = _162 * _160;
    float _184 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[20].x, _182);
    float _186 = in.m_51.x;
    float _188 = in.m_51.y;
    float _190 = in.m_51.z;
    float _192 = _184 * 6.283185482025146484375;
    float _194 = floor(_184);
    float _196 = _192 * 0.15915493667125701904296875;
    float _198 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _200 = 1.4012984643248170709237295832899e-45;
    float _202 = _198;
    if (!_174)
    {
        float _204 = _198 * _198;
        float _206 = _204 * 0.5;
        _200 = _206;
    }
    float _208 = _200;
    float _210 = _196 * 6.283185482025146484375;
    float _212 = cos(_210);
    float _214 = _208;
    if (!_174)
    {
        float _216 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _216;
    }
    float _218 = _214;
    float _220 = -_194;
    float _222 = _184 + _220;
    bool _224 = !_174;
    float _226 = _218;
    float _228 = _176;
    float _230 = _164;
    if (!_224)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = _198 * _234;
        float _244 = 1.0 / _238;
        float _246 = _240 * 0.693147182464599609375;
        float _248 = exp2(_242);
        float _250 = 1.0 / _246;
        float _252 = _248 + (-1.0);
        float _254 = -_252;
        float _256 = fma(_254, _250, _198);
        float _258 = _256 * _244;
        float _260 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _226 = _260;
    }
    float _262 = _226;
    bool _264 = !_174;
    if (!_264)
    {
        float _266 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _268 = log2(_266);
        float _270 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _272 = _270 + 1.0;
        float _274 = 1.0 / _272;
        float _276 = _198 * _268;
        float _278 = exp2(_276);
        float _280 = -_278;
        float _282 = _280 + 1.0;
        float _284 = _282 * _274;
        _202 = _284;
    }
    float _286 = _202;
    float _288 = in.m_46.x;
    float _290 = in.m_46.y;
    float _292 = in.m_46.z;
    float _294 = in.m_57.x;
    float _296 = in.m_57.y;
    float _298 = in.m_57.z;
    float _300 = in.m_57.w;
    bool _302 = _222 < 0.5;
    float _304 = float(_302);
    float _306 = fma(_212, 0.5, 0.5);
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _310 = _308 != 0;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _314 = _312 != 0;
    float _316 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _318 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _320 = -_304;
    float _322 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _324 = -_306;
    float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _328 = fma(_286, _186, _316);
    float _330 = fma(_286, _188, _318);
    bool _332 = !_180;
    int _334 = _332 ? 0 : 1;
    out.m_59.x = _164;
    bool _336 = !_310;
    int _338 = _336 ? 0 : 1;
    float _340 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _342 = abs(_334);
    out.m_59.y = _176;
    int _344 = abs(_338);
    float _346 = fma(_286, _190, _340);
    bool _348 = !_314;
    int _350 = _348 ? 0 : 1;
    float _352 = -_222;
    float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _356 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    int _358 = abs(_350);
    float _360 = fma(_346, _300, _292);
    float _362 = float(_344);
    float _364 = fma(_328, _300, _288);
    float _366 = float(_342);
    float _368 = _296 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _370 = abs(_354);
    float _372 = _362 * _370;
    float _374 = _294 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = fma(_330, _300, _290);
    float _378 = float(_358);
    float _380 = fma(_366, _326, _372);
    float _382 = _298 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = abs(_322);
    float _386 = fma(_378, _384, _380);
    bool _388 = !_356;
    int _390 = as_type<int>(_380);
    bool _392 = _310;
    float _408;
    float _410;
    if (!_388)
    {
        float _394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _396 = _158 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _398 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[11].x, _136);
        float _400 = _398 * _394;
        float _402 = floor(_400);
        float _404 = -_402;
        float _406 = _400 + _404;
        _408 = _406;
        _410 = _402;
        _412 = true;
    }
    else
    {
        float _414 = float(_104);
        float _416 = 1.0 / _414;
        float _418 = _136 * _416;
        _408 = _418;
        _410 = _414;
    }
    _412 = false;
    float _420 = _408;
    float _422 = _410;
    float _424 = in.m_53.w;
    float _426 = -_176;
    float _428 = _426 + 1.0;
    float _430 = in.m_53.y;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _434 = _432 != 0;
    float _436 = _376 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _440 = _438 != 0;
    float _442 = in.m_61.w;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _446 = _444 != 0;
    float _448 = _376 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _452 = _450 != 0;
    float _454 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _436);
    float _456 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _448);
    float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _460 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _462 = isnan(_420);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = _422;
    float _474 = _454;
    if (_434)
    {
        float _476 = -_164;
        float _478 = _476 + 1.0;
        _390 = as_type<int>(_478);
    }
    int _480 = _390;
    if (_434)
    {
        bool _482 = _158 > 0.5;
        _392 = _482;
    }
    bool _484 = _392;
    if (!_434)
    {
        _472 = _164;
    }
    float _486 = _472;
    float _488 = _486;
    if (_434)
    {
        float _490 = _484 ? as_type<float>(_480) : _164;
        _488 = _490;
    }
    float _492 = _488;
    float _494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _496 = _424 > 0.5;
    bool _498 = _430 > 0.5;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _502 = _500 != 0;
    out.m_63.w = _442;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _506 = _504 != 0;
    float _508 = _376 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _510 = _498 ? as_type<int>(_428) : as_type<int>(_176);
    float _512 = in.m_53.z;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _516 = _514 != 0;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _526 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _508);
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _530 = 1.0 / _520;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _536 = _420 + _534;
    float _538 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
    float _540 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].z, _456);
    float _542 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _544 = _496 ? as_type<int>(_428) : as_type<int>(_176);
    float _546 = 1.0 / _524;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _550 = _420 + _548;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _554 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _538 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _558 = _540 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _560 = _552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _562 = _550 * _530;
    float _564 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].z, _454);
    bool _566 = _512 > 0.5;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    int _576 = as_type<int>(_536);
    if (!_502)
    {
        _474 = _164;
    }
    float _578 = _474;
    out.m_65.x = _560;
    out.m_65.y = _542;
    out.m_65.z = _554;
    float _580 = _536 * _546;
    float _582 = _578;
    if (_502)
    {
        float _584 = -_164;
        float _586 = _584 + 1.0;
        _576 = as_type<int>(_586);
    }
    int _588 = _576;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _598 = fma(_574, _580, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    if (_502)
    {
        float _600 = _566 ? as_type<float>(_588) : _164;
        _582 = _600;
    }
    float _602 = _582;
    float _604 = _564 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _614 = fma(_596, _580, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _616 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _618 = _604 + _616;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _622 = _558 + _620;
    float _624 = fma(_612, _580, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _628 = _556 + _626;
    float _630 = _618 * _618;
    bool _632 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _634 = isnan(_420);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = fma(_608, _562, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _646 = fma(_570, _562, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _648 = fma(_628, _628, _630);
    float _650 = fma(_592, _562, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _652 = _440 ? as_type<float>(_510) : _176;
    float _654 = _458 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _656 = fma(_622, _622, _648);
    float _658 = _446 ? as_type<float>(_544) : _176;
    float _660 = -_642;
    float _662 = _660 + 1.0;
    bool _664 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _666 = isnan(_420);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = sqrt(_656);
    float _678 = _656;
    if (_452)
    {
        float _680 = _566 ? _428 : _176;
        _228 = _680;
    }
    float _682 = _228;
    float _684 = fma(_654, _602, -0.5);
    float _686 = _674 * _662;
    float _688 = -_674;
    float _690 = _688 + 1.0;
    bool _692 = _430 > 0.5;
    bool _694 = _692 && _506;
    float _696 = _386 * _374;
    float _698 = rsqrt(_656);
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _702 = _470 * _690;
    float _704 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = _494 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _708 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[88].w, _700);
    float _710 = _650 * _702;
    float _712 = _704 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _714 = _676 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _716 = _702;
    if (!_506)
    {
        _678 = _164;
    }
    float _718 = _678;
    float _720 = fma(_658, _706, -0.5);
    float _722 = _718;
    if (_694)
    {
        float _724 = -_164;
        float _726 = _724 + 1.0;
        _230 = _726;
    }
    float _728 = _230;
    float _730 = _644 * _702;
    float _732 = precise::min(_712, _714);
    float _734 = _646 * _702;
    float _736 = _730;
    if (_516)
    {
        _716 = _158;
    }
    float _738 = _716;
    float _740 = _618 * _698;
    float _742 = _738;
    if (_506)
    {
        _722 = _728;
    }
    float _744 = _722;
    float _746 = _628 * _698;
    if (!_516)
    {
        _742 = _512;
    }
    float _748 = _742;
    float _750 = _740 * _732;
    float _752 = _622 * _698;
    float _754 = _746 * _732;
    float _756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _758 = -_750;
    float _760 = _618 + _758;
    float _762 = _748 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _764 = -_754;
    float _766 = _628 + _764;
    float _768 = _752 * _732;
    float _770 = _760 * _760;
    float _772 = _652 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _774 = -_768;
    float _776 = _622 + _774;
    float _778 = fma(_766, _766, _770);
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _782 = 0.0;
    if (!_516)
    {
        _782 = _430;
    }
    float _784 = _782;
    float _786 = fma(_776, _776, _778);
    float _788 = _784;
    if (_516)
    {
        _788 = _158;
    }
    float _790 = _788;
    float _792 = -_780;
    float _794 = fma(_762, 2.0, _792);
    float _796 = _756 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _800 = sqrt(_786);
    float _802 = -_470;
    float _804 = _802 + 1.0;
    float _806 = fma(_796, _682, -0.5);
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _810 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[83].z, _798);
    float _812 = _790 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[107].x, _730);
    float _816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _818 = _790;
    float _820 = _808;
    if (!_516)
    {
        _818 = _512;
    }
    float _822 = _818;
    float _824 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[107].z, _710);
    float _826 = _822;
    if (!_516)
    {
        _736 = _512;
    }
    float _828 = _736;
    float _830 = -_808;
    float _832 = fma(_812, 2.0, _830);
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _836 = _828;
    if (_516)
    {
        _826 = _430;
    }
    float _838 = _826;
    float _840 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[107].y, _734);
    if (_516)
    {
        _836 = _430;
    }
    float _842 = _836;
    float _844 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[88].z, _834);
    if (_516)
    {
        _820 = _430;
    }
    float _846 = _820;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _850 = _698 * _800;
    float _852 = _846;
    if (!_516)
    {
        _852 = _158;
    }
    float _854 = _852;
    float _856 = fma(_598, _686, _840);
    float _858 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[83].w, _848);
    float _860 = _704 * _850;
    float _862 = _816 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _864 = fma(_614, _686, _824);
    float _866 = _838 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _868 = _860 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _870 = fma(_862, _744, -0.5);
    float _872 = fma(_624, _686, _814);
    float _874 = _740 * _868;
    float _876 = _618 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _878 = _746 * _868;
    float _880 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].z, _844);
    float _882 = -_874;
    float _884 = _618 + _882;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _888 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[28].x, _876);
    float _890 = -_136;
    float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[86].x, _794);
    float _894 = _884 * _884;
    float _896 = fma(_866, -2.0, _886);
    float _898 = -_878;
    float _900 = _628 + _898;
    float _902 = _752 * _868;
    float _904 = fma(_880, _870, _892);
    float _906 = -_136;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[81].x, _832);
    float _910 = fma(_900, _900, _894);
    float _912 = -_902;
    float _914 = _622 + _912;
    float _916 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].z, _810);
    float _918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _920 = fma(_914, _914, _910);
    float _922 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[28].z, _888);
    float _924 = fma(_916, _684, _908);
    float _926 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].w, _858);
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _930 = _854 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _932 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _934 = _922 >= 0.0;
    float _936 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[81].y, _896);
    float _938 = fma(_930, -2.0, _928);
    float _940 = _492 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _942 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].w, _708);
    float _944 = -_936;
    float _946 = fma(_926, _720, _944);
    float _948 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[86].y, _938);
    float _950 = sqrt(_920);
    float _952 = _940 * _918;
    float _954 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[109].x, _872);
    float _956 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[109].y, _856);
    float _958 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[109].z, _864);
    float _960 = -_948;
    float _962 = fma(_942, _806, _960);
    float _964 = _926;
    if (_934)
    {
        _964 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _966 = _964;
    float _968 = _954 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _970 = _772 * _932;
    float _972 = _946 + 0.5;
    float _974 = _958 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _976 = _924 + 0.5;
    float _978 = _968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _980 = as_type<int>(_966);
    if (_934)
    {
        float _982 = _966 * 5.0;
        _980 = as_type<int>(_982);
    }
    int _984 = _980;
    float _986 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _988 = _904 + 0.5;
    float _990 = _698 * _950;
    float _992 = _956 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _994 = _962 + 0.5;
    float _996 = _860 * _990;
    float _998 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _952;
    out.m_67.y = _970;
    out.m_67.z = _976;
    out.m_67.w = _972;
    out.m_69.x = _978;
    out.m_69.y = _998;
    out.m_69.z = _986;
    if (_934)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3565 = as_type<float>(_984);
        out.gl_Position.z = _3565;
    }
    out.m_71.w = _732;
    out.m_73.x = _988;
    out.m_73.y = _994;
    if (_934)
    {
        out.m_49.x = 0.0;
    }
    out.m_75.x = _996;
    if (_934)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1000 = -_874;
    float _1002 = _604 + _1000;
    float _1004 = -_878;
    float _1006 = _556 + _1004;
    float _1008 = -_902;
    float _1010 = _558 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1014 = _1002 + _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1018 = _1006 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1022 = _1010 + _1020;
    float _1024 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1026 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1024);
    float _1028 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1026);
    bool _1030 = _1028 >= 0.0;
    float _1032 = _1022;
    if (_1030)
    {
        _1032 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1034 = _1032;
    int _1036 = as_type<int>(_1034);
    if (_1030)
    {
        out.m_49.x = 0.0;
    }
    if (_1030)
    {
        float _1038 = _1034 * 5.0;
        _1036 = as_type<int>(_1038);
    }
    int _1040 = _1036;
    if (_1030)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3658 = as_type<float>(_1040);
        out.gl_Position.z = _3658;
    }
    if (_1030)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1042 = -_604;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1046 = -_556;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1050 = -_558;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1054 = _386 * _368;
    float _1056 = _1044 * _1044;
    float _1058 = _850 * _990;
    float _1060 = _386 * _382;
    float _1062 = _1054 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1064 = fma(_1048, _1048, _1056);
    float _1066 = _1060 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1068 = fma(_1052, _1052, _1064);
    float _1070 = rsqrt(_1068);
    float _1072 = _1048 * _1070;
    float _1074 = _1052 * _1070;
    float _1076 = _1044 * _1070;
    float _1078 = _1062 * _1058;
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1082 = _1072 * _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1086 = _1074 * _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1090 = _1076 * _1088;
    float _1092 = _1066 * _1058;
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1096 = -_1082;
    float _1098 = fma(_1074, _1094, _1096);
    float _1100 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1102 = -_1086;
    float _1104 = fma(_1076, _1100, _1102);
    float _1106 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1108 = -_1090;
    float _1110 = fma(_1072, _1106, _1108);
    float _1112 = in.m_77.x;
    float _1114 = in.m_77.y;
    float _1116 = in.m_77.z;
    float _1118 = _1098 * _1098;
    float _1120 = fma(_1104, _1104, _1118);
    float _1122 = fma(_1110, _1110, _1120);
    float _1124 = rsqrt(_1122);
    float _1126 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1114);
    float _1128 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1112);
    float _1130 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1116);
    float _1132 = _1078 * _1126;
    float _1134 = _996 * _1128;
    float _1136 = _1092 * _1130;
    float _1138 = _1104 * _1124;
    float _1140 = _1098 * _1124;
    float _1142 = _1110 * _1124;
    float _1144 = _1076 * _1138;
    float _1146 = _1074 * _1140;
    float _1148 = -_1144;
    float _1150 = fma(_1072, _1140, _1148);
    float _1152 = -_1146;
    float _1154 = fma(_1076, _1142, _1152);
    float _1156 = _1132 * _1150;
    float _1158 = _1132 * _1154;
    float _1160 = fma(_1134, _1142, _1156);
    float _1162 = fma(_1134, _1138, _1158);
    float _1164 = fma(_1136, _1074, _1160);
    float _1166 = fma(_1136, _1072, _1162);
    float _1168 = _1072 * _1142;
    float _1170 = _558 + _1164;
    float _1172 = _556 + _1166;
    float _1174 = -_1168;
    float _1176 = fma(_1074, _1138, _1174);
    float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1180 = _1170 + _1178;
    float _1182 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1184 = _1172 + _1182;
    float _1186 = _1132 * _1176;
    float _1188 = _1180 * _1180;
    float _1190 = fma(_1134, _1140, _1186);
    float _1192 = fma(_1184, _1184, _1188);
    float _1194 = fma(_1136, _1076, _1190);
    float _1196 = sqrt(_1192);
    float _1198 = _604 + _1194;
    bool _1200 = _1196 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1202 = _1194;
    float _1204 = _1134;
    float _1206 = _1136;
    if (!_1200)
    {
        _1202 = _1172;
    }
    float _1208 = _1202;
    float _1210 = _1208;
    if (!_1200)
    {
        _1204 = _1170;
    }
    float _1212 = _1204;
    float _1214 = _1212;
    if (!_1200)
    {
        _1206 = _1198;
    }
    float _1216 = _1206;
    bool _1218 = !_1200;
    float _1220 = _1216;
    if (!_1218)
    {
        float _1222 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1226 = _1196 + _1224;
        float _1228 = rsqrt(_1192);
        float _1230 = _1226 * _1222;
        float _1232 = _1198 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1234 = _1230 * 0.15915493667125701904296875;
        float _1236 = _1234 * 6.283185482025146484375;
        float _1238 = cos(_1236);
        float _1240 = _1234 * 6.283185482025146484375;
        float _1242 = sin(_1240);
        float _1244 = _1238 + (-1.0);
        float _1246 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1248 = fma(_1242, _1232, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1250 = fma(_1198, _1238, _1246);
        float _1252 = _1228 * _1248;
        float _1254 = fma(_1184, _1252, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1256 = fma(_1180, _1252, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1220 = _1250;
        _1210 = _1254;
        _1214 = _1256;
    }
    float _1258 = _1220;
    float _1260 = _1210;
    float _1262 = _1214;
    float _1264 = -_750;
    float _1266 = _1264 + _1258;
    float _1268 = -_754;
    float _1270 = _1268 + _1260;
    float _1272 = -_768;
    float _1274 = _1272 + _1262;
    float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1278 = _1266 + _1276;
    float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1282 = _1270 + _1280;
    float _1284 = -_754;
    float _1286 = _556 + _1284;
    float _1288 = -_750;
    float _1290 = _604 + _1288;
    float _1292 = _1278 * _1278;
    float _1294 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1296 = _1274 + _1294;
    float _1298 = -_768;
    float _1300 = _558 + _1298;
    float _1302 = fma(_1282, _1282, _1292);
    float _1304 = fma(_1296, _1296, _1302);
    float _1306 = sqrt(_1304);
    bool _1308 = _1306 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1310 = isnan(_1306);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1316 = _1312 || _1314;
    float _1318 = _1292;
    if (!_1316)
    {
        _1318 = 1.0;
    }
    float _1320 = _1318;
    bool _1322 = !_1316;
    float _1324 = _1320;
    if (!_1322)
    {
        bool _1326 = _1306 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1328 = isnan(_1306);
        bool _1330 = _1326 || _1328;
        bool _1332 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1334 = _1330 || _1332;
        if (!_1334)
        {
            float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1338 = _1306 + _1336;
            float _1340 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1342 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1340;
            float _1344 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1346 = _1344 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1348 = 1.0 / _1342;
            float _1350 = _1338 * _1348;
            float _1352 = fma(_1350, _1346, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1324 = _1352;
            _1354 = true;
        }
        else
        {
            bool _1356 = _1306 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1358 = isnan(_1306);
            bool _1360 = _1356 || _1358;
            bool _1362 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1364 = _1360 || _1362;
            if (!_1364)
            {
                float _1366 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1368 = _1306 + _1366;
                float _1370 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1372 = _1370 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1374 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1376 = _1374 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1378 = 1.0 / _1372;
                float _1380 = _1368 * _1378;
                float _1382 = fma(_1380, _1376, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1324 = _1382;
                _1354 = true;
            }
            else
            {
                _1324 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1354 = false;
    float _1384 = _1324;
    float _1386 = -_874;
    float _1388 = _1386 + _1290;
    float _1390 = -_878;
    float _1392 = _1390 + _1286;
    float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1396 = _1266 + _1394;
    float _1398 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1400 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1402 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan(0.5);
    bool _1408 = _1404 || _1406;
    float _1410 = -_902;
    float _1412 = _1410 + _1300;
    float _1414 = fma(_1396, _1384, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1416 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1398);
    float _1418 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1422 = _1270 + _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1426 = _1274 + _1424;
    float _1428 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1416);
    float _1430 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1418);
    float _1432 = -_874;
    float _1434 = _1432 + _1414;
    float _1436 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1438 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1430);
    float _1440 = fma(_1422, _1384, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1442 = fma(_1426, _1384, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1444 = 1.0 / _1436;
    float _1446 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1448 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan(0.5);
    bool _1456 = _1452 || _1454;
    float _1458 = -_878;
    float _1460 = _1458 + _1440;
    float _1462 = -_902;
    float _1464 = _1462 + _1442;
    float _1466 = _1446 + _1436;
    float _1468 = _1446;
    float _1470 = _1460;
    float _1472 = _1464;
    float _1474 = _1384;
    float _1476 = _1440;
    if (_1408)
    {
        _1468 = _1434;
    }
    float _1478 = _1468;
    float _1480 = _1478;
    float _1482 = _1444;
    if (!_1408)
    {
        float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1486 = _1388 + _1484;
        float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1490 = _1392 + _1488;
        float _1492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1494 = -_1300;
        float _1496 = _1494 + _1442;
        float _1498 = _1486 * _1486;
        float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1502 = _1412 + _1500;
        float _1504 = -_1286;
        float _1506 = _1504 + _1440;
        float _1508 = -_1290;
        float _1510 = _1508 + _1414;
        float _1512 = fma(_1490, _1490, _1498);
        float _1514 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1516 = fma(_1502, _1502, _1512);
        float _1518 = sqrt(_1516);
        float _1520 = 1.0 / _990;
        float _1522 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1524 = precise::min(_1518, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1526 = _1524 * _1492;
        float _1528 = _1526 * _1520;
        float _1530 = _1522 * _1528;
        float _1532 = _1496 * _1528;
        float _1534 = fma(_1506, _1530, _1392);
        float _1536 = fma(_1510, _1530, _1388);
        float _1538 = fma(_1522, _1532, _1412);
        _1480 = _1536;
        _1470 = _1534;
        _1472 = _1538;
        _1474 = _1518;
    }
    float _1540 = _1480;
    float _1542 = _1470;
    float _1544 = _1472;
    float _1546 = _1474;
    float _1548 = _1546;
    if (_1456)
    {
        _1548 = 1.0;
    }
    float _1550 = _1548;
    float _1552 = _1466 * _1444;
    float _1554 = _1552 * 0.5;
    float _1556 = _1550;
    float _1558 = _1554;
    if (!_1456)
    {
        float _1560 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1562 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1564 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1562);
        float _1566 = _1560 * 0.15915493667125701904296875;
        float _1568 = _1566 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        float _1572 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1574 = _1572 * 0.15915493667125701904296875;
        float _1576 = _1566 * 6.283185482025146484375;
        float _1578 = sin(_1576);
        float _1580 = 1.0 / _1570;
        float _1582 = _1574 * 6.283185482025146484375;
        float _1584 = cos(_1582);
        float _1586 = _1578 * _1580;
        float _1588 = 1.0 / _1564;
        float _1590 = _1584 * _1586;
        float _1592 = _1574 * 6.283185482025146484375;
        float _1594 = sin(_1592);
        float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1598 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1596;
        float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1602 = _1588 * _1600;
        float _1604 = 1.0 / _1590;
        float _1606 = 1.0 / _1598;
        float _1608 = _1594 * _1604;
        float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1612 = fma(_1608, _1602, _1610);
        float _1614 = _1612 * _1606;
        float _1616 = precise::clamp(_1614, 0.0, 1.0);
        _1482 = _1574;
        _1476 = _1606;
        _1556 = _1616;
    }
    float _1618 = _1482;
    float _1620 = _1476;
    float _1622 = _1556;
    float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1626 = _1540 + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1630 = _1542 + _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1634 = _1544 + _1632;
    float _1636 = _1626 * _1626;
    float _1638 = fma(_1630, _1630, _1636);
    float _1640 = fma(_1634, _1634, _1638);
    float _1642 = rsqrt(_1640);
    float _1644 = sqrt(_1640);
    float _1646 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1648 = _1630 * _1646;
    float _1650 = _1634 * _1646;
    float _1652 = _1648 * _1648;
    float _1654 = _1650 * _1650;
    float _1656 = _1652 + _1654;
    float _1658 = sqrt(_1656);
    bool _1660 = _1658 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = _1658 + _1662;
    float _1666 = _1618;
    float _1668 = _1664;
    float _1670 = _1626;
    float _1672 = _1646;
    float _1674 = _1648;
    if (_1660)
    {
        float _1676 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1666 = _1676;
    }
    float _1678 = _1666;
    float _1680 = _1678;
    if (_1660)
    {
        float _1682 = _1664 * _1678;
        _1668 = _1682;
    }
    float _1684 = _1668;
    if (_1660)
    {
        float _1686 = rsqrt(_1656);
        _1680 = _1686;
    }
    float _1688 = _1680;
    float _1690 = _1688;
    if (_1660)
    {
        float _1692 = _1684 * 0.15915493667125701904296875;
        _1558 = _1692;
    }
    float _1694 = _1558;
    float _1696 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1698 = _1634;
    if (_1660)
    {
        float _1700 = _1694 * 6.283185482025146484375;
        float _1702 = sin(_1700);
        _1698 = _1702;
    }
    float _1704 = _1698;
    float _1706 = precise::max(0.0, _1696);
    float _1708 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1710 = _1620;
    float _1712 = _1706;
    if (_1660)
    {
        float _1714 = _1694 * 6.283185482025146484375;
        float _1716 = cos(_1714);
        _1710 = _1716;
    }
    float _1718 = _1710;
    float _1720 = -_1646;
    float _1722 = -_1706;
    float _1724 = fma(_1626, _1720, _1722);
    if (_1660)
    {
        float _1726 = _1724 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1670 = _1726;
    }
    float _1728 = _1670;
    float _1730 = _1704;
    float _1732 = _1728;
    if (_1660)
    {
        float _1734 = fma(_1704, _1728, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1730 = _1734;
    }
    float _1736 = _1730;
    float _1738 = _1736;
    if (!_1660)
    {
        _1732 = _1724;
    }
    float _1740 = _1732;
    float _1742 = _1740;
    if (_1660)
    {
        float _1744 = _1688 * _1736;
        _1672 = _1744;
    }
    float _1746 = _1672;
    if (!_1660)
    {
        _1738 = _1652;
    }
    float _1748 = _1738;
    float _1750 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1752 = _1748;
    float _1754 = _1718;
    if (_1660)
    {
        float _1756 = _1718 + (-1.0);
        _1712 = _1756;
    }
    float _1758 = _1712;
    float _1760 = _1758;
    if (_1660)
    {
        float _1762 = _1648 * _1746;
        _1674 = _1762;
    }
    float _1764 = _1674;
    float _1766 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1750);
    if (_1660)
    {
        float _1768 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1690 = _1768;
    }
    float _1770 = _1690;
    if (!_1660)
    {
        _1760 = _1650;
    }
    float _1772 = _1760;
    float _1774 = _1772;
    if (_1660)
    {
        float _1776 = _1650 * _1746;
        _1774 = _1776;
    }
    float _1778 = _1774;
    if (_1660)
    {
        float _1780 = _1764 * _1764;
        _1752 = _1780;
    }
    float _1782 = _1752;
    if (_1660)
    {
        float _1784 = fma(_1724, _1718, _1770);
        _1742 = _1784;
    }
    float _1786 = _1742;
    if (!_1660)
    {
        _1754 = _1654;
    }
    float _1788 = _1754;
    float _1790 = _1788;
    if (_1660)
    {
        float _1792 = _1778 * _1778;
        _1790 = _1792;
    }
    float _1794 = _1790;
    float _1796 = fma(_1786, _1786, _1782);
    float _1798 = _1796 + _1794;
    float _1800 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1804 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1802);
    float _1806 = precise::clamp(_1804, 0.0, 1.0);
    float _1808 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1810 = rsqrt(_1798);
    float _1812 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1800);
    float _1814 = -_1806;
    float _1816 = _1814 + 1.0;
    float _1818 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1808);
    float _1820 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1812);
    float _1822 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1824 = abs(_1816);
    float _1826 = log2(_1824);
    float _1828 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1830 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1822);
    float _1832 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1818);
    float _1834 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1836 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1830);
    float _1838 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1840 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1766);
    float _1842 = _1810 * _1764;
    float _1844 = -_1834;
    float _1846 = fma(_1844, _1708, 1.0);
    float _1848 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1850 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1852 = _1810 * _1786;
    float _1854 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1856 = _1810 * _1778;
    float _1858 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1850);
    float _1860 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1862 = -_1854;
    float _1864 = fma(_1852, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1862);
    float _1866 = _1840 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1868 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1858);
    float _1870 = log2(_1846);
    float _1872 = -_1856;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1864);
    float _1876 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1878 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1868);
    float _1880 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1882 = fma(_1874, -0.5, 0.5);
    float _1884 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1876);
    float _1886 = fma(_1874, 0.5, 0.5);
    float _1888 = exp2(_1860);
    float _1890 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1880);
    float _1892 = _1852 + 1.0;
    float _1894 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1884);
    float _1896 = fma(_1886, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1898 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1890);
    float _1900 = 1.0 / _1878;
    float _1902 = fma(_1886, _1896, -0.212114393711090087890625);
    float _1904 = _1870 * 0.693147182464599609375;
    float _1906 = fma(_1886, _1902, 1.570728778839111328125);
    float _1908 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1910 = sqrt(_1882);
    float _1912 = -_1852;
    float _1914 = fma(_1888, _1892, _1912);
    float _1916 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1894);
    float _1918 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1898);
    float _1920 = fma(_1914, 0.5, 0.5);
    float _1922 = _1916 * _1900;
    float _1924 = _1918 * _1900;
    float _1926 = fma(_1922, 0.5, 0.5);
    float _1928 = fma(_1924, -0.5, 0.5);
    float _1930 = _1910 * 0.636619746685028076171875;
    float3 _5056 = float3(_1926, _1928, _1908);
    float _1932 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5056, float3(0.0), isnan(_5056)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5056, float3(0.0), isnan(_5056)), level(0.0)).x;
    float3 _5067 = float3(_1926, _1928, _1908);
    float4 _1935 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5067, float3(0.0), isnan(_5067)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5067, float3(0.0), isnan(_5067)), level(0.0)).xyzw;
    float _1937 = _1935.x;
    float _1939 = _1935.y;
    float _1941 = _1935.z;
    float _1943 = _1935.w;
    float _1945 = -_1906;
    float _1947 = fma(_1930, _1945, 1.0);
    float2 _5089 = float2(_1947, _1920);
    float3 _1951 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5089, float2(0.0), isnan(_5089)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5089, float2(0.0), isnan(_5089)), level(0.0)).xyz;
    float _1953 = _1951.x;
    float _1955 = _1951.y;
    float _1957 = _1951.z;
    float _1959 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1961 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1963 = _1622 > 0.0;
    bool _1965 = isnan(_1622);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan(0.0);
    bool _1971 = _1967 || _1969;
    out.m_79.x = _1392;
    out.m_79.y = _1388;
    out.m_79.z = _1412;
    float _1973 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1959);
    float _1975 = _1878 * 0.5;
    float _1977 = _1622 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1979 = exp2(_1961);
    float _1981 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1973);
    float _1983 = _1916 + _1878;
    out.m_81.x = _1542;
    out.m_81.y = _1540;
    out.m_81.z = _1544;
    float _1985 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1981);
    float _1987 = _1983 * 0.5;
    float _1989 = _1977 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1991 = _1985 + _1878;
    out.gl_Position.x = _1916;
    out.gl_Position.y = _1918;
    out.gl_Position.z = _1985;
    out.gl_Position.w = _1878;
    float _1993 = _1991 * 0.5;
    out.m_49.x = _1989;
    float _1995 = -_1979;
    float _1997 = _1995 + 1.0;
    float _1999 = fma(_1918, -0.5, _1975);
    float _2001 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _1987;
    out.m_83.y = _1999;
    out.m_83.z = _1993;
    out.m_83.w = _1878;
    float _2003 = -_2001;
    float _2005 = _2003 + 1.0;
    float _2007 = _2001 * _1932;
    float _2009 = _1943 * _2007;
    float _2011 = _1943 * _2005;
    float _2013 = _1957 * _2007;
    float _2015 = fma(_1953, _2009, _1937);
    float _2017 = fma(_1955, _2009, _1939);
    float _2019 = fma(_1943, _2013, _1941);
    out.m_85.x = _2015;
    out.m_85.y = _2017;
    out.m_85.z = _2019;
    out.m_85.w = _2011;
    if (_1971)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2021 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2021;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1354 = false;
    bool _412 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_46.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    if (!_108)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_108)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2077 = as_type<float>(_118);
        out.gl_Position.z = _2077;
    }
    if (!_108)
    {
        return out;
    }
    float _122 = in.m_51.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = 0.0;
    if (_132)
    {
        float _140 = float(_104);
        _138 = _140;
    }
    float _142 = _138;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2146 = as_type<float>(_156);
        out.gl_Position.z = _2146;
    }
    if (_148)
    {
        return out;
    }
    float _158 = in.m_53.x;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _162 = _136 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _164 = in.m_55.x;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_55.y;
    int _178 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _180 = _178 != 0;
    float _182 = _162 * _160;
    float _184 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[20].x, _182);
    float _186 = in.m_51.x;
    float _188 = in.m_51.y;
    float _190 = in.m_51.z;
    float _192 = _184 * 6.283185482025146484375;
    float _194 = floor(_184);
    float _196 = _192 * 0.15915493667125701904296875;
    float _198 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _200 = 1.4012984643248170709237295832899e-45;
    float _202 = _198;
    if (!_174)
    {
        float _204 = _198 * _198;
        float _206 = _204 * 0.5;
        _200 = _206;
    }
    float _208 = _200;
    float _210 = _196 * 6.283185482025146484375;
    float _212 = cos(_210);
    float _214 = _208;
    if (!_174)
    {
        float _216 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _216;
    }
    float _218 = _214;
    float _220 = -_194;
    float _222 = _184 + _220;
    bool _224 = !_174;
    float _226 = _218;
    float _228 = _176;
    float _230 = _164;
    if (!_224)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = _198 * _234;
        float _244 = 1.0 / _238;
        float _246 = _240 * 0.693147182464599609375;
        float _248 = exp2(_242);
        float _250 = 1.0 / _246;
        float _252 = _248 + (-1.0);
        float _254 = -_252;
        float _256 = fma(_254, _250, _198);
        float _258 = _256 * _244;
        float _260 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _226 = _260;
    }
    float _262 = _226;
    bool _264 = !_174;
    if (!_264)
    {
        float _266 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _268 = log2(_266);
        float _270 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _272 = _270 + 1.0;
        float _274 = 1.0 / _272;
        float _276 = _198 * _268;
        float _278 = exp2(_276);
        float _280 = -_278;
        float _282 = _280 + 1.0;
        float _284 = _282 * _274;
        _202 = _284;
    }
    float _286 = _202;
    float _288 = in.m_46.x;
    float _290 = in.m_46.y;
    float _292 = in.m_46.z;
    float _294 = in.m_57.x;
    float _296 = in.m_57.y;
    float _298 = in.m_57.z;
    float _300 = in.m_57.w;
    bool _302 = _222 < 0.5;
    float _304 = float(_302);
    float _306 = fma(_212, 0.5, 0.5);
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _310 = _308 != 0;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _314 = _312 != 0;
    float _316 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _318 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _320 = -_304;
    float _322 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _324 = -_306;
    float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _328 = fma(_286, _186, _316);
    float _330 = fma(_286, _188, _318);
    bool _332 = !_180;
    int _334 = _332 ? 0 : 1;
    out.m_59.x = _164;
    bool _336 = !_310;
    int _338 = _336 ? 0 : 1;
    float _340 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _342 = abs(_334);
    out.m_59.y = _176;
    int _344 = abs(_338);
    float _346 = fma(_286, _190, _340);
    bool _348 = !_314;
    int _350 = _348 ? 0 : 1;
    float _352 = -_222;
    float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _356 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    int _358 = abs(_350);
    float _360 = fma(_346, _300, _292);
    float _362 = float(_344);
    float _364 = fma(_328, _300, _288);
    float _366 = float(_342);
    float _368 = _296 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _370 = abs(_354);
    float _372 = _362 * _370;
    float _374 = _294 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = fma(_330, _300, _290);
    float _378 = float(_358);
    float _380 = fma(_366, _326, _372);
    float _382 = _298 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = abs(_322);
    float _386 = fma(_378, _384, _380);
    bool _388 = !_356;
    int _390 = as_type<int>(_380);
    bool _392 = _310;
    float _408;
    float _410;
    if (!_388)
    {
        float _394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _396 = _158 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _398 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[11].x, _136);
        float _400 = _398 * _394;
        float _402 = floor(_400);
        float _404 = -_402;
        float _406 = _400 + _404;
        _408 = _406;
        _410 = _402;
        _412 = true;
    }
    else
    {
        float _414 = float(_104);
        float _416 = 1.0 / _414;
        float _418 = _136 * _416;
        _408 = _418;
        _410 = _414;
    }
    _412 = false;
    float _420 = _408;
    float _422 = _410;
    float _424 = in.m_53.w;
    float _426 = -_176;
    float _428 = _426 + 1.0;
    float _430 = in.m_53.y;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _434 = _432 != 0;
    float _436 = _376 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _440 = _438 != 0;
    float _442 = in.m_61.w;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _446 = _444 != 0;
    float _448 = _376 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _452 = _450 != 0;
    float _454 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _436);
    float _456 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _448);
    float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _460 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _462 = isnan(_420);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = _422;
    float _474 = _454;
    if (_434)
    {
        float _476 = -_164;
        float _478 = _476 + 1.0;
        _390 = as_type<int>(_478);
    }
    int _480 = _390;
    if (_434)
    {
        bool _482 = _158 > 0.5;
        _392 = _482;
    }
    bool _484 = _392;
    if (!_434)
    {
        _472 = _164;
    }
    float _486 = _472;
    float _488 = _486;
    if (_434)
    {
        float _490 = _484 ? as_type<float>(_480) : _164;
        _488 = _490;
    }
    float _492 = _488;
    float _494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _496 = _424 > 0.5;
    bool _498 = _430 > 0.5;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _502 = _500 != 0;
    out.m_63.w = _442;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _506 = _504 != 0;
    float _508 = _376 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _510 = _498 ? as_type<int>(_428) : as_type<int>(_176);
    float _512 = in.m_53.z;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _516 = _514 != 0;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _526 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _508);
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _530 = 1.0 / _520;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _536 = _420 + _534;
    float _538 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
    float _540 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].z, _456);
    float _542 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _544 = _496 ? as_type<int>(_428) : as_type<int>(_176);
    float _546 = 1.0 / _524;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _550 = _420 + _548;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _554 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _538 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _558 = _540 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _560 = _552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _562 = _550 * _530;
    float _564 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].z, _454);
    bool _566 = _512 > 0.5;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    int _576 = as_type<int>(_536);
    if (!_502)
    {
        _474 = _164;
    }
    float _578 = _474;
    out.m_65.x = _560;
    out.m_65.y = _542;
    out.m_65.z = _554;
    float _580 = _536 * _546;
    float _582 = _578;
    if (_502)
    {
        float _584 = -_164;
        float _586 = _584 + 1.0;
        _576 = as_type<int>(_586);
    }
    int _588 = _576;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _598 = fma(_574, _580, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    if (_502)
    {
        float _600 = _566 ? as_type<float>(_588) : _164;
        _582 = _600;
    }
    float _602 = _582;
    float _604 = _564 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _614 = fma(_596, _580, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _616 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _618 = _604 + _616;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _622 = _558 + _620;
    float _624 = fma(_612, _580, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _628 = _556 + _626;
    float _630 = _618 * _618;
    bool _632 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _634 = isnan(_420);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = fma(_608, _562, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _646 = fma(_570, _562, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _648 = fma(_628, _628, _630);
    float _650 = fma(_592, _562, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _652 = _440 ? as_type<float>(_510) : _176;
    float _654 = _458 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _656 = fma(_622, _622, _648);
    float _658 = _446 ? as_type<float>(_544) : _176;
    float _660 = -_642;
    float _662 = _660 + 1.0;
    bool _664 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _666 = isnan(_420);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = sqrt(_656);
    float _678 = _656;
    if (_452)
    {
        float _680 = _566 ? _428 : _176;
        _228 = _680;
    }
    float _682 = _228;
    float _684 = fma(_654, _602, -0.5);
    float _686 = _674 * _662;
    float _688 = -_674;
    float _690 = _688 + 1.0;
    bool _692 = _430 > 0.5;
    bool _694 = _692 && _506;
    float _696 = _386 * _374;
    float _698 = rsqrt(_656);
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _702 = _470 * _690;
    float _704 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = _494 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _708 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[88].w, _700);
    float _710 = _650 * _702;
    float _712 = _704 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _714 = _676 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _716 = _702;
    if (!_506)
    {
        _678 = _164;
    }
    float _718 = _678;
    float _720 = fma(_658, _706, -0.5);
    float _722 = _718;
    if (_694)
    {
        float _724 = -_164;
        float _726 = _724 + 1.0;
        _230 = _726;
    }
    float _728 = _230;
    float _730 = _644 * _702;
    float _732 = precise::min(_712, _714);
    float _734 = _646 * _702;
    float _736 = _730;
    if (_516)
    {
        _716 = _158;
    }
    float _738 = _716;
    float _740 = _618 * _698;
    float _742 = _738;
    if (_506)
    {
        _722 = _728;
    }
    float _744 = _722;
    float _746 = _628 * _698;
    if (!_516)
    {
        _742 = _512;
    }
    float _748 = _742;
    float _750 = _740 * _732;
    float _752 = _622 * _698;
    float _754 = _746 * _732;
    float _756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _758 = -_750;
    float _760 = _618 + _758;
    float _762 = _748 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _764 = -_754;
    float _766 = _628 + _764;
    float _768 = _752 * _732;
    float _770 = _760 * _760;
    float _772 = _652 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _774 = -_768;
    float _776 = _622 + _774;
    float _778 = fma(_766, _766, _770);
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _782 = 0.0;
    if (!_516)
    {
        _782 = _430;
    }
    float _784 = _782;
    float _786 = fma(_776, _776, _778);
    float _788 = _784;
    if (_516)
    {
        _788 = _158;
    }
    float _790 = _788;
    float _792 = -_780;
    float _794 = fma(_762, 2.0, _792);
    float _796 = _756 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _800 = sqrt(_786);
    float _802 = -_470;
    float _804 = _802 + 1.0;
    float _806 = fma(_796, _682, -0.5);
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _810 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[83].z, _798);
    float _812 = _790 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[107].x, _730);
    float _816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _818 = _790;
    float _820 = _808;
    if (!_516)
    {
        _818 = _512;
    }
    float _822 = _818;
    float _824 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[107].z, _710);
    float _826 = _822;
    if (!_516)
    {
        _736 = _512;
    }
    float _828 = _736;
    float _830 = -_808;
    float _832 = fma(_812, 2.0, _830);
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _836 = _828;
    if (_516)
    {
        _826 = _430;
    }
    float _838 = _826;
    float _840 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[107].y, _734);
    if (_516)
    {
        _836 = _430;
    }
    float _842 = _836;
    float _844 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[88].z, _834);
    if (_516)
    {
        _820 = _430;
    }
    float _846 = _820;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _850 = _698 * _800;
    float _852 = _846;
    if (!_516)
    {
        _852 = _158;
    }
    float _854 = _852;
    float _856 = fma(_598, _686, _840);
    float _858 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[83].w, _848);
    float _860 = _704 * _850;
    float _862 = _816 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _864 = fma(_614, _686, _824);
    float _866 = _838 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _868 = _860 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _870 = fma(_862, _744, -0.5);
    float _872 = fma(_624, _686, _814);
    float _874 = _740 * _868;
    float _876 = _618 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _878 = _746 * _868;
    float _880 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].z, _844);
    float _882 = -_874;
    float _884 = _618 + _882;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _888 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[28].x, _876);
    float _890 = -_136;
    float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[86].x, _794);
    float _894 = _884 * _884;
    float _896 = fma(_866, -2.0, _886);
    float _898 = -_878;
    float _900 = _628 + _898;
    float _902 = _752 * _868;
    float _904 = fma(_880, _870, _892);
    float _906 = -_136;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[81].x, _832);
    float _910 = fma(_900, _900, _894);
    float _912 = -_902;
    float _914 = _622 + _912;
    float _916 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].z, _810);
    float _918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _920 = fma(_914, _914, _910);
    float _922 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[28].z, _888);
    float _924 = fma(_916, _684, _908);
    float _926 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].w, _858);
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _930 = _854 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _932 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _934 = _922 >= 0.0;
    float _936 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[81].y, _896);
    float _938 = fma(_930, -2.0, _928);
    float _940 = _492 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _942 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].w, _708);
    float _944 = -_936;
    float _946 = fma(_926, _720, _944);
    float _948 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[86].y, _938);
    float _950 = sqrt(_920);
    float _952 = _940 * _918;
    float _954 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[109].x, _872);
    float _956 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[109].y, _856);
    float _958 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[109].z, _864);
    float _960 = -_948;
    float _962 = fma(_942, _806, _960);
    float _964 = _926;
    if (_934)
    {
        _964 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _966 = _964;
    float _968 = _954 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _970 = _772 * _932;
    float _972 = _946 + 0.5;
    float _974 = _958 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _976 = _924 + 0.5;
    float _978 = _968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _980 = as_type<int>(_966);
    if (_934)
    {
        float _982 = _966 * 5.0;
        _980 = as_type<int>(_982);
    }
    int _984 = _980;
    float _986 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _988 = _904 + 0.5;
    float _990 = _698 * _950;
    float _992 = _956 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _994 = _962 + 0.5;
    float _996 = _860 * _990;
    float _998 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _952;
    out.m_67.y = _970;
    out.m_67.z = _976;
    out.m_67.w = _972;
    out.m_69.x = _978;
    out.m_69.y = _998;
    out.m_69.z = _986;
    if (_934)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3565 = as_type<float>(_984);
        out.gl_Position.z = _3565;
    }
    out.m_71.w = _732;
    out.m_73.x = _988;
    out.m_73.y = _994;
    if (_934)
    {
        out.m_49.x = 0.0;
    }
    out.m_75.x = _996;
    if (_934)
    {
        return out;
    }
    float _1000 = -_874;
    float _1002 = _604 + _1000;
    float _1004 = -_878;
    float _1006 = _556 + _1004;
    float _1008 = -_902;
    float _1010 = _558 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1014 = _1002 + _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1018 = _1006 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1022 = _1010 + _1020;
    float _1024 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1026 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1024);
    float _1028 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1026);
    bool _1030 = _1028 >= 0.0;
    float _1032 = _1022;
    if (_1030)
    {
        _1032 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1034 = _1032;
    int _1036 = as_type<int>(_1034);
    if (_1030)
    {
        out.m_49.x = 0.0;
    }
    if (_1030)
    {
        float _1038 = _1034 * 5.0;
        _1036 = as_type<int>(_1038);
    }
    int _1040 = _1036;
    if (_1030)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3658 = as_type<float>(_1040);
        out.gl_Position.z = _3658;
    }
    if (_1030)
    {
        return out;
    }
    float _1042 = -_604;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1046 = -_556;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1050 = -_558;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1054 = _386 * _368;
    float _1056 = _1044 * _1044;
    float _1058 = _850 * _990;
    float _1060 = _386 * _382;
    float _1062 = _1054 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1064 = fma(_1048, _1048, _1056);
    float _1066 = _1060 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1068 = fma(_1052, _1052, _1064);
    float _1070 = rsqrt(_1068);
    float _1072 = _1048 * _1070;
    float _1074 = _1052 * _1070;
    float _1076 = _1044 * _1070;
    float _1078 = _1062 * _1058;
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1082 = _1072 * _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1086 = _1074 * _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1090 = _1076 * _1088;
    float _1092 = _1066 * _1058;
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1096 = -_1082;
    float _1098 = fma(_1074, _1094, _1096);
    float _1100 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1102 = -_1086;
    float _1104 = fma(_1076, _1100, _1102);
    float _1106 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1108 = -_1090;
    float _1110 = fma(_1072, _1106, _1108);
    float _1112 = in.m_77.x;
    float _1114 = in.m_77.y;
    float _1116 = in.m_77.z;
    float _1118 = _1098 * _1098;
    float _1120 = fma(_1104, _1104, _1118);
    float _1122 = fma(_1110, _1110, _1120);
    float _1124 = rsqrt(_1122);
    float _1126 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1114);
    float _1128 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1112);
    float _1130 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1116);
    float _1132 = _1078 * _1126;
    float _1134 = _996 * _1128;
    float _1136 = _1092 * _1130;
    float _1138 = _1104 * _1124;
    float _1140 = _1098 * _1124;
    float _1142 = _1110 * _1124;
    float _1144 = _1076 * _1138;
    float _1146 = _1074 * _1140;
    float _1148 = -_1144;
    float _1150 = fma(_1072, _1140, _1148);
    float _1152 = -_1146;
    float _1154 = fma(_1076, _1142, _1152);
    float _1156 = _1132 * _1150;
    float _1158 = _1132 * _1154;
    float _1160 = fma(_1134, _1142, _1156);
    float _1162 = fma(_1134, _1138, _1158);
    float _1164 = fma(_1136, _1074, _1160);
    float _1166 = fma(_1136, _1072, _1162);
    float _1168 = _1072 * _1142;
    float _1170 = _558 + _1164;
    float _1172 = _556 + _1166;
    float _1174 = -_1168;
    float _1176 = fma(_1074, _1138, _1174);
    float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1180 = _1170 + _1178;
    float _1182 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1184 = _1172 + _1182;
    float _1186 = _1132 * _1176;
    float _1188 = _1180 * _1180;
    float _1190 = fma(_1134, _1140, _1186);
    float _1192 = fma(_1184, _1184, _1188);
    float _1194 = fma(_1136, _1076, _1190);
    float _1196 = sqrt(_1192);
    float _1198 = _604 + _1194;
    bool _1200 = _1196 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1202 = _1194;
    float _1204 = _1134;
    float _1206 = _1136;
    if (!_1200)
    {
        _1202 = _1172;
    }
    float _1208 = _1202;
    float _1210 = _1208;
    if (!_1200)
    {
        _1204 = _1170;
    }
    float _1212 = _1204;
    float _1214 = _1212;
    if (!_1200)
    {
        _1206 = _1198;
    }
    float _1216 = _1206;
    bool _1218 = !_1200;
    float _1220 = _1216;
    if (!_1218)
    {
        float _1222 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1226 = _1196 + _1224;
        float _1228 = rsqrt(_1192);
        float _1230 = _1226 * _1222;
        float _1232 = _1198 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1234 = _1230 * 0.15915493667125701904296875;
        float _1236 = _1234 * 6.283185482025146484375;
        float _1238 = cos(_1236);
        float _1240 = _1234 * 6.283185482025146484375;
        float _1242 = sin(_1240);
        float _1244 = _1238 + (-1.0);
        float _1246 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1248 = fma(_1242, _1232, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1250 = fma(_1198, _1238, _1246);
        float _1252 = _1228 * _1248;
        float _1254 = fma(_1184, _1252, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1256 = fma(_1180, _1252, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1220 = _1250;
        _1210 = _1254;
        _1214 = _1256;
    }
    float _1258 = _1220;
    float _1260 = _1210;
    float _1262 = _1214;
    float _1264 = -_750;
    float _1266 = _1264 + _1258;
    float _1268 = -_754;
    float _1270 = _1268 + _1260;
    float _1272 = -_768;
    float _1274 = _1272 + _1262;
    float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1278 = _1266 + _1276;
    float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1282 = _1270 + _1280;
    float _1284 = -_754;
    float _1286 = _556 + _1284;
    float _1288 = -_750;
    float _1290 = _604 + _1288;
    float _1292 = _1278 * _1278;
    float _1294 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1296 = _1274 + _1294;
    float _1298 = -_768;
    float _1300 = _558 + _1298;
    float _1302 = fma(_1282, _1282, _1292);
    float _1304 = fma(_1296, _1296, _1302);
    float _1306 = sqrt(_1304);
    bool _1308 = _1306 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1310 = isnan(_1306);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1316 = _1312 || _1314;
    float _1318 = _1292;
    if (!_1316)
    {
        _1318 = 1.0;
    }
    float _1320 = _1318;
    bool _1322 = !_1316;
    float _1324 = _1320;
    if (!_1322)
    {
        bool _1326 = _1306 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1328 = isnan(_1306);
        bool _1330 = _1326 || _1328;
        bool _1332 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1334 = _1330 || _1332;
        if (!_1334)
        {
            float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1338 = _1306 + _1336;
            float _1340 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1342 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1340;
            float _1344 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1346 = _1344 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1348 = 1.0 / _1342;
            float _1350 = _1338 * _1348;
            float _1352 = fma(_1350, _1346, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1324 = _1352;
            _1354 = true;
        }
        else
        {
            bool _1356 = _1306 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1358 = isnan(_1306);
            bool _1360 = _1356 || _1358;
            bool _1362 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1364 = _1360 || _1362;
            if (!_1364)
            {
                float _1366 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1368 = _1306 + _1366;
                float _1370 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1372 = _1370 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1374 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1376 = _1374 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1378 = 1.0 / _1372;
                float _1380 = _1368 * _1378;
                float _1382 = fma(_1380, _1376, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1324 = _1382;
                _1354 = true;
            }
            else
            {
                _1324 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1354 = false;
    float _1384 = _1324;
    float _1386 = -_874;
    float _1388 = _1386 + _1290;
    float _1390 = -_878;
    float _1392 = _1390 + _1286;
    float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1396 = _1266 + _1394;
    float _1398 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1400 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1402 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan(0.5);
    bool _1408 = _1404 || _1406;
    float _1410 = -_902;
    float _1412 = _1410 + _1300;
    float _1414 = fma(_1396, _1384, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1416 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1398);
    float _1418 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1422 = _1270 + _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1426 = _1274 + _1424;
    float _1428 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1416);
    float _1430 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1418);
    float _1432 = -_874;
    float _1434 = _1432 + _1414;
    float _1436 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1438 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1430);
    float _1440 = fma(_1422, _1384, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1442 = fma(_1426, _1384, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1444 = 1.0 / _1436;
    float _1446 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1448 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan(0.5);
    bool _1456 = _1452 || _1454;
    float _1458 = -_878;
    float _1460 = _1458 + _1440;
    float _1462 = -_902;
    float _1464 = _1462 + _1442;
    float _1466 = _1446 + _1436;
    float _1468 = _1446;
    float _1470 = _1460;
    float _1472 = _1464;
    float _1474 = _1384;
    float _1476 = _1440;
    if (_1408)
    {
        _1468 = _1434;
    }
    float _1478 = _1468;
    float _1480 = _1478;
    float _1482 = _1444;
    if (!_1408)
    {
        float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1486 = _1388 + _1484;
        float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1490 = _1392 + _1488;
        float _1492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1494 = -_1300;
        float _1496 = _1494 + _1442;
        float _1498 = _1486 * _1486;
        float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1502 = _1412 + _1500;
        float _1504 = -_1286;
        float _1506 = _1504 + _1440;
        float _1508 = -_1290;
        float _1510 = _1508 + _1414;
        float _1512 = fma(_1490, _1490, _1498);
        float _1514 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1516 = fma(_1502, _1502, _1512);
        float _1518 = sqrt(_1516);
        float _1520 = 1.0 / _990;
        float _1522 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1524 = precise::min(_1518, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1526 = _1524 * _1492;
        float _1528 = _1526 * _1520;
        float _1530 = _1522 * _1528;
        float _1532 = _1496 * _1528;
        float _1534 = fma(_1506, _1530, _1392);
        float _1536 = fma(_1510, _1530, _1388);
        float _1538 = fma(_1522, _1532, _1412);
        _1480 = _1536;
        _1470 = _1534;
        _1472 = _1538;
        _1474 = _1518;
    }
    float _1540 = _1480;
    float _1542 = _1470;
    float _1544 = _1472;
    float _1546 = _1474;
    float _1548 = _1546;
    if (_1456)
    {
        _1548 = 1.0;
    }
    float _1550 = _1548;
    float _1552 = _1466 * _1444;
    float _1554 = _1552 * 0.5;
    float _1556 = _1550;
    float _1558 = _1554;
    if (!_1456)
    {
        float _1560 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1562 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1564 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1562);
        float _1566 = _1560 * 0.15915493667125701904296875;
        float _1568 = _1566 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        float _1572 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1574 = _1572 * 0.15915493667125701904296875;
        float _1576 = _1566 * 6.283185482025146484375;
        float _1578 = sin(_1576);
        float _1580 = 1.0 / _1570;
        float _1582 = _1574 * 6.283185482025146484375;
        float _1584 = cos(_1582);
        float _1586 = _1578 * _1580;
        float _1588 = 1.0 / _1564;
        float _1590 = _1584 * _1586;
        float _1592 = _1574 * 6.283185482025146484375;
        float _1594 = sin(_1592);
        float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1598 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1596;
        float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1602 = _1588 * _1600;
        float _1604 = 1.0 / _1590;
        float _1606 = 1.0 / _1598;
        float _1608 = _1594 * _1604;
        float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1612 = fma(_1608, _1602, _1610);
        float _1614 = _1612 * _1606;
        float _1616 = precise::clamp(_1614, 0.0, 1.0);
        _1482 = _1574;
        _1476 = _1606;
        _1556 = _1616;
    }
    float _1618 = _1482;
    float _1620 = _1476;
    float _1622 = _1556;
    float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1626 = _1540 + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1630 = _1542 + _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1634 = _1544 + _1632;
    float _1636 = _1626 * _1626;
    float _1638 = fma(_1630, _1630, _1636);
    float _1640 = fma(_1634, _1634, _1638);
    float _1642 = rsqrt(_1640);
    float _1644 = sqrt(_1640);
    float _1646 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1648 = _1630 * _1646;
    float _1650 = _1634 * _1646;
    float _1652 = _1648 * _1648;
    float _1654 = _1650 * _1650;
    float _1656 = _1652 + _1654;
    float _1658 = sqrt(_1656);
    bool _1660 = _1658 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = _1658 + _1662;
    float _1666 = _1618;
    float _1668 = _1664;
    float _1670 = _1626;
    float _1672 = _1646;
    float _1674 = _1648;
    if (_1660)
    {
        float _1676 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1666 = _1676;
    }
    float _1678 = _1666;
    float _1680 = _1678;
    if (_1660)
    {
        float _1682 = _1664 * _1678;
        _1668 = _1682;
    }
    float _1684 = _1668;
    if (_1660)
    {
        float _1686 = rsqrt(_1656);
        _1680 = _1686;
    }
    float _1688 = _1680;
    float _1690 = _1688;
    if (_1660)
    {
        float _1692 = _1684 * 0.15915493667125701904296875;
        _1558 = _1692;
    }
    float _1694 = _1558;
    float _1696 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1698 = _1634;
    if (_1660)
    {
        float _1700 = _1694 * 6.283185482025146484375;
        float _1702 = sin(_1700);
        _1698 = _1702;
    }
    float _1704 = _1698;
    float _1706 = precise::max(0.0, _1696);
    float _1708 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1710 = _1620;
    float _1712 = _1706;
    if (_1660)
    {
        float _1714 = _1694 * 6.283185482025146484375;
        float _1716 = cos(_1714);
        _1710 = _1716;
    }
    float _1718 = _1710;
    float _1720 = -_1646;
    float _1722 = -_1706;
    float _1724 = fma(_1626, _1720, _1722);
    if (_1660)
    {
        float _1726 = _1724 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1670 = _1726;
    }
    float _1728 = _1670;
    float _1730 = _1704;
    float _1732 = _1728;
    if (_1660)
    {
        float _1734 = fma(_1704, _1728, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1730 = _1734;
    }
    float _1736 = _1730;
    float _1738 = _1736;
    if (!_1660)
    {
        _1732 = _1724;
    }
    float _1740 = _1732;
    float _1742 = _1740;
    if (_1660)
    {
        float _1744 = _1688 * _1736;
        _1672 = _1744;
    }
    float _1746 = _1672;
    if (!_1660)
    {
        _1738 = _1652;
    }
    float _1748 = _1738;
    float _1750 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1752 = _1748;
    float _1754 = _1718;
    if (_1660)
    {
        float _1756 = _1718 + (-1.0);
        _1712 = _1756;
    }
    float _1758 = _1712;
    float _1760 = _1758;
    if (_1660)
    {
        float _1762 = _1648 * _1746;
        _1674 = _1762;
    }
    float _1764 = _1674;
    float _1766 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1750);
    if (_1660)
    {
        float _1768 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1690 = _1768;
    }
    float _1770 = _1690;
    if (!_1660)
    {
        _1760 = _1650;
    }
    float _1772 = _1760;
    float _1774 = _1772;
    if (_1660)
    {
        float _1776 = _1650 * _1746;
        _1774 = _1776;
    }
    float _1778 = _1774;
    if (_1660)
    {
        float _1780 = _1764 * _1764;
        _1752 = _1780;
    }
    float _1782 = _1752;
    if (_1660)
    {
        float _1784 = fma(_1724, _1718, _1770);
        _1742 = _1784;
    }
    float _1786 = _1742;
    if (!_1660)
    {
        _1754 = _1654;
    }
    float _1788 = _1754;
    float _1790 = _1788;
    if (_1660)
    {
        float _1792 = _1778 * _1778;
        _1790 = _1792;
    }
    float _1794 = _1790;
    float _1796 = fma(_1786, _1786, _1782);
    float _1798 = _1796 + _1794;
    float _1800 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1804 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1802);
    float _1806 = precise::clamp(_1804, 0.0, 1.0);
    float _1808 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1810 = rsqrt(_1798);
    float _1812 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1800);
    float _1814 = -_1806;
    float _1816 = _1814 + 1.0;
    float _1818 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1808);
    float _1820 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1812);
    float _1822 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1824 = abs(_1816);
    float _1826 = log2(_1824);
    float _1828 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1830 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1822);
    float _1832 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1818);
    float _1834 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1836 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1830);
    float _1838 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1840 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1766);
    float _1842 = _1810 * _1764;
    float _1844 = -_1834;
    float _1846 = fma(_1844, _1708, 1.0);
    float _1848 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1850 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1852 = _1810 * _1786;
    float _1854 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1856 = _1810 * _1778;
    float _1858 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1850);
    float _1860 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1862 = -_1854;
    float _1864 = fma(_1852, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1862);
    float _1866 = _1840 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1868 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1858);
    float _1870 = log2(_1846);
    float _1872 = -_1856;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1864);
    float _1876 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1878 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1868);
    float _1880 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1882 = fma(_1874, -0.5, 0.5);
    float _1884 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1876);
    float _1886 = fma(_1874, 0.5, 0.5);
    float _1888 = exp2(_1860);
    float _1890 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1880);
    float _1892 = _1852 + 1.0;
    float _1894 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1884);
    float _1896 = fma(_1886, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1898 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1890);
    float _1900 = 1.0 / _1878;
    float _1902 = fma(_1886, _1896, -0.212114393711090087890625);
    float _1904 = _1870 * 0.693147182464599609375;
    float _1906 = fma(_1886, _1902, 1.570728778839111328125);
    float _1908 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1910 = sqrt(_1882);
    float _1912 = -_1852;
    float _1914 = fma(_1888, _1892, _1912);
    float _1916 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1894);
    float _1918 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1898);
    float _1920 = fma(_1914, 0.5, 0.5);
    float _1922 = _1916 * _1900;
    float _1924 = _1918 * _1900;
    float _1926 = fma(_1922, 0.5, 0.5);
    float _1928 = fma(_1924, -0.5, 0.5);
    float _1930 = _1910 * 0.636619746685028076171875;
    float3 _5056 = float3(_1926, _1928, _1908);
    float _1932 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5056, float3(0.0), isnan(_5056)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5056, float3(0.0), isnan(_5056)), level(0.0)).x;
    float3 _5067 = float3(_1926, _1928, _1908);
    float4 _1935 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5067, float3(0.0), isnan(_5067)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5067, float3(0.0), isnan(_5067)), level(0.0)).xyzw;
    float _1937 = _1935.x;
    float _1939 = _1935.y;
    float _1941 = _1935.z;
    float _1943 = _1935.w;
    float _1945 = -_1906;
    float _1947 = fma(_1930, _1945, 1.0);
    float2 _5089 = float2(_1947, _1920);
    float3 _1951 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5089, float2(0.0), isnan(_5089)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5089, float2(0.0), isnan(_5089)), level(0.0)).xyz;
    float _1953 = _1951.x;
    float _1955 = _1951.y;
    float _1957 = _1951.z;
    float _1959 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1961 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1963 = _1622 > 0.0;
    bool _1965 = isnan(_1622);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan(0.0);
    bool _1971 = _1967 || _1969;
    out.m_79.x = _1392;
    out.m_79.y = _1388;
    out.m_79.z = _1412;
    float _1973 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1959);
    float _1975 = _1878 * 0.5;
    float _1977 = _1622 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1979 = exp2(_1961);
    float _1981 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1973);
    float _1983 = _1916 + _1878;
    out.m_81.x = _1542;
    out.m_81.y = _1540;
    out.m_81.z = _1544;
    float _1985 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1981);
    float _1987 = _1983 * 0.5;
    float _1989 = _1977 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1991 = _1985 + _1878;
    out.gl_Position.x = _1916;
    out.gl_Position.y = _1918;
    out.gl_Position.z = _1985;
    out.gl_Position.w = _1878;
    float _1993 = _1991 * 0.5;
    out.m_49.x = _1989;
    float _1995 = -_1979;
    float _1997 = _1995 + 1.0;
    float _1999 = fma(_1918, -0.5, _1975);
    float _2001 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _1987;
    out.m_83.y = _1999;
    out.m_83.z = _1993;
    out.m_83.w = _1878;
    float _2003 = -_2001;
    float _2005 = _2003 + 1.0;
    float _2007 = _2001 * _1932;
    float _2009 = _1943 * _2007;
    float _2011 = _1943 * _2005;
    float _2013 = _1957 * _2007;
    float _2015 = fma(_1953, _2009, _1937);
    float _2017 = fma(_1955, _2009, _1939);
    float _2019 = fma(_1943, _2013, _1941);
    out.m_85.x = _2015;
    out.m_85.y = _2017;
    out.m_85.z = _2019;
    out.m_85.w = _2011;
    if (_1971)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2021 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2021;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1354 = false;
    bool _412 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_46.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    if (!_108)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_108)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2077 = as_type<float>(_118);
        out.gl_Position.z = _2077;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_51.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = 0.0;
    if (_132)
    {
        float _140 = float(_104);
        _138 = _140;
    }
    float _142 = _138;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2146 = as_type<float>(_156);
        out.gl_Position.z = _2146;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_53.x;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _162 = _136 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _164 = in.m_55.x;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_55.y;
    int _178 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _180 = _178 != 0;
    float _182 = _162 * _160;
    float _184 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[20].x, _182);
    float _186 = in.m_51.x;
    float _188 = in.m_51.y;
    float _190 = in.m_51.z;
    float _192 = _184 * 6.283185482025146484375;
    float _194 = floor(_184);
    float _196 = _192 * 0.15915493667125701904296875;
    float _198 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _200 = 1.4012984643248170709237295832899e-45;
    float _202 = _198;
    if (!_174)
    {
        float _204 = _198 * _198;
        float _206 = _204 * 0.5;
        _200 = _206;
    }
    float _208 = _200;
    float _210 = _196 * 6.283185482025146484375;
    float _212 = cos(_210);
    float _214 = _208;
    if (!_174)
    {
        float _216 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _216;
    }
    float _218 = _214;
    float _220 = -_194;
    float _222 = _184 + _220;
    bool _224 = !_174;
    float _226 = _218;
    float _228 = _176;
    float _230 = _164;
    if (!_224)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = _198 * _234;
        float _244 = 1.0 / _238;
        float _246 = _240 * 0.693147182464599609375;
        float _248 = exp2(_242);
        float _250 = 1.0 / _246;
        float _252 = _248 + (-1.0);
        float _254 = -_252;
        float _256 = fma(_254, _250, _198);
        float _258 = _256 * _244;
        float _260 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _226 = _260;
    }
    float _262 = _226;
    bool _264 = !_174;
    if (!_264)
    {
        float _266 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _268 = log2(_266);
        float _270 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _272 = _270 + 1.0;
        float _274 = 1.0 / _272;
        float _276 = _198 * _268;
        float _278 = exp2(_276);
        float _280 = -_278;
        float _282 = _280 + 1.0;
        float _284 = _282 * _274;
        _202 = _284;
    }
    float _286 = _202;
    float _288 = in.m_46.x;
    float _290 = in.m_46.y;
    float _292 = in.m_46.z;
    float _294 = in.m_57.x;
    float _296 = in.m_57.y;
    float _298 = in.m_57.z;
    float _300 = in.m_57.w;
    bool _302 = _222 < 0.5;
    float _304 = float(_302);
    float _306 = fma(_212, 0.5, 0.5);
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _310 = _308 != 0;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _314 = _312 != 0;
    float _316 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _318 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _320 = -_304;
    float _322 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _324 = -_306;
    float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _328 = fma(_286, _186, _316);
    float _330 = fma(_286, _188, _318);
    bool _332 = !_180;
    int _334 = _332 ? 0 : 1;
    out.m_59.x = _164;
    bool _336 = !_310;
    int _338 = _336 ? 0 : 1;
    float _340 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _342 = abs(_334);
    out.m_59.y = _176;
    int _344 = abs(_338);
    float _346 = fma(_286, _190, _340);
    bool _348 = !_314;
    int _350 = _348 ? 0 : 1;
    float _352 = -_222;
    float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _356 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    int _358 = abs(_350);
    float _360 = fma(_346, _300, _292);
    float _362 = float(_344);
    float _364 = fma(_328, _300, _288);
    float _366 = float(_342);
    float _368 = _296 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _370 = abs(_354);
    float _372 = _362 * _370;
    float _374 = _294 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = fma(_330, _300, _290);
    float _378 = float(_358);
    float _380 = fma(_366, _326, _372);
    float _382 = _298 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = abs(_322);
    float _386 = fma(_378, _384, _380);
    bool _388 = !_356;
    int _390 = as_type<int>(_380);
    bool _392 = _310;
    float _408;
    float _410;
    if (!_388)
    {
        float _394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _396 = _158 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _398 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[11].x, _136);
        float _400 = _398 * _394;
        float _402 = floor(_400);
        float _404 = -_402;
        float _406 = _400 + _404;
        _408 = _406;
        _410 = _402;
        _412 = true;
    }
    else
    {
        float _414 = float(_104);
        float _416 = 1.0 / _414;
        float _418 = _136 * _416;
        _408 = _418;
        _410 = _414;
    }
    _412 = false;
    float _420 = _408;
    float _422 = _410;
    float _424 = in.m_53.w;
    float _426 = -_176;
    float _428 = _426 + 1.0;
    float _430 = in.m_53.y;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _434 = _432 != 0;
    float _436 = _376 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _440 = _438 != 0;
    float _442 = in.m_61.w;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _446 = _444 != 0;
    float _448 = _376 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _452 = _450 != 0;
    float _454 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _436);
    float _456 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _448);
    float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _460 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _462 = isnan(_420);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = _422;
    float _474 = _454;
    if (_434)
    {
        float _476 = -_164;
        float _478 = _476 + 1.0;
        _390 = as_type<int>(_478);
    }
    int _480 = _390;
    if (_434)
    {
        bool _482 = _158 > 0.5;
        _392 = _482;
    }
    bool _484 = _392;
    if (!_434)
    {
        _472 = _164;
    }
    float _486 = _472;
    float _488 = _486;
    if (_434)
    {
        float _490 = _484 ? as_type<float>(_480) : _164;
        _488 = _490;
    }
    float _492 = _488;
    float _494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _496 = _424 > 0.5;
    bool _498 = _430 > 0.5;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _502 = _500 != 0;
    out.m_63.w = _442;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _506 = _504 != 0;
    float _508 = _376 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _510 = _498 ? as_type<int>(_428) : as_type<int>(_176);
    float _512 = in.m_53.z;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _516 = _514 != 0;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _526 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _508);
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _530 = 1.0 / _520;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _536 = _420 + _534;
    float _538 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
    float _540 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].z, _456);
    float _542 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _544 = _496 ? as_type<int>(_428) : as_type<int>(_176);
    float _546 = 1.0 / _524;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _550 = _420 + _548;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _554 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _538 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _558 = _540 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _560 = _552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _562 = _550 * _530;
    float _564 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].z, _454);
    bool _566 = _512 > 0.5;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    int _576 = as_type<int>(_536);
    if (!_502)
    {
        _474 = _164;
    }
    float _578 = _474;
    out.m_65.x = _560;
    out.m_65.y = _542;
    out.m_65.z = _554;
    float _580 = _536 * _546;
    float _582 = _578;
    if (_502)
    {
        float _584 = -_164;
        float _586 = _584 + 1.0;
        _576 = as_type<int>(_586);
    }
    int _588 = _576;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _598 = fma(_574, _580, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    if (_502)
    {
        float _600 = _566 ? as_type<float>(_588) : _164;
        _582 = _600;
    }
    float _602 = _582;
    float _604 = _564 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _614 = fma(_596, _580, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _616 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _618 = _604 + _616;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _622 = _558 + _620;
    float _624 = fma(_612, _580, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _628 = _556 + _626;
    float _630 = _618 * _618;
    bool _632 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _634 = isnan(_420);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = fma(_608, _562, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _646 = fma(_570, _562, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _648 = fma(_628, _628, _630);
    float _650 = fma(_592, _562, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _652 = _440 ? as_type<float>(_510) : _176;
    float _654 = _458 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _656 = fma(_622, _622, _648);
    float _658 = _446 ? as_type<float>(_544) : _176;
    float _660 = -_642;
    float _662 = _660 + 1.0;
    bool _664 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _666 = isnan(_420);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = sqrt(_656);
    float _678 = _656;
    if (_452)
    {
        float _680 = _566 ? _428 : _176;
        _228 = _680;
    }
    float _682 = _228;
    float _684 = fma(_654, _602, -0.5);
    float _686 = _674 * _662;
    float _688 = -_674;
    float _690 = _688 + 1.0;
    bool _692 = _430 > 0.5;
    bool _694 = _692 && _506;
    float _696 = _386 * _374;
    float _698 = rsqrt(_656);
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _702 = _470 * _690;
    float _704 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = _494 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _708 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[88].w, _700);
    float _710 = _650 * _702;
    float _712 = _704 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _714 = _676 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _716 = _702;
    if (!_506)
    {
        _678 = _164;
    }
    float _718 = _678;
    float _720 = fma(_658, _706, -0.5);
    float _722 = _718;
    if (_694)
    {
        float _724 = -_164;
        float _726 = _724 + 1.0;
        _230 = _726;
    }
    float _728 = _230;
    float _730 = _644 * _702;
    float _732 = precise::min(_712, _714);
    float _734 = _646 * _702;
    float _736 = _730;
    if (_516)
    {
        _716 = _158;
    }
    float _738 = _716;
    float _740 = _618 * _698;
    float _742 = _738;
    if (_506)
    {
        _722 = _728;
    }
    float _744 = _722;
    float _746 = _628 * _698;
    if (!_516)
    {
        _742 = _512;
    }
    float _748 = _742;
    float _750 = _740 * _732;
    float _752 = _622 * _698;
    float _754 = _746 * _732;
    float _756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _758 = -_750;
    float _760 = _618 + _758;
    float _762 = _748 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _764 = -_754;
    float _766 = _628 + _764;
    float _768 = _752 * _732;
    float _770 = _760 * _760;
    float _772 = _652 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _774 = -_768;
    float _776 = _622 + _774;
    float _778 = fma(_766, _766, _770);
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _782 = 0.0;
    if (!_516)
    {
        _782 = _430;
    }
    float _784 = _782;
    float _786 = fma(_776, _776, _778);
    float _788 = _784;
    if (_516)
    {
        _788 = _158;
    }
    float _790 = _788;
    float _792 = -_780;
    float _794 = fma(_762, 2.0, _792);
    float _796 = _756 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _800 = sqrt(_786);
    float _802 = -_470;
    float _804 = _802 + 1.0;
    float _806 = fma(_796, _682, -0.5);
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _810 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[83].z, _798);
    float _812 = _790 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[107].x, _730);
    float _816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _818 = _790;
    float _820 = _808;
    if (!_516)
    {
        _818 = _512;
    }
    float _822 = _818;
    float _824 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[107].z, _710);
    float _826 = _822;
    if (!_516)
    {
        _736 = _512;
    }
    float _828 = _736;
    float _830 = -_808;
    float _832 = fma(_812, 2.0, _830);
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _836 = _828;
    if (_516)
    {
        _826 = _430;
    }
    float _838 = _826;
    float _840 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[107].y, _734);
    if (_516)
    {
        _836 = _430;
    }
    float _842 = _836;
    float _844 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[88].z, _834);
    if (_516)
    {
        _820 = _430;
    }
    float _846 = _820;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _850 = _698 * _800;
    float _852 = _846;
    if (!_516)
    {
        _852 = _158;
    }
    float _854 = _852;
    float _856 = fma(_598, _686, _840);
    float _858 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[83].w, _848);
    float _860 = _704 * _850;
    float _862 = _816 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _864 = fma(_614, _686, _824);
    float _866 = _838 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _868 = _860 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _870 = fma(_862, _744, -0.5);
    float _872 = fma(_624, _686, _814);
    float _874 = _740 * _868;
    float _876 = _618 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _878 = _746 * _868;
    float _880 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].z, _844);
    float _882 = -_874;
    float _884 = _618 + _882;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _888 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[28].x, _876);
    float _890 = -_136;
    float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[86].x, _794);
    float _894 = _884 * _884;
    float _896 = fma(_866, -2.0, _886);
    float _898 = -_878;
    float _900 = _628 + _898;
    float _902 = _752 * _868;
    float _904 = fma(_880, _870, _892);
    float _906 = -_136;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[81].x, _832);
    float _910 = fma(_900, _900, _894);
    float _912 = -_902;
    float _914 = _622 + _912;
    float _916 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].z, _810);
    float _918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _920 = fma(_914, _914, _910);
    float _922 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[28].z, _888);
    float _924 = fma(_916, _684, _908);
    float _926 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].w, _858);
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _930 = _854 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _932 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _934 = _922 >= 0.0;
    float _936 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[81].y, _896);
    float _938 = fma(_930, -2.0, _928);
    float _940 = _492 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _942 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].w, _708);
    float _944 = -_936;
    float _946 = fma(_926, _720, _944);
    float _948 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[86].y, _938);
    float _950 = sqrt(_920);
    float _952 = _940 * _918;
    float _954 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[109].x, _872);
    float _956 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[109].y, _856);
    float _958 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[109].z, _864);
    float _960 = -_948;
    float _962 = fma(_942, _806, _960);
    float _964 = _926;
    if (_934)
    {
        _964 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _966 = _964;
    float _968 = _954 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _970 = _772 * _932;
    float _972 = _946 + 0.5;
    float _974 = _958 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _976 = _924 + 0.5;
    float _978 = _968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _980 = as_type<int>(_966);
    if (_934)
    {
        float _982 = _966 * 5.0;
        _980 = as_type<int>(_982);
    }
    int _984 = _980;
    float _986 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _988 = _904 + 0.5;
    float _990 = _698 * _950;
    float _992 = _956 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _994 = _962 + 0.5;
    float _996 = _860 * _990;
    float _998 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _952;
    out.m_67.y = _970;
    out.m_67.z = _976;
    out.m_67.w = _972;
    out.m_69.x = _978;
    out.m_69.y = _998;
    out.m_69.z = _986;
    if (_934)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3565 = as_type<float>(_984);
        out.gl_Position.z = _3565;
    }
    out.m_71.w = _732;
    out.m_73.x = _988;
    out.m_73.y = _994;
    if (_934)
    {
        out.m_49.x = 0.0;
    }
    out.m_75.x = _996;
    if (_934)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1000 = -_874;
    float _1002 = _604 + _1000;
    float _1004 = -_878;
    float _1006 = _556 + _1004;
    float _1008 = -_902;
    float _1010 = _558 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1014 = _1002 + _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1018 = _1006 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1022 = _1010 + _1020;
    float _1024 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1026 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1024);
    float _1028 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1026);
    bool _1030 = _1028 >= 0.0;
    float _1032 = _1022;
    if (_1030)
    {
        _1032 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1034 = _1032;
    int _1036 = as_type<int>(_1034);
    if (_1030)
    {
        out.m_49.x = 0.0;
    }
    if (_1030)
    {
        float _1038 = _1034 * 5.0;
        _1036 = as_type<int>(_1038);
    }
    int _1040 = _1036;
    if (_1030)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3658 = as_type<float>(_1040);
        out.gl_Position.z = _3658;
    }
    if (_1030)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1042 = -_604;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1046 = -_556;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1050 = -_558;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1054 = _386 * _368;
    float _1056 = _1044 * _1044;
    float _1058 = _850 * _990;
    float _1060 = _386 * _382;
    float _1062 = _1054 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1064 = fma(_1048, _1048, _1056);
    float _1066 = _1060 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1068 = fma(_1052, _1052, _1064);
    float _1070 = rsqrt(_1068);
    float _1072 = _1048 * _1070;
    float _1074 = _1052 * _1070;
    float _1076 = _1044 * _1070;
    float _1078 = _1062 * _1058;
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1082 = _1072 * _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1086 = _1074 * _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1090 = _1076 * _1088;
    float _1092 = _1066 * _1058;
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1096 = -_1082;
    float _1098 = fma(_1074, _1094, _1096);
    float _1100 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1102 = -_1086;
    float _1104 = fma(_1076, _1100, _1102);
    float _1106 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1108 = -_1090;
    float _1110 = fma(_1072, _1106, _1108);
    float _1112 = in.m_77.x;
    float _1114 = in.m_77.y;
    float _1116 = in.m_77.z;
    float _1118 = _1098 * _1098;
    float _1120 = fma(_1104, _1104, _1118);
    float _1122 = fma(_1110, _1110, _1120);
    float _1124 = rsqrt(_1122);
    float _1126 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1114);
    float _1128 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1112);
    float _1130 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1116);
    float _1132 = _1078 * _1126;
    float _1134 = _996 * _1128;
    float _1136 = _1092 * _1130;
    float _1138 = _1104 * _1124;
    float _1140 = _1098 * _1124;
    float _1142 = _1110 * _1124;
    float _1144 = _1076 * _1138;
    float _1146 = _1074 * _1140;
    float _1148 = -_1144;
    float _1150 = fma(_1072, _1140, _1148);
    float _1152 = -_1146;
    float _1154 = fma(_1076, _1142, _1152);
    float _1156 = _1132 * _1150;
    float _1158 = _1132 * _1154;
    float _1160 = fma(_1134, _1142, _1156);
    float _1162 = fma(_1134, _1138, _1158);
    float _1164 = fma(_1136, _1074, _1160);
    float _1166 = fma(_1136, _1072, _1162);
    float _1168 = _1072 * _1142;
    float _1170 = _558 + _1164;
    float _1172 = _556 + _1166;
    float _1174 = -_1168;
    float _1176 = fma(_1074, _1138, _1174);
    float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1180 = _1170 + _1178;
    float _1182 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1184 = _1172 + _1182;
    float _1186 = _1132 * _1176;
    float _1188 = _1180 * _1180;
    float _1190 = fma(_1134, _1140, _1186);
    float _1192 = fma(_1184, _1184, _1188);
    float _1194 = fma(_1136, _1076, _1190);
    float _1196 = sqrt(_1192);
    float _1198 = _604 + _1194;
    bool _1200 = _1196 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1202 = _1194;
    float _1204 = _1134;
    float _1206 = _1136;
    if (!_1200)
    {
        _1202 = _1172;
    }
    float _1208 = _1202;
    float _1210 = _1208;
    if (!_1200)
    {
        _1204 = _1170;
    }
    float _1212 = _1204;
    float _1214 = _1212;
    if (!_1200)
    {
        _1206 = _1198;
    }
    float _1216 = _1206;
    bool _1218 = !_1200;
    float _1220 = _1216;
    if (!_1218)
    {
        float _1222 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1226 = _1196 + _1224;
        float _1228 = rsqrt(_1192);
        float _1230 = _1226 * _1222;
        float _1232 = _1198 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1234 = _1230 * 0.15915493667125701904296875;
        float _1236 = _1234 * 6.283185482025146484375;
        float _1238 = cos(_1236);
        float _1240 = _1234 * 6.283185482025146484375;
        float _1242 = sin(_1240);
        float _1244 = _1238 + (-1.0);
        float _1246 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1248 = fma(_1242, _1232, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1250 = fma(_1198, _1238, _1246);
        float _1252 = _1228 * _1248;
        float _1254 = fma(_1184, _1252, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1256 = fma(_1180, _1252, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1220 = _1250;
        _1210 = _1254;
        _1214 = _1256;
    }
    float _1258 = _1220;
    float _1260 = _1210;
    float _1262 = _1214;
    float _1264 = -_750;
    float _1266 = _1264 + _1258;
    float _1268 = -_754;
    float _1270 = _1268 + _1260;
    float _1272 = -_768;
    float _1274 = _1272 + _1262;
    float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1278 = _1266 + _1276;
    float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1282 = _1270 + _1280;
    float _1284 = -_754;
    float _1286 = _556 + _1284;
    float _1288 = -_750;
    float _1290 = _604 + _1288;
    float _1292 = _1278 * _1278;
    float _1294 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1296 = _1274 + _1294;
    float _1298 = -_768;
    float _1300 = _558 + _1298;
    float _1302 = fma(_1282, _1282, _1292);
    float _1304 = fma(_1296, _1296, _1302);
    float _1306 = sqrt(_1304);
    bool _1308 = _1306 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1310 = isnan(_1306);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1316 = _1312 || _1314;
    float _1318 = _1292;
    if (!_1316)
    {
        _1318 = 1.0;
    }
    float _1320 = _1318;
    bool _1322 = !_1316;
    float _1324 = _1320;
    if (!_1322)
    {
        bool _1326 = _1306 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1328 = isnan(_1306);
        bool _1330 = _1326 || _1328;
        bool _1332 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1334 = _1330 || _1332;
        if (!_1334)
        {
            float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1338 = _1306 + _1336;
            float _1340 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1342 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1340;
            float _1344 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1346 = _1344 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1348 = 1.0 / _1342;
            float _1350 = _1338 * _1348;
            float _1352 = fma(_1350, _1346, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1324 = _1352;
            _1354 = true;
        }
        else
        {
            bool _1356 = _1306 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1358 = isnan(_1306);
            bool _1360 = _1356 || _1358;
            bool _1362 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1364 = _1360 || _1362;
            if (!_1364)
            {
                float _1366 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1368 = _1306 + _1366;
                float _1370 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1372 = _1370 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1374 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1376 = _1374 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1378 = 1.0 / _1372;
                float _1380 = _1368 * _1378;
                float _1382 = fma(_1380, _1376, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1324 = _1382;
                _1354 = true;
            }
            else
            {
                _1324 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1354 = false;
    float _1384 = _1324;
    float _1386 = -_874;
    float _1388 = _1386 + _1290;
    float _1390 = -_878;
    float _1392 = _1390 + _1286;
    float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1396 = _1266 + _1394;
    float _1398 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1400 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1402 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan(0.5);
    bool _1408 = _1404 || _1406;
    float _1410 = -_902;
    float _1412 = _1410 + _1300;
    float _1414 = fma(_1396, _1384, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1416 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1398);
    float _1418 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1422 = _1270 + _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1426 = _1274 + _1424;
    float _1428 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1416);
    float _1430 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1418);
    float _1432 = -_874;
    float _1434 = _1432 + _1414;
    float _1436 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1438 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1430);
    float _1440 = fma(_1422, _1384, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1442 = fma(_1426, _1384, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1444 = 1.0 / _1436;
    float _1446 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1448 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan(0.5);
    bool _1456 = _1452 || _1454;
    float _1458 = -_878;
    float _1460 = _1458 + _1440;
    float _1462 = -_902;
    float _1464 = _1462 + _1442;
    float _1466 = _1446 + _1436;
    float _1468 = _1446;
    float _1470 = _1460;
    float _1472 = _1464;
    float _1474 = _1384;
    float _1476 = _1440;
    if (_1408)
    {
        _1468 = _1434;
    }
    float _1478 = _1468;
    float _1480 = _1478;
    float _1482 = _1444;
    if (!_1408)
    {
        float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1486 = _1388 + _1484;
        float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1490 = _1392 + _1488;
        float _1492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1494 = -_1300;
        float _1496 = _1494 + _1442;
        float _1498 = _1486 * _1486;
        float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1502 = _1412 + _1500;
        float _1504 = -_1286;
        float _1506 = _1504 + _1440;
        float _1508 = -_1290;
        float _1510 = _1508 + _1414;
        float _1512 = fma(_1490, _1490, _1498);
        float _1514 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1516 = fma(_1502, _1502, _1512);
        float _1518 = sqrt(_1516);
        float _1520 = 1.0 / _990;
        float _1522 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1524 = precise::min(_1518, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1526 = _1524 * _1492;
        float _1528 = _1526 * _1520;
        float _1530 = _1522 * _1528;
        float _1532 = _1496 * _1528;
        float _1534 = fma(_1506, _1530, _1392);
        float _1536 = fma(_1510, _1530, _1388);
        float _1538 = fma(_1522, _1532, _1412);
        _1480 = _1536;
        _1470 = _1534;
        _1472 = _1538;
        _1474 = _1518;
    }
    float _1540 = _1480;
    float _1542 = _1470;
    float _1544 = _1472;
    float _1546 = _1474;
    float _1548 = _1546;
    if (_1456)
    {
        _1548 = 1.0;
    }
    float _1550 = _1548;
    float _1552 = _1466 * _1444;
    float _1554 = _1552 * 0.5;
    float _1556 = _1550;
    float _1558 = _1554;
    if (!_1456)
    {
        float _1560 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1562 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1564 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1562);
        float _1566 = _1560 * 0.15915493667125701904296875;
        float _1568 = _1566 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        float _1572 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1574 = _1572 * 0.15915493667125701904296875;
        float _1576 = _1566 * 6.283185482025146484375;
        float _1578 = sin(_1576);
        float _1580 = 1.0 / _1570;
        float _1582 = _1574 * 6.283185482025146484375;
        float _1584 = cos(_1582);
        float _1586 = _1578 * _1580;
        float _1588 = 1.0 / _1564;
        float _1590 = _1584 * _1586;
        float _1592 = _1574 * 6.283185482025146484375;
        float _1594 = sin(_1592);
        float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1598 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1596;
        float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1602 = _1588 * _1600;
        float _1604 = 1.0 / _1590;
        float _1606 = 1.0 / _1598;
        float _1608 = _1594 * _1604;
        float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1612 = fma(_1608, _1602, _1610);
        float _1614 = _1612 * _1606;
        float _1616 = precise::clamp(_1614, 0.0, 1.0);
        _1482 = _1574;
        _1476 = _1606;
        _1556 = _1616;
    }
    float _1618 = _1482;
    float _1620 = _1476;
    float _1622 = _1556;
    float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1626 = _1540 + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1630 = _1542 + _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1634 = _1544 + _1632;
    float _1636 = _1626 * _1626;
    float _1638 = fma(_1630, _1630, _1636);
    float _1640 = fma(_1634, _1634, _1638);
    float _1642 = rsqrt(_1640);
    float _1644 = sqrt(_1640);
    float _1646 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1648 = _1630 * _1646;
    float _1650 = _1634 * _1646;
    float _1652 = _1648 * _1648;
    float _1654 = _1650 * _1650;
    float _1656 = _1652 + _1654;
    float _1658 = sqrt(_1656);
    bool _1660 = _1658 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = _1658 + _1662;
    float _1666 = _1618;
    float _1668 = _1664;
    float _1670 = _1626;
    float _1672 = _1646;
    float _1674 = _1648;
    if (_1660)
    {
        float _1676 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1666 = _1676;
    }
    float _1678 = _1666;
    float _1680 = _1678;
    if (_1660)
    {
        float _1682 = _1664 * _1678;
        _1668 = _1682;
    }
    float _1684 = _1668;
    if (_1660)
    {
        float _1686 = rsqrt(_1656);
        _1680 = _1686;
    }
    float _1688 = _1680;
    float _1690 = _1688;
    if (_1660)
    {
        float _1692 = _1684 * 0.15915493667125701904296875;
        _1558 = _1692;
    }
    float _1694 = _1558;
    float _1696 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1698 = _1634;
    if (_1660)
    {
        float _1700 = _1694 * 6.283185482025146484375;
        float _1702 = sin(_1700);
        _1698 = _1702;
    }
    float _1704 = _1698;
    float _1706 = precise::max(0.0, _1696);
    float _1708 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1710 = _1620;
    float _1712 = _1706;
    if (_1660)
    {
        float _1714 = _1694 * 6.283185482025146484375;
        float _1716 = cos(_1714);
        _1710 = _1716;
    }
    float _1718 = _1710;
    float _1720 = -_1646;
    float _1722 = -_1706;
    float _1724 = fma(_1626, _1720, _1722);
    if (_1660)
    {
        float _1726 = _1724 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1670 = _1726;
    }
    float _1728 = _1670;
    float _1730 = _1704;
    float _1732 = _1728;
    if (_1660)
    {
        float _1734 = fma(_1704, _1728, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1730 = _1734;
    }
    float _1736 = _1730;
    float _1738 = _1736;
    if (!_1660)
    {
        _1732 = _1724;
    }
    float _1740 = _1732;
    float _1742 = _1740;
    if (_1660)
    {
        float _1744 = _1688 * _1736;
        _1672 = _1744;
    }
    float _1746 = _1672;
    if (!_1660)
    {
        _1738 = _1652;
    }
    float _1748 = _1738;
    float _1750 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1752 = _1748;
    float _1754 = _1718;
    if (_1660)
    {
        float _1756 = _1718 + (-1.0);
        _1712 = _1756;
    }
    float _1758 = _1712;
    float _1760 = _1758;
    if (_1660)
    {
        float _1762 = _1648 * _1746;
        _1674 = _1762;
    }
    float _1764 = _1674;
    float _1766 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1750);
    if (_1660)
    {
        float _1768 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1690 = _1768;
    }
    float _1770 = _1690;
    if (!_1660)
    {
        _1760 = _1650;
    }
    float _1772 = _1760;
    float _1774 = _1772;
    if (_1660)
    {
        float _1776 = _1650 * _1746;
        _1774 = _1776;
    }
    float _1778 = _1774;
    if (_1660)
    {
        float _1780 = _1764 * _1764;
        _1752 = _1780;
    }
    float _1782 = _1752;
    if (_1660)
    {
        float _1784 = fma(_1724, _1718, _1770);
        _1742 = _1784;
    }
    float _1786 = _1742;
    if (!_1660)
    {
        _1754 = _1654;
    }
    float _1788 = _1754;
    float _1790 = _1788;
    if (_1660)
    {
        float _1792 = _1778 * _1778;
        _1790 = _1792;
    }
    float _1794 = _1790;
    float _1796 = fma(_1786, _1786, _1782);
    float _1798 = _1796 + _1794;
    float _1800 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1804 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1802);
    float _1806 = precise::clamp(_1804, 0.0, 1.0);
    float _1808 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1810 = rsqrt(_1798);
    float _1812 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1800);
    float _1814 = -_1806;
    float _1816 = _1814 + 1.0;
    float _1818 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1808);
    float _1820 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1812);
    float _1822 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1824 = abs(_1816);
    float _1826 = log2(_1824);
    float _1828 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1830 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1822);
    float _1832 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1818);
    float _1834 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1836 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1830);
    float _1838 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1840 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1766);
    float _1842 = _1810 * _1764;
    float _1844 = -_1834;
    float _1846 = fma(_1844, _1708, 1.0);
    float _1848 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1850 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1852 = _1810 * _1786;
    float _1854 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1856 = _1810 * _1778;
    float _1858 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1850);
    float _1860 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1862 = -_1854;
    float _1864 = fma(_1852, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1862);
    float _1866 = _1840 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1868 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1858);
    float _1870 = log2(_1846);
    float _1872 = -_1856;
    float _1874 = fma(_1872, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1864);
    float _1876 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1878 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1868);
    float _1880 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1882 = fma(_1874, -0.5, 0.5);
    float _1884 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1876);
    float _1886 = fma(_1874, 0.5, 0.5);
    float _1888 = exp2(_1860);
    float _1890 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1880);
    float _1892 = _1852 + 1.0;
    float _1894 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1884);
    float _1896 = fma(_1886, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1898 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1890);
    float _1900 = 1.0 / _1878;
    float _1902 = fma(_1886, _1896, -0.212114393711090087890625);
    float _1904 = _1870 * 0.693147182464599609375;
    float _1906 = fma(_1886, _1902, 1.570728778839111328125);
    float _1908 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1910 = sqrt(_1882);
    float _1912 = -_1852;
    float _1914 = fma(_1888, _1892, _1912);
    float _1916 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1894);
    float _1918 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1898);
    float _1920 = fma(_1914, 0.5, 0.5);
    float _1922 = _1916 * _1900;
    float _1924 = _1918 * _1900;
    float _1926 = fma(_1922, 0.5, 0.5);
    float _1928 = fma(_1924, -0.5, 0.5);
    float _1930 = _1910 * 0.636619746685028076171875;
    float3 _5056 = float3(_1926, _1928, _1908);
    float _1932 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5056, float3(0.0), isnan(_5056)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5056, float3(0.0), isnan(_5056)), level(0.0)).x;
    float3 _5067 = float3(_1926, _1928, _1908);
    float4 _1935 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5067, float3(0.0), isnan(_5067)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5067, float3(0.0), isnan(_5067)), level(0.0)).xyzw;
    float _1937 = _1935.x;
    float _1939 = _1935.y;
    float _1941 = _1935.z;
    float _1943 = _1935.w;
    float _1945 = -_1906;
    float _1947 = fma(_1930, _1945, 1.0);
    float2 _5089 = float2(_1947, _1920);
    float3 _1951 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5089, float2(0.0), isnan(_5089)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5089, float2(0.0), isnan(_5089)), level(0.0)).xyz;
    float _1953 = _1951.x;
    float _1955 = _1951.y;
    float _1957 = _1951.z;
    float _1959 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1961 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1963 = _1622 > 0.0;
    bool _1965 = isnan(_1622);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan(0.0);
    bool _1971 = _1967 || _1969;
    out.m_79.x = _1392;
    out.m_79.y = _1388;
    out.m_79.z = _1412;
    float _1973 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1959);
    float _1975 = _1878 * 0.5;
    float _1977 = _1622 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1979 = exp2(_1961);
    float _1981 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1973);
    float _1983 = _1916 + _1878;
    out.m_81.x = _1542;
    out.m_81.y = _1540;
    out.m_81.z = _1544;
    float _1985 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1981);
    float _1987 = _1983 * 0.5;
    float _1989 = _1977 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1991 = _1985 + _1878;
    out.gl_Position.x = _1916;
    out.gl_Position.y = _1918;
    out.gl_Position.z = _1985;
    out.gl_Position.w = _1878;
    float _1993 = _1991 * 0.5;
    out.m_49.x = _1989;
    float _1995 = -_1979;
    float _1997 = _1995 + 1.0;
    float _1999 = fma(_1918, -0.5, _1975);
    float _2001 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _1987;
    out.m_83.y = _1999;
    out.m_83.z = _1993;
    out.m_83.w = _1878;
    float _2003 = -_2001;
    float _2005 = _2003 + 1.0;
    float _2007 = _2001 * _1932;
    float _2009 = _1943 * _2007;
    float _2011 = _1943 * _2005;
    float _2013 = _1957 * _2007;
    float _2015 = fma(_1953, _2009, _1937);
    float _2017 = fma(_1955, _2009, _1939);
    float _2019 = fma(_1943, _2013, _1941);
    out.m_85.x = _2015;
    out.m_85.y = _2017;
    out.m_85.z = _2019;
    out.m_85.w = _2011;
    if (_1971)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2021 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2021;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

