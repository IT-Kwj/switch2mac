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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_41 [[user(locn5)]];
    float4 m_46 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _582 = float2(_71, _73);
    float4 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_582, float2(0.0), isnan(_582))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_582, float2(0.0), isnan(_582))).xyzw;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = _76.z;
    float _84 = _76.w;
    float _86 = in.m_37.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_39.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = _69 * _90;
    float _100 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _102 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _100;
    float _104 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _106 = _104 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _108 = 1.0 / _102;
    float _110 = 1.0 / _106;
    float _112 = _84 * _98;
    float _114 = _69 * _96;
    float _116 = 0.0 + _112;
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = _118 * _114;
    bool _124 = _120 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _126 = isnan(_120);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _132 = _128 || _130;
    float _134 = in.m_41.y;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    if (!_132)
    {
        discard_fragment();
    }
    float _140 = _78 * _78;
    float _142 = _80 * _80;
    float _144 = _82 * _82;
    float _146 = _140 * _140;
    float _148 = _142 * _142;
    float _150 = _144 * _144;
    float _152 = _69 * _138;
    float _154 = -_152;
    float _156 = _154 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _158 = _156 * _156;
    float _160 = sqrt(_158);
    float _162 = precise::max(_160, 1.60000002384185791015625);
    float _164 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _166 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _164;
    float _168 = precise::min(_162, 15.0);
    float _170 = fma(_168, 0.074626870453357696533203125, -0.119402997195720672607421875);
    float _172 = precise::clamp(_170, 0.0, 1.0);
    float _174 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _176 = _172 + _174;
    float _178 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _180 = _172 + _178;
    float _182 = _176 * _110;
    float _184 = _180 * _108;
    float _186 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _188 = _186 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _190 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _192 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _190;
    float _194 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _196 = _194 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _198 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _200 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _198;
    bool _202 = _172 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _204 = isnan(_172);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _216 = _214 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _218 = fma(_166, _184, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _220 = fma(_200, _184, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _222 = fma(_192, _184, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    bool _224 = _172 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _226 = isnan(_172);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -_212;
    float _238 = _236 + 1.0;
    float _240 = fma(_188, _182, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _242 = fma(_216, _182, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _244 = fma(_196, _182, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _246 = _234 * _238;
    float _248 = -_234;
    float _250 = _248 + 1.0;
    float _252 = _218 * _246;
    float _254 = _220 * _246;
    float _256 = _222 * _246;
    float _258 = fma(_250, (*spvDescriptorSet0.fp_c9)._m0[107].x, _252);
    float _260 = fma(_250, (*spvDescriptorSet0.fp_c9)._m0[107].y, _254);
    float _262 = fma(_250, (*spvDescriptorSet0.fp_c9)._m0[107].z, _256);
    bool _264 = _172 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _266 = isnan(_172);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = -_274;
    float _278 = _276 + 1.0;
    float _280 = _212 * _278;
    float _282 = fma(_240, _280, _258);
    float _284 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _286 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _284;
    bool _288 = _172 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _290 = isnan(_172);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = fma(_242, _280, _260);
    float _302 = fma(_244, _280, _262);
    float _304 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _306 = _172 + _304;
    float _308 = 1.0 / _286;
    float _310 = -_298;
    float _312 = _310 + 1.0;
    float _314 = _274 * _312;
    float _316 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _318 = _316 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _320 = 1.0 / _318;
    float _322 = _306 * _308;
    float _324 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _326 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _324;
    float _328 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _330 = _172 + _328;
    bool _332 = _172 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _334 = isnan(_172);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = fma(_326, _322, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _346 = fma(_344, _314, _282);
    float _348 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _350 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _348;
    float _352 = _330 * _320;
    float _354 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _356 = _354 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _358 = fma(_350, _322, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _360 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _362 = _360 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _364 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _366 = _364 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _368 = fma(_356, _352, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _370 = fma(_358, _314, _300);
    float _372 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _374 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _372;
    float _376 = fma(_362, _352, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _378 = fma(_366, _352, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    float _380 = in.m_37.z;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = fma(_374, _322, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _388 = fma(_386, _314, _302);
    float _390 = -_342;
    float _392 = _390 + 1.0;
    float _394 = _298 * _392;
    float _396 = in.m_37.x;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = fma(_368, _394, _346);
    float _404 = fma(_376, _394, _370);
    float _406 = fma(_378, _394, _388);
    float _408 = fma(_342, (*spvDescriptorSet0.fp_c9)._m0[111].x, _402);
    float _410 = fma(_342, (*spvDescriptorSet0.fp_c9)._m0[111].y, _404);
    float _412 = fma(_342, (*spvDescriptorSet0.fp_c9)._m0[111].z, _406);
    float _414 = in.m_37.y;
    float _416 = gl_FragCoord.w;
    float _418 = _414 * _416;
    float _420 = _69 * _400;
    float _422 = _146 * _420;
    float _424 = fma(_408, (*spvDescriptorSet0.fp_c9)._m0[106].x, _422);
    float _426 = _69 * _418;
    float _428 = _69 * _384;
    float _430 = _148 * _426;
    float _432 = _150 * _428;
    float _434 = fma(_410, (*spvDescriptorSet0.fp_c9)._m0[106].x, _430);
    float _436 = fma(_412, (*spvDescriptorSet0.fp_c9)._m0[106].x, _432);
    if (!_132)
    {
        out.m_44.x = _424;
        out.m_44.y = _434;
        out.m_44.z = _436;
        out.m_44.w = _112;
        return out;
    }
    float _438 = _434 * 0.715200006961822509765625;
    float _440 = in.m_46.w;
    float _442 = gl_FragCoord.w;
    float _444 = _440 * _442;
    float _446 = in.m_46.z;
    float _448 = gl_FragCoord.w;
    float _450 = _446 * _448;
    float _452 = in.m_46.x;
    float _454 = gl_FragCoord.w;
    float _456 = _452 * _454;
    float _458 = fma(_424, 0.2125999927520751953125, _438);
    float _460 = in.m_46.y;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = fma(_436, 0.072200000286102294921875, _458);
    bool _468 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _470 = 1.0 / _466;
    float _472 = _470 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _474 = precise::clamp(_472, 0.0, 1.0);
    float _476 = _69 * _444;
    float _478 = fma(_474, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _480 = _69 * _450;
    float _482 = _478 * _476;
    float _484 = 0.0 + _120;
    float _486 = precise::clamp(_484, 0.0, 1.0);
    float _488 = _69 * _456;
    float _490 = _69 * _464;
    float _492 = fma(_436, _482, _480);
    float _494 = fma(_424, _482, _488);
    float _496 = fma(_434, _482, _490);
    float _498 = _480;
    if (!_468)
    {
        _498 = _486;
    }
    float _500 = _498;
    bool _502 = !_468;
    float _504 = _500;
    if (!_502)
    {
        float _506 = in.m_48.w;
        float _508 = gl_FragCoord.w;
        float _510 = _506 * _508;
        float _512 = in.m_48.z;
        float _514 = gl_FragCoord.w;
        float _516 = _512 * _514;
        float _518 = _69 * _510;
        float _520 = _69 * _516;
        float _522 = 1.0 / _518;
        float _524 = _520 * _522;
        float _526 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _528 = fma(_524, (*spvDescriptorSet0.fp_c8)._m0[30].w, _526);
        float _530 = 1.0 / _528;
        float _532 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _534 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _536 = fma(_530, _532, _534);
        float _538 = _536 * 8.0;
        float _540 = precise::clamp(_538, 0.0, 1.0);
        float _542 = _486 * _540;
        _504 = _542;
    }
    float _544 = _504;
    float _546 = 0.0 + _544;
    float _548 = precise::clamp(_546, 0.0, 1.0);
    out.m_44.x = _494;
    out.m_44.y = _496;
    out.m_44.z = _492;
    out.m_44.w = _548;
    return out;
}

