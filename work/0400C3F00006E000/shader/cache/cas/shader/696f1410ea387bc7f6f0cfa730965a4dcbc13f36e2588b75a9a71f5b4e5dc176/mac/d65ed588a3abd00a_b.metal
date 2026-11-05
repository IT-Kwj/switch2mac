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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
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
    float4 m_39 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_37 [[user(locn2), flat]];
    float4 m_48 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
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
    float _69 = in.m_35.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _55;
    float _83 = _81 * _61;
    float _85 = _81 * _67;
    float _87 = _81 * _73;
    float _89 = _81 * _79;
    float2 _421 = float2(_83, _85);
    float4 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_421, float2(0.0), isnan(_421))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_421, float2(0.0), isnan(_421))).xyzw;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float _100 = _92.w;
    float2 _440 = float2(_87, _89);
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_440, float2(0.0), isnan(_440))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_440, float2(0.0), isnan(_440))).xyzw;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = _102.w;
    float _112 = in.m_37.y;
    float _114 = in.m_37.x;
    float _116 = in.m_37.z;
    float _118 = in.m_39.w;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_41.x;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = -_112;
    float _132 = _130 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _134 = -_114;
    float _136 = _134 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _138 = -_116;
    float _140 = _138 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _142 = _132 * _132;
    float _144 = fma(_136, _136, _142);
    float _146 = 1.0 / (*spvDescriptorSet0.fp_c8)._m0[31].x;
    float _148 = fma(_140, _140, _144);
    float _150 = sqrt(_148);
    float _152 = _146 * (*spvDescriptorSet0.fp_c8)._m0[31].y;
    float _154 = _150 * _152;
    float _156 = fma(_154, 0.100000001490116119384765625, -2.0);
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = fma(_154, -0.0199999995529651641845703125, 17.0);
    float _162 = precise::clamp(_160, 0.0, 1.0);
    float _164 = fma(_158, -2.0, 3.0);
    float _166 = _158 * _158;
    float _168 = fma(_162, -2.0, 3.0);
    float _170 = _162 * _162;
    float _172 = _164 * _166;
    float _174 = _168 * _170;
    float _176 = _81 * _122;
    float _178 = _172 * _174;
    float _180 = in.m_43.y;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_43.z;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_39.y;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_39.z;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = _100 * _110;
    float _206 = _204 * _176;
    float _208 = _206 * _178;
    float _210 = _81 * _128;
    float _212 = 0.0 + _208;
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = _214 * _210;
    bool _220 = _216 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _222 = isnan(_216);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _228 = _224 || _226;
    float _230 = in.m_43.x;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_39.x;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    if (!_228)
    {
        discard_fragment();
    }
    float _242 = _104 * _104;
    float _244 = _106 * _106;
    float _246 = _108 * _108;
    float _248 = _81 * _190;
    float _250 = _94 * _242;
    float _252 = _96 * _244;
    float _254 = _98 * _246;
    float _256 = _81 * _184;
    float _258 = -_250;
    float _260 = _258 + 1.0;
    float _262 = -_254;
    float _264 = _262 + 1.0;
    float _266 = _248 * _264;
    float _268 = _81 * _234;
    float _270 = -_252;
    float _272 = _270 + 1.0;
    float _274 = _268 * _260;
    float _276 = _256 * _272;
    float _278 = _81 * _240;
    float _280 = _81 * _196;
    float _282 = _81 * _202;
    float _284 = fma(_250, _278, _274);
    float _286 = fma(_252, _280, _276);
    float _288 = fma(_254, _282, _266);
    if (!_228)
    {
        out.m_46.x = _284;
        out.m_46.y = _286;
        out.m_46.z = _288;
        out.m_46.w = _208;
        return out;
    }
    float _290 = _286 * 0.715200006961822509765625;
    float _292 = 0.0 + _216;
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = fma(_284, 0.2125999927520751953125, _290);
    bool _298 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _300 = fma(_288, 0.072200000286102294921875, _296);
    float _302 = 1.0 / _300;
    float _304 = _302 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = fma(_306, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _310 = _284 * _308;
    float _312 = _286 * _308;
    float _314 = _288 * _308;
    float _316 = _308;
    if (!_298)
    {
        _316 = _294;
    }
    float _318 = _316;
    bool _320 = !_298;
    float _322 = _318;
    if (!_320)
    {
        float _324 = in.m_48.w;
        float _326 = gl_FragCoord.w;
        float _328 = _324 * _326;
        float _330 = in.m_48.z;
        float _332 = gl_FragCoord.w;
        float _334 = _330 * _332;
        float _336 = _81 * _328;
        float _338 = _81 * _334;
        float _340 = 1.0 / _336;
        float _342 = _338 * _340;
        float _344 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _346 = fma(_342, (*spvDescriptorSet0.fp_c8)._m0[30].w, _344);
        float _348 = 1.0 / _346;
        float _350 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _352 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _354 = fma(_348, _350, _352);
        float _356 = _354 * 8.0;
        float _358 = precise::clamp(_356, 0.0, 1.0);
        float _360 = _294 * _358;
        _322 = _360;
    }
    float _362 = _322;
    float _364 = 0.0 + _362;
    float _366 = precise::clamp(_364, 0.0, 1.0);
    out.m_46.x = _310;
    out.m_46.y = _312;
    out.m_46.z = _314;
    out.m_46.w = _366;
    return out;
}

