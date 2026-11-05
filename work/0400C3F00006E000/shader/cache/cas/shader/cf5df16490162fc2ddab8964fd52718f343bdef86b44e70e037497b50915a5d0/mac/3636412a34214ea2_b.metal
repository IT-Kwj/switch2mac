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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_48 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _55;
    float _89 = _87 * _61;
    float _91 = _87 * _67;
    float _93 = _87 * _73;
    float _95 = _87 * _79;
    float _97 = 1.0 / _89;
    float _99 = _87 * _85;
    float _101 = _91 * _97;
    float _103 = _93 * _97;
    float2 _438 = float2(_101, _103);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_438, float2(0.0), isnan(_438))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_438, float2(0.0), isnan(_438))).x;
    float2 _449 = float2(_95, _99);
    float4 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_449, float2(0.0), isnan(_449))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_449, float2(0.0), isnan(_449))).xyzw;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float _116 = _108.w;
    float _118 = in.m_35.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_39.w;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_41.w;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_43.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _144 = _87 * _122;
    float _146 = _144 * _97;
    float _148 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _150 = fma(_146, (*spvDescriptorSet0.fp_c8)._m0[30].w, _148);
    float _152 = _87 * _128;
    float _154 = 1.0 / _150;
    float _156 = in.m_41.x;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_41.y;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_41.z;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = _87 * _160;
    float _176 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _178 = fma(_105, (*spvDescriptorSet0.fp_c8)._m0[30].w, _176);
    float _180 = -_152;
    float _182 = _116 + _180;
    float _184 = _87 * _134;
    float _186 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _188 = _154 * _186;
    float _190 = _182 * 4.0;
    float _192 = precise::clamp(_190, 0.0, 1.0);
    float _194 = 1.0 / _178;
    float _196 = _184 * _192;
    float _198 = 0.0 + _196;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _204 = -_188;
    float _206 = fma(_194, _202, _204);
    float _208 = _87 * _140;
    float _210 = _206 * _142;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = _200 * _212;
    float _216 = _214 * _208;
    bool _220 = _216 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _222 = isnan(_216);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _228 = _224 || _226;
    float _230 = in.m_39.x;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_39.y;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_39.z;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = _188;
    if (!_228)
    {
        discard_fragment();
    }
    float _250 = _87 * _166;
    float _252 = _87 * _234;
    float _254 = _87 * _240;
    float _256 = _87 * _246;
    float _258 = _87 * _172;
    float _260 = -_174;
    float _262 = _252 + _260;
    float _264 = -_250;
    float _266 = _254 + _264;
    float _268 = _110 * _110;
    float _270 = -_258;
    float _272 = _256 + _270;
    float _274 = _112 * _112;
    float _276 = _114 * _114;
    float _278 = fma(_268, _262, _174);
    float _280 = fma(_274, _266, _250);
    float _282 = fma(_276, _272, _258);
    float _284 = _250;
    if (!_228)
    {
        out.m_46.x = _278;
        out.m_46.y = _280;
        out.m_46.z = _282;
        out.m_46.w = _196;
        return out;
    }
    float _286 = _280 * 0.715200006961822509765625;
    float _288 = in.m_48.w;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_48.x;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_48.y;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = fma(_278, 0.2125999927520751953125, _286);
    float _308 = in.m_48.z;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = fma(_282, 0.072200000286102294921875, _306);
    bool _316 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _318 = 1.0 / _314;
    if (_316)
    {
        float _320 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _322 = _188 + _320;
        _248 = _322;
    }
    float _324 = _248;
    if (_316)
    {
        float _326 = _324 * 8.0;
        float _328 = precise::clamp(_326, 0.0, 1.0);
        _284 = _328;
    }
    float _330 = _284;
    float _332 = _318 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = fma(_334, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _338 = _87 * _292;
    float _340 = _87 * _298;
    float _342 = _87 * _304;
    float _344 = _336 * _338;
    float _346 = 0.0 + _216;
    float _348 = precise::clamp(_346, 0.0, 1.0);
    float _350 = _87 * _312;
    float _352 = fma(_278, _344, _340);
    float _354 = _348;
    if (_316)
    {
        float _356 = _348 * _330;
        _354 = _356;
    }
    float _358 = _354;
    float _360 = fma(_280, _344, _342);
    float _362 = fma(_282, _344, _350);
    float _364 = 0.0 + _358;
    float _366 = precise::clamp(_364, 0.0, 1.0);
    out.m_46.x = _352;
    out.m_46.y = _360;
    out.m_46.z = _362;
    out.m_46.w = _366;
    return out;
}

