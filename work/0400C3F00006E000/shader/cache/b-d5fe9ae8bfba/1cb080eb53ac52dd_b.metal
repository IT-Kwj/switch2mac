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
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_39 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_50 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_37.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_37.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_39.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_39.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.z;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_39.w;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = 1.0 / _57;
    float _103 = _101 * _63;
    float _105 = _101 * _69;
    float _107 = _101 * _75;
    float _109 = _101 * _81;
    float _111 = _101 * _87;
    float _113 = _101 * _93;
    float _115 = 1.0 / _103;
    float _117 = _101 * _99;
    float _119 = _105 * _115;
    float _121 = _107 * _115;
    float2 _463 = float2(_119, _121);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_463, float2(0.0), isnan(_463))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_463, float2(0.0), isnan(_463))).x;
    float2 _474 = float2(_109, _111);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_474, float2(0.0), isnan(_474))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_474, float2(0.0), isnan(_474))).w;
    float2 _482 = float2(_113, _117);
    float4 _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_482, float2(0.0), isnan(_482))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_482, float2(0.0), isnan(_482))).xyzw;
    float _130 = _128.x;
    float _132 = _128.y;
    float _134 = _128.z;
    float _136 = _128.w;
    float _138 = in.m_37.z;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_41.w;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_43.w;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _158 = _101 * _142;
    float _160 = in.m_45.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = _158 * _115;
    float _168 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _170 = fma(_166, (*spvDescriptorSet0.fp_c8)._m0[30].w, _168);
    float _172 = 1.0 / _170;
    float _174 = _101 * _148;
    float _176 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _178 = _172 * _176;
    float _180 = in.m_41.y;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _188 = fma(_123, (*spvDescriptorSet0.fp_c8)._m0[30].w, _186);
    float _190 = 1.0 / _188;
    float _192 = _125 * _136;
    float _194 = _192 * _174;
    float _196 = _101 * _154;
    float _198 = _101 * _164;
    float _200 = _196 * _194;
    float _202 = 0.0 + _200;
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _208 = -_178;
    float _210 = fma(_190, _206, _208);
    float _212 = _210 * _156;
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = _204 * _214;
    float _218 = _216 * _198;
    bool _222 = _218 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _224 = isnan(_218);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _230 = _226 || _228;
    float _232 = in.m_43.x;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_43.y;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_43.z;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = in.m_41.x;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_41.z;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    if (!_230)
    {
        discard_fragment();
    }
    float _262 = _101 * _236;
    float _264 = _101 * _242;
    float _266 = _101 * _248;
    float _268 = _130 * _262;
    float _270 = _132 * _264;
    float _272 = _134 * _266;
    float _274 = _101 * _254;
    float _276 = _101 * _184;
    float _278 = _101 * _260;
    float _280 = _268 * _274;
    float _282 = _270 * _276;
    float _284 = _272 * _278;
    if (!_230)
    {
        out.m_48.x = _280;
        out.m_48.y = _282;
        out.m_48.z = _284;
        out.m_48.w = _200;
        return out;
    }
    float _286 = _282 * 0.715200006961822509765625;
    float _288 = in.m_50.w;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_50.x;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_50.y;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = fma(_280, 0.2125999927520751953125, _286);
    float _308 = in.m_50.z;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = fma(_284, 0.072200000286102294921875, _306);
    bool _316 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _318 = 1.0 / _314;
    float _320 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_316)
    {
        float _322 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _324 = _178 + _322;
        _320 = _324;
    }
    float _326 = _320;
    float _328 = _318 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _330 = precise::clamp(_328, 0.0, 1.0);
    float _332 = fma(_330, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _334 = _101 * _292;
    float _336 = _101 * _304;
    float _338 = _332 * _334;
    float _340 = 0.0 + _218;
    float _342 = precise::clamp(_340, 0.0, 1.0);
    float _344 = _334;
    float _346 = _342;
    if (_316)
    {
        float _348 = _326 * 8.0;
        float _350 = precise::clamp(_348, 0.0, 1.0);
        _344 = _350;
    }
    float _352 = _344;
    float _354 = _101 * _298;
    float _356 = _101 * _312;
    float _358 = fma(_282, _338, _336);
    if (_316)
    {
        float _360 = _342 * _352;
        _346 = _360;
    }
    float _362 = _346;
    float _364 = fma(_280, _338, _354);
    float _366 = fma(_284, _338, _356);
    float _368 = 0.0 + _362;
    float _370 = precise::clamp(_368, 0.0, 1.0);
    out.m_48.x = _364;
    out.m_48.y = _358;
    out.m_48.z = _366;
    out.m_48.w = _370;
    return out;
}

