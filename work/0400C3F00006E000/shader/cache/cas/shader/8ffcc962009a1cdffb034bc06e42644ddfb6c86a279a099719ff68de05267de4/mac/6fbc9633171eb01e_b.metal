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
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_38 [[user(locn6), flat]];
    float4 m_51 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_53 [[user(locn9)]];
    float4 m_59 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_38.x;
    float _72 = in.m_40.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_40.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = 1.0 / _68;
    float _86 = rint(_70);
    float _88 = precise::max(_86, 0.0);
    uint _91 = uint(_88);
    uint _93 = clamp(_91, 0u, 65535u);
    float _95 = _84 * _76;
    float _97 = _84 * _82;
    float3 _506 = float3(_95, _97, float(int(_93)));
    float3 _510 = select(_506, float3(0.0), isnan(_506));
    float4 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _510.xy, uint(rint(_510.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _510.xy, uint(rint(_510.z))).xyzw;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = _100.w;
    float _110 = in.m_42.w;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_44.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_42.x;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = _84 * _114;
    float _130 = in.m_42.y;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_46.y;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_42.z;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_46.z;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = _84 * _126;
    float _156 = _84 * _134;
    float _158 = _84 * _140;
    float _160 = _84 * _152;
    float _162 = _108 * _128;
    float _164 = _84 * _120;
    float _166 = 0.0 + _162;
    float _168 = precise::clamp(_166, 0.0, 1.0);
    float _170 = _168 * _164;
    bool _174 = _170 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _176 = isnan(_170);
    bool _178 = _174 || _176;
    bool _180 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _182 = _178 || _180;
    float _184 = in.m_46.x;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    if (!_182)
    {
        discard_fragment();
    }
    float _190 = _84 * _146;
    float _192 = -_158;
    float _194 = _156 + _192;
    float _196 = _104 * _104;
    float _198 = -_160;
    float _200 = _190 + _198;
    float _202 = _106 * _106;
    float _204 = fma(_196, _194, _158);
    float _206 = fma(_202, _200, _160);
    float _208 = _84 * _188;
    float _210 = -_208;
    float _212 = _154 + _210;
    float _214 = _102 * _102;
    float _216 = fma(_214, _212, _208);
    if (!_182)
    {
        out.m_49.x = _216;
        out.m_49.y = _204;
        out.m_49.z = _206;
        out.m_49.w = _162;
        return out;
    }
    float _218 = in.m_51.y;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_51.x;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_51.z;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = _84 * _222;
    float _238 = _84 * _228;
    float _240 = _84 * _234;
    float _242 = _236 * _236;
    float _244 = in.m_53.x;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = fma(_238, _238, _242);
    float _252 = fma(_240, _240, _250);
    float _254 = rsqrt(_252);
    float _256 = _238 * _254;
    float _258 = _236 * _254;
    float _260 = _240 * _254;
    float _262 = _84 * _248;
    float _264 = abs(_256);
    float _266 = abs(_258);
    float _268 = precise::max(_264, _266);
    float _270 = abs(_260);
    float _272 = precise::max(_270, _268);
    float _274 = 1.0 / _272;
    float _276 = _258 * _274;
    float _278 = -_274;
    float _280 = _260 * _278;
    float _282 = precise::min(_262, 1.0);
    float _284 = _256 * _274;
    float3 _775 = float3(_284, _276, _280);
    float3 _288 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_775, float3(0.0), isnan(_775)), level(_282)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_775, float3(0.0), isnan(_775)), level(_282)).xyz;
    float _290 = _288.x;
    float _292 = _288.y;
    float _294 = _288.z;
    float _296 = in.m_55.y;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = in.m_55.z;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_55.x;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = in.m_57.y;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = in.m_57.z;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = in.m_57.x;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = in.m_59.x;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = in.m_59.w;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = in.m_59.y;
    float _346 = gl_FragCoord.w;
    float _348 = _344 * _346;
    float _350 = in.m_59.z;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = _84 * _300;
    float _358 = _84 * _306;
    float _360 = _84 * _312;
    bool _362 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _364 = fma(_292, 0.20999999344348907470703125, _356);
    float _366 = fma(_294, 0.20999999344348907470703125, _358);
    float _368 = _84 * _318;
    float _370 = fma(_290, 0.20999999344348907470703125, _360);
    float _372 = _84 * _324;
    float _374 = _84 * _330;
    float _376 = _364 + _368;
    float _378 = _84 * _354;
    float _380 = _366 + _372;
    float _382 = _370 + _374;
    float _384 = _204 * _376;
    float _386 = 0.0 + _170;
    float _388 = precise::clamp(_386, 0.0, 1.0);
    float _390 = _206 * _380;
    float _392 = _216 * _382;
    float _394 = _84 * _336;
    float _396 = _84 * _342;
    float _398 = _84 * _348;
    float _400 = fma(_392, _396, _394);
    float _402 = fma(_384, _396, _398);
    float _404 = fma(_390, _396, _378);
    float _406 = _394;
    if (!_362)
    {
        _406 = _388;
    }
    float _408 = _406;
    bool _410 = !_362;
    float _412 = _408;
    if (!_410)
    {
        float _414 = in.m_61.w;
        float _416 = gl_FragCoord.w;
        float _418 = _414 * _416;
        float _420 = in.m_61.z;
        float _422 = gl_FragCoord.w;
        float _424 = _420 * _422;
        float _426 = _84 * _418;
        float _428 = _84 * _424;
        float _430 = 1.0 / _426;
        float _432 = _428 * _430;
        float _434 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _436 = fma(_432, (*spvDescriptorSet0.fp_c8)._m0[30].w, _434);
        float _438 = 1.0 / _436;
        float _440 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _442 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _444 = fma(_438, _440, _442);
        float _446 = _444 * 8.0;
        float _448 = precise::clamp(_446, 0.0, 1.0);
        float _450 = _388 * _448;
        _412 = _450;
    }
    float _452 = _412;
    float _454 = 0.0 + _452;
    float _456 = precise::clamp(_454, 0.0, 1.0);
    out.m_49.x = _400;
    out.m_49.y = _402;
    out.m_49.z = _404;
    out.m_49.w = _456;
    return out;
}

