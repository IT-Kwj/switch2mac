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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
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
    float4 m_61 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_77 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_44 [[attribute(4)]];
    float4 m_59 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
    float4 m_63 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1014 = false;
    bool _744 = false;
    bool _646 = false;
    bool _364 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = in.m_44.w;
    float _95 = trunc(_91);
    int _98 = int(_95);
    float _100 = -_93;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _102;
    bool _106 = _98 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_98);
    float _112 = _102;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _108;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _116 = 0;
    if (!_106)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3309 = as_type<float>(_120);
        out.gl_Position.z = _3309;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _124 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_93);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = float(_98);
    bool _136 = _102 >= _134;
    bool _138 = !_132;
    bool _140 = _136 || _138;
    if (_140)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _110;
    if (_140)
    {
        out.m_49.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _122 = as_type<int>(_144);
    }
    int _146 = _122;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3364 = as_type<float>(_146);
        out.gl_Position.z = _3364;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_51.x;
    float _150 = in.m_51.y;
    float _152 = in.m_51.z;
    float _154 = 1.0 / _134;
    bool _156 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _158 = _102 * _154;
    float _160 = _150 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _162 = _150 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _164 = _150 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _166 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].x, _160);
    float _168 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].x, _162);
    float _170 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].x, _164);
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _166);
    float _174 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _168);
    float _176 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _170);
    bool _178 = !_156;
    float _180 = _172;
    float _182 = _176;
    float _200;
    if (!_178)
    {
        float _184 = in.m_53.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        _200 = _158;
    }
    _202 = false;
    float _204 = _200;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _204 + _206;
    bool _210 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _212 = isnan(_204);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _224 = _204 + _222;
    bool _226 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _228 = isnan(_204);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _244 = _242 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _246 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _248 = isnan(_204);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -_220;
    float _260 = _258 + 1.0;
    float _262 = 1.0 / _244;
    float _264 = _256 * _260;
    float _266 = -_256;
    float _268 = _266 + 1.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _270;
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _276 = 1.0 / _240;
    float _278 = _236 * _268;
    float _280 = -_236;
    float _282 = _280 + 1.0;
    float _284 = _224 * _262;
    float _286 = _208 * _276;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _292;
    float _296 = fma(_272, _286, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = fma(_290, _286, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _300 = fma(_294, _286, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _302 = _296 * _278;
    float _304 = _298 * _278;
    float _306 = _300 * _278;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _320 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].x, _302);
    float _322 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].y, _304);
    float _324 = fma(_310, _284, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _326 = fma(_314, _284, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _328 = fma(_318, _284, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _330 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].z, _306);
    float _332 = fma(_324, _264, _320);
    float _334 = fma(_326, _264, _322);
    float _336 = fma(_328, _264, _330);
    float _338 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[145].x, _332);
    float _340 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[145].y, _334);
    float _342 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[145].z, _336);
    bool _344 = !_274;
    float _362;
    if (!_344)
    {
        float _346 = in.m_53.x;
        float _348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _350 = _346 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _352 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[11].x, _102);
        float _354 = _352 * _348;
        float _356 = floor(_354);
        float _358 = -_356;
        float _360 = _354 + _358;
        _362 = _360;
        _364 = true;
    }
    else
    {
        _362 = _158;
    }
    _364 = false;
    float _366 = _362;
    float _368 = in.m_55.x;
    float _370 = in.m_55.y;
    float _372 = in.m_55.z;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _376 = _366 + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _394 = 1.0 / _388;
    bool _396 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _398 = isnan(_366);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    bool _408 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _410 = isnan(_366);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = 1.0 / _380;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _424 = _366 + _422;
    float _426 = _340 * _370;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _430 = _366 + _428;
    float _432 = _342 * _372;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _436 = _366 + _434;
    float _438 = 1.0 / _384;
    float _440 = _430 * _394;
    bool _442 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _444 = isnan(_366);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = _338 * _368;
    bool _456 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _458 = 1.0 / _392;
    float _460 = _424 * _420;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _462;
    float _466 = fma(_464, _440, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _468 = _376 * _438;
    bool _470 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _472 = isnan(_366);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _482;
    float _486 = -_480;
    float _488 = _486 + 1.0;
    float _490 = fma(_484, _440, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _492 = _436 * _458;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _494;
    float _498 = -_452;
    float _500 = _498 + 1.0;
    float _502 = fma(_496, _440, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _504 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _506 = isnan(_366);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = _406 * _500;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _522 = -_406;
    float _524 = _522 + 1.0;
    float _526 = _418 * _488;
    float _528 = -_418;
    float _530 = _528 + 1.0;
    float _532 = fma(_520, _492, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _534 = _480 * _524;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _544 = _514 * _530;
    float _546 = fma(_538, _492, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _548 = fma(_542, _492, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _550 = _502 * _544;
    float _552 = _466 * _544;
    float _554 = -_514;
    float _556 = _554 + 1.0;
    float _558 = _490 * _544;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _560;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _564;
    float _568 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[107].x, _550);
    float _570 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[107].y, _552);
    float _572 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[107].z, _558);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _574;
    float _578 = fma(_562, _460, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _580 = fma(_532, _526, _568);
    float _582 = fma(_546, _526, _570);
    float _584 = fma(_548, _526, _572);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _594 = fma(_566, _460, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _596 = fma(_576, _460, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _602 = fma(_578, _534, _580);
    float _604 = fma(_588, _468, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _606 = fma(_592, _468, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _608 = fma(_600, _468, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _610 = fma(_594, _534, _582);
    float _612 = fma(_596, _534, _584);
    float _614 = fma(_604, _516, _602);
    float _616 = fma(_606, _516, _610);
    float _618 = fma(_608, _516, _612);
    float _620 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[111].x, _614);
    float _622 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[111].y, _616);
    float _624 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[111].z, _618);
    bool _626 = !_456;
    float _644;
    if (!_626)
    {
        float _628 = in.m_53.x;
        float _630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _632 = _628 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _634 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _636 = _634 * _630;
        float _638 = floor(_636);
        float _640 = -_638;
        float _642 = _636 + _640;
        _644 = _642;
        _646 = true;
    }
    else
    {
        _644 = _158;
    }
    _646 = false;
    float _648 = _644;
    bool _650 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _652 = isnan(_648);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _666 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _668 = isnan(_648);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _684 = _648 + _682;
    float _686 = -_660;
    float _688 = _686 + 1.0;
    bool _690 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _692 = 1.0 / _664;
    float _694 = _676 * _688;
    float _696 = -_676;
    float _698 = _696 + 1.0;
    float _700 = _680 * _692;
    float _702 = _622 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _704 = fma(_700, _684, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _706 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _708 = _704 * _694;
    float _710 = _624 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _712 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[115].x, _708);
    float _714 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _716 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _720 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[116].x, _712);
    float _722 = _720 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _724 = !_690;
    float _742;
    if (!_724)
    {
        float _726 = in.m_53.x;
        float _728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _730 = _726 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _734 = _732 * _728;
        float _736 = floor(_734);
        float _738 = -_736;
        float _740 = _734 + _738;
        _742 = _740;
        _744 = true;
    }
    else
    {
        _742 = _158;
    }
    _744 = false;
    float _746 = _742;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _750 = _746 + _748;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _754 = _746 + _752;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _758 = _746 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _760;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _776 = 1.0 / _762;
    bool _778 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _780 = isnan(_746);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    bool _790 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _792 = isnan(_746);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = 1.0 / _766;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _806 = _746 + _804;
    bool _808 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _810 = 1.0 / _770;
    float _812 = _750 * _776;
    float _814 = 1.0 / _774;
    float _816 = _754 * _802;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _818;
    float _822 = fma(_820, _812, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _824 = _758 * _810;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _830;
    bool _834 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _836 = isnan(_746);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = fma(_828, _812, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _848 = fma(_832, _812, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _850 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _852 = isnan(_746);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = _806 * _814;
    bool _864 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _866 = isnan(_746);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -_788;
    float _878 = _876 + 1.0;
    float _880 = -_844;
    float _882 = _880 + 1.0;
    float _884 = _874 * _878;
    float _886 = -_874;
    float _888 = _886 + 1.0;
    float _890 = _860 * _882;
    float _892 = -_860;
    float _894 = _892 + 1.0;
    float _896 = _844 * _888;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _900 = _898 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _910 = _800 * _894;
    float _912 = fma(_900, _816, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _914 = fma(_904, _816, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _916 = fma(_908, _816, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _918 = _846 * _910;
    float _920 = _822 * _910;
    float _922 = -_800;
    float _924 = _922 + 1.0;
    float _926 = _848 * _910;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _928;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _932;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _936;
    float _940 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[123].x, _920);
    float _942 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[123].y, _918);
    float _944 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[123].z, _926);
    float _946 = fma(_930, _824, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _948 = fma(_934, _824, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _950 = fma(_938, _824, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _952 = fma(_912, _890, _940);
    float _954 = fma(_914, _890, _942);
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _958 = _956 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _964 = fma(_916, _890, _944);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _970 = fma(_946, _896, _952);
    float _972 = fma(_958, _862, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _974 = fma(_962, _862, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _976 = fma(_948, _896, _954);
    float _978 = fma(_968, _862, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _980 = fma(_950, _896, _964);
    float _982 = fma(_972, _884, _970);
    float _984 = fma(_974, _884, _976);
    float _986 = fma(_978, _884, _980);
    float _988 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[127].x, _982);
    float _990 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[127].y, _984);
    float _992 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[127].z, _986);
    bool _994 = !_808;
    float _1012;
    if (!_994)
    {
        float _996 = in.m_53.x;
        float _998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1000 = _996 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _1004 = _1002 * _998;
        float _1006 = floor(_1004);
        float _1008 = -_1006;
        float _1010 = _1004 + _1008;
        _1012 = _1010;
        _1014 = true;
    }
    else
    {
        _1012 = _158;
    }
    _1014 = false;
    float _1016 = _1012;
    float _1018 = in.m_53.x;
    float _1020 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1022 = log2(_1020);
    float _1024 = in.m_53.y;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1028 = in.m_42.x;
    float _1030 = in.m_42.y;
    float _1032 = in.m_42.z;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1038 = _1036 != 0;
    float _1040 = _454 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1042 = in.m_53.z;
    float _1044 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1046 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1044);
    float _1048 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1050 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1046);
    float _1052 = _1018 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1054 = _1022 * _102;
    float _1056 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1048);
    float _1058 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1060 = -_1026;
    float _1062 = fma(_1052, 2.0, _1060);
    float _1064 = _1018 * 2.0;
    float _1066 = _1024 * 2.0;
    float _1068 = fma(_1058, -2.0, _1034);
    float _1070 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1072 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1074 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1076 = _1042 * 2.0;
    float _1078 = floor(_1064);
    float _1080 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1070);
    float _1082 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1072);
    float _1084 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1074);
    float _1086 = _1018 + _1024;
    float _1088 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1080);
    float _1090 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1082);
    float _1092 = floor(_1076);
    float _1094 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1084);
    float _1096 = _1018 + _1042;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1102 = _1096 + (-1.0);
    float _1104 = floor(_1066);
    bool _1106 = _1078 > 0.0;
    float _1108 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1110 = _1078 >= 0.0;
    bool _1112 = isnan(_1078);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan(0.0);
    bool _1118 = _1114 || _1116;
    float _1120 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1068);
    float _1122 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1124 = _1118 ? 0 : 1;
    float _1126 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1128 = int(_1126);
    float _1130 = _1086 + (-1.0);
    float _1132 = _1024 + _1042;
    bool _1134 = _1092 > 0.0;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1138 = _1092 >= 0.0;
    bool _1140 = isnan(_1092);
    bool _1142 = _1138 || _1140;
    bool _1144 = isnan(0.0);
    bool _1146 = _1142 || _1144;
    float _1148 = _1132 + (-1.0);
    float _1150 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1152 = exp2(_1054);
    bool _1154 = _1104 > 0.0;
    float _1156 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1158 = _1148;
    if (_1038)
    {
        _1158 = _1018;
    }
    float _1160 = _1158;
    float _1162 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1136);
    float _1164 = _1160;
    if (!_1038)
    {
        _1164 = _1042;
    }
    float _1166 = _1164;
    bool _1168 = _1104 >= 0.0;
    bool _1170 = isnan(_1104);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan(0.0);
    bool _1176 = _1172 || _1174;
    float _1178 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1180 = _1166;
    if (_1038)
    {
        _1180 = _1024;
    }
    float _1182 = _1180;
    float _1184 = _1182;
    if (!_1038)
    {
        _1184 = _1018;
    }
    float _1186 = _1184;
    float _1188 = -_1098;
    float _1190 = fma(_1178, 2.0, _1188);
    int _1192 = _1146 ? 0 : 1;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1196 = _1176 ? 0 : 1;
    float _1198 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1200 = ~_1192;
    int _1202 = _1200 + 1;
    int _1204 = _1202 + 1;
    float _1206 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1194);
    int _1208 = _1204;
    if (!_1134)
    {
        int _1210 = ~_1192;
        int _1212 = _1210 + 1;
        _1208 = _1212;
    }
    int _1214 = _1208;
    float _1216 = fma(_1198, -2.0, _1100);
    float _1218 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1206);
    bool _1220 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1222 = isnan(0.0);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1228 = _1224 || _1226;
    float _1230 = -_1152;
    float _1232 = _1230 + 1.0;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1236 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1162);
    int _1238 = ~_1124;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    float _1244 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1234);
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1248 = _1246 != 0;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1252 = _1250 != 0;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1256 = _1254 != 0;
    float _1258 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1056);
    int _1260 = _1242;
    if (!_1106)
    {
        int _1262 = ~_1124;
        int _1264 = _1262 + 1;
        _1260 = _1264;
    }
    int _1266 = _1260;
    float _1268 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1270 = int(_1268);
    bool _1272 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1274 = isnan(1.0);
    bool _1276 = _1272 || _1274;
    bool _1278 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1280 = _1276 || _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1284 = 1.0 + _1282;
    float _1286 = float(_1128);
    float _1288 = -_102;
    float _1290 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1062);
    bool _1292 = !_1252;
    int _1294 = _1292 ? 0 : 1;
    float _1296 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1244);
    bool _1298 = !_1248;
    int _1300 = _1298 ? 0 : 1;
    float _1302 = rsqrt(_1258);
    bool _1304 = !_1256;
    int _1306 = _1304 ? 0 : 1;
    float _1308 = -_102;
    float _1310 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1190);
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1322 = _1320 != 0;
    int _1324 = ~_1196;
    int _1326 = _1324 + 1;
    int _1328 = _1326 + 1;
    int _1330 = _1328;
    if (!_1154)
    {
        int _1332 = ~_1196;
        int _1334 = _1332 + 1;
        _1330 = _1334;
    }
    int _1336 = _1330;
    float _1338 = 1.0 / _1286;
    float _1340 = in.m_57.x;
    float _1342 = in.m_57.y;
    float _1344 = in.m_57.z;
    bool _1346 = !_1318;
    int _1348 = _1346 ? 0 : 1;
    bool _1350 = !_1314;
    int _1352 = _1350 ? 0 : 1;
    float _1354 = 1.0 / _1284;
    int _1356 = abs(_1348);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1360 = abs(_1352);
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1362;
    float _1366 = float(_1266);
    float _1368 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1358);
    float _1370 = float(_1356);
    float _1372 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1216);
    float _1374 = float(_1360);
    float _1376 = _1338 * _102;
    float _1378 = float(_1214);
    float _1380 = _1370 * _1366;
    bool _1382 = !_1322;
    int _1384 = _1382 ? 0 : 1;
    float _1386 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1368);
    float _1388 = float(_1270);
    float _1390 = _1374 * _1378;
    float _1392 = _1228 ? _1232 : 0.0;
    float _1394 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    int _1396 = abs(_1384);
    float _1398 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1400 = _1388 * _102;
    if (_1280)
    {
        float _1402 = _1392 * _1354;
        _112 = _1402;
    }
    float _1404 = _112;
    float _1406 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1408 = _1390 * (-2.0);
    float _1410 = _1398 * _1398;
    float _1412 = _1018 + (-0.5);
    float _1414 = float(_1336);
    float _1416 = fma(_1408, _1340, _1340);
    float _1418 = fma(_1394, _1394, _1410);
    float _1420 = float(_1396);
    float _1422 = fma(_1150, _1408, _1150);
    float _1424 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1416);
    float _1426 = fma(_1406, _1406, _1418);
    float _1428 = _1380 * (-2.0);
    float _1430 = _1420 * _1414;
    float _1432 = fma(_1422, _1404, _1424);
    float _1434 = 1.0 / _1364;
    float _1436 = fma(_1156, _1428, _1156);
    float _1438 = fma(_1428, _1342, _1342);
    float _1440 = _1090 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1442 = in.m_59.x;
    float _1444 = in.m_59.y;
    float _1446 = in.m_59.z;
    float _1448 = _1088 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1450 = _1432 * 0.15915493667125701904296875;
    float _1452 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1454 = _1024 + (-0.5);
    float _1456 = _1430 * (-2.0);
    float _1458 = rsqrt(_1426);
    float _1460 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1452);
    float _1462 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1438);
    float _1464 = fma(_1108, _1456, _1108);
    float _1466 = fma(_1456, _1344, _1344);
    float _1468 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1460);
    float _1470 = fma(_1436, _1404, _1462);
    float _1472 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1474 = _1042 + (-0.5);
    float _1476 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1478 = _1470 * 0.15915493667125701904296875;
    float _1480 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1466);
    float _1482 = -_1476;
    float _1484 = _1472 + _1482;
    bool _1486 = _1476 >= _1472;
    bool _1488 = isnan(_1476);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan(_1472);
    bool _1494 = _1490 || _1492;
    float _1496 = _1450 * 6.283185482025146484375;
    float _1498 = sin(_1496);
    float _1500 = fma(_1464, _1404, _1480);
    float _1502 = _1394 * _1458;
    float _1504 = abs(_1484);
    float _1506 = precise::max(_1504, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1442);
    float _1510 = _1500 * 0.15915493667125701904296875;
    float _1512 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1446);
    float _1514 = precise::min(_1506, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1516 = _426 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1518 = _1450 * 6.283185482025146484375;
    float _1520 = cos(_1518);
    float _1522 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1524 = !_1494;
    float _1526 = _1524 ? 1.0 : (-1.0);
    float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1530 = _1514 + _1528;
    float _1532 = _1040 * _1508;
    float _1534 = _1522 * _1512;
    float _1536 = _1398 * _1458;
    float _1538 = _1530 * _1434;
    float _1540 = _1478 * 6.283185482025146484375;
    float _1542 = sin(_1540);
    float _1544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1444);
    float _1546 = _1406 * _1458;
    float _1548 = _1526 * _1538;
    float _1550 = _158 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1552 = _1516 * _1544;
    float _1554 = _1478 * 6.283185482025146484375;
    float _1556 = cos(_1554);
    float _1558 = _1550 * _1548;
    float _1560 = _1558 * 0.15915493667125701904296875;
    float _1562 = _1510 * 6.283185482025146484375;
    float _1564 = cos(_1562);
    float _1566 = _1498 * _1542;
    float _1568 = _1520 * _1542;
    float _1570 = _1510 * 6.283185482025146484375;
    float _1572 = sin(_1570);
    float _1574 = _1498 * _1556;
    float _1576 = _1564 * _1552;
    float _1578 = _1520 * _1556;
    float _1580 = _1542 * _1564;
    float _1582 = _1556 * _1564;
    float _1584 = _1560 * 6.283185482025146484375;
    float _1586 = cos(_1584);
    float _1588 = _1520 * _1576;
    float _1590 = _1498 * _1576;
    float _1592 = fma(_1572, _1578, _1566);
    float _1594 = -_1568;
    float _1596 = fma(_1572, _1574, _1594);
    float _1598 = -_1552;
    float _1600 = _1572 * _1598;
    float _1602 = -_1574;
    float _1604 = fma(_1572, _1568, _1602);
    float _1606 = fma(_1592, _1532, _1588);
    float _1608 = _1560 * 6.283185482025146484375;
    float _1610 = sin(_1608);
    float _1612 = fma(_1582, _1532, _1600);
    float _1614 = fma(_1572, _1566, _1578);
    float _1616 = fma(_1604, _1534, _1606);
    float _1618 = fma(_1596, _1532, _1590);
    float _1620 = fma(_1580, _1534, _1612);
    float _1622 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1624 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1626 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1628 = fma(_1614, _1534, _1618);
    float _1630 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1622);
    float _1632 = -_1586;
    float _1634 = _1632 + 1.0;
    float _1636 = _1546 * _1546;
    float _1638 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1624);
    float _1640 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1626);
    float _1642 = _1502 * _1610;
    float _1644 = _1536 * _1634;
    float _1646 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1630);
    float _1648 = _1536 * _1610;
    float _1650 = fma(_1634, _1636, _1586);
    float _1652 = _1546 * _1610;
    float _1654 = _1502 * _1634;
    float _1656 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1638);
    float _1658 = fma(_1546, _1644, _1642);
    float _1660 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1662 = -_1652;
    float _1664 = fma(_1536, _1654, _1662);
    float _1666 = -_1648;
    float _1668 = fma(_1546, _1654, _1666);
    float _1670 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1672 = _1660 * _1658;
    float _1674 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1640);
    float _1676 = fma(_1502, _1654, _1586);
    float _1678 = _1660 * _1664;
    float _1680 = fma(_1670, _1668, _1672);
    float _1682 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1684 = fma(_1546, _1654, _1648);
    float _1686 = fma(_1670, _1676, _1678);
    float _1688 = fma(_1536, _1644, _1586);
    float _1690 = fma(_1682, _1650, _1680);
    float _1692 = fma(_1536, _1654, _1652);
    float _1694 = fma(_1682, _1684, _1686);
    float _1696 = _1660 * _1688;
    float _1698 = _1122 + _1690;
    float _1700 = -_1642;
    float _1702 = fma(_1546, _1644, _1700);
    float _1704 = _1448 + _1694;
    float _1706 = fma(_1670, _1692, _1696);
    float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1710 = _1698 + _1708;
    float _1712 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1716 = _1704 + _1714;
    float _1718 = fma(_1682, _1702, _1706);
    float _1720 = _1710 * _1710;
    float _1722 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1712);
    float _1724 = _1440 + _1718;
    float _1726 = fma(_1716, _1716, _1720);
    float _1728 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1722);
    float _1730 = sqrt(_1726);
    bool _1732 = _1730 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1734 = _1702;
    float _1736 = _1654;
    float _1738 = _1722;
    float _1740 = _1726;
    float _1742 = _1698;
    if (!_1732)
    {
        _1734 = _1704;
    }
    float _1744 = _1734;
    float _1746 = _1744;
    if (!_1732)
    {
        _1736 = _1698;
    }
    float _1748 = _1736;
    float _1750 = _1748;
    if (!_1732)
    {
        _1738 = _1724;
    }
    float _1752 = _1738;
    bool _1754 = !_1732;
    float _1756 = _1752;
    if (!_1754)
    {
        float _1758 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1762 = _1730 + _1760;
        float _1764 = rsqrt(_1726);
        float _1766 = _1762 * _1758;
        float _1768 = _1724 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1770 = _1766 * 0.15915493667125701904296875;
        float _1772 = _1770 * 6.283185482025146484375;
        float _1774 = cos(_1772);
        float _1776 = _1770 * 6.283185482025146484375;
        float _1778 = sin(_1776);
        float _1780 = _1774 + (-1.0);
        float _1782 = fma(_1778, _1768, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1784 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1786 = _1764 * _1782;
        float _1788 = fma(_1724, _1774, _1784);
        float _1790 = fma(_1716, _1786, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1792 = fma(_1710, _1786, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1756 = _1788;
        _1746 = _1790;
        _1750 = _1792;
        _1740 = _1764;
    }
    float _1794 = _1756;
    float _1796 = _1746;
    float _1798 = _1750;
    float _1800 = _1740;
    float _1802 = -_1440;
    float _1804 = _1802 + _1794;
    float _1806 = -_1448;
    float _1808 = _1806 + _1796;
    float _1810 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1812 = -_1122;
    float _1814 = _1812 + _1798;
    float _1816 = _1804 * _1804;
    float _1818 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1820 = 1.0 / _1810;
    float _1822 = fma(_1808, _1808, _1816);
    float _1824 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1818);
    float _1826 = fma(_1814, _1814, _1822);
    float _1828 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1824);
    float _1830 = sqrt(_1826);
    float _1832 = _1828 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1834 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1836 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan(0.5);
    bool _1842 = _1838 || _1840;
    float _1844 = _1832 + _1810;
    float _1846 = _1844 * _1820;
    float _1848 = _1846 * 0.5;
    bool _1850 = _1830 > 0.0;
    float _1852 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1854 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1852);
    bool _1856 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1860 = _1856 || _1858;
    bool _1862 = isnan(0.5);
    bool _1864 = _1860 || _1862;
    float _1866 = 1.0 / _1854;
    float _1868 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1870 = _1794;
    float _1872 = _1796;
    float _1874 = _1814;
    float _1876 = _1800;
    float _1878 = _1808;
    float _1880 = _1826;
    float _1882 = _1798;
    if (!_1850)
    {
        _1868 = _1798;
    }
    float _1884 = _1868;
    bool _1886 = !_1850;
    float _1888 = _1884;
    if (!_1886)
    {
        float _1890 = _174 * _174;
        float _1892 = rsqrt(_1826);
        float _1894 = fma(_172, _172, _1890);
        float _1896 = fma(_176, _176, _1894);
        float _1898 = sqrt(_1896);
        float _1900 = _1808 * _1892;
        float _1902 = _1804 * _1892;
        float _1904 = _1814 * _1892;
        bool _1906 = _1898 > 0.0;
        float _1908 = _1898;
        _1876 = _1900;
        _1880 = _1892;
        if (!_1906)
        {
            _1908 = _1798;
        }
        float _1910 = _1908;
        bool _1912 = !_1906;
        _1888 = _1910;
        if (!_1912)
        {
            float _1914 = rsqrt(_1896);
            float _1916 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1918 = _174 * _1914;
            float _1920 = _172 * _1914;
            float _1922 = _1902 * _1918;
            float _1924 = _176 * _1914;
            float _1926 = fma(_1900, _1920, _1922);
            float _1928 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1930 = fma(_1904, _1924, _1926);
            float _1932 = _1930 * _1928;
            float _1934 = fma(_172, _1932, _1796);
            float _1936 = fma(_174, _1932, _1794);
            float _1938 = fma(_176, _1932, _1798);
            _1870 = _1936;
            _1888 = _1938;
            _1872 = _1934;
            _1874 = _1926;
            _1878 = _1916;
            _1880 = _1928;
        }
    }
    float _1940 = _1870;
    float _1942 = _1888;
    float _1944 = _1872;
    float _1946 = _1874;
    float _1948 = _1876;
    float _1950 = _1878;
    float _1952 = _1880;
    float _1954 = _1950;
    float _1956 = _1944;
    float _1958 = _1942;
    float _1960 = _1952;
    float _1962 = _1946;
    float _1964 = _1948;
    if (_1864)
    {
        _1954 = 1.0;
    }
    float _1966 = _1954;
    float _1968 = _1966;
    if (_1842)
    {
        _1882 = _1940;
    }
    float _1970 = _1882;
    float _1972 = _1970;
    if (_1842)
    {
        _180 = _1942;
    }
    float _1974 = _180;
    float _1976 = _1974;
    if (!_1842)
    {
        float _1978 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1980 = _1440 + _1978;
        float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1984 = _1448 + _1982;
        float _1986 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1988 = -_1448;
        float _1990 = _1988 + _1944;
        float _1992 = _1980 * _1980;
        float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1996 = _1122 + _1994;
        float _1998 = -_1122;
        float _2000 = _1998 + _1942;
        float _2002 = fma(_1984, _1984, _1992);
        float _2004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2006 = fma(_1996, _1996, _2002);
        float _2008 = sqrt(_2006);
        float _2010 = _1986 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2012 = precise::min(_2008, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2014 = _2012 * _2004;
        float _2016 = _2010 * _2014;
        float _2018 = -_1440;
        float _2020 = _2018 + _1940;
        float _2022 = fma(_1990, _2016, _1448);
        float _2024 = fma(_2020, _2016, _1440);
        float _2026 = fma(_2000, _2016, _1122);
        _182 = _1986;
        _1972 = _2024;
        _1956 = _2022;
        _1976 = _2026;
        _1958 = _2000;
    }
    float _2028 = _182;
    float _2030 = _1972;
    float _2032 = _1956;
    float _2034 = _1976;
    float _2036 = _1958;
    float _2038 = _2028;
    if (_1864)
    {
        _1960 = 1.0;
    }
    float _2040 = _1960;
    float _2042 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2044 = _1866 * _2042;
    float _2046 = _2040;
    if (!_1864)
    {
        float _2048 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2050 = _2048 * 0.15915493667125701904296875;
        float _2052 = _2050 * 6.283185482025146484375;
        float _2054 = cos(_2052);
        float _2056 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2058 = _2056 * 0.15915493667125701904296875;
        float _2060 = _2050 * 6.283185482025146484375;
        float _2062 = sin(_2060);
        float _2064 = 1.0 / _2054;
        float _2066 = _2058 * 6.283185482025146484375;
        float _2068 = cos(_2066);
        float _2070 = _2062 * _2064;
        float _2072 = _2058 * 6.283185482025146484375;
        float _2074 = sin(_2072);
        float _2076 = _2068 * _2070;
        float _2078 = 1.0 / _2076;
        float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2082 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2080;
        float _2084 = 1.0 / _2082;
        float _2086 = _2074 * _2078;
        float _2088 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2090 = fma(_2044, _2086, _2088);
        float _2092 = _2090 * _2084;
        float _2094 = precise::clamp(_2092, 0.0, 1.0);
        _2038 = _2084;
        _1968 = _2094;
    }
    float _2096 = _2038;
    float _2098 = _1968;
    float _2100 = _2096;
    if (!_1864)
    {
        float _2102 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2104 = _2102 * 0.15915493667125701904296875;
        float _2106 = _2104 * 6.283185482025146484375;
        float _2108 = cos(_2106);
        float _2110 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2112 = _2110 * 0.15915493667125701904296875;
        float _2114 = _2104 * 6.283185482025146484375;
        float _2116 = sin(_2114);
        float _2118 = 1.0 / _2108;
        float _2120 = _2112 * 6.283185482025146484375;
        float _2122 = cos(_2120);
        float _2124 = _2116 * _2118;
        float _2126 = _2112 * 6.283185482025146484375;
        float _2128 = sin(_2126);
        float _2130 = _2122 * _2124;
        float _2132 = 1.0 / _2130;
        float _2134 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2136 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2134;
        float _2138 = 1.0 / _2136;
        float _2140 = _2128 * _2132;
        float _2142 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2144 = fma(_2044, _2140, _2142);
        float _2146 = _2144 * _2138;
        float _2148 = precise::clamp(_2146, 0.0, 1.0);
        float _2150 = -_2148;
        float _2152 = _2150 + 1.0;
        _2100 = _2118;
        _1962 = _2132;
        _2046 = _2152;
    }
    float _2154 = _2100;
    float _2156 = _1962;
    float _2158 = _2046;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2162 = _2030 + _2160;
    float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2166 = _2032 + _2164;
    float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2170 = _2034 + _2168;
    float _2172 = _2162 * _2162;
    float _2174 = fma(_2166, _2166, _2172);
    float _2176 = fma(_2170, _2170, _2174);
    float _2178 = rsqrt(_2176);
    float _2180 = sqrt(_2176);
    float _2182 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2184 = _2166 * _2182;
    float _2186 = _2170 * _2182;
    float _2188 = _2184 * _2184;
    float _2190 = _2186 * _2186;
    float _2192 = _2188 + _2190;
    float _2194 = sqrt(_2192);
    bool _2196 = _2194 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2200 = _2194 + _2198;
    float _2202 = _2154;
    float _2204 = _2192;
    float _2206 = _2200;
    float _2208 = _2162;
    float _2210 = _2186;
    float _2212 = _2188;
    float _2214 = _2190;
    if (_2196)
    {
        float _2216 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2202 = _2216;
    }
    float _2218 = _2202;
    if (_2196)
    {
        float _2220 = rsqrt(_2192);
        _2204 = _2220;
    }
    float _2222 = _2204;
    if (_2196)
    {
        float _2224 = _2200 * _2218;
        _2206 = _2224;
    }
    float _2226 = _2206;
    if (_2196)
    {
        float _2228 = _2226 * 0.15915493667125701904296875;
        _1964 = _2228;
    }
    float _2230 = _1964;
    float _2232 = _2156;
    if (_2196)
    {
        float _2234 = _2230 * 6.283185482025146484375;
        float _2236 = sin(_2234);
        _2232 = _2236;
    }
    float _2238 = _2232;
    float _2240 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2242 = precise::max(0.0, _2240);
    float _2244 = _2036;
    float _2246 = _2240;
    float _2248 = _2242;
    if (_2196)
    {
        float _2250 = _2230 * 6.283185482025146484375;
        float _2252 = cos(_2250);
        _2244 = _2252;
    }
    float _2254 = _2244;
    float _2256 = -_2182;
    float _2258 = -_2242;
    float _2260 = fma(_2162, _2256, _2258);
    if (!_2196)
    {
        _2208 = _2184;
    }
    float _2262 = _2208;
    float _2264 = _2262;
    if (_2196)
    {
        float _2266 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2246 = _2266;
    }
    float _2268 = _2246;
    float _2270 = _2238;
    float _2272 = _2268;
    if (_2196)
    {
        float _2274 = fma(_2238, _2268, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2270 = _2274;
    }
    float _2276 = _2270;
    if (!_2196)
    {
        _2272 = _2260;
    }
    float _2278 = _2272;
    float _2280 = _2278;
    if (_2196)
    {
        float _2282 = _2254 + (-1.0);
        _2248 = _2282;
    }
    float _2284 = _2248;
    float _2286 = _2284;
    if (_2196)
    {
        float _2288 = _2222 * _2276;
        _1742 = _2288;
    }
    float _2290 = _1742;
    float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2294 = fma(_2180, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2292);
    float _2296 = precise::clamp(_2294, 0.0, 1.0);
    if (_2196)
    {
        float _2298 = _2284 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2286 = _2298;
    }
    float _2300 = _2286;
    if (_2196)
    {
        float _2302 = _2184 * _2290;
        _2264 = _2302;
    }
    float _2304 = _2264;
    if (_2196)
    {
        float _2306 = _2186 * _2290;
        _2210 = _2306;
    }
    float _2308 = _2210;
    float _2310 = -_2296;
    float _2312 = _2310 + 1.0;
    if (_2196)
    {
        float _2314 = fma(_2260, _2254, _2300);
        _2280 = _2314;
    }
    float _2316 = _2280;
    if (_2196)
    {
        float _2318 = _2304 * _2304;
        _2212 = _2318;
    }
    float _2320 = _2212;
    if (_2196)
    {
        float _2322 = _2308 * _2308;
        _2214 = _2322;
    }
    float _2324 = _2214;
    float _2326 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2328 = abs(_2312);
    float _2330 = log2(_2328);
    float _2332 = fma(_2316, _2316, _2320);
    float _2334 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2336 = _2332 + _2324;
    float _2338 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2340 = rsqrt(_2336);
    float _2342 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2338);
    float _2344 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2346 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2342);
    float _2348 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2326);
    float _2350 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2352 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2344);
    float _2354 = _2346 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2356 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2348);
    float _2358 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2350);
    float _2360 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2352);
    float _2362 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2364 = _2356 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2366 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2358);
    float _2368 = _2340 * _2304;
    float _2370 = _2360 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2372 = _2364 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2374 = _2340 * _2316;
    float _2376 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2378 = _2340 * _2308;
    float _2380 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2372);
    float _2382 = _2366 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2384 = -_2376;
    float _2386 = fma(_2374, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2384);
    float _2388 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2390 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2380);
    float _2392 = exp2(_2362);
    float _2394 = -_2378;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2386);
    float _2398 = -_2388;
    float _2400 = fma(_2398, _2334, 1.0);
    float _2402 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2390);
    float _2404 = _2364 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2406 = fma(_2396, -0.5, 0.5);
    float _2408 = _2364 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2410 = fma(_2396, 0.5, 0.5);
    float _2412 = 1.0 / _2402;
    float _2414 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2404);
    float _2416 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2408);
    float _2418 = fma(_2410, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2420 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2414);
    float _2422 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2416);
    float _2424 = fma(_2410, _2418, -0.212114393711090087890625);
    float _2426 = log2(_2400);
    float _2428 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2422);
    float _2430 = fma(_2410, _2424, 1.570728778839111328125);
    float _2432 = sqrt(_2406);
    float _2434 = _2374 + 1.0;
    float _2436 = -_2374;
    float _2438 = fma(_2392, _2434, _2436);
    float _2440 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2420);
    float _2442 = _2428 * _2412;
    float _2444 = _2426 * 0.693147182464599609375;
    float _2446 = _2440 * _2412;
    float _2448 = fma(_2442, -0.5, 0.5);
    float _2450 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2452 = fma(_2446, 0.5, 0.5);
    float _2454 = fma(_2438, 0.5, 0.5);
    float _2456 = _2432 * 0.636619746685028076171875;
    float _2458 = -_2430;
    float _2460 = fma(_2456, _2458, 1.0);
    float3 _7053 = float3(_2452, _2448, _2450);
    float _2462 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7053, float3(0.0), isnan(_7053)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7053, float3(0.0), isnan(_7053)), level(0.0)).x;
    float3 _7064 = float3(_2452, _2448, _2450);
    float4 _2465 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7064, float3(0.0), isnan(_7064)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7064, float3(0.0), isnan(_7064)), level(0.0)).xyzw;
    float _2467 = _2465.x;
    float _2469 = _2465.y;
    float _2471 = _2465.z;
    float _2473 = _2465.w;
    float2 _7081 = float2(_2460, _2454);
    float3 _2477 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7081, float2(0.0), isnan(_7081)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7081, float2(0.0), isnan(_7081)), level(0.0)).xyz;
    float _2479 = _2477.x;
    float _2481 = _2477.y;
    float _2483 = _2477.z;
    float _2485 = float(uint(_1270));
    float _2487 = trunc(_1376);
    int _2489 = int(_2487);
    int _2491 = ~_1270;
    int _2493 = _2491 + 1;
    out.m_61.x = _714;
    out.m_61.y = _716;
    out.m_61.z = _718;
    out.m_61.w = _722;
    int _2495 = abs(_1294);
    float _2497 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2499 = abs(_1300);
    float _2501 = _2364 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2503 = _1042 > 0.5;
    float _2505 = 1.0 / _2485;
    float _2507 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2501);
    bool _2509 = !_1038;
    float _2511 = _2509 ? 7.345489978790283203125 : 1.0;
    float _2513 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2507);
    float _2515 = float(uint(_2489));
    float _2517 = exp2(_2497);
    float _2519 = _2511 * _1018;
    int _2521 = ~_1270;
    int _2523 = _2521 + 1;
    float _2525 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2513);
    int _2527 = as_type<int>(_2505) + (-2);
    out.gl_Position.x = _2440;
    out.gl_Position.y = _2428;
    out.gl_Position.z = _2525;
    out.gl_Position.w = _2402;
    float _2529 = as_type<float>(_2527) * _2515;
    float _2531 = trunc(_2529);
    float _2533 = precise::max(_2531, 0.0);
    uint _2536 = uint(_2533);
    float _2538 = -_2517;
    float _2540 = _2538 + 1.0;
    float _2542 = floor(_2519);
    int _2544 = _2493 * int(_2536);
    int _2546 = _2544 + _2489;
    float _2548 = float(uint(_2546));
    float _2550 = -_2542;
    float _2552 = _2519 + _2550;
    float _2554 = as_type<float>(_2527) * _2548;
    float _2556 = trunc(_2554);
    float _2558 = precise::max(_2556, 0.0);
    uint _2560 = uint(_2558);
    float _2562 = _1400 * _154;
    int _2564 = _1270 + (-1);
    float _2566 = trunc(_2562);
    int _2568 = int(_2566);
    int _2570 = int(_2536) + int(_2560);
    float _2572 = float(_2489);
    int _2574 = _2523 * _2570;
    int _2576 = _2574 + _2489;
    bool _2578 = _2572 >= _1388;
    bool _2580 = isnan(_2572);
    bool _2582 = _2578 || _2580;
    bool _2584 = isnan(_1388);
    bool _2586 = _2582 || _2584;
    float _2588 = float(_2586);
    bool _2590 = uint(_2576) >= uint(_1270);
    float _2592 = trunc(_2588);
    int _2594 = int(_2592);
    bool _2596 = !_2590;
    int _2598 = _2596 ? 0 : (-1);
    bool _2600 = _1270 == 0;
    int _2602 = ~_2570;
    int _2604 = _2602 + _2598;
    int _2606 = _2604 + 1;
    float _2608 = _2552 * _1388;
    int _2610 = _1270 * _2606;
    int _2612 = _2610 + _2489;
    int _2614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2616 = _2614 != 0;
    float _2618 = trunc(_2608);
    int _2620 = int(_2618);
    int _2622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2624 = _2622 != 0;
    int _2626 = ~_2594;
    int _2628 = _2626 + 1;
    int _2630 = _2628 + 1;
    bool _2632 = !_2600;
    int _2634 = _2632 ? _2612 : (-1);
    bool _2636 = !_2616;
    int _2638 = _2636 ? 0 : 1;
    int _2640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2642 = _2640 != 0;
    int _2644 = _2634 * _2630;
    int _2646 = abs(_2638);
    int _2648 = abs(_1306);
    int _2650 = _2594 * _2564;
    int _2652 = _2650 + _2644;
    bool _2654 = !_2642;
    int _2656 = _2654 ? 0 : 1;
    int _2658 = _2652 * _2495;
    int _2660 = _2620 * _2646;
    int _2662 = _2660 + _2489;
    int _2664 = abs(_2656);
    int _2666 = _2568 * _2499;
    int _2668 = _2666 + _2658;
    int _2670 = _2662 * _2648;
    int _2672 = _2670 + _2668;
    int _2674 = ~_1270;
    int _2676 = _2674 + 1;
    float _2678 = in.m_63.y;
    int _2680 = _2620 * _2664;
    int _2682 = _2680 + _2672;
    int _2684 = ~_1270;
    int _2686 = _2684 + 1;
    bool _2688 = _1024 > 0.5;
    float _2690 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2692 = _2690 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2694 = float(uint(_2682));
    float _2696 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2698 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2696;
    int _2700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2702 = _2700 != 0;
    int _2704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2706 = _2704 != 0;
    float _2708 = as_type<float>(_2527) * _2694;
    float _2710 = trunc(_2708);
    float _2712 = precise::max(_2710, 0.0);
    uint _2714 = uint(_2712);
    float _2716 = -_2678;
    float _2718 = _2716 + 1.0;
    int _2720 = _2686 * int(_2714);
    int _2722 = _2720 + _2682;
    float _2724 = float(uint(_2722));
    float _2726 = as_type<float>(_2527) * _2724;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2728 = trunc(_2726);
    float _2730 = precise::max(_2728, 0.0);
    uint _2732 = uint(_2730);
    float _2734 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2736 = _2734 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2738 = 1.0 / _2736;
    float _2740 = in.m_63.x;
    float _2742 = _2503 ? _2718 : _2678;
    float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2746 = _1016 + _2744;
    int _2748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2750 = _2748 != 0;
    int _2752 = int(_2714) + int(_2732);
    float _2754 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2756 = _2754 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2758 = _2676 * _2752;
    int _2760 = _2758 + _2682;
    float _2762 = 1.0 / _2756;
    float _2764 = _2698 * _2738;
    bool _2766 = uint(_2760) >= uint(_1270);
    bool _2768 = !_2766;
    int _2770 = _2768 ? 0 : (-1);
    float _2772 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2776 = _2774 != 0;
    float _2778 = float(uint(_2662));
    int _2780 = ~_2752;
    int _2782 = _2780 + _2770;
    int _2784 = _2782 + 1;
    int _2786 = _2776 ? as_type<int>(_2742) : as_type<int>(_2678);
    float _2788 = _2692 * _2762;
    float _2790 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2792 = _1016 + _2790;
    bool _2794 = _2776;
    float _2796 = _2678;
    float _2798 = _2746;
    float _2800 = _2742;
    int _2802 = _2786;
    int _2804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    if (_2624)
    {
        bool _2806 = _1018 > 0.5;
        _2794 = _2806;
    }
    bool _2808 = _2794;
    float _2810 = as_type<float>(_2527) * _2778;
    bool _2812 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2814 = isnan(_1016);
    bool _2816 = _2812 || _2814;
    bool _2818 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2820 = _2816 || _2818;
    float _2822 = float(_2820);
    float _2824 = fma(_2764, _2792, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2826 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2828 = isnan(_1016);
    bool _2830 = _2826 || _2828;
    bool _2832 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2834 = _2830 || _2832;
    float _2836 = float(_2834);
    int _2838 = _1270 * _2784;
    int _2840 = _2838 + _2682;
    bool _2842 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2844 = isnan(_1016);
    bool _2846 = _2842 || _2844;
    bool _2848 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2850 = _2846 || _2848;
    float _2852 = float(_2850);
    float _2854 = fma(_2788, _2746, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2856 = trunc(_2810);
    float _2858 = precise::max(_2856, 0.0);
    uint _2860 = uint(_2858);
    float _2862 = -_2836;
    float _2864 = _2862 + 1.0;
    if (_2750)
    {
        float _2866 = _2688 ? _2718 : _2678;
        _2796 = _2866;
    }
    float _2868 = _2796;
    float _2870 = _2772 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2872 = _2868;
    if (!_2624)
    {
        _2798 = _2740;
    }
    float _2874 = _2798;
    float _2876 = _2822 * _2864;
    float _2878 = -_2822;
    float _2880 = _2878 + 1.0;
    bool _2882 = !_2600;
    int _2884 = _2882 ? _2840 : (-1);
    float _2886 = fma(as_type<float>(_2786), _2870, -0.5);
    float _2888 = _2874;
    if (!_2624)
    {
        _2800 = _2874;
    }
    float _2890 = _2800;
    float _2892 = _2852 * _2880;
    int _2894 = _2884 >> 31;
    float _2896 = -_2852;
    float _2898 = _2896 + 1.0;
    float _2900 = _2890;
    if (_2624)
    {
        _2888 = _2740;
    }
    float _2902 = _2888;
    float _2904 = _2824 * _2892;
    int _2906 = _2894 & 3;
    float _2908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2910 = ~_1270;
    int _2912 = _2910 + 1;
    if (_2624)
    {
        float _2914 = -_2902;
        float _2916 = _2914 + 1.0;
        _2802 = as_type<int>(_2916);
    }
    int _2918 = _2802;
    int _2920 = _2884 + _2906;
    if (_2702)
    {
        float _2922 = -_2902;
        float _2924 = _2922 + 1.0;
        _2804 = as_type<int>(_2924);
    }
    int _2926 = _2804;
    int _2928 = _2912 * int(_2860);
    int _2930 = _2928 + _2662;
    if (_2624)
    {
        float _2932 = _2808 ? as_type<float>(_2918) : _2902;
        _2900 = _2932;
    }
    float _2934 = _2900;
    float _2936 = fma(_2898, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2904);
    int _2938 = _2920 >> 2;
    float _2940 = -_1372;
    float _2942 = fma(_1218, _2886, _2940);
    float _2944 = float(uint(_2930));
    float _2946 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2868, -0.5);
    int _2948 = _2938 << 4;
    int _2950 = _2948 + 368;
    float _2952 = fma(_2854, _2876, _2936);
    if (!_2702)
    {
        _2872 = _2902;
    }
    float _2954 = _2872;
    float _2956 = as_type<float>(_2527) * _2944;
    float _2958 = _2954;
    if (_2702)
    {
        float _2960 = _2688 ? as_type<float>(_2926) : _2902;
        _2958 = _2960;
    }
    float _2962 = _2958;
    int _2964 = _2950 + 8;
    uint _2966 = uint(int(uint(_2964) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c9)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c9)._m0[int(_2976)][_2978];
    float _2982 = -_1120;
    float _2984 = fma(_1296, _2946, _2982);
    int _2986 = _2884 & 3;
    bool _2988 = _2986 != 0;
    float _2990 = trunc(_2956);
    float _2992 = precise::max(_2990, 0.0);
    uint _2994 = uint(_2992);
    float _2996 = _2908 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2998 = fma(_2934, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3000 = fma(_2836, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2952);
    uint _3002 = uint(int(uint(_2950) >> uint(2)));
    uint _3004 = uint(int(uint(int(_3002)) >> uint(2)));
    int _3006 = int(_3002) & 3;
    float _3008 = (*spvDescriptorSet0.vp_c9)._m0[int(_3004)][_3006];
    int _3010 = int(_3002) + 1;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    int _3014 = _3010 & 3;
    float _3016 = (*spvDescriptorSet0.vp_c9)._m0[int(_3012)][_3014];
    float _3018 = _988 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3020 = fma(_1386, _2998, _1290);
    int _3022 = _2884 & 3;
    bool _3024 = _3022 != 0;
    float _3026 = fma(_2996, _2962, -0.5);
    int _3028 = _2988 ? 0 : 1;
    float _3030 = _992 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3032 = uint(_3022) > 1u;
    float _3034 = fma(_1236, _3026, _1310);
    bool _3036 = _3022 != 3;
    float _3038 = _3018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3040 = uint(_3022) >= 2u;
    float _3042 = _3030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3044 = int(_2860) + int(_2994);
    float _3046 = _990 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3048 = ~_3028;
    int _3050 = _3048 + 1;
    int _3052 = _3050 + 1;
    float _3054 = _3000 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3056 = _3040 ? 0 : 1;
    float _3058 = _3046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3060 = !_3024;
    int _3062 = _3060 ? 0 : 1;
    float _3064 = _2984 + 0.5;
    int _3066 = _3052;
    if (!_3032)
    {
        int _3068 = ~_3028;
        int _3070 = _3068 + 1;
        _3066 = _3070;
    }
    int _3072 = _3066;
    float _3074 = _3020 + 0.5;
    bool _3076 = _3022 != 3;
    out.m_67.x = _3038;
    out.m_67.y = _3058;
    out.m_67.z = _3042;
    out.m_67.w = _3054;
    int _3078 = abs(_3072);
    float _3080 = _2942 + 0.5;
    int _3082 = ~_3056;
    int _3084 = _3082 + 1;
    int _3086 = _3084 + 1;
    float _3088 = _3034 + 0.5;
    int _3090 = abs(_3062);
    out.m_69.x = _3074;
    out.m_69.y = _3064;
    int _3092 = _3086;
    if (_3036)
    {
        int _3094 = ~_3056;
        int _3096 = _3094 + 1;
        _3092 = _3096;
    }
    int _3098 = _3092;
    out.m_71.x = _3088;
    out.m_71.y = _3080;
    int _3100 = ~_1270;
    int _3102 = _3100 + 1;
    int _3104 = abs(_3098);
    bool _3106 = !_3076;
    int _3108 = _3106 ? 0 : (-1);
    int _3110 = _3102 * _3044;
    int _3112 = _3110 + _2662;
    int _3114 = ~_3078;
    int _3116 = _3114 + 1;
    int _3118 = _3116 + 1;
    int _3120 = abs(_3108);
    bool _3122 = !_2706;
    int _3124 = _3122 ? 0 : 1;
    int _3126 = _3118 * as_type<int>(_3016);
    int _3128 = ~_3090;
    int _3130 = _3128 + 1;
    int _3132 = _3130 + 1;
    int _3134 = abs(_3124);
    int _3136 = _3132 * as_type<int>(_3008);
    int _3138 = _3136 + _3126;
    int _3140 = ~_3104;
    int _3142 = _3140 + 1;
    int _3144 = _3142 + 1;
    bool _3146 = uint(_3112) >= uint(_1270);
    int _3148 = ~_3120;
    int _3150 = _3148 + 1;
    int _3152 = _3150 + 1;
    int _3154 = _3144 * as_type<int>(_2972);
    int _3156 = _3154 + _3138;
    bool _3158 = !_3146;
    int _3160 = _3158 ? 0 : (-1);
    int _3162 = _3152 * as_type<int>(_2980);
    int _3164 = _3162 + _3156;
    int _3166 = ~_3044;
    int _3168 = _3166 + _3160;
    int _3170 = _3168 + 1;
    float _3172 = _2098 * _2158;
    int _3174 = ~_3134;
    int _3176 = _3174 + 1;
    int _3178 = _3176 + 1;
    float _3180 = _3172 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _3182 = _1270 * _3170;
    int _3184 = _3182 + _2662;
    int _3186 = _3164 * _3178;
    float _3188 = _3180 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3190 = _2525 + _2402;
    bool _3192 = !_2600;
    int _3194 = _3192 ? _3184 : (-1);
    bool _3196 = _2098 > 0.0;
    bool _3198 = isnan(_2098);
    bool _3200 = _3196 || _3198;
    bool _3202 = isnan(0.0);
    bool _3204 = _3200 || _3202;
    float _3206 = _3190 * 0.5;
    float _3208 = _2540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _3210 = _3194 * _3134;
    int _3212 = _3210 + _3186;
    bool _3214 = _2158 <= 0.0;
    bool _3216 = !_3204;
    bool _3218 = _3214 || _3216;
    out.m_49.x = _3188;
    float _3220 = _3208 * _2462;
    float _3222 = -_3208;
    float _3224 = _3222 + 1.0;
    float _3226 = float(_3212);
    float _3228 = _2473 * _3220;
    float _3230 = _2483 * _3220;
    out.m_73.x = _3226;
    float _3232 = fma(_2479, _3228, _2467);
    float _3234 = fma(_2481, _3228, _2469);
    float _3236 = _2473 * _3224;
    float _3238 = fma(_2473, _3230, _2471);
    out.m_75.z = _3206;
    out.m_75.w = _2402;
    out.m_77.x = _3232;
    out.m_77.y = _3234;
    out.m_77.z = _3238;
    out.m_77.w = _3236;
    if (!_3218)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3240 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3240;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1014 = false;
    bool _744 = false;
    bool _646 = false;
    bool _364 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = in.m_44.w;
    float _95 = trunc(_91);
    int _98 = int(_95);
    float _100 = -_93;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _102;
    bool _106 = _98 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_98);
    float _112 = _102;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _108;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _116 = 0;
    if (!_106)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3309 = as_type<float>(_120);
        out.gl_Position.z = _3309;
    }
    if (!_106)
    {
        return out;
    }
    bool _124 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_93);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = float(_98);
    bool _136 = _102 >= _134;
    bool _138 = !_132;
    bool _140 = _136 || _138;
    if (_140)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _110;
    if (_140)
    {
        out.m_49.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _122 = as_type<int>(_144);
    }
    int _146 = _122;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3364 = as_type<float>(_146);
        out.gl_Position.z = _3364;
    }
    if (_140)
    {
        return out;
    }
    float _148 = in.m_51.x;
    float _150 = in.m_51.y;
    float _152 = in.m_51.z;
    float _154 = 1.0 / _134;
    bool _156 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _158 = _102 * _154;
    float _160 = _150 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _162 = _150 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _164 = _150 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _166 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].x, _160);
    float _168 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].x, _162);
    float _170 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].x, _164);
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _166);
    float _174 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _168);
    float _176 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _170);
    bool _178 = !_156;
    float _180 = _172;
    float _182 = _176;
    float _200;
    if (!_178)
    {
        float _184 = in.m_53.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        _200 = _158;
    }
    _202 = false;
    float _204 = _200;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _204 + _206;
    bool _210 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _212 = isnan(_204);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _224 = _204 + _222;
    bool _226 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _228 = isnan(_204);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _244 = _242 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _246 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _248 = isnan(_204);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -_220;
    float _260 = _258 + 1.0;
    float _262 = 1.0 / _244;
    float _264 = _256 * _260;
    float _266 = -_256;
    float _268 = _266 + 1.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _270;
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _276 = 1.0 / _240;
    float _278 = _236 * _268;
    float _280 = -_236;
    float _282 = _280 + 1.0;
    float _284 = _224 * _262;
    float _286 = _208 * _276;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _292;
    float _296 = fma(_272, _286, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = fma(_290, _286, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _300 = fma(_294, _286, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _302 = _296 * _278;
    float _304 = _298 * _278;
    float _306 = _300 * _278;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _320 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].x, _302);
    float _322 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].y, _304);
    float _324 = fma(_310, _284, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _326 = fma(_314, _284, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _328 = fma(_318, _284, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _330 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].z, _306);
    float _332 = fma(_324, _264, _320);
    float _334 = fma(_326, _264, _322);
    float _336 = fma(_328, _264, _330);
    float _338 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[145].x, _332);
    float _340 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[145].y, _334);
    float _342 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[145].z, _336);
    bool _344 = !_274;
    float _362;
    if (!_344)
    {
        float _346 = in.m_53.x;
        float _348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _350 = _346 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _352 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[11].x, _102);
        float _354 = _352 * _348;
        float _356 = floor(_354);
        float _358 = -_356;
        float _360 = _354 + _358;
        _362 = _360;
        _364 = true;
    }
    else
    {
        _362 = _158;
    }
    _364 = false;
    float _366 = _362;
    float _368 = in.m_55.x;
    float _370 = in.m_55.y;
    float _372 = in.m_55.z;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _376 = _366 + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _394 = 1.0 / _388;
    bool _396 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _398 = isnan(_366);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    bool _408 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _410 = isnan(_366);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = 1.0 / _380;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _424 = _366 + _422;
    float _426 = _340 * _370;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _430 = _366 + _428;
    float _432 = _342 * _372;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _436 = _366 + _434;
    float _438 = 1.0 / _384;
    float _440 = _430 * _394;
    bool _442 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _444 = isnan(_366);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = _338 * _368;
    bool _456 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _458 = 1.0 / _392;
    float _460 = _424 * _420;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _462;
    float _466 = fma(_464, _440, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _468 = _376 * _438;
    bool _470 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _472 = isnan(_366);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _482;
    float _486 = -_480;
    float _488 = _486 + 1.0;
    float _490 = fma(_484, _440, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _492 = _436 * _458;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _494;
    float _498 = -_452;
    float _500 = _498 + 1.0;
    float _502 = fma(_496, _440, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _504 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _506 = isnan(_366);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = _406 * _500;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _522 = -_406;
    float _524 = _522 + 1.0;
    float _526 = _418 * _488;
    float _528 = -_418;
    float _530 = _528 + 1.0;
    float _532 = fma(_520, _492, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _534 = _480 * _524;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _544 = _514 * _530;
    float _546 = fma(_538, _492, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _548 = fma(_542, _492, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _550 = _502 * _544;
    float _552 = _466 * _544;
    float _554 = -_514;
    float _556 = _554 + 1.0;
    float _558 = _490 * _544;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _560;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _564;
    float _568 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[107].x, _550);
    float _570 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[107].y, _552);
    float _572 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[107].z, _558);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _574;
    float _578 = fma(_562, _460, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _580 = fma(_532, _526, _568);
    float _582 = fma(_546, _526, _570);
    float _584 = fma(_548, _526, _572);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _594 = fma(_566, _460, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _596 = fma(_576, _460, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _602 = fma(_578, _534, _580);
    float _604 = fma(_588, _468, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _606 = fma(_592, _468, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _608 = fma(_600, _468, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _610 = fma(_594, _534, _582);
    float _612 = fma(_596, _534, _584);
    float _614 = fma(_604, _516, _602);
    float _616 = fma(_606, _516, _610);
    float _618 = fma(_608, _516, _612);
    float _620 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[111].x, _614);
    float _622 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[111].y, _616);
    float _624 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[111].z, _618);
    bool _626 = !_456;
    float _644;
    if (!_626)
    {
        float _628 = in.m_53.x;
        float _630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _632 = _628 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _634 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _636 = _634 * _630;
        float _638 = floor(_636);
        float _640 = -_638;
        float _642 = _636 + _640;
        _644 = _642;
        _646 = true;
    }
    else
    {
        _644 = _158;
    }
    _646 = false;
    float _648 = _644;
    bool _650 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _652 = isnan(_648);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _666 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _668 = isnan(_648);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _684 = _648 + _682;
    float _686 = -_660;
    float _688 = _686 + 1.0;
    bool _690 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _692 = 1.0 / _664;
    float _694 = _676 * _688;
    float _696 = -_676;
    float _698 = _696 + 1.0;
    float _700 = _680 * _692;
    float _702 = _622 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _704 = fma(_700, _684, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _706 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _708 = _704 * _694;
    float _710 = _624 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _712 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[115].x, _708);
    float _714 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _716 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _720 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[116].x, _712);
    float _722 = _720 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _724 = !_690;
    float _742;
    if (!_724)
    {
        float _726 = in.m_53.x;
        float _728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _730 = _726 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _734 = _732 * _728;
        float _736 = floor(_734);
        float _738 = -_736;
        float _740 = _734 + _738;
        _742 = _740;
        _744 = true;
    }
    else
    {
        _742 = _158;
    }
    _744 = false;
    float _746 = _742;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _750 = _746 + _748;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _754 = _746 + _752;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _758 = _746 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _760;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _776 = 1.0 / _762;
    bool _778 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _780 = isnan(_746);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    bool _790 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _792 = isnan(_746);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = 1.0 / _766;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _806 = _746 + _804;
    bool _808 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _810 = 1.0 / _770;
    float _812 = _750 * _776;
    float _814 = 1.0 / _774;
    float _816 = _754 * _802;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _818;
    float _822 = fma(_820, _812, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _824 = _758 * _810;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _830;
    bool _834 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _836 = isnan(_746);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = fma(_828, _812, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _848 = fma(_832, _812, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _850 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _852 = isnan(_746);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = _806 * _814;
    bool _864 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _866 = isnan(_746);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -_788;
    float _878 = _876 + 1.0;
    float _880 = -_844;
    float _882 = _880 + 1.0;
    float _884 = _874 * _878;
    float _886 = -_874;
    float _888 = _886 + 1.0;
    float _890 = _860 * _882;
    float _892 = -_860;
    float _894 = _892 + 1.0;
    float _896 = _844 * _888;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _900 = _898 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _910 = _800 * _894;
    float _912 = fma(_900, _816, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _914 = fma(_904, _816, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _916 = fma(_908, _816, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _918 = _846 * _910;
    float _920 = _822 * _910;
    float _922 = -_800;
    float _924 = _922 + 1.0;
    float _926 = _848 * _910;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _928;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _932;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _936;
    float _940 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[123].x, _920);
    float _942 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[123].y, _918);
    float _944 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[123].z, _926);
    float _946 = fma(_930, _824, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _948 = fma(_934, _824, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _950 = fma(_938, _824, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _952 = fma(_912, _890, _940);
    float _954 = fma(_914, _890, _942);
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _958 = _956 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _964 = fma(_916, _890, _944);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _970 = fma(_946, _896, _952);
    float _972 = fma(_958, _862, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _974 = fma(_962, _862, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _976 = fma(_948, _896, _954);
    float _978 = fma(_968, _862, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _980 = fma(_950, _896, _964);
    float _982 = fma(_972, _884, _970);
    float _984 = fma(_974, _884, _976);
    float _986 = fma(_978, _884, _980);
    float _988 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[127].x, _982);
    float _990 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[127].y, _984);
    float _992 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[127].z, _986);
    bool _994 = !_808;
    float _1012;
    if (!_994)
    {
        float _996 = in.m_53.x;
        float _998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1000 = _996 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _1004 = _1002 * _998;
        float _1006 = floor(_1004);
        float _1008 = -_1006;
        float _1010 = _1004 + _1008;
        _1012 = _1010;
        _1014 = true;
    }
    else
    {
        _1012 = _158;
    }
    _1014 = false;
    float _1016 = _1012;
    float _1018 = in.m_53.x;
    float _1020 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1022 = log2(_1020);
    float _1024 = in.m_53.y;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1028 = in.m_42.x;
    float _1030 = in.m_42.y;
    float _1032 = in.m_42.z;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1038 = _1036 != 0;
    float _1040 = _454 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1042 = in.m_53.z;
    float _1044 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1046 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1044);
    float _1048 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1050 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1046);
    float _1052 = _1018 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1054 = _1022 * _102;
    float _1056 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1048);
    float _1058 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1060 = -_1026;
    float _1062 = fma(_1052, 2.0, _1060);
    float _1064 = _1018 * 2.0;
    float _1066 = _1024 * 2.0;
    float _1068 = fma(_1058, -2.0, _1034);
    float _1070 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1072 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1074 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1076 = _1042 * 2.0;
    float _1078 = floor(_1064);
    float _1080 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1070);
    float _1082 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1072);
    float _1084 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1074);
    float _1086 = _1018 + _1024;
    float _1088 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1080);
    float _1090 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1082);
    float _1092 = floor(_1076);
    float _1094 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1084);
    float _1096 = _1018 + _1042;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1102 = _1096 + (-1.0);
    float _1104 = floor(_1066);
    bool _1106 = _1078 > 0.0;
    float _1108 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1110 = _1078 >= 0.0;
    bool _1112 = isnan(_1078);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan(0.0);
    bool _1118 = _1114 || _1116;
    float _1120 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1068);
    float _1122 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1124 = _1118 ? 0 : 1;
    float _1126 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1128 = int(_1126);
    float _1130 = _1086 + (-1.0);
    float _1132 = _1024 + _1042;
    bool _1134 = _1092 > 0.0;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1138 = _1092 >= 0.0;
    bool _1140 = isnan(_1092);
    bool _1142 = _1138 || _1140;
    bool _1144 = isnan(0.0);
    bool _1146 = _1142 || _1144;
    float _1148 = _1132 + (-1.0);
    float _1150 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1152 = exp2(_1054);
    bool _1154 = _1104 > 0.0;
    float _1156 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1158 = _1148;
    if (_1038)
    {
        _1158 = _1018;
    }
    float _1160 = _1158;
    float _1162 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1136);
    float _1164 = _1160;
    if (!_1038)
    {
        _1164 = _1042;
    }
    float _1166 = _1164;
    bool _1168 = _1104 >= 0.0;
    bool _1170 = isnan(_1104);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan(0.0);
    bool _1176 = _1172 || _1174;
    float _1178 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1180 = _1166;
    if (_1038)
    {
        _1180 = _1024;
    }
    float _1182 = _1180;
    float _1184 = _1182;
    if (!_1038)
    {
        _1184 = _1018;
    }
    float _1186 = _1184;
    float _1188 = -_1098;
    float _1190 = fma(_1178, 2.0, _1188);
    int _1192 = _1146 ? 0 : 1;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1196 = _1176 ? 0 : 1;
    float _1198 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1200 = ~_1192;
    int _1202 = _1200 + 1;
    int _1204 = _1202 + 1;
    float _1206 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1194);
    int _1208 = _1204;
    if (!_1134)
    {
        int _1210 = ~_1192;
        int _1212 = _1210 + 1;
        _1208 = _1212;
    }
    int _1214 = _1208;
    float _1216 = fma(_1198, -2.0, _1100);
    float _1218 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1206);
    bool _1220 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1222 = isnan(0.0);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1228 = _1224 || _1226;
    float _1230 = -_1152;
    float _1232 = _1230 + 1.0;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1236 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1162);
    int _1238 = ~_1124;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    float _1244 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1234);
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1248 = _1246 != 0;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1252 = _1250 != 0;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1256 = _1254 != 0;
    float _1258 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1056);
    int _1260 = _1242;
    if (!_1106)
    {
        int _1262 = ~_1124;
        int _1264 = _1262 + 1;
        _1260 = _1264;
    }
    int _1266 = _1260;
    float _1268 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1270 = int(_1268);
    bool _1272 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1274 = isnan(1.0);
    bool _1276 = _1272 || _1274;
    bool _1278 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1280 = _1276 || _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1284 = 1.0 + _1282;
    float _1286 = float(_1128);
    float _1288 = -_102;
    float _1290 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1062);
    bool _1292 = !_1252;
    int _1294 = _1292 ? 0 : 1;
    float _1296 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1244);
    bool _1298 = !_1248;
    int _1300 = _1298 ? 0 : 1;
    float _1302 = rsqrt(_1258);
    bool _1304 = !_1256;
    int _1306 = _1304 ? 0 : 1;
    float _1308 = -_102;
    float _1310 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1190);
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1322 = _1320 != 0;
    int _1324 = ~_1196;
    int _1326 = _1324 + 1;
    int _1328 = _1326 + 1;
    int _1330 = _1328;
    if (!_1154)
    {
        int _1332 = ~_1196;
        int _1334 = _1332 + 1;
        _1330 = _1334;
    }
    int _1336 = _1330;
    float _1338 = 1.0 / _1286;
    float _1340 = in.m_57.x;
    float _1342 = in.m_57.y;
    float _1344 = in.m_57.z;
    bool _1346 = !_1318;
    int _1348 = _1346 ? 0 : 1;
    bool _1350 = !_1314;
    int _1352 = _1350 ? 0 : 1;
    float _1354 = 1.0 / _1284;
    int _1356 = abs(_1348);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1360 = abs(_1352);
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1362;
    float _1366 = float(_1266);
    float _1368 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1358);
    float _1370 = float(_1356);
    float _1372 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1216);
    float _1374 = float(_1360);
    float _1376 = _1338 * _102;
    float _1378 = float(_1214);
    float _1380 = _1370 * _1366;
    bool _1382 = !_1322;
    int _1384 = _1382 ? 0 : 1;
    float _1386 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1368);
    float _1388 = float(_1270);
    float _1390 = _1374 * _1378;
    float _1392 = _1228 ? _1232 : 0.0;
    float _1394 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    int _1396 = abs(_1384);
    float _1398 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1400 = _1388 * _102;
    if (_1280)
    {
        float _1402 = _1392 * _1354;
        _112 = _1402;
    }
    float _1404 = _112;
    float _1406 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1408 = _1390 * (-2.0);
    float _1410 = _1398 * _1398;
    float _1412 = _1018 + (-0.5);
    float _1414 = float(_1336);
    float _1416 = fma(_1408, _1340, _1340);
    float _1418 = fma(_1394, _1394, _1410);
    float _1420 = float(_1396);
    float _1422 = fma(_1150, _1408, _1150);
    float _1424 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1416);
    float _1426 = fma(_1406, _1406, _1418);
    float _1428 = _1380 * (-2.0);
    float _1430 = _1420 * _1414;
    float _1432 = fma(_1422, _1404, _1424);
    float _1434 = 1.0 / _1364;
    float _1436 = fma(_1156, _1428, _1156);
    float _1438 = fma(_1428, _1342, _1342);
    float _1440 = _1090 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1442 = in.m_59.x;
    float _1444 = in.m_59.y;
    float _1446 = in.m_59.z;
    float _1448 = _1088 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1450 = _1432 * 0.15915493667125701904296875;
    float _1452 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1454 = _1024 + (-0.5);
    float _1456 = _1430 * (-2.0);
    float _1458 = rsqrt(_1426);
    float _1460 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1452);
    float _1462 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1438);
    float _1464 = fma(_1108, _1456, _1108);
    float _1466 = fma(_1456, _1344, _1344);
    float _1468 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1460);
    float _1470 = fma(_1436, _1404, _1462);
    float _1472 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1474 = _1042 + (-0.5);
    float _1476 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1478 = _1470 * 0.15915493667125701904296875;
    float _1480 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1466);
    float _1482 = -_1476;
    float _1484 = _1472 + _1482;
    bool _1486 = _1476 >= _1472;
    bool _1488 = isnan(_1476);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan(_1472);
    bool _1494 = _1490 || _1492;
    float _1496 = _1450 * 6.283185482025146484375;
    float _1498 = sin(_1496);
    float _1500 = fma(_1464, _1404, _1480);
    float _1502 = _1394 * _1458;
    float _1504 = abs(_1484);
    float _1506 = precise::max(_1504, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1442);
    float _1510 = _1500 * 0.15915493667125701904296875;
    float _1512 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1446);
    float _1514 = precise::min(_1506, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1516 = _426 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1518 = _1450 * 6.283185482025146484375;
    float _1520 = cos(_1518);
    float _1522 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1524 = !_1494;
    float _1526 = _1524 ? 1.0 : (-1.0);
    float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1530 = _1514 + _1528;
    float _1532 = _1040 * _1508;
    float _1534 = _1522 * _1512;
    float _1536 = _1398 * _1458;
    float _1538 = _1530 * _1434;
    float _1540 = _1478 * 6.283185482025146484375;
    float _1542 = sin(_1540);
    float _1544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1444);
    float _1546 = _1406 * _1458;
    float _1548 = _1526 * _1538;
    float _1550 = _158 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1552 = _1516 * _1544;
    float _1554 = _1478 * 6.283185482025146484375;
    float _1556 = cos(_1554);
    float _1558 = _1550 * _1548;
    float _1560 = _1558 * 0.15915493667125701904296875;
    float _1562 = _1510 * 6.283185482025146484375;
    float _1564 = cos(_1562);
    float _1566 = _1498 * _1542;
    float _1568 = _1520 * _1542;
    float _1570 = _1510 * 6.283185482025146484375;
    float _1572 = sin(_1570);
    float _1574 = _1498 * _1556;
    float _1576 = _1564 * _1552;
    float _1578 = _1520 * _1556;
    float _1580 = _1542 * _1564;
    float _1582 = _1556 * _1564;
    float _1584 = _1560 * 6.283185482025146484375;
    float _1586 = cos(_1584);
    float _1588 = _1520 * _1576;
    float _1590 = _1498 * _1576;
    float _1592 = fma(_1572, _1578, _1566);
    float _1594 = -_1568;
    float _1596 = fma(_1572, _1574, _1594);
    float _1598 = -_1552;
    float _1600 = _1572 * _1598;
    float _1602 = -_1574;
    float _1604 = fma(_1572, _1568, _1602);
    float _1606 = fma(_1592, _1532, _1588);
    float _1608 = _1560 * 6.283185482025146484375;
    float _1610 = sin(_1608);
    float _1612 = fma(_1582, _1532, _1600);
    float _1614 = fma(_1572, _1566, _1578);
    float _1616 = fma(_1604, _1534, _1606);
    float _1618 = fma(_1596, _1532, _1590);
    float _1620 = fma(_1580, _1534, _1612);
    float _1622 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1624 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1626 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1628 = fma(_1614, _1534, _1618);
    float _1630 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1622);
    float _1632 = -_1586;
    float _1634 = _1632 + 1.0;
    float _1636 = _1546 * _1546;
    float _1638 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1624);
    float _1640 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1626);
    float _1642 = _1502 * _1610;
    float _1644 = _1536 * _1634;
    float _1646 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1630);
    float _1648 = _1536 * _1610;
    float _1650 = fma(_1634, _1636, _1586);
    float _1652 = _1546 * _1610;
    float _1654 = _1502 * _1634;
    float _1656 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1638);
    float _1658 = fma(_1546, _1644, _1642);
    float _1660 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1662 = -_1652;
    float _1664 = fma(_1536, _1654, _1662);
    float _1666 = -_1648;
    float _1668 = fma(_1546, _1654, _1666);
    float _1670 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1672 = _1660 * _1658;
    float _1674 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1640);
    float _1676 = fma(_1502, _1654, _1586);
    float _1678 = _1660 * _1664;
    float _1680 = fma(_1670, _1668, _1672);
    float _1682 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1684 = fma(_1546, _1654, _1648);
    float _1686 = fma(_1670, _1676, _1678);
    float _1688 = fma(_1536, _1644, _1586);
    float _1690 = fma(_1682, _1650, _1680);
    float _1692 = fma(_1536, _1654, _1652);
    float _1694 = fma(_1682, _1684, _1686);
    float _1696 = _1660 * _1688;
    float _1698 = _1122 + _1690;
    float _1700 = -_1642;
    float _1702 = fma(_1546, _1644, _1700);
    float _1704 = _1448 + _1694;
    float _1706 = fma(_1670, _1692, _1696);
    float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1710 = _1698 + _1708;
    float _1712 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1716 = _1704 + _1714;
    float _1718 = fma(_1682, _1702, _1706);
    float _1720 = _1710 * _1710;
    float _1722 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1712);
    float _1724 = _1440 + _1718;
    float _1726 = fma(_1716, _1716, _1720);
    float _1728 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1722);
    float _1730 = sqrt(_1726);
    bool _1732 = _1730 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1734 = _1702;
    float _1736 = _1654;
    float _1738 = _1722;
    float _1740 = _1726;
    float _1742 = _1698;
    if (!_1732)
    {
        _1734 = _1704;
    }
    float _1744 = _1734;
    float _1746 = _1744;
    if (!_1732)
    {
        _1736 = _1698;
    }
    float _1748 = _1736;
    float _1750 = _1748;
    if (!_1732)
    {
        _1738 = _1724;
    }
    float _1752 = _1738;
    bool _1754 = !_1732;
    float _1756 = _1752;
    if (!_1754)
    {
        float _1758 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1762 = _1730 + _1760;
        float _1764 = rsqrt(_1726);
        float _1766 = _1762 * _1758;
        float _1768 = _1724 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1770 = _1766 * 0.15915493667125701904296875;
        float _1772 = _1770 * 6.283185482025146484375;
        float _1774 = cos(_1772);
        float _1776 = _1770 * 6.283185482025146484375;
        float _1778 = sin(_1776);
        float _1780 = _1774 + (-1.0);
        float _1782 = fma(_1778, _1768, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1784 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1786 = _1764 * _1782;
        float _1788 = fma(_1724, _1774, _1784);
        float _1790 = fma(_1716, _1786, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1792 = fma(_1710, _1786, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1756 = _1788;
        _1746 = _1790;
        _1750 = _1792;
        _1740 = _1764;
    }
    float _1794 = _1756;
    float _1796 = _1746;
    float _1798 = _1750;
    float _1800 = _1740;
    float _1802 = -_1440;
    float _1804 = _1802 + _1794;
    float _1806 = -_1448;
    float _1808 = _1806 + _1796;
    float _1810 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1812 = -_1122;
    float _1814 = _1812 + _1798;
    float _1816 = _1804 * _1804;
    float _1818 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1820 = 1.0 / _1810;
    float _1822 = fma(_1808, _1808, _1816);
    float _1824 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1818);
    float _1826 = fma(_1814, _1814, _1822);
    float _1828 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1824);
    float _1830 = sqrt(_1826);
    float _1832 = _1828 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1834 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1836 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan(0.5);
    bool _1842 = _1838 || _1840;
    float _1844 = _1832 + _1810;
    float _1846 = _1844 * _1820;
    float _1848 = _1846 * 0.5;
    bool _1850 = _1830 > 0.0;
    float _1852 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1854 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1852);
    bool _1856 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1860 = _1856 || _1858;
    bool _1862 = isnan(0.5);
    bool _1864 = _1860 || _1862;
    float _1866 = 1.0 / _1854;
    float _1868 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1870 = _1794;
    float _1872 = _1796;
    float _1874 = _1814;
    float _1876 = _1800;
    float _1878 = _1808;
    float _1880 = _1826;
    float _1882 = _1798;
    if (!_1850)
    {
        _1868 = _1798;
    }
    float _1884 = _1868;
    bool _1886 = !_1850;
    float _1888 = _1884;
    if (!_1886)
    {
        float _1890 = _174 * _174;
        float _1892 = rsqrt(_1826);
        float _1894 = fma(_172, _172, _1890);
        float _1896 = fma(_176, _176, _1894);
        float _1898 = sqrt(_1896);
        float _1900 = _1808 * _1892;
        float _1902 = _1804 * _1892;
        float _1904 = _1814 * _1892;
        bool _1906 = _1898 > 0.0;
        float _1908 = _1898;
        _1876 = _1900;
        _1880 = _1892;
        if (!_1906)
        {
            _1908 = _1798;
        }
        float _1910 = _1908;
        bool _1912 = !_1906;
        _1888 = _1910;
        if (!_1912)
        {
            float _1914 = rsqrt(_1896);
            float _1916 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1918 = _174 * _1914;
            float _1920 = _172 * _1914;
            float _1922 = _1902 * _1918;
            float _1924 = _176 * _1914;
            float _1926 = fma(_1900, _1920, _1922);
            float _1928 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1930 = fma(_1904, _1924, _1926);
            float _1932 = _1930 * _1928;
            float _1934 = fma(_172, _1932, _1796);
            float _1936 = fma(_174, _1932, _1794);
            float _1938 = fma(_176, _1932, _1798);
            _1870 = _1936;
            _1888 = _1938;
            _1872 = _1934;
            _1874 = _1926;
            _1878 = _1916;
            _1880 = _1928;
        }
    }
    float _1940 = _1870;
    float _1942 = _1888;
    float _1944 = _1872;
    float _1946 = _1874;
    float _1948 = _1876;
    float _1950 = _1878;
    float _1952 = _1880;
    float _1954 = _1950;
    float _1956 = _1944;
    float _1958 = _1942;
    float _1960 = _1952;
    float _1962 = _1946;
    float _1964 = _1948;
    if (_1864)
    {
        _1954 = 1.0;
    }
    float _1966 = _1954;
    float _1968 = _1966;
    if (_1842)
    {
        _1882 = _1940;
    }
    float _1970 = _1882;
    float _1972 = _1970;
    if (_1842)
    {
        _180 = _1942;
    }
    float _1974 = _180;
    float _1976 = _1974;
    if (!_1842)
    {
        float _1978 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1980 = _1440 + _1978;
        float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1984 = _1448 + _1982;
        float _1986 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1988 = -_1448;
        float _1990 = _1988 + _1944;
        float _1992 = _1980 * _1980;
        float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1996 = _1122 + _1994;
        float _1998 = -_1122;
        float _2000 = _1998 + _1942;
        float _2002 = fma(_1984, _1984, _1992);
        float _2004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2006 = fma(_1996, _1996, _2002);
        float _2008 = sqrt(_2006);
        float _2010 = _1986 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2012 = precise::min(_2008, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2014 = _2012 * _2004;
        float _2016 = _2010 * _2014;
        float _2018 = -_1440;
        float _2020 = _2018 + _1940;
        float _2022 = fma(_1990, _2016, _1448);
        float _2024 = fma(_2020, _2016, _1440);
        float _2026 = fma(_2000, _2016, _1122);
        _182 = _1986;
        _1972 = _2024;
        _1956 = _2022;
        _1976 = _2026;
        _1958 = _2000;
    }
    float _2028 = _182;
    float _2030 = _1972;
    float _2032 = _1956;
    float _2034 = _1976;
    float _2036 = _1958;
    float _2038 = _2028;
    if (_1864)
    {
        _1960 = 1.0;
    }
    float _2040 = _1960;
    float _2042 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2044 = _1866 * _2042;
    float _2046 = _2040;
    if (!_1864)
    {
        float _2048 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2050 = _2048 * 0.15915493667125701904296875;
        float _2052 = _2050 * 6.283185482025146484375;
        float _2054 = cos(_2052);
        float _2056 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2058 = _2056 * 0.15915493667125701904296875;
        float _2060 = _2050 * 6.283185482025146484375;
        float _2062 = sin(_2060);
        float _2064 = 1.0 / _2054;
        float _2066 = _2058 * 6.283185482025146484375;
        float _2068 = cos(_2066);
        float _2070 = _2062 * _2064;
        float _2072 = _2058 * 6.283185482025146484375;
        float _2074 = sin(_2072);
        float _2076 = _2068 * _2070;
        float _2078 = 1.0 / _2076;
        float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2082 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2080;
        float _2084 = 1.0 / _2082;
        float _2086 = _2074 * _2078;
        float _2088 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2090 = fma(_2044, _2086, _2088);
        float _2092 = _2090 * _2084;
        float _2094 = precise::clamp(_2092, 0.0, 1.0);
        _2038 = _2084;
        _1968 = _2094;
    }
    float _2096 = _2038;
    float _2098 = _1968;
    float _2100 = _2096;
    if (!_1864)
    {
        float _2102 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2104 = _2102 * 0.15915493667125701904296875;
        float _2106 = _2104 * 6.283185482025146484375;
        float _2108 = cos(_2106);
        float _2110 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2112 = _2110 * 0.15915493667125701904296875;
        float _2114 = _2104 * 6.283185482025146484375;
        float _2116 = sin(_2114);
        float _2118 = 1.0 / _2108;
        float _2120 = _2112 * 6.283185482025146484375;
        float _2122 = cos(_2120);
        float _2124 = _2116 * _2118;
        float _2126 = _2112 * 6.283185482025146484375;
        float _2128 = sin(_2126);
        float _2130 = _2122 * _2124;
        float _2132 = 1.0 / _2130;
        float _2134 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2136 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2134;
        float _2138 = 1.0 / _2136;
        float _2140 = _2128 * _2132;
        float _2142 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2144 = fma(_2044, _2140, _2142);
        float _2146 = _2144 * _2138;
        float _2148 = precise::clamp(_2146, 0.0, 1.0);
        float _2150 = -_2148;
        float _2152 = _2150 + 1.0;
        _2100 = _2118;
        _1962 = _2132;
        _2046 = _2152;
    }
    float _2154 = _2100;
    float _2156 = _1962;
    float _2158 = _2046;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2162 = _2030 + _2160;
    float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2166 = _2032 + _2164;
    float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2170 = _2034 + _2168;
    float _2172 = _2162 * _2162;
    float _2174 = fma(_2166, _2166, _2172);
    float _2176 = fma(_2170, _2170, _2174);
    float _2178 = rsqrt(_2176);
    float _2180 = sqrt(_2176);
    float _2182 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2184 = _2166 * _2182;
    float _2186 = _2170 * _2182;
    float _2188 = _2184 * _2184;
    float _2190 = _2186 * _2186;
    float _2192 = _2188 + _2190;
    float _2194 = sqrt(_2192);
    bool _2196 = _2194 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2200 = _2194 + _2198;
    float _2202 = _2154;
    float _2204 = _2192;
    float _2206 = _2200;
    float _2208 = _2162;
    float _2210 = _2186;
    float _2212 = _2188;
    float _2214 = _2190;
    if (_2196)
    {
        float _2216 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2202 = _2216;
    }
    float _2218 = _2202;
    if (_2196)
    {
        float _2220 = rsqrt(_2192);
        _2204 = _2220;
    }
    float _2222 = _2204;
    if (_2196)
    {
        float _2224 = _2200 * _2218;
        _2206 = _2224;
    }
    float _2226 = _2206;
    if (_2196)
    {
        float _2228 = _2226 * 0.15915493667125701904296875;
        _1964 = _2228;
    }
    float _2230 = _1964;
    float _2232 = _2156;
    if (_2196)
    {
        float _2234 = _2230 * 6.283185482025146484375;
        float _2236 = sin(_2234);
        _2232 = _2236;
    }
    float _2238 = _2232;
    float _2240 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2242 = precise::max(0.0, _2240);
    float _2244 = _2036;
    float _2246 = _2240;
    float _2248 = _2242;
    if (_2196)
    {
        float _2250 = _2230 * 6.283185482025146484375;
        float _2252 = cos(_2250);
        _2244 = _2252;
    }
    float _2254 = _2244;
    float _2256 = -_2182;
    float _2258 = -_2242;
    float _2260 = fma(_2162, _2256, _2258);
    if (!_2196)
    {
        _2208 = _2184;
    }
    float _2262 = _2208;
    float _2264 = _2262;
    if (_2196)
    {
        float _2266 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2246 = _2266;
    }
    float _2268 = _2246;
    float _2270 = _2238;
    float _2272 = _2268;
    if (_2196)
    {
        float _2274 = fma(_2238, _2268, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2270 = _2274;
    }
    float _2276 = _2270;
    if (!_2196)
    {
        _2272 = _2260;
    }
    float _2278 = _2272;
    float _2280 = _2278;
    if (_2196)
    {
        float _2282 = _2254 + (-1.0);
        _2248 = _2282;
    }
    float _2284 = _2248;
    float _2286 = _2284;
    if (_2196)
    {
        float _2288 = _2222 * _2276;
        _1742 = _2288;
    }
    float _2290 = _1742;
    float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2294 = fma(_2180, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2292);
    float _2296 = precise::clamp(_2294, 0.0, 1.0);
    if (_2196)
    {
        float _2298 = _2284 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2286 = _2298;
    }
    float _2300 = _2286;
    if (_2196)
    {
        float _2302 = _2184 * _2290;
        _2264 = _2302;
    }
    float _2304 = _2264;
    if (_2196)
    {
        float _2306 = _2186 * _2290;
        _2210 = _2306;
    }
    float _2308 = _2210;
    float _2310 = -_2296;
    float _2312 = _2310 + 1.0;
    if (_2196)
    {
        float _2314 = fma(_2260, _2254, _2300);
        _2280 = _2314;
    }
    float _2316 = _2280;
    if (_2196)
    {
        float _2318 = _2304 * _2304;
        _2212 = _2318;
    }
    float _2320 = _2212;
    if (_2196)
    {
        float _2322 = _2308 * _2308;
        _2214 = _2322;
    }
    float _2324 = _2214;
    float _2326 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2328 = abs(_2312);
    float _2330 = log2(_2328);
    float _2332 = fma(_2316, _2316, _2320);
    float _2334 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2336 = _2332 + _2324;
    float _2338 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2340 = rsqrt(_2336);
    float _2342 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2338);
    float _2344 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2346 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2342);
    float _2348 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2326);
    float _2350 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2352 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2344);
    float _2354 = _2346 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2356 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2348);
    float _2358 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2350);
    float _2360 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2352);
    float _2362 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2364 = _2356 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2366 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2358);
    float _2368 = _2340 * _2304;
    float _2370 = _2360 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2372 = _2364 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2374 = _2340 * _2316;
    float _2376 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2378 = _2340 * _2308;
    float _2380 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2372);
    float _2382 = _2366 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2384 = -_2376;
    float _2386 = fma(_2374, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2384);
    float _2388 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2390 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2380);
    float _2392 = exp2(_2362);
    float _2394 = -_2378;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2386);
    float _2398 = -_2388;
    float _2400 = fma(_2398, _2334, 1.0);
    float _2402 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2390);
    float _2404 = _2364 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2406 = fma(_2396, -0.5, 0.5);
    float _2408 = _2364 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2410 = fma(_2396, 0.5, 0.5);
    float _2412 = 1.0 / _2402;
    float _2414 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2404);
    float _2416 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2408);
    float _2418 = fma(_2410, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2420 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2414);
    float _2422 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2416);
    float _2424 = fma(_2410, _2418, -0.212114393711090087890625);
    float _2426 = log2(_2400);
    float _2428 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2422);
    float _2430 = fma(_2410, _2424, 1.570728778839111328125);
    float _2432 = sqrt(_2406);
    float _2434 = _2374 + 1.0;
    float _2436 = -_2374;
    float _2438 = fma(_2392, _2434, _2436);
    float _2440 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2420);
    float _2442 = _2428 * _2412;
    float _2444 = _2426 * 0.693147182464599609375;
    float _2446 = _2440 * _2412;
    float _2448 = fma(_2442, -0.5, 0.5);
    float _2450 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2452 = fma(_2446, 0.5, 0.5);
    float _2454 = fma(_2438, 0.5, 0.5);
    float _2456 = _2432 * 0.636619746685028076171875;
    float _2458 = -_2430;
    float _2460 = fma(_2456, _2458, 1.0);
    float3 _7053 = float3(_2452, _2448, _2450);
    float _2462 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7053, float3(0.0), isnan(_7053)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7053, float3(0.0), isnan(_7053)), level(0.0)).x;
    float3 _7064 = float3(_2452, _2448, _2450);
    float4 _2465 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7064, float3(0.0), isnan(_7064)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7064, float3(0.0), isnan(_7064)), level(0.0)).xyzw;
    float _2467 = _2465.x;
    float _2469 = _2465.y;
    float _2471 = _2465.z;
    float _2473 = _2465.w;
    float2 _7081 = float2(_2460, _2454);
    float3 _2477 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7081, float2(0.0), isnan(_7081)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7081, float2(0.0), isnan(_7081)), level(0.0)).xyz;
    float _2479 = _2477.x;
    float _2481 = _2477.y;
    float _2483 = _2477.z;
    float _2485 = float(uint(_1270));
    float _2487 = trunc(_1376);
    int _2489 = int(_2487);
    int _2491 = ~_1270;
    int _2493 = _2491 + 1;
    out.m_61.x = _714;
    out.m_61.y = _716;
    out.m_61.z = _718;
    out.m_61.w = _722;
    int _2495 = abs(_1294);
    float _2497 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2499 = abs(_1300);
    float _2501 = _2364 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2503 = _1042 > 0.5;
    float _2505 = 1.0 / _2485;
    float _2507 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2501);
    bool _2509 = !_1038;
    float _2511 = _2509 ? 7.345489978790283203125 : 1.0;
    float _2513 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2507);
    float _2515 = float(uint(_2489));
    float _2517 = exp2(_2497);
    float _2519 = _2511 * _1018;
    int _2521 = ~_1270;
    int _2523 = _2521 + 1;
    float _2525 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2513);
    int _2527 = as_type<int>(_2505) + (-2);
    out.gl_Position.x = _2440;
    out.gl_Position.y = _2428;
    out.gl_Position.z = _2525;
    out.gl_Position.w = _2402;
    float _2529 = as_type<float>(_2527) * _2515;
    float _2531 = trunc(_2529);
    float _2533 = precise::max(_2531, 0.0);
    uint _2536 = uint(_2533);
    float _2538 = -_2517;
    float _2540 = _2538 + 1.0;
    float _2542 = floor(_2519);
    int _2544 = _2493 * int(_2536);
    int _2546 = _2544 + _2489;
    float _2548 = float(uint(_2546));
    float _2550 = -_2542;
    float _2552 = _2519 + _2550;
    float _2554 = as_type<float>(_2527) * _2548;
    float _2556 = trunc(_2554);
    float _2558 = precise::max(_2556, 0.0);
    uint _2560 = uint(_2558);
    float _2562 = _1400 * _154;
    int _2564 = _1270 + (-1);
    float _2566 = trunc(_2562);
    int _2568 = int(_2566);
    int _2570 = int(_2536) + int(_2560);
    float _2572 = float(_2489);
    int _2574 = _2523 * _2570;
    int _2576 = _2574 + _2489;
    bool _2578 = _2572 >= _1388;
    bool _2580 = isnan(_2572);
    bool _2582 = _2578 || _2580;
    bool _2584 = isnan(_1388);
    bool _2586 = _2582 || _2584;
    float _2588 = float(_2586);
    bool _2590 = uint(_2576) >= uint(_1270);
    float _2592 = trunc(_2588);
    int _2594 = int(_2592);
    bool _2596 = !_2590;
    int _2598 = _2596 ? 0 : (-1);
    bool _2600 = _1270 == 0;
    int _2602 = ~_2570;
    int _2604 = _2602 + _2598;
    int _2606 = _2604 + 1;
    float _2608 = _2552 * _1388;
    int _2610 = _1270 * _2606;
    int _2612 = _2610 + _2489;
    int _2614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2616 = _2614 != 0;
    float _2618 = trunc(_2608);
    int _2620 = int(_2618);
    int _2622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2624 = _2622 != 0;
    int _2626 = ~_2594;
    int _2628 = _2626 + 1;
    int _2630 = _2628 + 1;
    bool _2632 = !_2600;
    int _2634 = _2632 ? _2612 : (-1);
    bool _2636 = !_2616;
    int _2638 = _2636 ? 0 : 1;
    int _2640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2642 = _2640 != 0;
    int _2644 = _2634 * _2630;
    int _2646 = abs(_2638);
    int _2648 = abs(_1306);
    int _2650 = _2594 * _2564;
    int _2652 = _2650 + _2644;
    bool _2654 = !_2642;
    int _2656 = _2654 ? 0 : 1;
    int _2658 = _2652 * _2495;
    int _2660 = _2620 * _2646;
    int _2662 = _2660 + _2489;
    int _2664 = abs(_2656);
    int _2666 = _2568 * _2499;
    int _2668 = _2666 + _2658;
    int _2670 = _2662 * _2648;
    int _2672 = _2670 + _2668;
    int _2674 = ~_1270;
    int _2676 = _2674 + 1;
    float _2678 = in.m_63.y;
    int _2680 = _2620 * _2664;
    int _2682 = _2680 + _2672;
    int _2684 = ~_1270;
    int _2686 = _2684 + 1;
    bool _2688 = _1024 > 0.5;
    float _2690 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2692 = _2690 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2694 = float(uint(_2682));
    float _2696 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2698 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2696;
    int _2700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2702 = _2700 != 0;
    int _2704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2706 = _2704 != 0;
    float _2708 = as_type<float>(_2527) * _2694;
    float _2710 = trunc(_2708);
    float _2712 = precise::max(_2710, 0.0);
    uint _2714 = uint(_2712);
    float _2716 = -_2678;
    float _2718 = _2716 + 1.0;
    int _2720 = _2686 * int(_2714);
    int _2722 = _2720 + _2682;
    float _2724 = float(uint(_2722));
    float _2726 = as_type<float>(_2527) * _2724;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2728 = trunc(_2726);
    float _2730 = precise::max(_2728, 0.0);
    uint _2732 = uint(_2730);
    float _2734 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2736 = _2734 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2738 = 1.0 / _2736;
    float _2740 = in.m_63.x;
    float _2742 = _2503 ? _2718 : _2678;
    float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2746 = _1016 + _2744;
    int _2748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2750 = _2748 != 0;
    int _2752 = int(_2714) + int(_2732);
    float _2754 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2756 = _2754 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2758 = _2676 * _2752;
    int _2760 = _2758 + _2682;
    float _2762 = 1.0 / _2756;
    float _2764 = _2698 * _2738;
    bool _2766 = uint(_2760) >= uint(_1270);
    bool _2768 = !_2766;
    int _2770 = _2768 ? 0 : (-1);
    float _2772 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2776 = _2774 != 0;
    float _2778 = float(uint(_2662));
    int _2780 = ~_2752;
    int _2782 = _2780 + _2770;
    int _2784 = _2782 + 1;
    int _2786 = _2776 ? as_type<int>(_2742) : as_type<int>(_2678);
    float _2788 = _2692 * _2762;
    float _2790 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2792 = _1016 + _2790;
    bool _2794 = _2776;
    float _2796 = _2678;
    float _2798 = _2746;
    float _2800 = _2742;
    int _2802 = _2786;
    int _2804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    if (_2624)
    {
        bool _2806 = _1018 > 0.5;
        _2794 = _2806;
    }
    bool _2808 = _2794;
    float _2810 = as_type<float>(_2527) * _2778;
    bool _2812 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2814 = isnan(_1016);
    bool _2816 = _2812 || _2814;
    bool _2818 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2820 = _2816 || _2818;
    float _2822 = float(_2820);
    float _2824 = fma(_2764, _2792, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2826 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2828 = isnan(_1016);
    bool _2830 = _2826 || _2828;
    bool _2832 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2834 = _2830 || _2832;
    float _2836 = float(_2834);
    int _2838 = _1270 * _2784;
    int _2840 = _2838 + _2682;
    bool _2842 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2844 = isnan(_1016);
    bool _2846 = _2842 || _2844;
    bool _2848 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2850 = _2846 || _2848;
    float _2852 = float(_2850);
    float _2854 = fma(_2788, _2746, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2856 = trunc(_2810);
    float _2858 = precise::max(_2856, 0.0);
    uint _2860 = uint(_2858);
    float _2862 = -_2836;
    float _2864 = _2862 + 1.0;
    if (_2750)
    {
        float _2866 = _2688 ? _2718 : _2678;
        _2796 = _2866;
    }
    float _2868 = _2796;
    float _2870 = _2772 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2872 = _2868;
    if (!_2624)
    {
        _2798 = _2740;
    }
    float _2874 = _2798;
    float _2876 = _2822 * _2864;
    float _2878 = -_2822;
    float _2880 = _2878 + 1.0;
    bool _2882 = !_2600;
    int _2884 = _2882 ? _2840 : (-1);
    float _2886 = fma(as_type<float>(_2786), _2870, -0.5);
    float _2888 = _2874;
    if (!_2624)
    {
        _2800 = _2874;
    }
    float _2890 = _2800;
    float _2892 = _2852 * _2880;
    int _2894 = _2884 >> 31;
    float _2896 = -_2852;
    float _2898 = _2896 + 1.0;
    float _2900 = _2890;
    if (_2624)
    {
        _2888 = _2740;
    }
    float _2902 = _2888;
    float _2904 = _2824 * _2892;
    int _2906 = _2894 & 3;
    float _2908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2910 = ~_1270;
    int _2912 = _2910 + 1;
    if (_2624)
    {
        float _2914 = -_2902;
        float _2916 = _2914 + 1.0;
        _2802 = as_type<int>(_2916);
    }
    int _2918 = _2802;
    int _2920 = _2884 + _2906;
    if (_2702)
    {
        float _2922 = -_2902;
        float _2924 = _2922 + 1.0;
        _2804 = as_type<int>(_2924);
    }
    int _2926 = _2804;
    int _2928 = _2912 * int(_2860);
    int _2930 = _2928 + _2662;
    if (_2624)
    {
        float _2932 = _2808 ? as_type<float>(_2918) : _2902;
        _2900 = _2932;
    }
    float _2934 = _2900;
    float _2936 = fma(_2898, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2904);
    int _2938 = _2920 >> 2;
    float _2940 = -_1372;
    float _2942 = fma(_1218, _2886, _2940);
    float _2944 = float(uint(_2930));
    float _2946 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2868, -0.5);
    int _2948 = _2938 << 4;
    int _2950 = _2948 + 368;
    float _2952 = fma(_2854, _2876, _2936);
    if (!_2702)
    {
        _2872 = _2902;
    }
    float _2954 = _2872;
    float _2956 = as_type<float>(_2527) * _2944;
    float _2958 = _2954;
    if (_2702)
    {
        float _2960 = _2688 ? as_type<float>(_2926) : _2902;
        _2958 = _2960;
    }
    float _2962 = _2958;
    int _2964 = _2950 + 8;
    uint _2966 = uint(int(uint(_2964) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c9)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c9)._m0[int(_2976)][_2978];
    float _2982 = -_1120;
    float _2984 = fma(_1296, _2946, _2982);
    int _2986 = _2884 & 3;
    bool _2988 = _2986 != 0;
    float _2990 = trunc(_2956);
    float _2992 = precise::max(_2990, 0.0);
    uint _2994 = uint(_2992);
    float _2996 = _2908 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2998 = fma(_2934, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3000 = fma(_2836, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2952);
    uint _3002 = uint(int(uint(_2950) >> uint(2)));
    uint _3004 = uint(int(uint(int(_3002)) >> uint(2)));
    int _3006 = int(_3002) & 3;
    float _3008 = (*spvDescriptorSet0.vp_c9)._m0[int(_3004)][_3006];
    int _3010 = int(_3002) + 1;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    int _3014 = _3010 & 3;
    float _3016 = (*spvDescriptorSet0.vp_c9)._m0[int(_3012)][_3014];
    float _3018 = _988 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3020 = fma(_1386, _2998, _1290);
    int _3022 = _2884 & 3;
    bool _3024 = _3022 != 0;
    float _3026 = fma(_2996, _2962, -0.5);
    int _3028 = _2988 ? 0 : 1;
    float _3030 = _992 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3032 = uint(_3022) > 1u;
    float _3034 = fma(_1236, _3026, _1310);
    bool _3036 = _3022 != 3;
    float _3038 = _3018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3040 = uint(_3022) >= 2u;
    float _3042 = _3030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3044 = int(_2860) + int(_2994);
    float _3046 = _990 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3048 = ~_3028;
    int _3050 = _3048 + 1;
    int _3052 = _3050 + 1;
    float _3054 = _3000 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3056 = _3040 ? 0 : 1;
    float _3058 = _3046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3060 = !_3024;
    int _3062 = _3060 ? 0 : 1;
    float _3064 = _2984 + 0.5;
    int _3066 = _3052;
    if (!_3032)
    {
        int _3068 = ~_3028;
        int _3070 = _3068 + 1;
        _3066 = _3070;
    }
    int _3072 = _3066;
    float _3074 = _3020 + 0.5;
    bool _3076 = _3022 != 3;
    out.m_67.x = _3038;
    out.m_67.y = _3058;
    out.m_67.z = _3042;
    out.m_67.w = _3054;
    int _3078 = abs(_3072);
    float _3080 = _2942 + 0.5;
    int _3082 = ~_3056;
    int _3084 = _3082 + 1;
    int _3086 = _3084 + 1;
    float _3088 = _3034 + 0.5;
    int _3090 = abs(_3062);
    out.m_69.x = _3074;
    out.m_69.y = _3064;
    int _3092 = _3086;
    if (_3036)
    {
        int _3094 = ~_3056;
        int _3096 = _3094 + 1;
        _3092 = _3096;
    }
    int _3098 = _3092;
    out.m_71.x = _3088;
    out.m_71.y = _3080;
    int _3100 = ~_1270;
    int _3102 = _3100 + 1;
    int _3104 = abs(_3098);
    bool _3106 = !_3076;
    int _3108 = _3106 ? 0 : (-1);
    int _3110 = _3102 * _3044;
    int _3112 = _3110 + _2662;
    int _3114 = ~_3078;
    int _3116 = _3114 + 1;
    int _3118 = _3116 + 1;
    int _3120 = abs(_3108);
    bool _3122 = !_2706;
    int _3124 = _3122 ? 0 : 1;
    int _3126 = _3118 * as_type<int>(_3016);
    int _3128 = ~_3090;
    int _3130 = _3128 + 1;
    int _3132 = _3130 + 1;
    int _3134 = abs(_3124);
    int _3136 = _3132 * as_type<int>(_3008);
    int _3138 = _3136 + _3126;
    int _3140 = ~_3104;
    int _3142 = _3140 + 1;
    int _3144 = _3142 + 1;
    bool _3146 = uint(_3112) >= uint(_1270);
    int _3148 = ~_3120;
    int _3150 = _3148 + 1;
    int _3152 = _3150 + 1;
    int _3154 = _3144 * as_type<int>(_2972);
    int _3156 = _3154 + _3138;
    bool _3158 = !_3146;
    int _3160 = _3158 ? 0 : (-1);
    int _3162 = _3152 * as_type<int>(_2980);
    int _3164 = _3162 + _3156;
    int _3166 = ~_3044;
    int _3168 = _3166 + _3160;
    int _3170 = _3168 + 1;
    float _3172 = _2098 * _2158;
    int _3174 = ~_3134;
    int _3176 = _3174 + 1;
    int _3178 = _3176 + 1;
    float _3180 = _3172 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _3182 = _1270 * _3170;
    int _3184 = _3182 + _2662;
    int _3186 = _3164 * _3178;
    float _3188 = _3180 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3190 = _2525 + _2402;
    bool _3192 = !_2600;
    int _3194 = _3192 ? _3184 : (-1);
    bool _3196 = _2098 > 0.0;
    bool _3198 = isnan(_2098);
    bool _3200 = _3196 || _3198;
    bool _3202 = isnan(0.0);
    bool _3204 = _3200 || _3202;
    float _3206 = _3190 * 0.5;
    float _3208 = _2540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _3210 = _3194 * _3134;
    int _3212 = _3210 + _3186;
    bool _3214 = _2158 <= 0.0;
    bool _3216 = !_3204;
    bool _3218 = _3214 || _3216;
    out.m_49.x = _3188;
    float _3220 = _3208 * _2462;
    float _3222 = -_3208;
    float _3224 = _3222 + 1.0;
    float _3226 = float(_3212);
    float _3228 = _2473 * _3220;
    float _3230 = _2483 * _3220;
    out.m_73.x = _3226;
    float _3232 = fma(_2479, _3228, _2467);
    float _3234 = fma(_2481, _3228, _2469);
    float _3236 = _2473 * _3224;
    float _3238 = fma(_2473, _3230, _2471);
    out.m_75.z = _3206;
    out.m_75.w = _2402;
    out.m_77.x = _3232;
    out.m_77.y = _3234;
    out.m_77.z = _3238;
    out.m_77.w = _3236;
    if (!_3218)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3240 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3240;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1014 = false;
    bool _744 = false;
    bool _646 = false;
    bool _364 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = in.m_44.w;
    float _95 = trunc(_91);
    int _98 = int(_95);
    float _100 = -_93;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _102;
    bool _106 = _98 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_98);
    float _112 = _102;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _108;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _116 = 0;
    if (!_106)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3309 = as_type<float>(_120);
        out.gl_Position.z = _3309;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _124 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_93);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = float(_98);
    bool _136 = _102 >= _134;
    bool _138 = !_132;
    bool _140 = _136 || _138;
    if (_140)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _110;
    if (_140)
    {
        out.m_49.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _122 = as_type<int>(_144);
    }
    int _146 = _122;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3364 = as_type<float>(_146);
        out.gl_Position.z = _3364;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_51.x;
    float _150 = in.m_51.y;
    float _152 = in.m_51.z;
    float _154 = 1.0 / _134;
    bool _156 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _158 = _102 * _154;
    float _160 = _150 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _162 = _150 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _164 = _150 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _166 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[4].x, _160);
    float _168 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[5].x, _162);
    float _170 = fma(_148, (*spvDescriptorSet0.vp_c10)._m0[6].x, _164);
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].z, _166);
    float _174 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].z, _168);
    float _176 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].z, _170);
    bool _178 = !_156;
    float _180 = _172;
    float _182 = _176;
    float _200;
    if (!_178)
    {
        float _184 = in.m_53.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        _200 = _158;
    }
    _202 = false;
    float _204 = _200;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _204 + _206;
    bool _210 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _212 = isnan(_204);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _224 = _204 + _222;
    bool _226 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _228 = isnan(_204);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _244 = _242 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _246 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _248 = isnan(_204);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -_220;
    float _260 = _258 + 1.0;
    float _262 = 1.0 / _244;
    float _264 = _256 * _260;
    float _266 = -_256;
    float _268 = _266 + 1.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _270;
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _276 = 1.0 / _240;
    float _278 = _236 * _268;
    float _280 = -_236;
    float _282 = _280 + 1.0;
    float _284 = _224 * _262;
    float _286 = _208 * _276;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _292;
    float _296 = fma(_272, _286, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = fma(_290, _286, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _300 = fma(_294, _286, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _302 = _296 * _278;
    float _304 = _298 * _278;
    float _306 = _300 * _278;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _320 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].x, _302);
    float _322 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].y, _304);
    float _324 = fma(_310, _284, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _326 = fma(_314, _284, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _328 = fma(_318, _284, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _330 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].z, _306);
    float _332 = fma(_324, _264, _320);
    float _334 = fma(_326, _264, _322);
    float _336 = fma(_328, _264, _330);
    float _338 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[145].x, _332);
    float _340 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[145].y, _334);
    float _342 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[145].z, _336);
    bool _344 = !_274;
    float _362;
    if (!_344)
    {
        float _346 = in.m_53.x;
        float _348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _350 = _346 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _352 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[11].x, _102);
        float _354 = _352 * _348;
        float _356 = floor(_354);
        float _358 = -_356;
        float _360 = _354 + _358;
        _362 = _360;
        _364 = true;
    }
    else
    {
        _362 = _158;
    }
    _364 = false;
    float _366 = _362;
    float _368 = in.m_55.x;
    float _370 = in.m_55.y;
    float _372 = in.m_55.z;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _376 = _366 + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _394 = 1.0 / _388;
    bool _396 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _398 = isnan(_366);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    bool _408 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _410 = isnan(_366);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = 1.0 / _380;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _424 = _366 + _422;
    float _426 = _340 * _370;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _430 = _366 + _428;
    float _432 = _342 * _372;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _436 = _366 + _434;
    float _438 = 1.0 / _384;
    float _440 = _430 * _394;
    bool _442 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _444 = isnan(_366);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = _338 * _368;
    bool _456 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _458 = 1.0 / _392;
    float _460 = _424 * _420;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _462;
    float _466 = fma(_464, _440, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _468 = _376 * _438;
    bool _470 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _472 = isnan(_366);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _482;
    float _486 = -_480;
    float _488 = _486 + 1.0;
    float _490 = fma(_484, _440, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _492 = _436 * _458;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _494;
    float _498 = -_452;
    float _500 = _498 + 1.0;
    float _502 = fma(_496, _440, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _504 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _506 = isnan(_366);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = _406 * _500;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _522 = -_406;
    float _524 = _522 + 1.0;
    float _526 = _418 * _488;
    float _528 = -_418;
    float _530 = _528 + 1.0;
    float _532 = fma(_520, _492, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _534 = _480 * _524;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _544 = _514 * _530;
    float _546 = fma(_538, _492, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _548 = fma(_542, _492, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _550 = _502 * _544;
    float _552 = _466 * _544;
    float _554 = -_514;
    float _556 = _554 + 1.0;
    float _558 = _490 * _544;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _560;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _564;
    float _568 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[107].x, _550);
    float _570 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[107].y, _552);
    float _572 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[107].z, _558);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _574;
    float _578 = fma(_562, _460, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _580 = fma(_532, _526, _568);
    float _582 = fma(_546, _526, _570);
    float _584 = fma(_548, _526, _572);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _594 = fma(_566, _460, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _596 = fma(_576, _460, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _602 = fma(_578, _534, _580);
    float _604 = fma(_588, _468, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _606 = fma(_592, _468, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _608 = fma(_600, _468, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _610 = fma(_594, _534, _582);
    float _612 = fma(_596, _534, _584);
    float _614 = fma(_604, _516, _602);
    float _616 = fma(_606, _516, _610);
    float _618 = fma(_608, _516, _612);
    float _620 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[111].x, _614);
    float _622 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[111].y, _616);
    float _624 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[111].z, _618);
    bool _626 = !_456;
    float _644;
    if (!_626)
    {
        float _628 = in.m_53.x;
        float _630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _632 = _628 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _634 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _636 = _634 * _630;
        float _638 = floor(_636);
        float _640 = -_638;
        float _642 = _636 + _640;
        _644 = _642;
        _646 = true;
    }
    else
    {
        _644 = _158;
    }
    _646 = false;
    float _648 = _644;
    bool _650 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _652 = isnan(_648);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _666 = _648 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _668 = isnan(_648);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _684 = _648 + _682;
    float _686 = -_660;
    float _688 = _686 + 1.0;
    bool _690 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _692 = 1.0 / _664;
    float _694 = _676 * _688;
    float _696 = -_676;
    float _698 = _696 + 1.0;
    float _700 = _680 * _692;
    float _702 = _622 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _704 = fma(_700, _684, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _706 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _708 = _704 * _694;
    float _710 = _624 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _712 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[115].x, _708);
    float _714 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _716 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _720 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[116].x, _712);
    float _722 = _720 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _724 = !_690;
    float _742;
    if (!_724)
    {
        float _726 = in.m_53.x;
        float _728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _730 = _726 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _734 = _732 * _728;
        float _736 = floor(_734);
        float _738 = -_736;
        float _740 = _734 + _738;
        _742 = _740;
        _744 = true;
    }
    else
    {
        _742 = _158;
    }
    _744 = false;
    float _746 = _742;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _750 = _746 + _748;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _754 = _746 + _752;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _758 = _746 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _760;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _776 = 1.0 / _762;
    bool _778 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _780 = isnan(_746);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    bool _790 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _792 = isnan(_746);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = 1.0 / _766;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _806 = _746 + _804;
    bool _808 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _810 = 1.0 / _770;
    float _812 = _750 * _776;
    float _814 = 1.0 / _774;
    float _816 = _754 * _802;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _818;
    float _822 = fma(_820, _812, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _824 = _758 * _810;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _830;
    bool _834 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _836 = isnan(_746);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = fma(_828, _812, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _848 = fma(_832, _812, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _850 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _852 = isnan(_746);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = _806 * _814;
    bool _864 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _866 = isnan(_746);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -_788;
    float _878 = _876 + 1.0;
    float _880 = -_844;
    float _882 = _880 + 1.0;
    float _884 = _874 * _878;
    float _886 = -_874;
    float _888 = _886 + 1.0;
    float _890 = _860 * _882;
    float _892 = -_860;
    float _894 = _892 + 1.0;
    float _896 = _844 * _888;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _900 = _898 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _910 = _800 * _894;
    float _912 = fma(_900, _816, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _914 = fma(_904, _816, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _916 = fma(_908, _816, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _918 = _846 * _910;
    float _920 = _822 * _910;
    float _922 = -_800;
    float _924 = _922 + 1.0;
    float _926 = _848 * _910;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _928;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _932;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _936;
    float _940 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[123].x, _920);
    float _942 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[123].y, _918);
    float _944 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[123].z, _926);
    float _946 = fma(_930, _824, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _948 = fma(_934, _824, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _950 = fma(_938, _824, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _952 = fma(_912, _890, _940);
    float _954 = fma(_914, _890, _942);
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _958 = _956 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _964 = fma(_916, _890, _944);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _970 = fma(_946, _896, _952);
    float _972 = fma(_958, _862, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _974 = fma(_962, _862, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _976 = fma(_948, _896, _954);
    float _978 = fma(_968, _862, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _980 = fma(_950, _896, _964);
    float _982 = fma(_972, _884, _970);
    float _984 = fma(_974, _884, _976);
    float _986 = fma(_978, _884, _980);
    float _988 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[127].x, _982);
    float _990 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[127].y, _984);
    float _992 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[127].z, _986);
    bool _994 = !_808;
    float _1012;
    if (!_994)
    {
        float _996 = in.m_53.x;
        float _998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1000 = _996 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _1004 = _1002 * _998;
        float _1006 = floor(_1004);
        float _1008 = -_1006;
        float _1010 = _1004 + _1008;
        _1012 = _1010;
        _1014 = true;
    }
    else
    {
        _1012 = _158;
    }
    _1014 = false;
    float _1016 = _1012;
    float _1018 = in.m_53.x;
    float _1020 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1022 = log2(_1020);
    float _1024 = in.m_53.y;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1028 = in.m_42.x;
    float _1030 = in.m_42.y;
    float _1032 = in.m_42.z;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1038 = _1036 != 0;
    float _1040 = _454 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1042 = in.m_53.z;
    float _1044 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1046 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1044);
    float _1048 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1050 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1046);
    float _1052 = _1018 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1054 = _1022 * _102;
    float _1056 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1048);
    float _1058 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1060 = -_1026;
    float _1062 = fma(_1052, 2.0, _1060);
    float _1064 = _1018 * 2.0;
    float _1066 = _1024 * 2.0;
    float _1068 = fma(_1058, -2.0, _1034);
    float _1070 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1072 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1074 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1076 = _1042 * 2.0;
    float _1078 = floor(_1064);
    float _1080 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1070);
    float _1082 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1072);
    float _1084 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1074);
    float _1086 = _1018 + _1024;
    float _1088 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1080);
    float _1090 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1082);
    float _1092 = floor(_1076);
    float _1094 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1084);
    float _1096 = _1018 + _1042;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1102 = _1096 + (-1.0);
    float _1104 = floor(_1066);
    bool _1106 = _1078 > 0.0;
    float _1108 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1110 = _1078 >= 0.0;
    bool _1112 = isnan(_1078);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan(0.0);
    bool _1118 = _1114 || _1116;
    float _1120 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1068);
    float _1122 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1124 = _1118 ? 0 : 1;
    float _1126 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1128 = int(_1126);
    float _1130 = _1086 + (-1.0);
    float _1132 = _1024 + _1042;
    bool _1134 = _1092 > 0.0;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1138 = _1092 >= 0.0;
    bool _1140 = isnan(_1092);
    bool _1142 = _1138 || _1140;
    bool _1144 = isnan(0.0);
    bool _1146 = _1142 || _1144;
    float _1148 = _1132 + (-1.0);
    float _1150 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1152 = exp2(_1054);
    bool _1154 = _1104 > 0.0;
    float _1156 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1158 = _1148;
    if (_1038)
    {
        _1158 = _1018;
    }
    float _1160 = _1158;
    float _1162 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1136);
    float _1164 = _1160;
    if (!_1038)
    {
        _1164 = _1042;
    }
    float _1166 = _1164;
    bool _1168 = _1104 >= 0.0;
    bool _1170 = isnan(_1104);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan(0.0);
    bool _1176 = _1172 || _1174;
    float _1178 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1180 = _1166;
    if (_1038)
    {
        _1180 = _1024;
    }
    float _1182 = _1180;
    float _1184 = _1182;
    if (!_1038)
    {
        _1184 = _1018;
    }
    float _1186 = _1184;
    float _1188 = -_1098;
    float _1190 = fma(_1178, 2.0, _1188);
    int _1192 = _1146 ? 0 : 1;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1196 = _1176 ? 0 : 1;
    float _1198 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1200 = ~_1192;
    int _1202 = _1200 + 1;
    int _1204 = _1202 + 1;
    float _1206 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1194);
    int _1208 = _1204;
    if (!_1134)
    {
        int _1210 = ~_1192;
        int _1212 = _1210 + 1;
        _1208 = _1212;
    }
    int _1214 = _1208;
    float _1216 = fma(_1198, -2.0, _1100);
    float _1218 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1206);
    bool _1220 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1222 = isnan(0.0);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1228 = _1224 || _1226;
    float _1230 = -_1152;
    float _1232 = _1230 + 1.0;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1236 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1162);
    int _1238 = ~_1124;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    float _1244 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1234);
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1248 = _1246 != 0;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1252 = _1250 != 0;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1256 = _1254 != 0;
    float _1258 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1056);
    int _1260 = _1242;
    if (!_1106)
    {
        int _1262 = ~_1124;
        int _1264 = _1262 + 1;
        _1260 = _1264;
    }
    int _1266 = _1260;
    float _1268 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1270 = int(_1268);
    bool _1272 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1274 = isnan(1.0);
    bool _1276 = _1272 || _1274;
    bool _1278 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1280 = _1276 || _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1284 = 1.0 + _1282;
    float _1286 = float(_1128);
    float _1288 = -_102;
    float _1290 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1062);
    bool _1292 = !_1252;
    int _1294 = _1292 ? 0 : 1;
    float _1296 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1244);
    bool _1298 = !_1248;
    int _1300 = _1298 ? 0 : 1;
    float _1302 = rsqrt(_1258);
    bool _1304 = !_1256;
    int _1306 = _1304 ? 0 : 1;
    float _1308 = -_102;
    float _1310 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1190);
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1322 = _1320 != 0;
    int _1324 = ~_1196;
    int _1326 = _1324 + 1;
    int _1328 = _1326 + 1;
    int _1330 = _1328;
    if (!_1154)
    {
        int _1332 = ~_1196;
        int _1334 = _1332 + 1;
        _1330 = _1334;
    }
    int _1336 = _1330;
    float _1338 = 1.0 / _1286;
    float _1340 = in.m_57.x;
    float _1342 = in.m_57.y;
    float _1344 = in.m_57.z;
    bool _1346 = !_1318;
    int _1348 = _1346 ? 0 : 1;
    bool _1350 = !_1314;
    int _1352 = _1350 ? 0 : 1;
    float _1354 = 1.0 / _1284;
    int _1356 = abs(_1348);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1360 = abs(_1352);
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1362;
    float _1366 = float(_1266);
    float _1368 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1358);
    float _1370 = float(_1356);
    float _1372 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1216);
    float _1374 = float(_1360);
    float _1376 = _1338 * _102;
    float _1378 = float(_1214);
    float _1380 = _1370 * _1366;
    bool _1382 = !_1322;
    int _1384 = _1382 ? 0 : 1;
    float _1386 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1368);
    float _1388 = float(_1270);
    float _1390 = _1374 * _1378;
    float _1392 = _1228 ? _1232 : 0.0;
    float _1394 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    int _1396 = abs(_1384);
    float _1398 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1400 = _1388 * _102;
    if (_1280)
    {
        float _1402 = _1392 * _1354;
        _112 = _1402;
    }
    float _1404 = _112;
    float _1406 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1408 = _1390 * (-2.0);
    float _1410 = _1398 * _1398;
    float _1412 = _1018 + (-0.5);
    float _1414 = float(_1336);
    float _1416 = fma(_1408, _1340, _1340);
    float _1418 = fma(_1394, _1394, _1410);
    float _1420 = float(_1396);
    float _1422 = fma(_1150, _1408, _1150);
    float _1424 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1416);
    float _1426 = fma(_1406, _1406, _1418);
    float _1428 = _1380 * (-2.0);
    float _1430 = _1420 * _1414;
    float _1432 = fma(_1422, _1404, _1424);
    float _1434 = 1.0 / _1364;
    float _1436 = fma(_1156, _1428, _1156);
    float _1438 = fma(_1428, _1342, _1342);
    float _1440 = _1090 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1442 = in.m_59.x;
    float _1444 = in.m_59.y;
    float _1446 = in.m_59.z;
    float _1448 = _1088 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1450 = _1432 * 0.15915493667125701904296875;
    float _1452 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1454 = _1024 + (-0.5);
    float _1456 = _1430 * (-2.0);
    float _1458 = rsqrt(_1426);
    float _1460 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1452);
    float _1462 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1438);
    float _1464 = fma(_1108, _1456, _1108);
    float _1466 = fma(_1456, _1344, _1344);
    float _1468 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1460);
    float _1470 = fma(_1436, _1404, _1462);
    float _1472 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1474 = _1042 + (-0.5);
    float _1476 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1478 = _1470 * 0.15915493667125701904296875;
    float _1480 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1466);
    float _1482 = -_1476;
    float _1484 = _1472 + _1482;
    bool _1486 = _1476 >= _1472;
    bool _1488 = isnan(_1476);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan(_1472);
    bool _1494 = _1490 || _1492;
    float _1496 = _1450 * 6.283185482025146484375;
    float _1498 = sin(_1496);
    float _1500 = fma(_1464, _1404, _1480);
    float _1502 = _1394 * _1458;
    float _1504 = abs(_1484);
    float _1506 = precise::max(_1504, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1442);
    float _1510 = _1500 * 0.15915493667125701904296875;
    float _1512 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1446);
    float _1514 = precise::min(_1506, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1516 = _426 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1518 = _1450 * 6.283185482025146484375;
    float _1520 = cos(_1518);
    float _1522 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1524 = !_1494;
    float _1526 = _1524 ? 1.0 : (-1.0);
    float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1530 = _1514 + _1528;
    float _1532 = _1040 * _1508;
    float _1534 = _1522 * _1512;
    float _1536 = _1398 * _1458;
    float _1538 = _1530 * _1434;
    float _1540 = _1478 * 6.283185482025146484375;
    float _1542 = sin(_1540);
    float _1544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1444);
    float _1546 = _1406 * _1458;
    float _1548 = _1526 * _1538;
    float _1550 = _158 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1552 = _1516 * _1544;
    float _1554 = _1478 * 6.283185482025146484375;
    float _1556 = cos(_1554);
    float _1558 = _1550 * _1548;
    float _1560 = _1558 * 0.15915493667125701904296875;
    float _1562 = _1510 * 6.283185482025146484375;
    float _1564 = cos(_1562);
    float _1566 = _1498 * _1542;
    float _1568 = _1520 * _1542;
    float _1570 = _1510 * 6.283185482025146484375;
    float _1572 = sin(_1570);
    float _1574 = _1498 * _1556;
    float _1576 = _1564 * _1552;
    float _1578 = _1520 * _1556;
    float _1580 = _1542 * _1564;
    float _1582 = _1556 * _1564;
    float _1584 = _1560 * 6.283185482025146484375;
    float _1586 = cos(_1584);
    float _1588 = _1520 * _1576;
    float _1590 = _1498 * _1576;
    float _1592 = fma(_1572, _1578, _1566);
    float _1594 = -_1568;
    float _1596 = fma(_1572, _1574, _1594);
    float _1598 = -_1552;
    float _1600 = _1572 * _1598;
    float _1602 = -_1574;
    float _1604 = fma(_1572, _1568, _1602);
    float _1606 = fma(_1592, _1532, _1588);
    float _1608 = _1560 * 6.283185482025146484375;
    float _1610 = sin(_1608);
    float _1612 = fma(_1582, _1532, _1600);
    float _1614 = fma(_1572, _1566, _1578);
    float _1616 = fma(_1604, _1534, _1606);
    float _1618 = fma(_1596, _1532, _1590);
    float _1620 = fma(_1580, _1534, _1612);
    float _1622 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1624 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1626 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1628 = fma(_1614, _1534, _1618);
    float _1630 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1622);
    float _1632 = -_1586;
    float _1634 = _1632 + 1.0;
    float _1636 = _1546 * _1546;
    float _1638 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1624);
    float _1640 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1626);
    float _1642 = _1502 * _1610;
    float _1644 = _1536 * _1634;
    float _1646 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1630);
    float _1648 = _1536 * _1610;
    float _1650 = fma(_1634, _1636, _1586);
    float _1652 = _1546 * _1610;
    float _1654 = _1502 * _1634;
    float _1656 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1638);
    float _1658 = fma(_1546, _1644, _1642);
    float _1660 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1662 = -_1652;
    float _1664 = fma(_1536, _1654, _1662);
    float _1666 = -_1648;
    float _1668 = fma(_1546, _1654, _1666);
    float _1670 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1672 = _1660 * _1658;
    float _1674 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1640);
    float _1676 = fma(_1502, _1654, _1586);
    float _1678 = _1660 * _1664;
    float _1680 = fma(_1670, _1668, _1672);
    float _1682 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1684 = fma(_1546, _1654, _1648);
    float _1686 = fma(_1670, _1676, _1678);
    float _1688 = fma(_1536, _1644, _1586);
    float _1690 = fma(_1682, _1650, _1680);
    float _1692 = fma(_1536, _1654, _1652);
    float _1694 = fma(_1682, _1684, _1686);
    float _1696 = _1660 * _1688;
    float _1698 = _1122 + _1690;
    float _1700 = -_1642;
    float _1702 = fma(_1546, _1644, _1700);
    float _1704 = _1448 + _1694;
    float _1706 = fma(_1670, _1692, _1696);
    float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1710 = _1698 + _1708;
    float _1712 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1716 = _1704 + _1714;
    float _1718 = fma(_1682, _1702, _1706);
    float _1720 = _1710 * _1710;
    float _1722 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1712);
    float _1724 = _1440 + _1718;
    float _1726 = fma(_1716, _1716, _1720);
    float _1728 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1722);
    float _1730 = sqrt(_1726);
    bool _1732 = _1730 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1734 = _1702;
    float _1736 = _1654;
    float _1738 = _1722;
    float _1740 = _1726;
    float _1742 = _1698;
    if (!_1732)
    {
        _1734 = _1704;
    }
    float _1744 = _1734;
    float _1746 = _1744;
    if (!_1732)
    {
        _1736 = _1698;
    }
    float _1748 = _1736;
    float _1750 = _1748;
    if (!_1732)
    {
        _1738 = _1724;
    }
    float _1752 = _1738;
    bool _1754 = !_1732;
    float _1756 = _1752;
    if (!_1754)
    {
        float _1758 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1762 = _1730 + _1760;
        float _1764 = rsqrt(_1726);
        float _1766 = _1762 * _1758;
        float _1768 = _1724 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1770 = _1766 * 0.15915493667125701904296875;
        float _1772 = _1770 * 6.283185482025146484375;
        float _1774 = cos(_1772);
        float _1776 = _1770 * 6.283185482025146484375;
        float _1778 = sin(_1776);
        float _1780 = _1774 + (-1.0);
        float _1782 = fma(_1778, _1768, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1784 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1786 = _1764 * _1782;
        float _1788 = fma(_1724, _1774, _1784);
        float _1790 = fma(_1716, _1786, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1792 = fma(_1710, _1786, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1756 = _1788;
        _1746 = _1790;
        _1750 = _1792;
        _1740 = _1764;
    }
    float _1794 = _1756;
    float _1796 = _1746;
    float _1798 = _1750;
    float _1800 = _1740;
    float _1802 = -_1440;
    float _1804 = _1802 + _1794;
    float _1806 = -_1448;
    float _1808 = _1806 + _1796;
    float _1810 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1812 = -_1122;
    float _1814 = _1812 + _1798;
    float _1816 = _1804 * _1804;
    float _1818 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1820 = 1.0 / _1810;
    float _1822 = fma(_1808, _1808, _1816);
    float _1824 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1818);
    float _1826 = fma(_1814, _1814, _1822);
    float _1828 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1824);
    float _1830 = sqrt(_1826);
    float _1832 = _1828 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1834 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1836 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan(0.5);
    bool _1842 = _1838 || _1840;
    float _1844 = _1832 + _1810;
    float _1846 = _1844 * _1820;
    float _1848 = _1846 * 0.5;
    bool _1850 = _1830 > 0.0;
    float _1852 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1854 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1852);
    bool _1856 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1860 = _1856 || _1858;
    bool _1862 = isnan(0.5);
    bool _1864 = _1860 || _1862;
    float _1866 = 1.0 / _1854;
    float _1868 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1870 = _1794;
    float _1872 = _1796;
    float _1874 = _1814;
    float _1876 = _1800;
    float _1878 = _1808;
    float _1880 = _1826;
    float _1882 = _1798;
    if (!_1850)
    {
        _1868 = _1798;
    }
    float _1884 = _1868;
    bool _1886 = !_1850;
    float _1888 = _1884;
    if (!_1886)
    {
        float _1890 = _174 * _174;
        float _1892 = rsqrt(_1826);
        float _1894 = fma(_172, _172, _1890);
        float _1896 = fma(_176, _176, _1894);
        float _1898 = sqrt(_1896);
        float _1900 = _1808 * _1892;
        float _1902 = _1804 * _1892;
        float _1904 = _1814 * _1892;
        bool _1906 = _1898 > 0.0;
        float _1908 = _1898;
        _1876 = _1900;
        _1880 = _1892;
        if (!_1906)
        {
            _1908 = _1798;
        }
        float _1910 = _1908;
        bool _1912 = !_1906;
        _1888 = _1910;
        if (!_1912)
        {
            float _1914 = rsqrt(_1896);
            float _1916 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1918 = _174 * _1914;
            float _1920 = _172 * _1914;
            float _1922 = _1902 * _1918;
            float _1924 = _176 * _1914;
            float _1926 = fma(_1900, _1920, _1922);
            float _1928 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1930 = fma(_1904, _1924, _1926);
            float _1932 = _1930 * _1928;
            float _1934 = fma(_172, _1932, _1796);
            float _1936 = fma(_174, _1932, _1794);
            float _1938 = fma(_176, _1932, _1798);
            _1870 = _1936;
            _1888 = _1938;
            _1872 = _1934;
            _1874 = _1926;
            _1878 = _1916;
            _1880 = _1928;
        }
    }
    float _1940 = _1870;
    float _1942 = _1888;
    float _1944 = _1872;
    float _1946 = _1874;
    float _1948 = _1876;
    float _1950 = _1878;
    float _1952 = _1880;
    float _1954 = _1950;
    float _1956 = _1944;
    float _1958 = _1942;
    float _1960 = _1952;
    float _1962 = _1946;
    float _1964 = _1948;
    if (_1864)
    {
        _1954 = 1.0;
    }
    float _1966 = _1954;
    float _1968 = _1966;
    if (_1842)
    {
        _1882 = _1940;
    }
    float _1970 = _1882;
    float _1972 = _1970;
    if (_1842)
    {
        _180 = _1942;
    }
    float _1974 = _180;
    float _1976 = _1974;
    if (!_1842)
    {
        float _1978 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1980 = _1440 + _1978;
        float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1984 = _1448 + _1982;
        float _1986 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1988 = -_1448;
        float _1990 = _1988 + _1944;
        float _1992 = _1980 * _1980;
        float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1996 = _1122 + _1994;
        float _1998 = -_1122;
        float _2000 = _1998 + _1942;
        float _2002 = fma(_1984, _1984, _1992);
        float _2004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2006 = fma(_1996, _1996, _2002);
        float _2008 = sqrt(_2006);
        float _2010 = _1986 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2012 = precise::min(_2008, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2014 = _2012 * _2004;
        float _2016 = _2010 * _2014;
        float _2018 = -_1440;
        float _2020 = _2018 + _1940;
        float _2022 = fma(_1990, _2016, _1448);
        float _2024 = fma(_2020, _2016, _1440);
        float _2026 = fma(_2000, _2016, _1122);
        _182 = _1986;
        _1972 = _2024;
        _1956 = _2022;
        _1976 = _2026;
        _1958 = _2000;
    }
    float _2028 = _182;
    float _2030 = _1972;
    float _2032 = _1956;
    float _2034 = _1976;
    float _2036 = _1958;
    float _2038 = _2028;
    if (_1864)
    {
        _1960 = 1.0;
    }
    float _2040 = _1960;
    float _2042 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2044 = _1866 * _2042;
    float _2046 = _2040;
    if (!_1864)
    {
        float _2048 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2050 = _2048 * 0.15915493667125701904296875;
        float _2052 = _2050 * 6.283185482025146484375;
        float _2054 = cos(_2052);
        float _2056 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2058 = _2056 * 0.15915493667125701904296875;
        float _2060 = _2050 * 6.283185482025146484375;
        float _2062 = sin(_2060);
        float _2064 = 1.0 / _2054;
        float _2066 = _2058 * 6.283185482025146484375;
        float _2068 = cos(_2066);
        float _2070 = _2062 * _2064;
        float _2072 = _2058 * 6.283185482025146484375;
        float _2074 = sin(_2072);
        float _2076 = _2068 * _2070;
        float _2078 = 1.0 / _2076;
        float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2082 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2080;
        float _2084 = 1.0 / _2082;
        float _2086 = _2074 * _2078;
        float _2088 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2090 = fma(_2044, _2086, _2088);
        float _2092 = _2090 * _2084;
        float _2094 = precise::clamp(_2092, 0.0, 1.0);
        _2038 = _2084;
        _1968 = _2094;
    }
    float _2096 = _2038;
    float _2098 = _1968;
    float _2100 = _2096;
    if (!_1864)
    {
        float _2102 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2104 = _2102 * 0.15915493667125701904296875;
        float _2106 = _2104 * 6.283185482025146484375;
        float _2108 = cos(_2106);
        float _2110 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2112 = _2110 * 0.15915493667125701904296875;
        float _2114 = _2104 * 6.283185482025146484375;
        float _2116 = sin(_2114);
        float _2118 = 1.0 / _2108;
        float _2120 = _2112 * 6.283185482025146484375;
        float _2122 = cos(_2120);
        float _2124 = _2116 * _2118;
        float _2126 = _2112 * 6.283185482025146484375;
        float _2128 = sin(_2126);
        float _2130 = _2122 * _2124;
        float _2132 = 1.0 / _2130;
        float _2134 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2136 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2134;
        float _2138 = 1.0 / _2136;
        float _2140 = _2128 * _2132;
        float _2142 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2144 = fma(_2044, _2140, _2142);
        float _2146 = _2144 * _2138;
        float _2148 = precise::clamp(_2146, 0.0, 1.0);
        float _2150 = -_2148;
        float _2152 = _2150 + 1.0;
        _2100 = _2118;
        _1962 = _2132;
        _2046 = _2152;
    }
    float _2154 = _2100;
    float _2156 = _1962;
    float _2158 = _2046;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2162 = _2030 + _2160;
    float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2166 = _2032 + _2164;
    float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2170 = _2034 + _2168;
    float _2172 = _2162 * _2162;
    float _2174 = fma(_2166, _2166, _2172);
    float _2176 = fma(_2170, _2170, _2174);
    float _2178 = rsqrt(_2176);
    float _2180 = sqrt(_2176);
    float _2182 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2184 = _2166 * _2182;
    float _2186 = _2170 * _2182;
    float _2188 = _2184 * _2184;
    float _2190 = _2186 * _2186;
    float _2192 = _2188 + _2190;
    float _2194 = sqrt(_2192);
    bool _2196 = _2194 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2200 = _2194 + _2198;
    float _2202 = _2154;
    float _2204 = _2192;
    float _2206 = _2200;
    float _2208 = _2162;
    float _2210 = _2186;
    float _2212 = _2188;
    float _2214 = _2190;
    if (_2196)
    {
        float _2216 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2202 = _2216;
    }
    float _2218 = _2202;
    if (_2196)
    {
        float _2220 = rsqrt(_2192);
        _2204 = _2220;
    }
    float _2222 = _2204;
    if (_2196)
    {
        float _2224 = _2200 * _2218;
        _2206 = _2224;
    }
    float _2226 = _2206;
    if (_2196)
    {
        float _2228 = _2226 * 0.15915493667125701904296875;
        _1964 = _2228;
    }
    float _2230 = _1964;
    float _2232 = _2156;
    if (_2196)
    {
        float _2234 = _2230 * 6.283185482025146484375;
        float _2236 = sin(_2234);
        _2232 = _2236;
    }
    float _2238 = _2232;
    float _2240 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2242 = precise::max(0.0, _2240);
    float _2244 = _2036;
    float _2246 = _2240;
    float _2248 = _2242;
    if (_2196)
    {
        float _2250 = _2230 * 6.283185482025146484375;
        float _2252 = cos(_2250);
        _2244 = _2252;
    }
    float _2254 = _2244;
    float _2256 = -_2182;
    float _2258 = -_2242;
    float _2260 = fma(_2162, _2256, _2258);
    if (!_2196)
    {
        _2208 = _2184;
    }
    float _2262 = _2208;
    float _2264 = _2262;
    if (_2196)
    {
        float _2266 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2246 = _2266;
    }
    float _2268 = _2246;
    float _2270 = _2238;
    float _2272 = _2268;
    if (_2196)
    {
        float _2274 = fma(_2238, _2268, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2270 = _2274;
    }
    float _2276 = _2270;
    if (!_2196)
    {
        _2272 = _2260;
    }
    float _2278 = _2272;
    float _2280 = _2278;
    if (_2196)
    {
        float _2282 = _2254 + (-1.0);
        _2248 = _2282;
    }
    float _2284 = _2248;
    float _2286 = _2284;
    if (_2196)
    {
        float _2288 = _2222 * _2276;
        _1742 = _2288;
    }
    float _2290 = _1742;
    float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2294 = fma(_2180, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2292);
    float _2296 = precise::clamp(_2294, 0.0, 1.0);
    if (_2196)
    {
        float _2298 = _2284 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2286 = _2298;
    }
    float _2300 = _2286;
    if (_2196)
    {
        float _2302 = _2184 * _2290;
        _2264 = _2302;
    }
    float _2304 = _2264;
    if (_2196)
    {
        float _2306 = _2186 * _2290;
        _2210 = _2306;
    }
    float _2308 = _2210;
    float _2310 = -_2296;
    float _2312 = _2310 + 1.0;
    if (_2196)
    {
        float _2314 = fma(_2260, _2254, _2300);
        _2280 = _2314;
    }
    float _2316 = _2280;
    if (_2196)
    {
        float _2318 = _2304 * _2304;
        _2212 = _2318;
    }
    float _2320 = _2212;
    if (_2196)
    {
        float _2322 = _2308 * _2308;
        _2214 = _2322;
    }
    float _2324 = _2214;
    float _2326 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2328 = abs(_2312);
    float _2330 = log2(_2328);
    float _2332 = fma(_2316, _2316, _2320);
    float _2334 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2336 = _2332 + _2324;
    float _2338 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2340 = rsqrt(_2336);
    float _2342 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2338);
    float _2344 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2346 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2342);
    float _2348 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2326);
    float _2350 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2352 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2344);
    float _2354 = _2346 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2356 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2348);
    float _2358 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2350);
    float _2360 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2352);
    float _2362 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2364 = _2356 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2366 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2358);
    float _2368 = _2340 * _2304;
    float _2370 = _2360 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2372 = _2364 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2374 = _2340 * _2316;
    float _2376 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2378 = _2340 * _2308;
    float _2380 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2372);
    float _2382 = _2366 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2384 = -_2376;
    float _2386 = fma(_2374, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2384);
    float _2388 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2390 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2380);
    float _2392 = exp2(_2362);
    float _2394 = -_2378;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2386);
    float _2398 = -_2388;
    float _2400 = fma(_2398, _2334, 1.0);
    float _2402 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2390);
    float _2404 = _2364 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2406 = fma(_2396, -0.5, 0.5);
    float _2408 = _2364 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2410 = fma(_2396, 0.5, 0.5);
    float _2412 = 1.0 / _2402;
    float _2414 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2404);
    float _2416 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2408);
    float _2418 = fma(_2410, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2420 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2414);
    float _2422 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2416);
    float _2424 = fma(_2410, _2418, -0.212114393711090087890625);
    float _2426 = log2(_2400);
    float _2428 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2422);
    float _2430 = fma(_2410, _2424, 1.570728778839111328125);
    float _2432 = sqrt(_2406);
    float _2434 = _2374 + 1.0;
    float _2436 = -_2374;
    float _2438 = fma(_2392, _2434, _2436);
    float _2440 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2420);
    float _2442 = _2428 * _2412;
    float _2444 = _2426 * 0.693147182464599609375;
    float _2446 = _2440 * _2412;
    float _2448 = fma(_2442, -0.5, 0.5);
    float _2450 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2452 = fma(_2446, 0.5, 0.5);
    float _2454 = fma(_2438, 0.5, 0.5);
    float _2456 = _2432 * 0.636619746685028076171875;
    float _2458 = -_2430;
    float _2460 = fma(_2456, _2458, 1.0);
    float3 _7053 = float3(_2452, _2448, _2450);
    float _2462 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7053, float3(0.0), isnan(_7053)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7053, float3(0.0), isnan(_7053)), level(0.0)).x;
    float3 _7064 = float3(_2452, _2448, _2450);
    float4 _2465 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7064, float3(0.0), isnan(_7064)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7064, float3(0.0), isnan(_7064)), level(0.0)).xyzw;
    float _2467 = _2465.x;
    float _2469 = _2465.y;
    float _2471 = _2465.z;
    float _2473 = _2465.w;
    float2 _7081 = float2(_2460, _2454);
    float3 _2477 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7081, float2(0.0), isnan(_7081)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7081, float2(0.0), isnan(_7081)), level(0.0)).xyz;
    float _2479 = _2477.x;
    float _2481 = _2477.y;
    float _2483 = _2477.z;
    float _2485 = float(uint(_1270));
    float _2487 = trunc(_1376);
    int _2489 = int(_2487);
    int _2491 = ~_1270;
    int _2493 = _2491 + 1;
    out.m_61.x = _714;
    out.m_61.y = _716;
    out.m_61.z = _718;
    out.m_61.w = _722;
    int _2495 = abs(_1294);
    float _2497 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2499 = abs(_1300);
    float _2501 = _2364 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2503 = _1042 > 0.5;
    float _2505 = 1.0 / _2485;
    float _2507 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2501);
    bool _2509 = !_1038;
    float _2511 = _2509 ? 7.345489978790283203125 : 1.0;
    float _2513 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2507);
    float _2515 = float(uint(_2489));
    float _2517 = exp2(_2497);
    float _2519 = _2511 * _1018;
    int _2521 = ~_1270;
    int _2523 = _2521 + 1;
    float _2525 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2513);
    int _2527 = as_type<int>(_2505) + (-2);
    out.gl_Position.x = _2440;
    out.gl_Position.y = _2428;
    out.gl_Position.z = _2525;
    out.gl_Position.w = _2402;
    float _2529 = as_type<float>(_2527) * _2515;
    float _2531 = trunc(_2529);
    float _2533 = precise::max(_2531, 0.0);
    uint _2536 = uint(_2533);
    float _2538 = -_2517;
    float _2540 = _2538 + 1.0;
    float _2542 = floor(_2519);
    int _2544 = _2493 * int(_2536);
    int _2546 = _2544 + _2489;
    float _2548 = float(uint(_2546));
    float _2550 = -_2542;
    float _2552 = _2519 + _2550;
    float _2554 = as_type<float>(_2527) * _2548;
    float _2556 = trunc(_2554);
    float _2558 = precise::max(_2556, 0.0);
    uint _2560 = uint(_2558);
    float _2562 = _1400 * _154;
    int _2564 = _1270 + (-1);
    float _2566 = trunc(_2562);
    int _2568 = int(_2566);
    int _2570 = int(_2536) + int(_2560);
    float _2572 = float(_2489);
    int _2574 = _2523 * _2570;
    int _2576 = _2574 + _2489;
    bool _2578 = _2572 >= _1388;
    bool _2580 = isnan(_2572);
    bool _2582 = _2578 || _2580;
    bool _2584 = isnan(_1388);
    bool _2586 = _2582 || _2584;
    float _2588 = float(_2586);
    bool _2590 = uint(_2576) >= uint(_1270);
    float _2592 = trunc(_2588);
    int _2594 = int(_2592);
    bool _2596 = !_2590;
    int _2598 = _2596 ? 0 : (-1);
    bool _2600 = _1270 == 0;
    int _2602 = ~_2570;
    int _2604 = _2602 + _2598;
    int _2606 = _2604 + 1;
    float _2608 = _2552 * _1388;
    int _2610 = _1270 * _2606;
    int _2612 = _2610 + _2489;
    int _2614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2616 = _2614 != 0;
    float _2618 = trunc(_2608);
    int _2620 = int(_2618);
    int _2622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2624 = _2622 != 0;
    int _2626 = ~_2594;
    int _2628 = _2626 + 1;
    int _2630 = _2628 + 1;
    bool _2632 = !_2600;
    int _2634 = _2632 ? _2612 : (-1);
    bool _2636 = !_2616;
    int _2638 = _2636 ? 0 : 1;
    int _2640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2642 = _2640 != 0;
    int _2644 = _2634 * _2630;
    int _2646 = abs(_2638);
    int _2648 = abs(_1306);
    int _2650 = _2594 * _2564;
    int _2652 = _2650 + _2644;
    bool _2654 = !_2642;
    int _2656 = _2654 ? 0 : 1;
    int _2658 = _2652 * _2495;
    int _2660 = _2620 * _2646;
    int _2662 = _2660 + _2489;
    int _2664 = abs(_2656);
    int _2666 = _2568 * _2499;
    int _2668 = _2666 + _2658;
    int _2670 = _2662 * _2648;
    int _2672 = _2670 + _2668;
    int _2674 = ~_1270;
    int _2676 = _2674 + 1;
    float _2678 = in.m_63.y;
    int _2680 = _2620 * _2664;
    int _2682 = _2680 + _2672;
    int _2684 = ~_1270;
    int _2686 = _2684 + 1;
    bool _2688 = _1024 > 0.5;
    float _2690 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2692 = _2690 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2694 = float(uint(_2682));
    float _2696 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2698 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2696;
    int _2700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2702 = _2700 != 0;
    int _2704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2706 = _2704 != 0;
    float _2708 = as_type<float>(_2527) * _2694;
    float _2710 = trunc(_2708);
    float _2712 = precise::max(_2710, 0.0);
    uint _2714 = uint(_2712);
    float _2716 = -_2678;
    float _2718 = _2716 + 1.0;
    int _2720 = _2686 * int(_2714);
    int _2722 = _2720 + _2682;
    float _2724 = float(uint(_2722));
    float _2726 = as_type<float>(_2527) * _2724;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2728 = trunc(_2726);
    float _2730 = precise::max(_2728, 0.0);
    uint _2732 = uint(_2730);
    float _2734 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2736 = _2734 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2738 = 1.0 / _2736;
    float _2740 = in.m_63.x;
    float _2742 = _2503 ? _2718 : _2678;
    float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2746 = _1016 + _2744;
    int _2748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2750 = _2748 != 0;
    int _2752 = int(_2714) + int(_2732);
    float _2754 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2756 = _2754 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2758 = _2676 * _2752;
    int _2760 = _2758 + _2682;
    float _2762 = 1.0 / _2756;
    float _2764 = _2698 * _2738;
    bool _2766 = uint(_2760) >= uint(_1270);
    bool _2768 = !_2766;
    int _2770 = _2768 ? 0 : (-1);
    float _2772 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2776 = _2774 != 0;
    float _2778 = float(uint(_2662));
    int _2780 = ~_2752;
    int _2782 = _2780 + _2770;
    int _2784 = _2782 + 1;
    int _2786 = _2776 ? as_type<int>(_2742) : as_type<int>(_2678);
    float _2788 = _2692 * _2762;
    float _2790 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2792 = _1016 + _2790;
    bool _2794 = _2776;
    float _2796 = _2678;
    float _2798 = _2746;
    float _2800 = _2742;
    int _2802 = _2786;
    int _2804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    if (_2624)
    {
        bool _2806 = _1018 > 0.5;
        _2794 = _2806;
    }
    bool _2808 = _2794;
    float _2810 = as_type<float>(_2527) * _2778;
    bool _2812 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2814 = isnan(_1016);
    bool _2816 = _2812 || _2814;
    bool _2818 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2820 = _2816 || _2818;
    float _2822 = float(_2820);
    float _2824 = fma(_2764, _2792, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2826 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2828 = isnan(_1016);
    bool _2830 = _2826 || _2828;
    bool _2832 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2834 = _2830 || _2832;
    float _2836 = float(_2834);
    int _2838 = _1270 * _2784;
    int _2840 = _2838 + _2682;
    bool _2842 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2844 = isnan(_1016);
    bool _2846 = _2842 || _2844;
    bool _2848 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2850 = _2846 || _2848;
    float _2852 = float(_2850);
    float _2854 = fma(_2788, _2746, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2856 = trunc(_2810);
    float _2858 = precise::max(_2856, 0.0);
    uint _2860 = uint(_2858);
    float _2862 = -_2836;
    float _2864 = _2862 + 1.0;
    if (_2750)
    {
        float _2866 = _2688 ? _2718 : _2678;
        _2796 = _2866;
    }
    float _2868 = _2796;
    float _2870 = _2772 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2872 = _2868;
    if (!_2624)
    {
        _2798 = _2740;
    }
    float _2874 = _2798;
    float _2876 = _2822 * _2864;
    float _2878 = -_2822;
    float _2880 = _2878 + 1.0;
    bool _2882 = !_2600;
    int _2884 = _2882 ? _2840 : (-1);
    float _2886 = fma(as_type<float>(_2786), _2870, -0.5);
    float _2888 = _2874;
    if (!_2624)
    {
        _2800 = _2874;
    }
    float _2890 = _2800;
    float _2892 = _2852 * _2880;
    int _2894 = _2884 >> 31;
    float _2896 = -_2852;
    float _2898 = _2896 + 1.0;
    float _2900 = _2890;
    if (_2624)
    {
        _2888 = _2740;
    }
    float _2902 = _2888;
    float _2904 = _2824 * _2892;
    int _2906 = _2894 & 3;
    float _2908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2910 = ~_1270;
    int _2912 = _2910 + 1;
    if (_2624)
    {
        float _2914 = -_2902;
        float _2916 = _2914 + 1.0;
        _2802 = as_type<int>(_2916);
    }
    int _2918 = _2802;
    int _2920 = _2884 + _2906;
    if (_2702)
    {
        float _2922 = -_2902;
        float _2924 = _2922 + 1.0;
        _2804 = as_type<int>(_2924);
    }
    int _2926 = _2804;
    int _2928 = _2912 * int(_2860);
    int _2930 = _2928 + _2662;
    if (_2624)
    {
        float _2932 = _2808 ? as_type<float>(_2918) : _2902;
        _2900 = _2932;
    }
    float _2934 = _2900;
    float _2936 = fma(_2898, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2904);
    int _2938 = _2920 >> 2;
    float _2940 = -_1372;
    float _2942 = fma(_1218, _2886, _2940);
    float _2944 = float(uint(_2930));
    float _2946 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2868, -0.5);
    int _2948 = _2938 << 4;
    int _2950 = _2948 + 368;
    float _2952 = fma(_2854, _2876, _2936);
    if (!_2702)
    {
        _2872 = _2902;
    }
    float _2954 = _2872;
    float _2956 = as_type<float>(_2527) * _2944;
    float _2958 = _2954;
    if (_2702)
    {
        float _2960 = _2688 ? as_type<float>(_2926) : _2902;
        _2958 = _2960;
    }
    float _2962 = _2958;
    int _2964 = _2950 + 8;
    uint _2966 = uint(int(uint(_2964) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c9)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c9)._m0[int(_2976)][_2978];
    float _2982 = -_1120;
    float _2984 = fma(_1296, _2946, _2982);
    int _2986 = _2884 & 3;
    bool _2988 = _2986 != 0;
    float _2990 = trunc(_2956);
    float _2992 = precise::max(_2990, 0.0);
    uint _2994 = uint(_2992);
    float _2996 = _2908 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2998 = fma(_2934, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3000 = fma(_2836, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2952);
    uint _3002 = uint(int(uint(_2950) >> uint(2)));
    uint _3004 = uint(int(uint(int(_3002)) >> uint(2)));
    int _3006 = int(_3002) & 3;
    float _3008 = (*spvDescriptorSet0.vp_c9)._m0[int(_3004)][_3006];
    int _3010 = int(_3002) + 1;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    int _3014 = _3010 & 3;
    float _3016 = (*spvDescriptorSet0.vp_c9)._m0[int(_3012)][_3014];
    float _3018 = _988 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3020 = fma(_1386, _2998, _1290);
    int _3022 = _2884 & 3;
    bool _3024 = _3022 != 0;
    float _3026 = fma(_2996, _2962, -0.5);
    int _3028 = _2988 ? 0 : 1;
    float _3030 = _992 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3032 = uint(_3022) > 1u;
    float _3034 = fma(_1236, _3026, _1310);
    bool _3036 = _3022 != 3;
    float _3038 = _3018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3040 = uint(_3022) >= 2u;
    float _3042 = _3030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3044 = int(_2860) + int(_2994);
    float _3046 = _990 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3048 = ~_3028;
    int _3050 = _3048 + 1;
    int _3052 = _3050 + 1;
    float _3054 = _3000 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3056 = _3040 ? 0 : 1;
    float _3058 = _3046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3060 = !_3024;
    int _3062 = _3060 ? 0 : 1;
    float _3064 = _2984 + 0.5;
    int _3066 = _3052;
    if (!_3032)
    {
        int _3068 = ~_3028;
        int _3070 = _3068 + 1;
        _3066 = _3070;
    }
    int _3072 = _3066;
    float _3074 = _3020 + 0.5;
    bool _3076 = _3022 != 3;
    out.m_67.x = _3038;
    out.m_67.y = _3058;
    out.m_67.z = _3042;
    out.m_67.w = _3054;
    int _3078 = abs(_3072);
    float _3080 = _2942 + 0.5;
    int _3082 = ~_3056;
    int _3084 = _3082 + 1;
    int _3086 = _3084 + 1;
    float _3088 = _3034 + 0.5;
    int _3090 = abs(_3062);
    out.m_69.x = _3074;
    out.m_69.y = _3064;
    int _3092 = _3086;
    if (_3036)
    {
        int _3094 = ~_3056;
        int _3096 = _3094 + 1;
        _3092 = _3096;
    }
    int _3098 = _3092;
    out.m_71.x = _3088;
    out.m_71.y = _3080;
    int _3100 = ~_1270;
    int _3102 = _3100 + 1;
    int _3104 = abs(_3098);
    bool _3106 = !_3076;
    int _3108 = _3106 ? 0 : (-1);
    int _3110 = _3102 * _3044;
    int _3112 = _3110 + _2662;
    int _3114 = ~_3078;
    int _3116 = _3114 + 1;
    int _3118 = _3116 + 1;
    int _3120 = abs(_3108);
    bool _3122 = !_2706;
    int _3124 = _3122 ? 0 : 1;
    int _3126 = _3118 * as_type<int>(_3016);
    int _3128 = ~_3090;
    int _3130 = _3128 + 1;
    int _3132 = _3130 + 1;
    int _3134 = abs(_3124);
    int _3136 = _3132 * as_type<int>(_3008);
    int _3138 = _3136 + _3126;
    int _3140 = ~_3104;
    int _3142 = _3140 + 1;
    int _3144 = _3142 + 1;
    bool _3146 = uint(_3112) >= uint(_1270);
    int _3148 = ~_3120;
    int _3150 = _3148 + 1;
    int _3152 = _3150 + 1;
    int _3154 = _3144 * as_type<int>(_2972);
    int _3156 = _3154 + _3138;
    bool _3158 = !_3146;
    int _3160 = _3158 ? 0 : (-1);
    int _3162 = _3152 * as_type<int>(_2980);
    int _3164 = _3162 + _3156;
    int _3166 = ~_3044;
    int _3168 = _3166 + _3160;
    int _3170 = _3168 + 1;
    float _3172 = _2098 * _2158;
    int _3174 = ~_3134;
    int _3176 = _3174 + 1;
    int _3178 = _3176 + 1;
    float _3180 = _3172 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _3182 = _1270 * _3170;
    int _3184 = _3182 + _2662;
    int _3186 = _3164 * _3178;
    float _3188 = _3180 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3190 = _2525 + _2402;
    bool _3192 = !_2600;
    int _3194 = _3192 ? _3184 : (-1);
    bool _3196 = _2098 > 0.0;
    bool _3198 = isnan(_2098);
    bool _3200 = _3196 || _3198;
    bool _3202 = isnan(0.0);
    bool _3204 = _3200 || _3202;
    float _3206 = _3190 * 0.5;
    float _3208 = _2540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _3210 = _3194 * _3134;
    int _3212 = _3210 + _3186;
    bool _3214 = _2158 <= 0.0;
    bool _3216 = !_3204;
    bool _3218 = _3214 || _3216;
    out.m_49.x = _3188;
    float _3220 = _3208 * _2462;
    float _3222 = -_3208;
    float _3224 = _3222 + 1.0;
    float _3226 = float(_3212);
    float _3228 = _2473 * _3220;
    float _3230 = _2483 * _3220;
    out.m_73.x = _3226;
    float _3232 = fma(_2479, _3228, _2467);
    float _3234 = fma(_2481, _3228, _2469);
    float _3236 = _2473 * _3224;
    float _3238 = fma(_2473, _3230, _2471);
    out.m_75.z = _3206;
    out.m_75.w = _2402;
    out.m_77.x = _3232;
    out.m_77.y = _3234;
    out.m_77.z = _3238;
    out.m_77.w = _3236;
    if (!_3218)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3240 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3240;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

