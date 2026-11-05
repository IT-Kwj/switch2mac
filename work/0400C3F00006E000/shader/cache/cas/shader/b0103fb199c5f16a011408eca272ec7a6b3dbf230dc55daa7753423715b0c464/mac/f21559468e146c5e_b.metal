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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
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
    float4 m_48 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.z;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _55;
    float _83 = _81 * _61;
    float _85 = _81 * _67;
    float _87 = _81 * _73;
    float _89 = _81 * _79;
    float2 _429 = float2(_83, _85);
    float4 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_429, float2(0.0), isnan(_429))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_429, float2(0.0), isnan(_429))).xyzw;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float _100 = _92.w;
    float2 _448 = float2(_87, _89);
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_448, float2(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_448, float2(0.0), isnan(_448))).xyzw;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = _102.w;
    float _112 = in.m_37.w;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_39.w;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_41.w;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_43.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = _81 * _116;
    float _138 = _81 * _122;
    float _140 = in.m_37.y;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_37.z;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_41.z;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_37.x;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_41.x;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_41.y;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = -_100;
    float _178 = _176 + 1.0;
    float _180 = _81 * _128;
    float _182 = _110 * _178;
    float _184 = -_136;
    float _186 = fma(_182, _138, _184);
    float _188 = _186 * 4.0;
    float _190 = precise::clamp(_188, 0.0, 1.0);
    float _192 = _180 * _190;
    float _194 = _81 * _134;
    float _196 = 0.0 + _192;
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = _198 * _194;
    bool _204 = _200 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _206 = isnan(_200);
    bool _208 = _204 || _206;
    bool _210 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _212 = _208 || _210;
    float _214 = in.m_39.y;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_39.x;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    if (!_212)
    {
        discard_fragment();
    }
    float _226 = in.m_39.z;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = -_96;
    float _234 = _232 + 1.0;
    float _236 = _106 * _106;
    float _238 = -_94;
    float _240 = _238 + 1.0;
    float _242 = _104 * _104;
    float _244 = _81 * _144;
    float _246 = _236 * _234;
    float _248 = -_98;
    float _250 = _248 + 1.0;
    float _252 = _108 * _108;
    float _254 = _81 * _150;
    float _256 = _81 * _156;
    float _258 = _242 * _240;
    float _260 = _81 * _162;
    float _262 = _81 * _168;
    float _264 = _81 * _174;
    float _266 = _252 * _250;
    float _268 = -_256;
    float _270 = _254 + _268;
    float _272 = -_262;
    float _274 = _260 + _272;
    float _276 = -_264;
    float _278 = _244 + _276;
    float _280 = _81 * _224;
    float _282 = fma(_266, _270, _256);
    float _284 = _81 * _218;
    float _286 = fma(_258, _274, _262);
    float _288 = fma(_246, _278, _264);
    float _290 = _286 * _280;
    float _292 = _81 * _230;
    float _294 = _288 * _284;
    float _296 = _282 * _292;
    if (!_212)
    {
        out.m_46.x = _290;
        out.m_46.y = _294;
        out.m_46.z = _296;
        out.m_46.w = _192;
        return out;
    }
    float _298 = _294 * 0.715200006961822509765625;
    float _300 = 0.0 + _200;
    float _302 = precise::clamp(_300, 0.0, 1.0);
    float _304 = fma(_290, 0.2125999927520751953125, _298);
    bool _306 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _308 = fma(_296, 0.072200000286102294921875, _304);
    float _310 = 1.0 / _308;
    float _312 = _310 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = fma(_314, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _318 = _290 * _316;
    float _320 = _294 * _316;
    float _322 = _296 * _316;
    float _324 = _316;
    if (!_306)
    {
        _324 = _302;
    }
    float _326 = _324;
    bool _328 = !_306;
    float _330 = _326;
    if (!_328)
    {
        float _332 = in.m_48.w;
        float _334 = gl_FragCoord.w;
        float _336 = _332 * _334;
        float _338 = in.m_48.z;
        float _340 = gl_FragCoord.w;
        float _342 = _338 * _340;
        float _344 = _81 * _336;
        float _346 = _81 * _342;
        float _348 = 1.0 / _344;
        float _350 = _346 * _348;
        float _352 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _354 = fma(_350, (*spvDescriptorSet0.fp_c8)._m0[30].w, _352);
        float _356 = 1.0 / _354;
        float _358 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _360 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _362 = fma(_356, _358, _360);
        float _364 = _362 * 8.0;
        float _366 = precise::clamp(_364, 0.0, 1.0);
        float _368 = _302 * _366;
        _330 = _368;
    }
    float _370 = _330;
    float _372 = 0.0 + _370;
    float _374 = precise::clamp(_372, 0.0, 1.0);
    out.m_46.x = _318;
    out.m_46.y = _320;
    out.m_46.z = _322;
    out.m_46.w = _374;
    return out;
}

