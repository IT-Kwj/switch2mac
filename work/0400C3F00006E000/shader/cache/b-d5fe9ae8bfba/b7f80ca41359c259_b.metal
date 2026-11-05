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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d_array<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texturecube<float> fp_t_tcb_1E [[id(5)]];
    sampler fp_t_tcb_1ESmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_1ESmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_42 [[user(locn4), flat]];
    float4 m_40 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_36 [[user(locn7), flat]];
    float4 m_53 [[user(locn8)]];
    float4 m_59 [[user(locn9)]];
    float4 m_55 [[user(locn10)]];
    float4 m_61 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = in.m_36.x;
    float _72 = gl_FragCoord.w;
    float _74 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _76 = in.m_40.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = _70 + 1.0;
    float _90 = 1.0 / _72;
    float _92 = _88 * _74;
    float _94 = floor(_92);
    float _96 = rint(_70);
    float _98 = precise::max(_96, 0.0);
    uint _101 = uint(_98);
    uint _103 = clamp(_101, 0u, 65535u);
    float _105 = _90 * _80;
    float _107 = -_94;
    float _109 = fma(_107, (*spvDescriptorSet0.fp_c9)._m0[22].x, _88);
    float _111 = _90 * _86;
    float _113 = rint(_109);
    float _115 = precise::max(_113, 0.0);
    uint _117 = uint(_115);
    uint _119 = clamp(_117, 0u, 65535u);
    float3 _621 = float3(_105, _111, float(int(_103)));
    float3 _625 = select(_621, float3(0.0), isnan(_621));
    float4 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _625.xy, uint(rint(_625.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _625.xy, uint(rint(_625.z))).xyzw;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float _130 = _122.w;
    float3 _642 = float3(_105, _111, float(int(_119)));
    float3 _644 = select(_642, float3(0.0), isnan(_642));
    float4 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _644.xy, uint(rint(_644.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _644.xy, uint(rint(_644.z))).xyzw;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    float _142 = in.m_42.y;
    float _144 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _146 = in.m_44.w;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_46.w;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_48.x;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = _142 * _144;
    float _166 = _164 * _144;
    float _168 = floor(_166);
    float _170 = -_168;
    float _172 = fma(_170, (*spvDescriptorSet0.fp_c9)._m0[22].y, _164);
    float _174 = _90 * _156;
    float _176 = _172 + 9.9999997473787516355514526367188e-05;
    float _178 = floor(_176);
    float _180 = -_178;
    float _182 = _176 + _180;
    float _184 = _90 * _150;
    float _186 = in.m_46.x;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_44.z;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_46.z;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = -_130;
    float _206 = _204 + _140;
    float _208 = fma(_182, _206, _130);
    float _210 = _208 * _184;
    float _212 = _174 * _210;
    float _214 = _90 * _162;
    float _216 = 0.0 + _212;
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = _218 * _214;
    bool _224 = _220 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _226 = isnan(_220);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _232 = _228 || _230;
    float _234 = in.m_44.x;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = in.m_44.y;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = in.m_46.y;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    if (!_232)
    {
        discard_fragment();
    }
    float _252 = -_124;
    float _254 = _252 + _134;
    float _256 = -_126;
    float _258 = _256 + _136;
    float _260 = -_128;
    float _262 = _260 + _138;
    float _264 = _90 * _202;
    float _266 = fma(_182, _254, _124);
    float _268 = fma(_182, _258, _126);
    float _270 = _90 * _196;
    float _272 = fma(_182, _262, _128);
    float _274 = _266 * _266;
    float _276 = _268 * _268;
    float _278 = -_264;
    float _280 = _270 + _278;
    float _282 = _90 * _238;
    float _284 = _90 * _190;
    float _286 = _90 * _244;
    float _288 = _90 * _250;
    float _290 = -_284;
    float _292 = _282 + _290;
    float _294 = _272 * _272;
    float _296 = -_288;
    float _298 = _286 + _296;
    float _300 = fma(_274, _292, _284);
    float _302 = fma(_294, _280, _264);
    float _304 = fma(_276, _298, _288);
    if (!_232)
    {
        out.m_51.x = _300;
        out.m_51.y = _304;
        out.m_51.z = _302;
        out.m_51.w = _212;
        return out;
    }
    float _306 = in.m_53.y;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_53.x;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_53.z;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = _90 * _310;
    float _326 = _90 * _316;
    float _328 = _90 * _322;
    float _330 = _324 * _324;
    float _332 = in.m_55.x;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = fma(_326, _326, _330);
    float _340 = fma(_328, _328, _338);
    float _342 = rsqrt(_340);
    float _344 = _326 * _342;
    float _346 = _324 * _342;
    float _348 = _328 * _342;
    float _350 = _90 * _336;
    float _352 = abs(_344);
    float _354 = abs(_346);
    float _356 = precise::max(_352, _354);
    float _358 = abs(_348);
    float _360 = precise::max(_358, _356);
    float _362 = 1.0 / _360;
    float _364 = _346 * _362;
    float _366 = -_362;
    float _368 = _348 * _366;
    float _370 = precise::min(_350, 1.0);
    float _372 = _344 * _362;
    float3 _987 = float3(_372, _364, _368);
    float3 _376 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_987, float3(0.0), isnan(_987)), level(_370)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_987, float3(0.0), isnan(_987)), level(_370)).xyz;
    float _378 = _376.x;
    float _380 = _376.y;
    float _382 = _376.z;
    float _384 = in.m_57.y;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = in.m_57.z;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = in.m_57.x;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = in.m_59.y;
    float _404 = gl_FragCoord.w;
    float _406 = _402 * _404;
    float _408 = in.m_59.z;
    float _410 = gl_FragCoord.w;
    float _412 = _408 * _410;
    float _414 = in.m_59.x;
    float _416 = gl_FragCoord.w;
    float _418 = _414 * _416;
    float _420 = in.m_61.x;
    float _422 = gl_FragCoord.w;
    float _424 = _420 * _422;
    float _426 = in.m_61.w;
    float _428 = gl_FragCoord.w;
    float _430 = _426 * _428;
    float _432 = in.m_61.y;
    float _434 = gl_FragCoord.w;
    float _436 = _432 * _434;
    float _438 = in.m_61.z;
    float _440 = gl_FragCoord.w;
    float _442 = _438 * _440;
    float _444 = _90 * _388;
    float _446 = _90 * _394;
    float _448 = _90 * _400;
    bool _450 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _452 = fma(_380, 0.20999999344348907470703125, _444);
    float _454 = fma(_382, 0.20999999344348907470703125, _446);
    float _456 = fma(_378, 0.20999999344348907470703125, _448);
    float _458 = _90 * _406;
    float _460 = _90 * _412;
    float _462 = _90 * _418;
    float _464 = _452 + _458;
    float _466 = _454 + _460;
    float _468 = _456 + _462;
    float _470 = _90 * _430;
    float _472 = _304 * _464;
    float _474 = _302 * _466;
    float _476 = _300 * _468;
    float _478 = 0.0 + _220;
    float _480 = precise::clamp(_478, 0.0, 1.0);
    float _482 = _90 * _424;
    float _484 = _90 * _436;
    float _486 = _90 * _442;
    float _488 = fma(_476, _470, _482);
    float _490 = fma(_472, _470, _484);
    float _492 = fma(_474, _470, _486);
    float _494 = _482;
    if (!_450)
    {
        _494 = _480;
    }
    float _496 = _494;
    bool _498 = !_450;
    float _500 = _496;
    if (!_498)
    {
        float _502 = in.m_63.w;
        float _504 = gl_FragCoord.w;
        float _506 = _502 * _504;
        float _508 = in.m_63.z;
        float _510 = gl_FragCoord.w;
        float _512 = _508 * _510;
        float _514 = _90 * _506;
        float _516 = _90 * _512;
        float _518 = 1.0 / _514;
        float _520 = _516 * _518;
        float _522 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _524 = fma(_520, (*spvDescriptorSet0.fp_c8)._m0[30].w, _522);
        float _526 = 1.0 / _524;
        float _528 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _530 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _532 = fma(_526, _528, _530);
        float _534 = _532 * 8.0;
        float _536 = precise::clamp(_534, 0.0, 1.0);
        float _538 = _480 * _536;
        _500 = _538;
    }
    float _540 = _500;
    float _542 = 0.0 + _540;
    float _544 = precise::clamp(_542, 0.0, 1.0);
    out.m_51.x = _488;
    out.m_51.y = _490;
    out.m_51.z = _492;
    out.m_51.w = _544;
    return out;
}

