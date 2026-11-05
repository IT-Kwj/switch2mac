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
    float4 m_59 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1730 = false;
    bool _266 = false;
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
        float _2288 = as_type<float>(_114);
        out.gl_Position.z = _2288;
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
    float _134 = 0.0;
    float _136 = _132;
    if (_128)
    {
        float _138 = float(_98);
        _134 = _138;
    }
    float _140 = _134;
    bool _142 = _132 >= _140;
    bool _144 = !_128;
    bool _146 = _142 || _144;
    if (_146)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _108;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2357 = as_type<float>(_152);
        out.gl_Position.z = _2357;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_51.x;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _132 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _162 = _160 != 0;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _166 = _164 != 0;
    int _168 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _170 = _168 != 0;
    float _172 = _158 * _156;
    float _174 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    float _176 = _174 * 6.283185482025146484375;
    float _178 = floor(_174);
    float _180 = _176 * 0.15915493667125701904296875;
    bool _182 = !_162;
    int _184 = _182 ? 0 : 1;
    int _186 = abs(_184);
    float _188 = _180 * 6.283185482025146484375;
    float _190 = cos(_188);
    bool _192 = !_170;
    int _194 = _192 ? 0 : 1;
    bool _196 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _198 = abs(_194);
    float _200 = -_178;
    float _202 = _174 + _200;
    bool _204 = !_166;
    int _206 = _204 ? 0 : 1;
    float _208 = float(_186);
    int _210 = abs(_206);
    float _212 = -_202;
    float _214 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _216 = fma(_190, 0.5, 0.5);
    bool _218 = _202 < 0.5;
    float _220 = float(_218);
    float _222 = abs(_214);
    float _224 = _208 * _222;
    float _226 = float(_198);
    float _228 = -_216;
    float _230 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _232 = -_220;
    float _234 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _236 = float(_210);
    float _238 = fma(_226, _230, _224);
    float _240 = abs(_234);
    float _242 = fma(_236, _240, _238);
    bool _244 = !_196;
    bool _246 = _166;
    float _248 = as_type<float>(_198);
    float _264;
    if (!_244)
    {
        float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _252 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _254 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _256 = _254 * _250;
        float _258 = floor(_256);
        float _260 = -_258;
        float _262 = _256 + _260;
        _264 = _262;
        _266 = true;
    }
    else
    {
        float _268 = float(_98);
        float _270 = 1.0 / _268;
        float _272 = _132 * _270;
        _264 = _272;
    }
    _266 = false;
    float _274 = _264;
    float _276 = in.m_53.x;
    float _278 = in.m_53.y;
    float _280 = _154 * 2.0;
    float _282 = in.m_55.x;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _286 = _284 != 0;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _290 = _274 + _288;
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _294 = _292 != 0;
    float _296 = in.m_44.x;
    float _298 = in.m_44.y;
    float _300 = in.m_44.z;
    float _302 = floor(_280);
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _306 = _304 != 0;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _308;
    float _312 = in.m_51.w;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _316 = _314 != 0;
    float _318 = in.m_51.y;
    float _320 = 1.0 / _310;
    if (_286)
    {
        bool _322 = _154 > 0.5;
        _246 = _322;
    }
    bool _324 = _246;
    float _326 = 0.0;
    if (_294)
    {
        float _328 = in.m_51.z;
        _326 = _328;
    }
    float _330 = _326;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _334 = in.m_51.z;
    float _336 = abs(_276);
    float _338 = abs(_278);
    float _340 = precise::max(_336, _338);
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _344 = 0;
    if (_286)
    {
        float _346 = -_282;
        float _348 = _346 + 1.0;
        _344 = as_type<int>(_348);
    }
    int _350 = _344;
    if (!_286)
    {
        _248 = _282;
    }
    float _352 = _248;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _356 = _340 >= 16.0;
    float _358 = _298 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _360 = _352;
    if (_286)
    {
        float _362 = _324 ? as_type<float>(_350) : _282;
        _360 = _362;
    }
    float _364 = _360;
    float _366 = in.m_55.y;
    float _368 = _298 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _370 = _298 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _372 = _302 > 0.0;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _376 = _302 >= 0.0;
    bool _378 = isnan(_302);
    bool _380 = _376 || _378;
    bool _382 = isnan(0.0);
    bool _384 = _380 || _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _390;
    bool _394 = _312 > 0.5;
    float _396 = _318 * 2.0;
    float _398 = 1.0 / _392;
    float _400 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _368);
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _406 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _370);
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _410 = 1.0 / _388;
    float _412 = _402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _414 = _404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _416 = _332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _358);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _422 = _274 + _420;
    float _424 = -_366;
    float _426 = _424 + 1.0;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _430 = floor(_396);
    float _432 = _342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = _354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _436 = _374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _438 = _422 * _398;
    out.m_57.x = _412;
    out.m_57.y = _414;
    out.m_57.z = _416;
    out.m_57.w = _408;
    float _440 = _154 + _318;
    float _442 = _290 * _410;
    int _444 = _394 ? as_type<int>(_426) : as_type<int>(_366);
    out.m_59.x = _432;
    out.m_59.y = _434;
    out.m_59.z = _436;
    out.m_59.w = _428;
    bool _446 = _394;
    int _448 = as_type<int>(_408);
    float _450 = _440;
    float _452 = _366;
    bool _454 = _372;
    if (_294)
    {
        bool _456 = _330 > 0.5;
        _446 = _456;
    }
    bool _458 = _446;
    float _460 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _418);
    int _462 = _306 ? _444 : as_type<int>(_366);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _466 = _274 + _464;
    bool _468 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _470 = isnan(_274);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = _276 * 0.0625;
    bool _482 = _430 > 0.0;
    float _484 = _466 * _320;
    int _486 = _462;
    if (_294)
    {
        float _488 = -_282;
        float _490 = _488 + 1.0;
        _448 = as_type<int>(_490);
    }
    int _492 = _448;
    float _494 = _154 + _334;
    float _496 = _334 * 2.0;
    float _498 = _318 + _334;
    float _500 = _440 + (-1.0);
    float _502 = _494 + (-1.0);
    if (!_294)
    {
        _450 = _282;
    }
    float _504 = _450;
    float _506 = floor(_496);
    float _508 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _510 = _504;
    if (_294)
    {
        float _512 = _458 ? as_type<float>(_492) : _282;
        _510 = _512;
    }
    float _514 = _510;
    float _516 = _498 + (-1.0);
    bool _518 = _318 > 0.5;
    float _520 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _522 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _524 = isnan(_274);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _400);
    if (_316)
    {
        float _536 = _518 ? _426 : _366;
        _452 = _536;
    }
    float _538 = _452;
    float _540 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _542 = _430 >= 0.0;
    bool _544 = isnan(_430);
    bool _546 = _542 || _544;
    bool _548 = isnan(0.0);
    bool _550 = _546 || _548;
    float _552 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _406);
    float _554 = -_532;
    float _556 = _554 + 1.0;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _562;
    bool _566 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _568 = isnan(_274);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _594 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _596 = isnan(_274);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -_576;
    float _608 = _606 + 1.0;
    float _610 = _576 * _556;
    float _612 = _278 * 0.0625;
    float _614 = fma(_584, _442, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _616 = fma(_588, _442, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _618 = fma(_592, _442, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _620 = _604 * _608;
    float _622 = -_604;
    float _624 = _622 + 1.0;
    bool _626 = _506 > 0.0;
    float _628 = fma(_564, _438, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _630 = _506 >= 0.0;
    bool _632 = isnan(_506);
    bool _634 = _630 || _632;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _640;
    float _644 = _356 ? _612 : _278;
    float _646 = _478 * _624;
    float _648 = _356 ? _480 : _276;
    float _650 = fma(_580, _438, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _652 = fma(_642, _438, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _654 = abs(_644);
    bool _656 = _654 != 0.0;
    bool _658 = isnan(_654);
    bool _660 = _656 || _658;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    float _666 = fma(_560, _484, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _670 = _628 * _646;
    int _672 = _384 ? 0 : 1;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _674;
    float _678 = abs(_648);
    bool _680 = _678 == 0.0;
    bool _682 = !_664;
    bool _684 = _680 && _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _686;
    int _690 = ~_672;
    int _692 = _690 + 1;
    int _694 = _692 + 1;
    float _696 = fma(_676, _484, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _698 = _694;
    int _700 = as_type<int>(_670);
    if (!_372)
    {
        int _702 = ~_672;
        int _704 = _702 + 1;
        _698 = _704;
    }
    int _706 = _698;
    float _708 = fma(_688, _484, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _710 = _638 ? 0 : 1;
    float _712 = _652 * _646;
    float _714 = abs(_648);
    bool _716 = _714 == 0.0;
    float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _720 = _650 * _646;
    float _722 = -_478;
    float _724 = _722 + 1.0;
    int _726 = _550 ? 0 : 1;
    float _728 = _538 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_684)
    {
        bool _730 = as_type<int>(_648) >= 0;
        _454 = _730;
    }
    bool _732 = _454;
    float _734 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[143].x, _670);
    int _736 = ~_710;
    int _738 = _736 + 1;
    int _740 = _738 + 1;
    float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _744 = _740;
    int _746 = _732 ? (-1) : 0;
    if (_684)
    {
        int _748 = _732 ? 0 : 1078530011;
        _700 = _748;
    }
    int _750 = _700;
    float _752 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[143].y, _720);
    if (!_626)
    {
        int _754 = ~_710;
        int _756 = _754 + 1;
        _744 = _756;
    }
    int _758 = _744;
    float _760 = as_type<float>(_462) * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _762 = ~_726;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    float _768 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[143].z, _712);
    int _770 = _766;
    if (!_482)
    {
        int _772 = ~_726;
        int _774 = _772 + 1;
        _770 = _774;
    }
    int _776 = _770;
    float _778 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _780 = log2(_778);
    if (_684)
    {
        int _782 = int(0x80000000) & as_type<int>(_644);
        int _784 = _750 | _782;
        _486 = _784;
    }
    int _786 = _486;
    bool _788 = !_664;
    bool _790 = _788 && _716;
    int _792 = _786;
    float _794 = as_type<float>(_786);
    if (!_790)
    {
        float _796 = abs(_644);
        bool _798 = _796 != as_type<float>(0x7f800000u /* inf */);
        bool _800 = isnan(_796);
        bool _802 = _798 || _800;
        bool _804 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _806 = _802 || _804;
        float _808 = abs(_648);
        bool _810 = _808 == as_type<float>(0x7f800000u /* inf */);
        float _812 = abs(_648);
        bool _814 = _812 == as_type<float>(0x7f800000u /* inf */);
        bool _816 = !_806;
        bool _818 = _814 && _816;
        if (_818)
        {
            bool _820 = as_type<int>(_648) >= 0;
            _746 = _820 ? (-1) : 0;
        }
        int _822 = _746;
        if (_818)
        {
            _792 = 1075235812;
        }
        int _824 = _792;
        int _826 = _824;
        if (_818)
        {
            int _828 = ~_822;
            int _830 = (_828 != 0) ? _824 : 1061752795;
            _826 = _830;
        }
        int _832 = _826;
        float _834 = as_type<float>(_832);
        if (_818)
        {
            int _836 = int(0x80000000) & as_type<int>(_644);
            int _838 = _832 | _836;
            _834 = as_type<float>(_838);
        }
        float _840 = _834;
        bool _842 = !_806;
        bool _844 = _842 && _810;
        _794 = _840;
        if (!_844)
        {
            float _846 = abs(_644);
            float _848 = abs(_648);
            float _850 = precise::max(_846, _848);
            float _852 = abs(_644);
            float _854 = abs(_648);
            float _856 = precise::min(_852, _854);
            float _858 = 1.0 / _850;
            float _860 = abs(_644);
            float _862 = abs(_648);
            bool _864 = _860 > _862;
            bool _866 = as_type<int>(_648) >= 0;
            float _868 = abs(_644);
            float _870 = abs(_648);
            float _872 = _868 + _870;
            int _874 = as_type<int>(_644) & int(0x80000000);
            bool _876 = _872 > as_type<float>(0x7f800000u /* inf */);
            bool _878 = isnan(_872);
            bool _880 = _876 || _878;
            bool _882 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _884 = _880 || _882;
            float _886 = _856 * _858;
            float _888 = _886 * _886;
            float _890 = _888 + 11.33538818359375;
            float _892 = fma(_888, _890, 28.84246826171875);
            float _894 = fma(_888, _892, 19.6966705322265625);
            float _896 = fma(_888, -0.82336294651031494140625, -5.674867153167724609375);
            float _898 = fma(_888, _896, -6.565555095672607421875);
            float _900 = 1.0 / _894;
            float _902 = _888 * _898;
            float _904 = _886 * _902;
            float _906 = fma(_904, _900, _886);
            float _908 = _906;
            _794 = _872;
            if (_864)
            {
                float _910 = -_906;
                float _912 = _910 + 1.57079637050628662109375;
                _908 = _912;
            }
            float _914 = _908;
            int _916 = as_type<int>(_914);
            if (!_866)
            {
                float _918 = -_914;
                float _920 = _918 + 3.1415927410125732421875;
                _916 = as_type<int>(_920);
            }
            int _922 = _916;
            if (!_884)
            {
                int _924 = _874 | _922;
                _794 = as_type<float>(_924);
            }
        }
    }
    float _926 = _794;
    float _928 = _534 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _930 = _728 * _718;
    float _932 = _460 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _934 = _552 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _938 = _928 + _936;
    float _940 = _760 * _742;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _944 = _932 + _942;
    float _946 = _780 * _132;
    float _948 = _938 * _938;
    float _950 = _364 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _954 = _934 + _952;
    float _956 = _938 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _958 = fma(_944, _944, _948);
    float _960 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _962 = _950 * _668;
    float _964 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[28].x, _956);
    float _966 = fma(_954, _954, _958);
    float _968 = _514 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _970 = precise::max(_926, -3.1415927410125732421875);
    float _972 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[28].z, _964);
    float _974 = exp2(_946);
    float _976 = precise::min(_970, 3.1415927410125732421875);
    float _978 = _318 + (-0.5);
    bool _980 = _972 >= 0.0;
    float _982 = float(_706);
    float _984 = fma(_976, 0.15915493667125701904296875, 0.5);
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _988 = _986 != 0;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _992 = _990 != 0;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _996 = _994 != 0;
    float _998 = rsqrt(_966);
    float _1000 = _968 * _960;
    float _1002 = in.m_61.x;
    float _1004 = in.m_61.y;
    float _1006 = in.m_61.z;
    bool _1008 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1010 = isnan(0.0);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1016 = _1012 || _1014;
    out.m_63.x = _962;
    out.m_63.y = _930;
    out.m_63.z = _1000;
    out.m_63.w = _940;
    bool _1018 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1020 = isnan(1.0);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1026 = _1022 || _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1030 = 1.0 + _1028;
    float _1032 = -_974;
    float _1034 = _1032 + 1.0;
    float _1036 = float(_776);
    float _1038 = _940;
    int _1040 = as_type<int>(_938);
    if (_980)
    {
        out.m_47.x = 0.0;
    }
    float _1042 = 1.0 / _1030;
    float _1044 = _1016 ? _1034 : 0.0;
    bool _1046 = !_992;
    int _1048 = _1046 ? 0 : 1;
    float _1050 = _938 * _998;
    if (_980)
    {
        _1038 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1052 = _1038;
    int _1054 = abs(_1048);
    float _1056 = -_1050;
    float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[18].w, _938);
    float _1060 = _944 * _998;
    if (_980)
    {
        float _1062 = _1052 * 5.0;
        _1040 = as_type<int>(_1062);
    }
    int _1064 = _1040;
    float _1066 = _1058 * _1058;
    float _1068 = -_1060;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[18].w, _944);
    float _1072 = float(_1054);
    if (_980)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3796 = as_type<float>(_1064);
        out.gl_Position.z = _3796;
    }
    float _1074 = fma(_1070, _1070, _1066);
    float _1076 = fma(_132, 0.06666667759418487548828125, _984);
    float _1078 = float(_758);
    float _1080 = _1072 * _982;
    bool _1082 = !_996;
    int _1084 = _1082 ? 0 : 1;
    if (_1026)
    {
        float _1086 = _1044 * _1042;
        _136 = _1086;
    }
    float _1088 = _136;
    bool _1090 = !_988;
    int _1092 = _1090 ? 0 : 1;
    int _1094 = abs(_1084);
    int _1096 = abs(_1092);
    float _1098 = _954 * _998;
    float _1100 = _1080 * (-2.0);
    float _1102 = -_1098;
    float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[18].w, _954);
    float _1106 = fma(_1100, _1004, _1004);
    float _1108 = float(_1094);
    float _1110 = fma(_540, _1100, _540);
    float _1112 = fma(_1104, _1104, _1074);
    float _1114 = float(_1096);
    float _1116 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1106);
    float _1118 = _1108 * _1036;
    float _1120 = _334 + (-0.5);
    float _1122 = sqrt(_1112);
    float _1124 = _1114 * _1078;
    float _1126 = fma(_1110, _1088, _1116);
    float _1128 = _1076 * 6.283185482025146484375;
    if (_980)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1130 = -_1050;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[18].w, _928);
    float _1134 = -_1060;
    float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[18].w, _932);
    float _1138 = _1118 * (-2.0);
    float _1140 = -_1098;
    float _1142 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[18].w, _934);
    float _1144 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1146 = _1132 + _1144;
    float _1148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1150 = _1136 + _1148;
    float _1152 = _1128 * 0.15915493667125701904296875;
    float _1154 = fma(_1138, _1006, _1006);
    float _1156 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1158 = _1126 * 0.15915493667125701904296875;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1162 = _1142 + _1160;
    float _1164 = fma(_520, _1138, _520);
    float _1166 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1156);
    float _1168 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1154);
    float _1170 = _1124 * (-2.0);
    float _1172 = _154 + (-0.5);
    float _1174 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1166);
    float _1176 = fma(_1164, _1088, _1168);
    float _1178 = fma(_1170, _1002, _1002);
    float _1180 = fma(_508, _1170, _508);
    float _1182 = fma(_614, _620, _734);
    bool _1184 = _1174 >= 0.0;
    float _1186 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1178);
    float _1188 = fma(_616, _620, _752);
    float _1190 = fma(_618, _620, _768);
    float _1192 = _1176 * 0.15915493667125701904296875;
    float _1194 = fma(_1180, _1088, _1186);
    float _1196 = in.m_65.x;
    float _1198 = in.m_65.y;
    float _1200 = in.m_65.z;
    float _1202 = fma(_696, _610, _1182);
    float _1204 = fma(_666, _610, _1188);
    float _1206 = fma(_708, _610, _1190);
    float _1208 = in.m_53.z;
    float _1210 = _1194 * 0.15915493667125701904296875;
    float _1212 = _1152 * 6.283185482025146484375;
    float _1214 = sin(_1212);
    float _1216 = _1174;
    float _1218 = _1136;
    if (_1184)
    {
        _1216 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1220 = _1216;
    int _1222 = as_type<int>(_1220);
    if (_1184)
    {
        out.m_47.x = 0.0;
    }
    float _1224 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1202);
    float _1226 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1204);
    if (_1184)
    {
        float _1228 = _1220 * 5.0;
        _1222 = as_type<int>(_1228);
    }
    int _1230 = _1222;
    float _1232 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1206);
    float _1234 = _1158 * 6.283185482025146484375;
    float _1236 = sin(_1234);
    if (_1184)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4071 = as_type<float>(_1230);
        out.gl_Position.z = _4071;
    }
    float _1238 = _1158 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = _1192 * 6.283185482025146484375;
    float _1244 = sin(_1242);
    float _1246 = _1192 * 6.283185482025146484375;
    float _1248 = cos(_1246);
    float _1250 = _1210 * 6.283185482025146484375;
    float _1252 = sin(_1250);
    if (_1184)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1254 = _1210 * 6.283185482025146484375;
    float _1256 = cos(_1254);
    float _1258 = _1226 * _1198;
    float _1260 = fma(_1214, 0.5, 1.5);
    float _1262 = _1240 * _1248;
    float _1264 = _1236 * _1244;
    float _1266 = _1232 * _1200;
    float _1268 = _1224 * _1196;
    float _1270 = _998 * _1122;
    float _1272 = _1260 * _278;
    float _1274 = fma(_1252, _1264, _1262);
    float _1276 = _1258 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1278 = fma(_1252, _1262, _1264);
    float _1280 = _1240 * _1244;
    float _1282 = _1236 * _1248;
    float _1284 = _1266 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1286 = _1260 * _276;
    float _1288 = _1248 * _1256;
    float _1290 = _1268 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1272);
    float _1294 = _1270 * _1276;
    float _1296 = _1244 * _1256;
    float _1298 = _1236 * _1256;
    float _1300 = _1260 * _1208;
    float _1302 = _1240 * _1256;
    float _1304 = -_1282;
    float _1306 = fma(_1252, _1280, _1304);
    float _1308 = _1270 * _1284;
    float _1310 = -_1280;
    float _1312 = fma(_1252, _1282, _1310);
    float _1314 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1316 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1286);
    float _1318 = _1270 * _1290;
    float _1320 = _1292 * _1294;
    float _1322 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1300);
    float _1324 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1314);
    float _1326 = _1316 * _1318;
    float _1328 = _1288 * _1320;
    float _1330 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1332 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1334 = _1322 * _1308;
    float _1336 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1338 = fma(_1296, _1326, _1328);
    float _1340 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1342 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1330);
    float _1344 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1332);
    float _1346 = _1312 * _1320;
    float _1348 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1336);
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1352 = _1252 * _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1356 = _1252 * _1354;
    float _1358 = -_1252;
    float _1360 = fma(_1358, _1334, _1338);
    float _1362 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1340);
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1366 = _1252 * _1364;
    float _1368 = _1278 * _1320;
    float _1370 = fma(_1274, _1326, _1346);
    float _1372 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1352);
    float _1374 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1366);
    float _1376 = fma(_1306, _1326, _1368);
    float _1378 = fma(_1298, _1334, _1370);
    float _1380 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1382 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1384 = fma(_1302, _1334, _1376);
    float _1386 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1356);
    float _1388 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1380);
    float _1390 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1382);
    float _1392 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1394 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1372);
    float _1396 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1388);
    float _1398 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1390);
    float _1400 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1386);
    float _1402 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1374);
    float _1404 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1406 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1408 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1392);
    float _1410 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1348);
    float _1412 = _932 + _1404;
    float _1414 = _934 + _1406;
    float _1416 = in.m_67.x;
    float _1418 = in.m_67.y;
    float _1420 = in.m_67.z;
    float _1422 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1362);
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1426 = _1412 + _1424;
    float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1430 = _1414 + _1428;
    bool _1432 = _1272 != 0.0;
    bool _1434 = isnan(_1272);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan(0.0);
    bool _1440 = _1436 || _1438;
    float _1442 = in.m_69.x;
    float _1444 = in.m_69.y;
    float _1446 = in.m_69.z;
    float _1448 = in.m_69.w;
    float _1450 = _1426 * _1426;
    float _1452 = _1430 * _1430;
    bool _1454 = _1286 == 0.0;
    bool _1456 = !_1440;
    bool _1458 = _1454 && _1456;
    float _1460 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1462 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1408);
    float _1464 = _1450 + _1452;
    bool _1466 = _1300 == 0.0;
    bool _1468 = _1466 && _1458;
    float _1470 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1324);
    float _1472 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1460);
    float _1474 = sqrt(_1464);
    float _1476 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1342);
    float _1478 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1344);
    float _1480 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1472);
    float _1482 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1484 = _1408;
    float _1486 = _1372;
    float _1488 = _1404;
    float _1490 = _1450;
    float _1492 = _1452;
    float _1494 = _1412;
    float _1496 = _1414;
    if (_1468)
    {
        _1484 = _1416;
    }
    float _1498 = _1484;
    float _1500 = _1498;
    if (!_1468)
    {
        float _1502 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1416);
        _1500 = _1502;
    }
    float _1504 = _1500;
    if (_1468)
    {
        _1486 = _1418;
    }
    float _1506 = _1486;
    float _1508 = _1506;
    if (!_1468)
    {
        float _1510 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1418);
        _1508 = _1510;
    }
    float _1512 = _1508;
    if (_1468)
    {
        _1488 = _1420;
    }
    float _1514 = _1488;
    float _1516 = _1514;
    if (!_1468)
    {
        float _1518 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1420);
        _1516 = _1518;
    }
    float _1520 = _1516;
    bool _1522 = _1474 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1524 = _1470 * _1444;
    float _1526 = _1476 * _1444;
    float _1528 = _1478 * _1444;
    float _1530 = _1446 * _1416;
    float _1532 = fma(_1410, _1442, _1524);
    float _1534 = _1442 * _1418;
    float _1536 = _1444 * _1420;
    float _1538 = fma(_1422, _1442, _1526);
    float _1540 = fma(_1462, _1442, _1528);
    float _1542 = -_1530;
    float _1544 = fma(_1442, _1420, _1542);
    float _1546 = -_1534;
    float _1548 = fma(_1444, _1416, _1546);
    float _1550 = -_1536;
    float _1552 = fma(_1446, _1418, _1550);
    float _1554 = _928 + _1482;
    float _1556 = fma(_1394, _1446, _1532);
    float _1558 = fma(_1400, _1446, _1538);
    float _1560 = fma(_1402, _1446, _1540);
    float _1562 = _1544 * _1448;
    float _1564 = _1552 * _1448;
    float _1566 = _1548 * _1448;
    float _1568 = _1448;
    if (!_1522)
    {
        _1568 = _1554;
    }
    float _1570 = _1568;
    bool _1572 = !_1522;
    float _1574 = _1570;
    if (!_1572)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1580 = _1474 + _1578;
        float _1582 = _1554 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1584 = rsqrt(_1464);
        float _1586 = _1580 * _1576;
        float _1588 = _1586 * 0.15915493667125701904296875;
        float _1590 = _1588 * 6.283185482025146484375;
        float _1592 = sin(_1590);
        float _1594 = _1588 * 6.283185482025146484375;
        float _1596 = cos(_1594);
        float _1598 = fma(_1592, _1582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1600 = _1584 * _1598;
        float _1602 = _1596 + (-1.0);
        float _1604 = fma(_1426, _1600, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1606 = fma(_1430, _1600, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1608 = _1602 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1612 = _1604 + _1610;
        float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1616 = _1606 + _1614;
        float _1618 = fma(_1554, _1596, _1608);
        float _1620 = _1612 * _1612;
        float _1622 = _1616 * _1616;
        _1574 = _1618;
        _1490 = _1620;
        _1492 = _1622;
        _1494 = _1604;
        _1496 = _1606;
    }
    float _1624 = _1574;
    float _1626 = _1490;
    float _1628 = _1492;
    float _1630 = _1494;
    float _1632 = _1496;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1636 = _1624 + _1634;
    float _1638 = _1470 * _1512;
    float _1640 = _1476 * _1512;
    float _1642 = _1478 * _1512;
    float _1644 = fma(_1636, _1636, _1626);
    float _1646 = fma(_1410, _1504, _1638);
    float _1648 = fma(_1422, _1504, _1640);
    float _1650 = fma(_1462, _1504, _1642);
    float _1652 = _1644 + _1628;
    float _1654 = _1562 * _1470;
    float _1656 = _1562 * _1476;
    float _1658 = _1562 * _1478;
    float _1660 = fma(_1400, _1520, _1648);
    float _1662 = fma(_1564, _1410, _1654);
    float _1664 = sqrt(_1652);
    float _1666 = fma(_1564, _1422, _1656);
    float _1668 = fma(_1564, _1462, _1658);
    float _1670 = fma(_1394, _1520, _1646);
    float _1672 = fma(_1566, _1394, _1662);
    float _1674 = fma(_1566, _1400, _1666);
    float _1676 = fma(_1402, _1520, _1650);
    float _1678 = fma(_1566, _1402, _1668);
    out.m_71.x = _1556;
    out.m_71.y = _1558;
    out.m_71.z = _1560;
    out.m_73.x = _1670;
    out.m_73.y = _1660;
    out.m_73.z = _1676;
    out.m_75.x = _1672;
    out.m_75.y = _1674;
    out.m_75.z = _1678;
    bool _1680 = _1664 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1682 = isnan(_1664);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1688 = _1684 || _1686;
    float _1690 = _1648;
    float _1692 = _1672;
    float _1694 = _1678;
    if (!_1688)
    {
        _1690 = 1.0;
    }
    float _1696 = _1690;
    bool _1698 = !_1688;
    float _1700 = _1696;
    if (!_1698)
    {
        bool _1702 = _1664 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1704 = isnan(_1664);
        bool _1706 = _1702 || _1704;
        bool _1708 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1710 = _1706 || _1708;
        if (!_1710)
        {
            float _1712 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1714 = _1664 + _1712;
            float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1718 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1716;
            float _1720 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1722 = _1720 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1724 = 1.0 / _1718;
            float _1726 = _1714 * _1724;
            float _1728 = fma(_1726, _1722, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1700 = _1728;
            _1730 = true;
        }
        else
        {
            bool _1732 = _1664 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1734 = isnan(_1664);
            bool _1736 = _1732 || _1734;
            bool _1738 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1740 = _1736 || _1738;
            if (!_1740)
            {
                float _1742 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1744 = _1664 + _1742;
                float _1746 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1748 = _1746 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1750 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1752 = _1750 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1754 = 1.0 / _1748;
                float _1756 = _1744 * _1754;
                float _1758 = fma(_1756, _1752, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1700 = _1758;
                _1730 = true;
            }
            else
            {
                _1700 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1730 = false;
    float _1760 = _1700;
    float _1762 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1764 = _1630 + _1762;
    float _1766 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1768 = _1624 + _1766;
    float _1770 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1772 = _1632 + _1770;
    bool _1774 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan(0.5);
    bool _1782 = _1778 || _1780;
    float _1784 = fma(_1764, _1760, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1786 = fma(_1768, _1760, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1788 = fma(_1772, _1760, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1790 = -_1060;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1784);
    float _1794 = -_1050;
    float _1796 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1786);
    float _1798 = -_1098;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1788);
    float _1802 = _1796;
    float _1804 = _1792;
    float _1806 = _1800;
    if (!_1782)
    {
        float _1808 = _1146 * _1146;
        float _1810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1812 = -_932;
        float _1814 = _1812 + _1784;
        float _1816 = -_928;
        float _1818 = _1816 + _1786;
        float _1820 = fma(_1150, _1150, _1808);
        float _1822 = fma(_1162, _1162, _1820);
        float _1824 = 1.0 / _1270;
        float _1826 = sqrt(_1822);
        float _1828 = precise::min(_1826, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1830 = _1828 * _1810;
        float _1832 = -_934;
        float _1834 = _1832 + _1788;
        float _1836 = _1830 * _1824;
        float _1838 = fma(_1814, _1836, _1136);
        float _1840 = fma(_1818, _1836, _1132);
        float _1842 = fma(_1834, _1836, _1142);
        _1802 = _1840;
        _1804 = _1838;
        _1806 = _1842;
    }
    float _1844 = _1802;
    float _1846 = _1804;
    float _1848 = _1806;
    float _1850 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1852 = _1844 + _1850;
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1856 = _1846 + _1854;
    float _1858 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1860 = _1848 + _1858;
    float _1862 = _1852 * _1852;
    float _1864 = fma(_1856, _1856, _1862);
    float _1866 = fma(_1860, _1860, _1864);
    float _1868 = rsqrt(_1866);
    float _1870 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1872 = _1856 * _1870;
    float _1874 = _1860 * _1870;
    float _1876 = _1872 * _1872;
    float _1878 = _1874 * _1874;
    float _1880 = _1876 + _1878;
    float _1882 = sqrt(_1880);
    bool _1884 = _1882 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1888 = _1882 + _1886;
    float _1890 = _1868;
    float _1892 = _1888;
    float _1894 = _1852;
    float _1896 = _1870;
    float _1898 = _1872;
    if (_1884)
    {
        float _1900 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1890 = _1900;
    }
    float _1902 = _1890;
    if (_1884)
    {
        float _1904 = rsqrt(_1880);
        _1692 = _1904;
    }
    float _1906 = _1692;
    float _1908 = _1906;
    if (_1884)
    {
        float _1910 = _1888 * _1902;
        _1892 = _1910;
    }
    float _1912 = _1892;
    if (_1884)
    {
        float _1914 = _1912 * 0.15915493667125701904296875;
        _1694 = _1914;
    }
    float _1916 = _1694;
    float _1918 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1920 = _1902;
    if (_1884)
    {
        float _1922 = _1916 * 6.283185482025146484375;
        float _1924 = sin(_1922);
        _1920 = _1924;
    }
    float _1926 = _1920;
    float _1928 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1930 = precise::max(0.0, _1928);
    float _1932 = _1860;
    float _1934 = _1930;
    if (_1884)
    {
        float _1936 = _1916 * 6.283185482025146484375;
        float _1938 = cos(_1936);
        _1932 = _1938;
    }
    float _1940 = _1932;
    float _1942 = -_1870;
    float _1944 = -_1930;
    float _1946 = fma(_1852, _1942, _1944);
    if (!_1884)
    {
        _1894 = _1876;
    }
    float _1948 = _1894;
    float _1950 = _1948;
    if (_1884)
    {
        float _1952 = _1946 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1934 = _1952;
    }
    float _1954 = _1934;
    float _1956 = sqrt(_1866);
    float _1958 = _1926;
    float _1960 = _1954;
    if (_1884)
    {
        float _1962 = fma(_1926, _1954, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1958 = _1962;
    }
    float _1964 = _1958;
    float _1966 = _1964;
    if (_1884)
    {
        float _1968 = _1940 + (-1.0);
        _1960 = _1968;
    }
    float _1970 = _1960;
    float _1972 = _1970;
    if (_1884)
    {
        float _1974 = _1906 * _1964;
        _1218 = _1974;
    }
    float _1976 = _1218;
    if (!_1884)
    {
        _1908 = _1946;
    }
    float _1978 = _1908;
    float _1980 = _1978;
    if (_1884)
    {
        float _1982 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1896 = _1982;
    }
    float _1984 = _1896;
    if (_1884)
    {
        float _1986 = _1872 * _1976;
        _1898 = _1986;
    }
    float _1988 = _1898;
    if (!_1884)
    {
        _1966 = _1874;
    }
    float _1990 = _1966;
    float _1992 = _1990;
    if (_1884)
    {
        float _1994 = _1874 * _1976;
        _1992 = _1994;
    }
    float _1996 = _1992;
    if (_1884)
    {
        float _1998 = fma(_1946, _1940, _1984);
        _1980 = _1998;
    }
    float _2000 = _1980;
    if (_1884)
    {
        float _2002 = _1988 * _1988;
        _1950 = _2002;
    }
    float _2004 = _1950;
    if (!_1884)
    {
        _1972 = _1878;
    }
    float _2006 = _1972;
    float _2008 = _2006;
    if (_1884)
    {
        float _2010 = _1996 * _1996;
        _2008 = _2010;
    }
    float _2012 = _2008;
    float _2014 = fma(_2000, _2000, _2004);
    float _2016 = _2014 + _2012;
    float _2018 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2022 = fma(_1956, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2020);
    float _2024 = precise::clamp(_2022, 0.0, 1.0);
    float _2026 = rsqrt(_2016);
    float _2028 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2018);
    float _2030 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2032 = -_2024;
    float _2034 = _2032 + 1.0;
    float _2036 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2028);
    float _2038 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2040 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2030);
    float _2042 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2044 = abs(_2034);
    float _2046 = log2(_2044);
    float _2048 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2038);
    float _2050 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2040);
    float _2052 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2042);
    float _2054 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2056 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2048);
    float _2058 = _2050 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2060 = _2026 * _1988;
    float _2062 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2052);
    float _2064 = _2056 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2066 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2068 = _2026 * _2000;
    float _2070 = _2060 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2072 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2074 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2066);
    float _2076 = _2026 * _1996;
    float _2078 = -_2070;
    float _2080 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2078);
    float _2082 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2084 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2086 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2074);
    float _2088 = -_2072;
    float _2090 = fma(_2088, _1918, 1.0);
    float _2092 = -_2076;
    float _2094 = fma(_2092, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2080);
    float _2096 = exp2(_2082);
    float _2098 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2086);
    float _2100 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2102 = fma(_2094, -0.5, 0.5);
    float _2104 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2106 = fma(_2094, 0.5, 0.5);
    float _2108 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2100);
    float _2110 = log2(_2090);
    float _2112 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2104);
    float _2114 = _2068 + 1.0;
    float _2116 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2108);
    float _2118 = fma(_2106, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2120 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2112);
    float _2122 = 1.0 / _2098;
    float _2124 = -_2068;
    float _2126 = fma(_2096, _2114, _2124);
    float _2128 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2116);
    float _2130 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2120);
    float _2132 = fma(_2106, _2118, -0.212114393711090087890625);
    float _2134 = fma(_2126, 0.5, 0.5);
    float _2136 = sqrt(_2102);
    float _2138 = _2110 * 0.693147182464599609375;
    float _2140 = fma(_2106, _2132, 1.570728778839111328125);
    float _2142 = _2128 * _2122;
    float _2144 = _2130 * _2122;
    float _2146 = _2138 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2148 = fma(_2142, 0.5, 0.5);
    float _2150 = fma(_2144, -0.5, 0.5);
    float _2152 = _2136 * 0.636619746685028076171875;
    float3 _5610 = float3(_2148, _2150, _2146);
    float _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5610, float3(0.0), isnan(_5610)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5610, float3(0.0), isnan(_5610)), level(0.0)).x;
    float3 _5621 = float3(_2148, _2150, _2146);
    float4 _2157 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5621, float3(0.0), isnan(_5621)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5621, float3(0.0), isnan(_5621)), level(0.0)).xyzw;
    float _2159 = _2157.x;
    float _2161 = _2157.y;
    float _2163 = _2157.z;
    float _2165 = _2157.w;
    float _2167 = -_2140;
    float _2169 = fma(_2152, _2167, 1.0);
    float2 _5643 = float2(_2169, _2134);
    float3 _2173 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5643, float2(0.0), isnan(_5643)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5643, float2(0.0), isnan(_5643)), level(0.0)).xyz;
    float _2175 = _2173.x;
    float _2177 = _2173.y;
    float _2179 = _2173.z;
    float _2181 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2183 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2185 = _242 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2187 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2183);
    float _2189 = exp2(_2181);
    float _2191 = _2185 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2193 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2187);
    float _2195 = _2128 + _2098;
    out.m_47.x = _2191;
    float _2197 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2193);
    float _2199 = _2195 * 0.5;
    float _2201 = _2098 * 0.5;
    float _2203 = _2197 + _2098;
    out.gl_Position.x = _2128;
    out.gl_Position.y = _2130;
    out.gl_Position.z = _2197;
    out.gl_Position.w = _2098;
    float _2205 = -_2189;
    float _2207 = _2205 + 1.0;
    float _2209 = _2203 * 0.5;
    float _2211 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2213 = fma(_2130, -0.5, _2201);
    out.m_77.x = _2199;
    out.m_77.y = _2213;
    out.m_77.z = _2209;
    out.m_77.w = _2098;
    float _2215 = _2211 * _2154;
    float _2217 = -_2211;
    float _2219 = _2217 + 1.0;
    float _2221 = _2165 * _2215;
    float _2223 = _2179 * _2215;
    float _2225 = fma(_2175, _2221, _2159);
    float _2227 = fma(_2177, _2221, _2161);
    float _2229 = _2165 * _2219;
    float _2231 = fma(_2165, _2223, _2163);
    out.m_79.x = _2225;
    out.m_79.y = _2227;
    out.m_79.z = _2231;
    out.m_79.w = _2229;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1730 = false;
    bool _266 = false;
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
        float _2288 = as_type<float>(_114);
        out.gl_Position.z = _2288;
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
    float _134 = 0.0;
    float _136 = _132;
    if (_128)
    {
        float _138 = float(_98);
        _134 = _138;
    }
    float _140 = _134;
    bool _142 = _132 >= _140;
    bool _144 = !_128;
    bool _146 = _142 || _144;
    if (_146)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _108;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2357 = as_type<float>(_152);
        out.gl_Position.z = _2357;
    }
    if (_146)
    {
        return out;
    }
    float _154 = in.m_51.x;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _132 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _162 = _160 != 0;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _166 = _164 != 0;
    int _168 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _170 = _168 != 0;
    float _172 = _158 * _156;
    float _174 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    float _176 = _174 * 6.283185482025146484375;
    float _178 = floor(_174);
    float _180 = _176 * 0.15915493667125701904296875;
    bool _182 = !_162;
    int _184 = _182 ? 0 : 1;
    int _186 = abs(_184);
    float _188 = _180 * 6.283185482025146484375;
    float _190 = cos(_188);
    bool _192 = !_170;
    int _194 = _192 ? 0 : 1;
    bool _196 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _198 = abs(_194);
    float _200 = -_178;
    float _202 = _174 + _200;
    bool _204 = !_166;
    int _206 = _204 ? 0 : 1;
    float _208 = float(_186);
    int _210 = abs(_206);
    float _212 = -_202;
    float _214 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _216 = fma(_190, 0.5, 0.5);
    bool _218 = _202 < 0.5;
    float _220 = float(_218);
    float _222 = abs(_214);
    float _224 = _208 * _222;
    float _226 = float(_198);
    float _228 = -_216;
    float _230 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _232 = -_220;
    float _234 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _236 = float(_210);
    float _238 = fma(_226, _230, _224);
    float _240 = abs(_234);
    float _242 = fma(_236, _240, _238);
    bool _244 = !_196;
    bool _246 = _166;
    float _248 = as_type<float>(_198);
    float _264;
    if (!_244)
    {
        float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _252 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _254 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _256 = _254 * _250;
        float _258 = floor(_256);
        float _260 = -_258;
        float _262 = _256 + _260;
        _264 = _262;
        _266 = true;
    }
    else
    {
        float _268 = float(_98);
        float _270 = 1.0 / _268;
        float _272 = _132 * _270;
        _264 = _272;
    }
    _266 = false;
    float _274 = _264;
    float _276 = in.m_53.x;
    float _278 = in.m_53.y;
    float _280 = _154 * 2.0;
    float _282 = in.m_55.x;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _286 = _284 != 0;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _290 = _274 + _288;
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _294 = _292 != 0;
    float _296 = in.m_44.x;
    float _298 = in.m_44.y;
    float _300 = in.m_44.z;
    float _302 = floor(_280);
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _306 = _304 != 0;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _308;
    float _312 = in.m_51.w;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _316 = _314 != 0;
    float _318 = in.m_51.y;
    float _320 = 1.0 / _310;
    if (_286)
    {
        bool _322 = _154 > 0.5;
        _246 = _322;
    }
    bool _324 = _246;
    float _326 = 0.0;
    if (_294)
    {
        float _328 = in.m_51.z;
        _326 = _328;
    }
    float _330 = _326;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _334 = in.m_51.z;
    float _336 = abs(_276);
    float _338 = abs(_278);
    float _340 = precise::max(_336, _338);
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _344 = 0;
    if (_286)
    {
        float _346 = -_282;
        float _348 = _346 + 1.0;
        _344 = as_type<int>(_348);
    }
    int _350 = _344;
    if (!_286)
    {
        _248 = _282;
    }
    float _352 = _248;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _356 = _340 >= 16.0;
    float _358 = _298 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _360 = _352;
    if (_286)
    {
        float _362 = _324 ? as_type<float>(_350) : _282;
        _360 = _362;
    }
    float _364 = _360;
    float _366 = in.m_55.y;
    float _368 = _298 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _370 = _298 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _372 = _302 > 0.0;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _376 = _302 >= 0.0;
    bool _378 = isnan(_302);
    bool _380 = _376 || _378;
    bool _382 = isnan(0.0);
    bool _384 = _380 || _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _390;
    bool _394 = _312 > 0.5;
    float _396 = _318 * 2.0;
    float _398 = 1.0 / _392;
    float _400 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _368);
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _406 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _370);
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _410 = 1.0 / _388;
    float _412 = _402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _414 = _404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _416 = _332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _358);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _422 = _274 + _420;
    float _424 = -_366;
    float _426 = _424 + 1.0;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _430 = floor(_396);
    float _432 = _342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = _354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _436 = _374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _438 = _422 * _398;
    out.m_57.x = _412;
    out.m_57.y = _414;
    out.m_57.z = _416;
    out.m_57.w = _408;
    float _440 = _154 + _318;
    float _442 = _290 * _410;
    int _444 = _394 ? as_type<int>(_426) : as_type<int>(_366);
    out.m_59.x = _432;
    out.m_59.y = _434;
    out.m_59.z = _436;
    out.m_59.w = _428;
    bool _446 = _394;
    int _448 = as_type<int>(_408);
    float _450 = _440;
    float _452 = _366;
    bool _454 = _372;
    if (_294)
    {
        bool _456 = _330 > 0.5;
        _446 = _456;
    }
    bool _458 = _446;
    float _460 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _418);
    int _462 = _306 ? _444 : as_type<int>(_366);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _466 = _274 + _464;
    bool _468 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _470 = isnan(_274);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = _276 * 0.0625;
    bool _482 = _430 > 0.0;
    float _484 = _466 * _320;
    int _486 = _462;
    if (_294)
    {
        float _488 = -_282;
        float _490 = _488 + 1.0;
        _448 = as_type<int>(_490);
    }
    int _492 = _448;
    float _494 = _154 + _334;
    float _496 = _334 * 2.0;
    float _498 = _318 + _334;
    float _500 = _440 + (-1.0);
    float _502 = _494 + (-1.0);
    if (!_294)
    {
        _450 = _282;
    }
    float _504 = _450;
    float _506 = floor(_496);
    float _508 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _510 = _504;
    if (_294)
    {
        float _512 = _458 ? as_type<float>(_492) : _282;
        _510 = _512;
    }
    float _514 = _510;
    float _516 = _498 + (-1.0);
    bool _518 = _318 > 0.5;
    float _520 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _522 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _524 = isnan(_274);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _400);
    if (_316)
    {
        float _536 = _518 ? _426 : _366;
        _452 = _536;
    }
    float _538 = _452;
    float _540 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _542 = _430 >= 0.0;
    bool _544 = isnan(_430);
    bool _546 = _542 || _544;
    bool _548 = isnan(0.0);
    bool _550 = _546 || _548;
    float _552 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _406);
    float _554 = -_532;
    float _556 = _554 + 1.0;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _562;
    bool _566 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _568 = isnan(_274);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _594 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _596 = isnan(_274);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -_576;
    float _608 = _606 + 1.0;
    float _610 = _576 * _556;
    float _612 = _278 * 0.0625;
    float _614 = fma(_584, _442, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _616 = fma(_588, _442, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _618 = fma(_592, _442, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _620 = _604 * _608;
    float _622 = -_604;
    float _624 = _622 + 1.0;
    bool _626 = _506 > 0.0;
    float _628 = fma(_564, _438, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _630 = _506 >= 0.0;
    bool _632 = isnan(_506);
    bool _634 = _630 || _632;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _640;
    float _644 = _356 ? _612 : _278;
    float _646 = _478 * _624;
    float _648 = _356 ? _480 : _276;
    float _650 = fma(_580, _438, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _652 = fma(_642, _438, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _654 = abs(_644);
    bool _656 = _654 != 0.0;
    bool _658 = isnan(_654);
    bool _660 = _656 || _658;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    float _666 = fma(_560, _484, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _670 = _628 * _646;
    int _672 = _384 ? 0 : 1;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _674;
    float _678 = abs(_648);
    bool _680 = _678 == 0.0;
    bool _682 = !_664;
    bool _684 = _680 && _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _686;
    int _690 = ~_672;
    int _692 = _690 + 1;
    int _694 = _692 + 1;
    float _696 = fma(_676, _484, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _698 = _694;
    int _700 = as_type<int>(_670);
    if (!_372)
    {
        int _702 = ~_672;
        int _704 = _702 + 1;
        _698 = _704;
    }
    int _706 = _698;
    float _708 = fma(_688, _484, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _710 = _638 ? 0 : 1;
    float _712 = _652 * _646;
    float _714 = abs(_648);
    bool _716 = _714 == 0.0;
    float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _720 = _650 * _646;
    float _722 = -_478;
    float _724 = _722 + 1.0;
    int _726 = _550 ? 0 : 1;
    float _728 = _538 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_684)
    {
        bool _730 = as_type<int>(_648) >= 0;
        _454 = _730;
    }
    bool _732 = _454;
    float _734 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[143].x, _670);
    int _736 = ~_710;
    int _738 = _736 + 1;
    int _740 = _738 + 1;
    float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _744 = _740;
    int _746 = _732 ? (-1) : 0;
    if (_684)
    {
        int _748 = _732 ? 0 : 1078530011;
        _700 = _748;
    }
    int _750 = _700;
    float _752 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[143].y, _720);
    if (!_626)
    {
        int _754 = ~_710;
        int _756 = _754 + 1;
        _744 = _756;
    }
    int _758 = _744;
    float _760 = as_type<float>(_462) * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _762 = ~_726;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    float _768 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[143].z, _712);
    int _770 = _766;
    if (!_482)
    {
        int _772 = ~_726;
        int _774 = _772 + 1;
        _770 = _774;
    }
    int _776 = _770;
    float _778 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _780 = log2(_778);
    if (_684)
    {
        int _782 = int(0x80000000) & as_type<int>(_644);
        int _784 = _750 | _782;
        _486 = _784;
    }
    int _786 = _486;
    bool _788 = !_664;
    bool _790 = _788 && _716;
    int _792 = _786;
    float _794 = as_type<float>(_786);
    if (!_790)
    {
        float _796 = abs(_644);
        bool _798 = _796 != as_type<float>(0x7f800000u /* inf */);
        bool _800 = isnan(_796);
        bool _802 = _798 || _800;
        bool _804 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _806 = _802 || _804;
        float _808 = abs(_648);
        bool _810 = _808 == as_type<float>(0x7f800000u /* inf */);
        float _812 = abs(_648);
        bool _814 = _812 == as_type<float>(0x7f800000u /* inf */);
        bool _816 = !_806;
        bool _818 = _814 && _816;
        if (_818)
        {
            bool _820 = as_type<int>(_648) >= 0;
            _746 = _820 ? (-1) : 0;
        }
        int _822 = _746;
        if (_818)
        {
            _792 = 1075235812;
        }
        int _824 = _792;
        int _826 = _824;
        if (_818)
        {
            int _828 = ~_822;
            int _830 = (_828 != 0) ? _824 : 1061752795;
            _826 = _830;
        }
        int _832 = _826;
        float _834 = as_type<float>(_832);
        if (_818)
        {
            int _836 = int(0x80000000) & as_type<int>(_644);
            int _838 = _832 | _836;
            _834 = as_type<float>(_838);
        }
        float _840 = _834;
        bool _842 = !_806;
        bool _844 = _842 && _810;
        _794 = _840;
        if (!_844)
        {
            float _846 = abs(_644);
            float _848 = abs(_648);
            float _850 = precise::max(_846, _848);
            float _852 = abs(_644);
            float _854 = abs(_648);
            float _856 = precise::min(_852, _854);
            float _858 = 1.0 / _850;
            float _860 = abs(_644);
            float _862 = abs(_648);
            bool _864 = _860 > _862;
            bool _866 = as_type<int>(_648) >= 0;
            float _868 = abs(_644);
            float _870 = abs(_648);
            float _872 = _868 + _870;
            int _874 = as_type<int>(_644) & int(0x80000000);
            bool _876 = _872 > as_type<float>(0x7f800000u /* inf */);
            bool _878 = isnan(_872);
            bool _880 = _876 || _878;
            bool _882 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _884 = _880 || _882;
            float _886 = _856 * _858;
            float _888 = _886 * _886;
            float _890 = _888 + 11.33538818359375;
            float _892 = fma(_888, _890, 28.84246826171875);
            float _894 = fma(_888, _892, 19.6966705322265625);
            float _896 = fma(_888, -0.82336294651031494140625, -5.674867153167724609375);
            float _898 = fma(_888, _896, -6.565555095672607421875);
            float _900 = 1.0 / _894;
            float _902 = _888 * _898;
            float _904 = _886 * _902;
            float _906 = fma(_904, _900, _886);
            float _908 = _906;
            _794 = _872;
            if (_864)
            {
                float _910 = -_906;
                float _912 = _910 + 1.57079637050628662109375;
                _908 = _912;
            }
            float _914 = _908;
            int _916 = as_type<int>(_914);
            if (!_866)
            {
                float _918 = -_914;
                float _920 = _918 + 3.1415927410125732421875;
                _916 = as_type<int>(_920);
            }
            int _922 = _916;
            if (!_884)
            {
                int _924 = _874 | _922;
                _794 = as_type<float>(_924);
            }
        }
    }
    float _926 = _794;
    float _928 = _534 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _930 = _728 * _718;
    float _932 = _460 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _934 = _552 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _938 = _928 + _936;
    float _940 = _760 * _742;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _944 = _932 + _942;
    float _946 = _780 * _132;
    float _948 = _938 * _938;
    float _950 = _364 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _954 = _934 + _952;
    float _956 = _938 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _958 = fma(_944, _944, _948);
    float _960 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _962 = _950 * _668;
    float _964 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[28].x, _956);
    float _966 = fma(_954, _954, _958);
    float _968 = _514 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _970 = precise::max(_926, -3.1415927410125732421875);
    float _972 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[28].z, _964);
    float _974 = exp2(_946);
    float _976 = precise::min(_970, 3.1415927410125732421875);
    float _978 = _318 + (-0.5);
    bool _980 = _972 >= 0.0;
    float _982 = float(_706);
    float _984 = fma(_976, 0.15915493667125701904296875, 0.5);
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _988 = _986 != 0;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _992 = _990 != 0;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _996 = _994 != 0;
    float _998 = rsqrt(_966);
    float _1000 = _968 * _960;
    float _1002 = in.m_61.x;
    float _1004 = in.m_61.y;
    float _1006 = in.m_61.z;
    bool _1008 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1010 = isnan(0.0);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1016 = _1012 || _1014;
    out.m_63.x = _962;
    out.m_63.y = _930;
    out.m_63.z = _1000;
    out.m_63.w = _940;
    bool _1018 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1020 = isnan(1.0);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1026 = _1022 || _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1030 = 1.0 + _1028;
    float _1032 = -_974;
    float _1034 = _1032 + 1.0;
    float _1036 = float(_776);
    float _1038 = _940;
    int _1040 = as_type<int>(_938);
    if (_980)
    {
        out.m_47.x = 0.0;
    }
    float _1042 = 1.0 / _1030;
    float _1044 = _1016 ? _1034 : 0.0;
    bool _1046 = !_992;
    int _1048 = _1046 ? 0 : 1;
    float _1050 = _938 * _998;
    if (_980)
    {
        _1038 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1052 = _1038;
    int _1054 = abs(_1048);
    float _1056 = -_1050;
    float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[18].w, _938);
    float _1060 = _944 * _998;
    if (_980)
    {
        float _1062 = _1052 * 5.0;
        _1040 = as_type<int>(_1062);
    }
    int _1064 = _1040;
    float _1066 = _1058 * _1058;
    float _1068 = -_1060;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[18].w, _944);
    float _1072 = float(_1054);
    if (_980)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3796 = as_type<float>(_1064);
        out.gl_Position.z = _3796;
    }
    float _1074 = fma(_1070, _1070, _1066);
    float _1076 = fma(_132, 0.06666667759418487548828125, _984);
    float _1078 = float(_758);
    float _1080 = _1072 * _982;
    bool _1082 = !_996;
    int _1084 = _1082 ? 0 : 1;
    if (_1026)
    {
        float _1086 = _1044 * _1042;
        _136 = _1086;
    }
    float _1088 = _136;
    bool _1090 = !_988;
    int _1092 = _1090 ? 0 : 1;
    int _1094 = abs(_1084);
    int _1096 = abs(_1092);
    float _1098 = _954 * _998;
    float _1100 = _1080 * (-2.0);
    float _1102 = -_1098;
    float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[18].w, _954);
    float _1106 = fma(_1100, _1004, _1004);
    float _1108 = float(_1094);
    float _1110 = fma(_540, _1100, _540);
    float _1112 = fma(_1104, _1104, _1074);
    float _1114 = float(_1096);
    float _1116 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1106);
    float _1118 = _1108 * _1036;
    float _1120 = _334 + (-0.5);
    float _1122 = sqrt(_1112);
    float _1124 = _1114 * _1078;
    float _1126 = fma(_1110, _1088, _1116);
    float _1128 = _1076 * 6.283185482025146484375;
    if (_980)
    {
        return out;
    }
    float _1130 = -_1050;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[18].w, _928);
    float _1134 = -_1060;
    float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[18].w, _932);
    float _1138 = _1118 * (-2.0);
    float _1140 = -_1098;
    float _1142 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[18].w, _934);
    float _1144 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1146 = _1132 + _1144;
    float _1148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1150 = _1136 + _1148;
    float _1152 = _1128 * 0.15915493667125701904296875;
    float _1154 = fma(_1138, _1006, _1006);
    float _1156 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1158 = _1126 * 0.15915493667125701904296875;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1162 = _1142 + _1160;
    float _1164 = fma(_520, _1138, _520);
    float _1166 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1156);
    float _1168 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1154);
    float _1170 = _1124 * (-2.0);
    float _1172 = _154 + (-0.5);
    float _1174 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1166);
    float _1176 = fma(_1164, _1088, _1168);
    float _1178 = fma(_1170, _1002, _1002);
    float _1180 = fma(_508, _1170, _508);
    float _1182 = fma(_614, _620, _734);
    bool _1184 = _1174 >= 0.0;
    float _1186 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1178);
    float _1188 = fma(_616, _620, _752);
    float _1190 = fma(_618, _620, _768);
    float _1192 = _1176 * 0.15915493667125701904296875;
    float _1194 = fma(_1180, _1088, _1186);
    float _1196 = in.m_65.x;
    float _1198 = in.m_65.y;
    float _1200 = in.m_65.z;
    float _1202 = fma(_696, _610, _1182);
    float _1204 = fma(_666, _610, _1188);
    float _1206 = fma(_708, _610, _1190);
    float _1208 = in.m_53.z;
    float _1210 = _1194 * 0.15915493667125701904296875;
    float _1212 = _1152 * 6.283185482025146484375;
    float _1214 = sin(_1212);
    float _1216 = _1174;
    float _1218 = _1136;
    if (_1184)
    {
        _1216 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1220 = _1216;
    int _1222 = as_type<int>(_1220);
    if (_1184)
    {
        out.m_47.x = 0.0;
    }
    float _1224 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1202);
    float _1226 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1204);
    if (_1184)
    {
        float _1228 = _1220 * 5.0;
        _1222 = as_type<int>(_1228);
    }
    int _1230 = _1222;
    float _1232 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1206);
    float _1234 = _1158 * 6.283185482025146484375;
    float _1236 = sin(_1234);
    if (_1184)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4071 = as_type<float>(_1230);
        out.gl_Position.z = _4071;
    }
    float _1238 = _1158 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = _1192 * 6.283185482025146484375;
    float _1244 = sin(_1242);
    float _1246 = _1192 * 6.283185482025146484375;
    float _1248 = cos(_1246);
    float _1250 = _1210 * 6.283185482025146484375;
    float _1252 = sin(_1250);
    if (_1184)
    {
        return out;
    }
    float _1254 = _1210 * 6.283185482025146484375;
    float _1256 = cos(_1254);
    float _1258 = _1226 * _1198;
    float _1260 = fma(_1214, 0.5, 1.5);
    float _1262 = _1240 * _1248;
    float _1264 = _1236 * _1244;
    float _1266 = _1232 * _1200;
    float _1268 = _1224 * _1196;
    float _1270 = _998 * _1122;
    float _1272 = _1260 * _278;
    float _1274 = fma(_1252, _1264, _1262);
    float _1276 = _1258 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1278 = fma(_1252, _1262, _1264);
    float _1280 = _1240 * _1244;
    float _1282 = _1236 * _1248;
    float _1284 = _1266 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1286 = _1260 * _276;
    float _1288 = _1248 * _1256;
    float _1290 = _1268 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1272);
    float _1294 = _1270 * _1276;
    float _1296 = _1244 * _1256;
    float _1298 = _1236 * _1256;
    float _1300 = _1260 * _1208;
    float _1302 = _1240 * _1256;
    float _1304 = -_1282;
    float _1306 = fma(_1252, _1280, _1304);
    float _1308 = _1270 * _1284;
    float _1310 = -_1280;
    float _1312 = fma(_1252, _1282, _1310);
    float _1314 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1316 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1286);
    float _1318 = _1270 * _1290;
    float _1320 = _1292 * _1294;
    float _1322 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1300);
    float _1324 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1314);
    float _1326 = _1316 * _1318;
    float _1328 = _1288 * _1320;
    float _1330 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1332 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1334 = _1322 * _1308;
    float _1336 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1338 = fma(_1296, _1326, _1328);
    float _1340 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1342 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1330);
    float _1344 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1332);
    float _1346 = _1312 * _1320;
    float _1348 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1336);
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1352 = _1252 * _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1356 = _1252 * _1354;
    float _1358 = -_1252;
    float _1360 = fma(_1358, _1334, _1338);
    float _1362 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1340);
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1366 = _1252 * _1364;
    float _1368 = _1278 * _1320;
    float _1370 = fma(_1274, _1326, _1346);
    float _1372 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1352);
    float _1374 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1366);
    float _1376 = fma(_1306, _1326, _1368);
    float _1378 = fma(_1298, _1334, _1370);
    float _1380 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1382 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1384 = fma(_1302, _1334, _1376);
    float _1386 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1356);
    float _1388 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1380);
    float _1390 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1382);
    float _1392 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1394 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1372);
    float _1396 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1388);
    float _1398 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1390);
    float _1400 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1386);
    float _1402 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1374);
    float _1404 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1406 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1408 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1392);
    float _1410 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1348);
    float _1412 = _932 + _1404;
    float _1414 = _934 + _1406;
    float _1416 = in.m_67.x;
    float _1418 = in.m_67.y;
    float _1420 = in.m_67.z;
    float _1422 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1362);
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1426 = _1412 + _1424;
    float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1430 = _1414 + _1428;
    bool _1432 = _1272 != 0.0;
    bool _1434 = isnan(_1272);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan(0.0);
    bool _1440 = _1436 || _1438;
    float _1442 = in.m_69.x;
    float _1444 = in.m_69.y;
    float _1446 = in.m_69.z;
    float _1448 = in.m_69.w;
    float _1450 = _1426 * _1426;
    float _1452 = _1430 * _1430;
    bool _1454 = _1286 == 0.0;
    bool _1456 = !_1440;
    bool _1458 = _1454 && _1456;
    float _1460 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1462 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1408);
    float _1464 = _1450 + _1452;
    bool _1466 = _1300 == 0.0;
    bool _1468 = _1466 && _1458;
    float _1470 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1324);
    float _1472 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1460);
    float _1474 = sqrt(_1464);
    float _1476 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1342);
    float _1478 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1344);
    float _1480 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1472);
    float _1482 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1484 = _1408;
    float _1486 = _1372;
    float _1488 = _1404;
    float _1490 = _1450;
    float _1492 = _1452;
    float _1494 = _1412;
    float _1496 = _1414;
    if (_1468)
    {
        _1484 = _1416;
    }
    float _1498 = _1484;
    float _1500 = _1498;
    if (!_1468)
    {
        float _1502 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1416);
        _1500 = _1502;
    }
    float _1504 = _1500;
    if (_1468)
    {
        _1486 = _1418;
    }
    float _1506 = _1486;
    float _1508 = _1506;
    if (!_1468)
    {
        float _1510 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1418);
        _1508 = _1510;
    }
    float _1512 = _1508;
    if (_1468)
    {
        _1488 = _1420;
    }
    float _1514 = _1488;
    float _1516 = _1514;
    if (!_1468)
    {
        float _1518 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1420);
        _1516 = _1518;
    }
    float _1520 = _1516;
    bool _1522 = _1474 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1524 = _1470 * _1444;
    float _1526 = _1476 * _1444;
    float _1528 = _1478 * _1444;
    float _1530 = _1446 * _1416;
    float _1532 = fma(_1410, _1442, _1524);
    float _1534 = _1442 * _1418;
    float _1536 = _1444 * _1420;
    float _1538 = fma(_1422, _1442, _1526);
    float _1540 = fma(_1462, _1442, _1528);
    float _1542 = -_1530;
    float _1544 = fma(_1442, _1420, _1542);
    float _1546 = -_1534;
    float _1548 = fma(_1444, _1416, _1546);
    float _1550 = -_1536;
    float _1552 = fma(_1446, _1418, _1550);
    float _1554 = _928 + _1482;
    float _1556 = fma(_1394, _1446, _1532);
    float _1558 = fma(_1400, _1446, _1538);
    float _1560 = fma(_1402, _1446, _1540);
    float _1562 = _1544 * _1448;
    float _1564 = _1552 * _1448;
    float _1566 = _1548 * _1448;
    float _1568 = _1448;
    if (!_1522)
    {
        _1568 = _1554;
    }
    float _1570 = _1568;
    bool _1572 = !_1522;
    float _1574 = _1570;
    if (!_1572)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1580 = _1474 + _1578;
        float _1582 = _1554 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1584 = rsqrt(_1464);
        float _1586 = _1580 * _1576;
        float _1588 = _1586 * 0.15915493667125701904296875;
        float _1590 = _1588 * 6.283185482025146484375;
        float _1592 = sin(_1590);
        float _1594 = _1588 * 6.283185482025146484375;
        float _1596 = cos(_1594);
        float _1598 = fma(_1592, _1582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1600 = _1584 * _1598;
        float _1602 = _1596 + (-1.0);
        float _1604 = fma(_1426, _1600, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1606 = fma(_1430, _1600, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1608 = _1602 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1612 = _1604 + _1610;
        float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1616 = _1606 + _1614;
        float _1618 = fma(_1554, _1596, _1608);
        float _1620 = _1612 * _1612;
        float _1622 = _1616 * _1616;
        _1574 = _1618;
        _1490 = _1620;
        _1492 = _1622;
        _1494 = _1604;
        _1496 = _1606;
    }
    float _1624 = _1574;
    float _1626 = _1490;
    float _1628 = _1492;
    float _1630 = _1494;
    float _1632 = _1496;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1636 = _1624 + _1634;
    float _1638 = _1470 * _1512;
    float _1640 = _1476 * _1512;
    float _1642 = _1478 * _1512;
    float _1644 = fma(_1636, _1636, _1626);
    float _1646 = fma(_1410, _1504, _1638);
    float _1648 = fma(_1422, _1504, _1640);
    float _1650 = fma(_1462, _1504, _1642);
    float _1652 = _1644 + _1628;
    float _1654 = _1562 * _1470;
    float _1656 = _1562 * _1476;
    float _1658 = _1562 * _1478;
    float _1660 = fma(_1400, _1520, _1648);
    float _1662 = fma(_1564, _1410, _1654);
    float _1664 = sqrt(_1652);
    float _1666 = fma(_1564, _1422, _1656);
    float _1668 = fma(_1564, _1462, _1658);
    float _1670 = fma(_1394, _1520, _1646);
    float _1672 = fma(_1566, _1394, _1662);
    float _1674 = fma(_1566, _1400, _1666);
    float _1676 = fma(_1402, _1520, _1650);
    float _1678 = fma(_1566, _1402, _1668);
    out.m_71.x = _1556;
    out.m_71.y = _1558;
    out.m_71.z = _1560;
    out.m_73.x = _1670;
    out.m_73.y = _1660;
    out.m_73.z = _1676;
    out.m_75.x = _1672;
    out.m_75.y = _1674;
    out.m_75.z = _1678;
    bool _1680 = _1664 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1682 = isnan(_1664);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1688 = _1684 || _1686;
    float _1690 = _1648;
    float _1692 = _1672;
    float _1694 = _1678;
    if (!_1688)
    {
        _1690 = 1.0;
    }
    float _1696 = _1690;
    bool _1698 = !_1688;
    float _1700 = _1696;
    if (!_1698)
    {
        bool _1702 = _1664 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1704 = isnan(_1664);
        bool _1706 = _1702 || _1704;
        bool _1708 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1710 = _1706 || _1708;
        if (!_1710)
        {
            float _1712 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1714 = _1664 + _1712;
            float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1718 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1716;
            float _1720 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1722 = _1720 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1724 = 1.0 / _1718;
            float _1726 = _1714 * _1724;
            float _1728 = fma(_1726, _1722, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1700 = _1728;
            _1730 = true;
        }
        else
        {
            bool _1732 = _1664 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1734 = isnan(_1664);
            bool _1736 = _1732 || _1734;
            bool _1738 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1740 = _1736 || _1738;
            if (!_1740)
            {
                float _1742 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1744 = _1664 + _1742;
                float _1746 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1748 = _1746 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1750 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1752 = _1750 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1754 = 1.0 / _1748;
                float _1756 = _1744 * _1754;
                float _1758 = fma(_1756, _1752, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1700 = _1758;
                _1730 = true;
            }
            else
            {
                _1700 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1730 = false;
    float _1760 = _1700;
    float _1762 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1764 = _1630 + _1762;
    float _1766 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1768 = _1624 + _1766;
    float _1770 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1772 = _1632 + _1770;
    bool _1774 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan(0.5);
    bool _1782 = _1778 || _1780;
    float _1784 = fma(_1764, _1760, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1786 = fma(_1768, _1760, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1788 = fma(_1772, _1760, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1790 = -_1060;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1784);
    float _1794 = -_1050;
    float _1796 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1786);
    float _1798 = -_1098;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1788);
    float _1802 = _1796;
    float _1804 = _1792;
    float _1806 = _1800;
    if (!_1782)
    {
        float _1808 = _1146 * _1146;
        float _1810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1812 = -_932;
        float _1814 = _1812 + _1784;
        float _1816 = -_928;
        float _1818 = _1816 + _1786;
        float _1820 = fma(_1150, _1150, _1808);
        float _1822 = fma(_1162, _1162, _1820);
        float _1824 = 1.0 / _1270;
        float _1826 = sqrt(_1822);
        float _1828 = precise::min(_1826, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1830 = _1828 * _1810;
        float _1832 = -_934;
        float _1834 = _1832 + _1788;
        float _1836 = _1830 * _1824;
        float _1838 = fma(_1814, _1836, _1136);
        float _1840 = fma(_1818, _1836, _1132);
        float _1842 = fma(_1834, _1836, _1142);
        _1802 = _1840;
        _1804 = _1838;
        _1806 = _1842;
    }
    float _1844 = _1802;
    float _1846 = _1804;
    float _1848 = _1806;
    float _1850 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1852 = _1844 + _1850;
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1856 = _1846 + _1854;
    float _1858 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1860 = _1848 + _1858;
    float _1862 = _1852 * _1852;
    float _1864 = fma(_1856, _1856, _1862);
    float _1866 = fma(_1860, _1860, _1864);
    float _1868 = rsqrt(_1866);
    float _1870 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1872 = _1856 * _1870;
    float _1874 = _1860 * _1870;
    float _1876 = _1872 * _1872;
    float _1878 = _1874 * _1874;
    float _1880 = _1876 + _1878;
    float _1882 = sqrt(_1880);
    bool _1884 = _1882 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1888 = _1882 + _1886;
    float _1890 = _1868;
    float _1892 = _1888;
    float _1894 = _1852;
    float _1896 = _1870;
    float _1898 = _1872;
    if (_1884)
    {
        float _1900 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1890 = _1900;
    }
    float _1902 = _1890;
    if (_1884)
    {
        float _1904 = rsqrt(_1880);
        _1692 = _1904;
    }
    float _1906 = _1692;
    float _1908 = _1906;
    if (_1884)
    {
        float _1910 = _1888 * _1902;
        _1892 = _1910;
    }
    float _1912 = _1892;
    if (_1884)
    {
        float _1914 = _1912 * 0.15915493667125701904296875;
        _1694 = _1914;
    }
    float _1916 = _1694;
    float _1918 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1920 = _1902;
    if (_1884)
    {
        float _1922 = _1916 * 6.283185482025146484375;
        float _1924 = sin(_1922);
        _1920 = _1924;
    }
    float _1926 = _1920;
    float _1928 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1930 = precise::max(0.0, _1928);
    float _1932 = _1860;
    float _1934 = _1930;
    if (_1884)
    {
        float _1936 = _1916 * 6.283185482025146484375;
        float _1938 = cos(_1936);
        _1932 = _1938;
    }
    float _1940 = _1932;
    float _1942 = -_1870;
    float _1944 = -_1930;
    float _1946 = fma(_1852, _1942, _1944);
    if (!_1884)
    {
        _1894 = _1876;
    }
    float _1948 = _1894;
    float _1950 = _1948;
    if (_1884)
    {
        float _1952 = _1946 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1934 = _1952;
    }
    float _1954 = _1934;
    float _1956 = sqrt(_1866);
    float _1958 = _1926;
    float _1960 = _1954;
    if (_1884)
    {
        float _1962 = fma(_1926, _1954, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1958 = _1962;
    }
    float _1964 = _1958;
    float _1966 = _1964;
    if (_1884)
    {
        float _1968 = _1940 + (-1.0);
        _1960 = _1968;
    }
    float _1970 = _1960;
    float _1972 = _1970;
    if (_1884)
    {
        float _1974 = _1906 * _1964;
        _1218 = _1974;
    }
    float _1976 = _1218;
    if (!_1884)
    {
        _1908 = _1946;
    }
    float _1978 = _1908;
    float _1980 = _1978;
    if (_1884)
    {
        float _1982 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1896 = _1982;
    }
    float _1984 = _1896;
    if (_1884)
    {
        float _1986 = _1872 * _1976;
        _1898 = _1986;
    }
    float _1988 = _1898;
    if (!_1884)
    {
        _1966 = _1874;
    }
    float _1990 = _1966;
    float _1992 = _1990;
    if (_1884)
    {
        float _1994 = _1874 * _1976;
        _1992 = _1994;
    }
    float _1996 = _1992;
    if (_1884)
    {
        float _1998 = fma(_1946, _1940, _1984);
        _1980 = _1998;
    }
    float _2000 = _1980;
    if (_1884)
    {
        float _2002 = _1988 * _1988;
        _1950 = _2002;
    }
    float _2004 = _1950;
    if (!_1884)
    {
        _1972 = _1878;
    }
    float _2006 = _1972;
    float _2008 = _2006;
    if (_1884)
    {
        float _2010 = _1996 * _1996;
        _2008 = _2010;
    }
    float _2012 = _2008;
    float _2014 = fma(_2000, _2000, _2004);
    float _2016 = _2014 + _2012;
    float _2018 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2022 = fma(_1956, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2020);
    float _2024 = precise::clamp(_2022, 0.0, 1.0);
    float _2026 = rsqrt(_2016);
    float _2028 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2018);
    float _2030 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2032 = -_2024;
    float _2034 = _2032 + 1.0;
    float _2036 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2028);
    float _2038 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2040 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2030);
    float _2042 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2044 = abs(_2034);
    float _2046 = log2(_2044);
    float _2048 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2038);
    float _2050 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2040);
    float _2052 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2042);
    float _2054 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2056 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2048);
    float _2058 = _2050 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2060 = _2026 * _1988;
    float _2062 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2052);
    float _2064 = _2056 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2066 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2068 = _2026 * _2000;
    float _2070 = _2060 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2072 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2074 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2066);
    float _2076 = _2026 * _1996;
    float _2078 = -_2070;
    float _2080 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2078);
    float _2082 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2084 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2086 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2074);
    float _2088 = -_2072;
    float _2090 = fma(_2088, _1918, 1.0);
    float _2092 = -_2076;
    float _2094 = fma(_2092, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2080);
    float _2096 = exp2(_2082);
    float _2098 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2086);
    float _2100 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2102 = fma(_2094, -0.5, 0.5);
    float _2104 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2106 = fma(_2094, 0.5, 0.5);
    float _2108 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2100);
    float _2110 = log2(_2090);
    float _2112 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2104);
    float _2114 = _2068 + 1.0;
    float _2116 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2108);
    float _2118 = fma(_2106, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2120 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2112);
    float _2122 = 1.0 / _2098;
    float _2124 = -_2068;
    float _2126 = fma(_2096, _2114, _2124);
    float _2128 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2116);
    float _2130 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2120);
    float _2132 = fma(_2106, _2118, -0.212114393711090087890625);
    float _2134 = fma(_2126, 0.5, 0.5);
    float _2136 = sqrt(_2102);
    float _2138 = _2110 * 0.693147182464599609375;
    float _2140 = fma(_2106, _2132, 1.570728778839111328125);
    float _2142 = _2128 * _2122;
    float _2144 = _2130 * _2122;
    float _2146 = _2138 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2148 = fma(_2142, 0.5, 0.5);
    float _2150 = fma(_2144, -0.5, 0.5);
    float _2152 = _2136 * 0.636619746685028076171875;
    float3 _5610 = float3(_2148, _2150, _2146);
    float _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5610, float3(0.0), isnan(_5610)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5610, float3(0.0), isnan(_5610)), level(0.0)).x;
    float3 _5621 = float3(_2148, _2150, _2146);
    float4 _2157 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5621, float3(0.0), isnan(_5621)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5621, float3(0.0), isnan(_5621)), level(0.0)).xyzw;
    float _2159 = _2157.x;
    float _2161 = _2157.y;
    float _2163 = _2157.z;
    float _2165 = _2157.w;
    float _2167 = -_2140;
    float _2169 = fma(_2152, _2167, 1.0);
    float2 _5643 = float2(_2169, _2134);
    float3 _2173 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5643, float2(0.0), isnan(_5643)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5643, float2(0.0), isnan(_5643)), level(0.0)).xyz;
    float _2175 = _2173.x;
    float _2177 = _2173.y;
    float _2179 = _2173.z;
    float _2181 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2183 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2185 = _242 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2187 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2183);
    float _2189 = exp2(_2181);
    float _2191 = _2185 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2193 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2187);
    float _2195 = _2128 + _2098;
    out.m_47.x = _2191;
    float _2197 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2193);
    float _2199 = _2195 * 0.5;
    float _2201 = _2098 * 0.5;
    float _2203 = _2197 + _2098;
    out.gl_Position.x = _2128;
    out.gl_Position.y = _2130;
    out.gl_Position.z = _2197;
    out.gl_Position.w = _2098;
    float _2205 = -_2189;
    float _2207 = _2205 + 1.0;
    float _2209 = _2203 * 0.5;
    float _2211 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2213 = fma(_2130, -0.5, _2201);
    out.m_77.x = _2199;
    out.m_77.y = _2213;
    out.m_77.z = _2209;
    out.m_77.w = _2098;
    float _2215 = _2211 * _2154;
    float _2217 = -_2211;
    float _2219 = _2217 + 1.0;
    float _2221 = _2165 * _2215;
    float _2223 = _2179 * _2215;
    float _2225 = fma(_2175, _2221, _2159);
    float _2227 = fma(_2177, _2221, _2161);
    float _2229 = _2165 * _2219;
    float _2231 = fma(_2165, _2223, _2163);
    out.m_79.x = _2225;
    out.m_79.y = _2227;
    out.m_79.z = _2231;
    out.m_79.w = _2229;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1730 = false;
    bool _266 = false;
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
        float _2288 = as_type<float>(_114);
        out.gl_Position.z = _2288;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = 0.0;
    float _136 = _132;
    if (_128)
    {
        float _138 = float(_98);
        _134 = _138;
    }
    float _140 = _134;
    bool _142 = _132 >= _140;
    bool _144 = !_128;
    bool _146 = _142 || _144;
    if (_146)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _108;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2357 = as_type<float>(_152);
        out.gl_Position.z = _2357;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_51.x;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _132 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _162 = _160 != 0;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _166 = _164 != 0;
    int _168 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _170 = _168 != 0;
    float _172 = _158 * _156;
    float _174 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    float _176 = _174 * 6.283185482025146484375;
    float _178 = floor(_174);
    float _180 = _176 * 0.15915493667125701904296875;
    bool _182 = !_162;
    int _184 = _182 ? 0 : 1;
    int _186 = abs(_184);
    float _188 = _180 * 6.283185482025146484375;
    float _190 = cos(_188);
    bool _192 = !_170;
    int _194 = _192 ? 0 : 1;
    bool _196 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _198 = abs(_194);
    float _200 = -_178;
    float _202 = _174 + _200;
    bool _204 = !_166;
    int _206 = _204 ? 0 : 1;
    float _208 = float(_186);
    int _210 = abs(_206);
    float _212 = -_202;
    float _214 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _216 = fma(_190, 0.5, 0.5);
    bool _218 = _202 < 0.5;
    float _220 = float(_218);
    float _222 = abs(_214);
    float _224 = _208 * _222;
    float _226 = float(_198);
    float _228 = -_216;
    float _230 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _232 = -_220;
    float _234 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _236 = float(_210);
    float _238 = fma(_226, _230, _224);
    float _240 = abs(_234);
    float _242 = fma(_236, _240, _238);
    bool _244 = !_196;
    bool _246 = _166;
    float _248 = as_type<float>(_198);
    float _264;
    if (!_244)
    {
        float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _252 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _254 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _256 = _254 * _250;
        float _258 = floor(_256);
        float _260 = -_258;
        float _262 = _256 + _260;
        _264 = _262;
        _266 = true;
    }
    else
    {
        float _268 = float(_98);
        float _270 = 1.0 / _268;
        float _272 = _132 * _270;
        _264 = _272;
    }
    _266 = false;
    float _274 = _264;
    float _276 = in.m_53.x;
    float _278 = in.m_53.y;
    float _280 = _154 * 2.0;
    float _282 = in.m_55.x;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _286 = _284 != 0;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _290 = _274 + _288;
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _294 = _292 != 0;
    float _296 = in.m_44.x;
    float _298 = in.m_44.y;
    float _300 = in.m_44.z;
    float _302 = floor(_280);
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _306 = _304 != 0;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _308;
    float _312 = in.m_51.w;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _316 = _314 != 0;
    float _318 = in.m_51.y;
    float _320 = 1.0 / _310;
    if (_286)
    {
        bool _322 = _154 > 0.5;
        _246 = _322;
    }
    bool _324 = _246;
    float _326 = 0.0;
    if (_294)
    {
        float _328 = in.m_51.z;
        _326 = _328;
    }
    float _330 = _326;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _334 = in.m_51.z;
    float _336 = abs(_276);
    float _338 = abs(_278);
    float _340 = precise::max(_336, _338);
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _344 = 0;
    if (_286)
    {
        float _346 = -_282;
        float _348 = _346 + 1.0;
        _344 = as_type<int>(_348);
    }
    int _350 = _344;
    if (!_286)
    {
        _248 = _282;
    }
    float _352 = _248;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _356 = _340 >= 16.0;
    float _358 = _298 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _360 = _352;
    if (_286)
    {
        float _362 = _324 ? as_type<float>(_350) : _282;
        _360 = _362;
    }
    float _364 = _360;
    float _366 = in.m_55.y;
    float _368 = _298 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _370 = _298 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _372 = _302 > 0.0;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _376 = _302 >= 0.0;
    bool _378 = isnan(_302);
    bool _380 = _376 || _378;
    bool _382 = isnan(0.0);
    bool _384 = _380 || _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _390;
    bool _394 = _312 > 0.5;
    float _396 = _318 * 2.0;
    float _398 = 1.0 / _392;
    float _400 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _368);
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _406 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _370);
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _410 = 1.0 / _388;
    float _412 = _402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _414 = _404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _416 = _332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _358);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _422 = _274 + _420;
    float _424 = -_366;
    float _426 = _424 + 1.0;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _430 = floor(_396);
    float _432 = _342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = _354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _436 = _374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _438 = _422 * _398;
    out.m_57.x = _412;
    out.m_57.y = _414;
    out.m_57.z = _416;
    out.m_57.w = _408;
    float _440 = _154 + _318;
    float _442 = _290 * _410;
    int _444 = _394 ? as_type<int>(_426) : as_type<int>(_366);
    out.m_59.x = _432;
    out.m_59.y = _434;
    out.m_59.z = _436;
    out.m_59.w = _428;
    bool _446 = _394;
    int _448 = as_type<int>(_408);
    float _450 = _440;
    float _452 = _366;
    bool _454 = _372;
    if (_294)
    {
        bool _456 = _330 > 0.5;
        _446 = _456;
    }
    bool _458 = _446;
    float _460 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _418);
    int _462 = _306 ? _444 : as_type<int>(_366);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _466 = _274 + _464;
    bool _468 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _470 = isnan(_274);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = _276 * 0.0625;
    bool _482 = _430 > 0.0;
    float _484 = _466 * _320;
    int _486 = _462;
    if (_294)
    {
        float _488 = -_282;
        float _490 = _488 + 1.0;
        _448 = as_type<int>(_490);
    }
    int _492 = _448;
    float _494 = _154 + _334;
    float _496 = _334 * 2.0;
    float _498 = _318 + _334;
    float _500 = _440 + (-1.0);
    float _502 = _494 + (-1.0);
    if (!_294)
    {
        _450 = _282;
    }
    float _504 = _450;
    float _506 = floor(_496);
    float _508 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _510 = _504;
    if (_294)
    {
        float _512 = _458 ? as_type<float>(_492) : _282;
        _510 = _512;
    }
    float _514 = _510;
    float _516 = _498 + (-1.0);
    bool _518 = _318 > 0.5;
    float _520 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _522 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _524 = isnan(_274);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _400);
    if (_316)
    {
        float _536 = _518 ? _426 : _366;
        _452 = _536;
    }
    float _538 = _452;
    float _540 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _542 = _430 >= 0.0;
    bool _544 = isnan(_430);
    bool _546 = _542 || _544;
    bool _548 = isnan(0.0);
    bool _550 = _546 || _548;
    float _552 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _406);
    float _554 = -_532;
    float _556 = _554 + 1.0;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _562;
    bool _566 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _568 = isnan(_274);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _594 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _596 = isnan(_274);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -_576;
    float _608 = _606 + 1.0;
    float _610 = _576 * _556;
    float _612 = _278 * 0.0625;
    float _614 = fma(_584, _442, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _616 = fma(_588, _442, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _618 = fma(_592, _442, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _620 = _604 * _608;
    float _622 = -_604;
    float _624 = _622 + 1.0;
    bool _626 = _506 > 0.0;
    float _628 = fma(_564, _438, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _630 = _506 >= 0.0;
    bool _632 = isnan(_506);
    bool _634 = _630 || _632;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _640;
    float _644 = _356 ? _612 : _278;
    float _646 = _478 * _624;
    float _648 = _356 ? _480 : _276;
    float _650 = fma(_580, _438, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _652 = fma(_642, _438, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _654 = abs(_644);
    bool _656 = _654 != 0.0;
    bool _658 = isnan(_654);
    bool _660 = _656 || _658;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    float _666 = fma(_560, _484, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _670 = _628 * _646;
    int _672 = _384 ? 0 : 1;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _674;
    float _678 = abs(_648);
    bool _680 = _678 == 0.0;
    bool _682 = !_664;
    bool _684 = _680 && _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _686;
    int _690 = ~_672;
    int _692 = _690 + 1;
    int _694 = _692 + 1;
    float _696 = fma(_676, _484, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _698 = _694;
    int _700 = as_type<int>(_670);
    if (!_372)
    {
        int _702 = ~_672;
        int _704 = _702 + 1;
        _698 = _704;
    }
    int _706 = _698;
    float _708 = fma(_688, _484, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _710 = _638 ? 0 : 1;
    float _712 = _652 * _646;
    float _714 = abs(_648);
    bool _716 = _714 == 0.0;
    float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _720 = _650 * _646;
    float _722 = -_478;
    float _724 = _722 + 1.0;
    int _726 = _550 ? 0 : 1;
    float _728 = _538 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_684)
    {
        bool _730 = as_type<int>(_648) >= 0;
        _454 = _730;
    }
    bool _732 = _454;
    float _734 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[143].x, _670);
    int _736 = ~_710;
    int _738 = _736 + 1;
    int _740 = _738 + 1;
    float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _744 = _740;
    int _746 = _732 ? (-1) : 0;
    if (_684)
    {
        int _748 = _732 ? 0 : 1078530011;
        _700 = _748;
    }
    int _750 = _700;
    float _752 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[143].y, _720);
    if (!_626)
    {
        int _754 = ~_710;
        int _756 = _754 + 1;
        _744 = _756;
    }
    int _758 = _744;
    float _760 = as_type<float>(_462) * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _762 = ~_726;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    float _768 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[143].z, _712);
    int _770 = _766;
    if (!_482)
    {
        int _772 = ~_726;
        int _774 = _772 + 1;
        _770 = _774;
    }
    int _776 = _770;
    float _778 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _780 = log2(_778);
    if (_684)
    {
        int _782 = int(0x80000000) & as_type<int>(_644);
        int _784 = _750 | _782;
        _486 = _784;
    }
    int _786 = _486;
    bool _788 = !_664;
    bool _790 = _788 && _716;
    int _792 = _786;
    float _794 = as_type<float>(_786);
    if (!_790)
    {
        float _796 = abs(_644);
        bool _798 = _796 != as_type<float>(0x7f800000u /* inf */);
        bool _800 = isnan(_796);
        bool _802 = _798 || _800;
        bool _804 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _806 = _802 || _804;
        float _808 = abs(_648);
        bool _810 = _808 == as_type<float>(0x7f800000u /* inf */);
        float _812 = abs(_648);
        bool _814 = _812 == as_type<float>(0x7f800000u /* inf */);
        bool _816 = !_806;
        bool _818 = _814 && _816;
        if (_818)
        {
            bool _820 = as_type<int>(_648) >= 0;
            _746 = _820 ? (-1) : 0;
        }
        int _822 = _746;
        if (_818)
        {
            _792 = 1075235812;
        }
        int _824 = _792;
        int _826 = _824;
        if (_818)
        {
            int _828 = ~_822;
            int _830 = (_828 != 0) ? _824 : 1061752795;
            _826 = _830;
        }
        int _832 = _826;
        float _834 = as_type<float>(_832);
        if (_818)
        {
            int _836 = int(0x80000000) & as_type<int>(_644);
            int _838 = _832 | _836;
            _834 = as_type<float>(_838);
        }
        float _840 = _834;
        bool _842 = !_806;
        bool _844 = _842 && _810;
        _794 = _840;
        if (!_844)
        {
            float _846 = abs(_644);
            float _848 = abs(_648);
            float _850 = precise::max(_846, _848);
            float _852 = abs(_644);
            float _854 = abs(_648);
            float _856 = precise::min(_852, _854);
            float _858 = 1.0 / _850;
            float _860 = abs(_644);
            float _862 = abs(_648);
            bool _864 = _860 > _862;
            bool _866 = as_type<int>(_648) >= 0;
            float _868 = abs(_644);
            float _870 = abs(_648);
            float _872 = _868 + _870;
            int _874 = as_type<int>(_644) & int(0x80000000);
            bool _876 = _872 > as_type<float>(0x7f800000u /* inf */);
            bool _878 = isnan(_872);
            bool _880 = _876 || _878;
            bool _882 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _884 = _880 || _882;
            float _886 = _856 * _858;
            float _888 = _886 * _886;
            float _890 = _888 + 11.33538818359375;
            float _892 = fma(_888, _890, 28.84246826171875);
            float _894 = fma(_888, _892, 19.6966705322265625);
            float _896 = fma(_888, -0.82336294651031494140625, -5.674867153167724609375);
            float _898 = fma(_888, _896, -6.565555095672607421875);
            float _900 = 1.0 / _894;
            float _902 = _888 * _898;
            float _904 = _886 * _902;
            float _906 = fma(_904, _900, _886);
            float _908 = _906;
            _794 = _872;
            if (_864)
            {
                float _910 = -_906;
                float _912 = _910 + 1.57079637050628662109375;
                _908 = _912;
            }
            float _914 = _908;
            int _916 = as_type<int>(_914);
            if (!_866)
            {
                float _918 = -_914;
                float _920 = _918 + 3.1415927410125732421875;
                _916 = as_type<int>(_920);
            }
            int _922 = _916;
            if (!_884)
            {
                int _924 = _874 | _922;
                _794 = as_type<float>(_924);
            }
        }
    }
    float _926 = _794;
    float _928 = _534 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _930 = _728 * _718;
    float _932 = _460 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _934 = _552 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _938 = _928 + _936;
    float _940 = _760 * _742;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _944 = _932 + _942;
    float _946 = _780 * _132;
    float _948 = _938 * _938;
    float _950 = _364 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _954 = _934 + _952;
    float _956 = _938 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _958 = fma(_944, _944, _948);
    float _960 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _962 = _950 * _668;
    float _964 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[28].x, _956);
    float _966 = fma(_954, _954, _958);
    float _968 = _514 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _970 = precise::max(_926, -3.1415927410125732421875);
    float _972 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[28].z, _964);
    float _974 = exp2(_946);
    float _976 = precise::min(_970, 3.1415927410125732421875);
    float _978 = _318 + (-0.5);
    bool _980 = _972 >= 0.0;
    float _982 = float(_706);
    float _984 = fma(_976, 0.15915493667125701904296875, 0.5);
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _988 = _986 != 0;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _992 = _990 != 0;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _996 = _994 != 0;
    float _998 = rsqrt(_966);
    float _1000 = _968 * _960;
    float _1002 = in.m_61.x;
    float _1004 = in.m_61.y;
    float _1006 = in.m_61.z;
    bool _1008 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1010 = isnan(0.0);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1016 = _1012 || _1014;
    out.m_63.x = _962;
    out.m_63.y = _930;
    out.m_63.z = _1000;
    out.m_63.w = _940;
    bool _1018 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1020 = isnan(1.0);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1026 = _1022 || _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1030 = 1.0 + _1028;
    float _1032 = -_974;
    float _1034 = _1032 + 1.0;
    float _1036 = float(_776);
    float _1038 = _940;
    int _1040 = as_type<int>(_938);
    if (_980)
    {
        out.m_47.x = 0.0;
    }
    float _1042 = 1.0 / _1030;
    float _1044 = _1016 ? _1034 : 0.0;
    bool _1046 = !_992;
    int _1048 = _1046 ? 0 : 1;
    float _1050 = _938 * _998;
    if (_980)
    {
        _1038 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1052 = _1038;
    int _1054 = abs(_1048);
    float _1056 = -_1050;
    float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[18].w, _938);
    float _1060 = _944 * _998;
    if (_980)
    {
        float _1062 = _1052 * 5.0;
        _1040 = as_type<int>(_1062);
    }
    int _1064 = _1040;
    float _1066 = _1058 * _1058;
    float _1068 = -_1060;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[18].w, _944);
    float _1072 = float(_1054);
    if (_980)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3796 = as_type<float>(_1064);
        out.gl_Position.z = _3796;
    }
    float _1074 = fma(_1070, _1070, _1066);
    float _1076 = fma(_132, 0.06666667759418487548828125, _984);
    float _1078 = float(_758);
    float _1080 = _1072 * _982;
    bool _1082 = !_996;
    int _1084 = _1082 ? 0 : 1;
    if (_1026)
    {
        float _1086 = _1044 * _1042;
        _136 = _1086;
    }
    float _1088 = _136;
    bool _1090 = !_988;
    int _1092 = _1090 ? 0 : 1;
    int _1094 = abs(_1084);
    int _1096 = abs(_1092);
    float _1098 = _954 * _998;
    float _1100 = _1080 * (-2.0);
    float _1102 = -_1098;
    float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[18].w, _954);
    float _1106 = fma(_1100, _1004, _1004);
    float _1108 = float(_1094);
    float _1110 = fma(_540, _1100, _540);
    float _1112 = fma(_1104, _1104, _1074);
    float _1114 = float(_1096);
    float _1116 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1106);
    float _1118 = _1108 * _1036;
    float _1120 = _334 + (-0.5);
    float _1122 = sqrt(_1112);
    float _1124 = _1114 * _1078;
    float _1126 = fma(_1110, _1088, _1116);
    float _1128 = _1076 * 6.283185482025146484375;
    if (_980)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1130 = -_1050;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[18].w, _928);
    float _1134 = -_1060;
    float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[18].w, _932);
    float _1138 = _1118 * (-2.0);
    float _1140 = -_1098;
    float _1142 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[18].w, _934);
    float _1144 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1146 = _1132 + _1144;
    float _1148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1150 = _1136 + _1148;
    float _1152 = _1128 * 0.15915493667125701904296875;
    float _1154 = fma(_1138, _1006, _1006);
    float _1156 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1158 = _1126 * 0.15915493667125701904296875;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1162 = _1142 + _1160;
    float _1164 = fma(_520, _1138, _520);
    float _1166 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1156);
    float _1168 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1154);
    float _1170 = _1124 * (-2.0);
    float _1172 = _154 + (-0.5);
    float _1174 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1166);
    float _1176 = fma(_1164, _1088, _1168);
    float _1178 = fma(_1170, _1002, _1002);
    float _1180 = fma(_508, _1170, _508);
    float _1182 = fma(_614, _620, _734);
    bool _1184 = _1174 >= 0.0;
    float _1186 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1178);
    float _1188 = fma(_616, _620, _752);
    float _1190 = fma(_618, _620, _768);
    float _1192 = _1176 * 0.15915493667125701904296875;
    float _1194 = fma(_1180, _1088, _1186);
    float _1196 = in.m_65.x;
    float _1198 = in.m_65.y;
    float _1200 = in.m_65.z;
    float _1202 = fma(_696, _610, _1182);
    float _1204 = fma(_666, _610, _1188);
    float _1206 = fma(_708, _610, _1190);
    float _1208 = in.m_53.z;
    float _1210 = _1194 * 0.15915493667125701904296875;
    float _1212 = _1152 * 6.283185482025146484375;
    float _1214 = sin(_1212);
    float _1216 = _1174;
    float _1218 = _1136;
    if (_1184)
    {
        _1216 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1220 = _1216;
    int _1222 = as_type<int>(_1220);
    if (_1184)
    {
        out.m_47.x = 0.0;
    }
    float _1224 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1202);
    float _1226 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1204);
    if (_1184)
    {
        float _1228 = _1220 * 5.0;
        _1222 = as_type<int>(_1228);
    }
    int _1230 = _1222;
    float _1232 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1206);
    float _1234 = _1158 * 6.283185482025146484375;
    float _1236 = sin(_1234);
    if (_1184)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4071 = as_type<float>(_1230);
        out.gl_Position.z = _4071;
    }
    float _1238 = _1158 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = _1192 * 6.283185482025146484375;
    float _1244 = sin(_1242);
    float _1246 = _1192 * 6.283185482025146484375;
    float _1248 = cos(_1246);
    float _1250 = _1210 * 6.283185482025146484375;
    float _1252 = sin(_1250);
    if (_1184)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1254 = _1210 * 6.283185482025146484375;
    float _1256 = cos(_1254);
    float _1258 = _1226 * _1198;
    float _1260 = fma(_1214, 0.5, 1.5);
    float _1262 = _1240 * _1248;
    float _1264 = _1236 * _1244;
    float _1266 = _1232 * _1200;
    float _1268 = _1224 * _1196;
    float _1270 = _998 * _1122;
    float _1272 = _1260 * _278;
    float _1274 = fma(_1252, _1264, _1262);
    float _1276 = _1258 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1278 = fma(_1252, _1262, _1264);
    float _1280 = _1240 * _1244;
    float _1282 = _1236 * _1248;
    float _1284 = _1266 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1286 = _1260 * _276;
    float _1288 = _1248 * _1256;
    float _1290 = _1268 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1272);
    float _1294 = _1270 * _1276;
    float _1296 = _1244 * _1256;
    float _1298 = _1236 * _1256;
    float _1300 = _1260 * _1208;
    float _1302 = _1240 * _1256;
    float _1304 = -_1282;
    float _1306 = fma(_1252, _1280, _1304);
    float _1308 = _1270 * _1284;
    float _1310 = -_1280;
    float _1312 = fma(_1252, _1282, _1310);
    float _1314 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1316 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1286);
    float _1318 = _1270 * _1290;
    float _1320 = _1292 * _1294;
    float _1322 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1300);
    float _1324 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1314);
    float _1326 = _1316 * _1318;
    float _1328 = _1288 * _1320;
    float _1330 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1332 = _1288 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1334 = _1322 * _1308;
    float _1336 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1338 = fma(_1296, _1326, _1328);
    float _1340 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1342 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1330);
    float _1344 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1332);
    float _1346 = _1312 * _1320;
    float _1348 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1336);
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1352 = _1252 * _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1356 = _1252 * _1354;
    float _1358 = -_1252;
    float _1360 = fma(_1358, _1334, _1338);
    float _1362 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1340);
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1366 = _1252 * _1364;
    float _1368 = _1278 * _1320;
    float _1370 = fma(_1274, _1326, _1346);
    float _1372 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1352);
    float _1374 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1366);
    float _1376 = fma(_1306, _1326, _1368);
    float _1378 = fma(_1298, _1334, _1370);
    float _1380 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1382 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1384 = fma(_1302, _1334, _1376);
    float _1386 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1356);
    float _1388 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1380);
    float _1390 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1382);
    float _1392 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1394 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1372);
    float _1396 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1388);
    float _1398 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1390);
    float _1400 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1386);
    float _1402 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1374);
    float _1404 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1406 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1408 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1392);
    float _1410 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1348);
    float _1412 = _932 + _1404;
    float _1414 = _934 + _1406;
    float _1416 = in.m_67.x;
    float _1418 = in.m_67.y;
    float _1420 = in.m_67.z;
    float _1422 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1362);
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1426 = _1412 + _1424;
    float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1430 = _1414 + _1428;
    bool _1432 = _1272 != 0.0;
    bool _1434 = isnan(_1272);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan(0.0);
    bool _1440 = _1436 || _1438;
    float _1442 = in.m_69.x;
    float _1444 = in.m_69.y;
    float _1446 = in.m_69.z;
    float _1448 = in.m_69.w;
    float _1450 = _1426 * _1426;
    float _1452 = _1430 * _1430;
    bool _1454 = _1286 == 0.0;
    bool _1456 = !_1440;
    bool _1458 = _1454 && _1456;
    float _1460 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1462 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1408);
    float _1464 = _1450 + _1452;
    bool _1466 = _1300 == 0.0;
    bool _1468 = _1466 && _1458;
    float _1470 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1324);
    float _1472 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1460);
    float _1474 = sqrt(_1464);
    float _1476 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1342);
    float _1478 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1344);
    float _1480 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1472);
    float _1482 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1484 = _1408;
    float _1486 = _1372;
    float _1488 = _1404;
    float _1490 = _1450;
    float _1492 = _1452;
    float _1494 = _1412;
    float _1496 = _1414;
    if (_1468)
    {
        _1484 = _1416;
    }
    float _1498 = _1484;
    float _1500 = _1498;
    if (!_1468)
    {
        float _1502 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1416);
        _1500 = _1502;
    }
    float _1504 = _1500;
    if (_1468)
    {
        _1486 = _1418;
    }
    float _1506 = _1486;
    float _1508 = _1506;
    if (!_1468)
    {
        float _1510 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1418);
        _1508 = _1510;
    }
    float _1512 = _1508;
    if (_1468)
    {
        _1488 = _1420;
    }
    float _1514 = _1488;
    float _1516 = _1514;
    if (!_1468)
    {
        float _1518 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1420);
        _1516 = _1518;
    }
    float _1520 = _1516;
    bool _1522 = _1474 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1524 = _1470 * _1444;
    float _1526 = _1476 * _1444;
    float _1528 = _1478 * _1444;
    float _1530 = _1446 * _1416;
    float _1532 = fma(_1410, _1442, _1524);
    float _1534 = _1442 * _1418;
    float _1536 = _1444 * _1420;
    float _1538 = fma(_1422, _1442, _1526);
    float _1540 = fma(_1462, _1442, _1528);
    float _1542 = -_1530;
    float _1544 = fma(_1442, _1420, _1542);
    float _1546 = -_1534;
    float _1548 = fma(_1444, _1416, _1546);
    float _1550 = -_1536;
    float _1552 = fma(_1446, _1418, _1550);
    float _1554 = _928 + _1482;
    float _1556 = fma(_1394, _1446, _1532);
    float _1558 = fma(_1400, _1446, _1538);
    float _1560 = fma(_1402, _1446, _1540);
    float _1562 = _1544 * _1448;
    float _1564 = _1552 * _1448;
    float _1566 = _1548 * _1448;
    float _1568 = _1448;
    if (!_1522)
    {
        _1568 = _1554;
    }
    float _1570 = _1568;
    bool _1572 = !_1522;
    float _1574 = _1570;
    if (!_1572)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1580 = _1474 + _1578;
        float _1582 = _1554 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1584 = rsqrt(_1464);
        float _1586 = _1580 * _1576;
        float _1588 = _1586 * 0.15915493667125701904296875;
        float _1590 = _1588 * 6.283185482025146484375;
        float _1592 = sin(_1590);
        float _1594 = _1588 * 6.283185482025146484375;
        float _1596 = cos(_1594);
        float _1598 = fma(_1592, _1582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1600 = _1584 * _1598;
        float _1602 = _1596 + (-1.0);
        float _1604 = fma(_1426, _1600, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1606 = fma(_1430, _1600, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1608 = _1602 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1612 = _1604 + _1610;
        float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1616 = _1606 + _1614;
        float _1618 = fma(_1554, _1596, _1608);
        float _1620 = _1612 * _1612;
        float _1622 = _1616 * _1616;
        _1574 = _1618;
        _1490 = _1620;
        _1492 = _1622;
        _1494 = _1604;
        _1496 = _1606;
    }
    float _1624 = _1574;
    float _1626 = _1490;
    float _1628 = _1492;
    float _1630 = _1494;
    float _1632 = _1496;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1636 = _1624 + _1634;
    float _1638 = _1470 * _1512;
    float _1640 = _1476 * _1512;
    float _1642 = _1478 * _1512;
    float _1644 = fma(_1636, _1636, _1626);
    float _1646 = fma(_1410, _1504, _1638);
    float _1648 = fma(_1422, _1504, _1640);
    float _1650 = fma(_1462, _1504, _1642);
    float _1652 = _1644 + _1628;
    float _1654 = _1562 * _1470;
    float _1656 = _1562 * _1476;
    float _1658 = _1562 * _1478;
    float _1660 = fma(_1400, _1520, _1648);
    float _1662 = fma(_1564, _1410, _1654);
    float _1664 = sqrt(_1652);
    float _1666 = fma(_1564, _1422, _1656);
    float _1668 = fma(_1564, _1462, _1658);
    float _1670 = fma(_1394, _1520, _1646);
    float _1672 = fma(_1566, _1394, _1662);
    float _1674 = fma(_1566, _1400, _1666);
    float _1676 = fma(_1402, _1520, _1650);
    float _1678 = fma(_1566, _1402, _1668);
    out.m_71.x = _1556;
    out.m_71.y = _1558;
    out.m_71.z = _1560;
    out.m_73.x = _1670;
    out.m_73.y = _1660;
    out.m_73.z = _1676;
    out.m_75.x = _1672;
    out.m_75.y = _1674;
    out.m_75.z = _1678;
    bool _1680 = _1664 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1682 = isnan(_1664);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1688 = _1684 || _1686;
    float _1690 = _1648;
    float _1692 = _1672;
    float _1694 = _1678;
    if (!_1688)
    {
        _1690 = 1.0;
    }
    float _1696 = _1690;
    bool _1698 = !_1688;
    float _1700 = _1696;
    if (!_1698)
    {
        bool _1702 = _1664 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1704 = isnan(_1664);
        bool _1706 = _1702 || _1704;
        bool _1708 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1710 = _1706 || _1708;
        if (!_1710)
        {
            float _1712 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1714 = _1664 + _1712;
            float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1718 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1716;
            float _1720 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1722 = _1720 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1724 = 1.0 / _1718;
            float _1726 = _1714 * _1724;
            float _1728 = fma(_1726, _1722, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1700 = _1728;
            _1730 = true;
        }
        else
        {
            bool _1732 = _1664 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1734 = isnan(_1664);
            bool _1736 = _1732 || _1734;
            bool _1738 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1740 = _1736 || _1738;
            if (!_1740)
            {
                float _1742 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1744 = _1664 + _1742;
                float _1746 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1748 = _1746 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1750 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1752 = _1750 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1754 = 1.0 / _1748;
                float _1756 = _1744 * _1754;
                float _1758 = fma(_1756, _1752, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1700 = _1758;
                _1730 = true;
            }
            else
            {
                _1700 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1730 = false;
    float _1760 = _1700;
    float _1762 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1764 = _1630 + _1762;
    float _1766 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1768 = _1624 + _1766;
    float _1770 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1772 = _1632 + _1770;
    bool _1774 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan(0.5);
    bool _1782 = _1778 || _1780;
    float _1784 = fma(_1764, _1760, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1786 = fma(_1768, _1760, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1788 = fma(_1772, _1760, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1790 = -_1060;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1784);
    float _1794 = -_1050;
    float _1796 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1786);
    float _1798 = -_1098;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1788);
    float _1802 = _1796;
    float _1804 = _1792;
    float _1806 = _1800;
    if (!_1782)
    {
        float _1808 = _1146 * _1146;
        float _1810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1812 = -_932;
        float _1814 = _1812 + _1784;
        float _1816 = -_928;
        float _1818 = _1816 + _1786;
        float _1820 = fma(_1150, _1150, _1808);
        float _1822 = fma(_1162, _1162, _1820);
        float _1824 = 1.0 / _1270;
        float _1826 = sqrt(_1822);
        float _1828 = precise::min(_1826, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1830 = _1828 * _1810;
        float _1832 = -_934;
        float _1834 = _1832 + _1788;
        float _1836 = _1830 * _1824;
        float _1838 = fma(_1814, _1836, _1136);
        float _1840 = fma(_1818, _1836, _1132);
        float _1842 = fma(_1834, _1836, _1142);
        _1802 = _1840;
        _1804 = _1838;
        _1806 = _1842;
    }
    float _1844 = _1802;
    float _1846 = _1804;
    float _1848 = _1806;
    float _1850 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1852 = _1844 + _1850;
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1856 = _1846 + _1854;
    float _1858 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1860 = _1848 + _1858;
    float _1862 = _1852 * _1852;
    float _1864 = fma(_1856, _1856, _1862);
    float _1866 = fma(_1860, _1860, _1864);
    float _1868 = rsqrt(_1866);
    float _1870 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1872 = _1856 * _1870;
    float _1874 = _1860 * _1870;
    float _1876 = _1872 * _1872;
    float _1878 = _1874 * _1874;
    float _1880 = _1876 + _1878;
    float _1882 = sqrt(_1880);
    bool _1884 = _1882 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1888 = _1882 + _1886;
    float _1890 = _1868;
    float _1892 = _1888;
    float _1894 = _1852;
    float _1896 = _1870;
    float _1898 = _1872;
    if (_1884)
    {
        float _1900 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1890 = _1900;
    }
    float _1902 = _1890;
    if (_1884)
    {
        float _1904 = rsqrt(_1880);
        _1692 = _1904;
    }
    float _1906 = _1692;
    float _1908 = _1906;
    if (_1884)
    {
        float _1910 = _1888 * _1902;
        _1892 = _1910;
    }
    float _1912 = _1892;
    if (_1884)
    {
        float _1914 = _1912 * 0.15915493667125701904296875;
        _1694 = _1914;
    }
    float _1916 = _1694;
    float _1918 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1920 = _1902;
    if (_1884)
    {
        float _1922 = _1916 * 6.283185482025146484375;
        float _1924 = sin(_1922);
        _1920 = _1924;
    }
    float _1926 = _1920;
    float _1928 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1930 = precise::max(0.0, _1928);
    float _1932 = _1860;
    float _1934 = _1930;
    if (_1884)
    {
        float _1936 = _1916 * 6.283185482025146484375;
        float _1938 = cos(_1936);
        _1932 = _1938;
    }
    float _1940 = _1932;
    float _1942 = -_1870;
    float _1944 = -_1930;
    float _1946 = fma(_1852, _1942, _1944);
    if (!_1884)
    {
        _1894 = _1876;
    }
    float _1948 = _1894;
    float _1950 = _1948;
    if (_1884)
    {
        float _1952 = _1946 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1934 = _1952;
    }
    float _1954 = _1934;
    float _1956 = sqrt(_1866);
    float _1958 = _1926;
    float _1960 = _1954;
    if (_1884)
    {
        float _1962 = fma(_1926, _1954, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1958 = _1962;
    }
    float _1964 = _1958;
    float _1966 = _1964;
    if (_1884)
    {
        float _1968 = _1940 + (-1.0);
        _1960 = _1968;
    }
    float _1970 = _1960;
    float _1972 = _1970;
    if (_1884)
    {
        float _1974 = _1906 * _1964;
        _1218 = _1974;
    }
    float _1976 = _1218;
    if (!_1884)
    {
        _1908 = _1946;
    }
    float _1978 = _1908;
    float _1980 = _1978;
    if (_1884)
    {
        float _1982 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1896 = _1982;
    }
    float _1984 = _1896;
    if (_1884)
    {
        float _1986 = _1872 * _1976;
        _1898 = _1986;
    }
    float _1988 = _1898;
    if (!_1884)
    {
        _1966 = _1874;
    }
    float _1990 = _1966;
    float _1992 = _1990;
    if (_1884)
    {
        float _1994 = _1874 * _1976;
        _1992 = _1994;
    }
    float _1996 = _1992;
    if (_1884)
    {
        float _1998 = fma(_1946, _1940, _1984);
        _1980 = _1998;
    }
    float _2000 = _1980;
    if (_1884)
    {
        float _2002 = _1988 * _1988;
        _1950 = _2002;
    }
    float _2004 = _1950;
    if (!_1884)
    {
        _1972 = _1878;
    }
    float _2006 = _1972;
    float _2008 = _2006;
    if (_1884)
    {
        float _2010 = _1996 * _1996;
        _2008 = _2010;
    }
    float _2012 = _2008;
    float _2014 = fma(_2000, _2000, _2004);
    float _2016 = _2014 + _2012;
    float _2018 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2022 = fma(_1956, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2020);
    float _2024 = precise::clamp(_2022, 0.0, 1.0);
    float _2026 = rsqrt(_2016);
    float _2028 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2018);
    float _2030 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2032 = -_2024;
    float _2034 = _2032 + 1.0;
    float _2036 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2028);
    float _2038 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2040 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2030);
    float _2042 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2044 = abs(_2034);
    float _2046 = log2(_2044);
    float _2048 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2038);
    float _2050 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2040);
    float _2052 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2042);
    float _2054 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2056 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2048);
    float _2058 = _2050 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2060 = _2026 * _1988;
    float _2062 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2052);
    float _2064 = _2056 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2066 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2068 = _2026 * _2000;
    float _2070 = _2060 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2072 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2074 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2066);
    float _2076 = _2026 * _1996;
    float _2078 = -_2070;
    float _2080 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2078);
    float _2082 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2084 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2086 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2074);
    float _2088 = -_2072;
    float _2090 = fma(_2088, _1918, 1.0);
    float _2092 = -_2076;
    float _2094 = fma(_2092, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2080);
    float _2096 = exp2(_2082);
    float _2098 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2086);
    float _2100 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2102 = fma(_2094, -0.5, 0.5);
    float _2104 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2106 = fma(_2094, 0.5, 0.5);
    float _2108 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2100);
    float _2110 = log2(_2090);
    float _2112 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2104);
    float _2114 = _2068 + 1.0;
    float _2116 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2108);
    float _2118 = fma(_2106, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2120 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2112);
    float _2122 = 1.0 / _2098;
    float _2124 = -_2068;
    float _2126 = fma(_2096, _2114, _2124);
    float _2128 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2116);
    float _2130 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2120);
    float _2132 = fma(_2106, _2118, -0.212114393711090087890625);
    float _2134 = fma(_2126, 0.5, 0.5);
    float _2136 = sqrt(_2102);
    float _2138 = _2110 * 0.693147182464599609375;
    float _2140 = fma(_2106, _2132, 1.570728778839111328125);
    float _2142 = _2128 * _2122;
    float _2144 = _2130 * _2122;
    float _2146 = _2138 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2148 = fma(_2142, 0.5, 0.5);
    float _2150 = fma(_2144, -0.5, 0.5);
    float _2152 = _2136 * 0.636619746685028076171875;
    float3 _5610 = float3(_2148, _2150, _2146);
    float _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5610, float3(0.0), isnan(_5610)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5610, float3(0.0), isnan(_5610)), level(0.0)).x;
    float3 _5621 = float3(_2148, _2150, _2146);
    float4 _2157 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5621, float3(0.0), isnan(_5621)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5621, float3(0.0), isnan(_5621)), level(0.0)).xyzw;
    float _2159 = _2157.x;
    float _2161 = _2157.y;
    float _2163 = _2157.z;
    float _2165 = _2157.w;
    float _2167 = -_2140;
    float _2169 = fma(_2152, _2167, 1.0);
    float2 _5643 = float2(_2169, _2134);
    float3 _2173 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5643, float2(0.0), isnan(_5643)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5643, float2(0.0), isnan(_5643)), level(0.0)).xyz;
    float _2175 = _2173.x;
    float _2177 = _2173.y;
    float _2179 = _2173.z;
    float _2181 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2183 = _2058 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2185 = _242 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2187 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2183);
    float _2189 = exp2(_2181);
    float _2191 = _2185 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2193 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2187);
    float _2195 = _2128 + _2098;
    out.m_47.x = _2191;
    float _2197 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2193);
    float _2199 = _2195 * 0.5;
    float _2201 = _2098 * 0.5;
    float _2203 = _2197 + _2098;
    out.gl_Position.x = _2128;
    out.gl_Position.y = _2130;
    out.gl_Position.z = _2197;
    out.gl_Position.w = _2098;
    float _2205 = -_2189;
    float _2207 = _2205 + 1.0;
    float _2209 = _2203 * 0.5;
    float _2211 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2213 = fma(_2130, -0.5, _2201);
    out.m_77.x = _2199;
    out.m_77.y = _2213;
    out.m_77.z = _2209;
    out.m_77.w = _2098;
    float _2215 = _2211 * _2154;
    float _2217 = -_2211;
    float _2219 = _2217 + 1.0;
    float _2221 = _2165 * _2215;
    float _2223 = _2179 * _2215;
    float _2225 = fma(_2175, _2221, _2159);
    float _2227 = fma(_2177, _2221, _2161);
    float _2229 = _2165 * _2219;
    float _2231 = fma(_2165, _2223, _2163);
    out.m_79.x = _2225;
    out.m_79.y = _2227;
    out.m_79.z = _2231;
    out.m_79.w = _2229;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

