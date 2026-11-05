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
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
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
    float2 _403 = float2(_83, _85);
    float4 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_403, float2(0.0), isnan(_403))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_403, float2(0.0), isnan(_403))).xyzw;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float _100 = _92.w;
    float2 _422 = float2(_87, _89);
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_422, float2(0.0), isnan(_422))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_422, float2(0.0), isnan(_422))).xyzw;
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
    float _124 = in.m_41.x;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = _81 * _116;
    float _132 = _81 * _122;
    float _134 = _81 * _128;
    float _136 = in.m_39.y;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_37.x;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_37.z;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_39.z;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = _81 * _146;
    float _162 = -_130;
    float _164 = fma(_100, _110, _162);
    float _166 = _132 * _164;
    float _168 = 0.0 + _166;
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = _170 * _134;
    bool _176 = _172 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _178 = isnan(_172);
    bool _180 = _176 || _178;
    bool _182 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _184 = _180 || _182;
    float _186 = in.m_37.y;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_39.x;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    if (!_184)
    {
        discard_fragment();
    }
    float _198 = _94 * _94;
    float _200 = _96 * _96;
    float _202 = _81 * _140;
    float _204 = _198 * _104;
    float _206 = _98 * _98;
    float _208 = _200 * _106;
    float _210 = _81 * _152;
    float _212 = _81 * _158;
    float _214 = _206 * _108;
    float _216 = _81 * _190;
    float _218 = _81 * _196;
    float _220 = -_202;
    float _222 = _216 + _220;
    float _224 = -_218;
    float _226 = _160 + _224;
    float _228 = -_212;
    float _230 = _210 + _228;
    float _232 = fma(_208, _222, _202);
    float _234 = fma(_204, _226, _218);
    float _236 = fma(_214, _230, _212);
    if (!_184)
    {
        out.m_44.x = _234;
        out.m_44.y = _232;
        out.m_44.z = _236;
        out.m_44.w = _166;
        return out;
    }
    float _238 = _232 * 0.715200006961822509765625;
    float _240 = in.m_46.w;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = in.m_46.z;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = in.m_46.x;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = fma(_234, 0.2125999927520751953125, _238);
    float _260 = in.m_46.y;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = fma(_236, 0.072200000286102294921875, _258);
    bool _268 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _270 = 1.0 / _266;
    float _272 = _270 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = fma(_274, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _278 = _81 * _244;
    float _280 = 0.0 + _172;
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = _81 * _250;
    float _286 = _81 * _264;
    float _288 = _276 * _278;
    float _290 = _81 * _256;
    float _292 = fma(_236, _288, _284);
    float _294 = fma(_234, _288, _290);
    float _296 = fma(_232, _288, _286);
    float _298 = _284;
    if (!_268)
    {
        _298 = _282;
    }
    float _300 = _298;
    bool _302 = !_268;
    float _304 = _300;
    if (!_302)
    {
        float _306 = in.m_48.w;
        float _308 = gl_FragCoord.w;
        float _310 = _306 * _308;
        float _312 = in.m_48.z;
        float _314 = gl_FragCoord.w;
        float _316 = _312 * _314;
        float _318 = _81 * _310;
        float _320 = _81 * _316;
        float _322 = 1.0 / _318;
        float _324 = _320 * _322;
        float _326 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _328 = fma(_324, (*spvDescriptorSet0.fp_c8)._m0[30].w, _326);
        float _330 = 1.0 / _328;
        float _332 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _334 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _336 = fma(_330, _332, _334);
        float _338 = _336 * 8.0;
        float _340 = precise::clamp(_338, 0.0, 1.0);
        float _342 = _282 * _340;
        _304 = _342;
    }
    float _344 = _304;
    float _346 = 0.0 + _344;
    float _348 = precise::clamp(_346, 0.0, 1.0);
    out.m_44.x = _294;
    out.m_44.y = _296;
    out.m_44.z = _292;
    out.m_44.w = _348;
    return out;
}

