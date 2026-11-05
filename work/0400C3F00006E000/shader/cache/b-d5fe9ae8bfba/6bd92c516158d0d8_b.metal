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
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_33.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float2 _350 = float2(_69, _71);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_350, float2(0.0), isnan(_350))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_350, float2(0.0), isnan(_350))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_35.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_37.w;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_39.w;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_41.x;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = _67 * _88;
    float _110 = _67 * _94;
    float _112 = in.m_39.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_39.x;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_35.z;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_39.z;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_37.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_37.y;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_37.z;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = _67 * _116;
    float _156 = _67 * _122;
    float _158 = _67 * _128;
    float _160 = -_108;
    float _162 = fma(_82, _110, _160);
    float _164 = _67 * _100;
    float _166 = _162 * 4.0;
    float _168 = precise::clamp(_166, 0.0, 1.0);
    float _170 = _164 * _168;
    float _172 = _67 * _106;
    float _174 = 0.0 + _170;
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = _176 * _172;
    bool _182 = _178 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _184 = isnan(_178);
    bool _186 = _182 || _184;
    bool _188 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _190 = _186 || _188;
    float _192 = in.m_35.x;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_35.y;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    if (!_190)
    {
        discard_fragment();
    }
    float _204 = _67 * _196;
    float _206 = _67 * _202;
    float _208 = _67 * _134;
    float _210 = -_156;
    float _212 = _204 + _210;
    float _214 = -_154;
    float _216 = _206 + _214;
    float _218 = -_208;
    float _220 = _158 + _218;
    float _222 = fma(_76, _212, _156);
    float _224 = fma(_78, _216, _154);
    float _226 = fma(_80, _220, _208);
    float _228 = _67 * _140;
    float _230 = _67 * _146;
    float _232 = _67 * _152;
    float _234 = _222 * _228;
    float _236 = _224 * _230;
    float _238 = _226 * _232;
    if (!_190)
    {
        out.m_44.x = _234;
        out.m_44.y = _236;
        out.m_44.z = _238;
        out.m_44.w = _170;
        return out;
    }
    float _240 = _236 * 0.715200006961822509765625;
    float _242 = 0.0 + _178;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = fma(_234, 0.2125999927520751953125, _240);
    bool _248 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _250 = fma(_238, 0.072200000286102294921875, _246);
    float _252 = 1.0 / _250;
    float _254 = _252 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = fma(_256, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _260 = _234 * _258;
    float _262 = _236 * _258;
    float _264 = _238 * _258;
    float _266 = _258;
    if (!_248)
    {
        _266 = _244;
    }
    float _268 = _266;
    bool _270 = !_248;
    float _272 = _268;
    if (!_270)
    {
        float _274 = in.m_46.w;
        float _276 = gl_FragCoord.w;
        float _278 = _274 * _276;
        float _280 = in.m_46.z;
        float _282 = gl_FragCoord.w;
        float _284 = _280 * _282;
        float _286 = _67 * _278;
        float _288 = _67 * _284;
        float _290 = 1.0 / _286;
        float _292 = _288 * _290;
        float _294 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _296 = fma(_292, (*spvDescriptorSet0.fp_c8)._m0[30].w, _294);
        float _298 = 1.0 / _296;
        float _300 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _302 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _304 = fma(_298, _300, _302);
        float _306 = _304 * 8.0;
        float _308 = precise::clamp(_306, 0.0, 1.0);
        float _310 = _244 * _308;
        _272 = _310;
    }
    float _312 = _272;
    float _314 = 0.0 + _312;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    out.m_44.x = _260;
    out.m_44.y = _262;
    out.m_44.z = _264;
    out.m_44.w = _316;
    return out;
}

