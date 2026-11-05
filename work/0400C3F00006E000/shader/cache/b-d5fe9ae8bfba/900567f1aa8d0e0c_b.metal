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
    float4 m_57 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_69 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_65 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1732 = as_type<float>(_104);
        out.gl_Position.z = _1732;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1800 = as_type<float>(_140);
        out.gl_Position.z = _1800;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _288;
    float _290;
    if (!_264)
    {
        float _266 = in.m_51.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _270 = float(_88);
        float _272 = 1.0 / _270;
        float _274 = _266 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _276 = _122 * _272;
        float _278 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _280 = _278 * _268;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _276;
        _290 = _286;
        _292 = true;
    }
    else
    {
        float _294 = float(_88);
        float _296 = 1.0 / _294;
        float _298 = _122 * _296;
        _288 = _298;
        _290 = _298;
    }
    _292 = false;
    float _300 = _288;
    float _302 = _290;
    float _304 = in.m_51.w;
    float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _308 = in.m_51.y;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _312 = _300 + _310;
    float _314 = in.m_51.x;
    out.m_53.x = 1.0;
    out.m_53.y = 1.0;
    out.m_53.z = 1.0;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _316;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _322 = _320 != 0;
    float _324 = 1.0 / _318;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _328 = _326 != 0;
    float _330 = in.m_55.x;
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _334 = _332 != 0;
    int _336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _338 = _336 != 0;
    bool _340 = _304 > 0.5;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _346 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _348 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _350 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _352 = 1.0 / _344;
    float _354 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _346);
    float _356 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _348);
    float _358 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _350);
    float _360 = _308 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _366 = _314 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _376 = -_368;
    float _378 = fma(_366, 2.0, _376);
    float _380 = fma(_360, -2.0, _370);
    float _382 = 1.0 / _374;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _386 = false;
    bool _388 = _340;
    float _390 = _330;
    if (_322)
    {
        bool _392 = _314 > 0.5;
        _386 = _392;
    }
    bool _394 = _386;
    float _396 = in.m_55.y;
    bool _398 = _308 > 0.5;
    float _400 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[78].z, _384);
    float _402 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _354);
    float _404 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _356);
    float _406 = 1.0 / _364;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _412 = 0.0;
    if (_328)
    {
        float _414 = in.m_51.z;
        _412 = _414;
    }
    float _416 = _412;
    float _418 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _380);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _424 = 1.0 / _410;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _436 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[78].w, _426);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _440 = _302 + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _446 = 1.0 / _422;
    float _448 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _358);
    float _450 = _440 * _324;
    float _452 = _430 * _382;
    float _454 = _434 * _406;
    float _456 = -_396;
    float _458 = _456 + 1.0;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _464 = 1.0 / _444;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _468 = _302 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _470;
    bool _474 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _476 = isnan(_300);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = _468 * _352;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _488;
    float _492 = 1.0 / _462;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _498 = _490 * _424;
    bool _500 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _502 = isnan(_302);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = _404 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _522 = _496 * _446;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _528 = _516 * _464;
    float _530 = -_122;
    float _532 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[76].x, _378);
    float _534 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _400);
    float _536 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _436);
    float _538 = _448 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _540 = _520 * _492;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _542;
    int _546 = _340 ? as_type<int>(_458) : as_type<int>(_396);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _548;
    float _552 = _396;
    float _554 = _540;
    if (_328)
    {
        bool _556 = _416 > 0.5;
        _388 = _556;
    }
    bool _558 = _388;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _560;
    float _564 = 1.0 / _526;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _574 = fma(_544, _450, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _576 = fma(_550, _450, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _578 = fma(_562, _450, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _582 = _300 + _580;
    float _584 = fma(_568, _486, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _586 = fma(_572, _486, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _594 = _300 + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _598 = _300 + _596;
    float _600 = fma(_452, _582, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _604 = _300 + _602;
    float _606 = fma(_454, _594, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _608 = fma(_498, _598, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _612 = _300 + _610;
    float _614 = fma(_522, _604, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _616 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _618 = isnan(_300);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _630 = _300 + _628;
    float _632 = fma(_528, _612, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _634 = _472 * _564;
    float _636 = fma(_590, _486, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _638 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _640 = isnan(_300);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = fma(_540, _630, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _652 = -_626;
    float _654 = _652 + 1.0;
    bool _656 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _658 = isnan(_300);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = _334 ? as_type<float>(_546) : _396;
    if (_338)
    {
        float _670 = _398 ? _458 : _396;
        _552 = _670;
    }
    float _672 = _552;
    float _674 = _648 * _654;
    float _676 = -_648;
    float _678 = _676 + 1.0;
    bool _680 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _682 = isnan(_302);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = -_666;
    float _694 = _692 + 1.0;
    bool _696 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _698 = isnan(_302);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = _666 * _678;
    bool _710 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _712 = isnan(_300);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = _484 * _694;
    float _724 = -_484;
    float _726 = _724 + 1.0;
    float _728 = -_706;
    float _730 = _728 + 1.0;
    bool _732 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _734 = isnan(_300);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = -_690;
    float _746 = _744 + 1.0;
    bool _748 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _750 = isnan(_300);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = _720 * _726;
    float _762 = -_720;
    float _764 = _762 + 1.0;
    float _766 = _690 * _730;
    float _768 = fma(_634, _312, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _770 = _510 * _746;
    bool _772 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _774 = isnan(_300);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _780 = _776 || _778;
    float _782 = float(_780);
    float _784 = -_742;
    float _786 = _784 + 1.0;
    float _788 = -_758;
    float _790 = _788 + 1.0;
    float _792 = _578 * _770;
    float _794 = _574 * _770;
    float _796 = _782 * _786;
    float _798 = _742 * _790;
    float _800 = _576 * _770;
    float _802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _804 = _306 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _806 = _600 * _796;
    float _808 = -_782;
    float _810 = _808 + 1.0;
    int _812 = as_type<int>(_786);
    int _814 = as_type<int>(_672);
    if (_322)
    {
        float _816 = -_330;
        float _818 = _816 + 1.0;
        _812 = as_type<int>(_818);
    }
    int _820 = _812;
    float _822 = fma(_804, _672, -0.5);
    if (_328)
    {
        float _824 = -_330;
        float _826 = _824 + 1.0;
        _814 = as_type<int>(_826);
    }
    int _828 = _814;
    float _830 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[151].x, _806);
    float _832 = -_510;
    float _834 = _832 + 1.0;
    if (!_322)
    {
        _554 = _330;
    }
    float _836 = _554;
    float _838 = _758 * _764;
    float _840 = _836;
    if (_322)
    {
        float _842 = _394 ? as_type<float>(_820) : _330;
        _840 = _842;
    }
    float _844 = _840;
    float _846 = fma(_606, _798, _830);
    if (_328)
    {
        float _848 = _558 ? as_type<float>(_828) : _330;
        _390 = _848;
    }
    float _850 = _390;
    float _852 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[107].y, _800);
    float _854 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[107].z, _792);
    float _856 = _402 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _860 = _512 + _858;
    float _862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _864 = fma(_608, _838, _846);
    float _866 = -_418;
    float _868 = fma(_536, _822, _866);
    float _870 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[107].x, _794);
    float _872 = _802 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _874 = fma(_584, _766, _852);
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _878 = _856 + _876;
    float _880 = _860 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _882 = fma(_614, _760, _864);
    float _884 = fma(_636, _766, _870);
    float _886 = fma(_872, _844, -0.5);
    float _888 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _890 = _538 + _888;
    float _892 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[28].x, _880);
    float _894 = fma(_632, _722, _882);
    float _896 = fma(_534, _886, _532);
    float _898 = _668 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _900 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[28].z, _892);
    float _902 = fma(_650, _708, _894);
    float _904 = _860 * _860;
    float _906 = _898 * _862;
    float _908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _910 = _900 >= 0.0;
    float _912 = fma(_878, _878, _904);
    float _914 = fma(_586, _766, _854);
    float _916 = fma(_768, _674, _902);
    float _918 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[109].x, _884);
    float _920 = fma(_890, _890, _912);
    float _922 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[109].z, _914);
    float _924 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[109].y, _874);
    float _926 = _850 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _928 = rsqrt(_920);
    float _930 = _922 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _932 = _918 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _934 = _922;
    int _936 = as_type<int>(_932);
    float _938 = _856;
    if (_910)
    {
        _934 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _940 = _934;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _948 = _924 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _950 = _926 * _908;
    float _952 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _868 + 0.5;
    if (_910)
    {
        float _956 = _940 * 5.0;
        _936 = as_type<int>(_956);
    }
    int _958 = _936;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _964 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _896 + 0.5;
    float _972 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _974 = _930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[158].x, _916);
    out.m_57.x = _964;
    out.m_57.y = _966;
    out.m_57.z = _968;
    out.m_57.w = _962;
    float _978 = _860 * _928;
    float _980 = _878 * _928;
    out.m_59.x = _970;
    out.m_59.y = _954;
    out.m_59.z = _950;
    out.m_59.w = _906;
    out.m_61.x = _952;
    out.m_61.y = _972;
    out.m_61.z = _974;
    out.m_61.w = _960;
    int _982 = as_type<int>(_974);
    if (_910)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3212 = as_type<float>(_958);
        out.gl_Position.z = _3212;
    }
    out.m_63.x = _976;
    if (_910)
    {
        out.m_45.x = 0.0;
    }
    if (_910)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _984 = -_978;
    float _986 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _512);
    float _988 = _890 * _928;
    float _990 = -_980;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _856);
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _996 = _986 + _994;
    float _998 = -_988;
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[18].w, _538);
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1004 = _992 + _1002;
    float _1006 = _996 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1008 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1010 = _1000 + _1008;
    float _1012 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1006);
    float _1014 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1012);
    bool _1016 = _1014 >= 0.0;
    float _1018 = _1004;
    if (_1016)
    {
        _1018 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1020 = _1018;
    if (_1016)
    {
        out.m_45.x = 0.0;
    }
    if (_1016)
    {
        float _1022 = _1020 * 5.0;
        _982 = as_type<int>(_1022);
    }
    int _1024 = _982;
    if (_1016)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3307 = as_type<float>(_1024);
        out.gl_Position.z = _3307;
    }
    if (_1016)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1026 = -_512;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1030 = -_856;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1034 = -_538;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1038 = -_978;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _860);
    float _1042 = _1028 * _1028;
    float _1044 = -_980;
    float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[18].w, _878);
    float _1048 = -_988;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _890);
    float _1052 = _1040 * _1040;
    float _1054 = fma(_1032, _1032, _1042);
    float _1056 = fma(_1046, _1046, _1052);
    float _1058 = fma(_1036, _1036, _1054);
    float _1060 = in.m_49.x;
    float _1062 = in.m_49.y;
    float _1064 = in.m_49.z;
    float _1066 = fma(_1050, _1050, _1056);
    float _1068 = rsqrt(_1058);
    float _1070 = sqrt(_1066);
    float _1072 = _1032 * _1068;
    float _1074 = _1036 * _1068;
    float _1076 = _1028 * _1068;
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1080 = _1072 * _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1084 = _1074 * _1082;
    float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1088 = _1076 * _1086;
    float _1090 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1094 = -_1080;
    float _1096 = fma(_1074, _1092, _1094);
    float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1100 = -_1084;
    float _1102 = fma(_1076, _1098, _1100);
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1106 = -_1088;
    float _1108 = fma(_1072, _1104, _1106);
    float _1110 = in.m_65.x;
    float _1112 = in.m_65.y;
    float _1114 = in.m_65.z;
    float _1116 = _1096 * _1096;
    float _1118 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1120 = _928 * _1070;
    float _1122 = fma(_1102, _1102, _1116);
    float _1124 = _1118 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1126 = fma(_1108, _1108, _1122);
    float _1128 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1130 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1132 = rsqrt(_1126);
    float _1134 = _1128 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1136 = _1120 * _1130;
    float _1138 = _1120 * _1124;
    float _1140 = _1120 * _1134;
    float _1142 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1112);
    float _1144 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1110);
    float _1146 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1114);
    float _1148 = _1136 * _1142;
    float _1150 = _1102 * _1132;
    float _1152 = _1096 * _1132;
    float _1154 = _1108 * _1132;
    float _1156 = _1140 * _1144;
    float _1158 = _1076 * _1150;
    float _1160 = _1074 * _1152;
    float _1162 = -_1158;
    float _1164 = fma(_1072, _1152, _1162);
    float _1166 = -_1160;
    float _1168 = fma(_1076, _1154, _1166);
    float _1170 = _1138 * _1146;
    float _1172 = _1148 * _1164;
    float _1174 = _1148 * _1168;
    float _1176 = fma(_1156, _1154, _1172);
    float _1178 = fma(_1156, _1150, _1174);
    float _1180 = fma(_1170, _1074, _1176);
    float _1182 = fma(_1170, _1072, _1178);
    float _1184 = _1072 * _1154;
    float _1186 = _538 + _1180;
    float _1188 = _856 + _1182;
    float _1190 = -_1184;
    float _1192 = fma(_1074, _1150, _1190);
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1196 = _1186 + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1200 = _1188 + _1198;
    float _1202 = _1148 * _1192;
    float _1204 = _1196 * _1196;
    float _1206 = fma(_1156, _1152, _1202);
    float _1208 = fma(_1200, _1200, _1204);
    float _1210 = fma(_1170, _1076, _1206);
    float _1212 = sqrt(_1208);
    float _1214 = _512 + _1210;
    bool _1216 = _1212 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1218 = _1204;
    float _1220 = _1188;
    float _1222 = _1212;
    float _1224 = _1196;
    if (!_1216)
    {
        _1218 = _1186;
    }
    float _1226 = _1218;
    float _1228 = _1226;
    if (!_1216)
    {
        _938 = _1214;
    }
    float _1230 = _938;
    bool _1232 = !_1216;
    float _1234 = _1230;
    if (!_1232)
    {
        float _1236 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1238 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1240 = _1212 + _1238;
        float _1242 = _1214 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1244 = rsqrt(_1208);
        float _1246 = _1240 * _1236;
        float _1248 = _1246 * 0.15915493667125701904296875;
        float _1250 = _1248 * 6.283185482025146484375;
        float _1252 = cos(_1250);
        float _1254 = _1248 * 6.283185482025146484375;
        float _1256 = sin(_1254);
        float _1258 = _1252 + (-1.0);
        float _1260 = _1258 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1262 = fma(_1256, _1242, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1264 = fma(_1214, _1252, _1260);
        float _1266 = _1244 * _1262;
        float _1268 = fma(_1200, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1270 = fma(_1196, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1234 = _1264;
        _1220 = _1268;
        _1228 = _1270;
        _1222 = _1266;
    }
    float _1272 = _1234;
    float _1274 = _1220;
    float _1276 = _1228;
    float _1278 = _1222;
    float _1280 = -_978;
    float _1282 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1272);
    float _1284 = -_980;
    float _1286 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1274);
    float _1288 = -_988;
    float _1290 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1276);
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1294 = _1282 + _1292;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1298 = _1286 + _1296;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1302 = _1290 + _1300;
    float _1304 = _1294 * _1294;
    float _1306 = fma(_1298, _1298, _1304);
    float _1308 = fma(_1302, _1302, _1306);
    float _1310 = rsqrt(_1308);
    float _1312 = sqrt(_1308);
    float _1314 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1316 = _1298 * _1314;
    float _1318 = _1302 * _1314;
    float _1320 = _1316 * _1316;
    float _1322 = _1318 * _1318;
    float _1324 = _1320 + _1322;
    float _1326 = sqrt(_1324);
    bool _1328 = _1326 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1332 = _1326 + _1330;
    float _1334 = _1302;
    float _1336 = _1306;
    float _1338 = _1332;
    float _1340 = _1314;
    if (_1328)
    {
        float _1342 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1334 = _1342;
    }
    float _1344 = _1334;
    if (_1328)
    {
        float _1346 = rsqrt(_1324);
        _1336 = _1346;
    }
    float _1348 = _1336;
    float _1350 = _1348;
    if (_1328)
    {
        float _1352 = _1332 * _1344;
        _1338 = _1352;
    }
    float _1354 = _1338;
    if (_1328)
    {
        float _1356 = _1354 * 0.15915493667125701904296875;
        _1224 = _1356;
    }
    float _1358 = _1224;
    float _1360 = _1278;
    if (_1328)
    {
        float _1362 = _1358 * 6.283185482025146484375;
        float _1364 = sin(_1362);
        _1360 = _1364;
    }
    float _1366 = _1360;
    float _1368 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1370 = precise::max(0.0, _1368);
    float _1372 = _1310;
    float _1374 = _1370;
    float _1376 = _1368;
    if (_1328)
    {
        float _1378 = _1358 * 6.283185482025146484375;
        float _1380 = cos(_1378);
        _1372 = _1380;
    }
    float _1382 = _1372;
    float _1384 = -_1314;
    float _1386 = -_1370;
    float _1388 = fma(_1294, _1384, _1386);
    float _1390 = _1388;
    if (!_1328)
    {
        _1374 = _1320;
    }
    float _1392 = _1374;
    float _1394 = _1392;
    if (_1328)
    {
        float _1396 = _1388 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1376 = _1396;
    }
    float _1398 = _1376;
    float _1400 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1402 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1404 = _1366;
    float _1406 = _1398;
    if (_1328)
    {
        float _1408 = fma(_1366, _1398, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1404 = _1408;
    }
    float _1410 = _1404;
    float _1412 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1402);
    float _1414 = _1410;
    float _1416 = _1382;
    if (_1328)
    {
        float _1418 = _1382 + (-1.0);
        _1406 = _1418;
    }
    float _1420 = _1406;
    float _1422 = _1420;
    if (_1328)
    {
        float _1424 = _1348 * _1410;
        _1340 = _1424;
    }
    float _1426 = _1340;
    if (!_1328)
    {
        _1414 = _1316;
    }
    float _1428 = _1414;
    float _1430 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1412);
    float _1432 = _1428;
    if (_1328)
    {
        float _1434 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1350 = _1434;
    }
    float _1436 = _1350;
    if (_1328)
    {
        float _1438 = _1316 * _1426;
        _1432 = _1438;
    }
    float _1440 = _1432;
    if (!_1328)
    {
        _1422 = _1318;
    }
    float _1442 = _1422;
    float _1444 = _1442;
    if (_1328)
    {
        float _1446 = _1318 * _1426;
        _1444 = _1446;
    }
    float _1448 = _1444;
    if (_1328)
    {
        float _1450 = fma(_1388, _1382, _1436);
        _1390 = _1450;
    }
    float _1452 = _1390;
    if (_1328)
    {
        float _1454 = _1440 * _1440;
        _1394 = _1454;
    }
    float _1456 = _1394;
    if (!_1328)
    {
        _1416 = _1322;
    }
    float _1458 = _1416;
    float _1460 = _1458;
    if (_1328)
    {
        float _1462 = _1448 * _1448;
        _1460 = _1462;
    }
    float _1464 = _1460;
    float _1466 = fma(_1452, _1452, _1456);
    float _1468 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1470 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1472 = _1466 + _1464;
    float _1474 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1468);
    float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1478 = fma(_1312, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1476);
    float _1480 = precise::clamp(_1478, 0.0, 1.0);
    float _1482 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1484 = rsqrt(_1472);
    float _1486 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1474);
    float _1488 = -_1480;
    float _1490 = _1488 + 1.0;
    float _1492 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1482);
    float _1494 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1496 = _1486 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1498 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1492);
    float _1500 = abs(_1490);
    float _1502 = log2(_1500);
    float _1504 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1506 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1494);
    float _1508 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1510 = -_1504;
    float _1512 = fma(_1510, _1400, 1.0);
    float _1514 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1506);
    float _1516 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1518 = _1484 * _1440;
    float _1520 = _1484 * _1452;
    float _1522 = _1484 * _1448;
    float _1524 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1516);
    float _1526 = _1518 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1528 = _1514 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1530 = log2(_1512);
    float _1532 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1524);
    float _1534 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1536 = -_1526;
    float _1538 = fma(_1520, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1536);
    float _1540 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1542 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1532);
    float _1544 = -_1522;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1538);
    float _1548 = exp2(_1534);
    float _1550 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1552 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1540);
    float _1554 = fma(_1546, -0.5, 0.5);
    float _1556 = fma(_1546, 0.5, 0.5);
    float _1558 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1550);
    float _1560 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1552);
    float _1562 = 1.0 / _1542;
    float _1564 = _1520 + 1.0;
    float _1566 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1558);
    float _1568 = fma(_1556, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1570 = _1530 * 0.693147182464599609375;
    float _1572 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1566);
    float _1574 = sqrt(_1554);
    float _1576 = -_1520;
    float _1578 = fma(_1548, _1564, _1576);
    float _1580 = fma(_1556, _1568, -0.212114393711090087890625);
    float _1582 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1560);
    float _1584 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1586 = fma(_1578, 0.5, 0.5);
    float _1588 = fma(_1556, _1580, 1.570728778839111328125);
    float _1590 = _1572 * _1562;
    float _1592 = _1582 * _1562;
    float _1594 = fma(_1590, 0.5, 0.5);
    float _1596 = fma(_1592, -0.5, 0.5);
    float _1598 = _1574 * 0.636619746685028076171875;
    float3 _4242 = float3(_1594, _1596, _1584);
    float _1600 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4242, float3(0.0), isnan(_4242)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4242, float3(0.0), isnan(_4242)), level(0.0)).x;
    float3 _4253 = float3(_1594, _1596, _1584);
    float4 _1603 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4253, float3(0.0), isnan(_4253)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4253, float3(0.0), isnan(_4253)), level(0.0)).xyzw;
    float _1605 = _1603.x;
    float _1607 = _1603.y;
    float _1609 = _1603.z;
    float _1611 = _1603.w;
    float _1613 = -_1588;
    float _1615 = fma(_1598, _1613, 1.0);
    float2 _4275 = float2(_1615, _1586);
    float3 _1619 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4275, float2(0.0), isnan(_4275)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4275, float2(0.0), isnan(_4275)), level(0.0)).xyz;
    float _1621 = _1619.x;
    float _1623 = _1619.y;
    float _1625 = _1619.z;
    float _1627 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1629 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1631 = _1572 + _1542;
    float _1633 = _1542 * 0.5;
    float _1635 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1629);
    float _1637 = exp2(_1627);
    float _1639 = _1631 * 0.5;
    float _1641 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1635);
    float _1643 = fma(_1582, -0.5, _1633);
    float _1645 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1641);
    float _1647 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1649 = _1645 + _1542;
    out.gl_Position.x = _1572;
    out.gl_Position.y = _1582;
    out.gl_Position.z = _1645;
    out.gl_Position.w = _1542;
    float _1651 = _1649 * 0.5;
    float _1653 = -_1637;
    float _1655 = _1653 + 1.0;
    out.m_45.x = _1647;
    float _1657 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1639;
    out.m_67.y = _1643;
    out.m_67.z = _1651;
    out.m_67.w = _1542;
    float _1659 = _1657 * _1600;
    float _1661 = -_1657;
    float _1663 = _1661 + 1.0;
    float _1665 = _1611 * _1659;
    float _1667 = _1611 * _1663;
    float _1669 = _1625 * _1659;
    float _1671 = fma(_1621, _1665, _1605);
    float _1673 = fma(_1623, _1665, _1607);
    float _1675 = fma(_1611, _1669, _1609);
    out.m_69.x = _1671;
    out.m_69.y = _1673;
    out.m_69.z = _1675;
    out.m_69.w = _1667;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1732 = as_type<float>(_104);
        out.gl_Position.z = _1732;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1800 = as_type<float>(_140);
        out.gl_Position.z = _1800;
    }
    if (_134)
    {
        return out;
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _288;
    float _290;
    if (!_264)
    {
        float _266 = in.m_51.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _270 = float(_88);
        float _272 = 1.0 / _270;
        float _274 = _266 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _276 = _122 * _272;
        float _278 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _280 = _278 * _268;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _276;
        _290 = _286;
        _292 = true;
    }
    else
    {
        float _294 = float(_88);
        float _296 = 1.0 / _294;
        float _298 = _122 * _296;
        _288 = _298;
        _290 = _298;
    }
    _292 = false;
    float _300 = _288;
    float _302 = _290;
    float _304 = in.m_51.w;
    float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _308 = in.m_51.y;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _312 = _300 + _310;
    float _314 = in.m_51.x;
    out.m_53.x = 1.0;
    out.m_53.y = 1.0;
    out.m_53.z = 1.0;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _316;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _322 = _320 != 0;
    float _324 = 1.0 / _318;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _328 = _326 != 0;
    float _330 = in.m_55.x;
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _334 = _332 != 0;
    int _336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _338 = _336 != 0;
    bool _340 = _304 > 0.5;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _346 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _348 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _350 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _352 = 1.0 / _344;
    float _354 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _346);
    float _356 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _348);
    float _358 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _350);
    float _360 = _308 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _366 = _314 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _376 = -_368;
    float _378 = fma(_366, 2.0, _376);
    float _380 = fma(_360, -2.0, _370);
    float _382 = 1.0 / _374;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _386 = false;
    bool _388 = _340;
    float _390 = _330;
    if (_322)
    {
        bool _392 = _314 > 0.5;
        _386 = _392;
    }
    bool _394 = _386;
    float _396 = in.m_55.y;
    bool _398 = _308 > 0.5;
    float _400 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[78].z, _384);
    float _402 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _354);
    float _404 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _356);
    float _406 = 1.0 / _364;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _412 = 0.0;
    if (_328)
    {
        float _414 = in.m_51.z;
        _412 = _414;
    }
    float _416 = _412;
    float _418 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _380);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _424 = 1.0 / _410;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _436 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[78].w, _426);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _440 = _302 + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _446 = 1.0 / _422;
    float _448 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _358);
    float _450 = _440 * _324;
    float _452 = _430 * _382;
    float _454 = _434 * _406;
    float _456 = -_396;
    float _458 = _456 + 1.0;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _464 = 1.0 / _444;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _468 = _302 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _470;
    bool _474 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _476 = isnan(_300);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = _468 * _352;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _488;
    float _492 = 1.0 / _462;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _498 = _490 * _424;
    bool _500 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _502 = isnan(_302);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = _404 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _522 = _496 * _446;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _528 = _516 * _464;
    float _530 = -_122;
    float _532 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[76].x, _378);
    float _534 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _400);
    float _536 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _436);
    float _538 = _448 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _540 = _520 * _492;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _542;
    int _546 = _340 ? as_type<int>(_458) : as_type<int>(_396);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _548;
    float _552 = _396;
    float _554 = _540;
    if (_328)
    {
        bool _556 = _416 > 0.5;
        _388 = _556;
    }
    bool _558 = _388;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _560;
    float _564 = 1.0 / _526;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _574 = fma(_544, _450, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _576 = fma(_550, _450, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _578 = fma(_562, _450, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _582 = _300 + _580;
    float _584 = fma(_568, _486, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _586 = fma(_572, _486, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _594 = _300 + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _598 = _300 + _596;
    float _600 = fma(_452, _582, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _604 = _300 + _602;
    float _606 = fma(_454, _594, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _608 = fma(_498, _598, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _612 = _300 + _610;
    float _614 = fma(_522, _604, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _616 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _618 = isnan(_300);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _630 = _300 + _628;
    float _632 = fma(_528, _612, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _634 = _472 * _564;
    float _636 = fma(_590, _486, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _638 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _640 = isnan(_300);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = fma(_540, _630, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _652 = -_626;
    float _654 = _652 + 1.0;
    bool _656 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _658 = isnan(_300);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = _334 ? as_type<float>(_546) : _396;
    if (_338)
    {
        float _670 = _398 ? _458 : _396;
        _552 = _670;
    }
    float _672 = _552;
    float _674 = _648 * _654;
    float _676 = -_648;
    float _678 = _676 + 1.0;
    bool _680 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _682 = isnan(_302);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = -_666;
    float _694 = _692 + 1.0;
    bool _696 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _698 = isnan(_302);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = _666 * _678;
    bool _710 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _712 = isnan(_300);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = _484 * _694;
    float _724 = -_484;
    float _726 = _724 + 1.0;
    float _728 = -_706;
    float _730 = _728 + 1.0;
    bool _732 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _734 = isnan(_300);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = -_690;
    float _746 = _744 + 1.0;
    bool _748 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _750 = isnan(_300);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = _720 * _726;
    float _762 = -_720;
    float _764 = _762 + 1.0;
    float _766 = _690 * _730;
    float _768 = fma(_634, _312, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _770 = _510 * _746;
    bool _772 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _774 = isnan(_300);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _780 = _776 || _778;
    float _782 = float(_780);
    float _784 = -_742;
    float _786 = _784 + 1.0;
    float _788 = -_758;
    float _790 = _788 + 1.0;
    float _792 = _578 * _770;
    float _794 = _574 * _770;
    float _796 = _782 * _786;
    float _798 = _742 * _790;
    float _800 = _576 * _770;
    float _802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _804 = _306 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _806 = _600 * _796;
    float _808 = -_782;
    float _810 = _808 + 1.0;
    int _812 = as_type<int>(_786);
    int _814 = as_type<int>(_672);
    if (_322)
    {
        float _816 = -_330;
        float _818 = _816 + 1.0;
        _812 = as_type<int>(_818);
    }
    int _820 = _812;
    float _822 = fma(_804, _672, -0.5);
    if (_328)
    {
        float _824 = -_330;
        float _826 = _824 + 1.0;
        _814 = as_type<int>(_826);
    }
    int _828 = _814;
    float _830 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[151].x, _806);
    float _832 = -_510;
    float _834 = _832 + 1.0;
    if (!_322)
    {
        _554 = _330;
    }
    float _836 = _554;
    float _838 = _758 * _764;
    float _840 = _836;
    if (_322)
    {
        float _842 = _394 ? as_type<float>(_820) : _330;
        _840 = _842;
    }
    float _844 = _840;
    float _846 = fma(_606, _798, _830);
    if (_328)
    {
        float _848 = _558 ? as_type<float>(_828) : _330;
        _390 = _848;
    }
    float _850 = _390;
    float _852 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[107].y, _800);
    float _854 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[107].z, _792);
    float _856 = _402 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _860 = _512 + _858;
    float _862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _864 = fma(_608, _838, _846);
    float _866 = -_418;
    float _868 = fma(_536, _822, _866);
    float _870 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[107].x, _794);
    float _872 = _802 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _874 = fma(_584, _766, _852);
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _878 = _856 + _876;
    float _880 = _860 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _882 = fma(_614, _760, _864);
    float _884 = fma(_636, _766, _870);
    float _886 = fma(_872, _844, -0.5);
    float _888 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _890 = _538 + _888;
    float _892 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[28].x, _880);
    float _894 = fma(_632, _722, _882);
    float _896 = fma(_534, _886, _532);
    float _898 = _668 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _900 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[28].z, _892);
    float _902 = fma(_650, _708, _894);
    float _904 = _860 * _860;
    float _906 = _898 * _862;
    float _908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _910 = _900 >= 0.0;
    float _912 = fma(_878, _878, _904);
    float _914 = fma(_586, _766, _854);
    float _916 = fma(_768, _674, _902);
    float _918 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[109].x, _884);
    float _920 = fma(_890, _890, _912);
    float _922 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[109].z, _914);
    float _924 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[109].y, _874);
    float _926 = _850 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _928 = rsqrt(_920);
    float _930 = _922 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _932 = _918 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _934 = _922;
    int _936 = as_type<int>(_932);
    float _938 = _856;
    if (_910)
    {
        _934 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _940 = _934;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _948 = _924 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _950 = _926 * _908;
    float _952 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _868 + 0.5;
    if (_910)
    {
        float _956 = _940 * 5.0;
        _936 = as_type<int>(_956);
    }
    int _958 = _936;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _964 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _896 + 0.5;
    float _972 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _974 = _930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[158].x, _916);
    out.m_57.x = _964;
    out.m_57.y = _966;
    out.m_57.z = _968;
    out.m_57.w = _962;
    float _978 = _860 * _928;
    float _980 = _878 * _928;
    out.m_59.x = _970;
    out.m_59.y = _954;
    out.m_59.z = _950;
    out.m_59.w = _906;
    out.m_61.x = _952;
    out.m_61.y = _972;
    out.m_61.z = _974;
    out.m_61.w = _960;
    int _982 = as_type<int>(_974);
    if (_910)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3212 = as_type<float>(_958);
        out.gl_Position.z = _3212;
    }
    out.m_63.x = _976;
    if (_910)
    {
        out.m_45.x = 0.0;
    }
    if (_910)
    {
        return out;
    }
    float _984 = -_978;
    float _986 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _512);
    float _988 = _890 * _928;
    float _990 = -_980;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _856);
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _996 = _986 + _994;
    float _998 = -_988;
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[18].w, _538);
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1004 = _992 + _1002;
    float _1006 = _996 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1008 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1010 = _1000 + _1008;
    float _1012 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1006);
    float _1014 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1012);
    bool _1016 = _1014 >= 0.0;
    float _1018 = _1004;
    if (_1016)
    {
        _1018 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1020 = _1018;
    if (_1016)
    {
        out.m_45.x = 0.0;
    }
    if (_1016)
    {
        float _1022 = _1020 * 5.0;
        _982 = as_type<int>(_1022);
    }
    int _1024 = _982;
    if (_1016)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3307 = as_type<float>(_1024);
        out.gl_Position.z = _3307;
    }
    if (_1016)
    {
        return out;
    }
    float _1026 = -_512;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1030 = -_856;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1034 = -_538;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1038 = -_978;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _860);
    float _1042 = _1028 * _1028;
    float _1044 = -_980;
    float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[18].w, _878);
    float _1048 = -_988;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _890);
    float _1052 = _1040 * _1040;
    float _1054 = fma(_1032, _1032, _1042);
    float _1056 = fma(_1046, _1046, _1052);
    float _1058 = fma(_1036, _1036, _1054);
    float _1060 = in.m_49.x;
    float _1062 = in.m_49.y;
    float _1064 = in.m_49.z;
    float _1066 = fma(_1050, _1050, _1056);
    float _1068 = rsqrt(_1058);
    float _1070 = sqrt(_1066);
    float _1072 = _1032 * _1068;
    float _1074 = _1036 * _1068;
    float _1076 = _1028 * _1068;
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1080 = _1072 * _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1084 = _1074 * _1082;
    float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1088 = _1076 * _1086;
    float _1090 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1094 = -_1080;
    float _1096 = fma(_1074, _1092, _1094);
    float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1100 = -_1084;
    float _1102 = fma(_1076, _1098, _1100);
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1106 = -_1088;
    float _1108 = fma(_1072, _1104, _1106);
    float _1110 = in.m_65.x;
    float _1112 = in.m_65.y;
    float _1114 = in.m_65.z;
    float _1116 = _1096 * _1096;
    float _1118 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1120 = _928 * _1070;
    float _1122 = fma(_1102, _1102, _1116);
    float _1124 = _1118 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1126 = fma(_1108, _1108, _1122);
    float _1128 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1130 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1132 = rsqrt(_1126);
    float _1134 = _1128 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1136 = _1120 * _1130;
    float _1138 = _1120 * _1124;
    float _1140 = _1120 * _1134;
    float _1142 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1112);
    float _1144 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1110);
    float _1146 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1114);
    float _1148 = _1136 * _1142;
    float _1150 = _1102 * _1132;
    float _1152 = _1096 * _1132;
    float _1154 = _1108 * _1132;
    float _1156 = _1140 * _1144;
    float _1158 = _1076 * _1150;
    float _1160 = _1074 * _1152;
    float _1162 = -_1158;
    float _1164 = fma(_1072, _1152, _1162);
    float _1166 = -_1160;
    float _1168 = fma(_1076, _1154, _1166);
    float _1170 = _1138 * _1146;
    float _1172 = _1148 * _1164;
    float _1174 = _1148 * _1168;
    float _1176 = fma(_1156, _1154, _1172);
    float _1178 = fma(_1156, _1150, _1174);
    float _1180 = fma(_1170, _1074, _1176);
    float _1182 = fma(_1170, _1072, _1178);
    float _1184 = _1072 * _1154;
    float _1186 = _538 + _1180;
    float _1188 = _856 + _1182;
    float _1190 = -_1184;
    float _1192 = fma(_1074, _1150, _1190);
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1196 = _1186 + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1200 = _1188 + _1198;
    float _1202 = _1148 * _1192;
    float _1204 = _1196 * _1196;
    float _1206 = fma(_1156, _1152, _1202);
    float _1208 = fma(_1200, _1200, _1204);
    float _1210 = fma(_1170, _1076, _1206);
    float _1212 = sqrt(_1208);
    float _1214 = _512 + _1210;
    bool _1216 = _1212 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1218 = _1204;
    float _1220 = _1188;
    float _1222 = _1212;
    float _1224 = _1196;
    if (!_1216)
    {
        _1218 = _1186;
    }
    float _1226 = _1218;
    float _1228 = _1226;
    if (!_1216)
    {
        _938 = _1214;
    }
    float _1230 = _938;
    bool _1232 = !_1216;
    float _1234 = _1230;
    if (!_1232)
    {
        float _1236 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1238 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1240 = _1212 + _1238;
        float _1242 = _1214 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1244 = rsqrt(_1208);
        float _1246 = _1240 * _1236;
        float _1248 = _1246 * 0.15915493667125701904296875;
        float _1250 = _1248 * 6.283185482025146484375;
        float _1252 = cos(_1250);
        float _1254 = _1248 * 6.283185482025146484375;
        float _1256 = sin(_1254);
        float _1258 = _1252 + (-1.0);
        float _1260 = _1258 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1262 = fma(_1256, _1242, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1264 = fma(_1214, _1252, _1260);
        float _1266 = _1244 * _1262;
        float _1268 = fma(_1200, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1270 = fma(_1196, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1234 = _1264;
        _1220 = _1268;
        _1228 = _1270;
        _1222 = _1266;
    }
    float _1272 = _1234;
    float _1274 = _1220;
    float _1276 = _1228;
    float _1278 = _1222;
    float _1280 = -_978;
    float _1282 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1272);
    float _1284 = -_980;
    float _1286 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1274);
    float _1288 = -_988;
    float _1290 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1276);
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1294 = _1282 + _1292;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1298 = _1286 + _1296;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1302 = _1290 + _1300;
    float _1304 = _1294 * _1294;
    float _1306 = fma(_1298, _1298, _1304);
    float _1308 = fma(_1302, _1302, _1306);
    float _1310 = rsqrt(_1308);
    float _1312 = sqrt(_1308);
    float _1314 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1316 = _1298 * _1314;
    float _1318 = _1302 * _1314;
    float _1320 = _1316 * _1316;
    float _1322 = _1318 * _1318;
    float _1324 = _1320 + _1322;
    float _1326 = sqrt(_1324);
    bool _1328 = _1326 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1332 = _1326 + _1330;
    float _1334 = _1302;
    float _1336 = _1306;
    float _1338 = _1332;
    float _1340 = _1314;
    if (_1328)
    {
        float _1342 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1334 = _1342;
    }
    float _1344 = _1334;
    if (_1328)
    {
        float _1346 = rsqrt(_1324);
        _1336 = _1346;
    }
    float _1348 = _1336;
    float _1350 = _1348;
    if (_1328)
    {
        float _1352 = _1332 * _1344;
        _1338 = _1352;
    }
    float _1354 = _1338;
    if (_1328)
    {
        float _1356 = _1354 * 0.15915493667125701904296875;
        _1224 = _1356;
    }
    float _1358 = _1224;
    float _1360 = _1278;
    if (_1328)
    {
        float _1362 = _1358 * 6.283185482025146484375;
        float _1364 = sin(_1362);
        _1360 = _1364;
    }
    float _1366 = _1360;
    float _1368 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1370 = precise::max(0.0, _1368);
    float _1372 = _1310;
    float _1374 = _1370;
    float _1376 = _1368;
    if (_1328)
    {
        float _1378 = _1358 * 6.283185482025146484375;
        float _1380 = cos(_1378);
        _1372 = _1380;
    }
    float _1382 = _1372;
    float _1384 = -_1314;
    float _1386 = -_1370;
    float _1388 = fma(_1294, _1384, _1386);
    float _1390 = _1388;
    if (!_1328)
    {
        _1374 = _1320;
    }
    float _1392 = _1374;
    float _1394 = _1392;
    if (_1328)
    {
        float _1396 = _1388 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1376 = _1396;
    }
    float _1398 = _1376;
    float _1400 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1402 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1404 = _1366;
    float _1406 = _1398;
    if (_1328)
    {
        float _1408 = fma(_1366, _1398, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1404 = _1408;
    }
    float _1410 = _1404;
    float _1412 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1402);
    float _1414 = _1410;
    float _1416 = _1382;
    if (_1328)
    {
        float _1418 = _1382 + (-1.0);
        _1406 = _1418;
    }
    float _1420 = _1406;
    float _1422 = _1420;
    if (_1328)
    {
        float _1424 = _1348 * _1410;
        _1340 = _1424;
    }
    float _1426 = _1340;
    if (!_1328)
    {
        _1414 = _1316;
    }
    float _1428 = _1414;
    float _1430 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1412);
    float _1432 = _1428;
    if (_1328)
    {
        float _1434 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1350 = _1434;
    }
    float _1436 = _1350;
    if (_1328)
    {
        float _1438 = _1316 * _1426;
        _1432 = _1438;
    }
    float _1440 = _1432;
    if (!_1328)
    {
        _1422 = _1318;
    }
    float _1442 = _1422;
    float _1444 = _1442;
    if (_1328)
    {
        float _1446 = _1318 * _1426;
        _1444 = _1446;
    }
    float _1448 = _1444;
    if (_1328)
    {
        float _1450 = fma(_1388, _1382, _1436);
        _1390 = _1450;
    }
    float _1452 = _1390;
    if (_1328)
    {
        float _1454 = _1440 * _1440;
        _1394 = _1454;
    }
    float _1456 = _1394;
    if (!_1328)
    {
        _1416 = _1322;
    }
    float _1458 = _1416;
    float _1460 = _1458;
    if (_1328)
    {
        float _1462 = _1448 * _1448;
        _1460 = _1462;
    }
    float _1464 = _1460;
    float _1466 = fma(_1452, _1452, _1456);
    float _1468 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1470 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1472 = _1466 + _1464;
    float _1474 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1468);
    float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1478 = fma(_1312, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1476);
    float _1480 = precise::clamp(_1478, 0.0, 1.0);
    float _1482 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1484 = rsqrt(_1472);
    float _1486 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1474);
    float _1488 = -_1480;
    float _1490 = _1488 + 1.0;
    float _1492 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1482);
    float _1494 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1496 = _1486 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1498 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1492);
    float _1500 = abs(_1490);
    float _1502 = log2(_1500);
    float _1504 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1506 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1494);
    float _1508 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1510 = -_1504;
    float _1512 = fma(_1510, _1400, 1.0);
    float _1514 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1506);
    float _1516 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1518 = _1484 * _1440;
    float _1520 = _1484 * _1452;
    float _1522 = _1484 * _1448;
    float _1524 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1516);
    float _1526 = _1518 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1528 = _1514 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1530 = log2(_1512);
    float _1532 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1524);
    float _1534 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1536 = -_1526;
    float _1538 = fma(_1520, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1536);
    float _1540 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1542 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1532);
    float _1544 = -_1522;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1538);
    float _1548 = exp2(_1534);
    float _1550 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1552 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1540);
    float _1554 = fma(_1546, -0.5, 0.5);
    float _1556 = fma(_1546, 0.5, 0.5);
    float _1558 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1550);
    float _1560 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1552);
    float _1562 = 1.0 / _1542;
    float _1564 = _1520 + 1.0;
    float _1566 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1558);
    float _1568 = fma(_1556, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1570 = _1530 * 0.693147182464599609375;
    float _1572 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1566);
    float _1574 = sqrt(_1554);
    float _1576 = -_1520;
    float _1578 = fma(_1548, _1564, _1576);
    float _1580 = fma(_1556, _1568, -0.212114393711090087890625);
    float _1582 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1560);
    float _1584 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1586 = fma(_1578, 0.5, 0.5);
    float _1588 = fma(_1556, _1580, 1.570728778839111328125);
    float _1590 = _1572 * _1562;
    float _1592 = _1582 * _1562;
    float _1594 = fma(_1590, 0.5, 0.5);
    float _1596 = fma(_1592, -0.5, 0.5);
    float _1598 = _1574 * 0.636619746685028076171875;
    float3 _4242 = float3(_1594, _1596, _1584);
    float _1600 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4242, float3(0.0), isnan(_4242)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4242, float3(0.0), isnan(_4242)), level(0.0)).x;
    float3 _4253 = float3(_1594, _1596, _1584);
    float4 _1603 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4253, float3(0.0), isnan(_4253)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4253, float3(0.0), isnan(_4253)), level(0.0)).xyzw;
    float _1605 = _1603.x;
    float _1607 = _1603.y;
    float _1609 = _1603.z;
    float _1611 = _1603.w;
    float _1613 = -_1588;
    float _1615 = fma(_1598, _1613, 1.0);
    float2 _4275 = float2(_1615, _1586);
    float3 _1619 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4275, float2(0.0), isnan(_4275)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4275, float2(0.0), isnan(_4275)), level(0.0)).xyz;
    float _1621 = _1619.x;
    float _1623 = _1619.y;
    float _1625 = _1619.z;
    float _1627 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1629 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1631 = _1572 + _1542;
    float _1633 = _1542 * 0.5;
    float _1635 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1629);
    float _1637 = exp2(_1627);
    float _1639 = _1631 * 0.5;
    float _1641 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1635);
    float _1643 = fma(_1582, -0.5, _1633);
    float _1645 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1641);
    float _1647 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1649 = _1645 + _1542;
    out.gl_Position.x = _1572;
    out.gl_Position.y = _1582;
    out.gl_Position.z = _1645;
    out.gl_Position.w = _1542;
    float _1651 = _1649 * 0.5;
    float _1653 = -_1637;
    float _1655 = _1653 + 1.0;
    out.m_45.x = _1647;
    float _1657 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1639;
    out.m_67.y = _1643;
    out.m_67.z = _1651;
    out.m_67.w = _1542;
    float _1659 = _1657 * _1600;
    float _1661 = -_1657;
    float _1663 = _1661 + 1.0;
    float _1665 = _1611 * _1659;
    float _1667 = _1611 * _1663;
    float _1669 = _1625 * _1659;
    float _1671 = fma(_1621, _1665, _1605);
    float _1673 = fma(_1623, _1665, _1607);
    float _1675 = fma(_1611, _1669, _1609);
    out.m_69.x = _1671;
    out.m_69.y = _1673;
    out.m_69.z = _1675;
    out.m_69.w = _1667;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1732 = as_type<float>(_104);
        out.gl_Position.z = _1732;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1800 = as_type<float>(_140);
        out.gl_Position.z = _1800;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _156, _246);
    float _254 = fma(_242, _158, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _162);
    float _260 = fma(_254, _142, _164);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _288;
    float _290;
    if (!_264)
    {
        float _266 = in.m_51.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _270 = float(_88);
        float _272 = 1.0 / _270;
        float _274 = _266 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _276 = _122 * _272;
        float _278 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _280 = _278 * _268;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _276;
        _290 = _286;
        _292 = true;
    }
    else
    {
        float _294 = float(_88);
        float _296 = 1.0 / _294;
        float _298 = _122 * _296;
        _288 = _298;
        _290 = _298;
    }
    _292 = false;
    float _300 = _288;
    float _302 = _290;
    float _304 = in.m_51.w;
    float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _308 = in.m_51.y;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _312 = _300 + _310;
    float _314 = in.m_51.x;
    out.m_53.x = 1.0;
    out.m_53.y = 1.0;
    out.m_53.z = 1.0;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _316;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _322 = _320 != 0;
    float _324 = 1.0 / _318;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _328 = _326 != 0;
    float _330 = in.m_55.x;
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _334 = _332 != 0;
    int _336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _338 = _336 != 0;
    bool _340 = _304 > 0.5;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _346 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _348 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _350 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _352 = 1.0 / _344;
    float _354 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _346);
    float _356 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _348);
    float _358 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _350);
    float _360 = _308 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _366 = _314 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _376 = -_368;
    float _378 = fma(_366, 2.0, _376);
    float _380 = fma(_360, -2.0, _370);
    float _382 = 1.0 / _374;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _386 = false;
    bool _388 = _340;
    float _390 = _330;
    if (_322)
    {
        bool _392 = _314 > 0.5;
        _386 = _392;
    }
    bool _394 = _386;
    float _396 = in.m_55.y;
    bool _398 = _308 > 0.5;
    float _400 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[78].z, _384);
    float _402 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _354);
    float _404 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _356);
    float _406 = 1.0 / _364;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _412 = 0.0;
    if (_328)
    {
        float _414 = in.m_51.z;
        _412 = _414;
    }
    float _416 = _412;
    float _418 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _380);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _424 = 1.0 / _410;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _436 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[78].w, _426);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _440 = _302 + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _446 = 1.0 / _422;
    float _448 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _358);
    float _450 = _440 * _324;
    float _452 = _430 * _382;
    float _454 = _434 * _406;
    float _456 = -_396;
    float _458 = _456 + 1.0;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _464 = 1.0 / _444;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _468 = _302 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _470;
    bool _474 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _476 = isnan(_300);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = _468 * _352;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _488;
    float _492 = 1.0 / _462;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _498 = _490 * _424;
    bool _500 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _502 = isnan(_302);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = _404 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _522 = _496 * _446;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _528 = _516 * _464;
    float _530 = -_122;
    float _532 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[76].x, _378);
    float _534 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _400);
    float _536 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _436);
    float _538 = _448 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _540 = _520 * _492;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _542;
    int _546 = _340 ? as_type<int>(_458) : as_type<int>(_396);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _548;
    float _552 = _396;
    float _554 = _540;
    if (_328)
    {
        bool _556 = _416 > 0.5;
        _388 = _556;
    }
    bool _558 = _388;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _560;
    float _564 = 1.0 / _526;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _574 = fma(_544, _450, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _576 = fma(_550, _450, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _578 = fma(_562, _450, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _582 = _300 + _580;
    float _584 = fma(_568, _486, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _586 = fma(_572, _486, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _594 = _300 + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _598 = _300 + _596;
    float _600 = fma(_452, _582, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _604 = _300 + _602;
    float _606 = fma(_454, _594, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _608 = fma(_498, _598, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _612 = _300 + _610;
    float _614 = fma(_522, _604, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _616 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _618 = isnan(_300);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _630 = _300 + _628;
    float _632 = fma(_528, _612, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _634 = _472 * _564;
    float _636 = fma(_590, _486, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _638 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _640 = isnan(_300);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = fma(_540, _630, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _652 = -_626;
    float _654 = _652 + 1.0;
    bool _656 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _658 = isnan(_300);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = _334 ? as_type<float>(_546) : _396;
    if (_338)
    {
        float _670 = _398 ? _458 : _396;
        _552 = _670;
    }
    float _672 = _552;
    float _674 = _648 * _654;
    float _676 = -_648;
    float _678 = _676 + 1.0;
    bool _680 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _682 = isnan(_302);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = -_666;
    float _694 = _692 + 1.0;
    bool _696 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _698 = isnan(_302);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = _666 * _678;
    bool _710 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _712 = isnan(_300);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = _484 * _694;
    float _724 = -_484;
    float _726 = _724 + 1.0;
    float _728 = -_706;
    float _730 = _728 + 1.0;
    bool _732 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _734 = isnan(_300);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = -_690;
    float _746 = _744 + 1.0;
    bool _748 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _750 = isnan(_300);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = _720 * _726;
    float _762 = -_720;
    float _764 = _762 + 1.0;
    float _766 = _690 * _730;
    float _768 = fma(_634, _312, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _770 = _510 * _746;
    bool _772 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _774 = isnan(_300);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _780 = _776 || _778;
    float _782 = float(_780);
    float _784 = -_742;
    float _786 = _784 + 1.0;
    float _788 = -_758;
    float _790 = _788 + 1.0;
    float _792 = _578 * _770;
    float _794 = _574 * _770;
    float _796 = _782 * _786;
    float _798 = _742 * _790;
    float _800 = _576 * _770;
    float _802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _804 = _306 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _806 = _600 * _796;
    float _808 = -_782;
    float _810 = _808 + 1.0;
    int _812 = as_type<int>(_786);
    int _814 = as_type<int>(_672);
    if (_322)
    {
        float _816 = -_330;
        float _818 = _816 + 1.0;
        _812 = as_type<int>(_818);
    }
    int _820 = _812;
    float _822 = fma(_804, _672, -0.5);
    if (_328)
    {
        float _824 = -_330;
        float _826 = _824 + 1.0;
        _814 = as_type<int>(_826);
    }
    int _828 = _814;
    float _830 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[151].x, _806);
    float _832 = -_510;
    float _834 = _832 + 1.0;
    if (!_322)
    {
        _554 = _330;
    }
    float _836 = _554;
    float _838 = _758 * _764;
    float _840 = _836;
    if (_322)
    {
        float _842 = _394 ? as_type<float>(_820) : _330;
        _840 = _842;
    }
    float _844 = _840;
    float _846 = fma(_606, _798, _830);
    if (_328)
    {
        float _848 = _558 ? as_type<float>(_828) : _330;
        _390 = _848;
    }
    float _850 = _390;
    float _852 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[107].y, _800);
    float _854 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[107].z, _792);
    float _856 = _402 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _860 = _512 + _858;
    float _862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _864 = fma(_608, _838, _846);
    float _866 = -_418;
    float _868 = fma(_536, _822, _866);
    float _870 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[107].x, _794);
    float _872 = _802 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _874 = fma(_584, _766, _852);
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _878 = _856 + _876;
    float _880 = _860 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _882 = fma(_614, _760, _864);
    float _884 = fma(_636, _766, _870);
    float _886 = fma(_872, _844, -0.5);
    float _888 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _890 = _538 + _888;
    float _892 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[28].x, _880);
    float _894 = fma(_632, _722, _882);
    float _896 = fma(_534, _886, _532);
    float _898 = _668 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _900 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[28].z, _892);
    float _902 = fma(_650, _708, _894);
    float _904 = _860 * _860;
    float _906 = _898 * _862;
    float _908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _910 = _900 >= 0.0;
    float _912 = fma(_878, _878, _904);
    float _914 = fma(_586, _766, _854);
    float _916 = fma(_768, _674, _902);
    float _918 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[109].x, _884);
    float _920 = fma(_890, _890, _912);
    float _922 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[109].z, _914);
    float _924 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[109].y, _874);
    float _926 = _850 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _928 = rsqrt(_920);
    float _930 = _922 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _932 = _918 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _934 = _922;
    int _936 = as_type<int>(_932);
    float _938 = _856;
    if (_910)
    {
        _934 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _940 = _934;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _948 = _924 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _950 = _926 * _908;
    float _952 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _868 + 0.5;
    if (_910)
    {
        float _956 = _940 * 5.0;
        _936 = as_type<int>(_956);
    }
    int _958 = _936;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _964 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _896 + 0.5;
    float _972 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _974 = _930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[158].x, _916);
    out.m_57.x = _964;
    out.m_57.y = _966;
    out.m_57.z = _968;
    out.m_57.w = _962;
    float _978 = _860 * _928;
    float _980 = _878 * _928;
    out.m_59.x = _970;
    out.m_59.y = _954;
    out.m_59.z = _950;
    out.m_59.w = _906;
    out.m_61.x = _952;
    out.m_61.y = _972;
    out.m_61.z = _974;
    out.m_61.w = _960;
    int _982 = as_type<int>(_974);
    if (_910)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3212 = as_type<float>(_958);
        out.gl_Position.z = _3212;
    }
    out.m_63.x = _976;
    if (_910)
    {
        out.m_45.x = 0.0;
    }
    if (_910)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _984 = -_978;
    float _986 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _512);
    float _988 = _890 * _928;
    float _990 = -_980;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _856);
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _996 = _986 + _994;
    float _998 = -_988;
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[18].w, _538);
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1004 = _992 + _1002;
    float _1006 = _996 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1008 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1010 = _1000 + _1008;
    float _1012 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1006);
    float _1014 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1012);
    bool _1016 = _1014 >= 0.0;
    float _1018 = _1004;
    if (_1016)
    {
        _1018 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1020 = _1018;
    if (_1016)
    {
        out.m_45.x = 0.0;
    }
    if (_1016)
    {
        float _1022 = _1020 * 5.0;
        _982 = as_type<int>(_1022);
    }
    int _1024 = _982;
    if (_1016)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3307 = as_type<float>(_1024);
        out.gl_Position.z = _3307;
    }
    if (_1016)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1026 = -_512;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1030 = -_856;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1034 = -_538;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1038 = -_978;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _860);
    float _1042 = _1028 * _1028;
    float _1044 = -_980;
    float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[18].w, _878);
    float _1048 = -_988;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _890);
    float _1052 = _1040 * _1040;
    float _1054 = fma(_1032, _1032, _1042);
    float _1056 = fma(_1046, _1046, _1052);
    float _1058 = fma(_1036, _1036, _1054);
    float _1060 = in.m_49.x;
    float _1062 = in.m_49.y;
    float _1064 = in.m_49.z;
    float _1066 = fma(_1050, _1050, _1056);
    float _1068 = rsqrt(_1058);
    float _1070 = sqrt(_1066);
    float _1072 = _1032 * _1068;
    float _1074 = _1036 * _1068;
    float _1076 = _1028 * _1068;
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1080 = _1072 * _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1084 = _1074 * _1082;
    float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1088 = _1076 * _1086;
    float _1090 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1094 = -_1080;
    float _1096 = fma(_1074, _1092, _1094);
    float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1100 = -_1084;
    float _1102 = fma(_1076, _1098, _1100);
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1106 = -_1088;
    float _1108 = fma(_1072, _1104, _1106);
    float _1110 = in.m_65.x;
    float _1112 = in.m_65.y;
    float _1114 = in.m_65.z;
    float _1116 = _1096 * _1096;
    float _1118 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1120 = _928 * _1070;
    float _1122 = fma(_1102, _1102, _1116);
    float _1124 = _1118 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1126 = fma(_1108, _1108, _1122);
    float _1128 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1130 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1132 = rsqrt(_1126);
    float _1134 = _1128 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1136 = _1120 * _1130;
    float _1138 = _1120 * _1124;
    float _1140 = _1120 * _1134;
    float _1142 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1112);
    float _1144 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1110);
    float _1146 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1114);
    float _1148 = _1136 * _1142;
    float _1150 = _1102 * _1132;
    float _1152 = _1096 * _1132;
    float _1154 = _1108 * _1132;
    float _1156 = _1140 * _1144;
    float _1158 = _1076 * _1150;
    float _1160 = _1074 * _1152;
    float _1162 = -_1158;
    float _1164 = fma(_1072, _1152, _1162);
    float _1166 = -_1160;
    float _1168 = fma(_1076, _1154, _1166);
    float _1170 = _1138 * _1146;
    float _1172 = _1148 * _1164;
    float _1174 = _1148 * _1168;
    float _1176 = fma(_1156, _1154, _1172);
    float _1178 = fma(_1156, _1150, _1174);
    float _1180 = fma(_1170, _1074, _1176);
    float _1182 = fma(_1170, _1072, _1178);
    float _1184 = _1072 * _1154;
    float _1186 = _538 + _1180;
    float _1188 = _856 + _1182;
    float _1190 = -_1184;
    float _1192 = fma(_1074, _1150, _1190);
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1196 = _1186 + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1200 = _1188 + _1198;
    float _1202 = _1148 * _1192;
    float _1204 = _1196 * _1196;
    float _1206 = fma(_1156, _1152, _1202);
    float _1208 = fma(_1200, _1200, _1204);
    float _1210 = fma(_1170, _1076, _1206);
    float _1212 = sqrt(_1208);
    float _1214 = _512 + _1210;
    bool _1216 = _1212 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1218 = _1204;
    float _1220 = _1188;
    float _1222 = _1212;
    float _1224 = _1196;
    if (!_1216)
    {
        _1218 = _1186;
    }
    float _1226 = _1218;
    float _1228 = _1226;
    if (!_1216)
    {
        _938 = _1214;
    }
    float _1230 = _938;
    bool _1232 = !_1216;
    float _1234 = _1230;
    if (!_1232)
    {
        float _1236 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1238 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1240 = _1212 + _1238;
        float _1242 = _1214 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1244 = rsqrt(_1208);
        float _1246 = _1240 * _1236;
        float _1248 = _1246 * 0.15915493667125701904296875;
        float _1250 = _1248 * 6.283185482025146484375;
        float _1252 = cos(_1250);
        float _1254 = _1248 * 6.283185482025146484375;
        float _1256 = sin(_1254);
        float _1258 = _1252 + (-1.0);
        float _1260 = _1258 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1262 = fma(_1256, _1242, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1264 = fma(_1214, _1252, _1260);
        float _1266 = _1244 * _1262;
        float _1268 = fma(_1200, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1270 = fma(_1196, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1234 = _1264;
        _1220 = _1268;
        _1228 = _1270;
        _1222 = _1266;
    }
    float _1272 = _1234;
    float _1274 = _1220;
    float _1276 = _1228;
    float _1278 = _1222;
    float _1280 = -_978;
    float _1282 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1272);
    float _1284 = -_980;
    float _1286 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1274);
    float _1288 = -_988;
    float _1290 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1276);
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1294 = _1282 + _1292;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1298 = _1286 + _1296;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1302 = _1290 + _1300;
    float _1304 = _1294 * _1294;
    float _1306 = fma(_1298, _1298, _1304);
    float _1308 = fma(_1302, _1302, _1306);
    float _1310 = rsqrt(_1308);
    float _1312 = sqrt(_1308);
    float _1314 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1316 = _1298 * _1314;
    float _1318 = _1302 * _1314;
    float _1320 = _1316 * _1316;
    float _1322 = _1318 * _1318;
    float _1324 = _1320 + _1322;
    float _1326 = sqrt(_1324);
    bool _1328 = _1326 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1332 = _1326 + _1330;
    float _1334 = _1302;
    float _1336 = _1306;
    float _1338 = _1332;
    float _1340 = _1314;
    if (_1328)
    {
        float _1342 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1334 = _1342;
    }
    float _1344 = _1334;
    if (_1328)
    {
        float _1346 = rsqrt(_1324);
        _1336 = _1346;
    }
    float _1348 = _1336;
    float _1350 = _1348;
    if (_1328)
    {
        float _1352 = _1332 * _1344;
        _1338 = _1352;
    }
    float _1354 = _1338;
    if (_1328)
    {
        float _1356 = _1354 * 0.15915493667125701904296875;
        _1224 = _1356;
    }
    float _1358 = _1224;
    float _1360 = _1278;
    if (_1328)
    {
        float _1362 = _1358 * 6.283185482025146484375;
        float _1364 = sin(_1362);
        _1360 = _1364;
    }
    float _1366 = _1360;
    float _1368 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1370 = precise::max(0.0, _1368);
    float _1372 = _1310;
    float _1374 = _1370;
    float _1376 = _1368;
    if (_1328)
    {
        float _1378 = _1358 * 6.283185482025146484375;
        float _1380 = cos(_1378);
        _1372 = _1380;
    }
    float _1382 = _1372;
    float _1384 = -_1314;
    float _1386 = -_1370;
    float _1388 = fma(_1294, _1384, _1386);
    float _1390 = _1388;
    if (!_1328)
    {
        _1374 = _1320;
    }
    float _1392 = _1374;
    float _1394 = _1392;
    if (_1328)
    {
        float _1396 = _1388 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1376 = _1396;
    }
    float _1398 = _1376;
    float _1400 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1402 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1404 = _1366;
    float _1406 = _1398;
    if (_1328)
    {
        float _1408 = fma(_1366, _1398, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1404 = _1408;
    }
    float _1410 = _1404;
    float _1412 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1402);
    float _1414 = _1410;
    float _1416 = _1382;
    if (_1328)
    {
        float _1418 = _1382 + (-1.0);
        _1406 = _1418;
    }
    float _1420 = _1406;
    float _1422 = _1420;
    if (_1328)
    {
        float _1424 = _1348 * _1410;
        _1340 = _1424;
    }
    float _1426 = _1340;
    if (!_1328)
    {
        _1414 = _1316;
    }
    float _1428 = _1414;
    float _1430 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1412);
    float _1432 = _1428;
    if (_1328)
    {
        float _1434 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1350 = _1434;
    }
    float _1436 = _1350;
    if (_1328)
    {
        float _1438 = _1316 * _1426;
        _1432 = _1438;
    }
    float _1440 = _1432;
    if (!_1328)
    {
        _1422 = _1318;
    }
    float _1442 = _1422;
    float _1444 = _1442;
    if (_1328)
    {
        float _1446 = _1318 * _1426;
        _1444 = _1446;
    }
    float _1448 = _1444;
    if (_1328)
    {
        float _1450 = fma(_1388, _1382, _1436);
        _1390 = _1450;
    }
    float _1452 = _1390;
    if (_1328)
    {
        float _1454 = _1440 * _1440;
        _1394 = _1454;
    }
    float _1456 = _1394;
    if (!_1328)
    {
        _1416 = _1322;
    }
    float _1458 = _1416;
    float _1460 = _1458;
    if (_1328)
    {
        float _1462 = _1448 * _1448;
        _1460 = _1462;
    }
    float _1464 = _1460;
    float _1466 = fma(_1452, _1452, _1456);
    float _1468 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1470 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1472 = _1466 + _1464;
    float _1474 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1468);
    float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1478 = fma(_1312, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1476);
    float _1480 = precise::clamp(_1478, 0.0, 1.0);
    float _1482 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1484 = rsqrt(_1472);
    float _1486 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1474);
    float _1488 = -_1480;
    float _1490 = _1488 + 1.0;
    float _1492 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1482);
    float _1494 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1496 = _1486 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1498 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1492);
    float _1500 = abs(_1490);
    float _1502 = log2(_1500);
    float _1504 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1506 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1494);
    float _1508 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1510 = -_1504;
    float _1512 = fma(_1510, _1400, 1.0);
    float _1514 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1506);
    float _1516 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1518 = _1484 * _1440;
    float _1520 = _1484 * _1452;
    float _1522 = _1484 * _1448;
    float _1524 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1516);
    float _1526 = _1518 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1528 = _1514 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1530 = log2(_1512);
    float _1532 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1524);
    float _1534 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1536 = -_1526;
    float _1538 = fma(_1520, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1536);
    float _1540 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1542 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1532);
    float _1544 = -_1522;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1538);
    float _1548 = exp2(_1534);
    float _1550 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1552 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1540);
    float _1554 = fma(_1546, -0.5, 0.5);
    float _1556 = fma(_1546, 0.5, 0.5);
    float _1558 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1550);
    float _1560 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1552);
    float _1562 = 1.0 / _1542;
    float _1564 = _1520 + 1.0;
    float _1566 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1558);
    float _1568 = fma(_1556, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1570 = _1530 * 0.693147182464599609375;
    float _1572 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1566);
    float _1574 = sqrt(_1554);
    float _1576 = -_1520;
    float _1578 = fma(_1548, _1564, _1576);
    float _1580 = fma(_1556, _1568, -0.212114393711090087890625);
    float _1582 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1560);
    float _1584 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1586 = fma(_1578, 0.5, 0.5);
    float _1588 = fma(_1556, _1580, 1.570728778839111328125);
    float _1590 = _1572 * _1562;
    float _1592 = _1582 * _1562;
    float _1594 = fma(_1590, 0.5, 0.5);
    float _1596 = fma(_1592, -0.5, 0.5);
    float _1598 = _1574 * 0.636619746685028076171875;
    float3 _4242 = float3(_1594, _1596, _1584);
    float _1600 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4242, float3(0.0), isnan(_4242)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4242, float3(0.0), isnan(_4242)), level(0.0)).x;
    float3 _4253 = float3(_1594, _1596, _1584);
    float4 _1603 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4253, float3(0.0), isnan(_4253)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4253, float3(0.0), isnan(_4253)), level(0.0)).xyzw;
    float _1605 = _1603.x;
    float _1607 = _1603.y;
    float _1609 = _1603.z;
    float _1611 = _1603.w;
    float _1613 = -_1588;
    float _1615 = fma(_1598, _1613, 1.0);
    float2 _4275 = float2(_1615, _1586);
    float3 _1619 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4275, float2(0.0), isnan(_4275)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4275, float2(0.0), isnan(_4275)), level(0.0)).xyz;
    float _1621 = _1619.x;
    float _1623 = _1619.y;
    float _1625 = _1619.z;
    float _1627 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1629 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1631 = _1572 + _1542;
    float _1633 = _1542 * 0.5;
    float _1635 = fma(_1470, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1629);
    float _1637 = exp2(_1627);
    float _1639 = _1631 * 0.5;
    float _1641 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1635);
    float _1643 = fma(_1582, -0.5, _1633);
    float _1645 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1641);
    float _1647 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1649 = _1645 + _1542;
    out.gl_Position.x = _1572;
    out.gl_Position.y = _1582;
    out.gl_Position.z = _1645;
    out.gl_Position.w = _1542;
    float _1651 = _1649 * 0.5;
    float _1653 = -_1637;
    float _1655 = _1653 + 1.0;
    out.m_45.x = _1647;
    float _1657 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1639;
    out.m_67.y = _1643;
    out.m_67.z = _1651;
    out.m_67.w = _1542;
    float _1659 = _1657 * _1600;
    float _1661 = -_1657;
    float _1663 = _1661 + 1.0;
    float _1665 = _1611 * _1659;
    float _1667 = _1611 * _1663;
    float _1669 = _1625 * _1659;
    float _1671 = fma(_1621, _1665, _1605);
    float _1673 = fma(_1623, _1665, _1607);
    float _1675 = fma(_1611, _1669, _1609);
    out.m_69.x = _1671;
    out.m_69.y = _1673;
    out.m_69.z = _1675;
    out.m_69.w = _1667;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

