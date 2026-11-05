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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_57 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_75 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_49 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _700 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
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
        out.m_45.x = 0.0;
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
        float _2182 = as_type<float>(_110);
        out.gl_Position.z = _2182;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    if (_124)
    {
        float _132 = float(_94);
        _130 = _132;
    }
    float _134 = _130;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    if (_140)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _104;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2250 = as_type<float>(_146);
        out.gl_Position.z = _2250;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_49.x;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_49.y;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_51.w;
    float _166 = in.m_47.x;
    float _168 = in.m_47.y;
    float _170 = in.m_47.z;
    float _172 = in.m_42.x;
    float _174 = in.m_42.y;
    float _176 = in.m_42.z;
    float _178 = 0.0;
    float _180 = _150;
    if (!_162)
    {
        float _182 = _150 * _150;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_162)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    out.m_53.x = _148;
    out.m_53.y = _152;
    bool _194 = !_162;
    float _196 = _192;
    float _198 = _148;
    if (!_194)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _150 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _150);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _228;
    }
    float _230 = _196;
    bool _232 = !_162;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _150 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _180 = _252;
    }
    float _254 = _180;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _166, _258);
    float _266 = fma(_254, _168, _260);
    float _268 = fma(_254, _170, _262);
    float _270 = fma(_264, _164, _172);
    float _272 = fma(_266, _164, _174);
    float _274 = fma(_268, _164, _176);
    bool _276 = !_256;
    float _294;
    if (!_276)
    {
        float _278 = in.m_55.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        float _298 = float(_94);
        float _300 = 1.0 / _298;
        float _302 = _128 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _322 = 1.0 / _308;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _332 = 1.0 / _316;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = _304 + _334;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _346 = 1.0 / _312;
    float _348 = _336 * _322;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _352 = _304 + _350;
    float _354 = _338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _356 = _340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _358 = _342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _362 = _304 + _360;
    float _364 = 1.0 / _326;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _368 = _304 + _366;
    float _370 = _352 * _332;
    bool _372 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _374 = isnan(_304);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    out.m_57.x = _354;
    out.m_57.y = _356;
    out.m_57.z = _358;
    out.m_57.w = _344;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    bool _388 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _390 = isnan(_304);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = 1.0 / _320;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _404 = _304 + _402;
    float _406 = _368 * _346;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _410 = _304 + _408;
    float _412 = -_382;
    float _414 = _412 + 1.0;
    float _416 = fma(_386, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _418 = 1.0 / _330;
    float _420 = _404 * _364;
    bool _422 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _424 = isnan(_304);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    bool _434 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _436 = isnan(_304);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -_432;
    float _448 = _446 + 1.0;
    float _450 = _410 * _400;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _452;
    float _456 = _432 * _414;
    float _458 = fma(_454, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _460 = _444 * _448;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _466 = _362 * _418;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _468;
    bool _472 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _474 = isnan(_304);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = fma(_464, _406, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _486 = fma(_470, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _488 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _490 = isnan(_304);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -_444;
    float _502 = _500 + 1.0;
    bool _504 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _506 = isnan(_304);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _524 = _498 * _502;
    float _526 = -_498;
    float _528 = _526 + 1.0;
    float _530 = -_514;
    float _532 = _530 + 1.0;
    float _534 = fma(_518, _406, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _536 = fma(_522, _406, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _538 = _398 * _528;
    float _540 = _482 * _532;
    float _542 = -_398;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _546;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _552 = _458 * _540;
    float _554 = -_482;
    float _556 = _554 + 1.0;
    float _558 = _486 * _540;
    float _560 = _416 * _540;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _570 = _514 * _544;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _576;
    float _580 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[143].x, _552);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _582;
    float _586 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[143].y, _558);
    float _588 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[143].z, _560);
    float _590 = fma(_564, _450, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _592 = fma(_568, _450, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _594 = fma(_574, _450, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _596 = fma(_578, _370, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _598 = fma(_534, _570, _580);
    float _600 = fma(_548, _370, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _602 = fma(_584, _370, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _604 = fma(_484, _570, _586);
    float _606 = fma(_536, _570, _588);
    float _608 = fma(_596, _538, _598);
    float _610 = fma(_600, _538, _604);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _612;
    float _616 = fma(_602, _538, _606);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _622;
    float _626 = fma(_614, _420, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _628 = fma(_590, _524, _608);
    float _630 = fma(_592, _524, _610);
    float _632 = fma(_594, _524, _616);
    float _634 = fma(_620, _420, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _644 = fma(_624, _420, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _650 = fma(_638, _466, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _652 = fma(_642, _466, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _654 = fma(_626, _460, _628);
    float _656 = fma(_648, _466, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _658 = fma(_634, _460, _630);
    float _660 = fma(_644, _460, _632);
    float _662 = fma(_650, _456, _654);
    float _664 = fma(_652, _456, _658);
    float _666 = fma(_656, _456, _660);
    float _668 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[149].x, _662);
    float _670 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[149].y, _664);
    float _672 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[149].z, _666);
    bool _674 = !_550;
    float _676 = _638;
    float _678 = _650;
    int _680 = as_type<int>(_654);
    float _698;
    if (!_674)
    {
        float _682 = in.m_55.x;
        float _684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _686 = _682 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _688 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _690 = _688 * _684;
        float _692 = floor(_690);
        float _694 = -_692;
        float _696 = _690 + _694;
        _698 = _696;
        _700 = true;
    }
    else
    {
        float _702 = float(_94);
        float _704 = 1.0 / _702;
        float _706 = _128 * _704;
        _698 = _706;
    }
    _700 = false;
    float _708 = _698;
    float _710 = in.m_59.x;
    float _712 = in.m_59.y;
    float _714 = in.m_55.y;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _718 = _716 != 0;
    float _720 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.083333335816860198974609375;
    float _722 = _644;
    float _724 = _708;
    if (_718)
    {
        float _726 = in.m_55.x;
        _722 = _726;
    }
    float _728 = _722;
    float _730 = abs(_710);
    float _732 = abs(_712);
    float _734 = precise::max(_730, _732);
    float _736 = _712 * 0.0625;
    bool _738 = _734 >= 16.0;
    float _740 = _710 * 0.0625;
    if (_718)
    {
        _676 = _714;
    }
    float _742 = _676;
    float _744 = _738 ? _736 : _712;
    float _746 = _738 ? _740 : _710;
    float _748 = in.m_51.x;
    float _750 = in.m_51.y;
    float _752 = in.m_51.z;
    float _754 = abs(_744);
    bool _756 = _754 != 0.0;
    bool _758 = isnan(_754);
    bool _760 = _756 || _758;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    float _766 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 2.1333334445953369140625;
    float _768 = abs(_746);
    bool _770 = _768 == 0.0;
    float _772 = abs(_746);
    bool _774 = _772 == 0.0;
    bool _776 = !_764;
    bool _778 = _774 && _776;
    float _780 = _766 * 0.15915493667125701904296875;
    int _782 = as_type<int>(_766);
    float _784 = _728;
    float _786 = _742;
    int _788 = _764 ? (-1) : 0;
    if (_718)
    {
        _678 = _728;
    }
    float _790 = _678;
    bool _792 = false;
    float _794 = _790;
    if (_778)
    {
        bool _796 = as_type<int>(_746) >= 0;
        _792 = _796;
    }
    bool _798 = _792;
    if (_778)
    {
        int _800 = _798 ? 0 : 1078530011;
        _680 = _800;
    }
    int _802 = _680;
    if (!_718)
    {
        float _804 = in.m_55.x;
        float _806 = _714 * 3.1415927410125732421875;
        float _808 = _806 * 0.15915493667125701904296875;
        float _810 = _808 * 6.283185482025146484375;
        float _812 = sin(_810);
        float _814 = _804 * 3.1415927410125732421875;
        float _816 = _814 * 0.15915493667125701904296875;
        float _818 = _816 * 6.283185482025146484375;
        float _820 = sin(_818);
        _782 = as_type<int>(_816);
        _784 = _804;
        _794 = _820;
        _786 = _812;
    }
    int _822 = _782;
    float _824 = _784;
    float _826 = _794;
    float _828 = _786;
    int _830 = _822;
    if (_778)
    {
        int _832 = int(0x80000000) & as_type<int>(_744);
        int _834 = _802 | _832;
        _830 = _834;
    }
    int _836 = _830;
    bool _838 = !_764;
    bool _840 = _838 && _770;
    int _842 = _836;
    float _844 = as_type<float>(_836);
    if (!_840)
    {
        float _846 = abs(_744);
        bool _848 = _846 != as_type<float>(0x7f800000u /* inf */);
        bool _850 = isnan(_846);
        bool _852 = _848 || _850;
        bool _854 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _856 = _852 || _854;
        float _858 = abs(_746);
        bool _860 = _858 == as_type<float>(0x7f800000u /* inf */);
        float _862 = abs(_746);
        bool _864 = _862 == as_type<float>(0x7f800000u /* inf */);
        bool _866 = !_856;
        bool _868 = _864 && _866;
        if (_868)
        {
            bool _870 = as_type<int>(_746) >= 0;
            _788 = _870 ? (-1) : 0;
        }
        int _872 = _788;
        if (_868)
        {
            _842 = 1075235812;
        }
        int _874 = _842;
        int _876 = _874;
        if (_868)
        {
            int _878 = ~_872;
            int _880 = (_878 != 0) ? _874 : 1061752795;
            _876 = _880;
        }
        int _882 = _876;
        float _884 = as_type<float>(_882);
        if (_868)
        {
            int _886 = int(0x80000000) & as_type<int>(_744);
            int _888 = _882 | _886;
            _884 = as_type<float>(_888);
        }
        float _890 = _884;
        bool _892 = !_856;
        bool _894 = _892 && _860;
        _844 = _890;
        if (!_894)
        {
            float _896 = abs(_744);
            float _898 = abs(_746);
            float _900 = precise::max(_896, _898);
            float _902 = abs(_744);
            float _904 = abs(_746);
            float _906 = precise::min(_902, _904);
            float _908 = 1.0 / _900;
            float _910 = abs(_744);
            float _912 = abs(_746);
            bool _914 = _910 > _912;
            bool _916 = as_type<int>(_746) >= 0;
            float _918 = _906 * _908;
            float _920 = abs(_744);
            float _922 = abs(_746);
            float _924 = _920 + _922;
            int _926 = as_type<int>(_744) & int(0x80000000);
            float _928 = _918 * _918;
            bool _930 = _924 > as_type<float>(0x7f800000u /* inf */);
            bool _932 = isnan(_924);
            bool _934 = _930 || _932;
            bool _936 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _938 = _934 || _936;
            float _940 = _928 + 11.33538818359375;
            float _942 = fma(_928, _940, 28.84246826171875);
            float _944 = fma(_928, _942, 19.6966705322265625);
            float _946 = fma(_928, -0.82336294651031494140625, -5.674867153167724609375);
            float _948 = fma(_928, _946, -6.565555095672607421875);
            float _950 = 1.0 / _944;
            float _952 = _928 * _948;
            float _954 = _918 * _952;
            float _956 = fma(_954, _950, _918);
            float _958 = _956;
            _844 = _924;
            if (_914)
            {
                float _960 = -_956;
                float _962 = _960 + 1.57079637050628662109375;
                _958 = _962;
            }
            float _964 = _958;
            int _966 = as_type<int>(_964);
            if (!_916)
            {
                float _968 = -_964;
                float _970 = _968 + 3.1415927410125732421875;
                _966 = as_type<int>(_970);
            }
            int _972 = _966;
            if (!_938)
            {
                int _974 = _926 | _972;
                _844 = as_type<float>(_974);
            }
        }
    }
    float _976 = _844;
    float _978 = in.m_61.x;
    float _980 = in.m_61.y;
    float _982 = in.m_61.z;
    float _984 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 1.33333337306976318359375;
    float _986 = fma(_976, 3.0, _720);
    float _988 = -_720;
    float _990 = fma(_976, 4.0, _988);
    float _992 = _780 * 6.283185482025146484375;
    float _994 = sin(_992);
    float _996 = fma(_976, 2.0, _984);
    float _998 = _986 * 0.15915493667125701904296875;
    float _1000 = _990 * 0.15915493667125701904296875;
    float _1002 = _668 * _748;
    float _1004 = _996 * 0.01745329238474369049072265625;
    float _1006 = _672 * _752;
    float _1008 = in.m_59.z;
    float _1010 = _1000 * 6.283185482025146484375;
    float _1012 = cos(_1010);
    float _1014 = _1004 * 0.15915493667125701904296875;
    float _1016 = _670 * _750;
    float _1018 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1020 = -(*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1022 = 1.0 + _1020;
    float _1024 = precise::clamp(_1022, 0.0, 1.0);
    float _1026 = _998 * 6.283185482025146484375;
    float _1028 = sin(_1026);
    float _1030 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1032 = -_978;
    float _1034 = _978 * _1032;
    float _1036 = _982 * _980;
    float _1038 = -_982;
    float _1040 = _978 * _1038;
    float _1042 = _1014 * 6.283185482025146484375;
    float _1044 = sin(_1042);
    float _1046 = -_1034;
    float _1048 = fma(_980, _980, _1046);
    float _1050 = _1012 * 0.07500000298023223876953125;
    float _1052 = _1040 * _152;
    float _1054 = fma(_994, 0.0250000059604644775390625, 0.97500002384185791015625);
    float _1056 = _1048 * _152;
    float _1058 = fma(_1028, 0.1500000059604644775390625, _1050);
    float _1060 = fma(_1024, 0.5, -0.5);
    float _1062 = fma(_1024, 0.875, 0.125);
    float _1064 = -_1052;
    float _1066 = fma(_1064, _1058, _710);
    float _1068 = fma(_1060, _152, 1.0);
    float _1070 = fma(_1044, 0.25, 0.25);
    float _1072 = _1036 * _152;
    float _1074 = _1054 * _1068;
    float _1076 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1078 = -_1052;
    float _1080 = fma(_1078, _1070, _1066);
    float _1082 = fma(_1072, _1058, _712);
    float _1084 = -_1056;
    float _1086 = fma(_1084, _1058, _1008);
    float _1088 = _1080 * _1074;
    float _1090 = fma(_1072, _1070, _1082);
    float _1092 = -_1056;
    float _1094 = fma(_1092, _1070, _1086);
    float _1096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1088);
    float _1098 = _1090 * _1074;
    float _1100 = _1094 * _1062;
    float _1102 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1104 = _1076 * _1096;
    float _1106 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1098);
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1100);
    float _1110 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1102);
    float _1112 = _1030 * _1106;
    float _1114 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1116 = _1018 * _1108;
    float _1118 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1110);
    float _1120 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1122 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1114);
    float _1124 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1126 = _1118 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1128 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1120);
    float _1130 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1122);
    float _1132 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1124);
    float _1134 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1128);
    float _1136 = _1130 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1138 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1132);
    float _1140 = _1126 + _1134;
    float _1142 = _1136 + _1138;
    float _1144 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1148 = _1140 + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1152 = _1142 + _1150;
    float _1154 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1144);
    float _1156 = _1148 * _1148;
    float _1158 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1160 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1154);
    float _1162 = fma(_1152, _1152, _1156);
    float _1164 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1158);
    float _1166 = _1160 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1168 = sqrt(_1162);
    float _1170 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1164);
    float _1172 = _1166 + _1170;
    bool _1174 = _1168 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1176 = _1156;
    float _1178 = _1166;
    float _1180 = _1170;
    float _1182 = _1112;
    float _1184 = _1070;
    if (!_1174)
    {
        _1176 = _1142;
    }
    float _1186 = _1176;
    float _1188 = _1186;
    if (!_1174)
    {
        _1178 = _1140;
    }
    float _1190 = _1178;
    float _1192 = _1190;
    if (!_1174)
    {
        _1180 = _1172;
    }
    float _1194 = _1180;
    bool _1196 = !_1174;
    float _1198 = _1194;
    if (!_1196)
    {
        float _1200 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1202 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1204 = _1168 + _1202;
        float _1206 = _1172 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = rsqrt(_1162);
        float _1210 = _1204 * _1200;
        float _1212 = _1210 * 0.15915493667125701904296875;
        float _1214 = _1212 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        float _1218 = _1212 * 6.283185482025146484375;
        float _1220 = sin(_1218);
        float _1222 = _1216 + (-1.0);
        float _1224 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1226 = fma(_1220, _1206, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1228 = fma(_1172, _1216, _1224);
        float _1230 = _1208 * _1226;
        float _1232 = fma(_1152, _1230, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1234 = fma(_1148, _1230, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1198 = _1228;
        _1188 = _1232;
        _1192 = _1234;
    }
    float _1236 = _1198;
    float _1238 = _1188;
    float _1240 = _1192;
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1244 = _1236 + _1242;
    float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1248 = _1238 + _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1252 = _1240 + _1250;
    float _1254 = _1244 * _1244;
    float _1256 = fma(_1248, _1248, _1254);
    float _1258 = fma(_1252, _1252, _1256);
    float _1260 = rsqrt(_1258);
    float _1262 = sqrt(_1258);
    float _1264 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1266 = _1248 * _1264;
    float _1268 = _1252 * _1264;
    float _1270 = _1266 * _1266;
    float _1272 = _1268 * _1268;
    float _1274 = _1270 + _1272;
    float _1276 = sqrt(_1274);
    bool _1278 = _1276 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1282 = _1276 + _1280;
    float _1284 = _1256;
    float _1286 = _1274;
    float _1288 = _1282;
    float _1290 = _1244;
    if (_1278)
    {
        float _1292 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1284 = _1292;
    }
    float _1294 = _1284;
    if (_1278)
    {
        float _1296 = rsqrt(_1274);
        _1286 = _1296;
    }
    float _1298 = _1286;
    float _1300 = _1298;
    if (_1278)
    {
        float _1302 = _1282 * _1294;
        _1288 = _1302;
    }
    float _1304 = _1288;
    if (_1278)
    {
        float _1306 = _1304 * 0.15915493667125701904296875;
        _1182 = _1306;
    }
    float _1308 = _1182;
    float _1310 = _1252;
    float _1312 = _1308;
    if (_1278)
    {
        float _1314 = _1308 * 6.283185482025146484375;
        float _1316 = sin(_1314);
        _1310 = _1316;
    }
    float _1318 = _1310;
    float _1320 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1322 = precise::max(0.0, _1320);
    float _1324 = _1294;
    float _1326 = _1322;
    if (_1278)
    {
        float _1328 = _1308 * 6.283185482025146484375;
        float _1330 = cos(_1328);
        _1324 = _1330;
    }
    float _1332 = _1324;
    float _1334 = -_1264;
    float _1336 = -_1322;
    float _1338 = fma(_1244, _1334, _1336);
    if (_1278)
    {
        float _1340 = _1338 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1290 = _1340;
    }
    float _1342 = _1290;
    float _1344 = _1342;
    float _1346 = _1318;
    if (_1278)
    {
        float _1348 = fma(_1318, _1342, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1344 = _1348;
    }
    float _1350 = _1344;
    float _1352 = _1350;
    if (!_1278)
    {
        _1346 = _1266;
    }
    float _1354 = _1346;
    float _1356 = _1354;
    float _1358 = _1332;
    if (_1278)
    {
        float _1360 = _1332 + (-1.0);
        _1326 = _1360;
    }
    float _1362 = _1326;
    float _1364 = _1362;
    if (_1278)
    {
        float _1366 = _1298 * _1350;
        _1184 = _1366;
    }
    float _1368 = _1184;
    if (!_1278)
    {
        _1352 = _1338;
    }
    float _1370 = _1352;
    float _1372 = _1370;
    if (_1278)
    {
        float _1374 = _1362 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1312 = _1374;
    }
    float _1376 = _1312;
    if (_1278)
    {
        float _1378 = _1266 * _1368;
        _1356 = _1378;
    }
    float _1380 = _1356;
    if (!_1278)
    {
        _1364 = _1268;
    }
    float _1382 = _1364;
    float _1384 = _1382;
    if (_1278)
    {
        float _1386 = _1268 * _1368;
        _1384 = _1386;
    }
    float _1388 = _1384;
    if (!_1278)
    {
        _1300 = _1270;
    }
    float _1390 = _1300;
    float _1392 = _1390;
    if (_1278)
    {
        float _1394 = fma(_1338, _1332, _1376);
        _1372 = _1394;
    }
    float _1396 = _1372;
    if (_1278)
    {
        float _1398 = _1380 * _1380;
        _1392 = _1398;
    }
    float _1400 = _1392;
    if (!_1278)
    {
        _1358 = _1272;
    }
    float _1402 = _1358;
    float _1404 = _1402;
    if (_1278)
    {
        float _1406 = _1388 * _1388;
        _1404 = _1406;
    }
    float _1408 = _1404;
    float _1410 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1412 = fma(_1396, _1396, _1400);
    float _1414 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1416 = _1412 + _1408;
    float _1418 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1410);
    float _1420 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1424 = fma(_1262, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1422);
    float _1426 = precise::clamp(_1424, 0.0, 1.0);
    float _1428 = rsqrt(_1416);
    float _1430 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1418);
    float _1432 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1434 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1420);
    float _1436 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1438 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1440 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1432);
    float _1442 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1434);
    float _1444 = -_1426;
    float _1446 = _1444 + 1.0;
    float _1448 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1450 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1436);
    float _1452 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1440);
    float _1454 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1456 = abs(_1446);
    float _1458 = log2(_1456);
    float _1460 = -_1448;
    float _1462 = fma(_1460, _1414, 1.0);
    float _1464 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1450);
    float _1466 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1468 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1470 = _1428 * _1380;
    float _1472 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1474 = _1428 * _1396;
    float _1476 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1468);
    float _1478 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1480 = _1428 * _1388;
    float _1482 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1484 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1476);
    float _1486 = -_1478;
    float _1488 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1486);
    float _1490 = log2(_1462);
    float _1492 = _1458 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1494 = -_1480;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1488);
    float _1498 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1484);
    float _1500 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1482);
    float _1502 = fma(_1496, -0.5, 0.5);
    float _1504 = exp2(_1492);
    float _1506 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1508 = fma(_1496, 0.5, 0.5);
    float _1510 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1506);
    float _1512 = _1474 + 1.0;
    float _1514 = 1.0 / _1498;
    float _1516 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1500);
    float _1518 = fma(_1508, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1520 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1510);
    float _1522 = _1490 * 0.693147182464599609375;
    float _1524 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1516);
    float _1526 = fma(_1508, _1518, -0.212114393711090087890625);
    float _1528 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1520);
    float _1530 = sqrt(_1502);
    float _1532 = -_1474;
    float _1534 = fma(_1504, _1512, _1532);
    float _1536 = fma(_1508, _1526, 1.570728778839111328125);
    float _1538 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1540 = fma(_1534, 0.5, 0.5);
    float _1542 = _1524 * _1514;
    float _1544 = _1528 * _1514;
    float _1546 = fma(_1542, 0.5, 0.5);
    float _1548 = fma(_1544, -0.5, 0.5);
    float _1550 = _1530 * 0.636619746685028076171875;
    float3 _4498 = float3(_1546, _1548, _1538);
    float _1552 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4498, float3(0.0), isnan(_4498)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4498, float3(0.0), isnan(_4498)), level(0.0)).x;
    float _1554 = -_1536;
    float _1556 = fma(_1550, _1554, 1.0);
    float3 _4514 = float3(_1546, _1548, _1538);
    float4 _1559 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4514, float3(0.0), isnan(_4514)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4514, float3(0.0), isnan(_4514)), level(0.0)).xyzw;
    float _1561 = _1559.x;
    float _1563 = _1559.y;
    float _1565 = _1559.z;
    float _1567 = _1559.w;
    float2 _4531 = float2(_1556, _1540);
    float3 _1571 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4531, float2(0.0), isnan(_4531)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4531, float2(0.0), isnan(_4531)), level(0.0)).xyz;
    float _1573 = _1571.x;
    float _1575 = _1571.y;
    float _1577 = _1571.z;
    float _1579 = in.m_55.z;
    float _1581 = in.m_55.w;
    float _1583 = -_152;
    float _1585 = _1583 + 1.0;
    bool _1587 = _714 > 0.5;
    float _1589 = in.m_63.w;
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1591;
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1597 = _1595 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1601 = _708 + _1599;
    float _1603 = 1.0 / _1593;
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1605;
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1611 = _1609 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1613 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1615 = isnan(_708);
    bool _1617 = _1613 || _1615;
    bool _1619 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1621 = _1617 || _1619;
    float _1623 = float(_1621);
    float _1625 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1627 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1627;
    bool _1631 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1633 = isnan(_708);
    bool _1635 = _1631 || _1633;
    bool _1637 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1639 = _1635 || _1637;
    float _1641 = float(_1639);
    float _1643 = 1.0 / _1597;
    float _1645 = -_1623;
    float _1647 = _1645 + 1.0;
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1651 = _1649 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    bool _1653 = _1581 > 0.5;
    float _1655 = 1.0 / _1607;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1659 = _1587 ? as_type<int>(_1585) : as_type<int>(_152);
    out.m_65.w = _1589;
    int _1661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1663 = _1661 != 0;
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1667 = _1665 != 0;
    int _1669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1671 = _1669 != 0;
    float _1673 = 1.0 / _1611;
    int _1675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1677 = _1675 != 0;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1681 = _1671 ? as_type<float>(_1659) : _152;
    float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1685 = _708 + _1683;
    int _1687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1689 = _1687 != 0;
    float _1691 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1679);
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1695 = _1693 != 0;
    float _1697 = 0.0;
    bool _1699 = _1689;
    float _1701 = _1651;
    if (_1663)
    {
        float _1703 = in.m_55.x;
        _1697 = _1703;
    }
    float _1705 = _1697;
    bool _1707 = _1579 > 0.5;
    float _1709 = _714 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1711 = _1653 ? as_type<int>(_1585) : as_type<int>(_152);
    float _1713 = _370;
    bool _1715 = _1707;
    if (_1667)
    {
        float _1717 = in.m_55.z;
        _1713 = _1717;
    }
    float _1719 = _1713;
    bool _1721 = _714 > 0.5;
    bool _1723 = _1721 && _1677;
    float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1727 = _708 + _1725;
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1731 = _708 + _1729;
    float _1733 = _1685 * _1655;
    float _1735 = _1601 * _1673;
    float _1737 = _1727 * _1603;
    float _1739 = _1731 * _1643;
    float _1741 = fma(_1709, -2.0, _1657);
    float _1743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1745;
    float _1749 = _1689 ? as_type<float>(_1711) : _152;
    float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1753 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1751;
    int _1755 = _1707 ? as_type<int>(_1585) : as_type<int>(_152);
    float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1757;
    float _1761 = fma(_1747, _1737, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1763 = fma(_1753, _1737, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    if (_1663)
    {
        bool _1765 = _1705 > 0.5;
        _1715 = _1765;
    }
    bool _1767 = _1715;
    float _1769 = fma(_1759, _1737, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1773 = _1771 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    if (_1667)
    {
        bool _1775 = _1719 > 0.5;
        _1699 = _1775;
    }
    bool _1777 = _1699;
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1781 = _1779 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1783 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1785 = _1783 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1787 = _1695 ? as_type<float>(_1755) : _152;
    float _1789 = fma(_1781, _1739, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1791 = fma(_1773, _1739, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1793 = fma(_1785, _1739, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1795 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1795;
    float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1801 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1799;
    float _1803 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1805 = _1803 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1809 = fma(_1797, _1733, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1811 = fma(_1801, _1733, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1813 = fma(_1629, _1733, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1815 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1817 = isnan(_708);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1823 = _1819 || _1821;
    float _1825 = float(_1823);
    float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1829 = _1827 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    bool _1831 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1833 = isnan(_708);
    bool _1835 = _1831 || _1833;
    bool _1837 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1839 = _1835 || _1837;
    float _1841 = float(_1839);
    float _1843 = fma(_1805, _1735, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1847 = fma(_1829, _1735, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1849 = -_1825;
    float _1851 = _1849 + 1.0;
    float _1853 = -_1841;
    float _1855 = _1853 + 1.0;
    int _1857 = 0;
    if (_1663)
    {
        float _1859 = -_148;
        float _1861 = _1859 + 1.0;
        _1857 = as_type<int>(_1861);
    }
    int _1863 = _1857;
    float _1865 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1867 = _1841 * _1851;
    float _1869 = _1623 * _1855;
    bool _1871 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1873 = isnan(_708);
    bool _1875 = _1871 || _1873;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1879 = _1875 || _1877;
    float _1881 = float(_1879);
    float _1883 = _1641 * _1647;
    float _1885 = fma(_1651, _1735, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1887 = -_1641;
    float _1889 = _1887 + 1.0;
    int _1891 = _1863;
    if (!_1663)
    {
        _1701 = _148;
    }
    float _1893 = _1701;
    float _1895 = fma(_1865, _1681, -0.5);
    float _1897 = _1893;
    if (_1663)
    {
        float _1899 = _1767 ? as_type<float>(_1863) : _148;
        _1897 = _1899;
    }
    float _1901 = _1897;
    float _1903 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1741);
    float _1905 = _1807 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1907 = _1845 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1909 = _1881 * _1889;
    float _1911 = -_1881;
    float _1913 = _1911 + 1.0;
    float _1915 = fma(_1905, _1787, -0.5);
    float _1917 = fma(_1907, _1901, -0.5);
    float _1919 = _1761 * _1909;
    float _1921 = _1763 * _1909;
    float _1923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (_1667)
    {
        float _1925 = -_148;
        float _1927 = _1925 + 1.0;
        _1891 = as_type<int>(_1927);
    }
    int _1929 = _1891;
    float _1931 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1691);
    float _1933 = _1769 * _1909;
    float _1935 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1919);
    float _1937 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1921);
    float _1939 = _1931;
    if (!_1667)
    {
        _724 = _148;
    }
    float _1941 = _724;
    float _1943 = -_1903;
    float _1945 = fma(_1931, _1895, _1943);
    float _1947 = _1941;
    if (_1667)
    {
        float _1949 = _1777 ? as_type<float>(_1929) : _148;
        _1947 = _1949;
    }
    float _1951 = _1947;
    float _1953 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1933);
    if (!_1677)
    {
        _1939 = _148;
    }
    float _1955 = _1939;
    float _1957 = _1955;
    if (_1723)
    {
        float _1959 = -_148;
        float _1961 = _1959 + 1.0;
        _198 = _1961;
    }
    float _1963 = _198;
    float _1965 = fma(_1789, _1883, _1935);
    float _1967 = fma(_1791, _1883, _1937);
    float _1969 = fma(_1793, _1883, _1953);
    float _1971 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1973 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1677)
    {
        _1957 = _1963;
    }
    float _1975 = _1957;
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1979 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1981 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1983 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1985 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1973);
    float _1987 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1977);
    float _1989 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1981);
    float _1991 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1995 = _824 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1997 = _826 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1999 = _828 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2001 = fma(_1809, _1869, _1965);
    float _2003 = -_1991;
    float _2005 = fma(_1995, 2.0, _2003);
    float _2007 = -_1983;
    float _2009 = fma(_1997, 2.0, _2007);
    float _2011 = fma(_1999, -2.0, _1993);
    float _2013 = fma(_1811, _1869, _1967);
    float _2015 = fma(_1813, _1869, _1969);
    float _2017 = _1951 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2019 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1985);
    float _2021 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1987);
    float _2023 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1989);
    float _2025 = -_128;
    float _2027 = fma(_2025, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2005);
    float _2029 = -_128;
    float _2031 = fma(_2029, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2009);
    float _2033 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2011);
    float _2035 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1625);
    float _2037 = fma(_1843, _1867, _2001);
    float _2039 = fma(_1847, _1867, _2013);
    float _2041 = fma(_1885, _1867, _2015);
    float _2043 = _2017 * _1979;
    float _2045 = _1458 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2047 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[127].x, _2037);
    float _2049 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[127].y, _2039);
    float _2051 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[127].z, _2041);
    float _2053 = fma(_1971, _1975, -0.5);
    float _2055 = exp2(_2045);
    float _2057 = -_2033;
    float _2059 = fma(_2023, _1915, _2057);
    float _2061 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2035);
    float _2063 = fma(_2021, _2053, _2031);
    float _2065 = fma(_2019, _1917, _2027);
    float _2067 = _2059 + 0.5;
    float _2069 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2061);
    float _2071 = _2063 + 0.5;
    float _2073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2075 = _1945 + 0.5;
    float _2077 = _2065 + 0.5;
    out.m_67.x = _2071;
    out.m_67.y = _2067;
    float _2079 = _1749 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2081 = -_2055;
    float _2083 = _2081 + 1.0;
    float _2085 = _2047 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2087 = _2049 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2089 = _2051 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2091 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2093 = _2069 + _1498;
    float _2095 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2097 = _2085 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2099 = _2079 * _2073;
    float _2101 = _2087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2103 = _2089 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2105 = _2093 * 0.5;
    float _2107 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2077;
    out.m_69.y = _2075;
    out.m_69.z = _2043;
    out.m_69.w = _2099;
    out.m_71.x = _2097;
    out.m_71.y = _2101;
    out.m_71.z = _2103;
    out.m_71.w = _2095;
    out.gl_Position.x = _1524;
    out.gl_Position.y = _1528;
    out.gl_Position.z = _2069;
    out.gl_Position.w = _1498;
    out.m_73.z = _2105;
    out.m_73.w = _1498;
    out.m_45.x = _2107;
    float _2109 = _2091 * _1552;
    float _2111 = -_2091;
    float _2113 = _2111 + 1.0;
    float _2115 = _1567 * _2109;
    float _2117 = _1577 * _2109;
    float _2119 = fma(_1573, _2115, _1561);
    float _2121 = _1567 * _2113;
    float _2123 = fma(_1575, _2115, _1563);
    float _2125 = fma(_1567, _2117, _1565);
    out.m_75.x = _2119;
    out.m_75.y = _2123;
    out.m_75.z = _2125;
    out.m_75.w = _2121;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _700 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
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
        out.m_45.x = 0.0;
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
        float _2182 = as_type<float>(_110);
        out.gl_Position.z = _2182;
    }
    if (!_98)
    {
        return out;
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    if (_124)
    {
        float _132 = float(_94);
        _130 = _132;
    }
    float _134 = _130;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    if (_140)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _104;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2250 = as_type<float>(_146);
        out.gl_Position.z = _2250;
    }
    if (_140)
    {
        return out;
    }
    float _148 = in.m_49.x;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_49.y;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_51.w;
    float _166 = in.m_47.x;
    float _168 = in.m_47.y;
    float _170 = in.m_47.z;
    float _172 = in.m_42.x;
    float _174 = in.m_42.y;
    float _176 = in.m_42.z;
    float _178 = 0.0;
    float _180 = _150;
    if (!_162)
    {
        float _182 = _150 * _150;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_162)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    out.m_53.x = _148;
    out.m_53.y = _152;
    bool _194 = !_162;
    float _196 = _192;
    float _198 = _148;
    if (!_194)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _150 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _150);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _228;
    }
    float _230 = _196;
    bool _232 = !_162;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _150 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _180 = _252;
    }
    float _254 = _180;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _166, _258);
    float _266 = fma(_254, _168, _260);
    float _268 = fma(_254, _170, _262);
    float _270 = fma(_264, _164, _172);
    float _272 = fma(_266, _164, _174);
    float _274 = fma(_268, _164, _176);
    bool _276 = !_256;
    float _294;
    if (!_276)
    {
        float _278 = in.m_55.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        float _298 = float(_94);
        float _300 = 1.0 / _298;
        float _302 = _128 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _322 = 1.0 / _308;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _332 = 1.0 / _316;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = _304 + _334;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _346 = 1.0 / _312;
    float _348 = _336 * _322;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _352 = _304 + _350;
    float _354 = _338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _356 = _340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _358 = _342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _362 = _304 + _360;
    float _364 = 1.0 / _326;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _368 = _304 + _366;
    float _370 = _352 * _332;
    bool _372 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _374 = isnan(_304);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    out.m_57.x = _354;
    out.m_57.y = _356;
    out.m_57.z = _358;
    out.m_57.w = _344;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    bool _388 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _390 = isnan(_304);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = 1.0 / _320;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _404 = _304 + _402;
    float _406 = _368 * _346;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _410 = _304 + _408;
    float _412 = -_382;
    float _414 = _412 + 1.0;
    float _416 = fma(_386, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _418 = 1.0 / _330;
    float _420 = _404 * _364;
    bool _422 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _424 = isnan(_304);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    bool _434 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _436 = isnan(_304);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -_432;
    float _448 = _446 + 1.0;
    float _450 = _410 * _400;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _452;
    float _456 = _432 * _414;
    float _458 = fma(_454, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _460 = _444 * _448;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _466 = _362 * _418;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _468;
    bool _472 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _474 = isnan(_304);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = fma(_464, _406, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _486 = fma(_470, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _488 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _490 = isnan(_304);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -_444;
    float _502 = _500 + 1.0;
    bool _504 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _506 = isnan(_304);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _524 = _498 * _502;
    float _526 = -_498;
    float _528 = _526 + 1.0;
    float _530 = -_514;
    float _532 = _530 + 1.0;
    float _534 = fma(_518, _406, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _536 = fma(_522, _406, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _538 = _398 * _528;
    float _540 = _482 * _532;
    float _542 = -_398;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _546;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _552 = _458 * _540;
    float _554 = -_482;
    float _556 = _554 + 1.0;
    float _558 = _486 * _540;
    float _560 = _416 * _540;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _570 = _514 * _544;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _576;
    float _580 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[143].x, _552);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _582;
    float _586 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[143].y, _558);
    float _588 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[143].z, _560);
    float _590 = fma(_564, _450, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _592 = fma(_568, _450, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _594 = fma(_574, _450, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _596 = fma(_578, _370, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _598 = fma(_534, _570, _580);
    float _600 = fma(_548, _370, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _602 = fma(_584, _370, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _604 = fma(_484, _570, _586);
    float _606 = fma(_536, _570, _588);
    float _608 = fma(_596, _538, _598);
    float _610 = fma(_600, _538, _604);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _612;
    float _616 = fma(_602, _538, _606);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _622;
    float _626 = fma(_614, _420, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _628 = fma(_590, _524, _608);
    float _630 = fma(_592, _524, _610);
    float _632 = fma(_594, _524, _616);
    float _634 = fma(_620, _420, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _644 = fma(_624, _420, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _650 = fma(_638, _466, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _652 = fma(_642, _466, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _654 = fma(_626, _460, _628);
    float _656 = fma(_648, _466, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _658 = fma(_634, _460, _630);
    float _660 = fma(_644, _460, _632);
    float _662 = fma(_650, _456, _654);
    float _664 = fma(_652, _456, _658);
    float _666 = fma(_656, _456, _660);
    float _668 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[149].x, _662);
    float _670 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[149].y, _664);
    float _672 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[149].z, _666);
    bool _674 = !_550;
    float _676 = _638;
    float _678 = _650;
    int _680 = as_type<int>(_654);
    float _698;
    if (!_674)
    {
        float _682 = in.m_55.x;
        float _684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _686 = _682 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _688 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _690 = _688 * _684;
        float _692 = floor(_690);
        float _694 = -_692;
        float _696 = _690 + _694;
        _698 = _696;
        _700 = true;
    }
    else
    {
        float _702 = float(_94);
        float _704 = 1.0 / _702;
        float _706 = _128 * _704;
        _698 = _706;
    }
    _700 = false;
    float _708 = _698;
    float _710 = in.m_59.x;
    float _712 = in.m_59.y;
    float _714 = in.m_55.y;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _718 = _716 != 0;
    float _720 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.083333335816860198974609375;
    float _722 = _644;
    float _724 = _708;
    if (_718)
    {
        float _726 = in.m_55.x;
        _722 = _726;
    }
    float _728 = _722;
    float _730 = abs(_710);
    float _732 = abs(_712);
    float _734 = precise::max(_730, _732);
    float _736 = _712 * 0.0625;
    bool _738 = _734 >= 16.0;
    float _740 = _710 * 0.0625;
    if (_718)
    {
        _676 = _714;
    }
    float _742 = _676;
    float _744 = _738 ? _736 : _712;
    float _746 = _738 ? _740 : _710;
    float _748 = in.m_51.x;
    float _750 = in.m_51.y;
    float _752 = in.m_51.z;
    float _754 = abs(_744);
    bool _756 = _754 != 0.0;
    bool _758 = isnan(_754);
    bool _760 = _756 || _758;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    float _766 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 2.1333334445953369140625;
    float _768 = abs(_746);
    bool _770 = _768 == 0.0;
    float _772 = abs(_746);
    bool _774 = _772 == 0.0;
    bool _776 = !_764;
    bool _778 = _774 && _776;
    float _780 = _766 * 0.15915493667125701904296875;
    int _782 = as_type<int>(_766);
    float _784 = _728;
    float _786 = _742;
    int _788 = _764 ? (-1) : 0;
    if (_718)
    {
        _678 = _728;
    }
    float _790 = _678;
    bool _792 = false;
    float _794 = _790;
    if (_778)
    {
        bool _796 = as_type<int>(_746) >= 0;
        _792 = _796;
    }
    bool _798 = _792;
    if (_778)
    {
        int _800 = _798 ? 0 : 1078530011;
        _680 = _800;
    }
    int _802 = _680;
    if (!_718)
    {
        float _804 = in.m_55.x;
        float _806 = _714 * 3.1415927410125732421875;
        float _808 = _806 * 0.15915493667125701904296875;
        float _810 = _808 * 6.283185482025146484375;
        float _812 = sin(_810);
        float _814 = _804 * 3.1415927410125732421875;
        float _816 = _814 * 0.15915493667125701904296875;
        float _818 = _816 * 6.283185482025146484375;
        float _820 = sin(_818);
        _782 = as_type<int>(_816);
        _784 = _804;
        _794 = _820;
        _786 = _812;
    }
    int _822 = _782;
    float _824 = _784;
    float _826 = _794;
    float _828 = _786;
    int _830 = _822;
    if (_778)
    {
        int _832 = int(0x80000000) & as_type<int>(_744);
        int _834 = _802 | _832;
        _830 = _834;
    }
    int _836 = _830;
    bool _838 = !_764;
    bool _840 = _838 && _770;
    int _842 = _836;
    float _844 = as_type<float>(_836);
    if (!_840)
    {
        float _846 = abs(_744);
        bool _848 = _846 != as_type<float>(0x7f800000u /* inf */);
        bool _850 = isnan(_846);
        bool _852 = _848 || _850;
        bool _854 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _856 = _852 || _854;
        float _858 = abs(_746);
        bool _860 = _858 == as_type<float>(0x7f800000u /* inf */);
        float _862 = abs(_746);
        bool _864 = _862 == as_type<float>(0x7f800000u /* inf */);
        bool _866 = !_856;
        bool _868 = _864 && _866;
        if (_868)
        {
            bool _870 = as_type<int>(_746) >= 0;
            _788 = _870 ? (-1) : 0;
        }
        int _872 = _788;
        if (_868)
        {
            _842 = 1075235812;
        }
        int _874 = _842;
        int _876 = _874;
        if (_868)
        {
            int _878 = ~_872;
            int _880 = (_878 != 0) ? _874 : 1061752795;
            _876 = _880;
        }
        int _882 = _876;
        float _884 = as_type<float>(_882);
        if (_868)
        {
            int _886 = int(0x80000000) & as_type<int>(_744);
            int _888 = _882 | _886;
            _884 = as_type<float>(_888);
        }
        float _890 = _884;
        bool _892 = !_856;
        bool _894 = _892 && _860;
        _844 = _890;
        if (!_894)
        {
            float _896 = abs(_744);
            float _898 = abs(_746);
            float _900 = precise::max(_896, _898);
            float _902 = abs(_744);
            float _904 = abs(_746);
            float _906 = precise::min(_902, _904);
            float _908 = 1.0 / _900;
            float _910 = abs(_744);
            float _912 = abs(_746);
            bool _914 = _910 > _912;
            bool _916 = as_type<int>(_746) >= 0;
            float _918 = _906 * _908;
            float _920 = abs(_744);
            float _922 = abs(_746);
            float _924 = _920 + _922;
            int _926 = as_type<int>(_744) & int(0x80000000);
            float _928 = _918 * _918;
            bool _930 = _924 > as_type<float>(0x7f800000u /* inf */);
            bool _932 = isnan(_924);
            bool _934 = _930 || _932;
            bool _936 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _938 = _934 || _936;
            float _940 = _928 + 11.33538818359375;
            float _942 = fma(_928, _940, 28.84246826171875);
            float _944 = fma(_928, _942, 19.6966705322265625);
            float _946 = fma(_928, -0.82336294651031494140625, -5.674867153167724609375);
            float _948 = fma(_928, _946, -6.565555095672607421875);
            float _950 = 1.0 / _944;
            float _952 = _928 * _948;
            float _954 = _918 * _952;
            float _956 = fma(_954, _950, _918);
            float _958 = _956;
            _844 = _924;
            if (_914)
            {
                float _960 = -_956;
                float _962 = _960 + 1.57079637050628662109375;
                _958 = _962;
            }
            float _964 = _958;
            int _966 = as_type<int>(_964);
            if (!_916)
            {
                float _968 = -_964;
                float _970 = _968 + 3.1415927410125732421875;
                _966 = as_type<int>(_970);
            }
            int _972 = _966;
            if (!_938)
            {
                int _974 = _926 | _972;
                _844 = as_type<float>(_974);
            }
        }
    }
    float _976 = _844;
    float _978 = in.m_61.x;
    float _980 = in.m_61.y;
    float _982 = in.m_61.z;
    float _984 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 1.33333337306976318359375;
    float _986 = fma(_976, 3.0, _720);
    float _988 = -_720;
    float _990 = fma(_976, 4.0, _988);
    float _992 = _780 * 6.283185482025146484375;
    float _994 = sin(_992);
    float _996 = fma(_976, 2.0, _984);
    float _998 = _986 * 0.15915493667125701904296875;
    float _1000 = _990 * 0.15915493667125701904296875;
    float _1002 = _668 * _748;
    float _1004 = _996 * 0.01745329238474369049072265625;
    float _1006 = _672 * _752;
    float _1008 = in.m_59.z;
    float _1010 = _1000 * 6.283185482025146484375;
    float _1012 = cos(_1010);
    float _1014 = _1004 * 0.15915493667125701904296875;
    float _1016 = _670 * _750;
    float _1018 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1020 = -(*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1022 = 1.0 + _1020;
    float _1024 = precise::clamp(_1022, 0.0, 1.0);
    float _1026 = _998 * 6.283185482025146484375;
    float _1028 = sin(_1026);
    float _1030 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1032 = -_978;
    float _1034 = _978 * _1032;
    float _1036 = _982 * _980;
    float _1038 = -_982;
    float _1040 = _978 * _1038;
    float _1042 = _1014 * 6.283185482025146484375;
    float _1044 = sin(_1042);
    float _1046 = -_1034;
    float _1048 = fma(_980, _980, _1046);
    float _1050 = _1012 * 0.07500000298023223876953125;
    float _1052 = _1040 * _152;
    float _1054 = fma(_994, 0.0250000059604644775390625, 0.97500002384185791015625);
    float _1056 = _1048 * _152;
    float _1058 = fma(_1028, 0.1500000059604644775390625, _1050);
    float _1060 = fma(_1024, 0.5, -0.5);
    float _1062 = fma(_1024, 0.875, 0.125);
    float _1064 = -_1052;
    float _1066 = fma(_1064, _1058, _710);
    float _1068 = fma(_1060, _152, 1.0);
    float _1070 = fma(_1044, 0.25, 0.25);
    float _1072 = _1036 * _152;
    float _1074 = _1054 * _1068;
    float _1076 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1078 = -_1052;
    float _1080 = fma(_1078, _1070, _1066);
    float _1082 = fma(_1072, _1058, _712);
    float _1084 = -_1056;
    float _1086 = fma(_1084, _1058, _1008);
    float _1088 = _1080 * _1074;
    float _1090 = fma(_1072, _1070, _1082);
    float _1092 = -_1056;
    float _1094 = fma(_1092, _1070, _1086);
    float _1096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1088);
    float _1098 = _1090 * _1074;
    float _1100 = _1094 * _1062;
    float _1102 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1104 = _1076 * _1096;
    float _1106 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1098);
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1100);
    float _1110 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1102);
    float _1112 = _1030 * _1106;
    float _1114 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1116 = _1018 * _1108;
    float _1118 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1110);
    float _1120 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1122 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1114);
    float _1124 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1126 = _1118 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1128 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1120);
    float _1130 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1122);
    float _1132 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1124);
    float _1134 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1128);
    float _1136 = _1130 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1138 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1132);
    float _1140 = _1126 + _1134;
    float _1142 = _1136 + _1138;
    float _1144 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1148 = _1140 + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1152 = _1142 + _1150;
    float _1154 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1144);
    float _1156 = _1148 * _1148;
    float _1158 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1160 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1154);
    float _1162 = fma(_1152, _1152, _1156);
    float _1164 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1158);
    float _1166 = _1160 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1168 = sqrt(_1162);
    float _1170 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1164);
    float _1172 = _1166 + _1170;
    bool _1174 = _1168 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1176 = _1156;
    float _1178 = _1166;
    float _1180 = _1170;
    float _1182 = _1112;
    float _1184 = _1070;
    if (!_1174)
    {
        _1176 = _1142;
    }
    float _1186 = _1176;
    float _1188 = _1186;
    if (!_1174)
    {
        _1178 = _1140;
    }
    float _1190 = _1178;
    float _1192 = _1190;
    if (!_1174)
    {
        _1180 = _1172;
    }
    float _1194 = _1180;
    bool _1196 = !_1174;
    float _1198 = _1194;
    if (!_1196)
    {
        float _1200 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1202 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1204 = _1168 + _1202;
        float _1206 = _1172 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = rsqrt(_1162);
        float _1210 = _1204 * _1200;
        float _1212 = _1210 * 0.15915493667125701904296875;
        float _1214 = _1212 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        float _1218 = _1212 * 6.283185482025146484375;
        float _1220 = sin(_1218);
        float _1222 = _1216 + (-1.0);
        float _1224 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1226 = fma(_1220, _1206, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1228 = fma(_1172, _1216, _1224);
        float _1230 = _1208 * _1226;
        float _1232 = fma(_1152, _1230, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1234 = fma(_1148, _1230, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1198 = _1228;
        _1188 = _1232;
        _1192 = _1234;
    }
    float _1236 = _1198;
    float _1238 = _1188;
    float _1240 = _1192;
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1244 = _1236 + _1242;
    float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1248 = _1238 + _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1252 = _1240 + _1250;
    float _1254 = _1244 * _1244;
    float _1256 = fma(_1248, _1248, _1254);
    float _1258 = fma(_1252, _1252, _1256);
    float _1260 = rsqrt(_1258);
    float _1262 = sqrt(_1258);
    float _1264 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1266 = _1248 * _1264;
    float _1268 = _1252 * _1264;
    float _1270 = _1266 * _1266;
    float _1272 = _1268 * _1268;
    float _1274 = _1270 + _1272;
    float _1276 = sqrt(_1274);
    bool _1278 = _1276 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1282 = _1276 + _1280;
    float _1284 = _1256;
    float _1286 = _1274;
    float _1288 = _1282;
    float _1290 = _1244;
    if (_1278)
    {
        float _1292 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1284 = _1292;
    }
    float _1294 = _1284;
    if (_1278)
    {
        float _1296 = rsqrt(_1274);
        _1286 = _1296;
    }
    float _1298 = _1286;
    float _1300 = _1298;
    if (_1278)
    {
        float _1302 = _1282 * _1294;
        _1288 = _1302;
    }
    float _1304 = _1288;
    if (_1278)
    {
        float _1306 = _1304 * 0.15915493667125701904296875;
        _1182 = _1306;
    }
    float _1308 = _1182;
    float _1310 = _1252;
    float _1312 = _1308;
    if (_1278)
    {
        float _1314 = _1308 * 6.283185482025146484375;
        float _1316 = sin(_1314);
        _1310 = _1316;
    }
    float _1318 = _1310;
    float _1320 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1322 = precise::max(0.0, _1320);
    float _1324 = _1294;
    float _1326 = _1322;
    if (_1278)
    {
        float _1328 = _1308 * 6.283185482025146484375;
        float _1330 = cos(_1328);
        _1324 = _1330;
    }
    float _1332 = _1324;
    float _1334 = -_1264;
    float _1336 = -_1322;
    float _1338 = fma(_1244, _1334, _1336);
    if (_1278)
    {
        float _1340 = _1338 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1290 = _1340;
    }
    float _1342 = _1290;
    float _1344 = _1342;
    float _1346 = _1318;
    if (_1278)
    {
        float _1348 = fma(_1318, _1342, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1344 = _1348;
    }
    float _1350 = _1344;
    float _1352 = _1350;
    if (!_1278)
    {
        _1346 = _1266;
    }
    float _1354 = _1346;
    float _1356 = _1354;
    float _1358 = _1332;
    if (_1278)
    {
        float _1360 = _1332 + (-1.0);
        _1326 = _1360;
    }
    float _1362 = _1326;
    float _1364 = _1362;
    if (_1278)
    {
        float _1366 = _1298 * _1350;
        _1184 = _1366;
    }
    float _1368 = _1184;
    if (!_1278)
    {
        _1352 = _1338;
    }
    float _1370 = _1352;
    float _1372 = _1370;
    if (_1278)
    {
        float _1374 = _1362 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1312 = _1374;
    }
    float _1376 = _1312;
    if (_1278)
    {
        float _1378 = _1266 * _1368;
        _1356 = _1378;
    }
    float _1380 = _1356;
    if (!_1278)
    {
        _1364 = _1268;
    }
    float _1382 = _1364;
    float _1384 = _1382;
    if (_1278)
    {
        float _1386 = _1268 * _1368;
        _1384 = _1386;
    }
    float _1388 = _1384;
    if (!_1278)
    {
        _1300 = _1270;
    }
    float _1390 = _1300;
    float _1392 = _1390;
    if (_1278)
    {
        float _1394 = fma(_1338, _1332, _1376);
        _1372 = _1394;
    }
    float _1396 = _1372;
    if (_1278)
    {
        float _1398 = _1380 * _1380;
        _1392 = _1398;
    }
    float _1400 = _1392;
    if (!_1278)
    {
        _1358 = _1272;
    }
    float _1402 = _1358;
    float _1404 = _1402;
    if (_1278)
    {
        float _1406 = _1388 * _1388;
        _1404 = _1406;
    }
    float _1408 = _1404;
    float _1410 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1412 = fma(_1396, _1396, _1400);
    float _1414 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1416 = _1412 + _1408;
    float _1418 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1410);
    float _1420 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1424 = fma(_1262, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1422);
    float _1426 = precise::clamp(_1424, 0.0, 1.0);
    float _1428 = rsqrt(_1416);
    float _1430 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1418);
    float _1432 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1434 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1420);
    float _1436 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1438 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1440 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1432);
    float _1442 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1434);
    float _1444 = -_1426;
    float _1446 = _1444 + 1.0;
    float _1448 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1450 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1436);
    float _1452 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1440);
    float _1454 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1456 = abs(_1446);
    float _1458 = log2(_1456);
    float _1460 = -_1448;
    float _1462 = fma(_1460, _1414, 1.0);
    float _1464 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1450);
    float _1466 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1468 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1470 = _1428 * _1380;
    float _1472 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1474 = _1428 * _1396;
    float _1476 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1468);
    float _1478 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1480 = _1428 * _1388;
    float _1482 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1484 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1476);
    float _1486 = -_1478;
    float _1488 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1486);
    float _1490 = log2(_1462);
    float _1492 = _1458 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1494 = -_1480;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1488);
    float _1498 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1484);
    float _1500 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1482);
    float _1502 = fma(_1496, -0.5, 0.5);
    float _1504 = exp2(_1492);
    float _1506 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1508 = fma(_1496, 0.5, 0.5);
    float _1510 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1506);
    float _1512 = _1474 + 1.0;
    float _1514 = 1.0 / _1498;
    float _1516 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1500);
    float _1518 = fma(_1508, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1520 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1510);
    float _1522 = _1490 * 0.693147182464599609375;
    float _1524 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1516);
    float _1526 = fma(_1508, _1518, -0.212114393711090087890625);
    float _1528 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1520);
    float _1530 = sqrt(_1502);
    float _1532 = -_1474;
    float _1534 = fma(_1504, _1512, _1532);
    float _1536 = fma(_1508, _1526, 1.570728778839111328125);
    float _1538 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1540 = fma(_1534, 0.5, 0.5);
    float _1542 = _1524 * _1514;
    float _1544 = _1528 * _1514;
    float _1546 = fma(_1542, 0.5, 0.5);
    float _1548 = fma(_1544, -0.5, 0.5);
    float _1550 = _1530 * 0.636619746685028076171875;
    float3 _4498 = float3(_1546, _1548, _1538);
    float _1552 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4498, float3(0.0), isnan(_4498)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4498, float3(0.0), isnan(_4498)), level(0.0)).x;
    float _1554 = -_1536;
    float _1556 = fma(_1550, _1554, 1.0);
    float3 _4514 = float3(_1546, _1548, _1538);
    float4 _1559 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4514, float3(0.0), isnan(_4514)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4514, float3(0.0), isnan(_4514)), level(0.0)).xyzw;
    float _1561 = _1559.x;
    float _1563 = _1559.y;
    float _1565 = _1559.z;
    float _1567 = _1559.w;
    float2 _4531 = float2(_1556, _1540);
    float3 _1571 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4531, float2(0.0), isnan(_4531)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4531, float2(0.0), isnan(_4531)), level(0.0)).xyz;
    float _1573 = _1571.x;
    float _1575 = _1571.y;
    float _1577 = _1571.z;
    float _1579 = in.m_55.z;
    float _1581 = in.m_55.w;
    float _1583 = -_152;
    float _1585 = _1583 + 1.0;
    bool _1587 = _714 > 0.5;
    float _1589 = in.m_63.w;
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1591;
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1597 = _1595 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1601 = _708 + _1599;
    float _1603 = 1.0 / _1593;
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1605;
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1611 = _1609 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1613 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1615 = isnan(_708);
    bool _1617 = _1613 || _1615;
    bool _1619 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1621 = _1617 || _1619;
    float _1623 = float(_1621);
    float _1625 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1627 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1627;
    bool _1631 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1633 = isnan(_708);
    bool _1635 = _1631 || _1633;
    bool _1637 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1639 = _1635 || _1637;
    float _1641 = float(_1639);
    float _1643 = 1.0 / _1597;
    float _1645 = -_1623;
    float _1647 = _1645 + 1.0;
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1651 = _1649 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    bool _1653 = _1581 > 0.5;
    float _1655 = 1.0 / _1607;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1659 = _1587 ? as_type<int>(_1585) : as_type<int>(_152);
    out.m_65.w = _1589;
    int _1661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1663 = _1661 != 0;
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1667 = _1665 != 0;
    int _1669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1671 = _1669 != 0;
    float _1673 = 1.0 / _1611;
    int _1675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1677 = _1675 != 0;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1681 = _1671 ? as_type<float>(_1659) : _152;
    float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1685 = _708 + _1683;
    int _1687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1689 = _1687 != 0;
    float _1691 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1679);
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1695 = _1693 != 0;
    float _1697 = 0.0;
    bool _1699 = _1689;
    float _1701 = _1651;
    if (_1663)
    {
        float _1703 = in.m_55.x;
        _1697 = _1703;
    }
    float _1705 = _1697;
    bool _1707 = _1579 > 0.5;
    float _1709 = _714 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1711 = _1653 ? as_type<int>(_1585) : as_type<int>(_152);
    float _1713 = _370;
    bool _1715 = _1707;
    if (_1667)
    {
        float _1717 = in.m_55.z;
        _1713 = _1717;
    }
    float _1719 = _1713;
    bool _1721 = _714 > 0.5;
    bool _1723 = _1721 && _1677;
    float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1727 = _708 + _1725;
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1731 = _708 + _1729;
    float _1733 = _1685 * _1655;
    float _1735 = _1601 * _1673;
    float _1737 = _1727 * _1603;
    float _1739 = _1731 * _1643;
    float _1741 = fma(_1709, -2.0, _1657);
    float _1743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1745;
    float _1749 = _1689 ? as_type<float>(_1711) : _152;
    float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1753 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1751;
    int _1755 = _1707 ? as_type<int>(_1585) : as_type<int>(_152);
    float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1757;
    float _1761 = fma(_1747, _1737, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1763 = fma(_1753, _1737, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    if (_1663)
    {
        bool _1765 = _1705 > 0.5;
        _1715 = _1765;
    }
    bool _1767 = _1715;
    float _1769 = fma(_1759, _1737, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1773 = _1771 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    if (_1667)
    {
        bool _1775 = _1719 > 0.5;
        _1699 = _1775;
    }
    bool _1777 = _1699;
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1781 = _1779 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1783 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1785 = _1783 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1787 = _1695 ? as_type<float>(_1755) : _152;
    float _1789 = fma(_1781, _1739, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1791 = fma(_1773, _1739, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1793 = fma(_1785, _1739, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1795 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1795;
    float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1801 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1799;
    float _1803 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1805 = _1803 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1809 = fma(_1797, _1733, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1811 = fma(_1801, _1733, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1813 = fma(_1629, _1733, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1815 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1817 = isnan(_708);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1823 = _1819 || _1821;
    float _1825 = float(_1823);
    float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1829 = _1827 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    bool _1831 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1833 = isnan(_708);
    bool _1835 = _1831 || _1833;
    bool _1837 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1839 = _1835 || _1837;
    float _1841 = float(_1839);
    float _1843 = fma(_1805, _1735, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1847 = fma(_1829, _1735, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1849 = -_1825;
    float _1851 = _1849 + 1.0;
    float _1853 = -_1841;
    float _1855 = _1853 + 1.0;
    int _1857 = 0;
    if (_1663)
    {
        float _1859 = -_148;
        float _1861 = _1859 + 1.0;
        _1857 = as_type<int>(_1861);
    }
    int _1863 = _1857;
    float _1865 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1867 = _1841 * _1851;
    float _1869 = _1623 * _1855;
    bool _1871 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1873 = isnan(_708);
    bool _1875 = _1871 || _1873;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1879 = _1875 || _1877;
    float _1881 = float(_1879);
    float _1883 = _1641 * _1647;
    float _1885 = fma(_1651, _1735, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1887 = -_1641;
    float _1889 = _1887 + 1.0;
    int _1891 = _1863;
    if (!_1663)
    {
        _1701 = _148;
    }
    float _1893 = _1701;
    float _1895 = fma(_1865, _1681, -0.5);
    float _1897 = _1893;
    if (_1663)
    {
        float _1899 = _1767 ? as_type<float>(_1863) : _148;
        _1897 = _1899;
    }
    float _1901 = _1897;
    float _1903 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1741);
    float _1905 = _1807 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1907 = _1845 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1909 = _1881 * _1889;
    float _1911 = -_1881;
    float _1913 = _1911 + 1.0;
    float _1915 = fma(_1905, _1787, -0.5);
    float _1917 = fma(_1907, _1901, -0.5);
    float _1919 = _1761 * _1909;
    float _1921 = _1763 * _1909;
    float _1923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (_1667)
    {
        float _1925 = -_148;
        float _1927 = _1925 + 1.0;
        _1891 = as_type<int>(_1927);
    }
    int _1929 = _1891;
    float _1931 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1691);
    float _1933 = _1769 * _1909;
    float _1935 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1919);
    float _1937 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1921);
    float _1939 = _1931;
    if (!_1667)
    {
        _724 = _148;
    }
    float _1941 = _724;
    float _1943 = -_1903;
    float _1945 = fma(_1931, _1895, _1943);
    float _1947 = _1941;
    if (_1667)
    {
        float _1949 = _1777 ? as_type<float>(_1929) : _148;
        _1947 = _1949;
    }
    float _1951 = _1947;
    float _1953 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1933);
    if (!_1677)
    {
        _1939 = _148;
    }
    float _1955 = _1939;
    float _1957 = _1955;
    if (_1723)
    {
        float _1959 = -_148;
        float _1961 = _1959 + 1.0;
        _198 = _1961;
    }
    float _1963 = _198;
    float _1965 = fma(_1789, _1883, _1935);
    float _1967 = fma(_1791, _1883, _1937);
    float _1969 = fma(_1793, _1883, _1953);
    float _1971 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1973 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1677)
    {
        _1957 = _1963;
    }
    float _1975 = _1957;
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1979 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1981 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1983 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1985 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1973);
    float _1987 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1977);
    float _1989 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1981);
    float _1991 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1995 = _824 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1997 = _826 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1999 = _828 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2001 = fma(_1809, _1869, _1965);
    float _2003 = -_1991;
    float _2005 = fma(_1995, 2.0, _2003);
    float _2007 = -_1983;
    float _2009 = fma(_1997, 2.0, _2007);
    float _2011 = fma(_1999, -2.0, _1993);
    float _2013 = fma(_1811, _1869, _1967);
    float _2015 = fma(_1813, _1869, _1969);
    float _2017 = _1951 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2019 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1985);
    float _2021 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1987);
    float _2023 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1989);
    float _2025 = -_128;
    float _2027 = fma(_2025, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2005);
    float _2029 = -_128;
    float _2031 = fma(_2029, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2009);
    float _2033 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2011);
    float _2035 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1625);
    float _2037 = fma(_1843, _1867, _2001);
    float _2039 = fma(_1847, _1867, _2013);
    float _2041 = fma(_1885, _1867, _2015);
    float _2043 = _2017 * _1979;
    float _2045 = _1458 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2047 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[127].x, _2037);
    float _2049 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[127].y, _2039);
    float _2051 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[127].z, _2041);
    float _2053 = fma(_1971, _1975, -0.5);
    float _2055 = exp2(_2045);
    float _2057 = -_2033;
    float _2059 = fma(_2023, _1915, _2057);
    float _2061 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2035);
    float _2063 = fma(_2021, _2053, _2031);
    float _2065 = fma(_2019, _1917, _2027);
    float _2067 = _2059 + 0.5;
    float _2069 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2061);
    float _2071 = _2063 + 0.5;
    float _2073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2075 = _1945 + 0.5;
    float _2077 = _2065 + 0.5;
    out.m_67.x = _2071;
    out.m_67.y = _2067;
    float _2079 = _1749 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2081 = -_2055;
    float _2083 = _2081 + 1.0;
    float _2085 = _2047 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2087 = _2049 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2089 = _2051 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2091 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2093 = _2069 + _1498;
    float _2095 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2097 = _2085 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2099 = _2079 * _2073;
    float _2101 = _2087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2103 = _2089 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2105 = _2093 * 0.5;
    float _2107 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2077;
    out.m_69.y = _2075;
    out.m_69.z = _2043;
    out.m_69.w = _2099;
    out.m_71.x = _2097;
    out.m_71.y = _2101;
    out.m_71.z = _2103;
    out.m_71.w = _2095;
    out.gl_Position.x = _1524;
    out.gl_Position.y = _1528;
    out.gl_Position.z = _2069;
    out.gl_Position.w = _1498;
    out.m_73.z = _2105;
    out.m_73.w = _1498;
    out.m_45.x = _2107;
    float _2109 = _2091 * _1552;
    float _2111 = -_2091;
    float _2113 = _2111 + 1.0;
    float _2115 = _1567 * _2109;
    float _2117 = _1577 * _2109;
    float _2119 = fma(_1573, _2115, _1561);
    float _2121 = _1567 * _2113;
    float _2123 = fma(_1575, _2115, _1563);
    float _2125 = fma(_1567, _2117, _1565);
    out.m_75.x = _2119;
    out.m_75.y = _2123;
    out.m_75.z = _2125;
    out.m_75.w = _2121;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _700 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
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
        out.m_45.x = 0.0;
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
        float _2182 = as_type<float>(_110);
        out.gl_Position.z = _2182;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    if (_124)
    {
        float _132 = float(_94);
        _130 = _132;
    }
    float _134 = _130;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    if (_140)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _104;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2250 = as_type<float>(_146);
        out.gl_Position.z = _2250;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_49.x;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_49.y;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_51.w;
    float _166 = in.m_47.x;
    float _168 = in.m_47.y;
    float _170 = in.m_47.z;
    float _172 = in.m_42.x;
    float _174 = in.m_42.y;
    float _176 = in.m_42.z;
    float _178 = 0.0;
    float _180 = _150;
    if (!_162)
    {
        float _182 = _150 * _150;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_162)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    out.m_53.x = _148;
    out.m_53.y = _152;
    bool _194 = !_162;
    float _196 = _192;
    float _198 = _148;
    if (!_194)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _150 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _150);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _228;
    }
    float _230 = _196;
    bool _232 = !_162;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _150 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _180 = _252;
    }
    float _254 = _180;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _166, _258);
    float _266 = fma(_254, _168, _260);
    float _268 = fma(_254, _170, _262);
    float _270 = fma(_264, _164, _172);
    float _272 = fma(_266, _164, _174);
    float _274 = fma(_268, _164, _176);
    bool _276 = !_256;
    float _294;
    if (!_276)
    {
        float _278 = in.m_55.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        float _298 = float(_94);
        float _300 = 1.0 / _298;
        float _302 = _128 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _322 = 1.0 / _308;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _332 = 1.0 / _316;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = _304 + _334;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _346 = 1.0 / _312;
    float _348 = _336 * _322;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _352 = _304 + _350;
    float _354 = _338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _356 = _340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _358 = _342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _362 = _304 + _360;
    float _364 = 1.0 / _326;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _368 = _304 + _366;
    float _370 = _352 * _332;
    bool _372 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _374 = isnan(_304);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    out.m_57.x = _354;
    out.m_57.y = _356;
    out.m_57.z = _358;
    out.m_57.w = _344;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    bool _388 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _390 = isnan(_304);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = 1.0 / _320;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _404 = _304 + _402;
    float _406 = _368 * _346;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _410 = _304 + _408;
    float _412 = -_382;
    float _414 = _412 + 1.0;
    float _416 = fma(_386, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _418 = 1.0 / _330;
    float _420 = _404 * _364;
    bool _422 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _424 = isnan(_304);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    bool _434 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _436 = isnan(_304);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -_432;
    float _448 = _446 + 1.0;
    float _450 = _410 * _400;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _452;
    float _456 = _432 * _414;
    float _458 = fma(_454, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _460 = _444 * _448;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _466 = _362 * _418;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _468;
    bool _472 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _474 = isnan(_304);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = fma(_464, _406, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _486 = fma(_470, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _488 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _490 = isnan(_304);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -_444;
    float _502 = _500 + 1.0;
    bool _504 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _506 = isnan(_304);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _524 = _498 * _502;
    float _526 = -_498;
    float _528 = _526 + 1.0;
    float _530 = -_514;
    float _532 = _530 + 1.0;
    float _534 = fma(_518, _406, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _536 = fma(_522, _406, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _538 = _398 * _528;
    float _540 = _482 * _532;
    float _542 = -_398;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _546;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _552 = _458 * _540;
    float _554 = -_482;
    float _556 = _554 + 1.0;
    float _558 = _486 * _540;
    float _560 = _416 * _540;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _570 = _514 * _544;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _576;
    float _580 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[143].x, _552);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _582;
    float _586 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[143].y, _558);
    float _588 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[143].z, _560);
    float _590 = fma(_564, _450, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _592 = fma(_568, _450, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _594 = fma(_574, _450, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _596 = fma(_578, _370, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _598 = fma(_534, _570, _580);
    float _600 = fma(_548, _370, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _602 = fma(_584, _370, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _604 = fma(_484, _570, _586);
    float _606 = fma(_536, _570, _588);
    float _608 = fma(_596, _538, _598);
    float _610 = fma(_600, _538, _604);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _612;
    float _616 = fma(_602, _538, _606);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _622;
    float _626 = fma(_614, _420, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _628 = fma(_590, _524, _608);
    float _630 = fma(_592, _524, _610);
    float _632 = fma(_594, _524, _616);
    float _634 = fma(_620, _420, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _644 = fma(_624, _420, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _650 = fma(_638, _466, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _652 = fma(_642, _466, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _654 = fma(_626, _460, _628);
    float _656 = fma(_648, _466, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _658 = fma(_634, _460, _630);
    float _660 = fma(_644, _460, _632);
    float _662 = fma(_650, _456, _654);
    float _664 = fma(_652, _456, _658);
    float _666 = fma(_656, _456, _660);
    float _668 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[149].x, _662);
    float _670 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[149].y, _664);
    float _672 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[149].z, _666);
    bool _674 = !_550;
    float _676 = _638;
    float _678 = _650;
    int _680 = as_type<int>(_654);
    float _698;
    if (!_674)
    {
        float _682 = in.m_55.x;
        float _684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _686 = _682 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _688 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _690 = _688 * _684;
        float _692 = floor(_690);
        float _694 = -_692;
        float _696 = _690 + _694;
        _698 = _696;
        _700 = true;
    }
    else
    {
        float _702 = float(_94);
        float _704 = 1.0 / _702;
        float _706 = _128 * _704;
        _698 = _706;
    }
    _700 = false;
    float _708 = _698;
    float _710 = in.m_59.x;
    float _712 = in.m_59.y;
    float _714 = in.m_55.y;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _718 = _716 != 0;
    float _720 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.083333335816860198974609375;
    float _722 = _644;
    float _724 = _708;
    if (_718)
    {
        float _726 = in.m_55.x;
        _722 = _726;
    }
    float _728 = _722;
    float _730 = abs(_710);
    float _732 = abs(_712);
    float _734 = precise::max(_730, _732);
    float _736 = _712 * 0.0625;
    bool _738 = _734 >= 16.0;
    float _740 = _710 * 0.0625;
    if (_718)
    {
        _676 = _714;
    }
    float _742 = _676;
    float _744 = _738 ? _736 : _712;
    float _746 = _738 ? _740 : _710;
    float _748 = in.m_51.x;
    float _750 = in.m_51.y;
    float _752 = in.m_51.z;
    float _754 = abs(_744);
    bool _756 = _754 != 0.0;
    bool _758 = isnan(_754);
    bool _760 = _756 || _758;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    float _766 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 2.1333334445953369140625;
    float _768 = abs(_746);
    bool _770 = _768 == 0.0;
    float _772 = abs(_746);
    bool _774 = _772 == 0.0;
    bool _776 = !_764;
    bool _778 = _774 && _776;
    float _780 = _766 * 0.15915493667125701904296875;
    int _782 = as_type<int>(_766);
    float _784 = _728;
    float _786 = _742;
    int _788 = _764 ? (-1) : 0;
    if (_718)
    {
        _678 = _728;
    }
    float _790 = _678;
    bool _792 = false;
    float _794 = _790;
    if (_778)
    {
        bool _796 = as_type<int>(_746) >= 0;
        _792 = _796;
    }
    bool _798 = _792;
    if (_778)
    {
        int _800 = _798 ? 0 : 1078530011;
        _680 = _800;
    }
    int _802 = _680;
    if (!_718)
    {
        float _804 = in.m_55.x;
        float _806 = _714 * 3.1415927410125732421875;
        float _808 = _806 * 0.15915493667125701904296875;
        float _810 = _808 * 6.283185482025146484375;
        float _812 = sin(_810);
        float _814 = _804 * 3.1415927410125732421875;
        float _816 = _814 * 0.15915493667125701904296875;
        float _818 = _816 * 6.283185482025146484375;
        float _820 = sin(_818);
        _782 = as_type<int>(_816);
        _784 = _804;
        _794 = _820;
        _786 = _812;
    }
    int _822 = _782;
    float _824 = _784;
    float _826 = _794;
    float _828 = _786;
    int _830 = _822;
    if (_778)
    {
        int _832 = int(0x80000000) & as_type<int>(_744);
        int _834 = _802 | _832;
        _830 = _834;
    }
    int _836 = _830;
    bool _838 = !_764;
    bool _840 = _838 && _770;
    int _842 = _836;
    float _844 = as_type<float>(_836);
    if (!_840)
    {
        float _846 = abs(_744);
        bool _848 = _846 != as_type<float>(0x7f800000u /* inf */);
        bool _850 = isnan(_846);
        bool _852 = _848 || _850;
        bool _854 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _856 = _852 || _854;
        float _858 = abs(_746);
        bool _860 = _858 == as_type<float>(0x7f800000u /* inf */);
        float _862 = abs(_746);
        bool _864 = _862 == as_type<float>(0x7f800000u /* inf */);
        bool _866 = !_856;
        bool _868 = _864 && _866;
        if (_868)
        {
            bool _870 = as_type<int>(_746) >= 0;
            _788 = _870 ? (-1) : 0;
        }
        int _872 = _788;
        if (_868)
        {
            _842 = 1075235812;
        }
        int _874 = _842;
        int _876 = _874;
        if (_868)
        {
            int _878 = ~_872;
            int _880 = (_878 != 0) ? _874 : 1061752795;
            _876 = _880;
        }
        int _882 = _876;
        float _884 = as_type<float>(_882);
        if (_868)
        {
            int _886 = int(0x80000000) & as_type<int>(_744);
            int _888 = _882 | _886;
            _884 = as_type<float>(_888);
        }
        float _890 = _884;
        bool _892 = !_856;
        bool _894 = _892 && _860;
        _844 = _890;
        if (!_894)
        {
            float _896 = abs(_744);
            float _898 = abs(_746);
            float _900 = precise::max(_896, _898);
            float _902 = abs(_744);
            float _904 = abs(_746);
            float _906 = precise::min(_902, _904);
            float _908 = 1.0 / _900;
            float _910 = abs(_744);
            float _912 = abs(_746);
            bool _914 = _910 > _912;
            bool _916 = as_type<int>(_746) >= 0;
            float _918 = _906 * _908;
            float _920 = abs(_744);
            float _922 = abs(_746);
            float _924 = _920 + _922;
            int _926 = as_type<int>(_744) & int(0x80000000);
            float _928 = _918 * _918;
            bool _930 = _924 > as_type<float>(0x7f800000u /* inf */);
            bool _932 = isnan(_924);
            bool _934 = _930 || _932;
            bool _936 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _938 = _934 || _936;
            float _940 = _928 + 11.33538818359375;
            float _942 = fma(_928, _940, 28.84246826171875);
            float _944 = fma(_928, _942, 19.6966705322265625);
            float _946 = fma(_928, -0.82336294651031494140625, -5.674867153167724609375);
            float _948 = fma(_928, _946, -6.565555095672607421875);
            float _950 = 1.0 / _944;
            float _952 = _928 * _948;
            float _954 = _918 * _952;
            float _956 = fma(_954, _950, _918);
            float _958 = _956;
            _844 = _924;
            if (_914)
            {
                float _960 = -_956;
                float _962 = _960 + 1.57079637050628662109375;
                _958 = _962;
            }
            float _964 = _958;
            int _966 = as_type<int>(_964);
            if (!_916)
            {
                float _968 = -_964;
                float _970 = _968 + 3.1415927410125732421875;
                _966 = as_type<int>(_970);
            }
            int _972 = _966;
            if (!_938)
            {
                int _974 = _926 | _972;
                _844 = as_type<float>(_974);
            }
        }
    }
    float _976 = _844;
    float _978 = in.m_61.x;
    float _980 = in.m_61.y;
    float _982 = in.m_61.z;
    float _984 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 1.33333337306976318359375;
    float _986 = fma(_976, 3.0, _720);
    float _988 = -_720;
    float _990 = fma(_976, 4.0, _988);
    float _992 = _780 * 6.283185482025146484375;
    float _994 = sin(_992);
    float _996 = fma(_976, 2.0, _984);
    float _998 = _986 * 0.15915493667125701904296875;
    float _1000 = _990 * 0.15915493667125701904296875;
    float _1002 = _668 * _748;
    float _1004 = _996 * 0.01745329238474369049072265625;
    float _1006 = _672 * _752;
    float _1008 = in.m_59.z;
    float _1010 = _1000 * 6.283185482025146484375;
    float _1012 = cos(_1010);
    float _1014 = _1004 * 0.15915493667125701904296875;
    float _1016 = _670 * _750;
    float _1018 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1020 = -(*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1022 = 1.0 + _1020;
    float _1024 = precise::clamp(_1022, 0.0, 1.0);
    float _1026 = _998 * 6.283185482025146484375;
    float _1028 = sin(_1026);
    float _1030 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1032 = -_978;
    float _1034 = _978 * _1032;
    float _1036 = _982 * _980;
    float _1038 = -_982;
    float _1040 = _978 * _1038;
    float _1042 = _1014 * 6.283185482025146484375;
    float _1044 = sin(_1042);
    float _1046 = -_1034;
    float _1048 = fma(_980, _980, _1046);
    float _1050 = _1012 * 0.07500000298023223876953125;
    float _1052 = _1040 * _152;
    float _1054 = fma(_994, 0.0250000059604644775390625, 0.97500002384185791015625);
    float _1056 = _1048 * _152;
    float _1058 = fma(_1028, 0.1500000059604644775390625, _1050);
    float _1060 = fma(_1024, 0.5, -0.5);
    float _1062 = fma(_1024, 0.875, 0.125);
    float _1064 = -_1052;
    float _1066 = fma(_1064, _1058, _710);
    float _1068 = fma(_1060, _152, 1.0);
    float _1070 = fma(_1044, 0.25, 0.25);
    float _1072 = _1036 * _152;
    float _1074 = _1054 * _1068;
    float _1076 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1078 = -_1052;
    float _1080 = fma(_1078, _1070, _1066);
    float _1082 = fma(_1072, _1058, _712);
    float _1084 = -_1056;
    float _1086 = fma(_1084, _1058, _1008);
    float _1088 = _1080 * _1074;
    float _1090 = fma(_1072, _1070, _1082);
    float _1092 = -_1056;
    float _1094 = fma(_1092, _1070, _1086);
    float _1096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1088);
    float _1098 = _1090 * _1074;
    float _1100 = _1094 * _1062;
    float _1102 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1104 = _1076 * _1096;
    float _1106 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1098);
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1100);
    float _1110 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1102);
    float _1112 = _1030 * _1106;
    float _1114 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1116 = _1018 * _1108;
    float _1118 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1110);
    float _1120 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1122 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1114);
    float _1124 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1126 = _1118 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1128 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1120);
    float _1130 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1122);
    float _1132 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1124);
    float _1134 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1128);
    float _1136 = _1130 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1138 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1132);
    float _1140 = _1126 + _1134;
    float _1142 = _1136 + _1138;
    float _1144 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1148 = _1140 + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1152 = _1142 + _1150;
    float _1154 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1144);
    float _1156 = _1148 * _1148;
    float _1158 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1160 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1154);
    float _1162 = fma(_1152, _1152, _1156);
    float _1164 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1158);
    float _1166 = _1160 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1168 = sqrt(_1162);
    float _1170 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1164);
    float _1172 = _1166 + _1170;
    bool _1174 = _1168 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1176 = _1156;
    float _1178 = _1166;
    float _1180 = _1170;
    float _1182 = _1112;
    float _1184 = _1070;
    if (!_1174)
    {
        _1176 = _1142;
    }
    float _1186 = _1176;
    float _1188 = _1186;
    if (!_1174)
    {
        _1178 = _1140;
    }
    float _1190 = _1178;
    float _1192 = _1190;
    if (!_1174)
    {
        _1180 = _1172;
    }
    float _1194 = _1180;
    bool _1196 = !_1174;
    float _1198 = _1194;
    if (!_1196)
    {
        float _1200 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1202 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1204 = _1168 + _1202;
        float _1206 = _1172 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = rsqrt(_1162);
        float _1210 = _1204 * _1200;
        float _1212 = _1210 * 0.15915493667125701904296875;
        float _1214 = _1212 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        float _1218 = _1212 * 6.283185482025146484375;
        float _1220 = sin(_1218);
        float _1222 = _1216 + (-1.0);
        float _1224 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1226 = fma(_1220, _1206, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1228 = fma(_1172, _1216, _1224);
        float _1230 = _1208 * _1226;
        float _1232 = fma(_1152, _1230, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1234 = fma(_1148, _1230, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1198 = _1228;
        _1188 = _1232;
        _1192 = _1234;
    }
    float _1236 = _1198;
    float _1238 = _1188;
    float _1240 = _1192;
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1244 = _1236 + _1242;
    float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1248 = _1238 + _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1252 = _1240 + _1250;
    float _1254 = _1244 * _1244;
    float _1256 = fma(_1248, _1248, _1254);
    float _1258 = fma(_1252, _1252, _1256);
    float _1260 = rsqrt(_1258);
    float _1262 = sqrt(_1258);
    float _1264 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1266 = _1248 * _1264;
    float _1268 = _1252 * _1264;
    float _1270 = _1266 * _1266;
    float _1272 = _1268 * _1268;
    float _1274 = _1270 + _1272;
    float _1276 = sqrt(_1274);
    bool _1278 = _1276 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1282 = _1276 + _1280;
    float _1284 = _1256;
    float _1286 = _1274;
    float _1288 = _1282;
    float _1290 = _1244;
    if (_1278)
    {
        float _1292 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1284 = _1292;
    }
    float _1294 = _1284;
    if (_1278)
    {
        float _1296 = rsqrt(_1274);
        _1286 = _1296;
    }
    float _1298 = _1286;
    float _1300 = _1298;
    if (_1278)
    {
        float _1302 = _1282 * _1294;
        _1288 = _1302;
    }
    float _1304 = _1288;
    if (_1278)
    {
        float _1306 = _1304 * 0.15915493667125701904296875;
        _1182 = _1306;
    }
    float _1308 = _1182;
    float _1310 = _1252;
    float _1312 = _1308;
    if (_1278)
    {
        float _1314 = _1308 * 6.283185482025146484375;
        float _1316 = sin(_1314);
        _1310 = _1316;
    }
    float _1318 = _1310;
    float _1320 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1322 = precise::max(0.0, _1320);
    float _1324 = _1294;
    float _1326 = _1322;
    if (_1278)
    {
        float _1328 = _1308 * 6.283185482025146484375;
        float _1330 = cos(_1328);
        _1324 = _1330;
    }
    float _1332 = _1324;
    float _1334 = -_1264;
    float _1336 = -_1322;
    float _1338 = fma(_1244, _1334, _1336);
    if (_1278)
    {
        float _1340 = _1338 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1290 = _1340;
    }
    float _1342 = _1290;
    float _1344 = _1342;
    float _1346 = _1318;
    if (_1278)
    {
        float _1348 = fma(_1318, _1342, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1344 = _1348;
    }
    float _1350 = _1344;
    float _1352 = _1350;
    if (!_1278)
    {
        _1346 = _1266;
    }
    float _1354 = _1346;
    float _1356 = _1354;
    float _1358 = _1332;
    if (_1278)
    {
        float _1360 = _1332 + (-1.0);
        _1326 = _1360;
    }
    float _1362 = _1326;
    float _1364 = _1362;
    if (_1278)
    {
        float _1366 = _1298 * _1350;
        _1184 = _1366;
    }
    float _1368 = _1184;
    if (!_1278)
    {
        _1352 = _1338;
    }
    float _1370 = _1352;
    float _1372 = _1370;
    if (_1278)
    {
        float _1374 = _1362 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1312 = _1374;
    }
    float _1376 = _1312;
    if (_1278)
    {
        float _1378 = _1266 * _1368;
        _1356 = _1378;
    }
    float _1380 = _1356;
    if (!_1278)
    {
        _1364 = _1268;
    }
    float _1382 = _1364;
    float _1384 = _1382;
    if (_1278)
    {
        float _1386 = _1268 * _1368;
        _1384 = _1386;
    }
    float _1388 = _1384;
    if (!_1278)
    {
        _1300 = _1270;
    }
    float _1390 = _1300;
    float _1392 = _1390;
    if (_1278)
    {
        float _1394 = fma(_1338, _1332, _1376);
        _1372 = _1394;
    }
    float _1396 = _1372;
    if (_1278)
    {
        float _1398 = _1380 * _1380;
        _1392 = _1398;
    }
    float _1400 = _1392;
    if (!_1278)
    {
        _1358 = _1272;
    }
    float _1402 = _1358;
    float _1404 = _1402;
    if (_1278)
    {
        float _1406 = _1388 * _1388;
        _1404 = _1406;
    }
    float _1408 = _1404;
    float _1410 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1412 = fma(_1396, _1396, _1400);
    float _1414 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1416 = _1412 + _1408;
    float _1418 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1410);
    float _1420 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1424 = fma(_1262, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1422);
    float _1426 = precise::clamp(_1424, 0.0, 1.0);
    float _1428 = rsqrt(_1416);
    float _1430 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1418);
    float _1432 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1434 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1420);
    float _1436 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1438 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1440 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1432);
    float _1442 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1434);
    float _1444 = -_1426;
    float _1446 = _1444 + 1.0;
    float _1448 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1450 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1436);
    float _1452 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1440);
    float _1454 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1456 = abs(_1446);
    float _1458 = log2(_1456);
    float _1460 = -_1448;
    float _1462 = fma(_1460, _1414, 1.0);
    float _1464 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1450);
    float _1466 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1468 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1470 = _1428 * _1380;
    float _1472 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1474 = _1428 * _1396;
    float _1476 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1468);
    float _1478 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1480 = _1428 * _1388;
    float _1482 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1484 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1476);
    float _1486 = -_1478;
    float _1488 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1486);
    float _1490 = log2(_1462);
    float _1492 = _1458 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1494 = -_1480;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1488);
    float _1498 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1484);
    float _1500 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1482);
    float _1502 = fma(_1496, -0.5, 0.5);
    float _1504 = exp2(_1492);
    float _1506 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1508 = fma(_1496, 0.5, 0.5);
    float _1510 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1506);
    float _1512 = _1474 + 1.0;
    float _1514 = 1.0 / _1498;
    float _1516 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1500);
    float _1518 = fma(_1508, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1520 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1510);
    float _1522 = _1490 * 0.693147182464599609375;
    float _1524 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1516);
    float _1526 = fma(_1508, _1518, -0.212114393711090087890625);
    float _1528 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1520);
    float _1530 = sqrt(_1502);
    float _1532 = -_1474;
    float _1534 = fma(_1504, _1512, _1532);
    float _1536 = fma(_1508, _1526, 1.570728778839111328125);
    float _1538 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1540 = fma(_1534, 0.5, 0.5);
    float _1542 = _1524 * _1514;
    float _1544 = _1528 * _1514;
    float _1546 = fma(_1542, 0.5, 0.5);
    float _1548 = fma(_1544, -0.5, 0.5);
    float _1550 = _1530 * 0.636619746685028076171875;
    float3 _4498 = float3(_1546, _1548, _1538);
    float _1552 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4498, float3(0.0), isnan(_4498)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4498, float3(0.0), isnan(_4498)), level(0.0)).x;
    float _1554 = -_1536;
    float _1556 = fma(_1550, _1554, 1.0);
    float3 _4514 = float3(_1546, _1548, _1538);
    float4 _1559 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4514, float3(0.0), isnan(_4514)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4514, float3(0.0), isnan(_4514)), level(0.0)).xyzw;
    float _1561 = _1559.x;
    float _1563 = _1559.y;
    float _1565 = _1559.z;
    float _1567 = _1559.w;
    float2 _4531 = float2(_1556, _1540);
    float3 _1571 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4531, float2(0.0), isnan(_4531)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4531, float2(0.0), isnan(_4531)), level(0.0)).xyz;
    float _1573 = _1571.x;
    float _1575 = _1571.y;
    float _1577 = _1571.z;
    float _1579 = in.m_55.z;
    float _1581 = in.m_55.w;
    float _1583 = -_152;
    float _1585 = _1583 + 1.0;
    bool _1587 = _714 > 0.5;
    float _1589 = in.m_63.w;
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1591;
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1597 = _1595 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1601 = _708 + _1599;
    float _1603 = 1.0 / _1593;
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1605;
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1611 = _1609 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1613 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1615 = isnan(_708);
    bool _1617 = _1613 || _1615;
    bool _1619 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1621 = _1617 || _1619;
    float _1623 = float(_1621);
    float _1625 = _1454 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1627 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1627;
    bool _1631 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1633 = isnan(_708);
    bool _1635 = _1631 || _1633;
    bool _1637 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1639 = _1635 || _1637;
    float _1641 = float(_1639);
    float _1643 = 1.0 / _1597;
    float _1645 = -_1623;
    float _1647 = _1645 + 1.0;
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1651 = _1649 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    bool _1653 = _1581 > 0.5;
    float _1655 = 1.0 / _1607;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1659 = _1587 ? as_type<int>(_1585) : as_type<int>(_152);
    out.m_65.w = _1589;
    int _1661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1663 = _1661 != 0;
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1667 = _1665 != 0;
    int _1669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1671 = _1669 != 0;
    float _1673 = 1.0 / _1611;
    int _1675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1677 = _1675 != 0;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1681 = _1671 ? as_type<float>(_1659) : _152;
    float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1685 = _708 + _1683;
    int _1687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1689 = _1687 != 0;
    float _1691 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1679);
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1695 = _1693 != 0;
    float _1697 = 0.0;
    bool _1699 = _1689;
    float _1701 = _1651;
    if (_1663)
    {
        float _1703 = in.m_55.x;
        _1697 = _1703;
    }
    float _1705 = _1697;
    bool _1707 = _1579 > 0.5;
    float _1709 = _714 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1711 = _1653 ? as_type<int>(_1585) : as_type<int>(_152);
    float _1713 = _370;
    bool _1715 = _1707;
    if (_1667)
    {
        float _1717 = in.m_55.z;
        _1713 = _1717;
    }
    float _1719 = _1713;
    bool _1721 = _714 > 0.5;
    bool _1723 = _1721 && _1677;
    float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1727 = _708 + _1725;
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1731 = _708 + _1729;
    float _1733 = _1685 * _1655;
    float _1735 = _1601 * _1673;
    float _1737 = _1727 * _1603;
    float _1739 = _1731 * _1643;
    float _1741 = fma(_1709, -2.0, _1657);
    float _1743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1745;
    float _1749 = _1689 ? as_type<float>(_1711) : _152;
    float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1753 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1751;
    int _1755 = _1707 ? as_type<int>(_1585) : as_type<int>(_152);
    float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1757;
    float _1761 = fma(_1747, _1737, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1763 = fma(_1753, _1737, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    if (_1663)
    {
        bool _1765 = _1705 > 0.5;
        _1715 = _1765;
    }
    bool _1767 = _1715;
    float _1769 = fma(_1759, _1737, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1773 = _1771 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    if (_1667)
    {
        bool _1775 = _1719 > 0.5;
        _1699 = _1775;
    }
    bool _1777 = _1699;
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1781 = _1779 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1783 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1785 = _1783 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1787 = _1695 ? as_type<float>(_1755) : _152;
    float _1789 = fma(_1781, _1739, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1791 = fma(_1773, _1739, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1793 = fma(_1785, _1739, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1795 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1795;
    float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1801 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1799;
    float _1803 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1805 = _1803 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1809 = fma(_1797, _1733, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1811 = fma(_1801, _1733, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1813 = fma(_1629, _1733, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1815 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1817 = isnan(_708);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1823 = _1819 || _1821;
    float _1825 = float(_1823);
    float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1829 = _1827 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    bool _1831 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1833 = isnan(_708);
    bool _1835 = _1831 || _1833;
    bool _1837 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1839 = _1835 || _1837;
    float _1841 = float(_1839);
    float _1843 = fma(_1805, _1735, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1847 = fma(_1829, _1735, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1849 = -_1825;
    float _1851 = _1849 + 1.0;
    float _1853 = -_1841;
    float _1855 = _1853 + 1.0;
    int _1857 = 0;
    if (_1663)
    {
        float _1859 = -_148;
        float _1861 = _1859 + 1.0;
        _1857 = as_type<int>(_1861);
    }
    int _1863 = _1857;
    float _1865 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1867 = _1841 * _1851;
    float _1869 = _1623 * _1855;
    bool _1871 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1873 = isnan(_708);
    bool _1875 = _1871 || _1873;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1879 = _1875 || _1877;
    float _1881 = float(_1879);
    float _1883 = _1641 * _1647;
    float _1885 = fma(_1651, _1735, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1887 = -_1641;
    float _1889 = _1887 + 1.0;
    int _1891 = _1863;
    if (!_1663)
    {
        _1701 = _148;
    }
    float _1893 = _1701;
    float _1895 = fma(_1865, _1681, -0.5);
    float _1897 = _1893;
    if (_1663)
    {
        float _1899 = _1767 ? as_type<float>(_1863) : _148;
        _1897 = _1899;
    }
    float _1901 = _1897;
    float _1903 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1741);
    float _1905 = _1807 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1907 = _1845 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1909 = _1881 * _1889;
    float _1911 = -_1881;
    float _1913 = _1911 + 1.0;
    float _1915 = fma(_1905, _1787, -0.5);
    float _1917 = fma(_1907, _1901, -0.5);
    float _1919 = _1761 * _1909;
    float _1921 = _1763 * _1909;
    float _1923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (_1667)
    {
        float _1925 = -_148;
        float _1927 = _1925 + 1.0;
        _1891 = as_type<int>(_1927);
    }
    int _1929 = _1891;
    float _1931 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1691);
    float _1933 = _1769 * _1909;
    float _1935 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1919);
    float _1937 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1921);
    float _1939 = _1931;
    if (!_1667)
    {
        _724 = _148;
    }
    float _1941 = _724;
    float _1943 = -_1903;
    float _1945 = fma(_1931, _1895, _1943);
    float _1947 = _1941;
    if (_1667)
    {
        float _1949 = _1777 ? as_type<float>(_1929) : _148;
        _1947 = _1949;
    }
    float _1951 = _1947;
    float _1953 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1933);
    if (!_1677)
    {
        _1939 = _148;
    }
    float _1955 = _1939;
    float _1957 = _1955;
    if (_1723)
    {
        float _1959 = -_148;
        float _1961 = _1959 + 1.0;
        _198 = _1961;
    }
    float _1963 = _198;
    float _1965 = fma(_1789, _1883, _1935);
    float _1967 = fma(_1791, _1883, _1937);
    float _1969 = fma(_1793, _1883, _1953);
    float _1971 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1973 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1677)
    {
        _1957 = _1963;
    }
    float _1975 = _1957;
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1979 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1981 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1983 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1985 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1973);
    float _1987 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1977);
    float _1989 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1981);
    float _1991 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1995 = _824 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1997 = _826 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1999 = _828 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2001 = fma(_1809, _1869, _1965);
    float _2003 = -_1991;
    float _2005 = fma(_1995, 2.0, _2003);
    float _2007 = -_1983;
    float _2009 = fma(_1997, 2.0, _2007);
    float _2011 = fma(_1999, -2.0, _1993);
    float _2013 = fma(_1811, _1869, _1967);
    float _2015 = fma(_1813, _1869, _1969);
    float _2017 = _1951 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2019 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1985);
    float _2021 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1987);
    float _2023 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1989);
    float _2025 = -_128;
    float _2027 = fma(_2025, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2005);
    float _2029 = -_128;
    float _2031 = fma(_2029, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2009);
    float _2033 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2011);
    float _2035 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1625);
    float _2037 = fma(_1843, _1867, _2001);
    float _2039 = fma(_1847, _1867, _2013);
    float _2041 = fma(_1885, _1867, _2015);
    float _2043 = _2017 * _1979;
    float _2045 = _1458 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2047 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[127].x, _2037);
    float _2049 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[127].y, _2039);
    float _2051 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[127].z, _2041);
    float _2053 = fma(_1971, _1975, -0.5);
    float _2055 = exp2(_2045);
    float _2057 = -_2033;
    float _2059 = fma(_2023, _1915, _2057);
    float _2061 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2035);
    float _2063 = fma(_2021, _2053, _2031);
    float _2065 = fma(_2019, _1917, _2027);
    float _2067 = _2059 + 0.5;
    float _2069 = fma(_1472, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2061);
    float _2071 = _2063 + 0.5;
    float _2073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2075 = _1945 + 0.5;
    float _2077 = _2065 + 0.5;
    out.m_67.x = _2071;
    out.m_67.y = _2067;
    float _2079 = _1749 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2081 = -_2055;
    float _2083 = _2081 + 1.0;
    float _2085 = _2047 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2087 = _2049 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2089 = _2051 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2091 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2093 = _2069 + _1498;
    float _2095 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2097 = _2085 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2099 = _2079 * _2073;
    float _2101 = _2087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2103 = _2089 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2105 = _2093 * 0.5;
    float _2107 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2077;
    out.m_69.y = _2075;
    out.m_69.z = _2043;
    out.m_69.w = _2099;
    out.m_71.x = _2097;
    out.m_71.y = _2101;
    out.m_71.z = _2103;
    out.m_71.w = _2095;
    out.gl_Position.x = _1524;
    out.gl_Position.y = _1528;
    out.gl_Position.z = _2069;
    out.gl_Position.w = _1498;
    out.m_73.z = _2105;
    out.m_73.w = _1498;
    out.m_45.x = _2107;
    float _2109 = _2091 * _1552;
    float _2111 = -_2091;
    float _2113 = _2111 + 1.0;
    float _2115 = _1567 * _2109;
    float _2117 = _1577 * _2109;
    float _2119 = fma(_1573, _2115, _1561);
    float _2121 = _1567 * _2113;
    float _2123 = fma(_1575, _2115, _1563);
    float _2125 = fma(_1567, _2117, _1565);
    out.m_75.x = _2119;
    out.m_75.y = _2123;
    out.m_75.z = _2125;
    out.m_75.w = _2121;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

