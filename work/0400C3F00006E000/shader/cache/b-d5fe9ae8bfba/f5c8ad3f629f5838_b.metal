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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_50 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_48 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.z;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_35.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / _57;
    float _85 = _83 * _63;
    float _87 = _83 * _69;
    float _89 = _83 * _75;
    float _91 = _83 * _81;
    float2 _445 = float2(_85, _87);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_445, float2(0.0), isnan(_445))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_445, float2(0.0), isnan(_445))).xyzw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    float2 _464 = float2(_89, _91);
    float4 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_464, float2(0.0), isnan(_464))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_464, float2(0.0), isnan(_464))).xyzw;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    float _114 = in.m_37.w;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_39.w;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_41.w;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_43.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = _83 * _118;
    float _140 = _83 * _124;
    float _142 = _83 * _130;
    float _144 = in.m_37.y;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_41.z;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_41.y;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_41.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_39.y;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_39.x;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_39.z;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = _102 * _112;
    float _188 = -_138;
    float _190 = fma(_186, _140, _188);
    float _192 = _142 * _190;
    float _194 = _83 * _136;
    float _196 = 0.0 + _192;
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = _198 * _194;
    bool _204 = _200 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _206 = isnan(_200);
    bool _208 = _204 || _206;
    bool _210 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _212 = _208 || _210;
    float _214 = in.m_37.z;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_37.x;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    if (!_212)
    {
        discard_fragment();
    }
    float _226 = _106 * _106;
    float _228 = _108 * _108;
    float _230 = _83 * _154;
    float _232 = _83 * _166;
    float _234 = _96 * _226;
    float _236 = _98 * _228;
    float _238 = _110 * _110;
    float _240 = _83 * _148;
    float _242 = _83 * _160;
    float _244 = _100 * _238;
    float _246 = -_242;
    float _248 = _240 + _246;
    float _250 = _83 * _218;
    float _252 = _83 * _224;
    float _254 = fma(_236, _248, _242);
    float _256 = _83 * _184;
    float _258 = -_230;
    float _260 = _250 + _258;
    float _262 = -_232;
    float _264 = _252 + _262;
    float _266 = fma(_244, _260, _230);
    float _268 = _83 * _172;
    float _270 = fma(_234, _264, _232);
    float _272 = _83 * _178;
    float _274 = _254 * _268;
    float _276 = _266 * _256;
    float _278 = _270 * _272;
    if (!_212)
    {
        out.m_46.x = _278;
        out.m_46.y = _274;
        out.m_46.z = _276;
        out.m_46.w = _192;
        return out;
    }
    float _280 = _274 * 0.715200006961822509765625;
    float _282 = in.m_48.w;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = in.m_48.z;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_48.x;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = fma(_278, 0.2125999927520751953125, _280);
    float _302 = in.m_48.y;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = fma(_276, 0.072200000286102294921875, _300);
    bool _310 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _312 = 1.0 / _308;
    float _314 = _312 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = _83 * _286;
    float _320 = fma(_316, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _322 = _83 * _292;
    float _324 = _320 * _318;
    float _326 = 0.0 + _200;
    float _328 = precise::clamp(_326, 0.0, 1.0);
    float _330 = _83 * _298;
    float _332 = _83 * _306;
    float _334 = fma(_276, _324, _322);
    float _336 = fma(_278, _324, _330);
    float _338 = fma(_274, _324, _332);
    float _340 = _322;
    if (!_310)
    {
        _340 = _328;
    }
    float _342 = _340;
    bool _344 = !_310;
    float _346 = _342;
    if (!_344)
    {
        float _348 = in.m_50.w;
        float _350 = gl_FragCoord.w;
        float _352 = _348 * _350;
        float _354 = in.m_50.z;
        float _356 = gl_FragCoord.w;
        float _358 = _354 * _356;
        float _360 = _83 * _352;
        float _362 = _83 * _358;
        float _364 = 1.0 / _360;
        float _366 = _362 * _364;
        float _368 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _370 = fma(_366, (*spvDescriptorSet0.fp_c8)._m0[30].w, _368);
        float _372 = 1.0 / _370;
        float _374 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _376 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _378 = fma(_372, _374, _376);
        float _380 = _378 * 8.0;
        float _382 = precise::clamp(_380, 0.0, 1.0);
        float _384 = _328 * _382;
        _346 = _384;
    }
    float _386 = _346;
    float _388 = 0.0 + _386;
    float _390 = precise::clamp(_388, 0.0, 1.0);
    out.m_46.x = _336;
    out.m_46.y = _338;
    out.m_46.z = _334;
    out.m_46.w = _390;
    return out;
}

