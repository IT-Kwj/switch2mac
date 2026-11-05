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
    constant _16* fp_c7 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_52 [[user(locn6)]];
    float4 m_50 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _59;
    float _75 = _73 * _65;
    float _77 = _73 * _71;
    float2 _416 = float2(_75, _77);
    float4 _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_416, float2(0.0), isnan(_416))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_416, float2(0.0), isnan(_416))).xyzw;
    float _82 = _80.x;
    float _84 = _80.y;
    float _86 = _80.z;
    float _88 = _80.w;
    float _90 = in.m_37.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_39.w;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_41.x;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = _73 * _94;
    float _110 = precise::max(0.0, _108);
    float _112 = precise::min(_110, 0.4000000059604644775390625);
    float _114 = fma(_112, -2.5, 1.0);
    float _116 = _73 * _100;
    float _118 = _114 * _114;
    float _120 = _116 * _116;
    float _122 = _118 * _118;
    float _124 = in.m_43.x;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_43.z;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_45.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_45.y;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_45.z;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = -(*spvDescriptorSet0.fp_c7)._m0[0].x;
    float _156 = _154 + 1.0;
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = precise::max(_158, 0.5);
    float _162 = precise::min(_160, 0.75);
    float _164 = fma(_88, _120, _122);
    float _166 = _73 * _106;
    float _168 = 0.0 + _164;
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = _170 * _166;
    bool _176 = _172 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _178 = isnan(_172);
    bool _180 = _176 || _178;
    bool _182 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _184 = _180 || _182;
    float _186 = in.m_43.y;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    if (!_184)
    {
        discard_fragment();
    }
    float _192 = -_108;
    float _194 = fma(_82, _82, _192);
    float _196 = -_108;
    float _198 = fma(_84, _84, _196);
    float _200 = -_108;
    float _202 = fma(_86, _86, _200);
    float _204 = _73 * _128;
    float _206 = _194 + _164;
    float _208 = precise::clamp(_206, 0.0, 1.0);
    float _210 = _198 + _164;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = _202 + _164;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = _73 * _134;
    float _220 = -_208;
    float _222 = _220 + 1.0;
    float _224 = -_216;
    float _226 = _224 + 1.0;
    float _228 = _204 * _222;
    float _230 = _73 * _140;
    float _232 = _218 * _226;
    float _234 = _73 * _190;
    float _236 = -_212;
    float _238 = _236 + 1.0;
    float _240 = _73 * _146;
    float _242 = fma(_208, _230, _228);
    float _244 = _234 * _238;
    float _246 = _73 * _152;
    float _248 = fma(_212, _240, _244);
    float _250 = fma(_216, _246, _232);
    float _252 = -_242;
    float _254 = fma(_242, (*spvDescriptorSet0.fp_c9)._m0[194].y, _252);
    float _256 = fma(_162, -4.0, 3.0);
    float _258 = -_248;
    float _260 = fma(_248, (*spvDescriptorSet0.fp_c9)._m0[194].z, _258);
    float _262 = -_250;
    float _264 = fma(_250, (*spvDescriptorSet0.fp_c9)._m0[194].w, _262);
    float _266 = fma(_256, _254, _242);
    float _268 = fma(_256, _260, _248);
    float _270 = fma(_256, _264, _250);
    if (!_184)
    {
        out.m_48.x = _266;
        out.m_48.y = _268;
        out.m_48.z = _270;
        out.m_48.w = _170;
        return out;
    }
    float _272 = _268 * 0.715200006961822509765625;
    float _274 = in.m_50.w;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = in.m_50.z;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = in.m_50.x;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = fma(_266, 0.2125999927520751953125, _272);
    float _294 = in.m_50.y;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = fma(_270, 0.072200000286102294921875, _292);
    bool _302 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _304 = 1.0 / _300;
    float _306 = _304 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _308 = precise::clamp(_306, 0.0, 1.0);
    float _310 = _73 * _278;
    float _312 = fma(_308, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _314 = _73 * _284;
    float _316 = _312 * _310;
    float _318 = 0.0 + _172;
    float _320 = precise::clamp(_318, 0.0, 1.0);
    float _322 = _73 * _290;
    float _324 = _73 * _298;
    float _326 = fma(_270, _316, _314);
    float _328 = fma(_266, _316, _322);
    float _330 = fma(_268, _316, _324);
    float _332 = _314;
    if (!_302)
    {
        _332 = _320;
    }
    float _334 = _332;
    bool _336 = !_302;
    float _338 = _334;
    if (!_336)
    {
        float _340 = in.m_52.w;
        float _342 = gl_FragCoord.w;
        float _344 = _340 * _342;
        float _346 = in.m_52.z;
        float _348 = gl_FragCoord.w;
        float _350 = _346 * _348;
        float _352 = _73 * _344;
        float _354 = _73 * _350;
        float _356 = 1.0 / _352;
        float _358 = _354 * _356;
        float _360 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _362 = fma(_358, (*spvDescriptorSet0.fp_c8)._m0[30].w, _360);
        float _364 = 1.0 / _362;
        float _366 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _368 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _370 = fma(_364, _366, _368);
        float _372 = _370 * 8.0;
        float _374 = precise::clamp(_372, 0.0, 1.0);
        float _376 = _320 * _374;
        _338 = _376;
    }
    float _378 = _338;
    float _380 = 0.0 + _378;
    float _382 = precise::clamp(_380, 0.0, 1.0);
    out.m_48.x = _328;
    out.m_48.y = _330;
    out.m_48.z = _326;
    out.m_48.w = _382;
    return out;
}

